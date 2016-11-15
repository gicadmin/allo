CREATE OR REPLACE PACKAGE phenix.DLH_OPERATION_PACK AS

FUNCTION CREATE_DLH_FUNC (
  p_dlh_description       IN         display_list_headers.dlh_description%TYPE,
  p_dlh_alt_description   IN         display_list_headers.dlh_alt_description%TYPE,
  p_dlh_cus_code          IN         display_list_headers.dlh_cus_code%TYPE,
  p_dlh_ven_code          IN         display_list_headers.dlh_ven_code%TYPE,
  p_dlh_upro_id           IN         display_list_headers.dlh_upro_id%TYPE
) RETURN NUMBER;

PROCEDURE DELETE_DLH_PROC(
  p_dlh_id            IN         display_list_headers.dlh_id%TYPE
 );

PROCEDURE UPDATE_DLH_PROC (
  p_dlh_id              IN         display_list_headers.dlh_id%TYPE,
  p_dlh_description     IN         display_list_headers.dlh_description%TYPE,
  p_dlh_alt_description IN         display_list_headers.dlh_alt_description%TYPE
);
END DLH_OPERATION_PACK;
/