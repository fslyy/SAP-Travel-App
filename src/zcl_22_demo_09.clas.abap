CLASS zcl_22_demo_09 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_22_demo_09 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    SELECT FROM Z22_Demo9( p_carrierid = 'LH' )
      FIELDS *
*      WHERE CarrierId = 'LH'
      INTO TABLE @DATA(connections).

    out->write(  connections ).

  ENDMETHOD.

ENDCLASS.
