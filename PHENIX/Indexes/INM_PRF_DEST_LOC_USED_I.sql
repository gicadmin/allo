CREATE INDEX phenix.inm_prf_dest_loc_used_i ON phenix.inventory_movements(inm_to_loc_code,inm_prf_destination_prd_code,inm_prf_destination_fmt_code,inm_used_inventory_switch);