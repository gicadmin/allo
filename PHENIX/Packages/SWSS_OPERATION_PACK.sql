CREATE OR REPLACE PACKAGE phenix.SWSS_OPERATION_PACK AS

PROCEDURE TREAT_CAD_PROC(
  p_inh_id IN invoice_headers.inh_id%TYPE
);

PROCEDURE TREAT_CDS_PROC(
  p_inh_id IN invoice_headers.inh_id%TYPE
);

PROCEDURE TREAT_COD_PROC(
  p_inh_id IN invoice_headers.inh_id%TYPE
);

END SWSS_OPERATION_PACK;
/