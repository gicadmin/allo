CREATE GLOBAL TEMPORARY TABLE phenix.temporary_spec_order_releases (
  tso_prd_code VARCHAR2(10 BYTE),
  tso_prd_description VARCHAR2(45 BYTE),
  tso_prd_definition VARCHAR2(1 BYTE),
  tso_prf_fmt_code VARCHAR2(7 BYTE),
  tso_prd_fmt_solid_inv_code VARCHAR2(7 BYTE),
  tso_prd_pgr_code NUMBER(5),
  tso_prd_ven_code NUMBER(5),
  tso_ven_short_name VARCHAR2(15 BYTE),
  tso_prd_brn_code NUMBER(5),
  tso_marque_manuf VARCHAR2(15 BYTE),
  tso_prd_ctg_code NUMBER(5),
  tso_prd_catalog_sequence_code NUMBER(5),
  tso_fmt_short_code VARCHAR2(2 BYTE),
  tso_prf_description VARCHAR2(30 BYTE),
  tso_qty_wgt_available NUMBER(10,3),
  tso_pgr_sales_format NUMBER(1),
  tso_wsp_whs_picking_code VARCHAR2(2 BYTE),
  tso_already_ordered_switch NUMBER(1),
  tso_on_hand NUMBER,
  tso_on_cod_order NUMBER,
  tso_being_received NUMBER
)
ON COMMIT PRESERVE ROWS;
COMMENT ON TABLE phenix.temporary_spec_order_releases IS 'Table utilisée pour le popup_special_order_release';
COMMENT ON COLUMN phenix.temporary_spec_order_releases.tso_prd_code IS 'Indique le code du produit';
COMMENT ON COLUMN phenix.temporary_spec_order_releases.tso_prd_description IS 'Indique la description du produit';
COMMENT ON COLUMN phenix.temporary_spec_order_releases.tso_prd_definition IS 'Indique la définition du produit';
COMMENT ON COLUMN phenix.temporary_spec_order_releases.tso_prf_fmt_code IS 'Indique le format du produit';
COMMENT ON COLUMN phenix.temporary_spec_order_releases.tso_prd_fmt_solid_inv_code IS 'Indique le format solide d''inventaire du produit';
COMMENT ON COLUMN phenix.temporary_spec_order_releases.tso_prd_pgr_code IS 'Indique le code du groupe du produit';
COMMENT ON COLUMN phenix.temporary_spec_order_releases.tso_prd_ven_code IS 'Indique le code du vendeur du produit';
COMMENT ON COLUMN phenix.temporary_spec_order_releases.tso_ven_short_name IS 'Indique le nom court du vendeur';
COMMENT ON COLUMN phenix.temporary_spec_order_releases.tso_prd_brn_code IS 'Indique le code du manufacturier du produit';
COMMENT ON COLUMN phenix.temporary_spec_order_releases.tso_marque_manuf IS 'Indique la marque ou le manufacturier';
COMMENT ON COLUMN phenix.temporary_spec_order_releases.tso_prd_ctg_code IS 'Indique l''entête du catalogue';
COMMENT ON COLUMN phenix.temporary_spec_order_releases.tso_prd_catalog_sequence_code IS 'Indique la séquence du catalogue';
COMMENT ON COLUMN phenix.temporary_spec_order_releases.tso_fmt_short_code IS 'Indique le format court du produit';
COMMENT ON COLUMN phenix.temporary_spec_order_releases.tso_prf_description IS 'Indique l''empaquetage du produit';
COMMENT ON COLUMN phenix.temporary_spec_order_releases.tso_qty_wgt_available IS 'Indique la quantité ou le poids disponible';
COMMENT ON COLUMN phenix.temporary_spec_order_releases.tso_pgr_sales_format IS 'Indique le format de vente par défaut';
COMMENT ON COLUMN phenix.temporary_spec_order_releases.tso_wsp_whs_picking_code IS 'Indique le code d''entrepôt de cueillette';
COMMENT ON COLUMN phenix.temporary_spec_order_releases.tso_already_ordered_switch IS 'Indique si le produit a été déjà commandé ou pas';