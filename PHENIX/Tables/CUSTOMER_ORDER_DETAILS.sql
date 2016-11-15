CREATE TABLE phenix.customer_order_details (
  cod_coh_id NUMBER(15) NOT NULL,
  cod_line_number NUMBER(4) NOT NULL,
  cod_prf_prd_code VARCHAR2(10 BYTE) NOT NULL,
  cod_prf_fmt_code VARCHAR2(7 BYTE) NOT NULL,
  cod_base_selling_cost NUMBER(7,2) NOT NULL,
  cod_cost_price NUMBER(7,2) NOT NULL,
  cod_open_switch NUMBER(1) NOT NULL CONSTRAINT cod_open_switch_ck CHECK (COD_OPEN_SWITCH IN (0, 1)),
  cod_order_type VARCHAR2(2 BYTE) NOT NULL CONSTRAINT cod_order_type_ck CHECK (COD_ORDER_TYPE IN ('RG', 'PB', 'SP', 'IN')),
  cod_original_retail NUMBER(7,2) NOT NULL,
  cod_prebook_method VARCHAR2(2 BYTE) NOT NULL CONSTRAINT cod_prebook_method_ck CHECK (COD_PREBOOK_METHOD IN ('NA', 'FD', 'DC')),
  cod_pricing_source VARCHAR2(2 BYTE) NOT NULL CONSTRAINT cod_pricing_source_ck CHECK (COD_PRICING_SOURCE IN ('RG', 'PR', 'DI', 'QO', 'PB', 'OV', 'MP')),
  cod_project_delivery_date DATE NOT NULL CONSTRAINT cod_project_delivery_date_ck CHECK (COD_PROJECT_DELIVERY_DATE = TRUNC(COD_PROJECT_DELIVERY_DATE)),
  cod_promotion_amount NUMBER(7,2) NOT NULL,
  cod_selling_retail NUMBER(7,2) NOT NULL,
  cod_spec_order_status VARCHAR2(2 BYTE) NOT NULL CONSTRAINT cod_spec_order_status_ck CHECK (COD_SPEC_ORDER_STATUS IN ('NA', 'PR', 'OR', 'RC', 'PK')),
  cod_surcharge NUMBER(7,2) NOT NULL,
  cod_tobacco_tax NUMBER(6,2) NOT NULL,
  cod_cod_coh_id NUMBER(15),
  cod_cod_line_number NUMBER(4),
  cod_fmt_code_srp VARCHAR2(7 BYTE),
  cod_pod_poh_id NUMBER(15),
  cod_pod_line_number NUMBER(4),
  cod_prf_prd_original_code VARCHAR2(10 BYTE),
  cod_prf_fmt_original_code VARCHAR2(7 BYTE),
  cod_pty_code NUMBER(3),
  cod_leftover_quantity NUMBER(7),
  cod_leftover_weight NUMBER(8,3),
  cod_message VARCHAR2(100 BYTE),
  cod_order_quantity NUMBER(7),
  cod_order_weight NUMBER(8,3),
  cod_price_srp NUMBER(7,2),
  cod_quantity_srp NUMBER(4),
  cod_average_cost_1 NUMBER(7,2) NOT NULL,
  cod_average_cost_2 NUMBER(7,2) NOT NULL,
  cod_average_cost_3 NUMBER(7,2) NOT NULL,
  cod_average_cost_4 NUMBER(7,2) NOT NULL,
  cod_average_list NUMBER(7,2) NOT NULL,
  cod_avg_real_cost_1 NUMBER(7,2) NOT NULL,
  cod_avg_real_cost_2 NUMBER(7,2) NOT NULL,
  cod_avg_real_cost_3 NUMBER(7,2) NOT NULL,
  cod_avg_real_cost_4 NUMBER(7,2) NOT NULL,
  cod_avg_real_list NUMBER(7,2) NOT NULL,
  cod_use_code NUMBER(5) NOT NULL,
  cod_use_telemark_code NUMBER(5),
  cod_prebook_weeks NUMBER(2),
  cod_pre_printed_switch NUMBER(1) DEFAULT 1 NOT NULL,
  cod_customer_product_code VARCHAR2(10 BYTE),
  cod_customer_product_location VARCHAR2(8 BYTE),
  cod_reserved_quantity NUMBER(7),
  cod_reserved_weight NUMBER(8,3),
  cod_customer_po_number VARCHAR2(15 BYTE),
  cod_indirect_delivery_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT cod_indirect_delivery_swi_ck CHECK (COD_INDIRECT_DELIVERY_SWITCH IN (0, 1)),
  cod_show_spec_prebook_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT cod_show_spec_prebook_swi_ck CHECK (COD_SHOW_SPEC_PREBOOK_SWITCH IN (0, 1)),
  cod_show_spec_fusion_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT cod_show_spec_fusion_swi_ck CHECK (COD_SHOW_SPEC_FUSION_SWITCH IN (0, 1)),
  cod_customer_po_line NUMBER(4),
  cod_shr_code NUMBER(3),
  cod_pre_print_in_proc_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT cod_pre_print_in_proc_sw_ck CHECK (COD_PRE_PRINT_IN_PROC_SWITCH IN (0, 1)),
  cod_creation_date DATE DEFAULT SYSDATE NOT NULL,
  cod_first_reservation_date DATE,
  cod_credit_promotion_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT cod_credit_promotion_swi_ck CHECK (COD_CREDIT_PROMOTION_SWITCH in (0, 1)),
  cod_credit_rebate_amount NUMBER(7,2) DEFAULT 0 NOT NULL,
  cod_car_amount NUMBER(7,2) DEFAULT 0 NOT NULL,
  cod_number_of_cigars NUMBER(6),
  cod_selling_before_tobacco_tax NUMBER(7,2),
  cod_before_tob_tax_incl_fed_tx NUMBER(11,6),
  cod_selling_bf_tob_per_cigar NUMBER(11,6),
  cod_taxable_amount_per_cigar NUMBER(11,6),
  cod_tobacco_tax_per_cigar NUMBER(6,2),
  cod_tobacco_markup_rate NUMBER(6,3),
  cod_tobacco_tax_rate NUMBER(6,3),
  cod_whs_picking_code VARCHAR2(2 BYTE) NOT NULL,
  cod_car_cpr_id NUMBER(15),
  cod_freegood_rebill_amount NUMBER(7,2) DEFAULT 0 NOT NULL,
  cod_freegood_message VARCHAR2(100 BYTE),
  cod_freegood_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT cod_freegood_switch_ck CHECK (cod_freegood_switch IN (0, 1)),
  cod_replacement_list NUMBER(7,2) NOT NULL,
  cod_replacement_cost_1 NUMBER(7,2) NOT NULL,
  cod_replacement_cost_2 NUMBER(7,2) NOT NULL,
  cod_replacement_cost_3 NUMBER(7,2) NOT NULL,
  cod_replacement_cost_4 NUMBER(7,2) NOT NULL,
  cod_selling_retail_orig NUMBER(7,2),
  cod_pricing_source_orig VARCHAR2(2 BYTE) CONSTRAINT cod_pricing_source_orig_ck CHECK (cod_pricing_source_orig IN ('RG', 'PR', 'DI', 'QO', 'PB', 'OV', 'MP')
	),
  cod_use_override_code NUMBER(5),
  cod_royalty_amount NUMBER(7,2) DEFAULT 0 NOT NULL,
  cod_order_source VARCHAR2(4 BYTE) DEFAULT 'LOAD' NOT NULL CONSTRAINT cod_order_source_ck CHECK (COD_ORDER_SOURCE IN ('EDI','EDIE','TEL','SAL','CASH','MSIL','MSIS','TELX','LOGI','SHOW','FXPB','LIND','LIQU','SALO', 'LOAD','PROC')),
  cod_desired_quantity NUMBER(7),
  cod_desired_weight NUMBER(8,3),
  cod_invoiced_ext_price NUMBER(10,2) DEFAULT 0 NOT NULL,
  cod_division_order_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT cod_division_order_switch_ck CHECK (COD_DIVISION_ORDER_SWITCH IN (0, 1)),
  cod_invoiced_ext_surcharge NUMBER(10,2) DEFAULT 0 NOT NULL,
  cod_cash_and_carry_weight NUMBER(8,3),
  cod_vsi_original_code NUMBER(10),
  cod_sio_distributed_amount NUMBER(7,2),
  cod_sio_freegood_quantity NUMBER(7),
  cod_sio_collected_amount NUMBER(7,2),
  cod_vsi_code NUMBER(10),
  cod_cod_shorted_coh_id NUMBER(15),
  cod_cod_shorted_line_number NUMBER(4),
  cod_subst_inv_quantity NUMBER(7),
  cod_subst_inv_weight NUMBER(8,3),
  CONSTRAINT cod_cigar_ck CHECK (	(	COD_NUMBER_OF_CIGARS IS NULL
		AND COD_SELLING_BEFORE_TOBACCO_TAX IS NULL
		AND COD_BEFORE_TOB_TAX_INCL_FED_TX IS NULL
		AND COD_SELLING_BF_TOB_PER_CIGAR IS NULL
		AND COD_TAXABLE_AMOUNT_PER_CIGAR IS NULL
		AND COD_TOBACCO_TAX_PER_CIGAR IS NULL
		AND COD_TOBACCO_MARKUP_RATE IS NULL
		AND COD_TOBACCO_TAX_RATE IS NULL)
	OR
	(	COD_NUMBER_OF_CIGARS IS NOT NULL
		AND COD_SELLING_BEFORE_TOBACCO_TAX IS NOT NULL
		AND COD_BEFORE_TOB_TAX_INCL_FED_TX IS NOT NULL
		AND COD_SELLING_BF_TOB_PER_CIGAR IS NOT NULL
		AND COD_TAXABLE_AMOUNT_PER_CIGAR IS NOT NULL
		AND COD_TOBACCO_TAX_PER_CIGAR IS NOT NULL
		AND COD_TOBACCO_MARKUP_RATE IS NOT NULL
		AND COD_TOBACCO_TAX_RATE IS NOT NULL)
),
  CONSTRAINT cod_pk PRIMARY KEY (cod_coh_id,cod_line_number),
  CONSTRAINT cod_car_cpr_id_fk FOREIGN KEY (cod_car_cpr_id) REFERENCES phenix.customer_promotions (cpr_id),
  CONSTRAINT cod_cod_fk FOREIGN KEY (cod_cod_coh_id,cod_cod_line_number) REFERENCES phenix.customer_order_details (cod_coh_id,cod_line_number),
  CONSTRAINT cod_cod_shorted_fk FOREIGN KEY (cod_cod_shorted_coh_id,cod_cod_shorted_line_number) REFERENCES phenix.customer_order_details (cod_coh_id,cod_line_number),
  CONSTRAINT cod_coh_fk FOREIGN KEY (cod_coh_id) REFERENCES phenix.customer_order_headers (coh_id),
  CONSTRAINT cod_fmt_fk FOREIGN KEY (cod_fmt_code_srp) REFERENCES phenix.formats (fmt_code),
  CONSTRAINT cod_pod_fk FOREIGN KEY (cod_pod_poh_id,cod_pod_line_number) REFERENCES phenix.purchase_order_details (pod_poh_id,pod_line_number),
  CONSTRAINT cod_prf_fk FOREIGN KEY (cod_prf_prd_code,cod_prf_fmt_code) REFERENCES phenix.product_formats (prf_prd_code,prf_fmt_code),
  CONSTRAINT cod_prf_original_fk FOREIGN KEY (cod_prf_prd_original_code,cod_prf_fmt_original_code) REFERENCES phenix.product_formats (prf_prd_code,prf_fmt_code),
  CONSTRAINT cod_pty_fk FOREIGN KEY (cod_pty_code) REFERENCES phenix.promotion_types (pty_code),
  CONSTRAINT cod_shr_code_fk FOREIGN KEY (cod_shr_code) REFERENCES phenix.shorted_reasons (shr_code),
  CONSTRAINT cod_use_fk FOREIGN KEY (cod_use_code) REFERENCES phenix."USERS" (use_code),
  CONSTRAINT cod_use_telemark_fk FOREIGN KEY (cod_use_telemark_code) REFERENCES phenix."USERS" (use_code),
  CONSTRAINT cod_vsi_fk FOREIGN KEY (cod_vsi_code) REFERENCES phenix.vendor_sales_incentives (vsi_code),
  CONSTRAINT cod_whs_picking_fk FOREIGN KEY (cod_whs_picking_code) REFERENCES phenix.warehouses (whs_code)
);
COMMENT ON TABLE phenix.customer_order_details IS 'Détails d''une commande client';
COMMENT ON COLUMN phenix.customer_order_details.cod_coh_id IS 'Numéro de la commande';
COMMENT ON COLUMN phenix.customer_order_details.cod_line_number IS 'Ligne de commande';
COMMENT ON COLUMN phenix.customer_order_details.cod_prf_prd_code IS 'Code produit';
COMMENT ON COLUMN phenix.customer_order_details.cod_prf_fmt_code IS 'Numéro de format';
COMMENT ON COLUMN phenix.customer_order_details.cod_base_selling_cost IS 'Coût servant pour le calcul des coûtants plus';
COMMENT ON COLUMN phenix.customer_order_details.cod_cost_price IS 'Prix du coûtant';
COMMENT ON COLUMN phenix.customer_order_details.cod_open_switch IS 'Status de la ligne';
COMMENT ON COLUMN phenix.customer_order_details.cod_order_type IS 'Type de la ligne';
COMMENT ON COLUMN phenix.customer_order_details.cod_original_retail IS 'Prix de vente avant le processus de fixation des prix';
COMMENT ON COLUMN phenix.customer_order_details.cod_prebook_method IS 'Méthode selon laquelle la commande bulletin est effectuée';
COMMENT ON COLUMN phenix.customer_order_details.cod_pricing_source IS 'Source du prix';
COMMENT ON COLUMN phenix.customer_order_details.cod_project_delivery_date IS 'Date de livraison projetée';
COMMENT ON COLUMN phenix.customer_order_details.cod_promotion_amount IS 'Montant des promotions';
COMMENT ON COLUMN phenix.customer_order_details.cod_selling_retail IS 'Prix de vente après le processus de fixation des prix';
COMMENT ON COLUMN phenix.customer_order_details.cod_spec_order_status IS 'Status de la commande spéciale';
COMMENT ON COLUMN phenix.customer_order_details.cod_surcharge IS 'Supplément monétaire';
COMMENT ON COLUMN phenix.customer_order_details.cod_tobacco_tax IS 'Montant de taxe tabac';
COMMENT ON COLUMN phenix.customer_order_details.cod_cod_coh_id IS 'Numéro de la commande dont cette ligne fait référence';
COMMENT ON COLUMN phenix.customer_order_details.cod_cod_line_number IS 'Numéro de la ligne dont cette ligne fait référence';
COMMENT ON COLUMN phenix.customer_order_details.cod_fmt_code_srp IS 'Format du prix de détail suggéré';
COMMENT ON COLUMN phenix.customer_order_details.cod_pod_poh_id IS 'Numéro de la facture de commande d''achat';
COMMENT ON COLUMN phenix.customer_order_details.cod_pod_line_number IS 'Numéro de la ligne de commande d''achat';
COMMENT ON COLUMN phenix.customer_order_details.cod_prf_prd_original_code IS 'Code produit original (si subsitution)';
COMMENT ON COLUMN phenix.customer_order_details.cod_prf_fmt_original_code IS 'Code format original (si subsitution)';
COMMENT ON COLUMN phenix.customer_order_details.cod_pty_code IS 'Numéro du type de promotion';
COMMENT ON COLUMN phenix.customer_order_details.cod_leftover_quantity IS 'Quantité restante d''une commande';
COMMENT ON COLUMN phenix.customer_order_details.cod_leftover_weight IS 'Poids restant d''une commande';
COMMENT ON COLUMN phenix.customer_order_details.cod_message IS 'Message du détail de la commande client';
COMMENT ON COLUMN phenix.customer_order_details.cod_order_quantity IS 'Quantité commandé';
COMMENT ON COLUMN phenix.customer_order_details.cod_order_weight IS 'Poids commandé';
COMMENT ON COLUMN phenix.customer_order_details.cod_price_srp IS 'Prix de détail suggéré';
COMMENT ON COLUMN phenix.customer_order_details.cod_quantity_srp IS 'Quantité du prix de détail suggéré';
COMMENT ON COLUMN phenix.customer_order_details.cod_average_cost_1 IS 'Moyenne des prix du coûtant 1';
COMMENT ON COLUMN phenix.customer_order_details.cod_average_cost_2 IS 'Moyenne des prix du coûtant 2';
COMMENT ON COLUMN phenix.customer_order_details.cod_average_cost_3 IS 'Moyenne des prix du coûtant 3';
COMMENT ON COLUMN phenix.customer_order_details.cod_average_cost_4 IS 'Moyenne des prix du coûtant 4';
COMMENT ON COLUMN phenix.customer_order_details.cod_average_list IS 'Moyenne des prix de liste du manufacturier';
COMMENT ON COLUMN phenix.customer_order_details.cod_avg_real_cost_1 IS 'Vraie moyenne des prix du coûtant 1';
COMMENT ON COLUMN phenix.customer_order_details.cod_avg_real_cost_2 IS 'Vraie moyenne des prix du coûtant 2';
COMMENT ON COLUMN phenix.customer_order_details.cod_avg_real_cost_3 IS 'Vraie moyenne des prix du coûtant 3';
COMMENT ON COLUMN phenix.customer_order_details.cod_avg_real_cost_4 IS 'Vraie moyenne des prix du coûtant 4';
COMMENT ON COLUMN phenix.customer_order_details.cod_avg_real_list IS 'Vrai moyenne des prix de liste du manufacturier';
COMMENT ON COLUMN phenix.customer_order_details.cod_use_code IS 'Numéro de l''usager';
COMMENT ON COLUMN phenix.customer_order_details.cod_use_telemark_code IS 'Numéro de l''usager (Télémarking)';
COMMENT ON COLUMN phenix.customer_order_details.cod_prebook_weeks IS 'Indique sur combien de semaine sera répartie la pige';
COMMENT ON COLUMN phenix.customer_order_details.cod_pre_printed_switch IS 'Indique si la ligne a déjà été imprimée pour le pré-préparation';
COMMENT ON COLUMN phenix.customer_order_details.cod_customer_product_code IS 'Numero du client pour le produit';
COMMENT ON COLUMN phenix.customer_order_details.cod_customer_product_location IS 'Code de lendroit ou se trouve le produit defini par le client';
COMMENT ON COLUMN phenix.customer_order_details.cod_reserved_quantity IS 'Indique la quantité réservée pour cette ligne durant le partage des quantités disponibles';
COMMENT ON COLUMN phenix.customer_order_details.cod_reserved_weight IS 'Indique le poids réservé pour cette ligne durant le partage des poids disponibles';
COMMENT ON COLUMN phenix.customer_order_details.cod_customer_po_number IS 'Numéro de la commande d''achat du client';
COMMENT ON COLUMN phenix.customer_order_details.cod_indirect_delivery_switch IS 'Type du retour fournisseur';
COMMENT ON COLUMN phenix.customer_order_details.cod_show_spec_prebook_switch IS 'Indique que cette ligne de commande spécial agit comme une ligne de réservation du SHOW. Elle ne sera jamais livrée directement et devra être fusionnée.';
COMMENT ON COLUMN phenix.customer_order_details.cod_show_spec_fusion_switch IS 'Indique que cette ligne de commande spécial est la fusion d''une réservation spéciale du show. Elle n''est plus modifiable une fois créée, sauf dans le popup de fusion.';
COMMENT ON COLUMN phenix.customer_order_details.cod_shr_code IS 'Code des explications des "À court"';
COMMENT ON COLUMN phenix.customer_order_details.cod_pre_print_in_proc_switch IS 'Indique si la ligne est en processus dans le rapport de préparation des viandes';
COMMENT ON COLUMN phenix.customer_order_details.cod_creation_date IS 'Date de création';
COMMENT ON COLUMN phenix.customer_order_details.cod_first_reservation_date IS 'Date de réservation';
COMMENT ON COLUMN phenix.customer_order_details.cod_credit_promotion_switch IS 'Indique si la promotion sera créditée';
COMMENT ON COLUMN phenix.customer_order_details.cod_credit_rebate_amount IS 'Indique le montant du rabais volume qui sera crédité';
COMMENT ON COLUMN phenix.customer_order_details.cod_car_amount IS 'Indique le montant du compteur ("count and recount")';
COMMENT ON COLUMN phenix.customer_order_details.cod_number_of_cigars IS 'Indique le nombre de cigares dans le format commandé';
COMMENT ON COLUMN phenix.customer_order_details.cod_selling_before_tobacco_tax IS 'Indique le prix de vente avant la taxe tabac';
COMMENT ON COLUMN phenix.customer_order_details.cod_before_tob_tax_incl_fed_tx IS 'Indique le prix de vente avant la taxe tabac (incluant la taxe fédérale)';
COMMENT ON COLUMN phenix.customer_order_details.cod_selling_bf_tob_per_cigar IS 'Indique le prix de vente avant la taxe tabac par cigare';
COMMENT ON COLUMN phenix.customer_order_details.cod_taxable_amount_per_cigar IS 'Indique le montant taxable par cigare';
COMMENT ON COLUMN phenix.customer_order_details.cod_tobacco_tax_per_cigar IS 'Indique le montant de la taxe tabac calculée par cigare';
COMMENT ON COLUMN phenix.customer_order_details.cod_tobacco_markup_rate IS 'Indique le pourcentage de majoration utilisé sur les produits de type cigare';
COMMENT ON COLUMN phenix.customer_order_details.cod_tobacco_tax_rate IS 'Indique le pourcentage utilisé pour le calcul de l''impôt applicable par cigare';
COMMENT ON COLUMN phenix.customer_order_details.cod_whs_picking_code IS 'Indique l''entrepôt où se fera la cueillette';
COMMENT ON COLUMN phenix.customer_order_details.cod_car_cpr_id IS 'Indique l''identifiant unique de la promotion servant à la refacturation des compteurs';
COMMENT ON COLUMN phenix.customer_order_details.cod_freegood_rebill_amount IS 'Indique le montant à réclamer au fournisseur pour cette gratuité offerte au client.';
COMMENT ON COLUMN phenix.customer_order_details.cod_freegood_message IS 'Indique le message spécifique saisi pour cette gratuité offerte au client.';
COMMENT ON COLUMN phenix.customer_order_details.cod_freegood_switch IS 'Indique que la ligne de commande représente une gratuite.';
COMMENT ON COLUMN phenix.customer_order_details.cod_replacement_list IS 'Indique le coûtant liste si on commandait le produit maintenant, calculé selon la routine de prix aux achats.';
COMMENT ON COLUMN phenix.customer_order_details.cod_replacement_cost_1 IS 'Indique le coûtant 1 si on commandait le produit maintenant, calculé selon la routine de prix aux achats.';
COMMENT ON COLUMN phenix.customer_order_details.cod_replacement_cost_2 IS 'Indique le coûtant 2 si on commandait le produit maintenant, calculé selon la routine de prix aux achats.';
COMMENT ON COLUMN phenix.customer_order_details.cod_replacement_cost_3 IS 'Indique le coûtant 3 si on commandait le produit maintenant, calculé selon la routine de prix aux achats.';
COMMENT ON COLUMN phenix.customer_order_details.cod_replacement_cost_4 IS 'Indique le coûtant 4 si on commandait le produit maintenant, calculé selon la rouitne de prix aux achats.';
COMMENT ON COLUMN phenix.customer_order_details.cod_selling_retail_orig IS 'Indique le prix de vente d''origine après le processus de fixation des prix.';
COMMENT ON COLUMN phenix.customer_order_details.cod_pricing_source_orig IS 'Indique la source du prix d''origine.';
COMMENT ON COLUMN phenix.customer_order_details.cod_use_override_code IS 'Indique le code de l''utilisateur qui a effectué le changement.';
COMMENT ON COLUMN phenix.customer_order_details.cod_royalty_amount IS 'Indique le montant de royauté lorsque le prix vient d''une soumission';
COMMENT ON COLUMN phenix.customer_order_details.cod_order_source IS 'Indique la source de la commande';
COMMENT ON COLUMN phenix.customer_order_details.cod_desired_quantity IS 'Indique la quantité désirée par le client';
COMMENT ON COLUMN phenix.customer_order_details.cod_desired_weight IS 'Indique le poids désiré par le client';
COMMENT ON COLUMN phenix.customer_order_details.cod_invoiced_ext_price IS 'Indique le montant facturé à la ligne, qté * prix vendant ou poids * prix vendant, arrondi toujours vers le haut, à deux décimales';
COMMENT ON COLUMN phenix.customer_order_details.cod_division_order_switch IS 'Indique si la commande provient d''une livraison indirecte d''une division';
COMMENT ON COLUMN phenix.customer_order_details.cod_invoiced_ext_surcharge IS 'Indique le montant facturé à la ligne, qté * surcharge ou poids * surcharge, arrondi toujours vers le haut, à deux décimales';
COMMENT ON COLUMN phenix.customer_order_details.cod_cash_and_carry_weight IS 'Indique le poids de la ligne dans le payer et emporter';
COMMENT ON COLUMN phenix.customer_order_details.cod_vsi_original_code IS 'Indique le code de la prime(utilisé comme historique lorsque la prime de la ligne de commande est supprimée';
COMMENT ON COLUMN phenix.customer_order_details.cod_sio_distributed_amount IS 'Indique le montant en dollars qui sera accordé pour la quantité entre le minimum et le maximum';
COMMENT ON COLUMN phenix.customer_order_details.cod_sio_freegood_quantity IS 'Indique la quantité du produit de gratuité qui sera accordé pour l''échelle';
COMMENT ON COLUMN phenix.customer_order_details.cod_sio_collected_amount IS 'Indique le montant en dollars qui sera reclamé pour la quantité entre le minimum et le maximum';
COMMENT ON COLUMN phenix.customer_order_details.cod_vsi_code IS 'Indique le code de la prime';
COMMENT ON COLUMN phenix.customer_order_details.cod_cod_shorted_coh_id IS 'Indique le numéro de l''entête de la ligne à court qui a créée cette ligne de substitution';
COMMENT ON COLUMN phenix.customer_order_details.cod_cod_shorted_line_number IS 'Indique le numéro de la ligne à court qui a créée cette ligne de substitution';
COMMENT ON COLUMN phenix.customer_order_details.cod_subst_inv_quantity IS 'Indique la quantité disponible du produit de substitution';
COMMENT ON COLUMN phenix.customer_order_details.cod_subst_inv_weight IS 'Indique le poids disponible du produit de substitution';