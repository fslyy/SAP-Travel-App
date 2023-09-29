@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Customer with Bookings'
define view entity Z22_CustomerWithBookings
  as select from Z22_Customer
  association [0..*] to Z22_Booking as _Bookings on Z22_Customer.CustomerId = _Bookings.CustomerId
{
  key CustomerId,
      FirstName,
      LastName,
      Title,
      Street,
      PostalCode,
      City,
      
      // Associations
      _Bookings
}
