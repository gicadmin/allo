CREATE OR REPLACE PACKAGE phenix.VOAD_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  vend_order_agreement_details%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_voad_id                        IN         vend_order_agreement_details.voad_id%TYPE,
  p_voad_rec                       OUT NOCOPY vend_order_agreement_details%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_voad_id                        IN         vend_order_agreement_details.voad_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_voad_id                        IN         vend_order_agreement_details.voad_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_voad_id                        IN         vend_order_agreement_details.voad_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_voad_id                        IN         vend_order_agreement_details.voad_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_voad_id                        IN         vend_order_agreement_details.voad_id%TYPE);


FUNCTION INSERT_FUNC(
  p_voad_voah_id           IN         vend_order_agreement_details.voad_voah_id%TYPE,
  p_voad_cus_code          IN         vend_order_agreement_details.voad_cus_code%TYPE,
  p_voad_prf_prd_code      IN         vend_order_agreement_details.voad_prf_prd_code%TYPE,
  p_voad_prf_fmt_code      IN         vend_order_agreement_details.voad_prf_fmt_code%TYPE,
  p_voad_start_date        IN         vend_order_agreement_details.voad_start_date%TYPE,
  p_voad_end_date          IN         vend_order_agreement_details.voad_end_date%TYPE,
  p_voad_sales_allowance   IN         vend_order_agreement_details.voad_sales_allowance%TYPE,
  p_voad_creation_date     IN         vend_order_agreement_details.voad_creation_date%TYPE          DEFAULT SYSDATE ,
  p_voad_modification_date IN         vend_order_agreement_details.voad_modification_date%TYPE      DEFAULT SYSDATE )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY vend_order_agreement_details%ROWTYPE)
RETURN NUMBER;

END VOAD_PACK;
/