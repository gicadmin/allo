CREATE OR REPLACE PACKAGE phenix.SCSC_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  site_contract_sale_commitments%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_scsc_id                        IN         site_contract_sale_commitments.scsc_id%TYPE,
  p_scsc_rec                       OUT NOCOPY site_contract_sale_commitments%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_scsc_id                        IN         site_contract_sale_commitments.scsc_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_scsc_id                        IN         site_contract_sale_commitments.scsc_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_scsc_id                        IN         site_contract_sale_commitments.scsc_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_scsc_id                        IN         site_contract_sale_commitments.scsc_id%TYPE);

FUNCTION GET_FULL_FUNC(
  p_scsc_ssch_code                 IN         site_contract_sale_commitments.scsc_ssch_code%TYPE,
  p_scsc_coca_code                 IN         site_contract_sale_commitments.scsc_coca_code%TYPE,
  p_scsc_vgr_code                  IN         site_contract_sale_commitments.scsc_vgr_code%TYPE,
  p_scsc_rec                       OUT NOCOPY site_contract_sale_commitments%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_scsc_ssch_code                 IN         site_contract_sale_commitments.scsc_ssch_code%TYPE,
  p_scsc_coca_code                 IN         site_contract_sale_commitments.scsc_coca_code%TYPE,
  p_scsc_vgr_code                  IN         site_contract_sale_commitments.scsc_vgr_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_scsc_ssch_code                 IN         site_contract_sale_commitments.scsc_ssch_code%TYPE,
  p_scsc_coca_code                 IN         site_contract_sale_commitments.scsc_coca_code%TYPE,
  p_scsc_vgr_code                  IN         site_contract_sale_commitments.scsc_vgr_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_scsc_ssch_code                 IN         site_contract_sale_commitments.scsc_ssch_code%TYPE,
  p_scsc_coca_code                 IN         site_contract_sale_commitments.scsc_coca_code%TYPE,
  p_scsc_vgr_code                  IN         site_contract_sale_commitments.scsc_vgr_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_scsc_ssch_code                 IN         site_contract_sale_commitments.scsc_ssch_code%TYPE,
  p_scsc_coca_code                 IN         site_contract_sale_commitments.scsc_coca_code%TYPE,
  p_scsc_vgr_code                  IN         site_contract_sale_commitments.scsc_vgr_code%TYPE);


FUNCTION INSERT_FUNC(
  p_scsc_ssch_code           IN         site_contract_sale_commitments.scsc_ssch_code%TYPE,
  p_scsc_coca_code           IN         site_contract_sale_commitments.scsc_coca_code%TYPE                DEFAULT NULL,
  p_scsc_vgr_code            IN         site_contract_sale_commitments.scsc_vgr_code%TYPE                 DEFAULT NULL,
  p_scsc_commitment_dollars  IN         site_contract_sale_commitments.scsc_commitment_dollars%TYPE       DEFAULT NULL,
  p_scsc_commitment_elements IN         site_contract_sale_commitments.scsc_commitment_elements%TYPE      DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY site_contract_sale_commitments%ROWTYPE)
RETURN NUMBER;

END SCSC_PACK;
/