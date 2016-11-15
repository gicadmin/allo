CREATE TABLE phenix.pick_mission_exp_dates (
  pme_id NUMBER(15) NOT NULL,
  pme_pmd_id NUMBER(15) NOT NULL,
  pme_expiration_date DATE NOT NULL,
  pme_quantity NUMBER(7) NOT NULL,
  pme_quantity_distributed NUMBER(7) DEFAULT 0 NOT NULL,
  CONSTRAINT pme_pk PRIMARY KEY (pme_id),
  CONSTRAINT pme_pmd_fk FOREIGN KEY (pme_pmd_id) REFERENCES phenix.pick_mission_details (pmd_id) ON DELETE CASCADE
);
COMMENT ON COLUMN phenix.pick_mission_exp_dates.pme_id IS 'Indique l''indentifiant unique de la clé primaire';
COMMENT ON COLUMN phenix.pick_mission_exp_dates.pme_pmd_id IS 'Indique l''indentifiant du détail de al mission de cueillette';
COMMENT ON COLUMN phenix.pick_mission_exp_dates.pme_expiration_date IS 'Indique la date d''expiration';
COMMENT ON COLUMN phenix.pick_mission_exp_dates.pme_quantity IS 'Indique le nombre d''items avec la date d''expiration';