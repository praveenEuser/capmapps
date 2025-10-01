sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'com.fin.project1',
            componentId: 'PurchaseSetList',
            contextPath: '/PurchaseSet'
        },
        CustomPageDefinitions
    );
});