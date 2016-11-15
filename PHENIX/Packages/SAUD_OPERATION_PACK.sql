CREATE OR REPLACE PACKAGE phenix.SAUD_OPERATION_PACK IS

PROCEDURE AUDIT_CHANGE_PROC(
  p_object_name           IN security_audits.saud_object_name%TYPE,
  p_column_name           IN security_audits.saud_column_name%TYPE,
  p_row_key               IN security_audits.saud_row_key%TYPE,
  p_action                IN security_audits.saud_action%TYPE,
  p_old_value             IN NUMBER,
  p_new_value             IN NUMBER
);

PROCEDURE AUDIT_CHANGE_PROC(
  p_object_name           IN security_audits.saud_object_name%TYPE,
  p_column_name           IN security_audits.saud_column_name%TYPE,
  p_row_key               IN security_audits.saud_row_key%TYPE,
  p_action                IN security_audits.saud_action%TYPE,
  p_old_value             IN VARCHAR2,
  p_new_value             IN VARCHAR2
);

PROCEDURE AUDIT_CHANGE_PROC(
  p_object_name           IN security_audits.saud_object_name%TYPE,
  p_column_name           IN security_audits.saud_column_name%TYPE,
  p_row_key               IN security_audits.saud_row_key%TYPE,
  p_action                IN security_audits.saud_action%TYPE,
  p_old_value             IN DATE,
  p_new_value             IN DATE);

FUNCTION AUDIT_CHANGE_FUNC(
  p_object_name           IN security_audits.saud_object_name%TYPE,
  p_column_name           IN security_audits.saud_column_name%TYPE,
  p_row_key               IN security_audits.saud_row_key%TYPE,
  p_action                IN security_audits.saud_action%TYPE,
  p_old_value             IN NUMBER,
  p_new_value             IN NUMBER
) return number;

FUNCTION AUDIT_CHANGE_FUNC(
  p_object_name           IN security_audits.saud_object_name%TYPE,
  p_column_name           IN security_audits.saud_column_name%TYPE,
  p_row_key               IN security_audits.saud_row_key%TYPE,
  p_action                IN security_audits.saud_action%TYPE,
  p_old_value             IN VARCHAR2,
  p_new_value             IN VARCHAR2
) return number;

FUNCTION AUDIT_CHANGE_FUNC(
  p_object_name           IN security_audits.saud_object_name%TYPE,
  p_column_name           IN security_audits.saud_column_name%TYPE,
  p_row_key               IN security_audits.saud_row_key%TYPE,
  p_action                IN security_audits.saud_action%TYPE,
  p_old_value             IN DATE,
  p_new_value             IN DATE
) return number;

END SAUD_OPERATION_PACK;
/