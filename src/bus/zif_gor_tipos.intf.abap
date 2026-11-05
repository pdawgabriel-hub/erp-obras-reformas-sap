INTERFACE zif_gor_tipos PUBLIC .

  " Tipos basicos con nombre propio, si cambia el tipo de cambia AQUI
  TYPES ty_importe    TYPE decfloat34.
  TYPES ty_horas      TYPE decfloat34.
  TYPES ty_porcentaje TYPE decfloat34.
  TYPES ty_codigo     TYPE c LENGTH 8.
  TYPES ty_estado     TYPE c LENGTH 15.

  " Linea de presupuesto
  TYPES: BEGIN OF ty_presu_linea,
      descripcion   TYPE string,
      uds           TYPE i,
      precio        TYPE ty_importe,
    END OF ty_presu_linea.

  " Grupo de constantes
  CONSTANTS: BEGIN OF estado_presu,
      aprobado    TYPE ty_estado VALUE 'aprobado',
      no_aprobado TYPE ty_estado VALUE 'no_aprobado',
    END OF estado_presu.
ENDINTERFACE.
