@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo 6: Aggregat Functions'
define view entity Z22_Demo6
  as select from /dmo/flight
{
  carrier_id                                                        as CarrierId,
  connection_id                                                     as ConnectionId,
  count(*)                                                          as NumberOfFLights,
  count(distinct plane_type_id)                                     as NumberOfDifferentPlaneTypeIDs,
  sum(seats_max)                                                    as TotalSeatsMax,
  sum(seats_occupied)                                               as TotalOccupied,
  min(seats_occupied)                                               as MinSeatsOccupied,
  max(seats_occupied)                                               as MaxSeatsOccupied,
  sum(case when seats_max = seats_occupied then 1 else 0 end)       as NumberOfBookedUpFlights,
  sum(case when seats_occupied / seats_max < 0.5 then 1 else 0 end) as NumberOfHalfEmptyFlights,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  avg(price as abap.curr(16,2))                                     as AvgPrice,
  currency_code                                                     as CurrencyCode
}
group by
  currency_code,
  carrier_id,
  connection_id
having
  avg(price as abap.curr(16,2)) > 5000
