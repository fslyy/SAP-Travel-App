CLASS zcl_22_demo_10 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_22_demo_10 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    SELECT FROM Z22_Demo10( p_carrierid = 'LH', p_connectionid = '0400' )
      FIELDS *
*      WHERE CarrierId = 'LH'
      INTO TABLE @DATA(flights).

    out->write( flights ).

  ENDMETHOD.

ENDCLASS.
