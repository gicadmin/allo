CREATE TABLE phenix.vendor_products (
  vpd_ven_distributed_by_code NUMBER(5) NOT NULL,
  vpd_code VARCHAR2(15 BYTE) NOT NULL,
  vpd_active_switch NUMBER(1) NOT NULL CONSTRAINT vpd_active_switch_ck CHECK (VPD_ACTIVE_SWITCH IN (0, 1)),
  vpd_description VARCHAR2(30 BYTE) NOT NULL,
  vpd_internal_vendor_unit NUMBER(5) NOT NULL,
  vpd_last_cost NUMBER(7,2) NOT NULL,
  vpd_list_cost NUMBER(7,2) NOT NULL,
  vpd_purchase_multiple NUMBER(6) NOT NULL,
  vpd_special_order_switch NUMBER(1) NOT NULL CONSTRAINT vpd_special_order_switch_ck CHECK (VPD_SPECIAL_ORDER_SWITCH IN (0, 1)),
  vpd_prd_code VARCHAR2(10 BYTE),
  vpd_prf_fmt_code VARCHAR2(7 BYTE),
  vpd_ven_manufactured_by_code NUMBER(5),
  vpd_alt_description VARCHAR2(30 BYTE),
  vpd_catalog_sequence NUMBER(10),
  vpd_items_per_palette NUMBER(5),
  vpd_items_per_row NUMBER(3),
  vpd_manufacturer_code VARCHAR2(15 BYTE),
  vpd_vcg_id NUMBER(15) NOT NULL,
  vpd_upc_code VARCHAR2(18 BYTE),
  CONSTRAINT vpd_pk PRIMARY KEY (vpd_code,vpd_ven_distributed_by_code),
  CONSTRAINT vpd_prd_fk FOREIGN KEY (vpd_prd_code) REFERENCES phenix.products (prd_code),
  CONSTRAINT vpd_prf_fk FOREIGN KEY (vpd_prd_code,vpd_prf_fmt_code) REFERENCES phenix.product_formats (prf_prd_code,prf_fmt_code),
  CONSTRAINT vpd_vcg_fk FOREIGN KEY (vpd_vcg_id) REFERENCES phenix.vendor_product_categories (vcg_id),
  CONSTRAINT vpd_ven_distributed_by_fk FOREIGN KEY (vpd_ven_distributed_by_code) REFERENCES phenix.vendors (ven_code),
  CONSTRAINT vpd_ven_manifactured_by_fk FOREIGN KEY (vpd_ven_manufactured_by_code) REFERENCES phenix.vendors (ven_code)
);
COMMENT ON TABLE phenix.vendor_products IS 'Information specificque au fournisseur et au produit';
COMMENT ON COLUMN phenix.vendor_products.vpd_ven_distributed_by_code IS 'Numéro du fournisseur';
COMMENT ON COLUMN phenix.vendor_products.vpd_code IS 'Numéro du produit du fournisseur';
COMMENT ON COLUMN phenix.vendor_products.vpd_active_switch IS 'Indique si ce produit fournisseur est actif';
COMMENT ON COLUMN phenix.vendor_products.vpd_description IS 'Description';
COMMENT ON COLUMN phenix.vendor_products.vpd_internal_vendor_unit IS 'Facteur de conversion du fournisseur';
COMMENT ON COLUMN phenix.vendor_products.vpd_last_cost IS 'Prix du dernier achat';
COMMENT ON COLUMN phenix.vendor_products.vpd_list_cost IS 'Prix de liste du manufacturier';
COMMENT ON COLUMN phenix.vendor_products.vpd_purchase_multiple IS 'Indique le multiple du format que l''on doit acheter';
COMMENT ON COLUMN phenix.vendor_products.vpd_special_order_switch IS 'Indique si le fournisseur doit faire une commande spéciale pour obtenir ce produit';
COMMENT ON COLUMN phenix.vendor_products.vpd_prd_code IS 'Numéro de produit';
COMMENT ON COLUMN phenix.vendor_products.vpd_prf_fmt_code IS 'Numéro de format';
COMMENT ON COLUMN phenix.vendor_products.vpd_ven_manufactured_by_code IS 'Indique le numéro du fournisseur manufacturier';
COMMENT ON COLUMN phenix.vendor_products.vpd_alt_description IS 'Description alternative';
COMMENT ON COLUMN phenix.vendor_products.vpd_catalog_sequence IS 'Numéro de séquence du catalog fournisseur';
COMMENT ON COLUMN phenix.vendor_products.vpd_items_per_palette IS 'Caisse par palette';
COMMENT ON COLUMN phenix.vendor_products.vpd_items_per_row IS 'Caisse par rangée';
COMMENT ON COLUMN phenix.vendor_products.vpd_manufacturer_code IS 'Indique le code du produit manufacturier';
COMMENT ON COLUMN phenix.vendor_products.vpd_vcg_id IS 'Identifiant le la catégorie de produit fournisseur';
COMMENT ON COLUMN phenix.vendor_products.vpd_upc_code IS 'Indique l''identifiant visuel du produit (code à barres) selon le fournisseur';