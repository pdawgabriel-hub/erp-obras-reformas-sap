CLASS zcl_gor_reglas DEFINITION PUBLIC FINAL CREATE PUBLIC.
  PUBLIC SECTION.
    " Redondeo a centimos (empate hacia arriba)
    CLASS-METHODS redondear
      IMPORTING iv_valor        TYPE zif_gor_tipos=>ty_importe
      RETURNING VALUE(rv_valor) TYPE zif_gor_tipos=>ty_importe.

    " total_linea = redondear( uds * precio )
    CLASS-METHODS total_linea
      IMPORTING iv_uds          TYPE i
                iv_precio       TYPE zif_gor_tipos=>ty_importe
      RETURNING VALUE(rv_total) TYPE zif_gor_tipos=>ty_importe.

    " cuota_iva = redondear( base * iva / 100 ). El IVA llega como 21
    CLASS-METHODS cuota_iva
      IMPORTING iv_base         TYPE zif_gor_tipos=>ty_importe
                iv_iva          TYPE zif_gor_tipos=>ty_porcentaje
      RETURNING VALUE(rv_cuota) TYPE zif_gor_tipos=>ty_importe.

    " total_presupuesto = base + cuota_iva( base, iva )
    CLASS-METHODS total_presupuesto
      IMPORTING iv_base         TYPE zif_gor_tipos=>ty_importe
                iv_iva          TYPE zif_gor_tipos=>ty_porcentaje
      RETURNING VALUE(rv_total) TYPE zif_gor_tipos=>ty_importe.

    " total_proveedor = base * (1 + iva / 100). Sin redondear
    CLASS-METHODS total_proveedor
      IMPORTING iv_base         TYPE  zif_gor_tipos=>ty_importe
                iv_iva          TYPE  zif_gor_tipos=>ty_porcentaje
      RETURNING VALUE(rv_total) TYPE  zif_gor_tipos=>ty_importe.

    " coste_subtotal = horas * coste_hora. Sin redondear
    CLASS-METHODS coste_subtotal
      IMPORTING iv_horas        TYPE zif_gor_tipos=>ty_horas
                iv_coste_hora   TYPE zif_gor_tipos=>ty_importe
      RETURNING VALUE(rv_coste) TYPE zif_gor_tipos=>ty_importe.

    " dias_falta = fin - inicio + 1. 0 si falta alguna fecha
    CLASS-METHODS dias_falta
      IMPORTING iv_inicio       TYPE d
                iv_fin          TYPE d
      RETURNING VALUE(rv_dias)  TYPE i.
ENDCLASS.

CLASS zcl_gor_reglas IMPLEMENTATION.
  METHOD redondear.
    rv_valor = round( val = iv_valor dec = 2 ).
  ENDMETHOD.

  METHOD total_linea.
    rv_total = redondear( iv_uds * iv_precio ).
  ENDMETHOD.

  METHOD cuota_iva.
    rv_cuota = redondear( iv_base * iv_iva / 100 ).
  ENDMETHOD.

  METHOD total_presupuesto.
    rv_total = iv_base + cuota_iva( iv_base = iv_base iv_iva = iv_iva ).
  ENDMETHOD.

  METHOD total_proveedor.
    rv_total = iv_base * ( 1 + iv_iva / 100 ).
  ENDMETHOD.

  METHOD coste_subtotal.
    rv_coste = iv_horas * iv_coste_hora.
  ENDMETHOD.

  METHOD dias_falta.
    IF iv_inicio IS INITIAL OR iv_fin IS INITIAL.
      RETURN.
    ENDIF.
    rv_dias = iv_fin - iv_inicio + 1.
  ENDMETHOD.

ENDCLASS.

