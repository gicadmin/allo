CREATE TABLE phenix.product_formats (
  prf_prd_code VARCHAR2(10 BYTE) NOT NULL,
  prf_fmt_code VARCHAR2(7 BYTE) NOT NULL,
  prf_conversion_to_base NUMBER(8) NOT NULL,
  prf_description VARCHAR2(30 BYTE) NOT NULL,
  prf_height NUMBER(8,3) NOT NULL,
  prf_inner_weight NUMBER(8,3) NOT NULL,
  prf_length NUMBER(8,3) NOT NULL,
  prf_operation_flag VARCHAR2(1 BYTE) NOT NULL CONSTRAINT prf_operation_flag_ck CHECK (PRF_OPERATION_FLAG IN ('M', 'D')),
  prf_price NUMBER(7,2) NOT NULL,
  prf_profit_percent NUMBER(6,3) NOT NULL,
  prf_purchase_weight NUMBER(8,3) NOT NULL,
  prf_sellable_format_switch NUMBER(1) NOT NULL CONSTRAINT prf_sellable_format_switch_ck CHECK (PRF_SELLABLE_FORMAT_SWITCH IN (0, 1)),
  prf_tobacco_tax NUMBER(11,6) DEFAULT 0 NOT NULL,
  prf_width NUMBER(8,3) NOT NULL,
  prf_cns_code NUMBER(3),
  prf_upc_code VARCHAR2(18 BYTE),
  prf_surcharge NUMBER(7,2),
  prf_message VARCHAR2(20 BYTE),
  prf_remote_code VARCHAR2(1 BYTE),
  prf_number_of_items NUMBER(6),
  prf_creation_date DATE DEFAULT SYSDATE NOT NULL,
  prf_elimination_date DATE,
  prf_modification_date DATE DEFAULT SYSDATE NOT NULL,
  prf_minimum_sale_price NUMBER(7,2),
  prf_sales_multiple NUMBER(7,3) DEFAULT 1 NOT NULL,
  prf_pre_print_required_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT prf_pre_print_required_swi_ck CHECK (PRF_PRE_PRINT_REQUIRED_SWITCH in (0, 1)),
  prf_discount_switch NUMBER(1) DEFAULT 1 NOT NULL CONSTRAINT prf_discount_switch_ck CHECK (PRF_DISCOUNT_SWITCH IN (0, 1)),
  prf_attribute_last_update_date DATE,
  prf_only_one_pick_wght_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT prf_only_one_pick_wght_swit_ck CHECK (PRF_ONLY_ONE_PICK_WGHT_SWITCH IN (0, 1)),
  prf_cash_n_carry_only_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT prf_cash_n_carry_only_swit_ck CHECK (PRF_CASH_N_CARRY_ONLY_SWITCH IN (0, 1)),
  prf_fragile_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT prf_fragile_switch_ck CHECK (prf_fragile_switch IN (0,1)),
  prf_repack_required_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT prf_repack_required_switch_ck CHECK (PRF_REPACK_REQUIRED_SWITCH IN (0, 1)),
  prf_approb_last_update_date DATE,
  prf_surcharge_percent NUMBER(6,3),
  prf_liter NUMBER(8,3) DEFAULT 0 NOT NULL,
  CONSTRAINT prf_surcharge_ck CHECK ( (PRF_SURCHARGE IS NULL AND PRF_SURCHARGE_PERCENT IS NULL) OR
          (PRF_SURCHARGE IS NOT NULL AND PRF_SURCHARGE_PERCENT IS NULL) OR
          (PRF_SURCHARGE IS NULL AND PRF_SURCHARGE_PERCENT IS NOT NULL) ),
  CONSTRAINT prf_pk PRIMARY KEY (prf_prd_code,prf_fmt_code),
  CONSTRAINT prf_cns_fk FOREIGN KEY (prf_cns_code) REFERENCES phenix.consignments (cns_code),
  CONSTRAINT prf_fmt_fk FOREIGN KEY (prf_fmt_code) REFERENCES phenix.formats (fmt_code),
  CONSTRAINT prf_prd_fk FOREIGN KEY (prf_prd_code) REFERENCES phenix.products (prd_code)
);
COMMENT ON TABLE phenix.product_formats IS 'Identifie les formats des produits';
COMMENT ON COLUMN phenix.product_formats.prf_prd_code IS 'Numéro de produit';
COMMENT ON COLUMN phenix.product_formats.prf_fmt_code IS 'Numéro de format';
COMMENT ON COLUMN phenix.product_formats.prf_conversion_to_base IS 'Facteur de conversion';
COMMENT ON COLUMN phenix.product_formats.prf_description IS 'Description';
COMMENT ON COLUMN phenix.product_formats.prf_height IS 'Hauteur';
COMMENT ON COLUMN phenix.product_formats.prf_inner_weight IS 'Poids interne';
COMMENT ON COLUMN phenix.product_formats.prf_length IS 'Longueur';
COMMENT ON COLUMN phenix.product_formats.prf_operation_flag IS 'Opérant';
COMMENT ON COLUMN phenix.product_formats.prf_price IS 'Prix de vente';
COMMENT ON COLUMN phenix.product_formats.prf_profit_percent IS 'Pourcentage de profit';
COMMENT ON COLUMN phenix.product_formats.prf_purchase_weight IS 'Poids';
COMMENT ON COLUMN phenix.product_formats.prf_sellable_format_switch IS 'Indique si le format peut être vendu';
COMMENT ON COLUMN phenix.product_formats.prf_tobacco_tax IS 'Montant de taxe tabac';
COMMENT ON COLUMN phenix.product_formats.prf_width IS 'Largeur';
COMMENT ON COLUMN phenix.product_formats.prf_cns_code IS 'Numéro de consigne';
COMMENT ON COLUMN phenix.product_formats.prf_upc_code IS 'Numéro universel de produit (CUP)';
COMMENT ON COLUMN phenix.product_formats.prf_surcharge IS 'Surcharge spécifique au produit format';
COMMENT ON COLUMN phenix.product_formats.prf_message IS 'Message';
COMMENT ON COLUMN phenix.product_formats.prf_remote_code IS 'Code de format pour logivente';
COMMENT ON COLUMN phenix.product_formats.prf_number_of_items IS 'Nombre d''articles consommables';
COMMENT ON COLUMN phenix.product_formats.prf_creation_date IS 'Date de création du format de produit';
COMMENT ON COLUMN phenix.product_formats.prf_elimination_date IS 'Date d''élimination du format de produit';
COMMENT ON COLUMN phenix.product_formats.prf_modification_date IS 'Date de modification';
COMMENT ON COLUMN phenix.product_formats.prf_minimum_sale_price IS 'Prix de détail minimum suggéré';
COMMENT ON COLUMN phenix.product_formats.prf_sales_multiple IS 'Indique la quantité minimum à commander.';
COMMENT ON COLUMN phenix.product_formats.prf_pre_print_required_switch IS 'Indique si ce produit format nécessite une préparation à l''avance';
COMMENT ON COLUMN phenix.product_formats.prf_discount_switch IS 'Indique si un escompte peut s''appliquer à ce produit/format';
COMMENT ON COLUMN phenix.product_formats.prf_attribute_last_update_date IS 'Indique la date de la dernière pesée du produit format avec le cubiscan';
COMMENT ON COLUMN phenix.product_formats.prf_only_one_pick_wght_switch IS 'Indique que ce produit format est cueilli en entrant un seul poids total, plutôt qu''un poids par quantité';
COMMENT ON COLUMN phenix.product_formats.prf_cash_n_carry_only_switch IS 'Indique si ce produit format est vendable uniquement par le module de "Payer et Emporter".';
COMMENT ON COLUMN phenix.product_formats.prf_fragile_switch IS 'Indique si le produit format est fragile et cassable ';
COMMENT ON COLUMN phenix.product_formats.prf_repack_required_switch IS 'Indique si le produit nécessite un ré-emballage suite à la cueillette.';
COMMENT ON COLUMN phenix.product_formats.prf_approb_last_update_date IS 'Indique la date d''approbation dans phenix du cubiscan ';
COMMENT ON COLUMN phenix.product_formats.prf_surcharge_percent IS 'Indique la surcharge spécifique en pourcentage au produit format';
COMMENT ON COLUMN phenix.product_formats.prf_liter IS 'Indique la mesure du produit format en litre';