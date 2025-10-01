namespace praveen.cds;

using { praveen.db.master, praveen.db.transaction } from './data-model';


context CDSViews {
    define view![POWorklist] as
        select from transaction.purchaseorder{
            key PO_ID as![PurchaseOrderNO],
            Key Items.PO_ITEM_POS as![Position],
            PARTNER_GUID.BP_ID as![VendorID],
            PARTNER_GUID.COMPANY_NAME as![CompanyName],
            Items.GROSS_AMOUNT as![GrossAmount],
            Items.NET_AMOUNT as![NetAmount],
            Items.TAX_AMOUNT as![TaxAmount],
            case OVERALL_STATUS
                when 'N' then 'New'
                when 'D' then 'Delivered'
                when 'P' then 'Progess'
                when 'A' then 'Approved'
                when 'X' then 'Rejected'
                end as![Status],
            Items.PRODUCT_GUID.DESCRIPTION as![Product],
            PARTNER_GUID.ADDRESS_GUID.COUNTRY as![Country]
        }


        define view![ProductVH] as
            select from master.product{

                @EndUserText.label:[
                    {
                        language : 'EN',
                        text : 'Product ID'
                    },
                    {
                        language : 'DE',
                        text : 'Prodekt ID'
                    }  
                ]
                PRODUCT_ID as![Product ID],
                @EndUserText.label:[
                    {
                        language : 'EN',
                        text : 'Product Name'
                    },
                    {
                        language : 'DE',
                        text : 'Prodekt Name'
                    }  
                ]
                DESCRIPTION as![Product Name]
            }
            
            define view![ItemView] as
                select from transaction.poitems{
                    PARENT_KEY.PARTNER_GUID.NODE_KEY as![VendorID],
                    PARENT_KEY.NODE_KEY as![ProductID],
                    CURRENCY as![Currency],
                    GROSS_AMOUNT as![GrossAmount],
                    NET_AMOUNT as![NetAmount],
                    TAX_AMOUNT as![TaxAmount],
                    PARENT_KEY.OVERALL_STATUS as![Status]
                }

            define view![ProductOrders] as
                select from master.product 
                //Mixin is a keyword provided by CAPM to perform lazy loading
                //it is same like association concept in ABAP CDS views - lazy loading of dependent data
                mixin{
                    PO_ORDERS : Association[*] to ItemView on PO_ORDERS.ProductID = $projection.ProductKey
                } into
                {
                    NODE_KEY as![ProductKey],
                    DESCRIPTION as![ProductName],
                    PRICE as ![Prices],
                    SUPPLIER_GUID.BP_ID as![SupplierId],
                    SUPPLIER_GUID.COMPANY_NAME as![SupplierName],
                    SUPPLIER_GUID.ADDRESS_GUID.COUNTRY as![Country],
                    //exposed association like ABAP which will lazy load orders of a given product
                    //at a runtime demand
                    PO_ORDERS 
                }

                // define view![CProductAnalytics] as
                // select from ProductOrders {
                //     ProductName,
                //     Country,
                //     round(sum(ProductOrders.GrossAmount), 2) as TotalPurchaseAmount : Decimal(15,2),
                //     ProductOrders.Currency
                // }
                // group by ProductName, Country, ProductOrders.Currency;



}


