CREATE TABLE phenix.temporary_multi_whs_headers (
  tmh_tch_id NUMBER(15) NOT NULL,
  tmh_whs_code VARCHAR2(2 BYTE) NOT NULL,
  tmh_whs_name VARCHAR2(30 BYTE) NOT NULL,
  tmh_order_date DATE NOT NULL,
  tmh_expected_recep_date DATE NOT NULL,
  tmh_cancel_date DATE,
  tmh_prebook_switch NUMBER(1) NOT NULL,
  tmh_ven_to_pay_code NUMBER(5) NOT NULL,
  tmh_message VARCHAR2(100 BYTE),
  tmh_pickup_address VARCHAR2(45 BYTE),
  tmh_pickup_city VARCHAR2(30 BYTE),
  tmh_pickup_prv_code VARCHAR2(2 BYTE),
  tmh_pickup_postal_code VARCHAR2(10 BYTE),
  tmh_system_expected_recep_date DATE NOT NULL,
  tmh_vwh_ship_days NUMBER,
  tmh_pickup_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT tmh_pickup_switch_ck CHECK (TMH_PICKUP_SWITCH IN (0, 1)),
  tmh_pickup_reference VARCHAR2(15 BYTE),
  tmh_whs_sequence NUMBER(2) DEFAULT 1 NOT NULL,
  CONSTRAINT tmh_pk PRIMARY KEY (tmh_tch_id,tmh_whs_code),
  CONSTRAINT tmh_tch_fk FOREIGN KEY (tmh_tch_id) REFERENCES phenix.temporary_caps_headers (tch_id) ON DELETE CASCADE,
  CONSTRAINT tmh_whs_fk FOREIGN KEY (tmh_whs_code) REFERENCES phenix.warehouses (whs_code) ON DELETE CASCADE
);
COMMENT ON COLUMN phenix.temporary_multi_whs_headers.tmh_pickup_switch IS 'Indique si la commande doit être ramassée chez le fournisseur';
COMMENT ON COLUMN phenix.temporary_multi_whs_headers.tmh_pickup_reference IS 'Indique le numéro de référence lors du ramassage chez le fournisseur';
COMMENT ON COLUMN phenix.temporary_multi_whs_headers.tmh_whs_sequence IS 'Indique ordre de tri des entrepôts';