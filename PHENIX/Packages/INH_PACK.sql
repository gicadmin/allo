CREATE OR REPLACE PACKAGE phenix.INH_PACK AS

FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  invoice_headers%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_inh_id                         IN         invoice_headers.inh_id%TYPE,
  p_inh_rec                        OUT NOCOPY invoice_headers%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_inh_id                         IN         invoice_headers.inh_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_inh_id                         IN         invoice_headers.inh_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_inh_id                         IN         invoice_headers.inh_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_inh_id                         IN         invoice_headers.inh_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_inh_id                         IN         invoice_headers.inh_id%TYPE);


FUNCTION INSERT_FUNC(
  p_inh_type                   IN         invoice_headers.inh_type%TYPE,
  p_inh_delivery_charge        IN         invoice_headers.inh_delivery_charge%TYPE,
  p_inh_federal_tax_total      IN         invoice_headers.inh_federal_tax_total%TYPE,
  p_inh_invoice_date           IN         invoice_headers.inh_invoice_date%TYPE,
  p_inh_package_total          IN         invoice_headers.inh_package_total%TYPE,
  p_inh_ticket_charges         IN         invoice_headers.inh_ticket_charges%TYPE,
  p_inh_cost_price_total       IN         invoice_headers.inh_cost_price_total%TYPE,
  p_inh_print_switch           IN         invoice_headers.inh_print_switch%TYPE,
  p_inh_provincial_tax_total   IN         invoice_headers.inh_provincial_tax_total%TYPE,
  p_inh_sale_price_total       IN         invoice_headers.inh_sale_price_total%TYPE,
  p_inh_cus_code               IN         invoice_headers.inh_cus_code%TYPE                    DEFAULT NULL,
  p_inh_use_code               IN         invoice_headers.inh_use_code%TYPE                    DEFAULT NULL,
  p_inh_bank_cash_date         IN         invoice_headers.inh_bank_cash_date%TYPE              DEFAULT NULL,
  p_inh_cigarette_shipped      IN         invoice_headers.inh_cigarette_shipped%TYPE           DEFAULT NULL,
  p_inh_reference_number       IN         invoice_headers.inh_reference_number%TYPE            DEFAULT NULL,
  p_inh_ven_code               IN         invoice_headers.inh_ven_code%TYPE                    DEFAULT NULL,
  p_inh_route_date             IN         invoice_headers.inh_route_date%TYPE                  DEFAULT NULL,
  p_inh_cus_invoiced_code      IN         invoice_headers.inh_cus_invoiced_code%TYPE           DEFAULT NULL,
  p_inh_ven_invoice_for_code   IN         invoice_headers.inh_ven_invoice_for_code%TYPE        DEFAULT NULL,
  p_inh_asc_id                 IN         invoice_headers.inh_asc_id%TYPE                      DEFAULT NULL,
  p_inh_tty_code               IN         invoice_headers.inh_tty_code%TYPE                    DEFAULT NULL,
  p_inh_rct_code               IN         invoice_headers.inh_rct_code%TYPE                    DEFAULT NULL,
  p_inh_message                IN         invoice_headers.inh_message%TYPE                     DEFAULT NULL,
  p_inh_rcl_id                 IN         invoice_headers.inh_rcl_id%TYPE                      DEFAULT NULL,
  p_inh_surcharge_amount       IN         invoice_headers.inh_surcharge_amount%TYPE            DEFAULT NULL,
  p_inh_stats_calculated_date  IN         invoice_headers.inh_stats_calculated_date%TYPE       DEFAULT NULL,
  p_inh_crdh_id                IN         invoice_headers.inh_crdh_id%TYPE                     DEFAULT NULL,
  p_inh_cash_and_carry_switch  IN         invoice_headers.inh_cash_and_carry_switch%TYPE       DEFAULT 0 ,
  p_inh_offinv_vol_reb_percent IN         invoice_headers.inh_offinv_vol_reb_percent%TYPE      DEFAULT 0 ,
  p_inh_offinv_vol_reb_amount  IN         invoice_headers.inh_offinv_vol_reb_amount%TYPE       DEFAULT 0 ,
  p_inh_archived_date          IN         invoice_headers.inh_archived_date%TYPE               DEFAULT NULL,
  p_inh_creation_date          IN         invoice_headers.inh_creation_date%TYPE               DEFAULT sysdate ,
  p_inh_provincial_tax_rate    IN         invoice_headers.inh_provincial_tax_rate%TYPE         DEFAULT 0 ,
  p_inh_federal_tax_rate       IN         invoice_headers.inh_federal_tax_rate%TYPE            DEFAULT 0 ,
  p_inh_compounded_tax_switch  IN         invoice_headers.inh_compounded_tax_switch%TYPE       DEFAULT 0 ,
  p_inh_bf_flip_switch         IN         invoice_headers.inh_bf_flip_switch%TYPE              DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY invoice_headers%ROWTYPE)
