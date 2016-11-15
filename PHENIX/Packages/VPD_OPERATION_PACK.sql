CREATE OR REPLACE PACKAGE phenix.VPD_OPERATION_PACK IS

FUNCTION VPD_MANUFACTURER_INFO_FUNC(
  p_vpd_prd_code IN vendor_products.vpd_prd_code%TYPE,
  p_vpd_rec      OUT NOCOPY vendor_products%ROWTYPE
) RETURN BOOLEAN;

FUNCTION GET_FULL_FUNC(
  p_vpd_prd_code                   IN         vendor_products.vpd_prd_code%TYPE,
  p_vpd_ven_distributed_by_code    IN         vendor_products.vpd_ven_distributed_by_code%TYPE,
  p_vpd_rec                        OUT NOCOPY vendor_products%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_PURCH_FMT_FUNC(
  p_vpd_prd_code                   IN         vendor_products.vpd_prd_code%TYPE,
  p_vpd_ven_distributed_by_code    IN         vendor_products.vpd_ven_distributed_by_code%TYPE
  )
RETURN VARCHAR2;

FUNCTION FIND_NEXT_DELIVERY_DATE_FUNC(
  p_vpd_prd_code       IN  vendor_products.vpd_prd_code%TYPE,
  p_whs_delivery_code  IN  warehouses.whs_code%TYPE,
  p_ven_code           OUT vendors.ven_code%TYPE,
  p_starting_from      IN  DATE DEFAULT SYSDATE
)
RETURN DATE;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_vpd_prd_code                 IN  vendor_products.vpd_prd_code%TYPE,
  p_vpd_ven_distributed_by_code  IN  vendor_products.vpd_ven_distributed_by_code%TYPE,
  p_column_name                  IN  VARCHAR2,
  p_raise                        IN  BOOLEAN  DEFAULT TRUE
)
RETURN VARCHAR2;

PROCEDURE PURGE_PROC(
  p_vpd_prd_code     IN vendor_products.vpd_prd_code%TYPE,
  p_vpd_prf_fmt_code IN vendor_products.vpd_prf_fmt_code%TYPE
);

PROCEDURE PURGE_PROC(
  p_vpd_prd_code IN vendor_products.vpd_prd_code%TYPE
);

PROCEDURE SET_PRODUCT_STATUS_PROC(
  p_vpd_prd_code      IN vendor_products.vpd_prd_code%TYPE,
  p_vpd_active_switch IN vendor_products.vpd_active_switch%TYPE
);

PROCEDURE SET_PRODUCT_STATUS_PROC(
  p_vpd_ven_distributed_by_code IN vendor_products.vpd_ven_distributed_by_code%TYPE,
  p_vpd_active_switch           IN vendor_products.vpd_active_switch%TYPE
);

FUNCTION ALLOW_DELETE_VPD_FUNC(
  p_vpd_prd_code                 IN vendor_products.vpd_prd_code%TYPE,
  p_vpd_ven_distributed_by_code  IN vendor_products.vpd_ven_distributed_by_code%TYPE,
  p_vpd_ven_manufactured_by_code IN vendor_products.vpd_ven_manufactured_by_code%TYPE
)
RETURN BOOLEAN;

FUNCTION DISMATCH_START_FUNC(
  p_vpd_code      IN  vendor_products.vpd_code%TYPE,
  p_vpd_ven_code  IN  vendor_products.vpd_ven_distributed_by_code%TYPE,
  p_prd_code      OUT products.prd_code%TYPE,
  p_prd_ven_code  OUT products.prd_ven_code%TYPE,
  p_prd_status    OUT products.prd_status%TYPE,
  p_multi_vendor  OUT BOOLEAN
)
RETURN BOOLEAN;

FUNCTION REMATCH_START_FUNC(
  p_vpd_code                IN  vendor_products.vpd_code%TYPE,
  p_vpd_ven_code            IN  vendor_products.vpd_ven_distributed_by_code%TYPE,
  p_vpd_active_switch       OUT vendor_products.vpd_active_switch%TYPE,
  p_prd_code                OUT products.prd_code%TYPE,
  p_prd_ven_code            OUT products.prd_ven_code%TYPE,
  p_prd_status              OUT products.prd_status%TYPE,
  p_prd_multi_vendor_switch OUT products.prd_multi_vendor_switch%TYPE,
  p_prd_broker_switch       OUT products.prd_broker_switch%TYPE
)
RETURN BOOLEAN;

