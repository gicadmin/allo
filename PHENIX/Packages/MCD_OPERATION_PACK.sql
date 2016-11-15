CREATE OR REPLACE PACKAGE phenix.MCD_OPERATION_PACK IS

PROCEDURE TAG_INH_ON_MCD_PROC(
  p_mch_id        IN miscellaneous_charge_details.mcd_mch_id%TYPE,
  p_inh_id        IN miscellaneous_charge_details.mcd_inh_id%TYPE
);

PROCEDURE SUM_FOR_INH_PROC(
  p_inh_id        IN miscellaneous_charge_details.mcd_inh_id%TYPE,
  p_sum_amount    OUT NUMBER,
  p_sum_fed_tax   OUT NUMBER,
  p_sum_prov_tax  OUT NUMBER
);

PROCEDURE PURGE_HEADER_PROC(
  p_mch_id  IN  miscellaneous_charge_headers.mch_id%TYPE
);

PROCEDURE PURGE_PROC(
  p_inh_id  IN invoice_headers.inh_id%TYPE
);

END MCD_OPERATION_PACK;
/