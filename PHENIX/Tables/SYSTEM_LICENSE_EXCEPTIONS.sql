CREATE TABLE phenix.system_license_exceptions (
  sle_use_code NUMBER(5) NOT NULL,
  CONSTRAINT sle_pk PRIMARY KEY (sle_use_code),
  CONSTRAINT sle_use_fk FOREIGN KEY (sle_use_code) REFERENCES phenix."USERS" (use_code) ON DELETE CASCADE
);
COMMENT ON TABLE phenix.system_license_exceptions IS 'Usagers qui peuvent se loguer sans licence';
COMMENT ON COLUMN phenix.system_license_exceptions.sle_use_code IS 'Code usager';