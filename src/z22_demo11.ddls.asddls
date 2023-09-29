@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo 11: Session Variables'
define view entity Z22_Demo11
  as select from /dmo/flight
{
  key carrier_id     as CarrierId,
  key connection_id  as ConnectionId,
  key flight_date    as FlightDate,
      price          as Price,
      currency_code  as CurrencyCode,
      plane_type_id  as PlaneTypeId,
      seats_max      as SeatsMax,
      seats_occupied as SeatsOccupied
}
where
  flight_date >= $session.system_date
