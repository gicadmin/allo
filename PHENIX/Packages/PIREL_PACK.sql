CREATE OR REPLACE PACKAGE phenix.PIREL_PACK IS

FUNCTION GET_INFO_VTT_FUNC (
  p_vtt_ven_code           IN NUMBER,
  p_vtt_billed_cus_code    IN NUMBER,
  p_vtt_reference_number   IN VARCHAR2,
  p_vtt_value              OUT NUMBER,
  p_vtt_ven_name           OUT VARCHAR2,
  p_vtt_weight             OUT NUMBER,
  p_vtt_number_of_pallets  OUT NUMBER,
  p_vtt_number_of_packages OUT NUMBER,
  p_vtt_cus_code           OUT VARCHAR2,
  p_vtt_cus_name           OUT VARCHAR2
)
RETURN NUMBER;

END PIREL_PACK;
/