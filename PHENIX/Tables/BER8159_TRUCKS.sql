CREATE TABLE phenix.ber8159_trucks (
  trk_code VARCHAR2(8 BYTE) NOT NULL,
  trk_length NUMBER(10,5) NOT NULL,
  trk_max_thawing_weight NUMBER(10,3) NOT NULL,
  trk_maximum_volume NUMBER(12,5) NOT NULL,
  trk_maximum_weight NUMBER(10,3) NOT NULL,
  trk_refrigerated_switch NUMBER(1) NOT NULL,
  trk_use_code NUMBER(5),
  trk_use_aide_code NUMBER(5),
  trk_maximum_pallet_volume NUMBER(12,5),
  trk_floor_spaces NUMBER(3) NOT NULL
);