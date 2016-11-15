CREATE TABLE phenix.temporary_pallets (
  tpa_id NUMBER(15) NOT NULL,
  tpa_pmh_id NUMBER(15) NOT NULL,
  tpa_whz_code VARCHAR2(2 BYTE) NOT NULL,
  tpa_cus_code NUMBER(10) NOT NULL,
  tpa_cgr_code NUMBER(3),
  tpa_pty_code NUMBER(3),
  tpa_route_date DATE NOT NULL,
  tpa_rou_code NUMBER(5) NOT NULL,
  tpa_route_position NUMBER(7,2) NOT NULL,
  tpa_whs_delivery_code VARCHAR2(2 BYTE) NOT NULL,
  tpa_whs_picking_code VARCHAR2(2 BYTE) NOT NULL,
  tpa_overstock_switch NUMBER(1) NOT NULL,
  tpa_expected_volume NUMBER(10,3) NOT NULL,
  tpa_temp_pallet_id NUMBER(15),
  tpa_sid_id NUMBER(15) NOT NULL,
  tpa_from_seq NUMBER(3),
  tpa_prw_whz_code VARCHAR2(2 BYTE),
  tpa_manual_switch NUMBER(1) DEFAULT 0 NOT NULL,
  tpa_selected_switch NUMBER(1) DEFAULT 0 NOT NULL,
  CONSTRAINT tpa_pk PRIMARY KEY (tpa_id)
);
COMMENT ON COLUMN phenix.temporary_pallets.tpa_prw_whz_code IS 'Indique le code de la zone d''entreposage du produit dans l''entrepôt';
COMMENT ON COLUMN phenix.temporary_pallets.tpa_manual_switch IS 'Indique si la palette a été créée par la génération manuelle (génération des palettes) ou si la palette en cours a été sélectionnée pour créer une nouvelle palette manuelle(réorganisation manuelle des palettes)';
COMMENT ON COLUMN phenix.temporary_pallets.tpa_selected_switch IS 'Indique que la palette est sélectionnée pour la génération manuelle';