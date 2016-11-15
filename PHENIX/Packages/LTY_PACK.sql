CREATE OR REPLACE PACKAGE phenix.LTY_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  location_types%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_lty_code                       IN         location_types.lty_code%TYPE,
  p_lty_rec                        OUT NOCOPY location_types%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_lty_code                       IN         location_types.lty_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_lty_code                       IN         location_types.lty_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_lty_code                       IN         location_types.lty_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_lty_code                       IN         location_types.lty_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_lty_code                       IN         location_types.lty_code%TYPE);


PROCEDURE INSERT_PROC(
  p_lty_code                       IN         location_types.lty_code%TYPE,
  p_lty_description                IN         location_types.lty_description%TYPE,
  p_lty_whz_code                   IN         location_types.lty_whz_code%TYPE,
  p_lty_infinite_inventory_switc   IN         location_types.lty_infinite_inventory_switch%TYPE,
  p_lty_damage_switch              IN         location_types.lty_damage_switch%TYPE,
  p_lty_overstock_switch           IN         location_types.lty_overstock_switch%TYPE,
  p_lty_receiving_dock_switch      IN         location_types.lty_receiving_dock_switch%TYPE,
  p_lty_shipping_dock_switch       IN         location_types.lty_shipping_dock_switch%TYPE,
  p_lty_transit_switch             IN         location_types.lty_transit_switch%TYPE,
  p_lty_one_product_switch         IN         location_types.lty_one_product_switch%TYPE,
  p_lty_whs_code                   IN         location_types.lty_whs_code%TYPE,
  p_lty_spec_order_switch          IN         location_types.lty_spec_order_switch%TYPE,
  p_lty_no_count_switch            IN         location_types.lty_no_count_switch%TYPE,
  p_lty_first_location             IN         location_types.lty_first_location%TYPE,
  p_lty_last_location              IN         location_types.lty_last_location%TYPE,
  p_lty_alt_description            IN         location_types.lty_alt_description%TYPE                 DEFAULT NULL,
  p_lty_prn_id                     IN         location_types.lty_prn_id%TYPE                          DEFAULT NULL,
  p_lty_zone_characters            IN         location_types.lty_zone_characters%TYPE                 DEFAULT NULL,
  p_lty_alley_characters           IN         location_types.lty_alley_characters%TYPE                DEFAULT NULL,
  p_lty_bay_characters             IN         location_types.lty_bay_characters%TYPE                  DEFAULT NULL,
  p_lty_level_characters           IN         location_types.lty_level_characters%TYPE                DEFAULT NULL,
  p_lty_position_characters        IN         location_types.lty_position_characters%TYPE             DEFAULT NULL,
  p_lty_depth_characters           IN         location_types.lty_depth_characters%TYPE                DEFAULT NULL,
  p_lty_drive_in_max_pallets       IN         location_types.lty_drive_in_max_pallets%TYPE            DEFAULT NULL,
  p_lty_whs_destination_code       IN         location_types.lty_whs_destination_code%TYPE            DEFAULT NULL,
  p_lty_rac_code                   IN         location_types.lty_rac_code%TYPE                        DEFAULT NULL,
  p_lty_pof_code                   IN         location_types.lty_pof_code%TYPE                        DEFAULT NULL,
  p_lty_width                      IN         location_types.lty_width%TYPE                           DEFAULT 1.000 ,
  p_lty_height                     IN         location_types.lty_height%TYPE                          DEFAULT 1.000 ,
  p_lty_depth                      IN         location_types.lty_depth%TYPE                           DEFAULT 1.000 ,
  p_lty_dedicated_locations_swit   IN         location_types.lty_dedicated_locations_switch%TYPE      DEFAULT 0 ,
  p_lty_picking_switch             IN         location_types.lty_picking_switch%TYPE                  DEFAULT 0 ,
  p_lty_cash_and_carry_switch      IN         location_types.lty_cash_and_carry_switch%TYPE           DEFAULT 0 ,
  p_lty_zone_check_switch          IN         location_types.lty_zone_check_switch%TYPE               DEFAULT 0 ,
  p_lty_alley_check_switch         IN         location_types.lty_alley_check_switch%TYPE              DEFAULT 0 ,
  p_lty_bay_check_switch           IN         location_types.lty_bay_check_switch%TYPE                DEFAULT 0 ,
  p_lty_level_check_switch         IN         location_types.lty_level_check_switch%TYPE              DEFAULT 0 ,
  p_lty_position_check_switch      IN         location_types.lty_position_check_switch%TYPE           DEFAULT 0 ,
  p_lty_depth_check_switch         IN         location_types.lty_depth_check_switch%TYPE              DEFAULT 0 ,
  p_lty_minimum_fill_percentage    IN         location_types.lty_minimum_fill_percentage%TYPE         DEFAULT 0 ,
  p_lty_drive_in_switch            IN         location_types.lty_drive_in_switch%TYPE                 DEFAULT 0 ,
  p_lty_user_location_switch       IN         location_types.lty_user_location_switch%TYPE            DEFAULT 0 ,
  p_lty_push_back_switch           IN         location_types.lty_push_back_switch%TYPE                DEFAULT 0 ,
  p_lty_unique_pick_switch         IN         location_types.lty_unique_pick_switch%TYPE              DEFAULT 0 ,
  p_lty_replacement_switch         IN         location_types.lty_replacement_switch%TYPE              DEFAULT 0 ,
  p_lty_interco_switch             IN         location_types.lty_interco_switch%TYPE                  DEFAULT 0 ,
  p_lty_liquidation_switch         IN         location_types.lty_liquidation_switch%TYPE              DEFAULT 0 ,
  p_lty_vna_switch                 IN         location_types.lty_vna_switch%TYPE                      DEFAULT 0 );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY location_types%ROWTYPE);


FUNCTION GET_LTY_FUNC(
  p_loc_code  IN VARCHAR2,
  p_lty_code  IN NUMBER,
  p_lty_rec   OUT NOCOPY location_types%ROWTYPE
)
RETURN PLS_INTEGER;

FUNCTION FIND_LTY_DESCRIPTION_FUNC(
  p_lty_code IN NUMBER,
  p_language IN VARCHAR2 DEFAULT 'F'
)
RETURN VARCHAR2;

FUNCTION FIND_COLUMN_VALUE_VARCHAR_FUNC(
  p_column_name     IN VARCHAR2,
  p_loc_code        IN locations.loc_code%TYPE,
  p_lty_code        IN location_types.lty_code%TYPE DEFAULT NULL
)
RETURN VARCHAR2;

FUNCTION FIND_COLUMN_VALUE_NUMBER_FUNC(
  p_column_name     IN VARCHAR2,
  p_loc_code        IN locations.loc_code%TYPE,
  p_lty_code        IN location_types.lty_code%TYPE DEFAULT NULL
)
RETURN NUMBER;

END LTY_PACK;
/