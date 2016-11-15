CREATE GLOBAL TEMPORARY TABLE phenix.temporary_product_lov (
  tpl_prd_ctg_code NUMBER(5),
  tpl_prd_catalog_sequence_code NUMBER(5),
  tpl_prd_description VARCHAR2(45 BYTE),
  tpl_prd_ven_code NUMBER(5),
  tpl_prd_brn_code NUMBER(5),
  tpl_en_inventaire NUMBER(9),
  tpl_prd_code VARCHAR2(10 BYTE) NOT NULL,
  tpl_prd_fmt_solid_inv_code VARCHAR2(7 BYTE),
  tpl_prd_fmt_weighted_inv_code VARCHAR2(7 BYTE),
  tpl_prd_special_order_switch NUMBER(1) NOT NULL,
  tpl_wsp_whs_picking_code VARCHAR2(2 BYTE),
  tpl_real_prd_code VARCHAR2(10 BYTE)
)
ON COMMIT PRESERVE ROWS;
COMMENT ON TABLE phenix.temporary_product_lov IS 'table temporaire des produits pour le module de télévente';
COMMENT ON COLUMN phenix.temporary_product_lov.tpl_prd_ctg_code IS ' Indique numéro de séquence majeur de bottin';
COMMENT ON COLUMN phenix.temporary_product_lov.tpl_prd_catalog_sequence_code IS 'Indique numéro de séquence du bottin  ';
COMMENT ON COLUMN phenix.temporary_product_lov.tpl_prd_description IS 'Indique la description du produit';
COMMENT ON COLUMN phenix.temporary_product_lov.tpl_prd_ven_code IS 'Indique le numéro du fournisseur';
COMMENT ON COLUMN phenix.temporary_product_lov.tpl_prd_brn_code IS 'Indique le numéro de marque de commerce';
COMMENT ON COLUMN phenix.temporary_product_lov.tpl_en_inventaire IS 'Indique la quantité ou le poids en inventaire';
COMMENT ON COLUMN phenix.temporary_product_lov.tpl_prd_code IS 'Indique le code du produit';
COMMENT ON COLUMN phenix.temporary_product_lov.tpl_prd_fmt_solid_inv_code IS 'Indique le numéro de format solide d''inventaire';
COMMENT ON COLUMN phenix.temporary_product_lov.tpl_prd_fmt_weighted_inv_code IS 'Indique le numéro de format poids d''inventaire';
COMMENT ON COLUMN phenix.temporary_product_lov.tpl_prd_special_order_switch IS 'Indique que le produit est un produit spécial';
COMMENT ON COLUMN phenix.temporary_product_lov.tpl_wsp_whs_picking_code IS 'indique le code d''entrepôt de cueillette';