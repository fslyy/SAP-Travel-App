@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking'
@Metadata.allowExtensions: true
define view entity ZC_22_Booking 
  as projection on ZR_22_Booking
{
  key BookingUuid,
  TravelUuid,
  BookingId,
  BookingDate,
  CustomerId,
  CarrierId,
  ConnectionId,
  FlightDate,
  FlightPrice,
  CurrencyCode,
  
  /* Associations */
  _Travel : redirected to parent ZC_22_Travel

}
