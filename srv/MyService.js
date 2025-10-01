const cds = require('@sap/cds');
const {employees} = cds.entities("praveen.db.master");

module.exports = cds.service.impl(async function () {
    
     const {EmployeeSet} = this.entities;

    //Generic handler - developer get flexibility to attach their
    //Own code on top of what CAPM already offers
    this.before(['CREATE','PATCH'], EmployeeSet, (req)=> {
        if(parseFloat(req.data.salaryAmount) >= 1000000){
            req.error(500, 'Hey, we cannot support salary over a million' );
        }
    })

    this.on('READ','ReadEmployeeSet',async(req)=>{
        //Example
        // return{
        //     "ID" : "2222-222",
        //     "nameFirst" : "Praveen"
        // }


        //Calling DB and adding Extra logic
        const tx = cds.tx(req);
        const resultData= [];
        var result = tx.run(SELECT.from(employees).limit(5));

        for (let i = 0; i < result.length; i++) {
            const element = result[i];

            element.nameMiddle = "Ramar";
            resultData.push(element);
        }

        return resultData;
        // const whereCondition = req.data;
        // if (whereCondition.hasOwnProperty("ID")) {
        //     return await tx.run(SELECT.from(employees).where(whereCondition));
        // } else {
        //    return await tx.run(SELECT.from(employees).where(
        //     {
        //         "sex" : "F"
        //     }
        //    )); 
        // }

    })


})