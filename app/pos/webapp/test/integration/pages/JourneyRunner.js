sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/pos/pos/test/integration/pages/PurchaseSetList",
	"com/pos/pos/test/integration/pages/PurchaseSetObjectPage",
	"com/pos/pos/test/integration/pages/Po_itemsObjectPage"
], function (JourneyRunner, PurchaseSetList, PurchaseSetObjectPage, Po_itemsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/pos/pos') + '/test/flp.html#app-preview',
        pages: {
			onThePurchaseSetList: PurchaseSetList,
			onThePurchaseSetObjectPage: PurchaseSetObjectPage,
			onThePo_itemsObjectPage: Po_itemsObjectPage
        },
        async: true
    });

    return runner;
});

