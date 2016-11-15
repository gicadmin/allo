CREATE GLOBAL TEMPORARY TABLE phenix.temporary_loaded_trucks (
  tlo_position_in_truck NUMBER(3),
  tlo_level_in_truck NUMBER(1),
  tlo_pco_id NUMBER(15),
  tlo_pco_type VARCHAR2(1 BYTE),
  tlo_pco_rdh_route_date DATE,
  tlo_pco_rdh_rou_code NUMBER(5),
  tlo_pco_pallet_method VARCHAR2(1 BYTE),
  tlo_pco_whz_code VARCHAR2(2 BYTE),
  tlo_pco_whz_description VARCHAR2(30 BYTE),
  tlo_pco_sequence_per_zone NUMBER(3),
  tlo_total_sequence_per_zone NUMBER(3),
  tlo_pco_min_position NUMBER(7,2),
  tlo_pco_max_position NUMBER(7,2)
)
ON COMMIT PRESERVE ROWS;