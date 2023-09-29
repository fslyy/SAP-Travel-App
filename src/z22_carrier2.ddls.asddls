@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'carrier 2'
define view entity Z22_Carrier2
  as select from Z22_Carrier
{
  key CarrierId,
      Name,
      /* Associations */
      _ZZConnections
}
