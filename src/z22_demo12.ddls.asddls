@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo 12: Assosciations'
define view entity Z22_DEMO12
  as select from /dmo/flight
  association [1..1] to /dmo/connection as _Connection on  /dmo/flight.carrier_id    = _Connection.carrier_id
                                                       and /dmo/flight.connection_id = _Connection.connection_id
  association [1..1] to /dmo/carrier    as _Carrier    on  /dmo/flight.carrier_id = _Carrier.carrier_id
  association [0..*] to /dmo/booking    as _Bookings   on  /dmo/flight.carrier_id    = _Bookings.carrier_id
                                                       and /dmo/flight.connection_id = _Bookings.connection_id
                                                       and /dmo/flight.flight_date   = _Bookings.flight_date
{
  key /dmo/flight.carrier_id     as CarrierId,
  key /dmo/flight.connection_id  as ConnectionId,
  key /dmo/flight.flight_date    as FlightDate,
      /dmo/flight.price          as Price,
      /dmo/flight.currency_code  as CurrencyCode,
      /dmo/flight.plane_type_id  as PlaneTypeId,
      /dmo/flight.seats_max      as SeatsMax,
      /dmo/flight.seats_occupied as SeatsOccupied,
      _Carrier.name              as Name,

      //Assosciations
      _Connection,
      _Carrier,
      _Bookings
}
