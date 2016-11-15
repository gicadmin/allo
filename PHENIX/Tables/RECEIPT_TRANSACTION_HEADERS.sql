CREATE TABLE phenix.receipt_transaction_headers (
  rth_id NUMBER(15) NOT NULL,
  rth_type VARCHAR2(1 BYTE) NOT NULL CONSTRAINT rth_type_ck CHECK (rth_type IN ('P', 'R')),
  rth_date DATE,
  rth_truck_temperature NUMBER(4,1),
  rth_whs_code VARCHAR2(2 BYTE) NOT NULL,
  rth_tkc_code NUMBER(3),
  CONSTRAINT rth_pk PRIMARY KEY (rth_id),
  CONSTRAINT rth_tkc_fk FOREIGN KEY (rth_tkc_code) REFERENCES phenix.truck_cleanliness (tkc_code),
  CONSTRAINT rth_whs_fk FOREIGN KEY (rth_whs_code) REFERENCES phenix.warehouses (whs_code)
);
COMMENT ON TABLE phenix.receipt_transaction_headers IS 'En-tête des historiques de réception';
COMMENT ON COLUMN phenix.receipt_transaction_headers.rth_id IS 'Identifiant unique';
COMMENT ON COLUMN phenix.receipt_transaction_headers.rth_type IS 'Type indiquant s''il s''agit d''un PO ou d''un RMA';
COMMENT ON COLUMN phenix.receipt_transaction_headers.rth_date IS 'Date de début des transactions';
COMMENT ON COLUMN phenix.receipt_transaction_headers.rth_truck_temperature IS 'Indique la température du camion de livraison lors de la réception';
COMMENT ON COLUMN phenix.receipt_transaction_headers.rth_whs_code IS 'Indique l''entrepôt ';
COMMENT ON COLUMN phenix.receipt_transaction_headers.rth_tkc_code IS 'Indique la propreté du camion de livraison lors de la réception';