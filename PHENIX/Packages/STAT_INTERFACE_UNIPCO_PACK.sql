CREATE OR REPLACE PACKAGE phenix.STAT_INTERFACE_UNIPCO_PACK IS

PROCEDURE GEN_UNIPCO_STATS_PROC(
	p_jsc_id IN NUMBER
);

PROCEDURE EXTRACT_UNIPCO_STATS_PROC(
  p_whs_identification IN VARCHAR2,
  p_cgr_code           IN NUMBER,
  p_inv_date_from      IN DATE,
  p_inv_date_to        IN DATE,
  p_whs_code           IN VARCHAR2,
  p_language_code      IN VARCHAR2
);

PROCEDURE GEN_UNIPCO_QUOTATION_PROC(
	p_jsc_id IN NUMBER
);

PROCEDURE EXTRACT_UNIPCO_QUOTATION_PROC(
  p_quotation     IN VARCHAR2,
  p_cus_code      IN NUMBER,
  p_qty_code      IN NUMBER,
  p_naz_nac_code  IN NUMBER,
  p_naz_zone_code IN NUMBER,
  p_start_date    IN DATE,
  p_format        IN VARCHAR2,
  p_language_code IN VARCHAR2 DEFAULT 'F'
);

END STAT_INTERFACE_UNIPCO_PACK;
/