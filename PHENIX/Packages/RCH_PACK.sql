CREATE OR REPLACE PACKAGE phenix.RCH_PACK AS

PROCEDURE INSERT_RCH_PROC(
	p_rch_ven_code        IN receipt_headers.rch_ven_code%TYPE,
	p_rch_number          IN receipt_headers.rch_number%TYPE,
	p_rch_source          IN receipt_headers.rch_source%TYPE,
	p_rch_open_switch     IN receipt_headers.rch_open_switch%TYPE,
	p_rch_date            IN receipt_headers.rch_date%TYPE,
	p_rch_status          IN receipt_headers.rch_status%TYPE,
	p_rch_whs_code        IN receipt_headers.rch_whs_code%TYPE,
	p_rch_lock_switch     IN receipt_headers.rch_lock_switch%TYPE		DEFAULT 0,
	p_rch_use_code        IN receipt_headers.rch_use_code%TYPE			DEFAULT NULL,
	p_rch_use_lock_code   IN receipt_headers.rch_use_lock_code%TYPE	DEFAULT NULL,
	p_rch_rth_id          IN receipt_headers.rch_rth_id%TYPE				DEFAULT NULL
);

FUNCTION DOES_RCH_ALREADY_EXISTS_FUNC(
	p_reference_number 	IN VARCHAR2,
	p_ven_code					IN NUMBER,
	p_source						IN VARCHAR2
)
RETURN BOOLEAN;

PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  receipt_headers%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_rch_ven_code                   IN         receipt_headers.rch_ven_code%TYPE,
  p_rch_number                     IN         receipt_headers.rch_number%TYPE,
  p_rch_source                     IN         receipt_headers.rch_source%TYPE,
  p_rch_rec                        OUT NOCOPY receipt_headers%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_rch_ven_code                   IN         receipt_headers.rch_ven_code%TYPE,
  p_rch_number                     IN         receipt_headers.rch_number%TYPE,
  p_rch_source                     IN         receipt_headers.rch_source%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_rch_ven_code                   IN         receipt_headers.rch_ven_code%TYPE,
  p_rch_number                     IN         receipt_headers.rch_number%TYPE,
  p_rch_source                     IN         receipt_headers.rch_source%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_rch_ven_code                   IN         receipt_headers.rch_ven_code%TYPE,
  p_rch_number                     IN         receipt_headers.rch_number%TYPE,
  p_rch_source                     IN         receipt_headers.rch_source%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_rch_ven_code                   IN         receipt_headers.rch_ven_code%TYPE,
  p_rch_number                     IN         receipt_headers.rch_number%TYPE,
  p_rch_source                     IN         receipt_headers.rch_source%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_rch_ven_code                   IN         receipt_headers.rch_ven_code%TYPE,
  p_rch_number                     IN         receipt_headers.rch_number%TYPE,
  p_rch_source                     IN         receipt_headers.rch_source%TYPE);


PROCEDURE INSERT_PROC(
  p_rch_ven_code         IN         receipt_headers.rch_ven_code%TYPE,
  p_rch_number           IN         receipt_headers.rch_number%TYPE,
  p_rch_source           IN         receipt_headers.rch_source%TYPE,
  p_rch_lock_switch      IN         receipt_headers.rch_lock_switch%TYPE,
  p_rch_open_switch      IN         receipt_headers.rch_open_switch%TYPE,
  p_rch_date             IN         receipt_headers.rch_date%TYPE,
  p_rch_status           IN         receipt_headers.rch_status%TYPE,
  p_rch_whs_code         IN         receipt_headers.rch_whs_code%TYPE,
  p_rch_use_code         IN         receipt_headers.rch_use_code%TYPE              DEFAULT NULL,
  p_rch_use_lock_code    IN         receipt_headers.rch_use_lock_code%TYPE         DEFAULT NULL,
  p_rch_rth_id           IN         receipt_headers.rch_rth_id%TYPE                DEFAULT NULL,
  p_rch_on_error_switch  IN         receipt_headers.rch_on_error_switch%TYPE       DEFAULT 0 );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY receipt_headers%ROWTYPE);

END RCH_PACK;
/