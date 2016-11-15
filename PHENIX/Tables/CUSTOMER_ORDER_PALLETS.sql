CREATE TABLE phenix.customer_order_pallets (
  cop_id NUMBER(15) NOT NULL,
  cop_cot_cod_coh_id NUMBER(15) NOT NULL,
  cop_cot_cod_line_number NUMBER(4) NOT NULL,
  cop_cot_line_number NUMBER(4) NOT NULL,
  cop_pallet_number VARCHAR2(12 BYTE) NOT NULL,
  cop_pallet_quantity NUMBER(7),
  cop_pallet_weight NUMBER(9,3),
  cop_trailer_number VARCHAR2(12 BYTE),
  cop_real_container_id NUMBER(12),
  CONSTRAINT cop_pk PRIMARY KEY (cop_id),
  CONSTRAINT cop_cot_fk FOREIGN KEY (cop_cot_cod_coh_id,cop_cot_cod_line_number,cop_cot_line_number) REFERENCES phenix.customer_order_transactions (cot_cod_coh_id,cot_cod_line_number,cot_line_number) ON DELETE CASCADE
);
COMMENT ON TABLE phenix.customer_order_pallets IS 'Cette table contient l''information sur le contenu d''une palette';
COMMENT ON COLUMN phenix.customer_order_pallets.cop_cot_cod_coh_id IS 'Numéro de la commande';
COMMENT ON COLUMN phenix.customer_order_pallets.cop_cot_cod_line_number IS 'Numéro de ligne de la commande';
COMMENT ON COLUMN phenix.customer_order_pallets.cop_cot_line_number IS 'Numéro de ligne de la transaction';
COMMENT ON COLUMN phenix.customer_order_pallets.cop_pallet_number IS 'Code de palette';
COMMENT ON COLUMN phenix.customer_order_pallets.cop_pallet_quantity IS 'Nombre d''items placés sur la palette';
COMMENT ON COLUMN phenix.customer_order_pallets.cop_pallet_weight IS 'Total du poids des items placés sur la palette';
COMMENT ON COLUMN phenix.customer_order_pallets.cop_trailer_number IS 'Indique le numéro de remorque du camion';
COMMENT ON COLUMN phenix.customer_order_pallets.cop_real_container_id IS 'Indique le numéro du conteneur utilisé sur la mission';