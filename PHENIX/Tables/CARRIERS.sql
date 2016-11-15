CREATE TABLE phenix.carriers (
  car_code NUMBER(5) NOT NULL,
  car_name VARCHAR2(30 BYTE) NOT NULL,
  car_address VARCHAR2(45 BYTE) NOT NULL,
  car_city VARCHAR2(30 BYTE) NOT NULL,
  car_prv_code VARCHAR2(2 BYTE) NOT NULL,
  car_postal_code VARCHAR2(10 BYTE) NOT NULL,
  car_telephone_number NUMBER(11) NOT NULL,
  car_email VARCHAR2(80 BYTE),
  car_fax_number NUMBER(11),
  car_contact_first_name VARCHAR2(30 BYTE),
  car_contact_last_name VARCHAR2(30 BYTE),
  car_maritime_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT car_maritime_switch_ck CHECK (CAR_MARITIME_SWITCH IN (0, 1)),
  CONSTRAINT car_pk PRIMARY KEY (car_code),
  CONSTRAINT car_prv_code_fk FOREIGN KEY (car_prv_code) REFERENCES phenix.provinces (prv_code)
);
COMMENT ON TABLE phenix.carriers IS 'Cette table contient l''information sur le transporteur';
COMMENT ON COLUMN phenix.carriers.car_code IS 'Numéro du transporteur';
COMMENT ON COLUMN phenix.carriers.car_name IS 'Nom';
COMMENT ON COLUMN phenix.carriers.car_address IS 'Adresse';
COMMENT ON COLUMN phenix.carriers.car_city IS 'Ville';
COMMENT ON COLUMN phenix.carriers.car_prv_code IS 'Province';
COMMENT ON COLUMN phenix.carriers.car_postal_code IS 'Code postal';
COMMENT ON COLUMN phenix.carriers.car_telephone_number IS 'Numéro de téléphone';
COMMENT ON COLUMN phenix.carriers.car_email IS 'Adresse électronique';
COMMENT ON COLUMN phenix.carriers.car_fax_number IS 'Numéro de fax';
COMMENT ON COLUMN phenix.carriers.car_contact_first_name IS 'Le prénom du contact';
COMMENT ON COLUMN phenix.carriers.car_contact_last_name IS 'Le nom du contact';
COMMENT ON COLUMN phenix.carriers.car_maritime_switch IS 'Indique si le transporteur possède un permis pour transporter des produits marins';