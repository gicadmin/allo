CREATE TABLE phenix.tobacco_product_categories (
  tbpc_code NUMBER(3) NOT NULL,
  tbpc_description VARCHAR2(30 BYTE) NOT NULL,
  tbpc_alt_description VARCHAR2(30 BYTE),
  CONSTRAINT tbpc_pk PRIMARY KEY (tbpc_code)
);
COMMENT ON COLUMN phenix.tobacco_product_categories.tbpc_code IS 'Indique le code primaire de la table';
COMMENT ON COLUMN phenix.tobacco_product_categories.tbpc_description IS 'Indique la description de la catégorie des produits tabac';
COMMENT ON COLUMN phenix.tobacco_product_categories.tbpc_alt_description IS 'Indique la description alternative de la catégorie des produits tabac';