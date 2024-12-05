CLASS zcl_pr_create DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_pr_create IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA:lt_emp TYPE STANDARD TABLE OF zemp2_master .
    DATA: ls_emp TYPE zemp2_master.

    ls_emp-emp2_name = 'Test'.
    ls_emp-emp2_id = '5326'.

    APPEND ls_emp TO lt_emp.


  ENDMETHOD.
ENDCLASS.
