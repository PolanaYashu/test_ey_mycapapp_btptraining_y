
using CatalogService as service from '../../srv/CatalogService';
 
 
annotate service.POs with @(
    UI: {
        SelectionFields  : [
            PO_ID,
            PARTNER_GUID.COMPANY_NAME,
            PARTNER_GUID.ADDRESS_GUID.COUNTRY,
            GROSS_AMOUNT,
            OVERALL_STATUS
        ],
        LineItem  : [
            {
                $Type : 'UI.DataField',
                Value : PO_ID,
            },
            {
                $Type : 'UI.DataField',
                Value : PARTNER_GUID.COMPANY_NAME,
            },
            {
                $Type : 'UI.DataField',
                Value : PARTNER_GUID.ADDRESS_GUID.COUNTRY,
            },
            {
                $Type : 'UI.DataField',
                Value : GROSS_AMOUNT,
            },

              {
                $Type : 'UI.DataFieldForAction',
                Label : 'boost',
                Inline : true,
                Action : 'CatalogService.boost',
            },
            {
                $Type : 'UI.DataField',
                Value : OverallStatus,
                Criticality: Spiderman
            },
        ],
        HeaderInfo: {
            TypeName: 'Purchase Order',
            TypeNamePlural: 'Purchase Orders',
            Title: { Label : 'PO Id', Value: PO_ID },
            Description: { Label: 'Company', Value : PARTNER_GUID.COMPANY_NAME },
            ImageUrl: 'data:image/jpeg;base64,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'
        },
        Facets  : [
            {
                $Type : 'UI.CollectionFacet',
                Label : 'More Details',
                Facets : [
 
                    {
                        $Type : 'UI.ReferenceFacet',
                        Label: 'More Info',
                        Target : '@UI.Identification',
                    },
                    {
                        $Type : 'UI.ReferenceFacet',
                        Label : 'Prices',
                        Target : '@UI.FieldGroup#AmazingSpiderman',
                    },
                    {
                        $Type : 'UI.ReferenceFacet',
                        Label : 'Status',
                        Target : '@UI.FieldGroup#CaptainMarvel',
                    },
                   
                ],
            },
 
            {
                $Type : 'UI.ReferenceFacet',
                Label: 'PO Items',
                Target : 'Items/@UI.LineItem',
            },
 
        ],
 
        Identification  : [
            {
                $Type : 'UI.DataField',
                Value : PO_ID,
            },
            {
                $Type : 'UI.DataField',
                Value : PARTNER_GUID_NODE_KEY,
            },
        ],
        FieldGroup #CaptainMarvel : {
            $Type : 'UI.FieldGroupType',
            Data : [
                {
                    $Type : 'UI.DataField',
                    Value : GROSS_AMOUNT,
                },
                {
                    $Type : 'UI.DataField',
                    Value : NET_AMOUNT,
                },
                {
                    $Type : 'UI.DataField',
                    Value : TAX_AMOUNT,
                },
            ],
        },
        FieldGroup #AmazingSpiderman : {
            $Type : 'UI.FieldGroupType',
            Data : [
                {
                    $Type : 'UI.DataField',
                    Value : CURRENCY_code,
                },
                {
                    $Type : 'UI.DataField',
                    Value : OVERALL_STATUS,
                },
            ],
        },
    }
);

annotate service.PurchaseOrderItems with @(
    UI: {
        LineItem  : [
            {
                $Type : 'UI.DataField',
                Value : PO_ITEM_POS,
            },
            {
                $Type : 'UI.DataField',
                Value : PRODUCT_GUID_NODE_KEY,
            },
            {
                $Type : 'UI.DataField',
                Value : GROSS_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : NET_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : TAX_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : CURRENCY_code,
            },
        ],
        HeaderInfo: {
            TypeName: 'Item',
            TypeNamePlural: 'Items',
            Title : {Value : PO_ITEM_POS},
            Description: {Value : PRODUCT_GUID.DESCRIPTION}
        },
        Facets  : [
            {
                $Type : 'UI.ReferenceFacet',
                Label: 'item info',
                Target : '@UI.Identification',
            },
        ],
        Identification  : [
            {
                $Type : 'UI.DataField',
                Value : PO_ITEM_POS,
            },
            {
                $Type : 'UI.DataField',
                Value : PRODUCT_GUID_NODE_KEY,
            },
            {
                $Type : 'UI.DataField',
                Value : GROSS_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : NET_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : TAX_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : CURRENCY_code,
            },
        ],
    }
);
annotate CatalogService.POs with {
    PARTNER_GUID@(
        Common : {
            Text : PARTNER_GUID.COMPANY_NAME,
         },
         ValueList.entity: CatalogService.BusinessPartnerSet
    )
};
 
annotate CatalogService.PurchaseOrderItems with {
    PRODUCT_GUID@(
        Common : {
            Text : PRODUCT_GUID.DESCRIPTION,
         },
         ValueList.entity: CatalogService.ProductSet
    )
};
 
@cds.odata.valuelist
annotate CatalogService.BusinessPartnerSet with @(
    UI.Identification:[{
        $Type : 'UI.DataField',
        Value : COMPANY_NAME,
    }]
);
 
@cds.odata.valuelist
annotate CatalogService.ProductSet with @(
    UI.Identification:[{
        $Type : 'UI.DataField',
        Value : DESCRIPTION,
    }]
);