CREATE TABLE phenix.shipment_delivery_accessories (
  sdc_id NUMBER(15) NOT NULL,
  sdc_rsh_id NUMBER(15) NOT NULL,
  sdc_dac_code NUMBER(3) NOT NULL,
  sdc_quantity NUMBER(7) NOT NULL,
  CONSTRAINT sdc_pk PRIMARY KEY (sdc_id) USING INDEX (CREATE INDEX phenix.sdc_pk ON phenix.shipment_delivery_accessories(sdc_id)    ),
  CONSTRAINT sdc_dac_fk FOREIGN KEY (sdc_dac_code) REFERENCES phenix.delivery_accessories (dac_code),
  CONSTRAINT sdc_rsh_fk FOREIGN KEY (sdc_rsh_id) REFERENCES phenix.route_shipments (rsh_id) ON DELETE CASCADE
);
COMMENT ON TABLE phenix.shipment_delivery_accessories IS 'Table des accessoires utilisés lors du chargement';
COMMENT ON COLUMN phenix.shipment_delivery_accessories.sdc_id IS 'Indique l''identifiant de la table';
COMMENT ON COLUMN phenix.shipment_delivery_accessories.sdc_rsh_id IS 'Indique le numéro du chargement';
COMMENT ON COLUMN phenix.shipment_delivery_accessories.sdc_dac_code IS 'Indique le code de l''accessoire';
COMMENT ON COLUMN phenix.shipment_delivery_accessories.sdc_quantity IS 'Indique la quantité mise dans le chargement';