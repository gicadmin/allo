CREATE OR REPLACE PACKAGE phenix.MCA_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  misc_charge_whs_accounts%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_mca_mct_code                   IN         misc_charge_whs_accounts.mca_mct_code%TYPE,
  p_mca_whs_code                   IN         misc_charge_whs_accounts.mca_whs_code%TYPE,
  p_mca_rec                        OUT NOCOPY misc_charge_whs_accounts%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_mca_mct_code                   IN         misc_charge_whs_accounts.mca_mct_code%TYPE,
  p_mca_whs_code                   IN         misc_charge_whs_accounts.mca_whs_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_mca_mct_code                   IN         misc_charge_whs_accounts.mca_mct_code%TYPE,
  p_mca_whs_code                   IN         misc_charge_whs_accounts.mca_whs_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_mca_mct_code                   IN         misc_charge_whs_accounts.mca_mct_code%TYPE,
  p_mca_whs_code                   IN         misc_charge_whs_accounts.mca_whs_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_mca_mct_code                   IN         misc_charge_whs_accounts.mca_mct_code%TYPE,
  p_mca_whs_code                   IN         misc_charge_whs_accounts.mca_whs_code%TYPE);


PROCEDURE INSERT_PROC(
  p_mca_mct_code         IN         misc_charge_whs_accounts.mca_mct_code%TYPE,
  p_mca_whs_code         IN         misc_charge_whs_accounts.mca_whs_code%TYPE,
  p_mca_gl_account       IN         misc_charge_whs_accounts.mca_gl_account%TYPE);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY misc_charge_whs_accounts%ROWTYPE);

END MCA_PACK;
/