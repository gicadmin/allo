CREATE TABLE phenix.container_movement_audits (
  cma_id NUMBER(15) NOT NULL,
  cma_prf_prd_code VARCHAR2(10 BYTE) NOT NULL,
  cma_prf_fmt_code VARCHAR2(7 BYTE) NOT NULL,
  cma_quantity_moved NUMBER(7),
  cma_weight_moved NUMBER(10,3),
  cma_source_container VARCHAR2(12 BYTE) NOT NULL,
  cma_destination_container VARCHAR2(12 BYTE) NOT NULL,
  cma_date DATE NOT NULL,
  cma_use_code NUMBER(5) NOT NULL,
  cma_loc_code VARCHAR2(12 BYTE),
  CONSTRAINT cma_pk PRIMARY KEY (cma_id),
  CONSTRAINT cma_loc_fk FOREIGN KEY (cma_loc_code) REFERENCES phenix.locations (loc_code),
  CONSTRAINT cma_prf_fk FOREIGN KEY (cma_prf_prd_code,cma_prf_fmt_code) REFERENCES phenix.product_formats (prf_prd_code,prf_fmt_code),
  CONSTRAINT cma_use_fk FOREIGN KEY (cma_use_code) REFERENCES phenix."USERS" (use_code)
);
COMMENT ON TABLE phenix.container_movement_audits IS 'Table de l''historique des déplacements de conteneurs';
COMMENT ON COLUMN phenix.container_movement_audits.cma_id IS 'Indique l''identifiant unique de la table';
COMMENT ON COLUMN phenix.container_movement_audits.cma_prf_prd_code IS 'Indique le code du produit';
COMMENT ON COLUMN phenix.container_movement_audits.cma_prf_fmt_code IS 'Indique le format du produit';
COMMENT ON COLUMN phenix.container_movement_audits.cma_quantity_moved IS 'Indique la quantité à déplacer';
COMMENT ON COLUMN phenix.container_movement_audits.cma_weight_moved IS 'Indique le poids à déplacer';
COMMENT ON COLUMN phenix.container_movement_audits.cma_source_container IS 'Indique le code du conteneur d''origine';
COMMENT ON COLUMN phenix.container_movement_audits.cma_destination_container IS 'Indique le code du conteneur destinataire ';
COMMENT ON COLUMN phenix.container_movement_audits.cma_date IS 'Indique la date/heure du début du transfert';
COMMENT ON COLUMN phenix.container_movement_audits.cma_use_code IS 'Indique le code de l''usager';
COMMENT ON COLUMN phenix.container_movement_audits.cma_loc_code IS 'Indique le code de la localisation';