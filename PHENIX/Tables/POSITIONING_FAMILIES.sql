CREATE TABLE phenix.positioning_families (
  pof_code NUMBER(2) NOT NULL,
  pof_description VARCHAR2(30 BYTE) NOT NULL,
  pof_alt_description VARCHAR2(30 BYTE),
  pof_sequence NUMBER(1) NOT NULL,
  pof_whz_code VARCHAR2(2 BYTE) NOT NULL,
  pof_measure VARCHAR2(1 BYTE) NOT NULL CONSTRAINT pof_measure_ck CHECK (pof_measure IN ('H','W','V','I')),
  pof_empty_loc_percent NUMBER(6,3) DEFAULT 0,
  CONSTRAINT pof_pk PRIMARY KEY (pof_code),
  CONSTRAINT pof_whz_fk FOREIGN KEY (pof_whz_code) REFERENCES phenix.warehouse_zones (whz_code)
);
COMMENT ON TABLE phenix.positioning_families IS 'Table utilisé pour maintenir les familles de positionnements ';
COMMENT ON COLUMN phenix.positioning_families.pof_code IS 'Indique le code de la famille de positionnement';
COMMENT ON COLUMN phenix.positioning_families.pof_description IS 'Indique la description de la famille de positionnement';
COMMENT ON COLUMN phenix.positioning_families.pof_alt_description IS 'Indique la description alternative de la famille de positionnement';
COMMENT ON COLUMN phenix.positioning_families.pof_sequence IS 'Indique la séquence de la famille dans le positionnement de l''entrepôt';
COMMENT ON COLUMN phenix.positioning_families.pof_whz_code IS 'Indique la zone physique reliée à la famille de positionnement';
COMMENT ON COLUMN phenix.positioning_families.pof_measure IS 'Indique la mesure utilisée pour placer les produits en ordre croissant ou décroissant';
COMMENT ON COLUMN phenix.positioning_families.pof_empty_loc_percent IS 'Indique le pourcentage de loc qu''on veut garder vide parmi les locations attribuées à cette famille de positionnement.';