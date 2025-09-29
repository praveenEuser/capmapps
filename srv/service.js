module.exports = cds.service.impl(async function() {

    const {PurchaseSet} = this.entities;

    this.on('boost',async(req)=> {
        console.log("Done bro");
        
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
});