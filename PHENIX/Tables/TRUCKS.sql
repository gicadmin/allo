CREATE TABLE phenix.trucks (
  trk_code VARCHAR2(8 BYTE) NOT NULL,
  trk_length NUMBER(10,5) NOT NULL,
  trk_max_thawing_weight NUMBER(10,3) NOT NULL,
  trk_maximum_volume NUMBER(12,5) NOT NULL,
  trk_maximum_weight NUMBER(10,3) NOT NULL,
  trk_refrigerated_switch NUMBER(1) NOT NULL CONSTRAINT trk_refrigerated_switch_ck CHECK (TRK_REFRIGERATED_SWITCH IN (0, 1)),
  trk_use_code NUMBER(5),
  trk_use_aide_code NUMBER(5),
  trk_maximum_pallet_volume NUMBER(12,5),
  trk_floor_spaces NUMBER(3) NOT NULL,
  CONSTRAINT trk_pk PRIMARY KEY (trk_code),
  CONSTRAINT trk_use_aide_fk FOREIGN KEY (trk_use_aide_code) REFERENCES phenix."USERS" (use_code),
  CONSTRAINT trk_use_fk FOREIGN KEY (trk_use_code) REFERENCES phenix."USERS" (use_code)
);
COMMENT ON TABLE phenix.trucks IS 'Identifie les camions de livraison';
COMMENT ON COLUMN phenix.trucks.trk_code IS 'Numéro de camion';
COMMENT ON COLUMN phenix.trucks.trk_length IS 'Longueur du camion';
COMMENT ON COLUMN phenix.trucks.trk_max_thawing_weight IS 'Poids maximum que contient le camion durant la période de dégel';
COMMENT ON COLUMN phenix.trucks.trk_maximum_volume IS 'Volume maximum que contient le camion';
COMMENT ON COLUMN phenix.trucks.trk_maximum_weight IS 'Poids maximum que contient le camion';
COMMENT ON COLUMN phenix.trucks.trk_refrigerated_switch IS 'Indique le camion est réfigérée';
COMMENT ON COLUMN phenix.trucks.trk_use_code IS 'Numéro de l''usager (Livreur)';
COMMENT ON COLUMN phenix.trucks.trk_use_aide_code IS 'Indique le code d''utilisateur de l''aide camionneur';
COMMENT ON COLUMN phenix.trucks.trk_maximum_pallet_volume IS 'Indique le volume maximum de palette que peut contenir le camion';
COMMENT ON COLUMN phenix.trucks.trk_floor_spaces IS 'Indique le nombre d''espaces plancher disponibles dans le camion';