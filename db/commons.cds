namespace praveen.commons;
using { Currency } from '@sap/cds/common';



type Gender : String(1) enum{
    male = 'M';
    female = 'F';
    undisclosed = 'U';
}

type AmountT : Decimal(10,2)@(
    semantic.amount.currencyCode : 'CURRENCY_code',
    sap.unit : 'CURRENCY_code'
);

aspect Amount {
    CURRENCY : Currency;
    GROSS_AMOUNT : AmountT @title : '{i18n>GROSS_AMOUNT}';
    NET_AMOUNT : AmountT @(title : 'Net Amount');
    TAX_AMOUNT : AmountT @(title : 'Tax Amount');
}

type PhoneNumber : guid @assert.format : '^\+?[0-9]{1,3}?[-. ]?\(?[0-9]{2,5}\)?[-. ]?[0-9]{3,5}[-. ]?[0-9]{3,5}$';
type Email :  guid @assert.format : '^(?!.*\.\.)[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$';





type guid : String(60);

    //aspects, its like structure

aspect address {
    DOOR_NO : Int16;
    AREA : guid;
    DISTRICT: guid;
}



