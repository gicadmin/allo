CREATE OR REPLACE PACKAGE phenix.RCH_OPERATION_PACK IS

PROCEDURE PURGE_PROC(
   p_rch_ven_code  IN receipt_headers.rch_ven_code%TYPE,
   p_rch_number    IN receipt_headers.rch_number%TYPE,
   p_rch_source    IN receipt_headers.rch_source%TYPE
);

FUNCTION DOES_RCH_ALREADY_EXISTS_FUNC(
	p_reference_number 	IN VARCHAR2,
	p_ven_code					IN NUMBER,
	p_source						IN VARCHAR2,
  p_on_error_only_switch  IN NUMBER DEFAULT 0
)
RETURN BOOLEAN;

--USG989 création de la fonction
FUNCTION LOCK_SPECIFIC_RCH_FUNC(
  p_rch_number    IN receipt_headers.rch_number%TYPE,
  p_rch_ven_code  IN receipt_headers.rch_ven_code%TYPE,
  p_rch_source    IN receipt_headers.rch_source%TYPE
)
RETURN BOOLEAN;

--USG989 création de la fonction
PROCEDURE DELETE_RCH_AND_DETAILS_PROC(
  p_rch_number    IN receipt_headers.rch_number%TYPE,
  p_rch_ven_code  IN receipt_headers.rch_ven_code%TYPE,
  p_rch_source    IN receipt_headers.rch_source%TYPE
);

PROCEDURE GET_RCH_VEN_PROC(
  p_rch_rth_id    IN  receipt_headers.rch_rth_id%TYPE,
  p_ven_name      OUT vendors.ven_name%TYPE,
  p_rch_ven_code  OUT receipt_headers.rch_ven_code%TYPE,
  p_ven_use_code  OUT vendors.ven_use_code%TYPE,
  p_use_name      OUT VARCHAR2,
  p_lang          IN  VARCHAR2 DEFAULT 'F'
);

FUNCTION GET_ASN_LINKED_FUNC(
  p_rch_rth_id  IN receipt_headers.rch_rth_id%TYPE,
  p_lang        IN VARCHAR2 DEFAULT 'F'
)RETURN VARCHAR2;

FUNCTION GET_RMA_LINKED_FUNC(
  p_cah_rth_id  IN customer_adjustment_headers.cah_rth_id%TYPE ,
  p_lang        IN VARCHAR2 DEFAULT 'F'
)RETURN VARCHAR2;

FUNCTION COUNT_TO_INVOICE_FUNC
RETURN NUMBER;

FUNCTION COUNT_WITHOUT_MAH_FUNC
RETURN NUMBER;

PROCEDURE CLOSE_RECEPTION_PROC(
  p_rch_number   IN receipt_headers.rch_number%TYPE,
  p_rch_ven_code IN receipt_headers.rch_ven_code%TYPE,
  p_rch_source   IN receipt_headers.rch_source%TYPE
);

END RCH_OPERATION_PACK;
/