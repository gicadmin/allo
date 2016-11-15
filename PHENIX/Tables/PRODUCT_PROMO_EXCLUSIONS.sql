CREATE TABLE phenix.product_promo_exclusions (
  ppe_prd_code VARCHAR2(10 BYTE) NOT NULL,
  ppe_pty_code NUMBER(3) NOT NULL,
  CONSTRAINT ppe_pk PRIMARY KEY (ppe_prd_code,ppe_pty_code),
  CONSTRAINT ppe_prd_fk FOREIGN KEY (ppe_prd_code) REFERENCES phenix.products (prd_code) ON DELETE CASCADE,
  CONSTRAINT ppe_pty_fk FOREIGN KEY (ppe_pty_code) REFERENCES phenix.promotion_types (pty_code)
);
COMMENT ON TABLE phenix.product_promo_exclusions IS 'Identifie les types de promotion exclus pour un produit';
COMMENT ON COLUMN phenix.product_promo_exclusions.ppe_prd_code IS 'Numéro de produit';
COMMENT ON COLUMN phenix.product_promo_exclusions.ppe_pty_code IS 'Numéro de type de promotion';