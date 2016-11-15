CREATE OR REPLACE PACKAGE phenix.CSE_OPERATION_PACK AS

PROCEDURE TREAT_CAD_PROC(
  p_inh_id IN invoice_headers.inh_id%TYPE
);

PROCEDURE TREAT_COD_PROC(
  p_inh_id IN invoice_headers.inh_id%TYPE
);

PROCEDURE TREAT_CDS_PROC(
  p_inh_id IN invoice_headers.inh_id%TYPE
);

PROCEDURE TREAT_MCD_PROC(
  p_inh_id IN invoice_headers.inh_id%TYPE
);

PROCEDURE LOAD_ALL_PROC(
  p_inh_id_from IN invoice_headers.inh_id%TYPE,
  p_inh_id_to   IN invoice_headers.inh_id%TYPE
);

END CSE_OPERATION_PACK;
/