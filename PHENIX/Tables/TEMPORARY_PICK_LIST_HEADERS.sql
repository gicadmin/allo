CREATE TABLE phenix.temporary_pick_list_headers (
  tlh_rou_code NUMBER(5),
  tlh_whs_delivery_code VARCHAR2(2 BYTE),
  tlh_whs_picking_code VARCHAR2(2 BYTE),
  tlh_route_trk_code VARCHAR2(8 BYTE),
  tlh_use_code NUMBER(5),
  tlh_use_aide_code NUMBER(5),
  tlh_route_loc_dock_code VARCHAR2(12 BYTE)
);