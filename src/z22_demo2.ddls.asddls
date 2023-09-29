@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo 2: Select and inner notations'

define view entity Z22_Demo2
  as select from /dmo/flight
    inner join   /dmo/connection             on  /dmo/flight.carrier_id    = /dmo/connection.carrier_id
                                             and /dmo/flight.connection_id = /dmo/connection.connection_id
    inner join   /dmo/airport as AirportFrom on /dmo/connection.airport_from_id = AirportFrom.airport_id
    inner join   /dmo/airport as AirportTo   on /dmo/connection.airport_from_id = AirportTo.airport_id
{
  key /dmo/connection.carrier_id      as CarrierId,
  key /dmo/connection.connection_id   as ConnectionId,
      //  key /dmo/flight.carrier_id          as CarrierId,
      //  key /dmo/flight.connection_id       as ConnectionId,
  key /dmo/flight.flight_date         as FlightDate,

      /* Connection */
      /dmo/connection.airport_from_id as AirportFromId,
      /dmo/connection.airport_to_id   as AirportToId,
      /dmo/connection.departure_time  as DepartureTime,
      /dmo/connection.arrival_time    as ArrivalTime,
      /dmo/connection.distance        as Distance,
      /dmo/connection.distance_unit   as DistanceUnit,

      /* FLight */
      /dmo/flight.price               as Price,
      /dmo/flight.currency_code       as CurrencyCode,
      /dmo/flight.plane_type_id       as PlaneTypeId,
      /dmo/flight.seats_max           as SeatsMax,
      /dmo/flight.seats_occupied      as SeatsOccupied,

      /* AirportFrom */
      AirportFrom.name                as FromName,
      AirportFrom.city                as FromCity,
      AirportFrom.country             as FromCountry,

      /* AirportTo */
      AirportTo.name                  as ToName,
      AirportTo.city                  as ToCity,
      AirportTo.country               as ToCountry

}
where
  /dmo/flight.carrier_id = 'UA'
