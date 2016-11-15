CREATE GLOBAL TEMPORARY TABLE phenix.temp_locations_pre_pick (
  tlp_pmh_id NUMBER(15),
  tlp_pmh_rou_code NUMBER(5),
  tlp_pmd_sequence_number NUMBER(4),
  tlp_prd_code VARCHAR2(10 BYTE),
  tlp_prd_description VARCHAR2(45 BYTE),
  tlp_brn_or_ven_name VARCHAR2(15 BYTE),
  tlp_prf_description VARCHAR2(30 BYTE),
  tlp_quantity NUMBER(7),
  tlp_pmd_loc_code VARCHAR2(12 BYTE),
  tlp_loc_validation_code VARCHAR2(2 BYTE),
  tlp_fmt_short_code VARCHAR2(2 BYTE),
  tlp_vpd_manufacturer_code VARCHAR2(15 BYTE)
)
ON COMMIT PRESERVE ROWS;