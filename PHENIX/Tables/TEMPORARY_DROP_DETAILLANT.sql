CREATE TABLE phenix.temporary_drop_detaillant (
  tdd_cus_code NUMBER(10),
  tdd_cus_name VARCHAR2(30 BYTE),
  tdd_rcl_id NUMBER(6),
  tdd_rcl_name VARCHAR2(30 BYTE),
  tdd_ven_code NUMBER(5),
  tdd_ven_name VARCHAR2(30 BYTE),
  tdd_rcl_prv_code VARCHAR2(2 BYTE),
  tdd_vta_rebate_percent NUMBER(6,3),
  tdd_cds_sales_amount NUMBER(10,2),
  tdd_crc_cus_client_code VARCHAR2(15 BYTE),
  tdd_rebate_amount NUMBER(10,2),
  tdd_nb_frs_vol_diff_zero NUMBER(4),
  tdd_count_tot_frs NUMBER(4)
);