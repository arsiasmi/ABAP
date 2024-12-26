//@AbapCatalog.sqlViewName: 'ZCLORDERCDS'
//@AbapCatalog.compiler.compareFilter: true
//@AbapCatalog.preserveKey: true
@Metadata.allowExtensions: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Order Details'
@Metadata.ignorePropagatedAnnotations: true
@UI.headerInfo:{ typeName: 'Sales Order' , typeNamePlural: 'Sales Orders'}
define root view entity zcl_order_cds
  as select from zcl_order_t
  association [0..*] to ztbl_po_item as _itm on $projection.so_id = _itm.so_id
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

      //      _itm.matnr,
      //      _itm.quan,
      //      _itm.meins,
      //      _itm.price,
      //      _itm.currency,
      //
      _itm
}
