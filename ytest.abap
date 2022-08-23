*&---------------------------------------------------------------------*
*& Report ytest00
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ytest00.


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
      gv_image     type lcl_local=>ty_return,
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
    if sy-subrc <> 0.
*       message id sy-msgid type sy-msgty number sy-msgno
*         with sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
    endif.

  endmethod .


  method show_sf .

    if ( me->gv_func_name is not initial ) .

*    call function '/1BCDWB/SF00011452'
*      exporting
**        ARCHIVE_INDEX        =
**        ARCHIVE_INDEX_TAB    =
**        ARCHIVE_PARAMETERS   =
**        CONTROL_PARAMETERS   =
**        MAIL_APPL_OBJ        =
**        MAIL_RECIPIENT       =
**        MAIL_SENDER          =
**        OUTPUT_OPTIONS       =
**        USER_SETTINGS        = 'X'
*        IMAGE                = me->
**      importing
**        DOCUMENT_OUTPUT_INFO =
**        JOB_OUTPUT_INFO      =
**        JOB_OUTPUT_OPTIONS   =
**      exceptions
**        FORMATTING_ERROR     = 1
**        INTERNAL_ERROR       = 2
**        SEND_ERROR           = 3
**        USER_CANCELED        = 4
**        OTHERS               = 5
*      .
*    if sy-subrc <> 0.
**     message id sy-msgid type sy-msgty number sy-msgno
**       with sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
*    endif.

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