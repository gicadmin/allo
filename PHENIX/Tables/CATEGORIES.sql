CREATE TABLE phenix.categories (
  cat_code NUMBER(2) NOT NULL,
  cat_description VARCHAR2(30 BYTE) NOT NULL,
  cat_alt_description VARCHAR2(30 BYTE),
  cat_ven_switch NUMBER(1) DEFAULT 1 NOT NULL CONSTRAINT cat_ven_switch_ck CHECK (CAT_VEN_SWITCH IN (0,1)),
  cat_cus_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT cat_cus_switch_ck CHECK (CAT_CUS_SWITCH IN (0,1)),
  cat_prd_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT cat_prd_switch_ck CHECK (CAT_PRD_SWITCH IN (0,1)),
  CONSTRAINT cat_pk PRIMARY KEY (cat_code)
);
COMMENT ON TABLE phenix.categories IS 'Classification des fournisseurs';
COMMENT ON COLUMN phenix.categories.cat_code IS 'Numéro de classification des fournissseurs';
COMMENT ON COLUMN phenix.categories.cat_description IS 'Description';
COMMENT ON COLUMN phenix.categories.cat_alt_description IS 'Description allternative';
COMMENT ON COLUMN phenix.categories.cat_ven_switch IS 'Indique si la catégorie s''applique au fournisseur';
COMMENT ON COLUMN phenix.categories.cat_cus_switch IS 'Indique si la catégorie s''applique au client';
COMMENT ON COLUMN phenix.categories.cat_prd_switch IS 'Indique si la catégorie s''applique au produit';