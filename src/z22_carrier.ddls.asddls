@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Carrier'
define view entity Z22_Carrier
  as select from /dmo/carrier
{
  key carrier_id as CarrierId,
      name       as Name
}
