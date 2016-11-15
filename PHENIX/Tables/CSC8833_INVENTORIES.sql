CREATE TABLE phenix.csc8833_inventories (
  inv_id NUMBER(15) NOT NULL,
  inv_prf_prd_code VARCHAR2(10 BYTE) NOT NULL,
  inv_prf_fmt_code VARCHAR2(7 BYTE) NOT NULL,
  inv_loc_code VARCHAR2(12 BYTE) NOT NULL,
  inv_quantity_on_hand NUMBER(7),
  inv_weight_on_hand NUMBER(10,3),
  inv_quantity_in NUMBER(7),
  inv_weight_in NUMBER(10,3),
  inv_quantity_out NUMBER(7),
  inv_weight_out NUMBER(10,3),
  inv_quantity_on_hold NUMBER(7),
  inv_weight_on_hold NUMBER(10,3),
  inv_in_date DATE,
  inv_quantity_max NUMBER(7),
  inv_last_pick_date DATE,
  inv_last_count_date DATE,
  inv_fifo_date DATE,
  inv_expiry_date DATE,
  inv_quantity_min NUMBER(7),
  inv_weight_max NUMBER(10,3),
  inv_weight_min NUMBER(10,3),
  inv_out_date DATE,
  inv_quantity_moved_in NUMBER(7),
  inv_quantity_moved_out NUMBER(7),
  inv_weight_moved_out NUMBER(10,3),
  inv_trans_type VARCHAR2(3 BYTE),
  inv_creation_date DATE NOT NULL,
  inv_last_modification_date DATE NOT NULL,
  inv_on_hold_date DATE
);