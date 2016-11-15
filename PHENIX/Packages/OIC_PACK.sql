CREATE OR REPLACE PACKAGE phenix.OIC_PACK IS

FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  outstanding_inventory_counts%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_oic_id                         IN         outstanding_inventory_counts.oic_id%TYPE,
  p_oic_rec                        OUT NOCOPY outstanding_inventory_counts%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_oic_id                         IN         outstanding_inventory_counts.oic_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_oic_id                         IN         outstanding_inventory_counts.oic_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_oic_id                         IN         outstanding_inventory_counts.oic_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_oic_id                         IN         outstanding_inventory_counts.oic_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_oic_id                         IN         outstanding_inventory_counts.oic_id%TYPE);


FUNCTION INSERT_FUNC(
  p_oic_loc_code             IN         outstanding_inventory_counts.oic_loc_code%TYPE,
  p_oic_type                 IN         outstanding_inventory_counts.oic_type%TYPE,
  p_oic_status               IN         outstanding_inventory_counts.oic_status%TYPE,
  p_oic_whs_code             IN         outstanding_inventory_counts.oic_whs_code%TYPE,
  p_oic_prd_code             IN         outstanding_inventory_counts.oic_prd_code%TYPE                  DEFAULT NULL,
  p_oic_rma_reference_number IN         outstanding_inventory_counts.oic_rma_reference_number%TYPE      DEFAULT NULL,
  p_oic_creation_date        IN         outstanding_inventory_counts.oic_creation_date%TYPE             DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY outstanding_inventory_counts%ROWTYPE)
RETURN NUMBER;

END OIC_PACK;
/