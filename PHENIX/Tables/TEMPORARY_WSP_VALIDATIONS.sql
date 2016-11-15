CREATE GLOBAL TEMPORARY TABLE phenix.temporary_wsp_validations (
  twv_pgr_code NUMBER(5),
  twv_pgr_description VARCHAR2(30 BYTE),
  twv_whs_code VARCHAR2(2 BYTE),
  twv_whs_name VARCHAR2(30 BYTE),
  twv_prf_prd_code VARCHAR2(10 BYTE),
  twv_prd_description VARCHAR2(30 BYTE),
  twv_prf_fmt_code VARCHAR2(7 BYTE),
  twv_prf_description VARCHAR2(30 BYTE),
  twv_brand_name VARCHAR2(15 BYTE),
  twv_whs_picking_code VARCHAR2(2 BYTE),
  twv_wsp_pgr_code NUMBER(5),
  twv_message VARCHAR2(200 BYTE)
)
ON COMMIT PRESERVE ROWS;