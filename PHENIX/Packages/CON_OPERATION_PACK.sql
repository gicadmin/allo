CREATE OR REPLACE PACKAGE phenix.CON_OPERATION_PACK AS

FUNCTION FIND_CONTACT_PRINT_BADGE_FUNC(
  p_con_cus_code  IN contacts.con_cus_code%TYPE
  ) RETURN BOOLEAN;


FUNCTION IS_THERE_REMARK_ON_CON_FUNC(
  p_ven_code  IN contacts.con_ven_code%TYPE,
  p_cus_code  IN contacts.con_cus_code%TYPE,  --on doit passer soit le cus code OU le ven code, jamais les deux
  p_cty_code  IN contacts.con_cty_code%TYPE   --on doit passer le type de contact recherché
)
RETURN BOOLEAN;

PROCEDURE UPDATE_PASSWORD_CONTACT_PROC(
  p_con_id        IN contacts.con_id%TYPE,
  p_con_password  IN contacts.con_password%TYPE
);

PROCEDURE PURGE_PROC(
  p_con_ven_code IN contacts.con_ven_code%TYPE
);

END CON_OPERATION_pack;
/