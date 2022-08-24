*&---------------------------------------------------------------------*
*& Report ytest00
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ytest00.
*&---------------------------------------------------------------------*
*& Report ytest00
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
report ytest00.


class lcl_local definition .

  public section .

    types:
      begin of ty_return,
        name   type  ssfscreen-gr_nam_sym,
        gv_obj type  ssfscreen-gr_obj_sym,
        gv_id  type  ssfscreen-gr_id_sym,
      end of ty_return .

    data:
      gv_on_off type abap_bool .

    methods constructor
      importing
        !iv_on_off type abap_bool .

    methods get_func_name
      returning
        value(rv_value) type rs38l_fnam .

    methods show_sf
      importing
        !iv_func_name type rs38l_fnam .

  protected section .

  private section .

    constants:
      c_smartforms type tdsfname value 'YTEST' .

    data:
      gv_image     type ssfscreen-gr_nam_sym,
      gv_func_name type rs38l_fnam.

    methods get_config .

endclass.


class lcl_local implementation .


  method constructor .

    me->gv_on_off = iv_on_off .

  endmethod .


  method get_func_name .

    clear:
      me->gv_func_name .

    call function 'SSF_FUNCTION_MODULE_NAME'
      exporting
        formname           = me->c_smartforms
*       variant            = space
*       direct_call        = space
      importing
        fm_name            = me->gv_func_name
      exceptions
        no_form            = 1
        no_function_module = 2
        others             = 3.

    if ( sy-subrc ne 0 ) .
    endif.

  endmethod .


  method show_sf .

    data:
      ls_control_parameters type ssfctrlop,
      ls_output_options     type ssfcompop.

*    ls_control_parameters-no_close = space .

    ls_output_options-tddest    = 'LOCL' .
    ls_output_options-tdimmed   = abap_off .
    ls_output_options-tddelete  = abap_on .
    "ls_output_options-tdprinter = 'LOCL' .
    ls_output_options-tddataset = '' . "Ordem spool: nome
    ls_output_options-tdsuffix1 = '' . "Ordem spool: sufixo 1
    ls_output_options-tdsuffix2 = '' . "Ordem spool: sufixo 2

    me->get_config( ) .

    if ( me->gv_func_name is not initial ) .

      call function me->gv_func_name
        exporting
*         archive_index      =
*         archive_index_tab  =
*         archive_parameters =
          control_parameters = ls_control_parameters
*         mail_appl_obj      =
*         mail_recipient     =
*         mail_sender        =
          output_options     = ls_output_options
*         user_settings      = 'x'
          image              = me->gv_image
*       importing
*         document_output_info       =
*         job_output_info    =
*         job_output_options =
        exceptions
          formatting_error   = 1
          internal_error     = 2
          send_error         = 3
          user_canceled      = 4
          others             = 5.

      if ( sy-subrc ne 0 ) .
      endif.

    endif .

  endmethod .


  method get_config .

    clear:
      me->gv_image .

    case me->gv_on_off .
      when abap_true .
        me->gv_image = 'Y_TEST_WATERMARK_ON' .
      when abap_off .
        me->gv_image = 'Y_TEST_WATERMARK_OFF' .
      when others .
    endcase .

  endmethod .


endclass.


*--------------------------------------------------------------------*
*- Selection Screen
*--------------------------------------------------------------------*
selection-screen begin of block b01 with frame title text-00b.
parameters:
  p_on  type char1 radiobutton group r1,
  p_off type char1 radiobutton group r1 default 'X'.
selection-screen end of block b01 .


start-of-selection .

  data(go_obj) =
    new lcl_local( iv_on_off = cond #( when p_on = abap_true then abap_on
                                                             else abap_off ) ) .

  if ( go_obj is bound ) .

    go_obj->show_sf( go_obj->get_func_name( ) ) .

  endif .































*