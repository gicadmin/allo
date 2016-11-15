CREATE TABLE phenix.product_group_promo_exclusions (
  pge_pgr_code NUMBER(5) NOT NULL,
  pge_pty_code NUMBER(3) NOT NULL,
  CONSTRAINT pge_pk PRIMARY KEY (pge_pty_code,pge_pgr_code),
  CONSTRAINT pge_pgr_fk FOREIGN KEY (pge_pgr_code) REFERENCES phenix.product_groups (pgr_code),
  CONSTRAINT pge_pty_fk FOREIGN KEY (pge_pty_code) REFERENCES phenix.promotion_types (pty_code)
);
COMMENT ON TABLE phenix.product_group_promo_exclusions IS 'Identifie les groupes de produit exclus par les promotions';
COMMENT ON COLUMN phenix.product_group_promo_exclusions.pge_pgr_code IS 'Numéro de groupe';
COMMENT ON COLUMN phenix.product_group_promo_exclusions.pge_pty_code IS 'Type de promotion';