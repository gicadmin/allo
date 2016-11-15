CREATE TABLE phenix.receipt_transaction_details (
  rtd_id NUMBER(15) NOT NULL,
  rtd_rth_id NUMBER(15) NOT NULL,
  rtd_trh_id NUMBER(15),
  rtd_prf_prd_code VARCHAR2(10 BYTE) NOT NULL,
  rtd_prf_fmt_code VARCHAR2(7 BYTE) NOT NULL,
  rtd_original_quantity NUMBER(7),
  rtd_received_quantity NUMBER(7),
  rtd_received_to_date_quantity NUMBER(7),
  rtd_original_weight NUMBER(10,3),
  rtd_received_weight NUMBER(10,3),
  rtd_received_to_date_weight NUMBER(10,3),
  rtd_use_code NUMBER(5) NOT NULL,
  rtd_loc_code VARCHAR2(12 BYTE),
  rtd_start_date DATE NOT NULL,
  rtd_end_date DATE,
  rtd_expiry_date DATE,
  rtd_damage_switch NUMBER(1) NOT NULL CONSTRAINT rtd_damage_switch_ck CHECK (rtd_damage_switch IN (0, 1)),
  rtd_number_of_stickers NUMBER(6),
  rtd_lot_switch NUMBER(1) NOT NULL CONSTRAINT rtd_lot_switch_ck CHECK (rtd_lot_switch IN (0, 1)),
  rtd_loc_quantity_on_hand NUMBER(10),
  rtd_loc_weight_on_hand NUMBER(10,3),
  rtd_ide_id NUMBER(12),
  rtd_dmr_code NUMBER(3),
  rtd_used_inventory_switch NUMBER(1) DEFAULT 0 NOT NULL,
  rtd_quantity_left NUMBER(7),
  rtd_weight_left NUMBER(10,3),
  CONSTRAINT rtd_pk PRIMARY KEY (rtd_id),
  CONSTRAINT rtd_dmr_fk FOREIGN KEY (rtd_dmr_code) REFERENCES phenix.damaged_reasons (dmr_code),
  CONSTRAINT rtd_prf_fk FOREIGN KEY (rtd_prf_prd_code,rtd_prf_fmt_code) REFERENCES phenix.product_formats (prf_prd_code,prf_fmt_code),
  CONSTRAINT rtd_rth_fk FOREIGN KEY (rtd_rth_id) REFERENCES phenix.receipt_transaction_headers (rth_id) ON DELETE CASCADE,
  CONSTRAINT rtd_trh_fk FOREIGN KEY (rtd_trh_id) REFERENCES phenix.transfer_headers (trh_id) ON DELETE CASCADE,
  CONSTRAINT rtd_use_fk FOREIGN KEY (rtd_use_code) REFERENCES phenix."USERS" (use_code)
);
COMMENT ON TABLE phenix.receipt_transaction_details IS 'La table des historiques de réception';
COMMENT ON COLUMN phenix.receipt_transaction_details.rtd_id IS 'Identifiant unique';
COMMENT ON COLUMN phenix.receipt_transaction_details.rtd_rth_id IS 'Numéro d''en-tête des historiques de réception';
COMMENT ON COLUMN phenix.receipt_transaction_details.rtd_trh_id IS 'Numéro d''en-tête de transfert de marchandise';
COMMENT ON COLUMN phenix.receipt_transaction_details.rtd_prf_prd_code IS 'Code de produit';
COMMENT ON COLUMN phenix.receipt_transaction_details.rtd_prf_fmt_code IS 'Format de produit';
COMMENT ON COLUMN phenix.receipt_transaction_details.rtd_original_quantity IS 'Quantité à recevoir';
COMMENT ON COLUMN phenix.receipt_transaction_details.rtd_received_quantity IS 'Quantité reçue sur cette transaction';
COMMENT ON COLUMN phenix.receipt_transaction_details.rtd_received_to_date_quantity IS 'Quantité reçue jusqu''à maintenant pour cette transaction';
COMMENT ON COLUMN phenix.receipt_transaction_details.rtd_original_weight IS 'Poids à recevoir';
COMMENT ON COLUMN phenix.receipt_transaction_details.rtd_received_weight IS 'Poids reçu sur cette transaction';
COMMENT ON COLUMN phenix.receipt_transaction_details.rtd_received_to_date_weight IS 'Poids reçu jusqu''à maintenant pour cette transaction';
COMMENT ON COLUMN phenix.receipt_transaction_details.rtd_use_code IS 'Code d''utilisateur';
COMMENT ON COLUMN phenix.receipt_transaction_details.rtd_loc_code IS 'Localisation de la réception';
COMMENT ON COLUMN phenix.receipt_transaction_details.rtd_start_date IS 'Date/heure de début de la réception';
COMMENT ON COLUMN phenix.receipt_transaction_details.rtd_end_date IS 'Date/heure de fin de la réception';
COMMENT ON COLUMN phenix.receipt_transaction_details.rtd_expiry_date IS 'Date d''expiration reliée à cette transaction de réception';
COMMENT ON COLUMN phenix.receipt_transaction_details.rtd_damage_switch IS 'Indique si cette transaction de réception contient des produits endommagés';
COMMENT ON COLUMN phenix.receipt_transaction_details.rtd_number_of_stickers IS 'Nombre d''étiquettes à imprimer pour cette transaction';
COMMENT ON COLUMN phenix.receipt_transaction_details.rtd_lot_switch IS 'Indique la gestion par LOT';
COMMENT ON COLUMN phenix.receipt_transaction_details.rtd_loc_quantity_on_hand IS 'Indique la quantité en inventaire dans cette localisation pour ce produit';
COMMENT ON COLUMN phenix.receipt_transaction_details.rtd_loc_weight_on_hand IS 'Indique le poids en inventaire dans cette localisation pour ce produit';
COMMENT ON COLUMN phenix.receipt_transaction_details.rtd_ide_id IS 'Indique le code d''identifiant de la réception';
COMMENT ON COLUMN phenix.receipt_transaction_details.rtd_dmr_code IS 'Indique le numéro de la raison de bris';
COMMENT ON COLUMN phenix.receipt_transaction_details.rtd_used_inventory_switch IS 'Indique si la transaction de réception a été utilisée dans l''inventaire';
COMMENT ON COLUMN phenix.receipt_transaction_details.rtd_quantity_left IS 'Indique la quantité restante pour la transaction de réception';
COMMENT ON COLUMN phenix.receipt_transaction_details.rtd_weight_left IS 'Indique le poids restant pour la transaction de réception';