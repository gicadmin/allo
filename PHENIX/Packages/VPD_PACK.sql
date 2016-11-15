CREATE OR REPLACE PACKAGE phenix.VPD_PACK IS

PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  vendor_products%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_vpd_code                       IN         vendor_products.vpd_code%TYPE,
  p_vpd_ven_distributed_by_code    IN         vendor_products.vpd_ven_distributed_by_code%TYPE,
  p_vpd_rec                        OUT NOCOPY vendor_products%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_vpd_code                       IN         vendor_products.vpd_code%TYPE,
  p_vpd_ven_distributed_by_code    IN         vendor_products.vpd_ven_distributed_by_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_vpd_code                       IN         vendor_products.vpd_code%TYPE,
  p_vpd_ven_distributed_by_code    IN         vendor_products.vpd_ven_distributed_by_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_vpd_code                       IN         vendor_products.vpd_code%TYPE,
  p_vpd_ven_distributed_by_code    IN         vendor_products.vpd_ven_distributed_by_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_vpd_code                       IN         vendor_products.vpd_code%TYPE,
  p_vpd_ven_distributed_by_code    IN         vendor_products.vpd_ven_distributed_by_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_vpd_code                       IN         vendor_products.vpd_code%TYPE,
  p_vpd_ven_distributed_by_code    IN         vendor_products.vpd_ven_distributed_by_code%TYPE);


PROCEDURE INSERT_PROC(
  p_vpd_ven_distributed_by_code  IN         vendor_products.vpd_ven_distributed_by_code%TYPE,
  p_vpd_code                     IN         vendor_products.vpd_code%TYPE,
  p_vpd_active_switch            IN         vendor_products.vpd_active_switch%TYPE,
  p_vpd_description              IN         vendor_products.vpd_description%TYPE,
  p_vpd_internal_vendor_unit     IN         vendor_products.vpd_internal_vendor_unit%TYPE,
  p_vpd_last_cost                IN         vendor_products.vpd_last_cost%TYPE,
  p_vpd_list_cost                IN         vendor_products.vpd_list_cost%TYPE,
  p_vpd_purchase_multiple        IN         vendor_products.vpd_purchase_multiple%TYPE,
  p_vpd_special_order_switch     IN         vendor_products.vpd_special_order_switch%TYPE,
  p_vpd_vcg_id                   IN         vendor_products.vpd_vcg_id%TYPE,
  p_vpd_prd_code                 IN         vendor_products.vpd_prd_code%TYPE                      DEFAULT NULL,
  p_vpd_prf_fmt_code             IN         vendor_products.vpd_prf_fmt_code%TYPE                  DEFAULT NULL,
  p_vpd_ven_manufactured_by_code IN         vendor_products.vpd_ven_manufactured_by_code%TYPE      DEFAULT NULL,
  p_vpd_alt_description          IN         vendor_products.vpd_alt_description%TYPE               DEFAULT NULL,
  p_vpd_catalog_sequence         IN         vendor_products.vpd_catalog_sequence%TYPE              DEFAULT NULL,
  p_vpd_items_per_palette        IN         vendor_products.vpd_items_per_palette%TYPE             DEFAULT NULL,
  p_vpd_items_per_row            IN         vendor_products.vpd_items_per_row%TYPE                 DEFAULT NULL,
  p_vpd_manufacturer_code        IN         vendor_products.vpd_manufacturer_code%TYPE             DEFAULT NULL,
  p_vpd_upc_code                 IN         vendor_products.vpd_upc_code%TYPE                      DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY vendor_products%ROWTYPE);

------------------------------------------------------------------------------

FUNCTION LOCK_VPD_FUNC(
  p_vpd_code                    IN VARCHAR2,
  p_vpd_ven_distributed_by_code IN NUMBER
)
RETURN BOOLEAN;

------------------------------------------------------------------------------

FUNCTION LOCK_VPD_FUNC(
  p_vpd_code                    IN VARCHAR2,
  p_vpd_ven_distributed_by_code IN NUMBER,
  p_vpd_prd_code                OUT VARCHAR2
)
RETURN BOOLEAN;

------------------------------------------------------------------------------

--Fonction qui retourne le Numéro de produit Colabor
FUNCTION GET_PROD_BROKER_FUNC(
  p_prf_prd_code IN VARCHAR2
)
RETURN VARCHAR2;

------------------------------------------------------------------------------

FUNCTION FIND_VPD_USING_PRD_FUNC(
  p_vpd_prd_code                IN VARCHAR2,
  p_vpd_ven_distributed_by_code IN NUMBER
)
RETURN VARCHAR2;


FUNCTION FIND_NEXT_DELIVERY_DATE_FUNC(
  p_vpd_prd_code       IN  vendor_products.vpd_prd_code%TYPE,
  p_whs_delivery_code  IN  warehouses.whs_code%TYPE,
  p_ven_code           OUT vendors.ven_code%TYPE,
  p_starting_from      IN  DATE DEFAULT SYSDATE
)
RETURN DATE;

------------------------------------------------------------------------------

END VPD_PACK;
/