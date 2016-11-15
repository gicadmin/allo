CREATE TABLE phenix.classes (
  cls_code NUMBER(3) NOT NULL,
  cls_description VARCHAR2(30 BYTE) NOT NULL,
  cls_unique_switch NUMBER(1) NOT NULL CONSTRAINT cls_unique_switch_ck CHECK (CLS_UNIQUE_SWITCH IN (0, 1)),
  cls_alt_description VARCHAR2(30 BYTE),
  cls_price_on_catalog_switch NUMBER(1) NOT NULL CONSTRAINT cls_price_on_catalog_switch_ck CHECK (CLS_PRICE_ON_CATALOG_SWITCH IN (0, 1)),
  cls_print_in_catalog_switch NUMBER(1) DEFAULT 1 NOT NULL CONSTRAINT cls_print_in_catalog_switch_ck CHECK (CLS_PRINT_IN_CATALOG_SWITCH IN (0, 1)),
  CONSTRAINT cls_pk PRIMARY KEY (cls_code)
);
COMMENT ON TABLE phenix.classes IS 'Classifie les produits';
COMMENT ON COLUMN phenix.classes.cls_code IS 'Numéro de la classe de produit';
COMMENT ON COLUMN phenix.classes.cls_description IS 'Description';
COMMENT ON COLUMN phenix.classes.cls_unique_switch IS 'Indique si les produits associés à une classe peut se retrouver sur une même liste de cueillette';
COMMENT ON COLUMN phenix.classes.cls_alt_description IS 'Description alternative';
COMMENT ON COLUMN phenix.classes.cls_price_on_catalog_switch IS 'Indique si le prix sera imprimé dans le bottin';
COMMENT ON COLUMN phenix.classes.cls_print_in_catalog_switch IS 'Indique si la classe du produit doit être imprimée dans le catalogue de produits';