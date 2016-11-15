CREATE TABLE phenix.food_certifications (
  fcr_code NUMBER(4) NOT NULL,
  fcr_description VARCHAR2(45 BYTE) NOT NULL,
  fcr_alt_description VARCHAR2(45 BYTE),
  fcr_short_code VARCHAR2(4 BYTE) NOT NULL,
  fcr_logo BLOB,
  fcr_bottin_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT fcr_bottin_switch_ck CHECK (fcr_bottin_switch IN (0, 1)),
  fcr_fcg_code NUMBER(4) NOT NULL,
  CONSTRAINT fcr_pk PRIMARY KEY (fcr_code,fcr_fcg_code),
  CONSTRAINT fcr_fcg_fk FOREIGN KEY (fcr_fcg_code) REFERENCES phenix.food_certification_groups (fcg_code) ON DELETE CASCADE
);
COMMENT ON TABLE phenix.food_certifications IS 'Table contenant les certifications';
COMMENT ON COLUMN phenix.food_certifications.fcr_code IS 'Indique le code de la certification';
COMMENT ON COLUMN phenix.food_certifications.fcr_description IS 'Indique la description de la certification';
COMMENT ON COLUMN phenix.food_certifications.fcr_alt_description IS 'Indique la description alternative de la certification';
COMMENT ON COLUMN phenix.food_certifications.fcr_short_code IS 'Indique la description courte de la certification';
COMMENT ON COLUMN phenix.food_certifications.fcr_logo IS 'Indique le logo associé à la certification';
COMMENT ON COLUMN phenix.food_certifications.fcr_bottin_switch IS 'Indique si la certification va être affichée dans le bottin';
COMMENT ON COLUMN phenix.food_certifications.fcr_fcg_code IS 'Indique le code du groupe de certification';