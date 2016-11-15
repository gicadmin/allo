CREATE TABLE phenix.customer_adjustment_consigns (
  cac_cad_id NUMBER(15) NOT NULL,
  cac_sequence NUMBER(2) NOT NULL,
  cac_prf_prd_code VARCHAR2(10 BYTE) NOT NULL,
  cac_prf_fmt_code VARCHAR2(7 BYTE) NOT NULL,
  cac_cost_price NUMBER(7,2) NOT NULL,
  cac_quantity NUMBER(7) NOT NULL,
  cac_selling_price NUMBER(7,2) NOT NULL,
  cac_federal_tax_rate NUMBER(6,3) DEFAULT 0 NOT NULL,
  cac_provincial_tax_rate NUMBER(6,3) DEFAULT 0 NOT NULL,
  cac_invoiced_ext_price NUMBER(10,2) DEFAULT 0 NOT NULL,
  CONSTRAINT cac_pk PRIMARY KEY (cac_cad_id,cac_sequence),
  CONSTRAINT cac_cad_fk FOREIGN KEY (cac_cad_id) REFERENCES phenix.customer_adjustment_details (cad_id) ON DELETE CASCADE,
  CONSTRAINT cac_prf_fk FOREIGN KEY (cac_prf_prd_code,cac_prf_fmt_code) REFERENCES phenix.product_formats (prf_prd_code,prf_fmt_code)
);
COMMENT ON TABLE phenix.customer_adjustment_consigns IS 'Cette table contient les détails de consignes associé au produit';
COMMENT ON COLUMN phenix.customer_adjustment_consigns.cac_cad_id IS 'Identifiant unique des détails';
COMMENT ON COLUMN phenix.customer_adjustment_consigns.cac_sequence IS 'Numéro préservant la séquence des consignes';
COMMENT ON COLUMN phenix.customer_adjustment_consigns.cac_prf_prd_code IS 'Numéro du produit';
COMMENT ON COLUMN phenix.customer_adjustment_consigns.cac_prf_fmt_code IS 'Numéro du format';
COMMENT ON COLUMN phenix.customer_adjustment_consigns.cac_cost_price IS 'Prix du coûtant';
COMMENT ON COLUMN phenix.customer_adjustment_consigns.cac_quantity IS 'Quantité de la consigne';
COMMENT ON COLUMN phenix.customer_adjustment_consigns.cac_selling_price IS 'Prix de vente';
COMMENT ON COLUMN phenix.customer_adjustment_consigns.cac_federal_tax_rate IS 'Indique le taux de taxe fédérale appliqué ';
COMMENT ON COLUMN phenix.customer_adjustment_consigns.cac_provincial_tax_rate IS 'Indique le taux de taxe provinciale appliqué ';
COMMENT ON COLUMN phenix.customer_adjustment_consigns.cac_invoiced_ext_price IS 'Indique le montant facturé à la ligne, qté * prix vendant, arrondi toujours vers le haut, à deux décimales';