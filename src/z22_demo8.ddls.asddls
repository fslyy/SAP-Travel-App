@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo 8: UNION and UNION ALL'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
  serviceQuality: #X,
  sizeCategory: #S,
  dataClass: #MIXED
}
define view entity Z22_Demo8
  as select from /dmo/customer
{
  key customer_id as CustomerId,
      first_name  as FirstName,
      last_name   as LastName,
      city        as city
}
where
  city = 'Berlin'
union select from /dmo/customer as Customer /* union all - mit duplikaten */
  inner join      /dmo/travel   as Travel on Travel.customer_id = Customer.customer_id
  inner join      /dmo/agency   as Agency on Agency.agency_id = Travel.agency_id
{
  key Customer.customer_id as CustomerId,
      Customer.first_name  as FirstName,
      Customer.last_name   as LastName,
      Customer.city        as City

} 
// alle leute die in Berlin wohnen oder dort buchen
