CREATE TABLE phenix.roadnet_routes (
  rnr_route VARCHAR2(15 BYTE) NOT NULL,
  rnr_priority DATE,
  rnr_location_id VARCHAR2(15 BYTE) NOT NULL,
  rnr_location_type VARCHAR2(3 BYTE) NOT NULL
);