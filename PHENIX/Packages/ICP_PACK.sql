CREATE OR REPLACE PACKAGE phenix.ICP_PACK IS

FUNCTION GET_NEXT_PRODUCT_FUNC
RETURN VARCHAR2;

PROCEDURE INSERT_PRODUCT_PROC(
  p_prd_code                   IN  products.prd_code%TYPE,
  p_prd_description            IN  products.prd_description%TYPE,
  p_prd_short_description      IN  products.prd_short_description%TYPE,
  p_prd_ven_code               IN  products.prd_ven_code%TYPE,
  p_prd_pgr_code               IN  products.prd_pgr_code%TYPE,
  p_prd_cls_code               IN  products.prd_cls_code%TYPE,
  p_prd_default_whz_code       IN  products.prd_default_whz_code%TYPE,
  p_prd_definition             IN  products.prd_definition%TYPE,
  p_prd_base_selling_list      IN  products.prd_base_selling_list%TYPE,
  p_prd_cost_adjustment        IN  products.prd_cost_adjustment%TYPE,
  p_prd_alt_description        IN  products.prd_alt_description%TYPE        DEFAULT NULL,
  p_prd_short_alt_description  IN  products.prd_short_alt_description%TYPE  DEFAULT NULL,
  p_prd_size                   IN  products.prd_size%TYPE                   DEFAULT NULL,
  p_prd_size_uom               IN  products.prd_size_uom%TYPE               DEFAULT NULL,
  p_prd_brn_code               IN  products.prd_brn_code%TYPE               DEFAULT NULL,
  p_prd_service_type           IN  products.prd_service_type%TYPE           DEFAULT 'ADE',
  p_prd_packaging_type         IN  products.prd_packaging_type%TYPE         DEFAULT 'DEF',
  p_prd_attribute              IN  products.prd_attribute%TYPE              DEFAULT 'REG',
  p_prd_cost_admin_1           IN  products.prd_cost_admin_1%TYPE           DEFAULT 0,
  p_prd_cost_admin_2_percent   IN  products.prd_cost_admin_2_percent%TYPE   DEFAULT 0,
  p_prd_product_life           IN  products.prd_product_life%TYPE           DEFAULT NULL
);

PROCEDURE INSERT_FORMAT_PROC(
  p_prf_prd_code            IN  product_formats.prf_prd_code%TYPE,
  p_prf_fmt_code            IN  product_formats.prf_fmt_code%TYPE,
  p_prf_conversion_to_base  IN  product_formats.prf_conversion_to_base%TYPE,
  p_prf_description         IN  product_formats.prf_description%TYPE,
  p_prf_height              IN  product_formats.prf_height%TYPE,
  p_prf_inner_weight        IN  product_formats.prf_inner_weight%TYPE,
  p_prf_length              IN  product_formats.prf_length%TYPE,
  p_prf_operation_flag      IN  product_formats.prf_operation_flag%TYPE,
  p_prf_price               IN  product_formats.prf_price%TYPE,
  p_prf_profit_percent      IN  product_formats.prf_profit_percent%TYPE,
  p_prf_purchase_weight     IN  product_formats.prf_purchase_weight%TYPE,
  p_prf_width               IN  product_formats.prf_width%TYPE,
  p_prf_upc_code            IN  product_formats.prf_upc_code%TYPE          DEFAULT NULL,
  p_prf_number_of_items     IN  product_formats.prf_number_of_items%TYPE   DEFAULT NULL,
  p_prf_tobacco_tax         IN  product_formats.prf_tobacco_tax%TYPE       DEFAULT 0,
  p_prf_discount_switch     IN  product_formats.prf_discount_switch%TYPE   DEFAULT 1
);

PROCEDURE VALIDATE_ALL_FORMAT_PROC(
  p_prf_prd_code IN product_formats.prf_prd_code%TYPE
);

PROCEDURE INSERT_VENDOR_PRODUCT_PROC(
  p_vpd_ven_distributed_by_code  IN  vendor_products.vpd_ven_distributed_by_code%TYPE,
  p_vpd_code                     IN  vendor_products.vpd_code%TYPE,
  p_vpd_prd_code                 IN  vendor_products.vpd_prd_code%TYPE,
  p_vpd_prf_fmt_code             IN  vendor_products.vpd_prf_fmt_code%TYPE,
  p_vpd_list_cost                IN  vendor_products.vpd_list_cost%TYPE,
  p_vpd_items_per_row            IN  vendor_products.vpd_items_per_row%TYPE      DEFAULT NULL,
  p_vpd_items_per_palette        IN  vendor_products.vpd_items_per_palette%TYPE  DEFAULT NULL
);

END ICP_PACK;
/