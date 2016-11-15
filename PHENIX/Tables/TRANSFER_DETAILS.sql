CREATE TABLE phenix.transfer_details (
  trd_id NUMBER(15) NOT NULL,
  trd_trh_id NUMBER(15),
  trd_line_number NUMBER(4),
  trd_prf_prd_code VARCHAR2(10 BYTE) NOT NULL,
  trd_prf_fmt_code VARCHAR2(7 BYTE) NOT NULL,
  trd_requested_quantity NUMBER(7),
  trd_requested_weight NUMBER(9,3),
  trd_picked_quantity NUMBER(7),
  trd_picked_weight NUMBER(9,3),
  trd_received_quantity NUMBER(7),
  trd_received_weight NUMBER(9,3),
  trd_cost_price NUMBER(7,2),
  trd_authorized_quantity NUMBER(7),
  trd_authorized_weight NUMBER(9,3),
  trd_use_picker_code NUMBER(5),
  trd_use_reception_code NUMBER(5),
  trd_whs_from_code VARCHAR2(2 BYTE) NOT NULL,
  trd_whs_to_code VARCHAR2(2 BYTE) NOT NULL,
  trd_creation_source VARCHAR2(2 BYTE) NOT NULL CONSTRAINT trd_creation_source_ck CHECK (trd_creation_source IN ('PH', 'RF', 'CP', 'TR', 'SG')),
  trd_poh_id NUMBER(15),
  trd_creation_date DATE NOT NULL,
  trd_expected_shipping_date DATE NOT NULL,
  trd_loc_code VARCHAR2(12 BYTE),
  trd_use_po_recept_code NUMBER(5),
  CONSTRAINT trd_pk PRIMARY KEY (trd_id),
  CONSTRAINT trd_poh_fk FOREIGN KEY (trd_poh_id) REFERENCES phenix.purchase_order_headers (poh_id),
  CONSTRAINT trd_prf_fk FOREIGN KEY (trd_prf_prd_code,trd_prf_fmt_code) REFERENCES phenix.product_formats (prf_prd_code,prf_fmt_code),
  CONSTRAINT trd_trh_fk FOREIGN KEY (trd_trh_id) REFERENCES phenix.transfer_headers (trh_id),
  CONSTRAINT trd_use_picker_code_fk FOREIGN KEY (trd_use_picker_code) REFERENCES phenix."USERS" (use_code),
  CONSTRAINT trd_use_po_fk FOREIGN KEY (trd_use_po_recept_code) REFERENCES phenix."USERS" (use_code),
  CONSTRAINT trd_use_reception_code_fk FOREIGN KEY (trd_use_reception_code) REFERENCES phenix."USERS" (use_code),
  CONSTRAINT trd_whs_from_fk FOREIGN KEY (trd_whs_from_code) REFERENCES phenix.warehouses (whs_code),
  CONSTRAINT trd_whs_to_fk FOREIGN KEY (trd_whs_to_code) REFERENCES phenix.warehouses (whs_code)
);
COMMENT ON COLUMN phenix.transfer_details.trd_id IS 'Indique l''identifiant unique de la ligne de transfert';
COMMENT ON COLUMN phenix.transfer_details.trd_trh_id IS 'Indique l''identifiant du transfert';
COMMENT ON COLUMN phenix.transfer_details.trd_line_number IS 'Indique le numéro de ligne du transfert';
COMMENT ON COLUMN phenix.transfer_details.trd_prf_prd_code IS 'Indique le code du produit';
COMMENT ON COLUMN phenix.transfer_details.trd_prf_fmt_code IS 'Indique le format du produit';
COMMENT ON COLUMN phenix.transfer_details.trd_requested_quantity IS 'Indique la quantité demandée';
COMMENT ON COLUMN phenix.transfer_details.trd_requested_weight IS 'Indique le poids demandé';
COMMENT ON COLUMN phenix.transfer_details.trd_picked_quantity IS 'Indique la quantité cueillie';
COMMENT ON COLUMN phenix.transfer_details.trd_picked_weight IS 'Indique le poids cueilli';
COMMENT ON COLUMN phenix.transfer_details.trd_received_quantity IS 'Indique la quantité reçue';
COMMENT ON COLUMN phenix.transfer_details.trd_received_weight IS 'Indique le poids reçu';
COMMENT ON COLUMN phenix.transfer_details.trd_cost_price IS 'Indique le coutant';
COMMENT ON COLUMN phenix.transfer_details.trd_authorized_quantity IS 'Indique la quantité autorisée';
COMMENT ON COLUMN phenix.transfer_details.trd_authorized_weight IS 'Indique le poids autorisé';
COMMENT ON COLUMN phenix.transfer_details.trd_use_picker_code IS 'Indique le code de l''usager qui a effectué la cueillette';
COMMENT ON COLUMN phenix.transfer_details.trd_use_reception_code IS 'Indique le code de l''usager qui a effectué la réception';
COMMENT ON COLUMN phenix.transfer_details.trd_whs_from_code IS 'Indique le code d''entrepôt d''où provient la marchandise';
COMMENT ON COLUMN phenix.transfer_details.trd_whs_to_code IS 'Indique le code d''entrepôt où sera livré la marchandise';
COMMENT ON COLUMN phenix.transfer_details.trd_creation_source IS 'Indique la méthode utilisée pour la création du transfert';
COMMENT ON COLUMN phenix.transfer_details.trd_poh_id IS 'Indique le numéro de commande d''achat';
COMMENT ON COLUMN phenix.transfer_details.trd_creation_date IS 'Indique la date de création';
COMMENT ON COLUMN phenix.transfer_details.trd_expected_shipping_date IS 'Indique la date prévue du transfert';
COMMENT ON COLUMN phenix.transfer_details.trd_loc_code IS 'Indique le code de la localisation utilisée pour le "Cross-dock"';
COMMENT ON COLUMN phenix.transfer_details.trd_use_po_recept_code IS 'Indique l''utilisateur qui a effectué la réception du PO';