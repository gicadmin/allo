CREATE TABLE phenix.scales (
  sca_code VARCHAR2(2 BYTE) NOT NULL,
  sca_serial VARCHAR2(15 BYTE) NOT NULL,
  sca_date DATE,
  CONSTRAINT sca_pk PRIMARY KEY (sca_code) USING INDEX (CREATE INDEX phenix.sca_pk ON phenix.scales(sca_code)    ),
  CONSTRAINT sca_uk UNIQUE (sca_code,sca_serial) USING INDEX (CREATE UNIQUE INDEX phenix.scs_uk_i ON phenix.scales(sca_code,sca_serial)    )
);
COMMENT ON TABLE phenix.scales IS 'Table contenant les log de modification de la table USERS';
COMMENT ON COLUMN phenix.scales.sca_code IS 'Indique le code de la balance';
COMMENT ON COLUMN phenix.scales.sca_serial IS 'Indique le numéro de série de la balance';
COMMENT ON COLUMN phenix.scales.sca_date IS 'Indique la date de modification du dernier poid entrée par cette balance';