CREATE OR REPLACE PACKAGE phenix.CLP_OPERATION_PACK IS

PROCEDURE VALIDATE_USED_PASSWORD_PROC(
 p_clp_con_id        IN contacts_last_passwords.clp_con_id%TYPE,
 p_password          IN VARCHAR2,
 p_password_used     OUT BOOLEAN,
 p_clp_id_to_delete  OUT contacts_last_passwords.clp_id%TYPE
 ) ;

PROCEDURE DELETE_CLP_PROC(
  p_clp_id      IN contacts_last_passwords.clp_id%TYPE,
  p_clp_con_id  IN contacts_last_passwords.clp_con_id%TYPE
);
PROCEDURE CHANGE_PASSWORD_CONTACT_PROC(
  p_con_id            IN contacts.con_id%TYPE,
  p_password          IN VARCHAR2,
  p_clp_id_to_delete  IN NUMBER
);

END CLP_OPERATION_PACK;
/