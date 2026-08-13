namespace loyalty;

entity Customers {
    key customerID   : UUID;
        name         : String(100);
        email        : String(100);
        totalPoints  : Integer default 0;
        tier         : String(20) default 'Bronze';

        transactions : Composition of many Transactions
                           on transactions.customer = $self;

        redemptions  : Composition of many Redemptions
                           on redemptions.customer = $self;
}

entity Transactions {
    key txnID        : UUID;

        customer     : Association to one Customers;

        channel      : String(20);
        amount       : Decimal(10, 2);
        txnDate      : DateTime;
        pointsEarned : Integer;
}

entity Redemptions {
    key redeemID   : UUID;

        customer   : Association to one Customers;

        pointsUsed : Integer;
        redeemDate : DateTime;
        remarks    : String(255);
}

entity RewardPolicies {
    key policyID    : UUID;
        channel     : String(20);
        pointsRate  : Decimal(5, 2);
        description : String(255);
        active      : Boolean default true;
}
