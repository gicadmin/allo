CREATE OR REPLACE PACKAGE phenix.PCI_PROFILE_PACK IS

PROCEDURE FIND_CPW_LAST_12_WEEK_MAX_PROC(
  p_prd_code            IN   VARCHAR2,
  p_fmt_code            IN   VARCHAR2,
  p_cus_code            IN   NUMBER,
  p_nb_of_weeks_wanted  IN   NUMBER,
  p_week_1              OUT  NUMBER,
  p_week_2              OUT  NUMBER,
  p_week_3              OUT  NUMBER,
  p_week_4              OUT  NUMBER,
  p_week_5              OUT  NUMBER,
  p_week_6              OUT  NUMBER,
  p_week_7              OUT  NUMBER,
  p_week_8              OUT  NUMBER,
  p_week_9              OUT  NUMBER,
  p_week_10             OUT  NUMBER,
  p_week_11             OUT  NUMBER,
  p_week_12             OUT  NUMBER
);

PROCEDURE GEN_CUS_PRICE_PROC(
 p_cus_code           IN customers.cus_code%TYPE
) ;

FUNCTION CREATE_DLD_FUNC (
  p_dld_dlh_id        IN  display_list_details.dld_dlh_id%TYPE,
  p_dld_prf_prd_code  IN  display_list_details.dld_prf_prd_code%TYPE,
  p_dld_prf_fmt_code  IN  display_list_details.dld_prf_fmt_code%TYPE,
  p_dld_sequence      IN  display_list_details.dld_sequence%TYPE,
  p_dld_message       IN  display_list_details.dld_message%TYPE
 )
 RETURN NUMBER;

FUNCTION CREATE_DLH_FUNC (
  p_dlh_description     IN  display_list_headers.dlh_description%TYPE,
  p_dlh_alt_description IN  display_list_headers.dlh_alt_description%TYPE,
  p_dlh_cus_code        IN  display_list_headers.dlh_cus_code%TYPE,
  p_dlh_ven_code        IN  display_list_headers.dlh_ven_code%TYPE,
  p_dlh_upro_id         IN  display_list_headers.dlh_upro_id%TYPE
 )
 RETURN NUMBER;

PROCEDURE DELETE_DLD_PROC(
  p_dld_id  IN  display_list_details.dld_id%TYPE
 );

 PROCEDURE DELETE_DLH_PROC(
  p_dlh_id  IN  display_list_headers.dlh_id%TYPE
 );

PROCEDURE UPDATE_DLD_PROC (
  p_dld_id        IN  display_list_details.dld_id%TYPE,
  p_dld_sequence  IN  display_list_details.dld_sequence%TYPE,
  p_dld_message   IN  display_list_details.dld_message%TYPE
 );

PROCEDURE UPDATE_DLH_PROC (
  p_dlh_id              IN  display_list_headers.dlh_id%TYPE,
  p_dlh_description     IN  display_list_headers.dlh_description%TYPE,
  p_dlh_alt_description IN  display_list_headers.dlh_alt_description%TYPE
);

END PCI_PROFILE_PACK;
/