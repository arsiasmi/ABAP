CLASS lhc_zcl_order_cds DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR zcl_order_cds RESULT result.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zcl_order_cds RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE zcl_order_cds.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE zcl_order_cds.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE zcl_order_cds.

    METHODS read FOR READ
      IMPORTING keys FOR READ zcl_order_cds RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK zcl_order_cds.

ENDCLASS.

CLASS lhc_zcl_order_cds IMPLEMENTATION.

  METHOD get_instance_features.
  ENDMETHOD.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD create.
  ENDMETHOD.

  METHOD update.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZCL_ORDER_CDS DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZCL_ORDER_CDS IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.
  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
