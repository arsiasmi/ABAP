CLASS lhc_zcl_order_cds DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR zcl_order_cds RESULT result.

ENDCLASS.

CLASS lhc_zcl_order_cds IMPLEMENTATION.

  METHOD get_instance_features.
  ENDMETHOD.

ENDCLASS.
