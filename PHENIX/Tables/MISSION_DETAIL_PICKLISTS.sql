CREATE TABLE phenix.mission_detail_picklists (
  mdp_id NUMBER(15) NOT NULL,
  mdp_pmd_id NUMBER(15) NOT NULL,
  mdp_plh_id NUMBER(15),
  mdp_processed_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT mdp_processed_swi_ck CHECK (MDP_PROCESSED_SWITCH IN (0,1)),
  mdp_vph_id NUMBER(15),
  CONSTRAINT mdp_plh_vph_ck CHECK ( ((MDP_PLH_ID is not null and MDP_VPH_ID IS NULL)
 or (MDP_PLH_ID is null and MDP_VPH_ID IS not NULL)  )),
  CONSTRAINT mdp_pk PRIMARY KEY (mdp_id),
  CONSTRAINT mdp_plh_fk FOREIGN KEY (mdp_plh_id) REFERENCES phenix.pick_list_headers (plh_id) ON DELETE CASCADE,
  CONSTRAINT mdp_pmd_fk FOREIGN KEY (mdp_pmd_id) REFERENCES phenix.pick_mission_details (pmd_id) ON DELETE CASCADE,
  CONSTRAINT mdp_vph_id_fk FOREIGN KEY (mdp_vph_id) REFERENCES phenix.vendor_pick_headers (vph_id) ON DELETE CASCADE
);
COMMENT ON TABLE phenix.mission_detail_picklists IS 'En-tête des bons de cueillette composant le détail de mission de cueillette';
COMMENT ON COLUMN phenix.mission_detail_picklists.mdp_id IS 'Identifiant';
COMMENT ON COLUMN phenix.mission_detail_picklists.mdp_pmd_id IS 'Identifiant des détails de mission de cueillette';
COMMENT ON COLUMN phenix.mission_detail_picklists.mdp_plh_id IS 'Numéro de bon de cueillette';
COMMENT ON COLUMN phenix.mission_detail_picklists.mdp_processed_switch IS 'Indique que la mission concernant cette cueillette est terminée';
COMMENT ON COLUMN phenix.mission_detail_picklists.mdp_vph_id IS 'Indique le numéro d''en-tête des charges et des retours fournisseur';