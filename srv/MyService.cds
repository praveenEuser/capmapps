using { praveen.cds } from '../db/CDSViews';
using { praveen.db.master } from '../db/data-model';


service MyServices @(path:'MyServices'){
    entity ProductOrderSet as projection on cds.CDSViews.ProductOrders{
        *, 
        PO_ORDERS
    };
    entity EmployeeSet as projection on master.employees;
    entity ReadEmployeeSet as projection on master.employees;
    entity ProductSet as projection on master.product;
}   
