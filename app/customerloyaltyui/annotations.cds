using LoyaltyService as service from '../../srv/service';
annotate service.Customers with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'name',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Label : 'email',
                Value : email,
            },
            {
                $Type : 'UI.DataField',
                Label : 'totalPoints',
                Value : totalPoints,
            },
            {
                $Type : 'UI.DataField',
                Label : 'tier',
                Value : tier,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'name',
            Value : name,
        },
        {
            $Type : 'UI.DataField',
            Label : 'email',
            Value : email,
        },
        {
            $Type : 'UI.DataField',
            Label : 'totalPoints',
            Value : totalPoints,
        },
        {
            $Type : 'UI.DataField',
            Label : 'tier',
            Value : tier,
        },
    ],
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : customerID,
        },
        TypeName : '',
        TypeNamePlural : '',
    },
    UI.SelectionFields : [
        name,
        tier,
    ],
);

annotate service.Customers with {
    name @(
        Common.Label : '{i18n>Name}',
        )
};

annotate service.Customers with {
    tier @(
        Common.Label : '{i18n>Tier}',
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Customers',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : tier,
                    ValueListProperty : 'tier',
                },
            ],
            Label : '{i18n>Tier}',
        },
        Common.ValueListWithFixedValues : true,
        )
};