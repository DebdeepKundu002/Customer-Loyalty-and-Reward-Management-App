using LoyaltyService as service from '../../srv/service';
annotate service.RewardPolicies with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : policyID,
                Label : 'Policy ID',
            },
            {
                $Type : 'UI.DataField',
                Label : 'Channel',
                Value : channel,
            },
            {
                $Type : 'UI.DataField',
                Value : description,
                Label : 'Description',
            },
            {
                $Type : 'UI.DataField',
                Label : 'Points Rate',
                Value : pointsRate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Active',
                Value : active,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'Policy Details',
            Target : '@UI.FieldGroup#GeneratedGroup',
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
            Value : description,
            Label : 'Description',
        },
        {
            $Type : 'UI.DataField',
            Label : 'Points Rate',
            Value : pointsRate,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Active',
            Value : active,
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
            Value : description,
        },
    },
);

