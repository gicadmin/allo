CREATE TABLE phenix.customer_dock_assignments (
  cda_id NUMBER(15) NOT NULL,
  cda_loc_code VARCHAR2(12 BYTE) NOT NULL,
  cda_cus_code NUMBER(10),
  cda_ven_code NUMBER(5),
  cda_possession_hour NUMBER(2),
  cda_possession_minute NUMBER(2),
  cda_ready_to_load_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT cda_ready_to_load_switch_ck CHECK (CDA_READY_TO_LOAD_SWITCH IN (0,1)),
  cda_car_code NUMBER(5),
  cda_trk_code VARCHAR2(8 BYTE),
  CONSTRAINT cda_cus_ven_ck CHECK ((CDA_CUS_CODE is not null and CDA_VEN_CODE IS NULL)
  or (CDA_CUS_CODE is null and CDA_VEN_CODE IS not NULL)
 ),
  CONSTRAINT cda_pk PRIMARY KEY (cda_id),
  CONSTRAINT cda_uk UNIQUE (cda_loc_code,cda_cus_code,cda_ven_code),
  CONSTRAINT cda_car_fk FOREIGN KEY (cda_car_code) REFERENCES phenix.carriers (car_code),
  CONSTRAINT cda_cus_fk FOREIGN KEY (cda_cus_code) REFERENCES phenix.customers (cus_code) ON DELETE CASCADE,
  CONSTRAINT cda_loc_fk FOREIGN KEY (cda_loc_code) REFERENCES phenix.locations (loc_code),
  CONSTRAINT cda_trk_fk FOREIGN KEY (cda_trk_code) REFERENCES phenix.trucks (trk_code),
  CONSTRAINT cda_ven_fk FOREIGN KEY (cda_ven_code) REFERENCES phenix.vendors (ven_code)
);
COMMENT ON TABLE phenix.customer_dock_assignments IS 'Table utilisée pour l''assignation des quais pour les clients ou les fournisseurs ';
COMMENT ON COLUMN phenix.customer_dock_assignments.cda_id IS 'Indique l''identifiant unique de la table';
COMMENT ON COLUMN phenix.customer_dock_assignments.cda_loc_code IS 'Indique le code de la localisation';
COMMENT ON COLUMN phenix.customer_dock_assignments.cda_cus_code IS 'Indique le code du client';
COMMENT ON COLUMN phenix.customer_dock_assignments.cda_ven_code IS 'Indique le code du fournisseur';
COMMENT ON COLUMN phenix.customer_dock_assignments.cda_possession_hour IS 'Indique l''heure prévue de prise de possession du quai par le client/fournisseur';
COMMENT ON COLUMN phenix.customer_dock_assignments.cda_possession_minute IS 'Indique la minute prévue de prise de possession du quai par le client/fournisseur';
COMMENT ON COLUMN phenix.customer_dock_assignments.cda_ready_to_load_switch IS 'Indique si le quai assigné est prêt pour le chargement';
COMMENT ON COLUMN phenix.customer_dock_assignments.cda_car_code IS 'Indique le code du transporteur';
COMMENT ON COLUMN phenix.customer_dock_assignments.cda_trk_code IS 'Indique le code du camion';