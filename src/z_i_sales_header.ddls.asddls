@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Header Root View'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true

define root view entity z_i_sales_header
  as select from zcl_order_cds
  composition [0..*] of ZCL_ORDER_ITEM_CDS_01 as _itm
{
  key so_id,
      name,
      doc_cat,
      doc_type,
      @Semantics.amount.currencyCode: 'd_currency'
      amount,
      d_currency,
      created_by,
      created_on,
      last_changed_at,
      last_changed_by,
      locl_last_changed_at,
      /* Associations */
      _itm
}
