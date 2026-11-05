CLASS zcl_gor_tipos_demo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.
ENDCLASS.



CLASS zcl_gor_tipos_demo IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA ls_linea TYPE zif_gor_tipos=>ty_presu_linea.
    DATA lv_iva   TYPE zif_gor_tipos=>ty_porcentaje VALUE 21.

    ls_linea-uds    = 10.
    ls_linea-precio = 100.

    DATA(lv_total) = zcl_gor_reglas=>total_linea(
                      iv_uds    = ls_linea-uds
                      iv_precio = ls_linea-precio ).
    DATA(lv_cuota) = zcl_gor_reglas=>cuota_iva(
                      iv_base = lv_total
                      iv_iva = lv_iva ).
    DATA(lv_total_presu) = zcl_gor_reglas=>total_presupuesto(
                      iv_base = lv_total
                      iv_iva = lv_iva ).

    out->write( |Base: { lv_total DECIMALS = 2 }| ).
    out->write( |Cuota de IVA: { lv_cuota DECIMALS = 2 }| ).
    out->write( |Total: { lv_total_presu DECIMALS = 2 }| ).

    " Estructuras y tipos propios
    TYPES: BEGIN OF ty_cliente,
             cliente_id      TYPE zif_gor_tipos=>ty_codigo,
             nombre          TYPE string,
             apellidos       TYPE string,
             nif             TYPE string,
             direccion       TYPE string,
             cod_postal      TYPE string,
             telf            TYPE string,
           END OF ty_cliente.

    DATA(ls_cliente) = VALUE ty_cliente( cliente_id        = 'CLI0001'
                                         nombre            = 'Juan'
                                         apellidos         = 'Pérez López').

    out->write( ls_cliente ).
    out->write( |{ ls_cliente-cliente_id } x { ls_cliente-nombre } { ls_cliente-apellidos }| ).

    " ty_trabajador
    TYPES: BEGIN OF ty_trabajador,
             trabajador_id        TYPE zif_gor_tipos=>ty_codigo,
             nombre               TYPE string,
             apellido             TYPE string,
             tipo                 TYPE string,
             telf                 TYPE string,
             coste_hora_estandar  TYPE zif_gor_tipos=>ty_importe,
           END OF ty_trabajador.

    DATA(ls_trabajador) = VALUE ty_trabajador( trabajador_id        = 'TRB0001'
                                               coste_hora_estandar  = '20').

    out->write( ls_trabajador ).
    out->write( |{ ls_trabajador-trabajador_id } x { ls_trabajador-nombre } { ls_trabajador-apellido }| ).

    TYPES: BEGIN OF ty_proveedor,
             proveedor_id    TYPE zif_gor_tipos=>ty_codigo,
             nombre          TYPE string,
             direccion       TYPE string,
             telf            TYPE string,
             correo          TYPE string,
             tipo            TYPE string,
             ref             TYPE string,
             documento       TYPE string,
             num_documento   TYPE string,
             base            TYPE zif_gor_tipos=>ty_importe,
             iva             TYPE zif_gor_tipos=>ty_porcentaje,
           END OF ty_proveedor.

    TYPES: BEGIN OF ty_especialista,
             especialista_id     TYPE zif_gor_tipos=>ty_codigo,
             tipo                TYPE string,
             ref                 TYPE string,
             comunicacion_parte  TYPE string,
             nombre              TYPE string,
             observaciones        TYPE string,
             telf                TYPE string,
             correo              TYPE string,
             importe             TYPE zif_gor_tipos=>ty_importe,
           END OF ty_especialista.

    TYPES: BEGIN OF ty_obra,
             obra_id         TYPE zif_gor_tipos=>ty_codigo,
             descripcion     TYPE string,
           END OF ty_obra.

    TYPES: BEGIN OF ty_ingreso,
             ingreso_id      TYPE zif_gor_tipos=>ty_codigo,
             tipo            TYPE string,
             fecha           TYPE d,
             documento       TYPE string,
             num_documento   TYPE string,
             importe         TYPE zif_gor_tipos=>ty_importe,
           END OF ty_ingreso.
    TYPES: BEGIN OF ty_falta,
             fecha_inicio    TYPE d,
             fecha_fin       TYPE d,
             tipo            TYPE string,
             motivo          TYPE string,
           END OF ty_falta.

  ENDMETHOD.
ENDCLASS.
