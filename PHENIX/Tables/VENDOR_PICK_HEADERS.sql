CREATE TABLE phenix.vendor_pick_headers (
  vph_id NUMBER(15) NOT NULL,
  vph_ven_code NUMBER(5) NOT NULL,
  vph_date_generated DATE,
  vph_date_confirmed DATE,
  vph_number_of_packages NUMBER(4),
  vph_status VARCHAR2(3 BYTE) DEFAULT 'IPR' NOT NULL CONSTRAINT vph_status_ck CHECK (VPH_STATUS IN ('OPN','IPR','RTI','PEN','CLS')),
  vph_creation_date DATE DEFAULT SYSDATE NOT NULL,
  vph_loc_shipping_dock_code VARCHAR2(12 BYTE),
  vph_selected_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT vph_selected_switch_ck CHECK (VPH_SELECTED_SWITCH IN (0,1)),
  vph_whs_picking_code VARCHAR2(2 BYTE) NOT NULL,
  vph_whs_delivery_code VARCHAR2(2 BYTE) NOT NULL,
  CONSTRAINT vph_pk PRIMARY KEY (vph_id),
  CONSTRAINT vph_ven_fk FOREIGN KEY (vph_ven_code) REFERENCES phenix.vendors (ven_code),
  CONSTRAINT vph_whs_delivery_fk FOREIGN KEY (vph_whs_delivery_code) REFERENCES phenix.warehouses (whs_code),
  CONSTRAINT vph_whs_picking_fk FOREIGN KEY (vph_whs_picking_code) REFERENCES phenix.warehouses (whs_code)
);
COMMENT ON TABLE phenix.vendor_pick_headers IS 'Table d''entête de cueillette des charges et retours des fournisseurs';
COMMENT ON COLUMN phenix.vendor_pick_headers.vph_id IS 'Identifiant unique';
COMMENT ON COLUMN phenix.vendor_pick_headers.vph_ven_code IS 'Code fournisseur';
COMMENT ON COLUMN phenix.vendor_pick_headers.vph_date_generated IS 'Date de génération';
COMMENT ON COLUMN phenix.vendor_pick_headers.vph_date_confirmed IS 'Date de confirmation';
COMMENT ON COLUMN phenix.vendor_pick_headers.vph_number_of_packages IS 'Nombre de colis';
COMMENT ON COLUMN phenix.vendor_pick_headers.vph_status IS 'Indique le statut de la cueillette fournisseur';
COMMENT ON COLUMN phenix.vendor_pick_headers.vph_creation_date IS 'Indique la date de création de la demande de cueillette fournisseur';
COMMENT ON COLUMN phenix.vendor_pick_headers.vph_loc_shipping_dock_code IS 'Indique le code de localisation du quai d''expédition de la demande de cueillette fournisseur';
COMMENT ON COLUMN phenix.vendor_pick_headers.vph_selected_switch IS 'Indique que la cueillette fournisseur est sélectionnée pour être prêt à cueillir';
COMMENT ON COLUMN phenix.vendor_pick_headers.vph_whs_picking_code IS 'Indique le code de l''entrepôt de cueillette';
COMMENT ON COLUMN phenix.vendor_pick_headers.vph_whs_delivery_code IS 'Indique le code de l''entrepôt de livraison';