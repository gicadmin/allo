CREATE TABLE phenix.customer_profiles (
  cpf_cus_code NUMBER(10) NOT NULL,
  cpf_prf_prd_code VARCHAR2(10 BYTE) NOT NULL,
  cpf_prf_fmt_code VARCHAR2(7 BYTE) NOT NULL,
  cpf_last_order_date DATE,
  cpf_last_order_price NUMBER(7,2),
  cpf_last_pricing_source VARCHAR2(2 BYTE) CONSTRAINT cpf_last_pricing_source_ck CHECK (CPF_LAST_PRICING_SOURCE IN ('RG', 'PR', 'DI', 'QO', 'PB', 'OV')),
  cpf_last_order_quantity NUMBER(7),
  cpf_last_order_weight NUMBER(8,3),
  cpf_prd_description VARCHAR2(45 BYTE) NOT NULL,
  cpf_prd_alt_description VARCHAR2(45 BYTE),
  cpf_prd_definition VARCHAR2(1 BYTE),
  cpf_prf_description VARCHAR2(30 BYTE) NOT NULL,
  cpf_brn_description VARCHAR2(15 BYTE),
  cpf_brn_alt_description VARCHAR2(15 BYTE),
  cpf_ven_short_name VARCHAR2(15 BYTE),
  cpf_prd_ctg_code NUMBER(5),
  cpf_prd_catalog_sequence_code NUMBER(5),
  cpf_history_calculated_date DATE,
  cpf_empty_value NUMBER,
  cpf_ven_next_delivery_date DATE NOT NULL,
  cpf_ven_next_delivery_code NUMBER(5),
  CONSTRAINT cpf_pk PRIMARY KEY (cpf_cus_code,cpf_prf_prd_code,cpf_prf_fmt_code),
  CONSTRAINT cpf_cus_fk FOREIGN KEY (cpf_cus_code) REFERENCES phenix.customers (cus_code),
  CONSTRAINT cpf_prf_fk FOREIGN KEY (cpf_prf_prd_code,cpf_prf_fmt_code) REFERENCES phenix.product_formats (prf_prd_code,prf_fmt_code),
  CONSTRAINT cpf_ven_next_deliv_code_fk FOREIGN KEY (cpf_ven_next_delivery_code) REFERENCES phenix.vendors (ven_code)
);
COMMENT ON TABLE phenix.customer_profiles IS 'Profile des achats fait par un client';
COMMENT ON COLUMN phenix.customer_profiles.cpf_cus_code IS 'Code client';
COMMENT ON COLUMN phenix.customer_profiles.cpf_prf_prd_code IS 'Code produit';
COMMENT ON COLUMN phenix.customer_profiles.cpf_prf_fmt_code IS 'Code format';
COMMENT ON COLUMN phenix.customer_profiles.cpf_last_order_date IS 'Date de la dernière commande';
COMMENT ON COLUMN phenix.customer_profiles.cpf_last_order_price IS 'Prix de la dernière commande';
COMMENT ON COLUMN phenix.customer_profiles.cpf_last_pricing_source IS 'Source du prix de la dernière commande';
COMMENT ON COLUMN phenix.customer_profiles.cpf_last_order_quantity IS 'Quantité de la dernière commande';
COMMENT ON COLUMN phenix.customer_profiles.cpf_last_order_weight IS 'Poids de la dernière commande';
COMMENT ON COLUMN phenix.customer_profiles.cpf_history_calculated_date IS 'Indique la date où les statistiques de ventes ont été calculées pour la première fois pour cette ligne de profil';
COMMENT ON COLUMN phenix.customer_profiles.cpf_empty_value IS 'Permet de baser un bloc dans l''écran des profils, ce champ doit toujours être vide';
COMMENT ON COLUMN phenix.customer_profiles.cpf_ven_next_delivery_date IS 'Indique la prochaine date de livraison fournisseur (lié au cycle d''achat)';
COMMENT ON COLUMN phenix.customer_profiles.cpf_ven_next_delivery_code IS 'Indique le code du fournisseur lié à la prochaine date de livraison fournisseur';