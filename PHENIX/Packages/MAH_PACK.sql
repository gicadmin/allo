CREATE OR REPLACE PACKAGE phenix.MAH_PACK IS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  match_headers%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_mah_ap_invoice_number          IN         match_headers.mah_ap_invoice_number%TYPE,
  p_mah_rec                        OUT NOCOPY match_headers%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_mah_ap_invoice_number          IN         match_headers.mah_ap_invoice_number%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_mah_ap_invoice_number          IN         match_headers.mah_ap_invoice_number%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_mah_ap_invoice_number          IN         match_headers.mah_ap_invoice_number%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_mah_ap_invoice_number          IN         match_headers.mah_ap_invoice_number%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_mah_ap_invoice_number          IN         match_headers.mah_ap_invoice_number%TYPE);


FUNCTION INSERT_FUNC(
  p_mah_ven_code                 IN         match_headers.mah_ven_code%TYPE,
  p_mah_adjustment               IN         match_headers.mah_adjustment%TYPE,
  p_mah_date                     IN         match_headers.mah_date%TYPE,
  p_mah_lock_switch              IN         match_headers.mah_lock_switch%TYPE,
  p_mah_reference_number         IN         match_headers.mah_reference_number%TYPE,
  p_mah_source                   IN         match_headers.mah_source%TYPE,
  p_mah_status                   IN         match_headers.mah_status%TYPE,
  p_mah_transport_cost           IN         match_headers.mah_transport_cost%TYPE,
  p_mah_federal_tax_total        IN         match_headers.mah_federal_tax_total%TYPE,
  p_mah_provincial_tax_total     IN         match_headers.mah_provincial_tax_total%TYPE,
  p_mah_purchase_total           IN         match_headers.mah_purchase_total%TYPE,
  p_mah_whs_code                 IN         match_headers.mah_whs_code%TYPE,
  p_mah_terms                    IN         match_headers.mah_terms%TYPE                         DEFAULT NULL,
  p_mah_use_code                 IN         match_headers.mah_use_code%TYPE                      DEFAULT NULL,
  p_mah_message                  IN         match_headers.mah_message%TYPE                       DEFAULT NULL,
  p_mah_use_lock_code            IN         match_headers.mah_use_lock_code%TYPE                 DEFAULT NULL,
  p_mah_original_rebill_number   IN         match_headers.mah_original_rebill_number%TYPE        DEFAULT NULL,
  p_mah_indirect_delivery_switch IN         match_headers.mah_indirect_delivery_switch%TYPE      DEFAULT 0 ,
  p_mah_discount                 IN         match_headers.mah_discount%TYPE                      DEFAULT 0 ,
  p_mah_taxable_charge           IN         match_headers.mah_taxable_charge%TYPE                DEFAULT 0 ,
  p_mah_not_taxable_charge       IN         match_headers.mah_not_taxable_charge%TYPE            DEFAULT 0 )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY match_headers%ROWTYPE)
RETURN NUMBER;


FUNCTION GET_MAH_ID_FUNC RETURN NUMBER;

PROCEDURE INSERT_MAH_PROC(
	p_mah_ap_invoice_number     		IN match_headers.mah_ap_invoice_number%TYPE,
	p_mah_ven_code                	IN match_headers.mah_ven_code%TYPE,
	p_mah_adjustment              	IN match_headers.mah_adjustment%TYPE,
	p_mah_date                    	IN match_headers.mah_date%TYPE,
	p_mah_lock_switch             	IN match_headers.mah_lock_switch%TYPE,
	p_mah_reference_number        	IN match_headers.mah_reference_number%TYPE,
	p_mah_source                  	IN match_headers.mah_source%TYPE,
	p_mah_status                  	IN match_headers.mah_status%TYPE,
	p_mah_transport_cost          	IN match_headers.mah_transport_cost%TYPE,
	p_mah_federal_tax_total       	IN match_headers.mah_federal_tax_total%TYPE,
	p_mah_provincial_tax_total    	IN match_headers.mah_provincial_tax_total%TYPE,
	p_mah_purchase_total          	IN match_headers.mah_purchase_total%TYPE,
	p_mah_whs_code                	IN match_headers.mah_whs_code%TYPE,
	p_mah_terms                   	IN match_headers.mah_terms%TYPE											DEFAULT NULL,
	p_mah_message                 	IN match_headers.mah_message%TYPE										DEFAULT NULL,
	p_mah_use_code                	IN match_headers.mah_use_code%TYPE									DEFAULT NULL,
	p_mah_use_lock_code           	IN match_headers.mah_use_lock_code%TYPE							DEFAULT NULL,
	p_mah_original_rebill_number  	IN match_headers.mah_original_rebill_number%TYPE		DEFAULT NULL,
	p_mah_indirect_delivery_switch	IN match_headers.mah_indirect_delivery_switch%TYPE	DEFAULT 0
);

FUNCTION LOCK_MAH_FUNC(
	p_mah_ap_invoice_number  IN match_headers.mah_ap_invoice_number%TYPE
)
RETURN BOOLEAN;

PROCEDURE UPDATE_MAH_STATUS_PROC(
	p_mah_ap_invoice_number IN NUMBER,
	p_new_status						IN VARCHAR2
);

FUNCTION DOES_REF_ALREADY_EXISTS_FUNC(
	p_mah_reference_number 	IN VARCHAR2,
	p_ven_to_pay_code				IN NUMBER
)
RETURN BOOLEAN;

END MAH_PACK;
/