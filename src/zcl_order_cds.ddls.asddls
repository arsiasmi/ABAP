@AbapCatalog.sqlViewName: 'ZCLORDERCDS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@Metadata.allowExtensions: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Order Details'
@Metadata.ignorePropagatedAnnotations: true
@UI.headerInfo:{ typeName: 'Sales Order' , typeNamePlural: 'Sales Orders'}
define root view zcl_order_cds
  as select from zcl_order_t
{
  key so_id,
      name,
      doc_cat,
      doc_type,
      amount,
      d_currency,
      created_by,
      created_on,
      last_changed_at,
      last_changed_by,
      locl_last_changed_at
}
