sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'com.pos.pos',
            componentId: 'Po_itemsObjectPage',
            contextPath: '/PurchaseSet/Items'
        },
        CustomPageDefinitions
    );
});