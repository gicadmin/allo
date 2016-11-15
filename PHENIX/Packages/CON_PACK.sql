CREATE OR REPLACE PACKAGE phenix.CON_PACK IS

FUNCTION FIND_FIRST_CON_NAME_FUNC(
	p_cus_code						IN contacts.con_cus_code%TYPE,
	p_ven_code						IN contacts.con_ven_code%TYPE,
	p_cty_code_priorized	IN contacts.con_cty_code%TYPE
)
RETURN VARCHAR2;

FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  contacts%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_con_id                         IN         contacts.con_id%TYPE,
  p_con_rec                        OUT NOCOPY contacts%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_con_id                         IN         contacts.con_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_con_id                         IN         contacts.con_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_con_id                         IN         contacts.con_id%TYPE)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_con_cty_code                  IN         contacts.con_cty_code%TYPE,
  p_con_first_name                IN         contacts.con_first_name%TYPE,
  p_con_last_name                 IN         contacts.con_last_name%TYPE,
  p_con_cus_code                  IN         contacts.con_cus_code%TYPE,
  p_con_ven_code                  IN         contacts.con_ven_code%TYPE,
  p_con_email                     IN         contacts.con_email%TYPE,
  p_con_extension                 IN         contacts.con_extension%TYPE,
  p_con_extension_2               IN         contacts.con_extension_2%TYPE,
  p_con_fax                       IN         contacts.con_fax%TYPE,
  p_con_remark                    IN         contacts.con_remark%TYPE,
  p_con_telephone                 IN         contacts.con_telephone%TYPE,
  p_con_telephone_2               IN         contacts.con_telephone_2%TYPE,
  p_con_password                  IN         contacts.con_password%TYPE,
  p_con_print_badge_report_switc  IN         contacts.con_print_badge_report_switch%TYPE      DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY contacts%ROWTYPE)
RETURN NUMBER;
END CON_PACK;
/