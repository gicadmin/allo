CREATE OR REPLACE PACKAGE phenix.VCG_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  vendor_product_categories%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_vcg_id                         IN         vendor_product_categories.vcg_id%TYPE,
  p_vcg_rec                        OUT NOCOPY vendor_product_categories%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_vcg_id                         IN         vendor_product_categories.vcg_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_vcg_id                         IN         vendor_product_categories.vcg_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_vcg_id                         IN         vendor_product_categories.vcg_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_vcg_id                         IN         vendor_product_categories.vcg_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_vcg_id                         IN         vendor_product_categories.vcg_id%TYPE);

FUNCTION GET_FULL_FUNC(
  p_vcg_ven_code                   IN         vendor_product_categories.vcg_ven_code%TYPE,
  p_vcg_category_code              IN         vendor_product_categories.vcg_category_code%TYPE,
  p_vcg_rec                        OUT NOCOPY vendor_product_categories%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_vcg_ven_code                   IN         vendor_product_categories.vcg_ven_code%TYPE,
  p_vcg_category_code              IN         vendor_product_categories.vcg_category_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_vcg_ven_code                   IN         vendor_product_categories.vcg_ven_code%TYPE,
  p_vcg_category_code              IN         vendor_product_categories.vcg_category_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_vcg_ven_code                   IN         vendor_product_categories.vcg_ven_code%TYPE,
  p_vcg_category_code              IN         vendor_product_categories.vcg_category_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_vcg_ven_code                   IN         vendor_product_categories.vcg_ven_code%TYPE,
  p_vcg_category_code              IN         vendor_product_categories.vcg_category_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_vcg_ven_code                   IN         vendor_product_categories.vcg_ven_code%TYPE,
  p_vcg_category_code              IN         vendor_product_categories.vcg_category_code%TYPE);


FUNCTION INSERT_FUNC(
  p_vcg_ven_code                   IN         vendor_product_categories.vcg_ven_code%TYPE,
  p_vcg_category_code              IN         vendor_product_categories.vcg_category_code%TYPE,
  p_vcg_description                IN         vendor_product_categories.vcg_description%TYPE,
  p_vcg_drop_terms                 IN         vendor_product_categories.vcg_drop_terms%TYPE,
  p_vcg_collected_avr_percent      IN         vendor_product_categories.vcg_collected_avr_percent%TYPE           DEFAULT NULL,
  p_vcg_distributed_avr_percent    IN         vendor_product_categories.vcg_distributed_avr_percent%TYPE         DEFAULT NULL,
  p_vcg_alt_description            IN         vendor_product_categories.vcg_alt_description%TYPE                 DEFAULT NULL,
  p_vcg_quart_drop_ship_avr        IN         vendor_product_categories.vcg_quart_drop_ship_avr%TYPE             DEFAULT NULL,
  p_vcg_quart_warehouse_avr        IN         vendor_product_categories.vcg_quart_warehouse_avr%TYPE             DEFAULT NULL,
  p_vcg_message                    IN         vendor_product_categories.vcg_message%TYPE                         DEFAULT NULL,
  p_vcg_collected_avr_amount       IN         vendor_product_categories.vcg_collected_avr_amount%TYPE            DEFAULT NULL,
  p_vcg_distributed_avr_amount     IN         vendor_product_categories.vcg_distributed_avr_amount%TYPE          DEFAULT NULL,
  p_vcg_quart_drop_ship_avr_amou   IN         vendor_product_categories.vcg_quart_drop_ship_avr_amount%TYPE      DEFAULT NULL,
  p_vcg_quart_warehouse_avr_amou   IN         vendor_product_categories.vcg_quart_warehouse_avr_amount%TYPE      DEFAULT NULL,
  p_vcg_qualifier                  IN         vendor_product_categories.vcg_qualifier%TYPE                       DEFAULT 'IT' ,
  p_vcg_collect_distrib_qualifie   IN         vendor_product_categories.vcg_collect_distrib_qualifier%TYPE       DEFAULT 'IT' )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY vendor_product_categories%ROWTYPE)
RETURN NUMBER;

END VCG_PACK;
/