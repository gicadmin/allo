CREATE TABLE phenix.quotation_types (
  qty_code NUMBER(5) NOT NULL,
  qty_description VARCHAR2(30 BYTE) NOT NULL,
  qty_alt_description VARCHAR2(30 BYTE),
  qty_admin_method VARCHAR2(1 BYTE) NOT NULL CONSTRAINT qty_admin_method_ck CHECK (QTY_ADMIN_METHOD IN ('P', 'S')),
  qty_srt_code NUMBER(3) NOT NULL,
  qty_applicable_to_flag VARCHAR2(1 BYTE) NOT NULL CONSTRAINT qty_applicable_to_flag_ck CHECK (QTY_APPLICABLE_TO_FLAG IN ('R', 'C')),
  qty_whs_code VARCHAR2(2 BYTE) NOT NULL,
  qty_pug_code NUMBER(5),
  qty_xrg_code VARCHAR2(10 BYTE),
  CONSTRAINT qty_pk PRIMARY KEY (qty_code),
  CONSTRAINT qty_pug_fk FOREIGN KEY (qty_pug_code) REFERENCES phenix.purchasing_groups (pug_code),
  CONSTRAINT qty_srt_fk FOREIGN KEY (qty_srt_code) REFERENCES phenix.suggested_retail_price_types (srt_code),
  CONSTRAINT qty_whs_fk FOREIGN KEY (qty_whs_code) REFERENCES phenix.warehouses (whs_code),
  CONSTRAINT qty_xrg_code_fk FOREIGN KEY (qty_xrg_code) REFERENCES phenix.xref_grids (xrg_code)
);
COMMENT ON TABLE phenix.quotation_types IS 'Type de soumission';
COMMENT ON COLUMN phenix.quotation_types.qty_code IS 'Numéro de type de soumission';
COMMENT ON COLUMN phenix.quotation_types.qty_description IS 'Description';
COMMENT ON COLUMN phenix.quotation_types.qty_alt_description IS 'Description alternative';
COMMENT ON COLUMN phenix.quotation_types.qty_admin_method IS 'Méthode de calcul du "cost plus"';
COMMENT ON COLUMN phenix.quotation_types.qty_srt_code IS 'Type de prix de détail suggéré';
COMMENT ON COLUMN phenix.quotation_types.qty_applicable_to_flag IS 'Indique si la soumission est pour un client ou un détaillant';
COMMENT ON COLUMN phenix.quotation_types.qty_whs_code IS 'Indique le code de l''entrepôt';
COMMENT ON COLUMN phenix.quotation_types.qty_xrg_code IS 'Indique le code de grille de reference produit';