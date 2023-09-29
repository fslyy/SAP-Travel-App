@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo 3: Literals and Cases'
define view entity Z22_Demo3
  as select from /dmo/booking
{
  key travel_id     as TravelId,
  key booking_id    as BookingId,
      'Text'        as TextLiteral,
      42            as IntegerLiteral,
      0.1           as FloatingPointNumberLiteral,
      currency_code as CurrencyCode,
      @EndUserText: { label: 'Currency Code Text', quickInfo: 'Currency Code Text' }
      case currency_code when 'EUR' then 'Euro'
                         when 'USD' then 'US Dollar'
                         when 'SGD' then 'Singapur Dollar'
                         when 'JPY' then 'Yen'
                         else currency_code
      end           as CurrencyCodeText,
      flight_price  as FlighPrice,
      case when currency_code = 'EUR' and flight_price > 1999 then 'X'
           else ''
      end           as Teurio
}
