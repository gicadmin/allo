CREATE GLOBAL TEMPORARY TABLE phenix.temp_rap_purchase_and_sales (
  trp_ven_code NUMBER(5),
  trp_ven_name VARCHAR2(30 BYTE),
  trp_prd_code VARCHAR2(10 BYTE),
  trp_prd_special_order_switch VARCHAR2(10 BYTE),
  trp_prd_status VARCHAR2(1 BYTE),
  trp_manufacturer_code VARCHAR2(15 BYTE),
  trp_prd_description VARCHAR2(45 BYTE),
  trp_vpd_prf_fmt_code VARCHAR2(7 BYTE),
  trp_brn_description VARCHAR2(15 BYTE),
  trp_fmt_short_code VARCHAR2(2 BYTE),
  trp_prf_description VARCHAR2(30 BYTE),
  trp_broker_code VARCHAR2(15 BYTE),
  trp_total_pod_ordered NUMBER,
  trp_total_pod_received NUMBER,
  trp_total_cot_invoiced NUMBER,
  trp_prd_last_list_paid NUMBER,
  trp_prd_definition VARCHAR2(1 BYTE),
  trp_prf_fmt_code VARCHAR2(7 BYTE),
  trp_prd_fmt_solid_inv_code VARCHAR2(7 BYTE),
  trp_total_pod_ordered_ly NUMBER,
  trp_total_pod_received_ly NUMBER,
  trp_total_cot_invoiced_ly NUMBER,
  trp_prd_last_list_paid_ly NUMBER,
  trp_prd_pgr_code NUMBER(5),
  trp_pgr_description VARCHAR2(30 BYTE),
  trp_total_invoiced_amount NUMBER
)
ON COMMIT PRESERVE ROWS;
COMMENT ON COLUMN phenix.temp_rap_purchase_and_sales.trp_total_pod_ordered_ly IS 'Indique la quantité ou le poids commandée pour l''année précédente.';
COMMENT ON COLUMN phenix.temp_rap_purchase_and_sales.trp_total_pod_received_ly IS 'Indique la quantité ou le poids reçue pour l''année précédente.';
COMMENT ON COLUMN phenix.temp_rap_purchase_and_sales.trp_total_cot_invoiced_ly IS 'Indique la quantité ou le poids vendue pour l''année précédente.';
COMMENT ON COLUMN phenix.temp_rap_purchase_and_sales.trp_prd_last_list_paid_ly IS 'Indique le dernier coûtant payé pour l''année précédente.';
COMMENT ON COLUMN phenix.temp_rap_purchase_and_sales.trp_prd_pgr_code IS 'Indique le code du groupe de produit.';
COMMENT ON COLUMN phenix.temp_rap_purchase_and_sales.trp_pgr_description IS 'Indique la description du groupe de produit.';
COMMENT ON COLUMN phenix.temp_rap_purchase_and_sales.trp_total_invoiced_amount IS 'Indique le montant total déjà payé au fournisseur lors de la réconciliation';