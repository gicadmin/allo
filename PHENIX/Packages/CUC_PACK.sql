CREATE OR REPLACE PACKAGE phenix.CUC_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  customer_couriers%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_cuc_cus_code                   IN         customer_couriers.cuc_cus_code%TYPE,
  p_cuc_prf_prd_code               IN         customer_couriers.cuc_prf_prd_code%TYPE,
  p_cuc_prf_fmt_code               IN         customer_couriers.cuc_prf_fmt_code%TYPE,
  p_cuc_rec                        OUT NOCOPY customer_couriers%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_cuc_cus_code                   IN         customer_couriers.cuc_cus_code%TYPE,
  p_cuc_prf_prd_code               IN         customer_couriers.cuc_prf_prd_code%TYPE,
  p_cuc_prf_fmt_code               IN         customer_couriers.cuc_prf_fmt_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_cuc_cus_code                   IN         customer_couriers.cuc_cus_code%TYPE,
  p_cuc_prf_prd_code               IN         customer_couriers.cuc_prf_prd_code%TYPE,
  p_cuc_prf_fmt_code               IN         customer_couriers.cuc_prf_fmt_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_cuc_cus_code                   IN         customer_couriers.cuc_cus_code%TYPE,
  p_cuc_prf_prd_code               IN         customer_couriers.cuc_prf_prd_code%TYPE,
  p_cuc_prf_fmt_code               IN         customer_couriers.cuc_prf_fmt_code%TYPE)
RETURN NUMBER;


PROCEDURE INSERT_PROC(
  p_cuc_cus_code         IN         customer_couriers.cuc_cus_code%TYPE,
  p_cuc_prf_prd_code     IN         customer_couriers.cuc_prf_prd_code%TYPE,
  p_cuc_prf_fmt_code     IN         customer_couriers.cuc_prf_fmt_code%TYPE,
  p_cuc_sent_switch      IN         customer_couriers.cuc_sent_switch%TYPE);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY customer_couriers%ROWTYPE);

END CUC_PACK;
/