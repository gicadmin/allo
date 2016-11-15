CREATE TABLE phenix.shipment_audits (
  sha_id NUMBER(15) NOT NULL,
  sha_date DATE NOT NULL,
  sha_load_window NUMBER(4) NOT NULL,
  sha_car_code NUMBER(5) NOT NULL,
  sha_trailer_number VARCHAR2(4 BYTE) NOT NULL,
  sha_loc_code VARCHAR2(12 BYTE) NOT NULL,
  sha_cus_code NUMBER(10),
  sha_ven_code NUMBER(5),
  sha_container_id NUMBER(12) NOT NULL,
  sha_container_suffix VARCHAR2(1 BYTE),
  sha_use_code NUMBER(5) NOT NULL,
  sha_reference_number VARCHAR2(15 BYTE),
  sha_load_unload_flag VARCHAR2(1 BYTE) NOT NULL CONSTRAINT sha_load_unload_flag_ck CHECK (SHA_LOAD_UNLOAD_FLAG IN ('L','U')),
  sha_pmh_id NUMBER(15),
  sha_actual_loc_code VARCHAR2(12 BYTE) NOT NULL,
  CONSTRAINT sha_cus_ven_ck CHECK ((SHA_CUS_CODE is not null and SHA_VEN_CODE IS NULL)
  or (SHA_CUS_CODE is null and SHA_VEN_CODE IS not NULL)
 ),
  CONSTRAINT sha_pk PRIMARY KEY (sha_id),
  CONSTRAINT sha_car_fk FOREIGN KEY (sha_car_code) REFERENCES phenix.carriers (car_code),
  CONSTRAINT sha_cus_fk FOREIGN KEY (sha_cus_code) REFERENCES phenix.customers (cus_code),
  CONSTRAINT sha_pmh_fk FOREIGN KEY (sha_pmh_id) REFERENCES phenix.pick_mission_headers (pmh_id) ON DELETE CASCADE,
  CONSTRAINT sha_use_fk FOREIGN KEY (sha_use_code) REFERENCES phenix."USERS" (use_code),
  CONSTRAINT sha_ven_fk FOREIGN KEY (sha_ven_code) REFERENCES phenix.vendors (ven_code)
);
COMMENT ON TABLE phenix.shipment_audits IS 'Table contenant les audits d''expédition';
COMMENT ON COLUMN phenix.shipment_audits.sha_id IS 'Indique l''identifiant unique de la table';
COMMENT ON COLUMN phenix.shipment_audits.sha_date IS 'Indique la date de l''expédition';
COMMENT ON COLUMN phenix.shipment_audits.sha_load_window IS 'Indique l''heure et minute de l''expédition ';
COMMENT ON COLUMN phenix.shipment_audits.sha_car_code IS 'Indique le code du transporteur';
COMMENT ON COLUMN phenix.shipment_audits.sha_trailer_number IS 'Indique le numéro de la remorque ';
COMMENT ON COLUMN phenix.shipment_audits.sha_loc_code IS 'Indique le code de la localisation du quai d''expédition ';
COMMENT ON COLUMN phenix.shipment_audits.sha_cus_code IS 'Indique le code du client';
COMMENT ON COLUMN phenix.shipment_audits.sha_ven_code IS 'Indique le code du fournisseur';
COMMENT ON COLUMN phenix.shipment_audits.sha_container_id IS 'Indique le code du conteneur';
COMMENT ON COLUMN phenix.shipment_audits.sha_container_suffix IS 'Indique le suffixe du conteneur';
COMMENT ON COLUMN phenix.shipment_audits.sha_use_code IS 'Indique le code de l''utilisateur';
COMMENT ON COLUMN phenix.shipment_audits.sha_reference_number IS 'Indique le numéro de référence ';
COMMENT ON COLUMN phenix.shipment_audits.sha_load_unload_flag IS 'Indique si l''opération est un chargement ou déchargement';
COMMENT ON COLUMN phenix.shipment_audits.sha_pmh_id IS 'Indique le numéro de mission';
COMMENT ON COLUMN phenix.shipment_audits.sha_actual_loc_code IS 'Indique le code de localisation actuel quand le conteneur est chargé dans le camion.';