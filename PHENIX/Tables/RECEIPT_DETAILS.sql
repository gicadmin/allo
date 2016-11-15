CREATE TABLE phenix.receipt_details (
  rcd_id NUMBER(15) NOT NULL,
  rcd_pod_poh_id NUMBER(15) NOT NULL,
  rcd_pod_line_number NUMBER(4) NOT NULL,
  rcd_rch_ven_code NUMBER(5) NOT NULL,
  rcd_rch_number VARCHAR2(15 BYTE) NOT NULL,
  rcd_rch_source VARCHAR2(1 BYTE) NOT NULL,
  rcd_line_number NUMBER(4) NOT NULL,
  rcd_mah_ap_invoice_number NUMBER(15),
  rcd_palette_number VARCHAR2(10 BYTE) NOT NULL,
  rcd_date_closed DATE,
  rcd_received_quantity NUMBER(7),
  rcd_received_weight NUMBER(8,3),
  rcd_shipment_quantity NUMBER(7),
  rcd_shipment_weight NUMBER(8,3),
  rcd_date_confirmed DATE,
  rcd_recalc_status VARCHAR2(1 BYTE),
  rcd_quantity_cancelled NUMBER(7),
  rcd_weight_cancelled NUMBER(9,3),
  rcd_use_code NUMBER(5),
  rcd_cancelled_date DATE,
  rcd_expiry_date DATE,
  CONSTRAINT rcd_pk PRIMARY KEY (rcd_id),
  CONSTRAINT rcd_uk UNIQUE (rcd_rch_ven_code,rcd_rch_number,rcd_rch_source,rcd_line_number,rcd_palette_number),
  CONSTRAINT rcd_mah_fk FOREIGN KEY (rcd_mah_ap_invoice_number) REFERENCES phenix.match_headers (mah_ap_invoice_number),
  CONSTRAINT rcd_pod_fk FOREIGN KEY (rcd_pod_poh_id,rcd_pod_line_number) REFERENCES phenix.purchase_order_details (pod_poh_id,pod_line_number),
  CONSTRAINT rcd_rch_fk FOREIGN KEY (rcd_rch_ven_code,rcd_rch_number,rcd_rch_source) REFERENCES phenix.receipt_headers (rch_ven_code,rch_number,rch_source),
  CONSTRAINT rcd_use_fk FOREIGN KEY (rcd_use_code) REFERENCES phenix."USERS" (use_code)
);
COMMENT ON TABLE phenix.receipt_details IS 'Détails de la réception';
COMMENT ON COLUMN phenix.receipt_details.rcd_id IS 'Numéro de détail de réception';
COMMENT ON COLUMN phenix.receipt_details.rcd_pod_poh_id IS 'Numéro d''entête de commande d''achat';
COMMENT ON COLUMN phenix.receipt_details.rcd_pod_line_number IS 'Numéro de ligne de commande d''achat';
COMMENT ON COLUMN phenix.receipt_details.rcd_rch_ven_code IS 'Numéro de vendeur pour l''entête de la réception';
COMMENT ON COLUMN phenix.receipt_details.rcd_rch_number IS 'Numéro d''entête de réception';
COMMENT ON COLUMN phenix.receipt_details.rcd_rch_source IS 'Indique si l''enregistrement fut créé électroniquement ou via l''application';
COMMENT ON COLUMN phenix.receipt_details.rcd_line_number IS 'Numéro de ligne de détail';
COMMENT ON COLUMN phenix.receipt_details.rcd_mah_ap_invoice_number IS 'Numéro de la facture des comptes payables';
COMMENT ON COLUMN phenix.receipt_details.rcd_palette_number IS 'Numéro de la palette';
COMMENT ON COLUMN phenix.receipt_details.rcd_date_closed IS 'Date de fermeture de la ligne';
COMMENT ON COLUMN phenix.receipt_details.rcd_received_quantity IS 'Quantité reçu';
COMMENT ON COLUMN phenix.receipt_details.rcd_received_weight IS 'Poids reçu';
COMMENT ON COLUMN phenix.receipt_details.rcd_shipment_quantity IS 'Quantité envoyé';
COMMENT ON COLUMN phenix.receipt_details.rcd_shipment_weight IS 'Poids envoyé';
COMMENT ON COLUMN phenix.receipt_details.rcd_date_confirmed IS 'Date de confirmation';
COMMENT ON COLUMN phenix.receipt_details.rcd_recalc_status IS 'Indique si le prix lié à cette réception a été modifié lors de la facturation et nécessite un recalcul des coûtants moyens.';
COMMENT ON COLUMN phenix.receipt_details.rcd_quantity_cancelled IS 'Quantité cancellé';
COMMENT ON COLUMN phenix.receipt_details.rcd_weight_cancelled IS 'Poids cancellé';
COMMENT ON COLUMN phenix.receipt_details.rcd_use_code IS 'Usager qui a cancellé la ligne de commande';
COMMENT ON COLUMN phenix.receipt_details.rcd_cancelled_date IS 'Date de cancellation';
COMMENT ON COLUMN phenix.receipt_details.rcd_expiry_date IS 'Date d''expiration de la ligne de réception';