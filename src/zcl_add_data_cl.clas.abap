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

    lt_order = VALUE #( ( so_id = 1233 name = 'ABC Corp' doc_cat = 'OM' doc_type = 'TR' amount = 1233 d_currency = 'INR' created_by = 'ME' created_on = 20241203 )
    ( so_id = 1234 name = 'ABC Corp' doc_cat = 'OM' doc_type = 'TR' amount = 1233 d_currency = 'INR' created_by = 'ME' created_on = 20241203 )
    ( so_id = 1235 name = 'XYZ Corp' doc_cat = 'OM' doc_type = 'QS' amount = 8233 d_currency = 'INR' created_by = 'ME' created_on = 20241203 )
    ( so_id = 1236 name = 'MNO Corp' doc_cat = 'CR' doc_type = 'TR' amount = 1233 d_currency = 'INR' created_by = 'ME' created_on = 20241203 )
    ( so_id = 1237 name = 'NSH Corp' doc_cat = 'OM' doc_type = 'YU' amount = 1233 d_currency = 'EUR' created_by = 'ME' created_on = 20241203 )
    ( so_id = 1238 name = 'ICS Corp' doc_cat = 'GN' doc_type = 'TR' amount = 1923 d_currency = 'INR' created_by = 'ME' created_on = 20241203 )
    ( so_id = 1239 name = 'WIP Corp' doc_cat = 'OM' doc_type = 'D7' amount = 1233 d_currency = 'INR' created_by = 'ME' created_on = 20241203 )
    ( so_id = 1230 name = 'TEL Corp' doc_cat = 'JK' doc_type = 'IR' amount = 1234 d_currency = 'USD' created_by = 'ME' created_on = 20241203 )
    ).

    DELETE FROM zcl_order_t.

    INSERT zcl_order_t FROM TABLE @lt_order.
  ENDMETHOD.

ENDCLASS.
