using { praveendb.master as master, praveendb.trans as transaction } from '../db/demo';
using { praveen.db.master as Omaster, praveen.db.transaction as Otransaction , } from '../db/data-model';




service MyService @(path : 'CatalogService') {

    entity StudentSet as projection on master.student;
    entity StandardSet as projection on master.standards;
    entity BookSet as projection on master.book;
    entity BookrentalSet as projection on transaction.rentals;
    entity AddressSet as projection on Omaster.address;
    entity BusinessPartnerSet as projection on Omaster.businesspartner;
    entity EmployeesSet as projection on Omaster.employees;
    entity ProductSet as projection on Omaster.product;

    function getOrderStatus() returns PurchaseSet;
    entity PurchaseSet @(
        odata.draft.enabled : true,
        Common.DefaultValuesFunction: 'getOrderStatus'
    ) as projection on Otransaction.purchaseorder{
        *,
        case OVERALL_STATUS
            when 'N' then 'New'
            when 'X' then 'Rejected'
            when 'P' then 'Pending'
            when 'A' then 'Approved'
            when 'D' then 'Delivered' end as OverallStatus: String(20),
        case OVERALL_STATUS
            when 'N' then 2
            when 'P' then 2
            when 'X' then 1
            when 'A' then 3
            when 'D' then 3 end as ColorCoding: Integer,
        Items,
    }


    
    actions {
        @cds.odata.bindingparameter.name :'_praveen'
        @Common.SideEffects : {
            TargetProperties : ['_praveen/GROSS_AMOUNT']
        }
        action boost() returns PurchaseSet;
        function largestOrder() returns PurchaseSet;
    };    
    entity Po_items as projection on Otransaction.poitems;
    
}
