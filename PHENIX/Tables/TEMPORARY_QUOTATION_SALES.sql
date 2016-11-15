CREATE GLOBAL TEMPORARY TABLE phenix.temporary_quotation_sales (
  tqs_qth_start_date DATE,
  tqs_qth_end_date DATE,
  tqs_qth_cus_qty_code NUMBER(10),
  tqs_qtd_prf_prd_code VARCHAR2(10 BYTE),
  tqs_qtd_prf_fmt_code VARCHAR2(7 BYTE),
  tqs_qtd_admin_amount NUMBER(7,2),
  tqs_qtd_markup_used NUMBER(6,3),
  tqs_qtd_cost_strategy NUMBER(1),
  tqs_qtd_base_cost_type NUMBER(2),
  tqs_qtd_selling_price NUMBER(7,2),
  tqs_qtd_count_amount NUMBER(7,2),
  tqs_qtd_original_cost NUMBER(7,2),
  tqs_qtd_original_retail NUMBER(7,2),
  tqs_qtd_customer_product_code VARCHAR2(18 BYTE),
  tqs_qtd_print_sequence NUMBER(6),
  tqs_cus_address VARCHAR2(45 BYTE),
  tqs_cus_city VARCHAR2(35 BYTE),
  tqs_cus_type_name VARCHAR2(45 BYTE),
  tqs_cus_postal_code VARCHAR2(100 BYTE),
  tqs_cus_telephone NUMBER(11),
  tqs_cus_dgt_code NUMBER(5),
  tqs_cus_qty_admin_method VARCHAR2(1 BYTE),
  tqs_cus_use_code NUMBER(5),
  tqs_sales NUMBER(10,2),
  tqs_profit_dol NUMBER(10,2),
  tqs_profit_prc NUMBER(10,2),
  tqs_qth_agreement_percent NUMBER(6,3) DEFAULT (0) NOT NULL,
  tqs_qtd_promo_item_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT tqs_qtd_promo_item_switch_ck CHECK (TQS_QTD_PROMO_ITEM_SWITCH IN (0, 1))
)
ON COMMIT DELETE ROWS;
COMMENT ON TABLE phenix.temporary_quotation_sales IS 'Table temporaire utilisée pour le rapport RAP_VENTE_SOUMISSION_CLIENT';
COMMENT ON COLUMN phenix.temporary_quotation_sales.tqs_qth_start_date IS 'Indique la date de début de la soumission';
COMMENT ON COLUMN phenix.temporary_quotation_sales.tqs_qth_end_date IS 'Indique la date de fin de la soumission';
COMMENT ON COLUMN phenix.temporary_quotation_sales.tqs_qth_cus_qty_code IS 'Indique le code client ou le type de la soumission';
COMMENT ON COLUMN phenix.temporary_quotation_sales.tqs_qtd_prf_prd_code IS 'Indique le code produit';
COMMENT ON COLUMN phenix.temporary_quotation_sales.tqs_qtd_prf_fmt_code IS 'Indique le format';
COMMENT ON COLUMN phenix.temporary_quotation_sales.tqs_qtd_admin_amount IS 'Indique le montant d''administration';
COMMENT ON COLUMN phenix.temporary_quotation_sales.tqs_qtd_markup_used IS 'Indique le pourcentage d''administration';
COMMENT ON COLUMN phenix.temporary_quotation_sales.tqs_qtd_cost_strategy IS 'Indique le code de la stratégie';
COMMENT ON COLUMN phenix.temporary_quotation_sales.tqs_qtd_base_cost_type IS 'Indique le code du coûtant utilisé';
COMMENT ON COLUMN phenix.temporary_quotation_sales.tqs_qtd_selling_price IS 'Indique le prix de la soumission';
COMMENT ON COLUMN phenix.temporary_quotation_sales.tqs_qtd_count_amount IS 'Indique le montant de l''entente fournisseur';
COMMENT ON COLUMN phenix.temporary_quotation_sales.tqs_qtd_original_cost IS 'Indique le coûtant de la soumission';
COMMENT ON COLUMN phenix.temporary_quotation_sales.tqs_qtd_original_retail IS 'Indique le vendant de la soumission';
COMMENT ON COLUMN phenix.temporary_quotation_sales.tqs_qtd_customer_product_code IS 'Indique le code du produit client';
COMMENT ON COLUMN phenix.temporary_quotation_sales.tqs_qtd_print_sequence IS 'Indique la séquence';
COMMENT ON COLUMN phenix.temporary_quotation_sales.tqs_cus_address IS 'Indique l''adresse du client';
COMMENT ON COLUMN phenix.temporary_quotation_sales.tqs_cus_city IS 'Indique la ville du client';
COMMENT ON COLUMN phenix.temporary_quotation_sales.tqs_cus_type_name IS 'Indique la description du type ou le nom du client';
COMMENT ON COLUMN phenix.temporary_quotation_sales.tqs_cus_postal_code IS 'Indique le code postal du client';
COMMENT ON COLUMN phenix.temporary_quotation_sales.tqs_cus_telephone IS 'Indique le téléphone du client';
COMMENT ON COLUMN phenix.temporary_quotation_sales.tqs_cus_dgt_code IS 'Indique le code de la grille d''escompte du client';
COMMENT ON COLUMN phenix.temporary_quotation_sales.tqs_cus_qty_admin_method IS 'Indique la méthode de calcul pour le profit en pourcentage';
COMMENT ON COLUMN phenix.temporary_quotation_sales.tqs_cus_use_code IS 'Indique le code du vendeur';
COMMENT ON COLUMN phenix.temporary_quotation_sales.tqs_sales IS 'Indique les ventes du produit/format';
COMMENT ON COLUMN phenix.temporary_quotation_sales.tqs_profit_dol IS 'Indique le profit des ventes en dollars';
COMMENT ON COLUMN phenix.temporary_quotation_sales.tqs_profit_prc IS 'Indique le profit des ventes en pourcentage';
COMMENT ON COLUMN phenix.temporary_quotation_sales.tqs_qth_agreement_percent IS 'Indique le pourcentage accordé selon un accord de vente';
COMMENT ON COLUMN phenix.temporary_quotation_sales.tqs_qtd_promo_item_switch IS 'Indique si le produit est promotionel';