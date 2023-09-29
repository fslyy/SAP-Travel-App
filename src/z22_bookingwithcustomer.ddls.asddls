@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'booking + customer'
define view entity Z22_BookingWithCustomer
  as select from Z22_Booking
    inner join   Z22_Customer on Z22_Booking.CustomerId = Z22_Customer.CustomerId
{
  key Z22_Booking.TravelId,
  key Z22_Booking.BookingId,
  key Z22_Customer.CustomerId,
      /* Booking */
      Z22_Booking.BookingDate,
      // Z22_Booking.CustomerId,
      Z22_Booking.CarrierId,
      Z22_Booking.ConnectionId,
      Z22_Booking.FlightDate,
      @Semantics.amount.currencyCode: 'ConvertedCurrencyCode'
      @EndUserText: { label: 'Flight Price in Euro', quickInfo: 'Flight Price' }
      round(currency_conversion(
        amount => Z22_Booking.FlightPrice,
        source_currency => Z22_Booking.CurrencyCode,
        target_currency => cast('EUR' as abap.cuky),
        exchange_rate_date => Z22_Booking.BookingDate,
        error_handling => 'KEEP_UNCONVERTED'), -1)                       as ConvertedFlightPrice,
      cast ('EUR' as abap.cuky)                                          as ConvertedCurrencyCode,
      case Z22_Booking.CurrencyCode when 'EUR' then 'Euro'
                         when 'USD' then 'US Dollar'
                         when 'SGD' then 'Singapur Dollar'
                         when 'JPY' then 'Yen'
                         else Z22_Booking.CurrencyCode
       end                                                               as CurrencyCodeText,
      @EndUserText: { label: 'Days Ahead', quickInfo: 'Days Ahead'}
      dats_days_between(Z22_Booking.BookingDate, Z22_Booking.FlightDate) as DaysAhead,
      /* Customer */
      Z22_Customer.FirstName,
      Z22_Customer.LastName,
      Z22_Customer.Title,
      @EndUserText: { label: 'Name', quickInfo: 'Name'}
      concat_with_space(
      case when Z22_Customer.Title is initial then Z22_Customer.FirstName
      else concat_with_space(Z22_Customer.Title, Z22_Customer.FirstName, 1)
      end, Z22_Customer.LastName, 1)                                     as Name,
      Z22_Customer.Street,
      Z22_Customer.PostalCode,
      Z22_Customer.City,
      Z22_Customer.CountryCode,
      Z22_Customer.PhoneNumber,
      Z22_Customer.EmailAddress
}
where
  Z22_Customer.CountryCode = 'DE'
