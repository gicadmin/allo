CREATE TABLE phenix.customer_drop_details (
  cdd_cds_vds_id NUMBER(15) NOT NULL,
  cdd_cds_cus_code NUMBER(10) NOT NULL,
  cdd_cds_reference_number VARCHAR2(15 BYTE) NOT NULL,
  cdd_line_number NUMBER(4) NOT NULL,
  cdd_prf_prd_code VARCHAR2(10 BYTE) NOT NULL,
  cdd_prf_fmt_code VARCHAR2(7 BYTE) NOT NULL,
  cdd_cost_price NUMBER(7,2) NOT NULL,
  cdd_original_retail NUMBER(7,2) NOT NULL,
  cdd_selling_retail NUMBER(7,2) NOT NULL,
  cdd_tobacco_tax NUMBER(6,2) NOT NULL,
  cdd_order_quantity NUMBER(7),
  cdd_order_weight NUMBER(8,3),
  cdd_ap_discount_amount NUMBER(7,2) NOT NULL,
  cdd_ap_federal_tax_rate NUMBER(6,3) NOT NULL,
  cdd_ap_provincial_tax_rate NUMBER(6,3) NOT NULL,
  cdd_ar_discount_amount NUMBER(7,2) NOT NULL,
  cdd_ar_federal_tax_rate NUMBER(6,3) NOT NULL,
  cdd_ar_provincial_tax_rate NUMBER(6,3) NOT NULL,
  cdd_original_cost NUMBER(7,2) NOT NULL,
  cdd_number_of_cigars NUMBER(6),
  cdd_selling_before_tobacco_tax NUMBER(7,2),
  cdd_before_tob_tax_incl_fed_tx NUMBER(11,6),
  cdd_selling_bf_tob_per_cigar NUMBER(11,6),
  cdd_taxable_amount_per_cigar NUMBER(11,6),
  cdd_tobacco_tax_per_cigar NUMBER(6,2),
  cdd_tobacco_markup_rate NUMBER(6,3),
  cdd_tobacco_tax_rate NUMBER(6,3),
  cdd_invoiced_ext_price NUMBER(10,2) DEFAULT 0 NOT NULL,
  CONSTRAINT cdd_cigar_ck CHECK (	(	CDD_NUMBER_OF_CIGARS IS NULL
		AND CDD_SELLING_BEFORE_TOBACCO_TAX IS NULL
		AND CDD_BEFORE_TOB_TAX_INCL_FED_TX IS NULL
		AND CDD_SELLING_BF_TOB_PER_CIGAR IS NULL
		AND CDD_TAXABLE_AMOUNT_PER_CIGAR IS NULL
		AND CDD_TOBACCO_TAX_PER_CIGAR IS NULL
		AND CDD_TOBACCO_MARKUP_RATE IS NULL
		AND CDD_TOBACCO_TAX_RATE IS NULL)
	OR
	(	CDD_NUMBER_OF_CIGARS IS NOT NULL
		AND CDD_SELLING_BEFORE_TOBACCO_TAX IS NOT NULL
		AND CDD_BEFORE_TOB_TAX_INCL_FED_TX IS NOT NULL
		AND CDD_SELLING_BF_TOB_PER_CIGAR IS NOT NULL
		AND CDD_TAXABLE_AMOUNT_PER_CIGAR IS NOT NULL
		AND CDD_TOBACCO_TAX_PER_CIGAR IS NOT NULL
		AND CDD_TOBACCO_MARKUP_RATE IS NOT NULL
		AND CDD_TOBACCO_TAX_RATE IS NOT NULL)
),
  CONSTRAINT cdd_pk PRIMARY KEY (cdd_cds_vds_id,cdd_cds_cus_code,cdd_cds_reference_number,cdd_line_number),
  CONSTRAINT cdd_cds_fk FOREIGN KEY (cdd_cds_vds_id,cdd_cds_cus_code,cdd_cds_reference_number) REFERENCES phenix.customer_drop_statements (cds_vds_id,cds_cus_code,cds_reference_number) ON DELETE CASCADE,
  CONSTRAINT cdd_prf_fk FOREIGN KEY (cdd_prf_prd_code,cdd_prf_fmt_code) REFERENCES phenix.product_formats (prf_prd_code,prf_fmt_code)
);
COMMENT ON TABLE phenix.customer_drop_details IS 'Détail de la facture drop clients';
COMMENT ON COLUMN phenix.customer_drop_details.cdd_cds_vds_id IS 'Numéro de facture drop fournisseur';
COMMENT ON COLUMN phenix.customer_drop_details.cdd_cds_cus_code IS 'Numéro de client';
COMMENT ON COLUMN phenix.customer_drop_details.cdd_cds_reference_number IS 'Numéro de référence du document de réception du client';
COMMENT ON COLUMN phenix.customer_drop_details.cdd_line_number IS 'Numéro de ligne';
COMMENT ON COLUMN phenix.customer_drop_details.cdd_prf_prd_code IS 'Code produit';
COMMENT ON COLUMN phenix.customer_drop_details.cdd_prf_fmt_code IS 'Numéro de format';
COMMENT ON COLUMN phenix.customer_drop_details.cdd_cost_price IS 'Prix du coûtant';
COMMENT ON COLUMN phenix.customer_drop_details.cdd_original_retail IS 'Prix de vente avant le processus de fixation des prix';
COMMENT ON COLUMN phenix.customer_drop_details.cdd_selling_retail IS 'Prix de vente après le processus de fixation des prix';
COMMENT ON COLUMN phenix.customer_drop_details.cdd_tobacco_tax IS 'Montant de taxe tabac';
COMMENT ON COLUMN phenix.customer_drop_details.cdd_order_quantity IS 'Quantité commandé';
COMMENT ON COLUMN phenix.customer_drop_details.cdd_order_weight IS 'Poids commandé';
COMMENT ON COLUMN phenix.customer_drop_details.cdd_ap_discount_amount IS 'Montant des ecomptes à l''achat';
COMMENT ON COLUMN phenix.customer_drop_details.cdd_ap_federal_tax_rate IS 'Taux de la taxe fédérale';
COMMENT ON COLUMN phenix.customer_drop_details.cdd_ap_provincial_tax_rate IS 'Taux de la taxe fédérale';
COMMENT ON COLUMN phenix.customer_drop_details.cdd_ar_discount_amount IS 'Montant des ecomptes à la vente';
COMMENT ON COLUMN phenix.customer_drop_details.cdd_ar_federal_tax_rate IS 'Taux de la taxe fédérale';
COMMENT ON COLUMN phenix.customer_drop_details.cdd_ar_provincial_tax_rate IS 'Taux de la taxe fédérale';
COMMENT ON COLUMN phenix.customer_drop_details.cdd_original_cost IS 'Indique le coutant original de la ligne de drop';
COMMENT ON COLUMN phenix.customer_drop_details.cdd_number_of_cigars IS 'Indique le nombre de cigares dans le format commandé';
COMMENT ON COLUMN phenix.customer_drop_details.cdd_selling_before_tobacco_tax IS 'Indique le prix de vente avant la taxe tabac';
COMMENT ON COLUMN phenix.customer_drop_details.cdd_before_tob_tax_incl_fed_tx IS 'Indique le prix de vente avant la taxe tabac (incluant la taxe fédérale)';
COMMENT ON COLUMN phenix.customer_drop_details.cdd_selling_bf_tob_per_cigar IS 'Indique le prix de vente avant la taxe tabac par cigare (incluant la taxe fédérale)';
COMMENT ON COLUMN phenix.customer_drop_details.cdd_taxable_amount_per_cigar IS 'Indique le montant taxable par cigare';
COMMENT ON COLUMN phenix.customer_drop_details.cdd_tobacco_tax_per_cigar IS 'Indique le montant de la taxe tabac calculée par cigare';
COMMENT ON COLUMN phenix.customer_drop_details.cdd_tobacco_markup_rate IS 'Indique le pourcentage de majoration utilisé sur les produits de type cigare';
COMMENT ON COLUMN phenix.customer_drop_details.cdd_tobacco_tax_rate IS 'Indique le pourcentage utilisé pour le calcul de l''impôt applicable par cigare';
COMMENT ON COLUMN phenix.customer_drop_details.cdd_invoiced_ext_price IS 'Indique le montant facturé à la ligne, qté * prix vendant ou poids * prix vendant, arrondi toujours vers le haut, à deux décimales';