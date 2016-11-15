CREATE OR REPLACE PACKAGE phenix.TLT_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  temporary_location_tickets%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_tlt_loc_code                   IN         temporary_location_tickets.tlt_loc_code%TYPE,
  p_tlt_rec                        OUT NOCOPY temporary_location_tickets%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_tlt_loc_code                   IN         temporary_location_tickets.tlt_loc_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_tlt_loc_code                   IN         temporary_location_tickets.tlt_loc_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_tlt_loc_code                   IN         temporary_location_tickets.tlt_loc_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_tlt_loc_code                   IN         temporary_location_tickets.tlt_loc_code%TYPE);


PROCEDURE INSERT_PROC(
  p_tlt_loc_code            IN         temporary_location_tickets.tlt_loc_code%TYPE,
  p_tlt_lty_code            IN         temporary_location_tickets.tlt_lty_code%TYPE,
  p_tlt_direction_up_switch IN         temporary_location_tickets.tlt_direction_up_switch%TYPE      DEFAULT NULL,
  p_tlt_loc_validation_code IN         temporary_location_tickets.tlt_loc_validation_code%TYPE      DEFAULT NULL,
  p_tlt_use_code            IN         temporary_location_tickets.tlt_use_code%TYPE                 DEFAULT NULL,
  p_tlt_synchro_switch      IN         temporary_location_tickets.tlt_synchro_switch%TYPE           DEFAULT NULL,
  p_tlt_new_location_switch IN         temporary_location_tickets.tlt_new_location_switch%TYPE      DEFAULT NULL,
  p_tlt_rac_code            IN         temporary_location_tickets.tlt_rac_code%TYPE                 DEFAULT NULL,
  p_tlt_pof_code            IN         temporary_location_tickets.tlt_pof_code%TYPE                 DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY temporary_location_tickets%ROWTYPE);

END TLT_PACK;
/