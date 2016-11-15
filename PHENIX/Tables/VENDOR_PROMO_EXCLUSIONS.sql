CREATE TABLE phenix.vendor_promo_exclusions (
  vpe_pty_code NUMBER(3) NOT NULL,
  vpe_ven_code NUMBER(5) NOT NULL,
  CONSTRAINT vpe_pk PRIMARY KEY (vpe_pty_code,vpe_ven_code),
  CONSTRAINT vpe_pty_fk FOREIGN KEY (vpe_pty_code) REFERENCES phenix.promotion_types (pty_code),
  CONSTRAINT vpe_ven_fk FOREIGN KEY (vpe_ven_code) REFERENCES phenix.vendors (ven_code)
);
COMMENT ON TABLE phenix.vendor_promo_exclusions IS 'Identifie les types de promotion exclue pour un fournisseur';
COMMENT ON COLUMN phenix.vendor_promo_exclusions.vpe_pty_code IS 'Numéro de type de promotion';
COMMENT ON COLUMN phenix.vendor_promo_exclusions.vpe_ven_code IS 'Numéro du fournisseur';