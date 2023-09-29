@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Customer Value Help'
define view entity ZI_22_CustomerVH
  as select from ZI_22_Customer
{
  key CustomerId,
      FirstName,
      LastName,
      Title,
      Street,
      PostalCode,
      City,
      CountryCode
}
