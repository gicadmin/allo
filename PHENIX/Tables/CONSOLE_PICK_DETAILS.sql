CREATE TABLE phenix.console_pick_details (
  cpd_pmd_id NUMBER(15) NOT NULL,
  cpd_pmd_pmh_id NUMBER(15) NOT NULL,
  cpd_pmd_prf_prd_code VARCHAR2(10 BYTE) NOT NULL,
  cpd_pmd_prf_fmt_code VARCHAR2(7 BYTE) NOT NULL,
  cpd_pmd_quantity NUMBER(7),
  cpd_pmd_weight NUMBER(10,3),
  cpd_pmd_pmh_pco_id NUMBER(15),
  cpd_pmd_loc_code VARCHAR2(12 BYTE),
  cpd_pmd_quantity_picked NUMBER(7),
  cpd_pmd_weight_picked NUMBER(10,3),
  cpd_pmd_use_picker_code NUMBER(5),
  CONSTRAINT cpd_pmd_pk PRIMARY KEY (cpd_pmd_id),
  CONSTRAINT cpd_pmd_pmh_id_fk FOREIGN KEY (cpd_pmd_pmh_id) REFERENCES phenix.console_pick_headers (cph_pmh_id) ON DELETE CASCADE,
  CONSTRAINT cpd_pmd_use_picker_fk FOREIGN KEY (cpd_pmd_use_picker_code) REFERENCES phenix."USERS" (use_code)
);
COMMENT ON COLUMN phenix.console_pick_details.cpd_pmd_pmh_pco_id IS 'Indique le numéro de la palette où a été cueillie la mission';
COMMENT ON COLUMN phenix.console_pick_details.cpd_pmd_use_picker_code IS 'Indique le code de l''utilisateur qui a cueilli cette ligne de mission';