CREATE OR REPLACE PACKAGE phenix.SRTH_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  sales_register_trans_headers%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_srth_id                        IN         sales_register_trans_headers.srth_id%TYPE,
  p_srth_rec                       OUT NOCOPY sales_register_trans_headers%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_srth_id                        IN         sales_register_trans_headers.srth_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_srth_id                        IN         sales_register_trans_headers.srth_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_srth_id                        IN         sales_register_trans_headers.srth_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_srth_id                        IN         sales_register_trans_headers.srth_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_srth_id                        IN         sales_register_trans_headers.srth_id%TYPE);


FUNCTION INSERT_FUNC(
  p_srth_cre_code        IN         sales_register_trans_headers.srth_cre_code%TYPE,
  p_srth_use_code        IN         sales_register_trans_headers.srth_use_code%TYPE,
  p_srth_type            IN         sales_register_trans_headers.srth_type%TYPE,
  p_srth_amount          IN         sales_register_trans_headers.srth_amount%TYPE,
  p_srth_whs_code        IN         sales_register_trans_headers.srth_whs_code%TYPE,
  p_srth_inh_id          IN         sales_register_trans_headers.srth_inh_id%TYPE               DEFAULT NULL,
  p_srth_srth_id         IN         sales_register_trans_headers.srth_srth_id%TYPE              DEFAULT NULL,
  p_srth_date            IN         sales_register_trans_headers.srth_date%TYPE                 DEFAULT SYSDATE )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY sales_register_trans_headers%ROWTYPE)
RETURN NUMBER;

END SRTH_PACK;
/