FUNCTION IS_UPDATE_PRODUCT_REMATCH_FUNC(
  p_vpd_prd_code                IN  vendor_products.vpd_prd_code%TYPE,
  p_vpd_ven_code                IN  vendor_products.vpd_ven_distributed_by_code%TYPE,
  p_old_vpd_active_switch       IN  vendor_products.vpd_active_switch%TYPE,
  p_new_vpd_active_switch       IN  vendor_products.vpd_active_switch%TYPE,
  p_ctr_broker_vendor_id        IN  control.ctr_broker_vendor_id%TYPE,
  p_prd_status                  IN  products.prd_status%TYPE,
  p_prd_ven_code                IN  products.prd_ven_code%TYPE,
  p_prd_multi_vendor_switch     IN  products.prd_multi_vendor_switch%TYPE,
  p_new_prd_multi_vendor_switch OUT products.prd_multi_vendor_switch%TYPE,
  p_new_prd_broker_switch       OUT products.prd_broker_switch%TYPE
)
RETURN BOOLEAN;

FUNCTION COUNT_MULTI_VEN_FUNC(
  p_vpd_prd_code                IN vendor_products.vpd_prd_code%TYPE,
  p_vpd_ven_distributed_by_code IN vendor_products.vpd_ven_distributed_by_code%TYPE
)
RETURN NUMBER;

FUNCTION LOCK_VPD_FOR_MANUFACTURER_PROC(
  p_vpd_prd_code IN vendor_products.vpd_prd_code%TYPE,
  p_vpd_code     IN vendor_products.vpd_code%TYPE
)
RETURN BOOLEAN;

PROCEDURE SET_MANUFACTURER_CODE_PROC(
  p_vpd_prd_code IN vendor_products.vpd_prd_code%TYPE,
  p_vpd_code     IN vendor_products.vpd_code%TYPE
);

FUNCTION GET_MANUFACTURER_FUNC(
  p_vpd_code              IN vendor_products.vpd_code%TYPE,
  p_vpd_ven_code          IN vendor_products.vpd_ven_distributed_by_code%TYPE,
  p_vpd_prd_code          IN vendor_products.vpd_prd_code%TYPE,
  p_prd_ven_code          IN products.prd_ven_code%TYPE,
  p_vpd_manufacturer_code IN vendor_products.vpd_code%TYPE
)
RETURN VARCHAR2;

FUNCTION EXISTS_CHILD_FUNC(
  p_vpd_code                    IN vendor_products.vpd_code%TYPE,
  p_vpd_prd_code                IN vendor_products.vpd_prd_code%TYPE,
  p_vpd_ven_distributed_by_code IN vendor_products.vpd_ven_distributed_by_code%TYPE
)
RETURN BOOLEAN;

FUNCTION LOCK_CHILD_FUNC(
  p_vpd_code                    IN vendor_products.vpd_code%TYPE,
  p_vpd_prd_code                IN vendor_products.vpd_prd_code%TYPE,
  p_vpd_ven_distributed_by_code IN vendor_products.vpd_ven_distributed_by_code%TYPE
)
RETURN VARCHAR2;

PROCEDURE PURGE_CHILD_PROC(
  p_vpd_code                    IN vendor_products.vpd_code%TYPE,
  p_vpd_prd_code                IN vendor_products.vpd_prd_code%TYPE,
  p_vpd_ven_distributed_by_code IN vendor_products.vpd_ven_distributed_by_code%TYPE
);

PROCEDURE PURGE_PROC(
  p_vpd_ven_distributed_by_code IN vendor_products.vpd_ven_distributed_by_code%TYPE
);

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_vpd_prd_code                 IN  vendor_products.vpd_prd_code%TYPE,
  p_vpd_ven_distributed_by_code  IN  vendor_products.vpd_ven_distributed_by_code%TYPE,
  p_column_name                  IN  VARCHAR2,
  p_raise                        IN  BOOLEAN DEFAULT TRUE
)
RETURN NUMBER;

END VPD_OPERATION_PACK;
/