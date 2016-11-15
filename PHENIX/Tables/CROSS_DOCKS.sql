CREATE TABLE phenix.cross_docks (
  cdk_code VARCHAR2(4 BYTE) NOT NULL,
  cdk_name VARCHAR2(30 BYTE) NOT NULL,
  cdk_address VARCHAR2(45 BYTE) NOT NULL,
  cdk_city VARCHAR2(30 BYTE) NOT NULL,
  cdk_prv_code VARCHAR2(2 BYTE) NOT NULL,
  cdk_postal_code VARCHAR2(10 BYTE) NOT NULL,
  cdk_whs_code VARCHAR2(2 BYTE) DEFAULT '99' NOT NULL,
  CONSTRAINT cdk_pk PRIMARY KEY (cdk_code) USING INDEX (CREATE INDEX phenix.cdk_pk ON phenix.cross_docks(cdk_code)    ),
  CONSTRAINT cdk_prv_code_fk FOREIGN KEY (cdk_prv_code) REFERENCES phenix.provinces (prv_code)
);
COMMENT ON TABLE phenix.cross_docks IS 'Table utilisée pour les transbordements (cross-docks)';
COMMENT ON COLUMN phenix.cross_docks.cdk_code IS 'Indique le code du cross-dock';
COMMENT ON COLUMN phenix.cross_docks.cdk_name IS 'Indique le nom du cross-dock';
COMMENT ON COLUMN phenix.cross_docks.cdk_address IS 'Indique l''adresse du cross-dock';
COMMENT ON COLUMN phenix.cross_docks.cdk_city IS 'Indique la ville du cross-dock';
COMMENT ON COLUMN phenix.cross_docks.cdk_prv_code IS 'Indique la province du cross-dock';
COMMENT ON COLUMN phenix.cross_docks.cdk_postal_code IS 'Indique le code postal du cross-dock';
COMMENT ON COLUMN phenix.cross_docks.cdk_whs_code IS 'Indique le code entrepôt';