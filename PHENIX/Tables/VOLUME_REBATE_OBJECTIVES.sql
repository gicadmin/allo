CREATE TABLE phenix.volume_rebate_objectives (
  vro_id NUMBER(15) NOT NULL,
  vro_vrg_code NUMBER(3) NOT NULL,
  vro_objective_amount NUMBER(9,2) NOT NULL,
  vro_base_drop_rebate_percent NUMBER(6,3),
  vro_base_drop_rebate_amount NUMBER(7,2),
  CONSTRAINT vro_pk PRIMARY KEY (vro_id),
  CONSTRAINT vro_vrg_fk FOREIGN KEY (vro_vrg_code) REFERENCES phenix.volume_rebate_grids (vrg_code) ON DELETE CASCADE
);
COMMENT ON COLUMN phenix.volume_rebate_objectives.vro_base_drop_rebate_amount IS 'Indique le montant de l''escompte appliqué à l''échelle inscrite';