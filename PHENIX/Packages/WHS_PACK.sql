CREATE OR REPLACE PACKAGE phenix.WHS_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  warehouses%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_whs_code                       IN         warehouses.whs_code%TYPE,
  p_whs_rec                        OUT NOCOPY warehouses%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_whs_code                       IN         warehouses.whs_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_whs_code                       IN         warehouses.whs_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_whs_code                       IN         warehouses.whs_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_whs_code                       IN         warehouses.whs_code%TYPE);


PROCEDURE INSERT_PROC(
  p_whs_code                      IN         warehouses.whs_code%TYPE,
  p_whs_prv_code                  IN         warehouses.whs_prv_code%TYPE,
  p_whs_address                   IN         warehouses.whs_address%TYPE,
  p_whs_city                      IN         warehouses.whs_city%TYPE,
  p_whs_duns_number               IN         warehouses.whs_duns_number%TYPE,
  p_whs_name                      IN         warehouses.whs_name%TYPE,
  p_whs_language_flag             IN         warehouses.whs_language_flag%TYPE,
  p_whs_postal_code               IN         warehouses.whs_postal_code%TYPE,
  p_whs_telephone                 IN         warehouses.whs_telephone%TYPE,
  p_whs_email                     IN         warehouses.whs_email%TYPE,
  p_whs_transport_services        IN         warehouses.whs_transport_services%TYPE,
  p_whs_vct_default_price_code    IN         warehouses.whs_vct_default_price_code%TYPE,
  p_whs_vct_default_quantity_cod  IN         warehouses.whs_vct_default_quantity_code%TYPE,
  p_whs_provincial_tax_number     IN         warehouses.whs_provincial_tax_number%TYPE,
  p_whs_federal_tax_number        IN         warehouses.whs_federal_tax_number%TYPE,
  p_whs_member_id                 IN         warehouses.whs_member_id%TYPE                      DEFAULT NULL,
  p_whs_fax_number                IN         warehouses.whs_fax_number%TYPE                     DEFAULT NULL,
  p_whs_toll_free_telephone       IN         warehouses.whs_toll_free_telephone%TYPE            DEFAULT NULL,
  p_whs_web_address               IN         warehouses.whs_web_address%TYPE                    DEFAULT NULL,
  p_whs_surcharge_gl_account      IN         warehouses.whs_surcharge_gl_account%TYPE           DEFAULT NULL,
  p_whs_interco_email             IN         warehouses.whs_interco_email%TYPE                  DEFAULT NULL,
  p_whs_ticket_charge_account     IN         warehouses.whs_ticket_charge_account%TYPE          DEFAULT NULL,
  p_whs_delivery_charge_account   IN         warehouses.whs_delivery_charge_account%TYPE        DEFAULT NULL,
  p_whs_match_adjustment_account  IN         warehouses.whs_match_adjustment_account%TYPE       DEFAULT NULL,
  p_whs_transit_loc_code          IN         warehouses.whs_transit_loc_code%TYPE               DEFAULT NULL,
  p_whs_counter_prn_id            IN         warehouses.whs_counter_prn_id%TYPE                 DEFAULT NULL,
  p_whs_web_identification_key    IN         warehouses.whs_web_identification_key%TYPE         DEFAULT NULL,
  p_whs_fuel_surcharge_account    IN         warehouses.whs_fuel_surcharge_account%TYPE         DEFAULT NULL,
  p_whs_transport_service_credit  IN         warehouses.whs_transport_service_credit%TYPE       DEFAULT NULL,
  p_whs_offinv_vol_reb_gl_accoun  IN         warehouses.whs_offinv_vol_reb_gl_account%TYPE      DEFAULT NULL,
  p_whs_tobacco_tax_number        IN         warehouses.whs_tobacco_tax_number%TYPE             DEFAULT NULL,
  p_whs_nir_number                IN         warehouses.whs_nir_number%TYPE                     DEFAULT NULL,
  p_whs_tabacco_identification    IN         warehouses.whs_tabacco_identification%TYPE         DEFAULT NULL,
  p_whs_enterprise_identificatio  IN         warehouses.whs_enterprise_identification%TYPE      DEFAULT NULL,
  p_whs_route_prn_id              IN         warehouses.whs_route_prn_id%TYPE                   DEFAULT NULL,
  p_whs_pallet_trans_gl_account   IN         warehouses.whs_pallet_trans_gl_account%TYPE        DEFAULT NULL,
  p_whs_recept_charge_gl_account  IN         warehouses.whs_recept_charge_gl_account%TYPE       DEFAULT NULL,
  p_whs_roadnet_whs_code          IN         warehouses.whs_roadnet_whs_code%TYPE               DEFAULT NULL,
  p_whs_internal_cus_code         IN         warehouses.whs_internal_cus_code%TYPE              DEFAULT NULL,
  p_whs_ap_internal_admin_accoun  IN         warehouses.whs_ap_internal_admin_account%TYPE      DEFAULT NULL,
  p_whs_cash_deposit_limit        IN         warehouses.whs_cash_deposit_limit%TYPE             DEFAULT NULL,
  p_whs_cash_register_limit       IN         warehouses.whs_cash_register_limit%TYPE            DEFAULT NULL,
  p_whs_rounding_gl_account       IN         warehouses.whs_rounding_gl_account%TYPE            DEFAULT NULL,
  p_whs_c_and_c_pricing_cus_code  IN         warehouses.whs_c_and_c_pricing_cus_code%TYPE       DEFAULT NULL,
  p_whs_printer_by_zone_switch    IN         warehouses.whs_printer_by_zone_switch%TYPE         DEFAULT 0 ,
  p_whs_send_email_pallet_switch  IN         warehouses.whs_send_email_pallet_switch%TYPE       DEFAULT 0 ,
  p_whs_auto_close_transit_switc  IN         warehouses.whs_auto_close_transit_switch%TYPE      DEFAULT 0 ,
  p_whs_bypass_transit_switch     IN         warehouses.whs_bypass_transit_switch%TYPE          DEFAULT 0 ,
  p_whs_assign_second_wave_switc  IN         warehouses.whs_assign_second_wave_switch%TYPE      DEFAULT 0 ,
  p_whs_bottom_pallet_switch      IN         warehouses.whs_bottom_pallet_switch%TYPE           DEFAULT 0 ,
  p_whs_sequence                  IN         warehouses.whs_sequence%TYPE                       DEFAULT 1 ,
  p_whs_display_in_pci_switch     IN         warehouses.whs_display_in_pci_switch%TYPE          DEFAULT 1 );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY warehouses%ROWTYPE);

END WHS_PACK;
/