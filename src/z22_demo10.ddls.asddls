@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo10: Environment System Fields'
define view entity Z22_Demo10
  with parameters
    P_CarrierId    : /dmo/carrier_id,
    P_ConnectionId : /dmo/connection_id,
    @Environment.systemField: #SYSTEM_DATE
    P_Deadline     : abap.dats
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
      carrier_id    = $parameters.P_CarrierId
  and connection_id = $parameters.P_ConnectionId
  and flight_date   >= $parameters.P_Deadline
