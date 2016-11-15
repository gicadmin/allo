CREATE TABLE phenix.customer_stats_extract (
  cse_cus_code NUMBER(10) NOT NULL,
  cse_cus_name VARCHAR2(30 BYTE) NOT NULL,
  cse_cus_address VARCHAR2(45 BYTE) NOT NULL,
  cse_cus_city VARCHAR2(30 BYTE) NOT NULL,
  cse_cus_prv_resides_in_code VARCHAR2(2 BYTE) NOT NULL,
  cse_cus_postal_code VARCHAR2(10 BYTE) NOT NULL,
  cse_inh_type VARCHAR2(2 BYTE) NOT NULL,
  cse_inh_invoice_date DATE NOT NULL,
  cse_inh_id NUMBER(15) NOT NULL,
  cse_invoice_line_number NUMBER(4),
  cse_reference_number VARCHAR2(15 BYTE),
  cse_prf_prd_code VARCHAR2(10 BYTE),
  cse_prd_description VARCHAR2(45 BYTE),
  cse_prf_fmt_code VARCHAR2(7 BYTE),
  cse_prf_description VARCHAR2(30 BYTE),
  cse_ven_code NUMBER(5),
  cse_ven_name VARCHAR2(30 BYTE),
  cse_brn_code NUMBER(5),
  cse_brn_description VARCHAR2(30 BYTE),
  cse_pgr_code NUMBER(5),
  cse_pgr_description VARCHAR2(30 BYTE),
  cse_cgr_code NUMBER(3),
  cse_cgr_description VARCHAR2(30 BYTE),
  cse_vgr_code NUMBER(5),
  cse_vgr_description VARCHAR2(30 BYTE),
  cse_dgt_code NUMBER(5),
  cse_vrg_code NUMBER(3),
  cse_trt_code NUMBER(2),
  cse_trt_description VARCHAR2(30 BYTE),
  cse_invoice_quantity NUMBER(7),
  cse_invoice_weight NUMBER(9,3),
  cse_selling_format_price NUMBER(10,2),
  cse_invoiced_ext_price NUMBER(10,2) NOT NULL,
  cse_cost_price NUMBER(10,2) NOT NULL,
  cse_profit_amount NUMBER(10,2) NOT NULL
);
COMMENT ON TABLE phenix.customer_stats_extract IS 'Table d''historique des transactions du client (pour extraction future)';
COMMENT ON COLUMN phenix.customer_stats_extract.cse_cus_code IS 'Indique le code du client';
COMMENT ON COLUMN phenix.customer_stats_extract.cse_cus_name IS 'Indique le nom du client';
COMMENT ON COLUMN phenix.customer_stats_extract.cse_cus_address IS 'Indique l''addresse du client';
COMMENT ON COLUMN phenix.customer_stats_extract.cse_cus_city IS 'Indique la ville du client';
COMMENT ON COLUMN phenix.customer_stats_extract.cse_cus_prv_resides_in_code IS 'Indique le code de la province du client';
COMMENT ON COLUMN phenix.customer_stats_extract.cse_cus_postal_code IS 'Indique le code postal du client';
COMMENT ON COLUMN phenix.customer_stats_extract.cse_inh_type IS 'Indique le type de facture';
COMMENT ON COLUMN phenix.customer_stats_extract.cse_inh_invoice_date IS 'Indique la date de la facturation';
COMMENT ON COLUMN phenix.customer_stats_extract.cse_inh_id IS 'Indique le numéro de la facture';
COMMENT ON COLUMN phenix.customer_stats_extract.cse_invoice_line_number IS 'Indique le numéro de ligne de la facture';
COMMENT ON COLUMN phenix.customer_stats_extract.cse_reference_number IS 'Indique le numéro de référence';
COMMENT ON COLUMN phenix.customer_stats_extract.cse_prf_prd_code IS 'Indique le code du produit';
COMMENT ON COLUMN phenix.customer_stats_extract.cse_prd_description IS 'Indique la description du produit';
COMMENT ON COLUMN phenix.customer_stats_extract.cse_prf_fmt_code IS 'Indique le code du format';
COMMENT ON COLUMN phenix.customer_stats_extract.cse_prf_description IS 'Indique l''empaquetage du format';
COMMENT ON COLUMN phenix.customer_stats_extract.cse_ven_code IS 'Indique le numéro du fournisseur manufacturier du produit';
COMMENT ON COLUMN phenix.customer_stats_extract.cse_ven_name IS 'Indique le nom du fournisseur manufacturier du produit';
COMMENT ON COLUMN phenix.customer_stats_extract.cse_brn_code IS 'Indique le numéro de marque de commerce';
COMMENT ON COLUMN phenix.customer_stats_extract.cse_brn_description IS 'Indique la description de marque de commerce';
COMMENT ON COLUMN phenix.customer_stats_extract.cse_pgr_code IS 'Indique le numéro de groupe de produit';
COMMENT ON COLUMN phenix.customer_stats_extract.cse_pgr_description IS 'Indique la description de groupe de produit';
COMMENT ON COLUMN phenix.customer_stats_extract.cse_cgr_code IS 'Indique le numéro de groupe de client';
COMMENT ON COLUMN phenix.customer_stats_extract.cse_cgr_description IS 'Indique la description de groupe de client';
COMMENT ON COLUMN phenix.customer_stats_extract.cse_vgr_code IS 'Indique le numéro de groupe de fournisseur';
COMMENT ON COLUMN phenix.customer_stats_extract.cse_vgr_description IS 'Indique la description de groupe de fournisseur';
COMMENT ON COLUMN phenix.customer_stats_extract.cse_dgt_code IS 'Indique le code du type de la grille d''escompte';
COMMENT ON COLUMN phenix.customer_stats_extract.cse_vrg_code IS 'Indique le code de la grille de rabais volume';
COMMENT ON COLUMN phenix.customer_stats_extract.cse_trt_code IS 'Indique le numéro du territoire';
COMMENT ON COLUMN phenix.customer_stats_extract.cse_trt_description IS 'Indique la description du territoire';
COMMENT ON COLUMN phenix.customer_stats_extract.cse_invoice_quantity IS 'Indique la quantité facturée';
COMMENT ON COLUMN phenix.customer_stats_extract.cse_invoice_weight IS 'Indique le poids facturée';
COMMENT ON COLUMN phenix.customer_stats_extract.cse_selling_format_price IS 'Indique le prix de vente après le processus de fixation des prix';
COMMENT ON COLUMN phenix.customer_stats_extract.cse_invoiced_ext_price IS 'Indique le montant facturé à la ligne, qté * prix vendant ou poids * prix vendant';
COMMENT ON COLUMN phenix.customer_stats_extract.cse_cost_price IS 'Indique le prix du coûtant';
COMMENT ON COLUMN phenix.customer_stats_extract.cse_profit_amount IS 'Indique le profit calculé en montant';