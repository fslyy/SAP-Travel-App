@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo 13: Path Expressions'
define view entity Z22_Demo13 as select from Z22_DEMO12
{
  key CarrierId,
  key ConnectionId,
  key FlightDate,
  Price,
  CurrencyCode,
  PlaneTypeId,
  SeatsMax,
  SeatsOccupied,
  Name,
  _Connection.airport_from_id as AirportFromId,
  _Connection.airport_to_id as AirportToId,
  /* Associations */
  _Bookings,
  _Carrier,
  _Connection
}
