CREATE TABLE phenix.pick_mission_details (
  pmd_id NUMBER(15) NOT NULL,
  pmd_pmh_id NUMBER(15) NOT NULL,
  pmd_prf_prd_code VARCHAR2(10 BYTE) NOT NULL,
  pmd_prf_fmt_code VARCHAR2(7 BYTE) NOT NULL,
  pmd_quantity NUMBER(7),
  pmd_weight NUMBER(10,3),
  pmd_loc_code VARCHAR2(12 BYTE),
  pmd_quantity_picked NUMBER(7),
  pmd_weight_picked NUMBER(10,3),
  pmd_sequence_number NUMBER(4),
  pmd_sysgen_completion_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT pmd_sysgen_completion_swi_ck CHECK (PMD_SYSGEN_COMPLETION_SWITCH IN (0,1)),
  pmd_use_picker_code NUMBER(5),
  pmd_loc_alt_code VARCHAR2(12 BYTE),
  pmd_quantity_return NUMBER(7),
  pmd_weight_return NUMBER(10,3),
  pmd_quantity_to_ship NUMBER(7),
  pmd_weight_to_ship NUMBER(10,3),
  pmd_movement_only_switch NUMBER(1) DEFAULT 0 NOT NULL,
  pmd_shorted_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT pmd_shorted_switch_ck CHECK (PMD_SHORTED_SWITCH IN (0, 1)),
  pmd_second_wave_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT pmd_second_wave_switch_ck CHECK (PMD_SECOND_WAVE_SWITCH IN (0, 1)),
  pmd_pmh_pco_id NUMBER(15),
  CONSTRAINT pmd_pk PRIMARY KEY (pmd_id),
  CONSTRAINT pmd_pmh_fk FOREIGN KEY (pmd_pmh_id) REFERENCES phenix.pick_mission_headers (pmh_id),
  CONSTRAINT pmd_pmh_pco_fk FOREIGN KEY (pmd_pmh_pco_id) REFERENCES phenix.pallet_consolidations (pco_id),
  CONSTRAINT pmd_prf_fk FOREIGN KEY (pmd_prf_prd_code,pmd_prf_fmt_code) REFERENCES phenix.product_formats (prf_prd_code,prf_fmt_code),
  CONSTRAINT pmd_use_picker_fk FOREIGN KEY (pmd_use_picker_code) REFERENCES phenix."USERS" (use_code)
);
COMMENT ON TABLE phenix.pick_mission_details IS 'Détail de la mission de cueillette';
COMMENT ON COLUMN phenix.pick_mission_details.pmd_id IS 'Indique l''identifiant unique de la ligne de détail (ID)';
COMMENT ON COLUMN phenix.pick_mission_details.pmd_pmh_id IS 'Indique à quelle en-tête de mission appartient cette ligne de détail';
COMMENT ON COLUMN phenix.pick_mission_details.pmd_prf_prd_code IS 'Indique le code du produit de la ligne de cueillette';
COMMENT ON COLUMN phenix.pick_mission_details.pmd_prf_fmt_code IS 'Indique le code du format de produit de la ligne de cueillette';
COMMENT ON COLUMN phenix.pick_mission_details.pmd_quantity IS 'Indique la quantité à cueillir sur cette ligne de cueillette';
COMMENT ON COLUMN phenix.pick_mission_details.pmd_weight IS 'Indique le poids à cueillir sur cette ligne de cueillette';
COMMENT ON COLUMN phenix.pick_mission_details.pmd_loc_code IS 'Indique le code de la localisation de la ligne de cueillette';
COMMENT ON COLUMN phenix.pick_mission_details.pmd_quantity_picked IS 'Indique la quantité cueillie sur cette ligne de cueillette';
COMMENT ON COLUMN phenix.pick_mission_details.pmd_weight_picked IS 'Indique le poids cueilli sur cette ligne de cueillette';
COMMENT ON COLUMN phenix.pick_mission_details.pmd_sequence_number IS 'Indique la séquence dans la mission de cueillette';
COMMENT ON COLUMN phenix.pick_mission_details.pmd_sysgen_completion_switch IS 'Indique si la ligne a été fermée automatiquement par le système (cueillette à zéro)';
COMMENT ON COLUMN phenix.pick_mission_details.pmd_use_picker_code IS 'Indique le code de l''utilisateur qui a cueilli cette ligne de mission';
COMMENT ON COLUMN phenix.pick_mission_details.pmd_loc_alt_code IS 'Indique l''alias du code de localisation de la ligne de mission';
COMMENT ON COLUMN phenix.pick_mission_details.pmd_quantity_return IS 'Indique la quantité retourné à l''entrepôt source';
COMMENT ON COLUMN phenix.pick_mission_details.pmd_weight_return IS 'Indique le poids retourné à l''entrepôt source';
COMMENT ON COLUMN phenix.pick_mission_details.pmd_quantity_to_ship IS 'Indique la quantité qui ce trouve sur le conteneur pour l''expédition.';
COMMENT ON COLUMN phenix.pick_mission_details.pmd_weight_to_ship IS 'Indique le poids qui ce trouve sur le conteneur pour l''expédition.';
COMMENT ON COLUMN phenix.pick_mission_details.pmd_movement_only_switch IS 'Indique si la ligne existe uniquement comme résultat d''un transfert d''un autre conteneur.';
COMMENT ON COLUMN phenix.pick_mission_details.pmd_shorted_switch IS 'Indique si la ligne de mission a été mis à court';
COMMENT ON COLUMN phenix.pick_mission_details.pmd_second_wave_switch IS 'Indique si la ligne de mission concerne une deuxième vague';
COMMENT ON COLUMN phenix.pick_mission_details.pmd_pmh_pco_id IS 'Indique le numéro de la palette où a été cueillie la mission';