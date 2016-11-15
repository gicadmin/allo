CREATE OR REPLACE PACKAGE phenix.SDA_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  dock_change_audit%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_sda_id                         IN         dock_change_audit.sda_id%TYPE,
  p_sda_rec                        OUT NOCOPY dock_change_audit%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_sda_id                         IN         dock_change_audit.sda_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_sda_id                         IN         dock_change_audit.sda_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_sda_id                         IN         dock_change_audit.sda_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_sda_id                         IN         dock_change_audit.sda_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_sda_id                         IN         dock_change_audit.sda_id%TYPE);


FUNCTION INSERT_FUNC(
  p_sda_orig_dock_code   IN         dock_change_audit.sda_orig_dock_code%TYPE,
  p_sda_trans_type       IN         dock_change_audit.sda_trans_type%TYPE,
  p_sda_new_dock_code    IN         dock_change_audit.sda_new_dock_code%TYPE,
  p_sda_cus_code         IN         dock_change_audit.sda_cus_code%TYPE,
  p_sda_ven_code         IN         dock_change_audit.sda_ven_code%TYPE,
  p_sda_change_date      IN         dock_change_audit.sda_change_date%TYPE           DEFAULT SYSDATE )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY dock_change_audit%ROWTYPE)
RETURN NUMBER;

END SDA_PACK;
/