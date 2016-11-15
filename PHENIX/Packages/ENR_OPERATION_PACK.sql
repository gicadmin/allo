CREATE OR REPLACE PACKAGE phenix.ENR_OPERATION_PACK AS

FUNCTION EXIST_ENR_FUNC(
  p_enr_session_id   IN  edi_ni_rejects.enr_session_id%TYPE,
  p_enr_partner_id   OUT edi_ni_rejects.enr_partner_id%TYPE,
  p_enr_line_number  OUT edi_ni_rejects.enr_line_number%TYPE
)
RETURN BOOLEAN;

END ENR_OPERATION_PACK;
/