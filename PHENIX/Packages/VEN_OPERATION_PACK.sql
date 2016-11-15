CREATE OR REPLACE PACKAGE phenix.VEN_OPERATION_PACK IS

FUNCTION LOCK_VEN_FUNC(
  p_ven_code  IN vendors.ven_code%TYPE
)
RETURN BOOLEAN;

--CVI2821
FUNCTION FIND_VEN_FROM_OAGR_FUNC(
  p_oagr_identifier   IN VARCHAR2,
  p_ven_oagr_marking  IN VARCHAR2 --BEA116
)
RETURN NUMBER;

PROCEDURE UPDATE_VEN_OAGR_REBILLED_PROC(
  p_ven_code  IN vendors.ven_code%TYPE
);

PROCEDURE SET_VEN_PAYABLE_PROC(
  p_ven_code             IN vendors.ven_code%TYPE,
  p_ven_ven_payable_code IN vendors.ven_ven_payable_code%TYPE
);

PROCEDURE SET_VEN_PICKUP_PROC(
  p_ven_code             IN vendors.ven_code%TYPE,
  p_ven_ven_pickup_code  IN vendors.ven_ven_pickup_code%TYPE
);

FUNCTION COUNT_VEN_PICKUP_FUNC(
  p_ven_ven_pickup_code IN vendors.ven_ven_pickup_code%TYPE
)
RETURN NUMBER;

FUNCTION COUNT_VEN_PAYABLE_FUNC(
  p_ven_ven_payable_code IN vendors.ven_ven_payable_code%TYPE
)
RETURN NUMBER;

FUNCTION COUNT_VEN_ASSOCIATION_FUNC(
  p_ven_ven_association_code IN vendors.ven_ven_association_code%TYPE
)
RETURN NUMBER;

FUNCTION COUNT_PAYABLE_AND_PICKUP_FUNC(
  p_ven_code IN vendors.ven_code%TYPE
)
RETURN NUMBER;

PROCEDURE PURGE_PROC(
  p_ven_code    IN vendors.ven_code%TYPE,
  p_from_screen IN BOOLEAN DEFAULT FALSE
);

PROCEDURE PURGE_PROC(
  p_nb_days_to_keep IN NUMBER,
  p_max_items       IN NUMBER
);

--csc8489
FUNCTION UPDATE_ASSOC_ADMIN_FUNC(
  p_initial_ven_code      IN NUMBER,
  p_ven_association_code  IN NUMBER,
  p_old_admin_percent     IN NUMBER,
  p_new_admin_percent     IN NUMBER,
  p_nb_ven_modified       OUT NUMBER
)
RETURN BOOLEAN;

FUNCTION DO_VEN_EXISTS_FOR_CAT_FUNC(
   p_cat_code IN categories.cat_code%TYPE
 )
 RETURN NUMBER;

END VEN_OPERATION_PACK;
/