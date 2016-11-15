CREATE TABLE phenix.vendor_purchase_cycles (
  vpc_ven_code NUMBER(5) NOT NULL,
  vpc_pcy_week NUMBER(1) NOT NULL CONSTRAINT vpc_pcy_week_ck CHECK (VPC_PCY_WEEK IN (1, 2, 3, 4, 5)),
  vpc_pcy_day NUMBER(1) NOT NULL CONSTRAINT vpc_pcy_day_ck CHECK (VPC_PCY_DAY IN (2, 6, 5, 9, 7, 8, 3, 4, 1)),
  CONSTRAINT vpc_pk PRIMARY KEY (vpc_ven_code,vpc_pcy_day,vpc_pcy_week),
  CONSTRAINT vpc_ven_fk FOREIGN KEY (vpc_ven_code) REFERENCES phenix.vendors (ven_code) ON DELETE CASCADE
);
COMMENT ON TABLE phenix.vendor_purchase_cycles IS 'Indique les cycles d''achat pour les fournisseurs';
COMMENT ON COLUMN phenix.vendor_purchase_cycles.vpc_ven_code IS 'Numéro du fournisseur';
COMMENT ON COLUMN phenix.vendor_purchase_cycles.vpc_pcy_week IS 'Semaine';
COMMENT ON COLUMN phenix.vendor_purchase_cycles.vpc_pcy_day IS 'Jour';