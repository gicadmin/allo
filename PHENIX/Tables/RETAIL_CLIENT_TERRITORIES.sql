CREATE TABLE phenix.retail_client_territories (
  rlt_code NUMBER(5) NOT NULL,
  rlt_description VARCHAR2(30 BYTE) NOT NULL,
  rlt_alt_description VARCHAR2(30 BYTE),
  CONSTRAINT rlt_pk PRIMARY KEY (rlt_code)
);
COMMENT ON TABLE phenix.retail_client_territories IS 'Cette table contient les territoires associés aux détaillants';
COMMENT ON COLUMN phenix.retail_client_territories.rlt_code IS 'Code du territoire';
COMMENT ON COLUMN phenix.retail_client_territories.rlt_description IS 'Description du territoire';
COMMENT ON COLUMN phenix.retail_client_territories.rlt_alt_description IS 'Description alternative du territoire';