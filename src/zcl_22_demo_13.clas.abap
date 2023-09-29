CLASS zcl_22_demo_13 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_22_demo_13 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    SELECT FROM Z22_Demo13
      FIELDS CarrierId, FlightDate, Name, AirportFromId, AirportToId, \_Bookings-booking_id, \_Bookings-booking_date
*      WHERE CarrierId = 'LH'
      INTO TABLE @DATA(flights).

    out->write( flights ).

  ENDMETHOD.

ENDCLASS.
