CREATE TABLE phenix.temp_rap_changement_prix_sync (
  trs_prd_ven_code NUMBER(5),
  trs_prf_prd_code VARCHAR2(10 BYTE),
  trs_prf_fmt_code VARCHAR2(7 BYTE),
  trs_vpd_code VARCHAR2(15 BYTE),
  trs_new_cost_price NUMBER,
  trs_effective_date DATE,
  trs_update_or_insert VARCHAR2(1 BYTE)
);