CREATE TABLE phenix.customer_groups (
  cgr_code NUMBER(3) NOT NULL,
  cgr_description VARCHAR2(30 BYTE) NOT NULL,
  cgr_alt_description VARCHAR2(30 BYTE),
  cgr_cgr_code NUMBER(3),
  CONSTRAINT cgr_pk PRIMARY KEY (cgr_code),
  CONSTRAINT cgr_cgr_fk FOREIGN KEY (cgr_cgr_code) REFERENCES phenix.customer_groups (cgr_code)
);
COMMENT ON TABLE phenix.customer_groups IS 'Regroupe les différents clients';
COMMENT ON COLUMN phenix.customer_groups.cgr_code IS 'Numéro de groupe de client';
COMMENT ON COLUMN phenix.customer_groups.cgr_description IS 'Description';
COMMENT ON COLUMN phenix.customer_groups.cgr_alt_description IS 'Description alternative';
COMMENT ON COLUMN phenix.customer_groups.cgr_cgr_code IS 'Indique le code du groupe majeur de ce groupe de clients';