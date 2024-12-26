CLASS zcl_add_data_cl DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
*    METHODS: add_data.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_add_data_cl IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DATA: lt_order TYPE STANDARD TABLE OF zcl_order_t.
    DATA: lt_item TYPE STANDARD TABLE OF ztbl_po_item.

    lt_order = VALUE #( ( so_id = 1233 name = 'ABC Corp' doc_cat = 'OM' doc_type = 'TR' amount = 1233 d_currency = 'INR' created_by = 'ME' created_on = 20241203 )
    ( so_id = 1234 name = 'ABC Corp' doc_cat = 'OM' doc_type = 'TR' amount = 1233 d_currency = 'INR' created_by = 'ME' created_on = 20241203 )
    ( so_id = 1235 name = 'XYZ Corp' doc_cat = 'OM' doc_type = 'QS' amount = 8233 d_currency = 'INR' created_by = 'ME' created_on = 20241203 )
    ( so_id = 1236 name = 'MNO Corp' doc_cat = 'CR' doc_type = 'TR' amount = 1233 d_currency = 'INR' created_by = 'ME' created_on = 20241203 )
    ( so_id = 1237 name = 'NSH Corp' doc_cat = 'OM' doc_type = 'YU' amount = 1233 d_currency = 'EUR' created_by = 'ME' created_on = 20241203 )
    ( so_id = 1238 name = 'ICS Corp' doc_cat = 'GN' doc_type = 'TR' amount = 1923 d_currency = 'INR' created_by = 'ME' created_on = 20241203 )
    ( so_id = 1239 name = 'WIP Corp' doc_cat = 'OM' doc_type = 'D7' amount = 1233 d_currency = 'INR' created_by = 'ME' created_on = 20241203 )
    ( so_id = 1230 name = 'TEL Corp' doc_cat = 'JK' doc_type = 'IR' amount = 1234 d_currency = 'USD' created_by = 'ME' created_on = 20241203 )
    ).


    lt_item = VALUE #( ( so_id = 1233 so_item = 0001 matnr = 'TRK001' quan = 10 meins = 'KG' price = '143.35' currency = 'INR' )
    ( so_id = 1233 so_item = 0002 matnr = 'TRK002' quan = 10 meins = 'KG' price = '143.35' currency = 'INR' )
    ( so_id = 1233 so_item = 0003 matnr = 'TRK003' quan = 10 meins = 'KG' price = '143.35' currency = 'INR' )
    ( so_id = 1234 so_item = 0001 matnr = 'TAN001' quan = 10 meins = 'KG' price = '143.35' currency = 'INR' )
    ( so_id = 1234 so_item = 0002 matnr = 'TAN002' quan = 10 meins = 'KG' price = '143.35' currency = 'INR' )
    ( so_id = 1235 so_item = 0001 matnr = 'CURV001' quan = 10 meins = 'KG' price = '143.35' currency = 'INR' )
    ( so_id = 1236 so_item = 0001 matnr = 'CURV001' quan = 10 meins = 'KG' price = '143.35' currency = 'INR' )
    ( so_id = 1236 so_item = 0002 matnr = 'TAN001' quan = 10 meins = 'KG' price = '143.35' currency = 'INR' )
    ( so_id = 1236 so_item = 0003 matnr = 'CURV001' quan = 10 meins = 'KG' price = '143.35' currency = 'INR' )
    ( so_id = 1236 so_item = 0004 matnr = 'TRK003' quan = 10 meins = 'KG' price = '143.35' currency = 'INR' )
    ( so_id = 1237 so_item = 0001 matnr = 'CURV001' quan = 10 meins = 'KG' price = '143.35' currency = 'EUR' )
    ( so_id = 1237 so_item = 0002 matnr = 'TRK002' quan = 10 meins = 'KG' price = '143.35' currency = 'EUR' )
    ( so_id = 1238 so_item = 0001 matnr = 'TRK003' quan = 10 meins = 'KG' price = '143.35' currency = 'INR' )
    ( so_id = 1238 so_item = 0002 matnr = 'CURV001' quan = 10 meins = 'KG' price = '143.35' currency = 'INR' )
    ( so_id = 1238 so_item = 0003 matnr = 'TRK001' quan = 10 meins = 'KG' price = '143.35' currency = 'INR' )
    ( so_id = 1238 so_item = 0004 matnr = 'CURV001' quan = 10 meins = 'KG' price = '143.35' currency = 'INR' )
    ( so_id = 1239 so_item = 0001 matnr = 'TRK002' quan = 10 meins = 'KG' price = '143.35' currency = 'INR' )
    ( so_id = 1230 so_item = 0001 matnr = 'CURV001' quan = 10 meins = 'KG' price = '143.35' currency = 'INR' )
    ( so_id = 1230 so_item = 0002 matnr = 'TAN001' quan = 10 meins = 'KG' price = '143.35' currency = 'USD' )  ).
    DELETE FROM zcl_order_t.
    DELETE FROM ztbl_po_item.
    INSERT zcl_order_t FROM TABLE @lt_order.
    INSERT ztbl_po_item FROM TABLE @lt_item.
  ENDMETHOD.

ENDCLASS.
