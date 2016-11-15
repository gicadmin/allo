CREATE TABLE phenix.shipment_headers (
  shh_id NUMBER(15) NOT NULL,
  shh_date DATE NOT NULL,
  shh_load_window NUMBER(4) NOT NULL,
  shh_car_code NUMBER(5) NOT NULL,
  shh_trailer_number VARCHAR2(4 BYTE) NOT NULL,
  shh_loc_code VARCHAR2(12 BYTE) NOT NULL,
  shh_cus_code NUMBER(10),
  shh_ven_code NUMBER(5),
  shh_temperature NUMBER(4,1),
  shh_reference_number VARCHAR2(15 BYTE),
  shh_in_process_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT shh_in_process_switch_ck CHECK (SHH_IN_PROCESS_SWITCH IN (0,1)),
  CONSTRAINT shh_cus_ven_ck CHECK ((SHH_CUS_CODE is not null and SHH_VEN_CODE IS NULL)
  or (SHH_CUS_CODE is null and SHH_VEN_CODE IS not NULL)
 ),
  CONSTRAINT shh_pk PRIMARY KEY (shh_id),
  CONSTRAINT shh_car_fk FOREIGN KEY (shh_car_code) REFERENCES phenix.carriers (car_code),
  CONSTRAINT shh_cus_fk FOREIGN KEY (shh_cus_code) REFERENCES phenix.customers (cus_code),
  CONSTRAINT shh_ven_fk FOREIGN KEY (shh_ven_code) REFERENCES phenix.vendors (ven_code)
);
COMMENT ON TABLE phenix.shipment_headers IS 'Table utilisée pour les entêtes d''expédition';
COMMENT ON COLUMN phenix.shipment_headers.shh_id IS 'Indique l''identifiant unique de la table';
COMMENT ON COLUMN phenix.shipment_headers.shh_date IS 'Indique la date de la transaction';
COMMENT ON COLUMN phenix.shipment_headers.shh_load_window IS 'Indique l''heure et minute de la transaction ';
COMMENT ON COLUMN phenix.shipment_headers.shh_car_code IS 'Indique le code du transporteur';
COMMENT ON COLUMN phenix.shipment_headers.shh_trailer_number IS 'Indique le numéro de la remorque ';
COMMENT ON COLUMN phenix.shipment_headers.shh_loc_code IS 'Indique le code de la localisation du quai d''expédition ';
COMMENT ON COLUMN phenix.shipment_headers.shh_cus_code IS 'Indique le code du client';
COMMENT ON COLUMN phenix.shipment_headers.shh_ven_code IS 'Indique le code du fournisseur';
COMMENT ON COLUMN phenix.shipment_headers.shh_temperature IS 'Indique la température du camion';
COMMENT ON COLUMN phenix.shipment_headers.shh_reference_number IS 'Indique le numéro de référence ';
COMMENT ON COLUMN phenix.shipment_headers.shh_in_process_switch IS 'Indique si l''expédition est en processus d''être chargée';