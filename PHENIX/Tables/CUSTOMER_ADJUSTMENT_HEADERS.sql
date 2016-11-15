CREATE TABLE phenix.customer_adjustment_headers (
  cah_id NUMBER(15) NOT NULL,
  cah_cus_code NUMBER(10) NOT NULL,
  cah_use_code NUMBER(5) NOT NULL,
  cah_delivery_charges NUMBER(7,2) NOT NULL,
  cah_open_switch NUMBER(1) NOT NULL CONSTRAINT cah_open_switch_ck CHECK (CAH_OPEN_SWITCH IN (0, 1)),
  cah_print_switch NUMBER(1) NOT NULL CONSTRAINT cah_print_switch_ck CHECK (CAH_PRINT_SWITCH IN (0, 1)),
  cah_ticket_charges NUMBER(7,2) NOT NULL,
  cah_transaction_date DATE NOT NULL,
  cah_message VARCHAR2(100 BYTE),
  cah_reference_number VARCHAR2(15 BYTE),
  cah_rth_id NUMBER(15),
  cah_status VARCHAR2(1 BYTE) DEFAULT 'O' NOT NULL CONSTRAINT cah_status_ck CHECK (cah_status IN ('O', 'R', 'A', 'F')),
  cah_whs_delivery_code VARCHAR2(2 BYTE) NOT NULL,
  cah_rma_whs_code VARCHAR2(2 BYTE),
  cah_print_date DATE,
  cah_crdh_id NUMBER(15),
  CONSTRAINT cah_pk PRIMARY KEY (cah_id),
  CONSTRAINT cah_crdh_fk FOREIGN KEY (cah_crdh_id) REFERENCES phenix.customer_route_docum_headers (crdh_id),
  CONSTRAINT cah_cus_fk FOREIGN KEY (cah_cus_code) REFERENCES phenix.customers (cus_code),
  CONSTRAINT cah_rma_whs_fk FOREIGN KEY (cah_rma_whs_code) REFERENCES phenix.warehouses (whs_code),
  CONSTRAINT cah_rth_fk FOREIGN KEY (cah_rth_id) REFERENCES phenix.receipt_transaction_headers (rth_id),
  CONSTRAINT cah_use_fk FOREIGN KEY (cah_use_code) REFERENCES phenix."USERS" (use_code),
  CONSTRAINT cah_whs_delivery_fk FOREIGN KEY (cah_whs_delivery_code) REFERENCES phenix.warehouses (whs_code)
);
COMMENT ON TABLE phenix.customer_adjustment_headers IS 'Entêtes des ajustement à la vente (Crédit/Débit)';
COMMENT ON COLUMN phenix.customer_adjustment_headers.cah_id IS 'Identifiant unique';
COMMENT ON COLUMN phenix.customer_adjustment_headers.cah_cus_code IS 'Numéro du client';
COMMENT ON COLUMN phenix.customer_adjustment_headers.cah_use_code IS 'Numéro de l''usager';
COMMENT ON COLUMN phenix.customer_adjustment_headers.cah_delivery_charges IS 'Surcharge de livraison';
COMMENT ON COLUMN phenix.customer_adjustment_headers.cah_open_switch IS 'Indique si l''ajustement est ouvert ou fermé';
COMMENT ON COLUMN phenix.customer_adjustment_headers.cah_print_switch IS 'Indique si l''ajustement est imprimée';
COMMENT ON COLUMN phenix.customer_adjustment_headers.cah_ticket_charges IS 'Surcharge des étiquettes';
COMMENT ON COLUMN phenix.customer_adjustment_headers.cah_transaction_date IS 'Date de la transaction';
COMMENT ON COLUMN phenix.customer_adjustment_headers.cah_message IS 'Message';
COMMENT ON COLUMN phenix.customer_adjustment_headers.cah_reference_number IS 'Numéro de référence';
COMMENT ON COLUMN phenix.customer_adjustment_headers.cah_rth_id IS 'Numéro d''en-tête des historiques de réception';
COMMENT ON COLUMN phenix.customer_adjustment_headers.cah_status IS 'Statut';
COMMENT ON COLUMN phenix.customer_adjustment_headers.cah_whs_delivery_code IS 'Indique l''entrepôt associé à l''adjustement ';
COMMENT ON COLUMN phenix.customer_adjustment_headers.cah_rma_whs_code IS 'Indique l''entrepôt qui devrait effectuer la réception du RMA';
COMMENT ON COLUMN phenix.customer_adjustment_headers.cah_print_date IS 'Indique la date de la route pour laquelle le RMA a été imprimé.';
COMMENT ON COLUMN phenix.customer_adjustment_headers.cah_crdh_id IS 'Indique le numero du sommaire lors de l impression des documents de routes';