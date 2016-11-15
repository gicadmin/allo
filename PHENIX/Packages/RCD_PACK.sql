CREATE OR REPLACE PACKAGE phenix.RCD_PACK IS

FUNCTION GET_RCD_ID_FUNC RETURN NUMBER;

FUNCTION FIND_MAX_LINE_FUNC(
	p_rcd_rch_number 	IN VARCHAR2,
	p_rcd_ven_code		IN NUMBER,
	p_rcd_rch_source	IN VARCHAR2,
	p_palette_number	IN VARCHAR2
)
RETURN NUMBER;

PROCEDURE INSERT_RCD_PROC(
	p_rcd_id             					IN receipt_details.rcd_id%TYPE,
	p_rcd_rch_ven_code          	IN receipt_details.rcd_rch_ven_code%TYPE,
	p_rcd_rch_number            	IN receipt_details.rcd_rch_number%TYPE,
	p_rcd_rch_source            	IN receipt_details.rcd_rch_source%TYPE,
	p_rcd_pod_poh_id            	IN receipt_details.rcd_pod_poh_id%TYPE,
	p_rcd_pod_line_number       	IN receipt_details.rcd_pod_line_number%TYPE,
	p_rcd_line_number           	IN receipt_details.rcd_line_number%TYPE,
	p_rcd_palette_number        	IN receipt_details.rcd_palette_number%TYPE,
	p_rcd_shipment_quantity     	IN receipt_details.rcd_shipment_quantity%TYPE,
	p_rcd_shipment_weight       	IN receipt_details.rcd_shipment_weight%TYPE,
	p_rcd_mah_ap_invoice_number 	IN receipt_details.rcd_mah_ap_invoice_number%TYPE	DEFAULT NULL,
	p_rcd_use_code              	IN receipt_details.rcd_use_code%TYPE							DEFAULT NULL,
	p_rcd_date_closed           	IN receipt_details.rcd_date_closed%TYPE						DEFAULT NULL,
	p_rcd_date_confirmed        	IN receipt_details.rcd_date_confirmed%TYPE				DEFAULT NULL,
	p_rcd_received_quantity     	IN receipt_details.rcd_received_quantity%TYPE			DEFAULT NULL,
	p_rcd_received_weight       	IN receipt_details.rcd_received_weight%TYPE				DEFAULT NULL,
	p_rcd_recalc_status         	IN receipt_details.rcd_recalc_status%TYPE					DEFAULT NULL,
	p_rcd_quantity_cancelled    	IN receipt_details.rcd_quantity_cancelled%TYPE		DEFAULT NULL,
	p_rcd_weight_cancelled      	IN receipt_details.rcd_weight_cancelled%TYPE			DEFAULT NULL,
	p_rcd_cancelled_date        	IN receipt_details.rcd_cancelled_date%TYPE				DEFAULT NULL,
	p_rcd_expiry_date           	IN receipt_details.rcd_expiry_date%TYPE						DEFAULT NULL
);

PROCEDURE UPDATE_RCD_MAH_PROC(
	p_rcd_id 										IN receipt_details.rcd_id%TYPE,
	p_rcd_mah_ap_invoice_number IN receipt_details.rcd_mah_ap_invoice_number%TYPE
);

PROCEDURE UPDATE_RCD_MAH_BY_POD_PROC(
	p_pod_poh_id 								IN receipt_details.rcd_pod_poh_id%TYPE,
	p_pod_line_number						IN receipt_details.rcd_pod_line_number%TYPE,
	p_rcd_mah_ap_invoice_number IN receipt_details.rcd_mah_ap_invoice_number%TYPE
);


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  receipt_details%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_rcd_id                         IN         receipt_details.rcd_id%TYPE,
  p_rcd_rec                        OUT NOCOPY receipt_details%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_rcd_id                         IN         receipt_details.rcd_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_rcd_id                         IN         receipt_details.rcd_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_rcd_id                         IN         receipt_details.rcd_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_rcd_id                         IN         receipt_details.rcd_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_rcd_id                         IN         receipt_details.rcd_id%TYPE);

