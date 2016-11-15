CREATE TABLE phenix.vendor_rcl_exclusions (
  vrc_ven_code NUMBER(5) NOT NULL,
  vrc_rcl_id NUMBER(6) NOT NULL,
  vrc_drop_end_date DATE,
  CONSTRAINT vrc_pk PRIMARY KEY (vrc_ven_code,vrc_rcl_id),
  CONSTRAINT vrc_rcl_fk FOREIGN KEY (vrc_rcl_id) REFERENCES phenix.retail_clients (rcl_id),
  CONSTRAINT vrc_ven_fk FOREIGN KEY (vrc_ven_code) REFERENCES phenix.vendors (ven_code) ON DELETE CASCADE
);
COMMENT ON COLUMN phenix.vendor_rcl_exclusions.vrc_ven_code IS 'Numéro du fournisseur';
COMMENT ON COLUMN phenix.vendor_rcl_exclusions.vrc_rcl_id IS 'Code du détaillant lié au fournisseur';
COMMENT ON COLUMN phenix.vendor_rcl_exclusions.vrc_drop_end_date IS 'Date de fin d''acceptation de la livraison indirecte';