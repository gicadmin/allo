CREATE OR REPLACE PACKAGE phenix.VOAR_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  vend_order_agreement_reclaims%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_voar_id                        IN         vend_order_agreement_reclaims.voar_id%TYPE,
  p_voar_rec                       OUT NOCOPY vend_order_agreement_reclaims%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_voar_id                        IN         vend_order_agreement_reclaims.voar_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_voar_id                        IN         vend_order_agreement_reclaims.voar_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_voar_id                        IN         vend_order_agreement_reclaims.voar_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_voar_id                        IN         vend_order_agreement_reclaims.voar_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_voar_id                        IN         vend_order_agreement_reclaims.voar_id%TYPE);

FUNCTION GET_FULL_FUNC(
  p_voar_cod_coh_id                IN         vend_order_agreement_reclaims.voar_cod_coh_id%TYPE,
  p_voar_cod_line_number           IN         vend_order_agreement_reclaims.voar_cod_line_number%TYPE,
  p_voar_cad_id                    IN         vend_order_agreement_reclaims.voar_cad_id%TYPE,
  p_voar_voad_id                   IN         vend_order_agreement_reclaims.voar_voad_id%TYPE,
  p_voar_rec                       OUT NOCOPY vend_order_agreement_reclaims%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_voar_cod_coh_id                IN         vend_order_agreement_reclaims.voar_cod_coh_id%TYPE,
  p_voar_cod_line_number           IN         vend_order_agreement_reclaims.voar_cod_line_number%TYPE,
  p_voar_cad_id                    IN         vend_order_agreement_reclaims.voar_cad_id%TYPE,
  p_voar_voad_id                   IN         vend_order_agreement_reclaims.voar_voad_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_voar_cod_coh_id                IN         vend_order_agreement_reclaims.voar_cod_coh_id%TYPE,
  p_voar_cod_line_number           IN         vend_order_agreement_reclaims.voar_cod_line_number%TYPE,
  p_voar_cad_id                    IN         vend_order_agreement_reclaims.voar_cad_id%TYPE,
  p_voar_voad_id                   IN         vend_order_agreement_reclaims.voar_voad_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_voar_cod_coh_id                IN         vend_order_agreement_reclaims.voar_cod_coh_id%TYPE,
  p_voar_cod_line_number           IN         vend_order_agreement_reclaims.voar_cod_line_number%TYPE,
  p_voar_cad_id                    IN         vend_order_agreement_reclaims.voar_cad_id%TYPE,
  p_voar_voad_id                   IN         vend_order_agreement_reclaims.voar_voad_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_voar_cod_coh_id                IN         vend_order_agreement_reclaims.voar_cod_coh_id%TYPE,
  p_voar_cod_line_number           IN         vend_order_agreement_reclaims.voar_cod_line_number%TYPE,
  p_voar_cad_id                    IN         vend_order_agreement_reclaims.voar_cad_id%TYPE,
  p_voar_voad_id                   IN         vend_order_agreement_reclaims.voar_voad_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_voar_cod_coh_id                IN         vend_order_agreement_reclaims.voar_cod_coh_id%TYPE,
  p_voar_cod_line_number           IN         vend_order_agreement_reclaims.voar_cod_line_number%TYPE,
  p_voar_cad_id                    IN         vend_order_agreement_reclaims.voar_cad_id%TYPE,
  p_voar_voad_id                   IN         vend_order_agreement_reclaims.voar_voad_id%TYPE);


FUNCTION INSERT_FUNC(
  p_voar_qualifier        IN         vend_order_agreement_reclaims.voar_qualifier%TYPE,
  p_voar_ven_code         IN         vend_order_agreement_reclaims.voar_ven_code%TYPE,
  p_voar_purch_allocation IN         vend_order_agreement_reclaims.voar_purch_allocation%TYPE,
  p_voar_sales_allocation IN         vend_order_agreement_reclaims.voar_sales_allocation%TYPE,
  p_voar_cod_coh_id       IN         vend_order_agreement_reclaims.voar_cod_coh_id%TYPE            DEFAULT NULL,
  p_voar_cod_line_number  IN         vend_order_agreement_reclaims.voar_cod_line_number%TYPE       DEFAULT NULL,
  p_voar_cad_id           IN         vend_order_agreement_reclaims.voar_cad_id%TYPE                DEFAULT NULL,
  p_voar_voad_id          IN         vend_order_agreement_reclaims.voar_voad_id%TYPE               DEFAULT NULL,
  p_voar_vbd_id           IN         vend_order_agreement_reclaims.voar_vbd_id%TYPE                DEFAULT NULL,
  p_voar_invoiced_switch  IN         vend_order_agreement_reclaims.voar_invoiced_switch%TYPE       DEFAULT 0 ,
  p_voar_creation_date    IN         vend_order_agreement_reclaims.voar_creation_date%TYPE         DEFAULT SYSDATE )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY vend_order_agreement_reclaims%ROWTYPE)
RETURN NUMBER;

END VOAR_PACK;
/