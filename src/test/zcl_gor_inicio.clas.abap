CLASS zcl_gor_inicio DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.



CLASS zcl_gor_inicio IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    " Cabecera del proyecto
    out->write( 'ERP de Obras y Reformas' ).
    out->write( 'Port a SAP del modulo gestion_bd de Odoo' ).
    out->write( ' ' ).

    " Entidades con codigo (seccion 10 del informe)
    out->write( 'Entidades con codigo propio:' ).
    out->write( 'Cliente        CLI0001' ).
    out->write( 'Trabajador     TRB0001' ).
    out->write( 'Proveedor      PROV0001' ).
    out->write( 'Especialista   ESP0001' ).
    out->write( 'Presupuesto    PREP0001' ).
    out->write( 'Obra           OBR0001' ).
    out->write( 'Gasto          GAS0001' ).
    out->write( 'Ingreso        ING0001' ).

    " Los partes se identifican por su fecha, sin codigo
    out->write( 'Entidades sin codigo:' ).
    out->write( 'Parte de Trabajo' ).
    out->write( 'Parte de Especialista' ).
    out->write( 'Parte de Proveedor' ).
  ENDMETHOD.
ENDCLASS.