RETURN NUMBER;
------------------ a ne plus utiliser les fonctions et procédures en bas ---------------------

FUNCTION GET_INH_ID_FUNC(
	p_called_from IN VARCHAR2
)
RETURN NUMBER;

FUNCTION GET_FULL_INH_FUNC(
	p_inh_id 			IN invoice_headers.inh_id%TYPE,
	p_inh_record	OUT invoice_headers%ROWTYPE
)
RETURN BOOLEAN;

PROCEDURE INSERT_INH_PROC(
	p_inh_id                      IN invoice_headers.inh_id%TYPE,
	p_inh_type                    IN invoice_headers.inh_type%TYPE,
	p_inh_invoice_date            IN invoice_headers.inh_invoice_date%TYPE,
	p_inh_cus_code                IN invoice_headers.inh_cus_code%TYPE,
	p_inh_cus_invoiced_code       IN invoice_headers.inh_cus_invoiced_code%TYPE,
	p_inh_ven_invoice_for_code    IN invoice_headers.inh_ven_invoice_for_code%TYPE,
	p_inh_ven_code                IN invoice_headers.inh_ven_code%TYPE,
	p_inh_asc_id                  IN invoice_headers.inh_asc_id%TYPE,
	p_inh_tty_code                IN invoice_headers.inh_tty_code%TYPE,
	p_inh_rct_code                IN invoice_headers.inh_rct_code%TYPE,
	p_inh_rcl_id                  IN invoice_headers.inh_rcl_id%TYPE,
	p_inh_use_code                IN invoice_headers.inh_use_code%TYPE,
	p_inh_reference_number        IN invoice_headers.inh_reference_number%TYPE,
	p_inh_message                 IN invoice_headers.inh_message%TYPE,
	p_inh_surcharge_amount        IN invoice_headers.inh_surcharge_amount%TYPE,
	p_inh_print_switch            IN invoice_headers.inh_print_switch%TYPE					  DEFAULT 0,
	p_inh_cash_and_carry_switch   IN invoice_headers.inh_cash_and_carry_switch%TYPE	  DEFAULT 0,
	p_inh_bank_cash_date          IN invoice_headers.inh_bank_cash_date%TYPE				  DEFAULT NULL,
	p_inh_cigarette_shipped       IN invoice_headers.inh_cigarette_shipped%TYPE			  DEFAULT NULL,
	p_inh_delivery_charge         IN invoice_headers.inh_delivery_charge%TYPE				  DEFAULT 0,
	p_inh_federal_tax_total       IN invoice_headers.inh_federal_tax_total%TYPE			  DEFAULT 0,
	p_inh_package_total           IN invoice_headers.inh_package_total%TYPE					  DEFAULT 0,
	p_inh_ticket_charges          IN invoice_headers.inh_ticket_charges%TYPE				  DEFAULT 0,
	p_inh_cost_price_total        IN invoice_headers.inh_cost_price_total%TYPE			  DEFAULT 0,
	p_inh_provincial_tax_total    IN invoice_headers.inh_provincial_tax_total%TYPE	  DEFAULT 0,
	p_inh_sale_price_total        IN invoice_headers.inh_sale_price_total%TYPE			  DEFAULT 0,
	p_inh_route_date              IN invoice_headers.inh_route_date%TYPE						  DEFAULT NULL,
  p_inh_offinv_vol_reb_percent  IN invoice_headers.inh_offinv_vol_reb_percent%TYPE  DEFAULT 0,
  p_inh_offinv_vol_reb_amount   IN invoice_headers.inh_offinv_vol_reb_amount%TYPE   DEFAULT 0
);

FUNCTION LOCK_INH_FUNC(
	p_inh_id 			IN invoice_headers.inh_id%TYPE
)
RETURN BOOLEAN;

--valide si le rct_code est utilisé dans la table INH
FUNCTION RCT_IS_USED_ON_INH_FUNC(
	p_rct_code IN retail_client_types.rct_code%TYPE
)
RETURN BOOLEAN;	--retourne TRUE si le code est utilisé..

--valide si le rcl_code est utilisé dans la table INH
FUNCTION RCL_IS_USED_ON_INH_FUNC(
	p_rcl_id IN retail_clients.rcl_id%TYPE
)
RETURN BOOLEAN;	--retourne TRUE si le code est utilisé..

END INH_PACK;
/