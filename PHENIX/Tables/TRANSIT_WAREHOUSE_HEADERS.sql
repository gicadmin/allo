CREATE TABLE phenix.transit_warehouse_headers (
  twh_plh_id NUMBER(15) NOT NULL,
  twh_date DATE,
  twh_whs_delivery_code VARCHAR2(2 BYTE) NOT NULL,
  twh_whs_picking_code VARCHAR2(2 BYTE) NOT NULL,
  twh_cus_code NUMBER(10) NOT NULL,
  twh_rou_code NUMBER(5) NOT NULL,
  twh_rou_priority_code NUMBER(2),
  twh_status VARCHAR2(3 BYTE) NOT NULL CONSTRAINT twh_status_ck CHECK (twh_status IN ('RTS','REC','INI', 'RTW','CLS','CTR')),
  twh_transit_number NUMBER(5),
  twh_rou_delivery_code NUMBER(5),
  twh_invoice_switch NUMBER(1) CONSTRAINT twh_invoice_switch_ck CHECK ( twh_invoice_switch IN (0,1)),
  twh_rou_position NUMBER(7,2),
  twh_use_code_send NUMBER(5),
  twh_date_send DATE,
  twh_use_code_close NUMBER(5),
  twh_date_close DATE,
  CONSTRAINT twh_pk PRIMARY KEY (twh_plh_id) USING INDEX (CREATE UNIQUE INDEX phenix.twh_plh_id_fk_i ON phenix.transit_warehouse_headers(twh_plh_id)    ),
  CONSTRAINT twh_cus_code_fk FOREIGN KEY (twh_cus_code) REFERENCES phenix.customers (cus_code),
  CONSTRAINT twh_plh_id_fk FOREIGN KEY (twh_plh_id) REFERENCES phenix.pick_list_headers (plh_id) ON DELETE CASCADE,
  CONSTRAINT twh_rou_delelivry_code_fk FOREIGN KEY (twh_rou_delivery_code) REFERENCES phenix.routes (rou_code),
  CONSTRAINT twh_whs_delivery_code_fk FOREIGN KEY (twh_whs_delivery_code) REFERENCES phenix.warehouses (whs_code),
  CONSTRAINT twh_whs_picking_code_fk FOREIGN KEY (twh_whs_picking_code) REFERENCES phenix.warehouses (whs_code)
);
COMMENT ON TABLE phenix.transit_warehouse_headers IS 'En-tête des transites entre les entrepôts';
COMMENT ON COLUMN phenix.transit_warehouse_headers.twh_plh_id IS 'Indique le numéro de bon de ceuillette';
COMMENT ON COLUMN phenix.transit_warehouse_headers.twh_date IS 'Indique la date de génération';
COMMENT ON COLUMN phenix.transit_warehouse_headers.twh_whs_delivery_code IS 'Indique le code d''entrepôt de livraison';
COMMENT ON COLUMN phenix.transit_warehouse_headers.twh_whs_picking_code IS 'Indique le code d''entrepôt de cueillette';
COMMENT ON COLUMN phenix.transit_warehouse_headers.twh_cus_code IS 'Indique le code du client';
COMMENT ON COLUMN phenix.transit_warehouse_headers.twh_rou_code IS 'Indique le numéro de route';
COMMENT ON COLUMN phenix.transit_warehouse_headers.twh_rou_priority_code IS 'Indique la priorité de la route';
COMMENT ON COLUMN phenix.transit_warehouse_headers.twh_status IS 'Indique le status de transit';
COMMENT ON COLUMN phenix.transit_warehouse_headers.twh_transit_number IS 'Indique le numéro du transite';
COMMENT ON COLUMN phenix.transit_warehouse_headers.twh_rou_delivery_code IS 'Indique le numéro de la route de livraison';
COMMENT ON COLUMN phenix.transit_warehouse_headers.twh_invoice_switch IS 'Indique si le bon de commande est facturé ou non';
COMMENT ON COLUMN phenix.transit_warehouse_headers.twh_rou_position IS 'Indique la position du client dans la route';
COMMENT ON COLUMN phenix.transit_warehouse_headers.twh_use_code_send IS 'Indique le code d''utilisateur ayant envoyé le transit ';
COMMENT ON COLUMN phenix.transit_warehouse_headers.twh_date_send IS 'Indique la date/heure d''envoie du transit ';
COMMENT ON COLUMN phenix.transit_warehouse_headers.twh_use_code_close IS 'Indique le code d''utilisateur ayant fermé le transit ';
COMMENT ON COLUMN phenix.transit_warehouse_headers.twh_date_close IS 'Indique la date/heure de fermeture du transit ';