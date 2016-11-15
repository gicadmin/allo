CREATE OR REPLACE PACKAGE phenix.COT_PACK IS

PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  customer_order_transactions%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_cot_cod_coh_id                 IN         customer_order_transactions.cot_cod_coh_id%TYPE,
  p_cot_cod_line_number            IN         customer_order_transactions.cot_cod_line_number%TYPE,
  p_cot_line_number                IN         customer_order_transactions.cot_line_number%TYPE,
  p_cot_rec                        OUT NOCOPY customer_order_transactions%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_cot_cod_coh_id                 IN         customer_order_transactions.cot_cod_coh_id%TYPE,
  p_cot_cod_line_number            IN         customer_order_transactions.cot_cod_line_number%TYPE,
  p_cot_line_number                IN         customer_order_transactions.cot_line_number%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_cot_cod_coh_id                 IN         customer_order_transactions.cot_cod_coh_id%TYPE,
  p_cot_cod_line_number            IN         customer_order_transactions.cot_cod_line_number%TYPE,
  p_cot_line_number                IN         customer_order_transactions.cot_line_number%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_cot_cod_coh_id                 IN         customer_order_transactions.cot_cod_coh_id%TYPE,
  p_cot_cod_line_number            IN         customer_order_transactions.cot_cod_line_number%TYPE,
  p_cot_line_number                IN         customer_order_transactions.cot_line_number%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_cot_cod_coh_id                 IN         customer_order_transactions.cot_cod_coh_id%TYPE,
  p_cot_cod_line_number            IN         customer_order_transactions.cot_cod_line_number%TYPE,
  p_cot_line_number                IN         customer_order_transactions.cot_line_number%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_cot_cod_coh_id                 IN         customer_order_transactions.cot_cod_coh_id%TYPE,
  p_cot_cod_line_number            IN         customer_order_transactions.cot_cod_line_number%TYPE,
  p_cot_line_number                IN         customer_order_transactions.cot_line_number%TYPE);


PROCEDURE INSERT_PROC(
  p_cot_cod_coh_id             IN         customer_order_transactions.cot_cod_coh_id%TYPE,
  p_cot_cod_line_number        IN         customer_order_transactions.cot_cod_line_number%TYPE,
  p_cot_line_number            IN         customer_order_transactions.cot_line_number%TYPE,
  p_cot_delivery_date          IN         customer_order_transactions.cot_delivery_date%TYPE,
  p_cot_federal_tax_rate       IN         customer_order_transactions.cot_federal_tax_rate%TYPE,
  p_cot_line_type              IN         customer_order_transactions.cot_line_type%TYPE,
  p_cot_provincial_tax_rate    IN         customer_order_transactions.cot_provincial_tax_rate%TYPE,
  p_cot_spiff_amount           IN         customer_order_transactions.cot_spiff_amount%TYPE,
  p_cot_inh_id                 IN         customer_order_transactions.cot_inh_id%TYPE                      DEFAULT NULL,
  p_cot_plh_id                 IN         customer_order_transactions.cot_plh_id%TYPE                      DEFAULT NULL,
  p_cot_invoice_line_number    IN         customer_order_transactions.cot_invoice_line_number%TYPE         DEFAULT NULL,
  p_cot_invoice_quantity       IN         customer_order_transactions.cot_invoice_quantity%TYPE            DEFAULT NULL,
  p_cot_invoice_weight         IN         customer_order_transactions.cot_invoice_weight%TYPE              DEFAULT NULL,
  p_cot_pick_line_number       IN         customer_order_transactions.cot_pick_line_number%TYPE            DEFAULT NULL,
  p_cot_pick_quantity          IN         customer_order_transactions.cot_pick_quantity%TYPE               DEFAULT NULL,
  p_cot_pick_weight            IN         customer_order_transactions.cot_pick_weight%TYPE                 DEFAULT NULL,
  p_cot_car_inh_id             IN         customer_order_transactions.cot_car_inh_id%TYPE                  DEFAULT NULL,
  p_cot_freegood_inh_id        IN         customer_order_transactions.cot_freegood_inh_id%TYPE             DEFAULT NULL,
  p_cot_invoiced_ext_price     IN         customer_order_transactions.cot_invoiced_ext_price%TYPE          DEFAULT 0 ,
  p_cot_reconciliations_date   IN         customer_order_transactions.cot_reconciliations_date%TYPE        DEFAULT NULL,
  p_cot_use_code               IN         customer_order_transactions.cot_use_code%TYPE                    DEFAULT NULL,
  p_cot_admin_surcharge_amount IN         customer_order_transactions.cot_admin_surcharge_amount%TYPE      DEFAULT 0 ,
  p_cot_invoiced_ext_surcharge IN         customer_order_transactions.cot_invoiced_ext_surcharge%TYPE      DEFAULT 0 );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY customer_order_transactions%ROWTYPE);

-----------------------------------------------------------------------------------------------
-- Ajuster les fonctions / procédures ci-dessous afin de ne plus les utiliser au fil du temps
-- Les fonctions ci-haut doivent être considérées à la place
-- Déplacer les traitements dans un package OPERATION au besoin
-----------------------------------------------------------------------------------------------

FUNCTION FIND_MAX_COT_LINE_FUNC(
	p_cot_cod_coh_id 			IN NUMBER,
	p_cot_cod_line_number IN NUMBER
)
RETURN NUMBER;

PROCEDURE INSERT_COT_PROC(
	p_cot_cod_coh_id         	IN customer_order_transactions.cot_cod_coh_id%TYPE,
	p_cot_cod_line_number    	IN customer_order_transactions.cot_cod_line_number%TYPE,
	p_cot_line_number        	IN customer_order_transactions.cot_line_number%TYPE,
	p_cot_delivery_date      	IN customer_order_transactions.cot_delivery_date%TYPE,
	p_cot_line_type          	IN customer_order_transactions.cot_line_type%TYPE,
	p_cot_plh_id             	IN customer_order_transactions.cot_plh_id%TYPE,
	p_cot_pick_line_number   	IN customer_order_transactions.cot_pick_line_number%TYPE,
	p_cot_pick_quantity      	IN customer_order_transactions.cot_pick_quantity%TYPE,
	p_cot_pick_weight        	IN customer_order_transactions.cot_pick_weight%TYPE,
	p_cot_inh_id             	IN customer_order_transactions.cot_inh_id%TYPE								DEFAULT NULL,
	p_cot_invoice_line_number	IN customer_order_transactions.cot_invoice_line_number%TYPE		DEFAULT NULL,
	p_cot_invoice_quantity   	IN customer_order_transactions.cot_invoice_quantity%TYPE			DEFAULT NULL,
	p_cot_invoice_weight     	IN customer_order_transactions.cot_invoice_weight%TYPE				DEFAULT NULL,
	p_cot_federal_tax_rate   	IN customer_order_transactions.cot_federal_tax_rate%TYPE			DEFAULT 0,
	p_cot_provincial_tax_rate	IN customer_order_transactions.cot_provincial_tax_rate%TYPE		DEFAULT 0,
	p_cot_spiff_amount       	IN customer_order_transactions.cot_spiff_amount%TYPE					DEFAULT 0,
	p_cot_car_inh_id         	IN customer_order_transactions.cot_car_inh_id%TYPE						DEFAULT NULL,
  p_cot_invoiced_ext_price  IN customer_order_transactions.cot_invoiced_ext_price%TYPE    DEFAULT 0
);

END COT_PACK;
/