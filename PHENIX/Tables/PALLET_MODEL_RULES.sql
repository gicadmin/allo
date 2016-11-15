CREATE TABLE phenix.pallet_model_rules (
  pmr_id NUMBER(15) NOT NULL,
  pmr_pms_pmo_code NUMBER(3) NOT NULL,
  pmr_pms_id NUMBER(15) NOT NULL,
  pmr_sequence_code NUMBER(3) NOT NULL,
  pmr_meter_min_volume NUMBER(12,5) NOT NULL,
  pmr_meter_max_volume NUMBER(12,5) NOT NULL,
  pmr_max_nb_of_customers NUMBER(2) NOT NULL,
  pmr_whz_code VARCHAR2(2 BYTE),
  pmr_cus_code NUMBER(10),
  pmr_pty_code NUMBER(3),
  pmr_cgr_code NUMBER(3),
  pmr_prw_whz_code VARCHAR2(2 BYTE),
  CONSTRAINT pmr_cus_pty_cgr_ck CHECK (
 	(
 		(PMR_CUS_CODE IS NULL AND PMR_PTY_CODE IS NULL AND PMR_CGR_CODE IS NULL)
 		OR
 		(PMR_CUS_CODE IS NOT NULL AND PMR_PTY_CODE IS NULL AND PMR_CGR_CODE IS NULL)
 		OR
 		(PMR_CUS_CODE IS NULL AND PMR_PTY_CODE IS NOT NULL AND PMR_CGR_CODE IS NULL)
 		OR
 		(PMR_CUS_CODE IS NULL AND PMR_PTY_CODE IS NULL AND PMR_CGR_CODE IS NOT NULL)
 		)
 	),
  CONSTRAINT pmr_pk PRIMARY KEY (pmr_id) USING INDEX (CREATE INDEX phenix.pmr_pk ON phenix.pallet_model_rules(pmr_id)    ),
  CONSTRAINT pmr_uk UNIQUE (pmr_pms_pmo_code,pmr_pms_id,pmr_sequence_code),
  CONSTRAINT pmr_cgr_fk FOREIGN KEY (pmr_cgr_code) REFERENCES phenix.customer_groups (cgr_code),
  CONSTRAINT pmr_cus_fk FOREIGN KEY (pmr_cus_code) REFERENCES phenix.customers (cus_code) ON DELETE CASCADE,
  CONSTRAINT pmr_pms_fk FOREIGN KEY (pmr_pms_id) REFERENCES phenix.pallet_model_specifics (pms_id),
  CONSTRAINT pmr_prw_whz_code_fk FOREIGN KEY (pmr_prw_whz_code) REFERENCES phenix.warehouse_zones (whz_code),
  CONSTRAINT pmr_pty_fk FOREIGN KEY (pmr_pty_code) REFERENCES phenix.promotion_types (pty_code),
  CONSTRAINT pmr_whz_fk FOREIGN KEY (pmr_whz_code) REFERENCES phenix.warehouse_zones (whz_code)
);
COMMENT ON TABLE phenix.pallet_model_rules IS 'Table pour les règles des modèles de palletisation';
COMMENT ON COLUMN phenix.pallet_model_rules.pmr_id IS 'Indique l''identifiant de la table';
COMMENT ON COLUMN phenix.pallet_model_rules.pmr_pms_pmo_code IS 'Indique le code du modèle de palletisation';
COMMENT ON COLUMN phenix.pallet_model_rules.pmr_pms_id IS 'Indique le code du modèle spécifique de palletisation';
COMMENT ON COLUMN phenix.pallet_model_rules.pmr_sequence_code IS 'Indique la séquence de priorité qui sera utilisé lors de l''application des règles';
COMMENT ON COLUMN phenix.pallet_model_rules.pmr_meter_min_volume IS 'Indique le volume minimum d''une palette, en mètre cube';
COMMENT ON COLUMN phenix.pallet_model_rules.pmr_meter_max_volume IS 'Indique le volume maximum d''une palette, en mètre cube';
COMMENT ON COLUMN phenix.pallet_model_rules.pmr_max_nb_of_customers IS 'Indique le nombre de client maximum pouvant être mis sur une palette';
COMMENT ON COLUMN phenix.pallet_model_rules.pmr_whz_code IS 'Indique si la règle s''applique à une zone d''entreposage mission spécifique';
COMMENT ON COLUMN phenix.pallet_model_rules.pmr_cus_code IS 'Indique si la règle s''applique à un client spécifique';
COMMENT ON COLUMN phenix.pallet_model_rules.pmr_pty_code IS 'Indique si la règle s''applique aux clients d''une bannière spécifique';
COMMENT ON COLUMN phenix.pallet_model_rules.pmr_cgr_code IS 'Indique si la règle s''applique à un groupe de clients spécifique';
COMMENT ON COLUMN phenix.pallet_model_rules.pmr_prw_whz_code IS 'Indique le code de la zone d''entreposage du produit dans l''entrepôt';