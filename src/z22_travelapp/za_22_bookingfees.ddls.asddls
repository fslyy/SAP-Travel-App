@EndUserText.label: 'Booking fees'
define abstract entity ZA_22_BookingFees
{
    @Semantics.amount.currencyCode: 'CurrencyCode'
    BookingFee : /dmo/booking_fee;
    CurrencyCode :/dmo/currency_code;
    
}
