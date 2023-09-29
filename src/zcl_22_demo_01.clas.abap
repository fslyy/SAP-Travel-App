CLASS zcl_22_demo_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_22_demo_01 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    SELECT FROM Z22_Demo1
      FIELDS *
      WHERE CarrierId = 'LH'
      INTO TABLE @DATA(connections).

    out->write(  connections ).

  ENDMETHOD.

ENDCLASS.
