using MyService as service from '../../srv/service';


annotate service.PurchaseSet with @(
    UI.SelectionFields:[
        PO_ID,
        PARTNER_GUID.COMPANY_NAME,
        PARTNER_GUID.ADDRESS_GUID.COUNTRY,
        GROSS_AMOUNT,
    ],
    UI.LineItem:[
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
            Action : 'CatalogService.boost',
            Label : 'Boost',
            Inline : True
        },
        {
            $Type : 'UI.DataField',
            Value : OverallStatus,
            Criticality : ColorCoding,
        },
    ],
    UI.HeaderInfo:{
        TypeName : 'Purchase Order',
        TypeNamePlural : 'Purchase Orders',
        Title:{
            $Type : 'UI.DataField',
            Value : PO_ID,
        },
        Description:{
            $Type : 'UI.DataField',
            Value : PARTNER_GUID.COMPANY_NAME,
        },
        ImageUrl : '/img/logo_org.png'
    },
    UI.Facets:[
        {
            $Type : 'UI.CollectionFacet',
            Label: 'More Info',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Additional Data',
                    Target : '@UI.Identification',
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Pricing Data',
                    Target : '@UI.FieldGroup#Productss',
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Statuses',
                    Target : '@UI.FieldGroup#Items',
                },
            ],
            
        },
        {
            $Type : 'UI.ReferenceFacet',
            Target: 'Items/@UI.LineItem',
        },
        
    ],
    UI.Identification:[
        {
            $Type : 'UI.DataField',
            Value : PO_ID,
        },
        {
            $Type : 'UI.DataField',
            Value : PARTNER_GUID_NODE_KEY,
        },
    ],
    UI.FieldGroup #Productss: {
        Label : 'Price Data',
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
    UI.FieldGroup #Items:{
        Label : 'Status',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : OVERALL_STATUS,
            },
            {
                $Type : 'UI.DataField',
                Value : LIFECYCLE_STATUS,
            },
        ],
    },
);


annotate service.Po_items with @(
    UI.LineItem:[
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
            Value : CURRENCY_code,
        },
    ],
    UI.HeaderInfo:{
        TypeName : 'PO Item',
        TypeNamePlural : 'PO Items',
        Title:{
            $Type : 'UI.DataField',
            Value : PO_ITEM_POS,
        },
        Description:{
            $Type : 'UI.DataField',
            Value : PRODUCT_GUID.DESCRIPTION
        },
    },
    UI.Facets:[
        {
            $Type : 'UI.CollectionFacet',
            Label : 'Item Info',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Details',
                    Target : 'UI.Identification',
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Price',
                    Target : '@UI.FieldGroup#Pricing',
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Product Details',
                    Target : '@UI.FieldGroup#Products',
                },

            ]
        },
    ],
    UI.Identification:[
        {
            $Type : 'UI.DataField',
            Value : PO_ITEM_POS,
        },
        {
            $Type : 'UI.DataField',
            Value : PARENT_KEY_NODE_KEY,
        },
        {
            $Type : 'UI.DataField',
            Value : CURRENCY_code,
        },
    ],
    UI.FieldGroup #Pricing:{
        Data:[
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
    UI.FieldGroup #Products:{
        Data:[
            {
                $Type : 'UI.DataField',
                Value : PRODUCT_GUID.DESCRIPTION,
            },
            {
                $Type : 'UI.DataField',
                Value : PRODUCT_GUID.CATEGORY,
            },
            {
                $Type : 'UI.DataField',
                Value : PRODUCT_GUID.PRICE,
            },  
        ],
    },


    
);


//Linking the Help PO
annotate service.PurchaseSet with {
    PARTNER_GUID@(
        Common.Text: PARTNER_GUID.COMPANY_NAME,
        Common.ValueList.entity: service.BusinessPartnerSet
    );
};

annotate service.Po_items with {
    PRODUCT_GUID@(
        Common.Text: PRODUCT_GUID.DESCRIPTION,
        Common.ValueList.entity: service.ProductSet
    );
};



//We create Value Help in SE11
@cds.odata.valuelist
annotate service.BusinessPartnerSet with @(
    UI.Identification:[
        {
            $Type : 'UI.DataField',
            Value : COMPANY_NAME
        },
    ]
);


//We create Value Help in SE11
@cds.odata.valuelist
annotate service.ProductSet with @(
    UI.Identification:[
        {
           $Type : 'UI.DataField',
           Value : DESCRIPTION
        },
    ],
);




