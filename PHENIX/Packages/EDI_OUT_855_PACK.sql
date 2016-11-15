CREATE OR REPLACE PACKAGE phenix.EDI_OUT_855_PACK IS

PROCEDURE GENERATE_855_PROC(
  p_cus_code                  IN NUMBER,
  p_vco_coh_reference_number  IN VARCHAR2
);

END EDI_OUT_855_PACK;
/