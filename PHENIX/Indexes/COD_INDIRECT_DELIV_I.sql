CREATE INDEX phenix.cod_indirect_deliv_i ON phenix.customer_order_details(cod_order_type,cod_pty_code,cod_open_switch,cod_prebook_method,cod_whs_picking_code);