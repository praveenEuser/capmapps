using { praveendb.master as master, praveendb.trans as transaction } from '../db/demo';
using { praveen.db.master as Omaster, praveen.db.transaction as Otransaction } from '../db/data-model';


service MyService @(path : 'CatalogService') {

    entity StudentSet as projection on master.student;
    entity StandardSet as projection on master.standards;
    entity BookSet as projection on master.book;
    entity BookrentalSet as projection on transaction.rentals;
    entity AddressSet as projection on Omaster.address;
    entity BusinessPartnerSet as projection on Omaster.businesspartner;
    entity EmployeesSet as projection on Omaster.employees;
    entity ProductSet as projection on Omaster.product;
    entity PurchaseSet as projection on Otransaction.purchaseorder
    actions {
        action boost() returns PurchaseSet;

        function largestOrder() returns PurchaseSet;
    };
    entity Po_items as projection on Otransaction.poitems;
}
