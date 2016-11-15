CREATE TABLE phenix.replenish_pick_lists (
  rpl_rep_id NUMBER(15) NOT NULL,
  rpl_plh_id NUMBER(15),
  rpl_id NUMBER(15) NOT NULL,
  rpl_vph_id NUMBER(15),
  CONSTRAINT rpl_plh_vph_ck CHECK ( ((RPL_PLH_ID is not null and RPL_VPH_ID IS NULL)
 or (RPL_PLH_ID is null and RPL_VPH_ID IS not NULL)  )),
  CONSTRAINT rpl_pk PRIMARY KEY (rpl_id),
  CONSTRAINT rpl_plh_fk FOREIGN KEY (rpl_plh_id) REFERENCES phenix.pick_list_headers (plh_id),
  CONSTRAINT rpl_rep_fk FOREIGN KEY (rpl_rep_id) REFERENCES phenix.replenishments (rep_id) ON DELETE CASCADE,
  CONSTRAINT rpl_vph_id_fk FOREIGN KEY (rpl_vph_id) REFERENCES phenix.vendor_pick_headers (vph_id)
);
COMMENT ON TABLE phenix.replenish_pick_lists IS 'Liste de bon de cueillette ayant généré le réapprovisionnement.';
COMMENT ON COLUMN phenix.replenish_pick_lists.rpl_rep_id IS 'Identifiant du réapprovisionnement';
COMMENT ON COLUMN phenix.replenish_pick_lists.rpl_plh_id IS 'Numéro du bon de cueillette';
COMMENT ON COLUMN phenix.replenish_pick_lists.rpl_id IS 'Indique le ID de l''enregistrement de la table (clé unique)';
COMMENT ON COLUMN phenix.replenish_pick_lists.rpl_vph_id IS 'Indique le ID de la cueillette du retour fournisseur';