CREATE TABLE phenix.customer_adjustment_details (
  cad_id NUMBER(15) NOT NULL,
  cad_cah_id NUMBER(15) NOT NULL,
  cad_inh_id NUMBER(15),
  cad_line_number NUMBER(4) NOT NULL,
  cad_prf_prd_code VARCHAR2(10 BYTE) NOT NULL,
  cad_prf_fmt_code VARCHAR2(7 BYTE) NOT NULL,
  cad_crt_code NUMBER(3) NOT NULL,
  cad_adjusted_retail NUMBER(7,2) NOT NULL,
  cad_approved_switch NUMBER(1) NOT NULL CONSTRAINT cad_approved_switch_ck CHECK (CAD_APPROVED_SWITCH IN (0, 1)),
  cad_cost_price NUMBER(7,2) NOT NULL,
  cad_debit_switch NUMBER(1) NOT NULL CONSTRAINT cad_debit_switch_ck CHECK (CAD_DEBIT_SWITCH IN (0, 1)),
  cad_federal_tax_rate NUMBER(6,3) NOT NULL,
  cad_invoice_cost NUMBER(7,2) NOT NULL,
  cad_original_price NUMBER(7,2) NOT NULL,
  cad_provincial_tax_rate NUMBER(6,3) NOT NULL,
  cad_service_charge NUMBER(7,2) NOT NULL,
  cad_tobacco_tax NUMBER(6,2) NOT NULL,
  cad_cot_cod_coh_id NUMBER(15),
  cad_cot_cod_line_number NUMBER(4),
  cad_cot_line_number NUMBER(4),
  cad_adjusted_quantity NUMBER(7),
  cad_adjusted_weight NUMBER(9,3),
  cad_message VARCHAR2(100 BYTE),
  cad_rma_quantity NUMBER(7),
  cad_rma_weight NUMBER(9,3),
  cad_average_cost_1 NUMBER(7,2) NOT NULL,
  cad_average_cost_2 NUMBER(7,2) NOT NULL,
  cad_average_cost_3 NUMBER(7,2) NOT NULL,
  cad_average_cost_4 NUMBER(7,2) NOT NULL,
  cad_average_list NUMBER(7,2) NOT NULL,
  cad_avg_real_cost_1 NUMBER(7,2) NOT NULL,
  cad_avg_real_cost_2 NUMBER(7,2) NOT NULL,
  cad_avg_real_cost_3 NUMBER(7,2) NOT NULL,
  cad_avg_real_cost_4 NUMBER(7,2) NOT NULL,
  cad_avg_real_list NUMBER(7,2) NOT NULL,
  cad_exact_weight_switch NUMBER(1) DEFAULT 0 NOT NULL,
  cad_receipt_required_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT cad_receipt_required_switch_ck CHECK (CAD_RECEIPT_REQUIRED_SWITCH IN (0, 1)),
  cad_number_of_cigars NUMBER(6),
  cad_selling_before_tobacco_tax NUMBER(7,2),
  cad_before_tob_tax_incl_fed_tx NUMBER(11,6),
  cad_selling_bf_tob_per_cigar NUMBER(11,6),
  cad_taxable_amount_per_cigar NUMBER(11,6),
  cad_tobacco_tax_per_cigar NUMBER(6,2),
  cad_tobacco_markup_rate NUMBER(6,3),
  cad_tobacco_tax_rate NUMBER(6,3),
  cad_credit_prebook_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT cad_credit_prebook_switch_ck CHECK (CAD_CREDIT_PREBOOK_SWITCH IN (0, 1)),
  cad_whs_picking_code VARCHAR2(2 BYTE) NOT NULL,
  cad_surcharge_discount NUMBER(7,2) DEFAULT 0 NOT NULL,
  cad_replacement_list NUMBER(7,2) NOT NULL,
  cad_replacement_cost_1 NUMBER(7,2) NOT NULL,
  cad_replacement_cost_2 NUMBER(7,2) NOT NULL,
  cad_replacement_cost_3 NUMBER(7,2) NOT NULL,
  cad_replacement_cost_4 NUMBER(7,2) NOT NULL,
  cad_invoiced_ext_price NUMBER(10,2) DEFAULT 0 NOT NULL,
  cad_invoiced_ext_surcharge NUMBER(10,2) DEFAULT 0 NOT NULL,
  cad_royalty_amount NUMBER(7,2) DEFAULT 0 NOT NULL,
  CONSTRAINT cad_cigar_ck CHECK (	(	CAD_NUMBER_OF_CIGARS IS NULL
		AND CAD_SELLING_BEFORE_TOBACCO_TAX IS NULL
		AND CAD_BEFORE_TOB_TAX_INCL_FED_TX IS NULL
		AND CAD_SELLING_BF_TOB_PER_CIGAR IS NULL
		AND CAD_TAXABLE_AMOUNT_PER_CIGAR IS NULL
		AND CAD_TOBACCO_TAX_PER_CIGAR IS NULL
		AND CAD_TOBACCO_MARKUP_RATE IS NULL
		AND CAD_TOBACCO_TAX_RATE IS NULL)
	OR
	(	CAD_NUMBER_OF_CIGARS IS NOT NULL
		AND CAD_SELLING_BEFORE_TOBACCO_TAX IS NOT NULL
		AND CAD_BEFORE_TOB_TAX_INCL_FED_TX IS NOT NULL
		AND CAD_SELLING_BF_TOB_PER_CIGAR IS NOT NULL
		AND CAD_TAXABLE_AMOUNT_PER_CIGAR IS NOT NULL
		AND CAD_TOBACCO_TAX_PER_CIGAR IS NOT NULL
		AND CAD_TOBACCO_MARKUP_RATE IS NOT NULL
		AND CAD_TOBACCO_TAX_RATE IS NOT NULL)
),
  CONSTRAINT cad_pk PRIMARY KEY (cad_id),
  CONSTRAINT cad_cah_fk FOREIGN KEY (cad_cah_id) REFERENCES phenix.customer_adjustment_headers (cah_id),
  CONSTRAINT cad_cot_fk FOREIGN KEY (cad_cot_cod_coh_id,cad_cot_cod_line_number,cad_cot_line_number) REFERENCES phenix.customer_order_transactions (cot_cod_coh_id,cot_cod_line_number,cot_line_number),
  CONSTRAINT cad_crt_fk FOREIGN KEY (cad_crt_code) REFERENCES phenix.credit_types (crt_code),
  CONSTRAINT cad_inh_fk FOREIGN KEY (cad_inh_id) REFERENCES phenix.invoice_headers (inh_id),
  CONSTRAINT cad_prf_fk FOREIGN KEY (cad_prf_prd_code,cad_prf_fmt_code) REFERENCES phenix.product_formats (prf_prd_code,prf_fmt_code),
  CONSTRAINT cad_whs_picking_fk FOREIGN KEY (cad_whs_picking_code) REFERENCES phenix.warehouses (whs_code)
);
COMMENT ON TABLE phenix.customer_adjustment_details IS 'Détails des ajustement à la vente (Crédit/Débit)';
COMMENT ON COLUMN phenix.customer_adjustment_details.cad_id IS 'Identifiant unique';
COMMENT ON COLUMN phenix.customer_adjustment_details.cad_cah_id IS 'Identifiant de l''entête';
COMMENT ON COLUMN phenix.customer_adjustment_details.cad_inh_id IS 'Numéro de la demande de facture';
COMMENT ON COLUMN phenix.customer_adjustment_details.cad_line_number IS 'Numéro de ligne de l''ajustement';
COMMENT ON COLUMN phenix.customer_adjustment_details.cad_prf_prd_code IS 'Code du produit';
COMMENT ON COLUMN phenix.customer_adjustment_details.cad_prf_fmt_code IS 'Code du format';
COMMENT ON COLUMN phenix.customer_adjustment_details.cad_crt_code IS 'Code du type de crédit';
COMMENT ON COLUMN phenix.customer_adjustment_details.cad_adjusted_retail IS 'Prix de vente crédité';
COMMENT ON COLUMN phenix.customer_adjustment_details.cad_approved_switch IS 'Indique si la ligne a été approuvé';
COMMENT ON COLUMN phenix.customer_adjustment_details.cad_cost_price IS 'Prix du coûtant';
COMMENT ON COLUMN phenix.customer_adjustment_details.cad_debit_switch IS 'Indique si cest une ligne débit';
COMMENT ON COLUMN phenix.customer_adjustment_details.cad_federal_tax_rate IS 'Taux de la taxe fédérale';
COMMENT ON COLUMN phenix.customer_adjustment_details.cad_invoice_cost IS 'Contient le prix du Grand Livre';
COMMENT ON COLUMN phenix.customer_adjustment_details.cad_original_price IS 'Prix original';
COMMENT ON COLUMN phenix.customer_adjustment_details.cad_provincial_tax_rate IS 'Taux de la taxe provincial';
COMMENT ON COLUMN phenix.customer_adjustment_details.cad_service_charge IS 'Montant du frais de service';
COMMENT ON COLUMN phenix.customer_adjustment_details.cad_tobacco_tax IS 'Montant de taxe tabac';
COMMENT ON COLUMN phenix.customer_adjustment_details.cad_cot_cod_coh_id IS 'Numéro de la commande client';
COMMENT ON COLUMN phenix.customer_adjustment_details.cad_cot_cod_line_number IS 'Numéro de la ligne de la commande client';
COMMENT ON COLUMN phenix.customer_adjustment_details.cad_cot_line_number IS 'Ligne de la transaction client';
COMMENT ON COLUMN phenix.customer_adjustment_details.cad_adjusted_quantity IS 'Quantité crédité';
COMMENT ON COLUMN phenix.customer_adjustment_details.cad_adjusted_weight IS 'Poids crédité';
COMMENT ON COLUMN phenix.customer_adjustment_details.cad_message IS 'Message de la ligne';
COMMENT ON COLUMN phenix.customer_adjustment_details.cad_rma_quantity IS 'Quantité à recevoir';
COMMENT ON COLUMN phenix.customer_adjustment_details.cad_rma_weight IS 'Poids à recevoir';
COMMENT ON COLUMN phenix.customer_adjustment_details.cad_average_cost_1 IS 'Moyenne des prix du coûtant 1';
COMMENT ON COLUMN phenix.customer_adjustment_details.cad_average_cost_2 IS 'Moyenne des prix du coûtant 2';
COMMENT ON COLUMN phenix.customer_adjustment_details.cad_average_cost_3 IS 'Moyenne des prix du coûtant 3';
COMMENT ON COLUMN phenix.customer_adjustment_details.cad_average_cost_4 IS 'Moyenne des prix du coûtant 4';
COMMENT ON COLUMN phenix.customer_adjustment_details.cad_average_list IS 'Moyenne des prix de liste du manufacturier';
COMMENT ON COLUMN phenix.customer_adjustment_details.cad_avg_real_cost_1 IS 'Vraie moyenne des prix du coûtant 1';
COMMENT ON COLUMN phenix.customer_adjustment_details.cad_avg_real_cost_2 IS 'Vraie moyenne des prix du coûtant 2';
COMMENT ON COLUMN phenix.customer_adjustment_details.cad_avg_real_cost_3 IS 'Vraie moyenne des prix du coûtant 3';
COMMENT ON COLUMN phenix.customer_adjustment_details.cad_avg_real_cost_4 IS 'Vraie moyenne des prix du coûtant 4';
COMMENT ON COLUMN phenix.customer_adjustment_details.cad_avg_real_list IS 'Vrai moyenne des prix de liste du manufacturier';
COMMENT ON COLUMN phenix.customer_adjustment_details.cad_exact_weight_switch IS 'Indique que le poids total de la facture initiale sera remboursé (peu importe quelques différences de poids ou pas). S''applique au produit de type ''D'' et ''F'' seulement, lorsqu''il y a retour du format facturé.';
COMMENT ON COLUMN phenix.customer_adjustment_details.cad_receipt_required_switch IS 'Indique si une réception est requise pour l''ajustement de crédit';
COMMENT ON COLUMN phenix.customer_adjustment_details.cad_number_of_cigars IS 'Indique le nombre de cigares dans le format commandé';
COMMENT ON COLUMN phenix.customer_adjustment_details.cad_selling_before_tobacco_tax IS 'Indique le prix de vente avant la taxe tabac';
COMMENT ON COLUMN phenix.customer_adjustment_details.cad_before_tob_tax_incl_fed_tx IS 'Indique le prix de vente avant la taxe tabac (incluant la taxe fédérale)';
COMMENT ON COLUMN phenix.customer_adjustment_details.cad_selling_bf_tob_per_cigar IS 'Indique le prix de vente avant la taxe tabac par cigare';
COMMENT ON COLUMN phenix.customer_adjustment_details.cad_taxable_amount_per_cigar IS 'Indique le montant taxable par cigare';
COMMENT ON COLUMN phenix.customer_adjustment_details.cad_tobacco_tax_per_cigar IS 'Indique le montant de la taxe tabac calculée par cigare';
COMMENT ON COLUMN phenix.customer_adjustment_details.cad_tobacco_markup_rate IS 'Indique le pourcentage de majoration utilisé sur les produits de type cigare';
COMMENT ON COLUMN phenix.customer_adjustment_details.cad_tobacco_tax_rate IS 'Indique le pourcentage utilisé pour le calcul de l''impôt applicable par cigare';
COMMENT ON COLUMN phenix.customer_adjustment_details.cad_credit_prebook_switch IS 'Indique si on retourne la quantité ou poids dans la commande de réservation lors de la génération d''un crédit';
COMMENT ON COLUMN phenix.customer_adjustment_details.cad_whs_picking_code IS 'Indique l''entrepôt associé à la cueillette de la ligne ';
COMMENT ON COLUMN phenix.customer_adjustment_details.cad_surcharge_discount IS 'Indique les frais d''administration à créditer OU À DÉBITER selon la surcharge sur bas de facture définie dans les escomptes';
COMMENT ON COLUMN phenix.customer_adjustment_details.cad_replacement_list IS 'Indique le coûtant liste si on commandait le produit maintenant, calculé selon la routine de prix aux achats.';
COMMENT ON COLUMN phenix.customer_adjustment_details.cad_replacement_cost_1 IS 'Indique le coûtant 1 si on commandait le produit maintenant, calculé selon la routine de prix aux achats.';
COMMENT ON COLUMN phenix.customer_adjustment_details.cad_replacement_cost_2 IS 'Indique le coûtant 2 si on commandait le produit maintenant, calculé selon la routine de prix aux achats.';
COMMENT ON COLUMN phenix.customer_adjustment_details.cad_replacement_cost_3 IS 'Indique le coûtant 3 si on commandait le produit maintenant, calculé selon la routine de prix aux achats.';
COMMENT ON COLUMN phenix.customer_adjustment_details.cad_replacement_cost_4 IS 'Indique le coûtant 4 si on commandait le produit maintenant, calculé selon la routine de prix aux achats.';
COMMENT ON COLUMN phenix.customer_adjustment_details.cad_invoiced_ext_price IS 'Indique le montant facturé à la ligne, qté * prix vendant ou poids * prix vendant, arrondi toujours vers le haut, à deux décimales';
COMMENT ON COLUMN phenix.customer_adjustment_details.cad_invoiced_ext_surcharge IS 'Indique le montant facturé à la ligne, qté * surcharge ou poids * surcharge, arrondi toujours vers le haut, à deux décimales';
COMMENT ON COLUMN phenix.customer_adjustment_details.cad_royalty_amount IS 'Indique le montant de royauté sur la ligne de crédit / débit';