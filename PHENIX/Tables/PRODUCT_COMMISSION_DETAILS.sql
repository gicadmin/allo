CREATE TABLE phenix.product_commission_details (
  pcd_use_code NUMBER(5) NOT NULL,
  pcd_id NUMBER(3) NOT NULL,
  pcd_pgr_code NUMBER(5) NOT NULL,
  pcd_week_commissions NUMBER(6,2) NOT NULL,
  pcd_week_costs NUMBER(6,2) NOT NULL,
  pcd_week_number NUMBER(2) NOT NULL,
  pcd_week_sales NUMBER(6,2) NOT NULL,
  CONSTRAINT pcd_pk PRIMARY KEY (pcd_use_code,pcd_id),
  CONSTRAINT pcd_pgr_fk FOREIGN KEY (pcd_pgr_code) REFERENCES phenix.product_groups (pgr_code),
  CONSTRAINT pcd_use_fk FOREIGN KEY (pcd_use_code) REFERENCES phenix."USERS" (use_code)
);
COMMENT ON TABLE phenix.product_commission_details IS 'Détails hebdomadaires des commmisions des vendeurs';
COMMENT ON COLUMN phenix.product_commission_details.pcd_use_code IS 'Numéro de l''usager';
COMMENT ON COLUMN phenix.product_commission_details.pcd_id IS 'Numéro de séquence de détail de commission';
COMMENT ON COLUMN phenix.product_commission_details.pcd_pgr_code IS 'Numéro de groupe de produit';
COMMENT ON COLUMN phenix.product_commission_details.pcd_week_commissions IS 'Montant de commission par semaine par produit par client';
COMMENT ON COLUMN phenix.product_commission_details.pcd_week_costs IS 'Coutant des ventes par semaine';
COMMENT ON COLUMN phenix.product_commission_details.pcd_week_number IS 'Numéro de la semaine';
COMMENT ON COLUMN phenix.product_commission_details.pcd_week_sales IS 'Montant des ventes par semaine';