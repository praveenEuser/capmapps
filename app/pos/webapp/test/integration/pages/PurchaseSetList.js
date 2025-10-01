sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'com.pos.pos',
            componentId: 'PurchaseSetList',
            contextPath: '/PurchaseSet'
        },
        CustomPageDefinitions
    );
});