@AbapCatalog.sqlViewName: 'ZORDITEM01'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Order Item'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view ZCL_ORDER_ITEM_CDS_01
  as select from zi_SALES_ITEM_01
  association to parent z_i_sales_header as _hdr on $projection.so_id = _hdr.so_id
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
