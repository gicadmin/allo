CREATE OR REPLACE PACKAGE phenix.INM_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  inventory_movements%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_inm_id                         IN         inventory_movements.inm_id%TYPE,
  p_inm_rec                        OUT NOCOPY inventory_movements%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_inm_id                         IN         inventory_movements.inm_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_inm_id                         IN         inventory_movements.inm_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_inm_id                         IN         inventory_movements.inm_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_inm_id                         IN         inventory_movements.inm_id%TYPE)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_inm_prf_prd_code              IN         inventory_movements.inm_prf_prd_code%TYPE,
  p_inm_use_code                  IN         inventory_movements.inm_use_code%TYPE,
  p_inm_from_loc_code             IN         inventory_movements.inm_from_loc_code%TYPE,
  p_inm_to_loc_code               IN         inventory_movements.inm_to_loc_code%TYPE,
  p_inm_start_date                IN         inventory_movements.inm_start_date%TYPE,
  p_inm_end_date                  IN         inventory_movements.inm_end_date%TYPE,
  p_inm_expiry_date               IN         inventory_movements.inm_expiry_date%TYPE,
  p_inm_fifo_date                 IN         inventory_movements.inm_fifo_date%TYPE,
  p_inm_planned_switch            IN         inventory_movements.inm_planned_switch%TYPE,
  p_inm_lot_switch                IN         inventory_movements.inm_lot_switch%TYPE,
  p_inm_prf_source_fmt_code       IN         inventory_movements.inm_prf_source_fmt_code%TYPE,
  p_inm_prf_destination_fmt_code  IN         inventory_movements.inm_prf_destination_fmt_code%TYPE,
  p_inm_moved_quantity_in         IN         inventory_movements.inm_moved_quantity_in%TYPE,
  p_inm_moved_quantity_out        IN         inventory_movements.inm_moved_quantity_out%TYPE,
  p_inm_moved_weight_in           IN         inventory_movements.inm_moved_weight_in%TYPE,
  p_inm_moved_weight_out          IN         inventory_movements.inm_moved_weight_out%TYPE,
  p_inm_trans_type                IN         inventory_movements.inm_trans_type%TYPE,
  p_inm_src_loc_quantity_on_hand  IN         inventory_movements.inm_src_loc_quantity_on_hand%TYPE,
  p_inm_dest_loc_quantity_on_han  IN         inventory_movements.inm_dest_loc_quantity_on_hand%TYPE,
  p_inm_src_loc_weight_on_hand    IN         inventory_movements.inm_src_loc_weight_on_hand%TYPE,
  p_inm_dest_loc_weight_on_hand   IN         inventory_movements.inm_dest_loc_weight_on_hand%TYPE,
  p_inm_source_ide_id             IN         inventory_movements.inm_source_ide_id%TYPE,
  p_inm_destination_ide_id        IN         inventory_movements.inm_destination_ide_id%TYPE,
  p_inm_dmr_code                  IN         inventory_movements.inm_dmr_code%TYPE,
  p_inm_group_id                  IN         inventory_movements.inm_group_id%TYPE,
  p_inm_prf_destination_prd_code  IN         inventory_movements.inm_prf_destination_prd_code%TYPE,
  p_inm_whs_code                  IN         inventory_movements.inm_whs_code%TYPE,
  p_inm_quantity_left             IN         inventory_movements.inm_quantity_left%TYPE,
  p_inm_weight_left               IN         inventory_movements.inm_weight_left%TYPE,
  p_inm_used_inventory_switch     IN         inventory_movements.inm_used_inventory_switch%TYPE          DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY inventory_movements%ROWTYPE)
RETURN NUMBER;

END INM_PACK;
/