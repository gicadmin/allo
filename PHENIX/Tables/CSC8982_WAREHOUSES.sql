CREATE TABLE phenix.csc8982_warehouses (
  whs_code VARCHAR2(2 BYTE) NOT NULL,
  whs_prv_code VARCHAR2(2 BYTE) NOT NULL,
  whs_address VARCHAR2(45 BYTE) NOT NULL,
  whs_city VARCHAR2(30 BYTE) NOT NULL,
  whs_duns_number VARCHAR2(15 BYTE) NOT NULL,
  whs_name VARCHAR2(30 BYTE) NOT NULL,
  whs_language_flag VARCHAR2(1 BYTE) NOT NULL,
  whs_member_id NUMBER(11),
  whs_postal_code VARCHAR2(10 BYTE) NOT NULL,
  whs_telephone NUMBER(11) NOT NULL,
  whs_email VARCHAR2(320 BYTE) NOT NULL,
  whs_fax_number NUMBER(11),
  whs_toll_free_telephone NUMBER(11),
  whs_web_address VARCHAR2(200 BYTE),
  whs_surcharge_gl_account VARCHAR2(40 BYTE),
  whs_printer_by_zone_switch NUMBER(1) NOT NULL,
  whs_transport_services VARCHAR2(40 BYTE) NOT NULL,
  whs_interco_email VARCHAR2(320 BYTE),
  whs_ticket_charge_account VARCHAR2(40 BYTE),
  whs_delivery_charge_account VARCHAR2(40 BYTE),
  whs_match_adjustment_account VARCHAR2(40 BYTE),
  whs_transit_loc_code VARCHAR2(12 BYTE),
  whs_counter_prn_id NUMBER(15),
  whs_web_identification_key VARCHAR2(50 BYTE),
  whs_vct_default_price_code VARCHAR2(2 BYTE) NOT NULL,
  whs_vct_default_quantity_code VARCHAR2(2 BYTE) NOT NULL,
  whs_fuel_surcharge_account VARCHAR2(40 BYTE),
  whs_transport_service_credit VARCHAR2(40 BYTE),
  whs_offinv_vol_reb_gl_account VARCHAR2(40 BYTE),
  whs_did_number NUMBER(8),
  whs_use_did_contact NUMBER(5),
  whs_provincial_tax_number VARCHAR2(18 BYTE) NOT NULL,
  whs_federal_tax_number VARCHAR2(15 BYTE) NOT NULL,
  whs_tobacco_tax_number VARCHAR2(16 BYTE),
  whs_nir_number VARCHAR2(20 BYTE),
  whs_tabacco_identification VARCHAR2(16 BYTE),
  whs_enterprise_identification VARCHAR2(10 BYTE),
  whs_chep_global_code NUMBER(10),
  whs_chep_sequence NUMBER(10) NOT NULL,
  whs_chep_pal_code NUMBER(3),
  whs_chep_customer_code NUMBER(4),
  whs_route_prn_id NUMBER(15),
  whs_send_email_pallet_switch NUMBER(1) NOT NULL,
  whs_pallet_trans_gl_account VARCHAR2(40 BYTE),
  whs_auto_close_transit_switch NUMBER(1) NOT NULL,
  whs_bypass_transit_switch NUMBER(1) NOT NULL,
  whs_assign_second_wave_switch NUMBER(1) NOT NULL,
  whs_recept_charge_gl_account VARCHAR2(40 BYTE),
  whs_roadnet_whs_code VARCHAR2(2 BYTE),
  whs_internal_cus_code NUMBER(10),
  whs_ap_internal_admin_account VARCHAR2(40 BYTE),
  whs_bottom_pallet_switch NUMBER(1) NOT NULL
);