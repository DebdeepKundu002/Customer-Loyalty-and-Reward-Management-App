const cds = require('@sap/cds');
const { SELECT } = require('@sap/cds/lib/ql/cds-ql');

module.exports = cds.service.impl(async function () {

    const { Customers, Transactions, Redemptions, RewardPolicies } = this.entities;

    /*
     * Calculate points when a transaction is created
     */
    this.before('CREATE', Transactions, async req => {

        const { customer_customerID, channel, amount } = req.data;

        if (!customer_customerID) {
            return req.error(400, 'Customer is required.');
        }

        const customer = await SELECT.one.from(Customers).where({ customerID: customer_customerID });

        if (!customer) {
            return req.error(404, 'Customer not found.');
        }

        if (!channel || amount == null) {
            return req.error(400, 'Channel and amount are required.');
        }

        const purchaseAmount = Number(amount);

        if (purchaseAmount <= 0) {
            return req.error(400, 'Amount must be greater than zero.');
        }

        const policy = await SELECT.one.from(RewardPolicies).where({ channel });

        if (!policy) {
            return req.error(400, 'Channel must be Online or Store');
        }
        req.data.pointsEarned = Math.floor(purchaseAmount * policy.pointsRate);

        if (!req.data.txnDate) {
            req.data.txnDate = new Date().toISOString();
        }
    });


    /*
     * Add earned points to customer balance
     */
    this.after('CREATE', Transactions, async data => {

        const customerID = data.customer_customerID;

        if (!customerID) {
            return;
        }

        const customer = await SELECT.one
            .from(Customers)
            .where({ customerID });

        if (!customer) {
            return;
        }

        const newPoints =
            Number(customer.totalPoints || 0) +
            Number(data.pointsEarned || 0);

        await UPDATE(Customers)
            .set({
                totalPoints: newPoints,
                tier: getTier(newPoints)
            })
            .where({ customerID });
    });


    /*
     * Validate redemption
     */
    this.before('CREATE', Redemptions, async req => {

        const {
            customer_customerID,
            pointsUsed
        } = req.data;

        if (!customer_customerID) {
            return req.error(400, 'Customer is required.');
        }

        if (!pointsUsed || pointsUsed <= 0) {
            return req.error(400, 'Points used must be greater than zero.');
        }

        const customer = await SELECT.one
            .from(Customers)
            .where({ customerID: customer_customerID });

        if (!customer) {
            return req.error(404, 'Customer not found.');
        }

        if (Number(customer.totalPoints) < Number(pointsUsed)) {
            return req.error(
                400,
                'Insufficient loyalty points for redemption.'
            );
        }

        if (!req.data.redeemDate) {
            req.data.redeemDate = new Date().toISOString();
        }
    });


    /*
     * Deduct points after successful redemption
     */
    this.after('CREATE', Redemptions, async data => {

        const customerID = data.customer_customerID;

        const customer = await SELECT.one
            .from(Customers)
            .where({ customerID });

        if (!customer) {
            return;
        }

        const newPoints =
            Number(customer.totalPoints) -
            Number(data.pointsUsed);

        await UPDATE(Customers)
            .set({
                totalPoints: newPoints,
                tier: getTier(newPoints)
            })
            .where({ customerID });
    });


    function getTier(points) {

        if (points >= 1000) {
            return 'Gold';
        }

        if (points >= 500) {
            return 'Silver';
        }

        return 'Bronze';
    }

});