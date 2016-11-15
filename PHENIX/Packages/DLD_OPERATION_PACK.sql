CREATE OR REPLACE PACKAGE phenix.DLD_OPERATION_PACK AS

FUNCTION CREATE_DLD_FUNC (
  p_dld_dlh_id            IN         display_list_details.dld_dlh_id%TYPE,
  p_dld_prf_prd_code      IN         display_list_details.dld_prf_prd_code%TYPE,
  p_dld_prf_fmt_code      IN         display_list_details.dld_prf_fmt_code%TYPE,
  p_dld_sequence          IN         display_list_details.dld_sequence%TYPE,
  p_dld_message           IN         display_list_details.dld_message%TYPE
) RETURN NUMBER;

PROCEDURE DELETE_DLD_PROC(
  p_dld_id            IN         display_list_details.dld_id%TYPE
 );

PROCEDURE UPDATE_DLD_PROC (
  p_dld_id            IN         display_list_details.dld_id%TYPE,
  p_dld_sequence      IN         display_list_details.dld_sequence%TYPE,
  p_dld_message       IN         display_list_details.dld_message%TYPE
);
END DLD_OPERATION_PACK;
/