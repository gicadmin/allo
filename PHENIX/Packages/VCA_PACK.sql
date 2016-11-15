CREATE OR REPLACE PACKAGE phenix.VCA_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  vendor_customer_agreements%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_vca_id                         IN         vendor_customer_agreements.vca_id%TYPE,
  p_vca_rec                        OUT NOCOPY vendor_customer_agreements%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_vca_id                         IN         vendor_customer_agreements.vca_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION DELETE_FUNC(
  p_vca_id                         IN         vendor_customer_agreements.vca_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_vca_id                         IN         vendor_customer_agreements.vca_id%TYPE);


FUNCTION INSERT_FUNC(
  p_vca_vsa_code         IN         vendor_customer_agreements.vca_vsa_code%TYPE,
  p_vca_cus_code         IN         vendor_customer_agreements.vca_cus_code%TYPE              DEFAULT NULL,
  p_vca_qty_code         IN         vendor_customer_agreements.vca_qty_code%TYPE              DEFAULT NULL,
  p_vca_naz_nac_code     IN         vendor_customer_agreements.vca_naz_nac_code%TYPE          DEFAULT NULL,
  p_vca_naz_zone_code    IN         vendor_customer_agreements.vca_naz_zone_code%TYPE         DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY vendor_customer_agreements%ROWTYPE)
RETURN NUMBER;

END VCA_PACK;
/