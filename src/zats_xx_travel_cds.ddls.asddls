//@AbapCatalog.sqlViewName: 'ZATSTRVL'
//@AbapCatalog.compiler.compareFilter: true
//@AbapCatalog.preserveKey: true
@AbapCatalog.viewEnhancementCategory: [ #NONE ]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Entity'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType: {
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
define root view entity ZATS_XX_TRAVEL_CDS
  as select from /dmo/travel
  association [1]    to /DMO/I_Agency           as _Agency   on $projection.AgencyId = _Agency.AgencyID
  association [1]    to I_Currency              as _Currency on $projection.CurrencyCode = _Currency.Currency
  association [1]    to /DMO/I_Customer         as _Customer on $projection.CustomerId = _Customer.CustomerID
  association [1..1] to /DMO/I_Travel_Status_VH as _Status   on $projection.Status = _Status.TravelStatus
{
       @ObjectModel.text:{element: [ 'Description' ]}
  key  travel_id                                                       as TravelId,
       @ObjectModel.text:{element: [ 'Agency' ]}
       agency_id                                                       as AgencyId,
       _Agency.Name                                                    as Agency,
       @ObjectModel.text:{element: [ 'Customer' ]}
       customer_id                                                     as CustomerId,
       concat (_Customer.FirstName, concat(' ', _Customer.LastName ))  as Customer,
       begin_date                                                      as BeginDate,
       end_date                                                        as EndDate,
       @Semantics.amount.currencyCode: 'CurrencyCode'
       booking_fee                                                     as BookingFee,
       @Semantics.amount.currencyCode: 'CurrencyCode'
       total_price                                                     as TotalPrice,
       currency_code                                                   as CurrencyCode,
       description                                                     as Description,
       @ObjectModel.text:{element: [ 'TravelStatus' ]}
       status                                                          as Status,
       _Status._Text[Language = $session.system_language].TravelStatus as TravelStatus,
       createdby                                                       as LocalCreatedBy,
       createdat                                                       as LocalCreatedAt,
       lastchangedby                                                   as LocalLastChangedBy,
       lastchangedat                                                   as LocalLastChangedAt,
       _Agency,
       _Currency,
       _Customer,
       _Status
}
