CREATE OR REPLACE PACKAGE phenix.CCL_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  customer_classes%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_ccl_cus_code                   IN         customer_classes.ccl_cus_code%TYPE,
  p_ccl_cls_code                   IN         customer_classes.ccl_cls_code%TYPE,
  p_ccl_rec                        OUT NOCOPY customer_classes%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_ccl_cus_code                   IN         customer_classes.ccl_cus_code%TYPE,
  p_ccl_cls_code                   IN         customer_classes.ccl_cls_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION DELETE_FUNC(
  p_ccl_cus_code                   IN         customer_classes.ccl_cus_code%TYPE,
  p_ccl_cls_code                   IN         customer_classes.ccl_cls_code%TYPE)
RETURN NUMBER;


PROCEDURE INSERT_PROC(
  p_ccl_cus_code         IN         customer_classes.ccl_cus_code%TYPE,
  p_ccl_cls_code         IN         customer_classes.ccl_cls_code%TYPE,
  p_ccl_use_code         IN         customer_classes.ccl_use_code%TYPE);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY customer_classes%ROWTYPE);

END CCL_PACK;
/