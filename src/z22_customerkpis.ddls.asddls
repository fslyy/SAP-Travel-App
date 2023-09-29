@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Customer KPIs'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
  serviceQuality: #X,
  sizeCategory: #S,
  dataClass: #MIXED
}
define view entity Z22_CustomerKPIs
  with parameters
    P_city : /dmo/city
  as select from Z22_BookingWithCustomer
{
  key CustomerId,
      Name,
      Street,
      PostalCode,
      City,
      CountryCode,
      @Semantics.amount.currencyCode: 'ConvertedCurrencyCode'
      sum(ConvertedFlightPrice)        as TotalRevenue,
      ConvertedCurrencyCode,
      count(distinct CarrierId)        as DifferentCarriers,
      avg(DaysAhead as abap.dec(16,2)) as AvgDaysAhead
}
where
      City        = $parameters.P_city
  and BookingDate < $session.system_date
group by
  CustomerId,
  Name,
  Street,
  PostalCode,
  City,
  CountryCode,
  PhoneNumber,
  ConvertedCurrencyCode
