CREATE OR REPLACE PACKAGE phenix.CAH_OPERATION_PACK IS

PROCEDURE PURGE_PROC(
    p_cah_id                    IN customer_adjustment_headers.cah_id%TYPE,
    p_cah_rth_id                IN customer_adjustment_headers.cah_rth_id%TYPE
);

PROCEDURE PURGE_PROC(
    p_nb_days_to_keep               IN NUMBER,
    p_max_items                     IN NUMBER
);

FUNCTION GET_CAH_CUS_FUNC(
  p_cah_rth_id    IN  customer_adjustment_headers.cah_id%TYPE,
  p_cah_cus_code  OUT customer_adjustment_headers.cah_cus_code%TYPE,
  p_cus_name      OUT customers.cus_name%TYPE,
  p_lang          IN  VARCHAR2 DEFAULT 'F'
)RETURN BOOLEAN;

FUNCTION IS_AN_RMA_FUNC(
  p_cah_rth_id  IN customer_adjustment_headers.cah_rth_id%TYPE
) RETURN BOOLEAN;

PROCEDURE UPDATE_CAH_STATUS_PROC(
  p_inh_id  IN invoice_headers.inh_id%TYPE,
  p_cah_id  IN customer_adjustment_headers.cah_id%TYPE
);

--bea228 trouver un CAH_REF relié à une facture
FUNCTION FIND_CAH_REF_FROM_INH_FUNC(
  p_inh_id IN NUMBER
)
RETURN VARCHAR2;

END CAH_OPERATION_PACK;
/