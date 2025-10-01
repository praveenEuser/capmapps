sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'com.fin.project1',
            componentId: 'Po_itemsObjectPage',
            contextPath: '/PurchaseSet/Items'
        },
        CustomPageDefinitions
    );
});