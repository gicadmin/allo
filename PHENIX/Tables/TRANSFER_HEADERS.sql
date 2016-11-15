CREATE TABLE phenix.transfer_headers (
  trh_id NUMBER(15) NOT NULL,
  trh_whs_from_code VARCHAR2(2 BYTE) NOT NULL,
  trh_whs_to_code VARCHAR2(2 BYTE) NOT NULL,
  trh_picking_date DATE,
  trh_receiving_date DATE,
  trh_use_lock_code NUMBER(5),
  trh_status VARCHAR2(4 BYTE) NOT NULL CONSTRAINT trh_status_ck CHECK (trh_status IN ('CRE','OPN','PIC','WAI','REC','CLS')),
  trh_shipping_date DATE,
  CONSTRAINT trh_pk PRIMARY KEY (trh_id),
  CONSTRAINT trh_whs_from_fk FOREIGN KEY (trh_whs_from_code) REFERENCES phenix.warehouses (whs_code),
  CONSTRAINT trh_whs_to_fk FOREIGN KEY (trh_whs_to_code) REFERENCES phenix.warehouses (whs_code)
);
COMMENT ON TABLE phenix.transfer_headers IS 'Identifie les transfert de marchandise interco';
COMMENT ON COLUMN phenix.transfer_headers.trh_id IS 'Indique l''identifiant unique de la table';
COMMENT ON COLUMN phenix.transfer_headers.trh_whs_from_code IS 'Indique le code de l''entrepôt source';
COMMENT ON COLUMN phenix.transfer_headers.trh_whs_to_code IS 'Indique le code de l''entrepôt de destination';
COMMENT ON COLUMN phenix.transfer_headers.trh_picking_date IS 'Indique la date de la cueillette du transfert';
COMMENT ON COLUMN phenix.transfer_headers.trh_receiving_date IS 'Indique la date de réception du transfert';
COMMENT ON COLUMN phenix.transfer_headers.trh_use_lock_code IS 'Indique l''utilisateur qui a réservé le transfert';
COMMENT ON COLUMN phenix.transfer_headers.trh_status IS 'Indique le statut';
COMMENT ON COLUMN phenix.transfer_headers.trh_shipping_date IS 'Indique la date d''expédition du transfert';