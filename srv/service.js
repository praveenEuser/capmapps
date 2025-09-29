module.exports = cds.service.impl(async function() {
    this.on('boost',async(req)=> {
        console.log("Done bro");
        return {
            "NODE_KEY" : "Dummy"
        };
    });
});