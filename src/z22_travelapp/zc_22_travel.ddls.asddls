@EndUserText.label: 'Travel'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@Search.searchable: true
define root view entity ZC_22_Travel
  provider contract transactional_query
  as projection on ZR_22_Travel
{
  key TravelUuid,
      TravelId,
      AgencyId,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZI_22_CustomerVH', element: 'CustomerId' } }]
      @ObjectModel.text.element: [ 'CustomerName' ]
      CustomerId,
      BeginDate,
      EndDate,
      BookingFee,
      TotalPrice,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_CurrencyStdVH', element: 'Currency' } }]
      CurrencyCode,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      Description,
      @Consumption.valueHelpDefinition: [{  entity: { name: 'ZI_22_StatusVH', element: 'Status' } }]
      Status,
      
      // Admin Data
      Createdby,
      Createdat,
      Lastchangedby,
      Lastchangedat,
      
      // Transient Data
      StatusCriticality,
      BeginDateCriticality,
      _CustomerText.CustomerName as CustomerName,
      
      // Associsations
      _Bookings : redirected to composition child ZC_22_Booking
}
