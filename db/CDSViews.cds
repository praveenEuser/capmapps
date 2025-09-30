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
                end as![Status] 
        }


}