FUNCTION GET_FULL_FUNC(
  p_rcd_rch_ven_code               IN         receipt_details.rcd_rch_ven_code%TYPE,
  p_rcd_rch_number                 IN         receipt_details.rcd_rch_number%TYPE,
  p_rcd_rch_source                 IN         receipt_details.rcd_rch_source%TYPE,
  p_rcd_line_number                IN         receipt_details.rcd_line_number%TYPE,
  p_rcd_palette_number             IN         receipt_details.rcd_palette_number%TYPE,
  p_rcd_rec                        OUT NOCOPY receipt_details%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_rcd_rch_ven_code               IN         receipt_details.rcd_rch_ven_code%TYPE,
  p_rcd_rch_number                 IN         receipt_details.rcd_rch_number%TYPE,
  p_rcd_rch_source                 IN         receipt_details.rcd_rch_source%TYPE,
  p_rcd_line_number                IN         receipt_details.rcd_line_number%TYPE,
  p_rcd_palette_number             IN         receipt_details.rcd_palette_number%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_rcd_rch_ven_code               IN         receipt_details.rcd_rch_ven_code%TYPE,
  p_rcd_rch_number                 IN         receipt_details.rcd_rch_number%TYPE,
  p_rcd_rch_source                 IN         receipt_details.rcd_rch_source%TYPE,
  p_rcd_line_number                IN         receipt_details.rcd_line_number%TYPE,
  p_rcd_palette_number             IN         receipt_details.rcd_palette_number%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_rcd_rch_ven_code               IN         receipt_details.rcd_rch_ven_code%TYPE,
  p_rcd_rch_number                 IN         receipt_details.rcd_rch_number%TYPE,
  p_rcd_rch_source                 IN         receipt_details.rcd_rch_source%TYPE,
  p_rcd_line_number                IN         receipt_details.rcd_line_number%TYPE,
  p_rcd_palette_number             IN         receipt_details.rcd_palette_number%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_rcd_rch_ven_code               IN         receipt_details.rcd_rch_ven_code%TYPE,
  p_rcd_rch_number                 IN         receipt_details.rcd_rch_number%TYPE,
  p_rcd_rch_source                 IN         receipt_details.rcd_rch_source%TYPE,
  p_rcd_line_number                IN         receipt_details.rcd_line_number%TYPE,
  p_rcd_palette_number             IN         receipt_details.rcd_palette_number%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_rcd_rch_ven_code               IN         receipt_details.rcd_rch_ven_code%TYPE,
  p_rcd_rch_number                 IN         receipt_details.rcd_rch_number%TYPE,
  p_rcd_rch_source                 IN         receipt_details.rcd_rch_source%TYPE,
  p_rcd_line_number                IN         receipt_details.rcd_line_number%TYPE,
  p_rcd_palette_number             IN         receipt_details.rcd_palette_number%TYPE);


FUNCTION INSERT_FUNC(
  p_rcd_pod_poh_id            IN         receipt_details.rcd_pod_poh_id%TYPE,
  p_rcd_pod_line_number       IN         receipt_details.rcd_pod_line_number%TYPE,
  p_rcd_rch_ven_code          IN         receipt_details.rcd_rch_ven_code%TYPE,
  p_rcd_rch_number            IN         receipt_details.rcd_rch_number%TYPE,
  p_rcd_rch_source            IN         receipt_details.rcd_rch_source%TYPE,
  p_rcd_line_number           IN         receipt_details.rcd_line_number%TYPE,
  p_rcd_palette_number        IN         receipt_details.rcd_palette_number%TYPE,
  p_rcd_mah_ap_invoice_number IN         receipt_details.rcd_mah_ap_invoice_number%TYPE      DEFAULT NULL,
  p_rcd_date_closed           IN         receipt_details.rcd_date_closed%TYPE                DEFAULT NULL,
  p_rcd_received_quantity     IN         receipt_details.rcd_received_quantity%TYPE          DEFAULT NULL,
  p_rcd_received_weight       IN         receipt_details.rcd_received_weight%TYPE            DEFAULT NULL,
  p_rcd_shipment_quantity     IN         receipt_details.rcd_shipment_quantity%TYPE          DEFAULT NULL,
  p_rcd_shipment_weight       IN         receipt_details.rcd_shipment_weight%TYPE            DEFAULT NULL,
  p_rcd_date_confirmed        IN         receipt_details.rcd_date_confirmed%TYPE             DEFAULT NULL,
  p_rcd_recalc_status         IN         receipt_details.rcd_recalc_status%TYPE              DEFAULT NULL,
  p_rcd_expiry_date           IN         receipt_details.rcd_expiry_date%TYPE                DEFAULT NULL,
  p_rcd_quantity_cancelled    IN         receipt_details.rcd_quantity_cancelled%TYPE         DEFAULT NULL,
  p_rcd_weight_cancelled      IN         receipt_details.rcd_weight_cancelled%TYPE           DEFAULT NULL,
  p_rcd_use_code              IN         receipt_details.rcd_use_code%TYPE                   DEFAULT NULL,
  p_rcd_cancelled_date        IN         receipt_details.rcd_cancelled_date%TYPE             DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY receipt_details%ROWTYPE)
RETURN NUMBER;


END RCD_PACK;
/