@AbapCatalog.sqlViewName: 'ZSALESITEM01'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Item'
@Metadata.ignorePropagatedAnnotations: true
define view zi_SALES_ITEM_01
  as select from ztbl_po_item
  association [1..1] to zcl_order_t as _hdr on $projection.so_id = _hdr.so_id
{

      @ObjectModel.foreignKey.association: '_hdr'
  key so_id,
      //      @UI.facet: [{ type: #IDENTIFICATION_REFERENCE , position: '20', label: 'Item'}]
  key so_item,
      matnr,
      @Semantics.quantity.unitOfMeasure: 'meins'
      quan,
      meins,
      @Semantics.amount.currencyCode: 'currency'
      price,
      currency,

      _hdr
}
