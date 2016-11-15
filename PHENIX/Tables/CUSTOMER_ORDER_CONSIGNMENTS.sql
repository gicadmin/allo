CREATE TABLE phenix.customer_order_consignments (
  coc_cot_cod_coh_id NUMBER(15) NOT NULL,
  coc_cot_cod_line_number NUMBER(4) NOT NULL,
  coc_cot_line_number NUMBER(4) NOT NULL,
  coc_sequence NUMBER(2) NOT NULL,
  coc_prf_prd_code VARCHAR2(10 BYTE) NOT NULL,
  coc_prf_fmt_code VARCHAR2(7 BYTE) NOT NULL,
  coc_cost_price NUMBER(7,2) NOT NULL,
  coc_quantity NUMBER(7) NOT NULL,
  coc_selling_price NUMBER(7,2) NOT NULL,
  coc_federal_tax_rate NUMBER(6,3) DEFAULT 0 NOT NULL,
  coc_provincial_tax_rate NUMBER(6,3) DEFAULT 0 NOT NULL,
  coc_invoiced_ext_price NUMBER(10,2) DEFAULT 0 NOT NULL,
  CONSTRAINT coc_pk PRIMARY KEY (coc_cot_cod_coh_id,coc_cot_cod_line_number,coc_cot_line_number,coc_sequence),
  CONSTRAINT coc_cot_fk FOREIGN KEY (coc_cot_cod_coh_id,coc_cot_cod_line_number,coc_cot_line_number) REFERENCES phenix.customer_order_transactions (cot_cod_coh_id,cot_cod_line_number,cot_line_number) ON DELETE CASCADE,
  CONSTRAINT coc_prf_fk FOREIGN KEY (coc_prf_prd_code,coc_prf_fmt_code) REFERENCES phenix.product_formats (prf_prd_code,prf_fmt_code)
);
COMMENT ON TABLE phenix.customer_order_consignments IS 'Cette table contient les détails de consignes associé au produit';
COMMENT ON COLUMN phenix.customer_order_consignments.coc_cot_cod_coh_id IS 'Numéro de l''entête de la commande';
COMMENT ON COLUMN phenix.customer_order_consignments.coc_cot_cod_line_number IS 'Numéro de la ligne de commande';
COMMENT ON COLUMN phenix.customer_order_consignments.coc_cot_line_number IS 'Numéro de la ligne de transaction';
COMMENT ON COLUMN phenix.customer_order_consignments.coc_sequence IS 'Numéro préservant la séquence des consignes';
COMMENT ON COLUMN phenix.customer_order_consignments.coc_prf_prd_code IS 'Numéro de produit';
COMMENT ON COLUMN phenix.customer_order_consignments.coc_prf_fmt_code IS 'Numéro du format';
COMMENT ON COLUMN phenix.customer_order_consignments.coc_cost_price IS 'Prix du coûtant';
COMMENT ON COLUMN phenix.customer_order_consignments.coc_quantity IS 'Quantité de la consigne';
COMMENT ON COLUMN phenix.customer_order_consignments.coc_selling_price IS 'Prix de vente';
COMMENT ON COLUMN phenix.customer_order_consignments.coc_federal_tax_rate IS 'Indique le taux de taxe fédérale appliqué ';
COMMENT ON COLUMN phenix.customer_order_consignments.coc_provincial_tax_rate IS 'Indique le taux de taxe provinciale appliqué ';
COMMENT ON COLUMN phenix.customer_order_consignments.coc_invoiced_ext_price IS 'Indique le montant facturé à la ligne, qté * prix vendant ou poids * prix vendant, arrondi toujours vers le haut, à deux décimales';