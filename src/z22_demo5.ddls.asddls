@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo 5: Built-In Functions'
define view entity Z22_Demo5
  as select from /dmo/booking
{
  /* Numerische Funktionen */
  5.0 / 3.0                               as Fltp1,
  division(5, 3, 2)                       as Dec1,
  div(5, 3)                               as Div1,
  mod(5, 3)                               as Mod1,
  /* ZeIchenkettenfuktionen */
  concat_with_space('Hello', 'World', 1)  as String1,
  length('X  ')                           as LengthXSS,
  length('  X')                           as LengthSSX,
  /* Einheiten- und Währungsumrechnung */
  flight_price                            as OriginalFlightPrice,
  currency_code                           as OriginalCurrencyCode,
  @Semantics.amount.currencyCode: 'ConvertedCurrencyCode'
  currency_conversion(
    amount => flight_price,
    source_currency => currency_code,
    target_currency => cast('EUR' as abap.cuky),
    exchange_rate_date => booking_date,
  //    exchange_rate_type => cast('2004' as abap.char(4)),
    error_handling => 'KEEP_UNCONVERTED') as ConvertedFlightPrice,
  cast ('EUR' as abap.cuky)               as ConvertedCurrencyCode,
  /* Datums- und Zeitfunktionen */
  dats_add_days(booking_date, 14, 'FAIL') as Deadline
}
