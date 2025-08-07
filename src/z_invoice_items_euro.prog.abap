*&---------------------------------------------------------------------*
*& Report z_invoice_items_euro
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_invoice_items_euro.

class lcl_main definition create private.

  public section.
    CLASS-METHODS create
      RETURNING
        value(r_result) TYPE REF TO lcl_main.
      METHODS run.

  protected section.
  private section.

endclass.

class lcl_main implementation.

  method create.

    r_result = new #( ).

  endmethod.

  method run.
    data(invoices) = new ZCL_INVOICE_RETRIEVAL( ).
    data(invoice_items) = invoices->get_items_from_db( ).
    cl_salv_table=>factory(

      IMPORTING
        r_salv_table   = data(alv_table)
      CHANGING
        t_table        = invoice_items
    ).

    alv_table->display( ).

  endmethod.

endclass.

START-OF-SELECTION.

lcl_main=>create( )->run( ).
