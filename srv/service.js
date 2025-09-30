const { default: cds } = require("@sap/cds");

module.exports = cds.service.impl(async function() {

    const {PurchaseSet} = this.entities;

    this.on('boost',async(req)=> {
        console.log("Added");
        
        try {

            const ID = req.params[0];
            // Start a DB Transaction
            const tx = cds.tx(req);

            //CDS Query Language : Communicate to DB in agnostic manner
            await tx.update(PurchaseSet).with({
                GROSS_AMOUNT : {"+=" : 2000}
            }).where(ID);
        } catch (error) {
            return "Error" + error.toString();
        }
    });

    this.on('largestOrder',async(req)=> {
        console.log("Done bro");
        
        try{
           //Start a DB Transaction
           const tx = cds.tx(req);
           //Read PO with highest gross amount
           //Read Gross_Amount in Desc + Get the first record

           const recordData = tx.read(PurchaseSet).orderBy({
                GROSS_AMOUNT : 'desc'
           }).limit(1);

           return recordData;
        
        } catch (error) {
            return "Error" + error.toString();
        }
    });
});