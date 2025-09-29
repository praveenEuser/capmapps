namespace praveendb;
using { praveen.commons as pointer } from './commons';
using { cuid,temporal,managed } from '@sap/cds/common';






context master {

    //attributes re-use
    
    


    //First table for storing student data

    entity student : pointer.address {
        key ID : pointer.guid;
        NAME : String(25);
        CLASS : Association to one standards;
        STANDARD : String(15);
        GENDER : String(1);
    }

    entity book {
        key ID : pointer.guid;
        NAME : String(25);
        AUTHOR : String(25);
    }

    entity standards {
        key ID : Int16;
        CLASSNAME : String(30);
        TEACHER : String(30);
    }
}

context trans {
    entity rentals : cuid,temporal,managed  {
        student : Association to master.student;
        book : Association to master.book;

    }
}

