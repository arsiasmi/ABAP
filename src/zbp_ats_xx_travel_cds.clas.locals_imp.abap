CLASS lhc_Travel DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    TYPES: tt_travel_failed   TYPE TABLE FOR FAILED zats_xx_travel_cds,
           tt_travel_reported TYPE TABLE FOR REPORTED zats_xx_travel_cds.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR Travel RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE Travel.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE Travel.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE Travel.

    METHODS read FOR READ
      IMPORTING keys FOR READ Travel RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK Travel.

    METHODS map_message
      IMPORTING cid          TYPE string OPTIONAL
                travel_id    TYPE /dmo/travel_id OPTIONAL
                messages     TYPE /dmo/t_message
      EXPORTING
                failed_added TYPE abap_bool
      CHANGING
                failed       TYPE tt_travel_failed
                reported     TYPE tt_travel_reported.

ENDCLASS.

CLASS lhc_Travel IMPLEMENTATION.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD create.

    DATA: messages   TYPE /dmo/t_message,
          travel_in  TYPE /dmo/travel,
          travel_out TYPE /dmo/travel.

    LOOP AT entities ASSIGNING FIELD-SYMBOL(<travel_create>).

      travel_in = CORRESPONDING #( <travel_create> MAPPING FROM ENTITY USING CONTROL ).
      /dmo/cl_flight_legacy=>get_instance( )->create_travel(
        EXPORTING
          is_travel             = CORRESPONDING /dmo/s_travel_in( travel_in )
        IMPORTING
          es_travel             = travel_out
          et_messages           = DATA(lt_messages)
      ).

      /dmo/cl_flight_legacy=>get_instance(  )->convert_messages(
        EXPORTING
          it_messages = lt_messages
        IMPORTING
          et_messages = messages
      ).

      map_message(
        EXPORTING
          cid          = <travel_create>-%cid
*          travel_id    =
          messages     = messages
        IMPORTING
          failed_added = DATA(lv_failed)
        CHANGING
          failed       = failed-travel
          reported     = reported-travel
      ).

      IF lv_failed = abap_false.

        INSERT VALUE #( %cid = <travel_create>-%cid
                        travelid = travel_out-travel_id ) INTO TABLE mapped-travel.

      ENDIF.


    ENDLOOP.

  ENDMETHOD.

  METHOD update.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

  METHOD map_message.
    failed_added = abap_false.

    LOOP AT messages ASSIGNING FIELD-SYMBOL(<msg>).

      IF <msg>-msgty = 'E' OR <msg>-msgty = 'A'.
        APPEND VALUE #( %cid = cid
                        travelid = travel_id
                        %fail-cause = /dmo/cl_travel_auxiliary=>get_cause_from_message(
                                        EXPORTING
                                            msgid        = <msg>-msgid
                                            msgno        = <msg>-msgno ) ) TO failed.

        failed_added = abap_true.
      ENDIF.

      APPEND VALUE #( %msg = new_message(
                      id = <msg>-msgid
                      number = <msg>-msgno
                      severity = if_abap_behv_message=>severity-error
                      v1 = <msg>-msgv1
                      v2 = <msg>-msgv2
                      v3 = <msg>-msgv3
                      v4 = <msg>-msgv4 )
                      travelid = travel_id
                      %cid = cid
                      ) TO reported.
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZATS_XX_TRAVEL_CDS DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZATS_XX_TRAVEL_CDS IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.
    /dmo/cl_flight_legacy=>get_instance(  )->save(  ).
  ENDMETHOD.

  METHOD cleanup.
    /dmo/cl_flight_legacy=>get_instance(  )->initialize( ).
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
