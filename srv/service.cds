using { loyalty as db } from '../db/schema';

@path: '/loyalty'
@requires: 'authenticated-user'
service LoyaltyService {

    @restrict: [
        { grant: 'READ', to: 'Customer', where: 'email = $user' },
        { grant: 'READ', to: 'RetailStaff' },
        { grant: '*', to: 'Admin' }
    ]
    entity Customers as projection on db.Customers;

    @restrict: [
        { grant: ['READ', 'CREATE'], to: 'RetailStaff' },
        { grant: 'READ', to: 'Customer' },
        { grant: '*', to: 'Admin' }
    ]
    entity Transactions as projection on db.Transactions;

    @restrict: [
        { grant: ['READ', 'CREATE'], to: 'Customer' },
        { grant: 'READ', to: 'RetailStaff' },
        { grant: '*', to: 'Admin' }
    ]
    entity Redemptions as projection on db.Redemptions;

    @restrict: [
        { grant: '*', to: 'Admin' }
    ]
    entity RewardPolicies as projection on db.RewardPolicies;
}