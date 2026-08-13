using LoyaltyService as service from '../../srv/service';
annotate service.Transactions with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : txnID,
                Label : 'Transaction ID',
            },
            {
                $Type : 'UI.DataField',
                Label : 'Channel',
                Value : channel,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Amount',
                Value : amount,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Transaction Date',
                Value : txnDate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Points Earned',
                Value : pointsEarned,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'Transaction Detail',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Customer Details',
            ID : 'CustomerDetails',
            Target : '@UI.FieldGroup#CustomerDetails',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Channel',
            Value : channel,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Amount',
            Value : amount,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Transaction Date',
            Value : txnDate,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Points Earned',
            Value : pointsEarned,
        },
    ],
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : channel,
        },
        TypeName : '',
        TypeNamePlural : '',
        Description : {
            $Type : 'UI.DataField',
            Value : txnDate,
        },
    },
    UI.FieldGroup #CustomerDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : customer.customerID,
                Label : 'Customer ID',
            },
            {
                $Type : 'UI.DataField',
                Value : customer.name,
            },
            {
                $Type : 'UI.DataField',
                Value : customer.email,
                Label : 'Email',
            },
            {
                $Type : 'UI.DataField',
                Value : customer.tier,
            },
            {
                $Type : 'UI.DataField',
                Value : customer.totalPoints,
                Label : 'Total Points',
            },
        ],
    },
);

annotate service.Transactions with {
    customer @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Customers',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : customer_customerID,
                ValueListProperty : 'customerID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'email',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'totalPoints',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'tier',
            },
        ],
    }
};