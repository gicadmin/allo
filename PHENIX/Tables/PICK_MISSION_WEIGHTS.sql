CREATE TABLE phenix.pick_mission_weights (
  pmw_id NUMBER(15) NOT NULL,
  pmw_pmd_id NUMBER(15) NOT NULL,
  pmw_weight NUMBER(10,3) NOT NULL,
  pmw_weight_distributed NUMBER(10,3) NOT NULL,
  pmw_weight_to_ship NUMBER(10,3),
  CONSTRAINT pmw_pk PRIMARY KEY (pmw_id),
  CONSTRAINT pmw_pmd_fk FOREIGN KEY (pmw_pmd_id) REFERENCES phenix.pick_mission_details (pmd_id) ON DELETE CASCADE
);
COMMENT ON TABLE phenix.pick_mission_weights IS 'Poids des détails de la mission de cueillette saisis lors de la fermeture de celle-ci';
COMMENT ON COLUMN phenix.pick_mission_weights.pmw_id IS 'Identifiant unique';
COMMENT ON COLUMN phenix.pick_mission_weights.pmw_pmd_id IS 'Identifiant du détail de la mission de cueillette';
COMMENT ON COLUMN phenix.pick_mission_weights.pmw_weight IS 'Indique le poids';
COMMENT ON COLUMN phenix.pick_mission_weights.pmw_weight_distributed IS 'Indique le poids déjà distribué sur des cueillettes';
COMMENT ON COLUMN phenix.pick_mission_weights.pmw_weight_to_ship IS 'Indique le poids qui ce trouve sur le conteneur pour l''expédition.';