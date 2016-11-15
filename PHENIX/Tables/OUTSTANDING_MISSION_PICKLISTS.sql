CREATE TABLE phenix.outstanding_mission_picklists (
  omp_id NUMBER(15) NOT NULL,
  omp_osm_id NUMBER(15) NOT NULL,
  omp_plh_id NUMBER(15),
  omp_vph_id NUMBER(15),
  CONSTRAINT omp_plh_vph_ck CHECK ( ((OMP_PLH_ID is not null and OMP_VPH_ID IS NULL)
 or (OMP_PLH_ID is null and OMP_VPH_ID IS not NULL)  )),
  CONSTRAINT omp_pk PRIMARY KEY (omp_id),
  CONSTRAINT omp_osm_fk FOREIGN KEY (omp_osm_id) REFERENCES phenix.outstanding_missions (osm_id),
  CONSTRAINT omp_plh_fk FOREIGN KEY (omp_plh_id) REFERENCES phenix.pick_list_headers (plh_id),
  CONSTRAINT omp_vph_id_fk FOREIGN KEY (omp_vph_id) REFERENCES phenix.vendor_pick_headers (vph_id)
);
COMMENT ON TABLE phenix.outstanding_mission_picklists IS 'En-tête de bon de cueillette composant les missions de cueillette à faire';
COMMENT ON COLUMN phenix.outstanding_mission_picklists.omp_id IS 'Identifiant';
COMMENT ON COLUMN phenix.outstanding_mission_picklists.omp_osm_id IS 'Numéro de la mission de cueillette';
COMMENT ON COLUMN phenix.outstanding_mission_picklists.omp_plh_id IS 'Numéro du bon de cueillette';
COMMENT ON COLUMN phenix.outstanding_mission_picklists.omp_vph_id IS 'Indique le numéro d''en-tête des charges et des retours fournisseur';