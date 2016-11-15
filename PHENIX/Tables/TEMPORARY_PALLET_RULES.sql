CREATE TABLE phenix.temporary_pallet_rules (
  tpr_sid_id NUMBER(15) NOT NULL,
  tpr_rou_code NUMBER(5) NOT NULL,
  tpr_pmr_pms_pmo_code NUMBER(3) NOT NULL,
  tpr_pmr_pms_id NUMBER(15) NOT NULL,
  tpr_pmr_sequence_code NUMBER(3) NOT NULL,
  tpr_pmr_meter_min_volume NUMBER(12,5) NOT NULL,
  tpr_pmr_meter_max_volume NUMBER(12,5) NOT NULL,
  tpr_pmr_max_nb_of_customers NUMBER(2) NOT NULL,
  tpr_pmr_whz_code VARCHAR2(2 BYTE),
  tpr_pmr_cus_code NUMBER(10),
  tpr_pmr_pty_code NUMBER(3),
  tpr_pmr_cgr_code NUMBER(3),
  tpr_pmr_prw_whz_code VARCHAR2(2 BYTE),
  CONSTRAINT tpr_pmr_cus_pty_cgr_ck CHECK (
 	(
 		(TPR_PMR_CUS_CODE IS NULL AND TPR_PMR_PTY_CODE IS NULL AND TPR_PMR_CGR_CODE IS NULL)
 		OR
 		(TPR_PMR_CUS_CODE IS NOT NULL AND TPR_PMR_PTY_CODE IS NULL AND TPR_PMR_CGR_CODE IS NULL)
 		OR
 		(TPR_PMR_CUS_CODE IS NULL AND TPR_PMR_PTY_CODE IS NOT NULL AND TPR_PMR_CGR_CODE IS NULL)
 		OR
 		(TPR_PMR_CUS_CODE IS NULL AND TPR_PMR_PTY_CODE IS NULL AND TPR_PMR_CGR_CODE IS NOT NULL)
 		)
 	),
  CONSTRAINT tpr_pk PRIMARY KEY (tpr_sid_id,tpr_rou_code,tpr_pmr_pms_pmo_code,tpr_pmr_pms_id,tpr_pmr_sequence_code) USING INDEX (CREATE INDEX phenix.tpr_pk ON phenix.temporary_pallet_rules(tpr_sid_id,tpr_rou_code,tpr_pmr_pms_pmo_code,tpr_pmr_pms_id,tpr_pmr_sequence_code)    ),
  CONSTRAINT tpr_pmr_cgr_fk FOREIGN KEY (tpr_pmr_cgr_code) REFERENCES phenix.customer_groups (cgr_code),
  CONSTRAINT tpr_pmr_cus_fk FOREIGN KEY (tpr_pmr_cus_code) REFERENCES phenix.customers (cus_code) ON DELETE CASCADE,
  CONSTRAINT tpr_pmr_pty_fk FOREIGN KEY (tpr_pmr_pty_code) REFERENCES phenix.promotion_types (pty_code),
  CONSTRAINT tpr_pmr_whz_fk FOREIGN KEY (tpr_pmr_whz_code) REFERENCES phenix.warehouse_zones (whz_code),
  CONSTRAINT tpr_tmo_fk FOREIGN KEY (tpr_sid_id,tpr_rou_code,tpr_pmr_pms_pmo_code,tpr_pmr_pms_id) REFERENCES phenix.temporary_models (tmo_sid_id,tmo_rou_code,tmo_pmr_pms_pmo_code,tmo_pmr_pms_id)
);
COMMENT ON COLUMN phenix.temporary_pallet_rules.tpr_pmr_prw_whz_code IS 'Indique le code de la zone d''entreposage du produit dans l''entrepôt';