CREATE OR REPLACE PACKAGE phenix.VWH_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  vendor_warehouses%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_vwh_ven_code                   IN         vendor_warehouses.vwh_ven_code%TYPE,
  p_vwh_whs_code                   IN         vendor_warehouses.vwh_whs_code%TYPE,
  p_vwh_rec                        OUT NOCOPY vendor_warehouses%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_vwh_ven_code                   IN         vendor_warehouses.vwh_ven_code%TYPE,
  p_vwh_whs_code                   IN         vendor_warehouses.vwh_whs_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_vwh_ven_code                   IN         vendor_warehouses.vwh_ven_code%TYPE,
  p_vwh_whs_code                   IN         vendor_warehouses.vwh_whs_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_vwh_ven_code                   IN         vendor_warehouses.vwh_ven_code%TYPE,
  p_vwh_whs_code                   IN         vendor_warehouses.vwh_whs_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_vwh_ven_code                   IN         vendor_warehouses.vwh_ven_code%TYPE,
  p_vwh_whs_code                   IN         vendor_warehouses.vwh_whs_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_vwh_ven_code                   IN         vendor_warehouses.vwh_ven_code%TYPE,
  p_vwh_whs_code                   IN         vendor_warehouses.vwh_whs_code%TYPE);


PROCEDURE INSERT_PROC(
  p_vwh_ven_code                 IN         vendor_warehouses.vwh_ven_code%TYPE,
  p_vwh_whs_code                 IN         vendor_warehouses.vwh_whs_code%TYPE,
  p_vwh_caps_last_verified       IN         vendor_warehouses.vwh_caps_last_verified%TYPE            DEFAULT NULL,
  p_vwh_caps_tch_locking_id      IN         vendor_warehouses.vwh_caps_tch_locking_id%TYPE           DEFAULT NULL,
  p_vwh_rou_code                 IN         vendor_warehouses.vwh_rou_code%TYPE                      DEFAULT NULL,
  p_vwh_rou_position             IN         vendor_warehouses.vwh_rou_position%TYPE                  DEFAULT NULL,
  p_vwh_round_per_pallet_percent IN         vendor_warehouses.vwh_round_per_pallet_percent%TYPE      DEFAULT NULL,
  p_vwh_round_per_row_percent    IN         vendor_warehouses.vwh_round_per_row_percent%TYPE         DEFAULT NULL,
  p_vwh_replenish_nb_of_week     IN         vendor_warehouses.vwh_replenish_nb_of_week%TYPE          DEFAULT NULL,
  p_vwh_transport_days           IN         vendor_warehouses.vwh_transport_days%TYPE                DEFAULT NULL,
  p_vwh_ship_days                IN         vendor_warehouses.vwh_ship_days%TYPE                     DEFAULT 0 ,
  p_vwh_caps_processing_switch   IN         vendor_warehouses.vwh_caps_processing_switch%TYPE        DEFAULT 0 ,
  p_vwh_add_transport_switch     IN         vendor_warehouses.vwh_add_transport_switch%TYPE          DEFAULT 0 ,
  p_vwh_pickup_switch            IN         vendor_warehouses.vwh_pickup_switch%TYPE                 DEFAULT 0 ,
  p_vwh_avail_in_inventory_days  IN         vendor_warehouses.vwh_avail_in_inventory_days%TYPE       DEFAULT 0 );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY vendor_warehouses%ROWTYPE);

-----------------------------------------------------------------------------------------------
-- Ajuster les fonctions / procédures ci-dessous afin de ne plus les utiliser au fil du temps
-- Les fonctions ci-haut doivent être considérées à la place
-- Déplacer les traitements dans un package OPERATION au besoin
-----------------------------------------------------------------------------------------------

-- Détermine si le fournisseur veut appliquer le montant de transport pour cet entrepôt et  Retourne le montant de transport du produit pour l'entrepot
FUNCTION GET_ADDED_TRANSP_FOR_VWH
( p_ven_code       IN NUMBER,
  p_whs_code       IN VARCHAR2,
  p_prd_code       IN VARCHAR2
) RETURN NUMBER;

FUNCTION FIND_COLUMN_VALUE_NUMBER_FUNC(
  p_column_name  IN  VARCHAR2,
  p_vwh_ven_code  IN  vendor_warehouses.vwh_ven_code%TYPE,
  p_vwh_whs_code  IN  vendor_warehouses.vwh_whs_code%TYPE
)
RETURN NUMBER;

END VWH_PACK;
/