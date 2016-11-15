CREATE OR REPLACE PACKAGE phenix.TCCT_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  temporary_c_and_c_tickets%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_tcct_prd_code                  IN         temporary_c_and_c_tickets.tcct_prd_code%TYPE,
  p_tcct_rec                       OUT NOCOPY temporary_c_and_c_tickets%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_tcct_prd_code                  IN         temporary_c_and_c_tickets.tcct_prd_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_tcct_prd_code                  IN         temporary_c_and_c_tickets.tcct_prd_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_tcct_prd_code                  IN         temporary_c_and_c_tickets.tcct_prd_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_tcct_prd_code                  IN         temporary_c_and_c_tickets.tcct_prd_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_tcct_prd_code                  IN         temporary_c_and_c_tickets.tcct_prd_code%TYPE);


PROCEDURE INSERT_PROC(
  p_tcct_prd_code                 IN         temporary_c_and_c_tickets.tcct_prd_code%TYPE,
  p_tcct_prd_description          IN         temporary_c_and_c_tickets.tcct_prd_description%TYPE,
  p_tcct_smallest_price           IN         temporary_c_and_c_tickets.tcct_smallest_price%TYPE,
  p_tcct_smallest_prf_descriptio  IN         temporary_c_and_c_tickets.tcct_smallest_prf_description%TYPE,
  p_tcct_smallest_fmt_descriptio  IN         temporary_c_and_c_tickets.tcct_smallest_fmt_description%TYPE,
  p_tcct_print_date               IN         temporary_c_and_c_tickets.tcct_print_date%TYPE,
  p_tcct_smallest_prf_fmt_code    IN         temporary_c_and_c_tickets.tcct_smallest_prf_fmt_code%TYPE,
  p_tcct_sales_tax_labels         IN         temporary_c_and_c_tickets.tcct_sales_tax_labels%TYPE              DEFAULT NULL,
  p_tcct_purchase_tax_labels      IN         temporary_c_and_c_tickets.tcct_purchase_tax_labels%TYPE           DEFAULT NULL,
  p_tcct_largest_price            IN         temporary_c_and_c_tickets.tcct_largest_price%TYPE                 DEFAULT NULL,
  p_tcct_largest_prf_description  IN         temporary_c_and_c_tickets.tcct_largest_prf_description%TYPE       DEFAULT NULL,
  p_tcct_largest_fmt_description  IN         temporary_c_and_c_tickets.tcct_largest_fmt_description%TYPE       DEFAULT NULL,
  p_tcct_effective_date           IN         temporary_c_and_c_tickets.tcct_effective_date%TYPE                DEFAULT NULL,
  p_tcct_promo_from_date          IN         temporary_c_and_c_tickets.tcct_promo_from_date%TYPE               DEFAULT NULL,
  p_tcct_promo_to_date            IN         temporary_c_and_c_tickets.tcct_promo_to_date%TYPE                 DEFAULT NULL,
  p_tcct_brandname_or_manuf       IN         temporary_c_and_c_tickets.tcct_brandname_or_manuf%TYPE            DEFAULT NULL,
  p_tcct_loc_code                 IN         temporary_c_and_c_tickets.tcct_loc_code%TYPE                      DEFAULT NULL,
  p_tcct_largest_prf_fmt_code     IN         temporary_c_and_c_tickets.tcct_largest_prf_fmt_code%TYPE          DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY temporary_c_and_c_tickets%ROWTYPE);

END TCCT_PACK;
/