CREATE OR REPLACE PACKAGE phenix.TLT_OPERATION_PACK AS

PROCEDURE DELETE_BY_USER_PROC(
 p_tlt_use_code  IN temporary_location_tickets.tlt_use_code%TYPE
);

FUNCTION EXISTS_BY_USER_FUNC(
 p_tlt_use_code  IN temporary_location_tickets.tlt_use_code%TYPE
)RETURN NUMBER;

FUNCTION EXISTS_SELECTED_LTL_FUNC(
 p_tlt_use_code  IN temporary_location_tickets.tlt_use_code%TYPE
)RETURN NUMBER;

PROCEDURE SET_TLT_SYNCHRO_PROC(
  p_tlt_loc_code  IN temporary_location_tickets.tlt_loc_code%TYPE
);

END TLT_OPERATION_PACK;
/