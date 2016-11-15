CREATE TABLE phenix.printers (
  prn_alt_description VARCHAR2(45 BYTE),
  prn_description VARCHAR2(45 BYTE) NOT NULL,
  prn_library_path VARCHAR2(200 BYTE) NOT NULL,
  prn_code VARCHAR2(5 BYTE) NOT NULL,
  prn_id NUMBER(15) NOT NULL,
  prn_vr_check_digit VARCHAR2(2 BYTE),
  CONSTRAINT prn_pk PRIMARY KEY (prn_id),
  CONSTRAINT prn_uk UNIQUE (prn_code)
);
COMMENT ON COLUMN phenix.printers.prn_vr_check_digit IS 'Indique le numéro de vérification pour le système de reconnaissance vocale';