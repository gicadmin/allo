CREATE OR REPLACE PACKAGE phenix.STW_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  stats_tracking_warehouses%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_stw_stt_code                   IN         stats_tracking_warehouses.stw_stt_code%TYPE,
  p_stw_whs_code                   IN         stats_tracking_warehouses.stw_whs_code%TYPE,
  p_stw_rec                        OUT NOCOPY stats_tracking_warehouses%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_stw_stt_code                   IN         stats_tracking_warehouses.stw_stt_code%TYPE,
  p_stw_whs_code                   IN         stats_tracking_warehouses.stw_whs_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_stw_stt_code                   IN         stats_tracking_warehouses.stw_stt_code%TYPE,
  p_stw_whs_code                   IN         stats_tracking_warehouses.stw_whs_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_stw_stt_code                   IN         stats_tracking_warehouses.stw_stt_code%TYPE,
  p_stw_whs_code                   IN         stats_tracking_warehouses.stw_whs_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_stw_stt_code                   IN         stats_tracking_warehouses.stw_stt_code%TYPE,
  p_stw_whs_code                   IN         stats_tracking_warehouses.stw_whs_code%TYPE);


PROCEDURE INSERT_PROC(
  p_stw_stt_code         IN         stats_tracking_warehouses.stw_stt_code%TYPE,
  p_stw_whs_code         IN         stats_tracking_warehouses.stw_whs_code%TYPE,
  p_stw_ship_to_id       IN         stats_tracking_warehouses.stw_ship_to_id%TYPE            DEFAULT NULL,
  p_stw_sender_id        IN         stats_tracking_warehouses.stw_sender_id%TYPE             DEFAULT NULL,
  p_stw_use_contact_code IN         stats_tracking_warehouses.stw_use_contact_code%TYPE      DEFAULT NULL,
  p_stw_sequence_number  IN         stats_tracking_warehouses.stw_sequence_number%TYPE       DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY stats_tracking_warehouses%ROWTYPE);

END STW_PACK;
/