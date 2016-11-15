CREATE GLOBAL TEMPORARY TABLE phenix.temporary_alert_products (
  tar_use_code NUMBER(5),
  tar_use_name VARCHAR2(80 BYTE),
  tar_ven_code NUMBER(5),
  tar_ven_name VARCHAR2(30 BYTE),
  tar_status VARCHAR2(30 BYTE),
  tar_prd_code VARCHAR2(10 BYTE),
  tar_fmt_short_code VARCHAR2(3 BYTE),
  tar_prf_description VARCHAR2(30 BYTE),
  tar_prd_description VARCHAR2(45 BYTE),
  tar_prd_product_life NUMBER(4),
  tar_brn_description VARCHAR2(15 BYTE),
  tar_alert_qty_wgt NUMBER(10,2),
  tar_expired_qty_wgt NUMBER(10,2),
  tar_expiry_in_warehouse_date DATE,
  tar_expiry_date DATE,
  tar_loc_code VARCHAR2(12 BYTE),
  tar_hold VARCHAR2(10 BYTE),
  tar_prf_price NUMBER(10,2),
  tar_price_extension NUMBER(10,2),
  tar_inv_qty_wgt NUMBER(10,2)
)
ON COMMIT PRESERVE ROWS;
COMMENT ON TABLE phenix.temporary_alert_products IS 'Table temporaire pour le rapport RAP_ALERT_PRODUCTS';
COMMENT ON COLUMN phenix.temporary_alert_products.tar_use_code IS 'Indique le code de l''utilisateur';
COMMENT ON COLUMN phenix.temporary_alert_products.tar_use_name IS 'Indique le nom de l''utilisateur';
COMMENT ON COLUMN phenix.temporary_alert_products.tar_ven_code IS 'Indique le code du vendeur';
COMMENT ON COLUMN phenix.temporary_alert_products.tar_ven_name IS 'Indique le nom du vendeur';
COMMENT ON COLUMN phenix.temporary_alert_products.tar_status IS 'Indique si le produit est expiré, en alerte ou autre';
COMMENT ON COLUMN phenix.temporary_alert_products.tar_prd_code IS 'Indique le code de produit';
COMMENT ON COLUMN phenix.temporary_alert_products.tar_fmt_short_code IS 'Indique le format court du produit';
COMMENT ON COLUMN phenix.temporary_alert_products.tar_prf_description IS 'Indique la description du format';
COMMENT ON COLUMN phenix.temporary_alert_products.tar_prd_description IS 'Indique la description du produit';
COMMENT ON COLUMN phenix.temporary_alert_products.tar_prd_product_life IS 'Indique la durée de vie du produit';
COMMENT ON COLUMN phenix.temporary_alert_products.tar_brn_description IS 'Indique la marque déposée';
COMMENT ON COLUMN phenix.temporary_alert_products.tar_alert_qty_wgt IS 'Indique la quantité ou poids en alerte';
COMMENT ON COLUMN phenix.temporary_alert_products.tar_expired_qty_wgt IS 'Indique la quantité ou poids expirée';
COMMENT ON COLUMN phenix.temporary_alert_products.tar_expiry_in_warehouse_date IS 'Indique la date d''expiration dans l''entrepôt';
COMMENT ON COLUMN phenix.temporary_alert_products.tar_expiry_date IS 'Indique la date d''expiration';
COMMENT ON COLUMN phenix.temporary_alert_products.tar_loc_code IS 'Indique le code de la localisation';
COMMENT ON COLUMN phenix.temporary_alert_products.tar_hold IS 'Indique si la localisation est retenue ou pas';
COMMENT ON COLUMN phenix.temporary_alert_products.tar_prf_price IS 'Indique le prix de liste';
COMMENT ON COLUMN phenix.temporary_alert_products.tar_price_extension IS 'Indique le prix d''extension';
COMMENT ON COLUMN phenix.temporary_alert_products.tar_inv_qty_wgt IS 'Indique la quantité ou le poids en inventaire';