CREATE TABLE phenix.csc8833_pick_mission_details (
  pmd_id NUMBER(15) NOT NULL,
  pmd_pmh_id NUMBER(15) NOT NULL,
  pmd_prf_prd_code VARCHAR2(10 BYTE) NOT NULL,
  pmd_prf_fmt_code VARCHAR2(7 BYTE) NOT NULL,
  pmd_quantity NUMBER(7),
  pmd_weight NUMBER(10,3),
  pmd_loc_code VARCHAR2(12 BYTE),
  pmd_quantity_picked NUMBER(7),
  pmd_weight_picked NUMBER(10,3),
  pmd_sequence_number NUMBER(4),
  pmd_sysgen_completion_switch NUMBER(1) NOT NULL,
  pmd_use_picker_code NUMBER(5),
  pmd_loc_alt_code VARCHAR2(12 BYTE),
  pmd_quantity_return NUMBER(7),
  pmd_weight_return NUMBER(10,3),
  pmd_quantity_to_ship NUMBER(7),
  pmd_weight_to_ship NUMBER(10,3),
  pmd_movement_only_switch NUMBER(1) NOT NULL,
  pmd_shorted_switch NUMBER(1) NOT NULL,
  pmd_second_wave_switch NUMBER(1) NOT NULL,
  pmd_pmh_pco_id NUMBER(15)
);