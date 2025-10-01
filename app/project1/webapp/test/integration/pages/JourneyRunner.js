sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/fin/project1/test/integration/pages/PurchaseSetList",
	"com/fin/project1/test/integration/pages/PurchaseSetObjectPage",
	"com/fin/project1/test/integration/pages/Po_itemsObjectPage"
], function (JourneyRunner, PurchaseSetList, PurchaseSetObjectPage, Po_itemsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/fin/project1') + '/test/flp.html#app-preview',
        pages: {
			onThePurchaseSetList: PurchaseSetList,
			onThePurchaseSetObjectPage: PurchaseSetObjectPage,
			onThePo_itemsObjectPage: Po_itemsObjectPage
        },
        async: true
    });

    return runner;
});

