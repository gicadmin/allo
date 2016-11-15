CREATE TABLE phenix.positioning_family_products (
  pfp_id NUMBER(15) NOT NULL,
  pfp_whs_code VARCHAR2(2 BYTE),
  pfp_pof_code NUMBER(2),
  pfp_prf_prd_code VARCHAR2(10 BYTE),
  pfp_prf_fmt_code VARCHAR2(7 BYTE),
  pfp_average_daily_sales NUMBER(7,2),
  pfp_rac_code VARCHAR2(1 BYTE),
  pfp_number_of_pickings NUMBER(6),
  pfp_double_loc_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT pfp_double_loc_switch_ck CHECK (PFP_DOUBLE_LOC_SWITCH IN (0,1)),
  pfp_item_per_rows NUMBER(3),
  CONSTRAINT pfp_pk PRIMARY KEY (pfp_id)
);
COMMENT ON COLUMN phenix.positioning_family_products.pfp_id IS 'Sert de clé primaire à la table.';
COMMENT ON COLUMN phenix.positioning_family_products.pfp_whs_code IS 'Indique le code de l''entrepôt.';
COMMENT ON COLUMN phenix.positioning_family_products.pfp_pof_code IS 'Indique le code du positonnement de la famille.';
COMMENT ON COLUMN phenix.positioning_family_products.pfp_prf_prd_code IS 'Indique le code du produit.';
COMMENT ON COLUMN phenix.positioning_family_products.pfp_prf_fmt_code IS 'Indique le format du produit.';
COMMENT ON COLUMN phenix.positioning_family_products.pfp_average_daily_sales IS 'Indique la moyenne journalière des ventes du format produit.';
COMMENT ON COLUMN phenix.positioning_family_products.pfp_rac_code IS 'Indique le type de rayonnage suggérer pour le produit. ';
COMMENT ON COLUMN phenix.positioning_family_products.pfp_number_of_pickings IS 'Indique le nombre de transaction cueillette effectué pendant la période ciblée.';
COMMENT ON COLUMN phenix.positioning_family_products.pfp_double_loc_switch IS 'Indique si le produit a besoin d''une double localisation.';
COMMENT ON COLUMN phenix.positioning_family_products.pfp_item_per_rows IS 'Indique le nombre de items par rangée sur une palette.';