CREATE TABLE phenix.roadnet_locations (
  rnl_location_id VARCHAR2(15 BYTE) NOT NULL,
  rnl_location_type VARCHAR2(3 BYTE) NOT NULL,
  rnl_location_name VARCHAR2(60 BYTE) NOT NULL,
  rnl_address_1 VARCHAR2(50 BYTE) NOT NULL,
  rnl_address_2 VARCHAR2(50 BYTE),
  rnl_city VARCHAR2(30 BYTE) NOT NULL,
  rnl_county VARCHAR2(30 BYTE),
  rnl_state VARCHAR2(30 BYTE) NOT NULL,
  rnl_country VARCHAR2(2 BYTE) NOT NULL,
  rnl_postal_code VARCHAR2(10 BYTE) NOT NULL,
  rnl_ranking VARCHAR2(1 BYTE),
  rnl_creation_date TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL,
  rnl_whs_code VARCHAR2(2 BYTE) DEFAULT '99' NOT NULL
);
COMMENT ON COLUMN phenix.roadnet_locations.rnl_whs_code IS 'Indique le code entrepôt du client';