CREATE OR REPLACE PACKAGE phenix.CTT_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  counter_types%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_ctt_broker_nac_code            IN         counter_types.ctt_broker_nac_code%TYPE,
  p_ctt_broker_type_code           IN         counter_types.ctt_broker_type_code%TYPE,
  p_ctt_rec                        OUT NOCOPY counter_types%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_ctt_broker_nac_code            IN         counter_types.ctt_broker_nac_code%TYPE,
  p_ctt_broker_type_code           IN         counter_types.ctt_broker_type_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_ctt_broker_nac_code            IN         counter_types.ctt_broker_nac_code%TYPE,
  p_ctt_broker_type_code           IN         counter_types.ctt_broker_type_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_ctt_broker_nac_code            IN         counter_types.ctt_broker_nac_code%TYPE,
  p_ctt_broker_type_code           IN         counter_types.ctt_broker_type_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_ctt_broker_nac_code            IN         counter_types.ctt_broker_nac_code%TYPE,
  p_ctt_broker_type_code           IN         counter_types.ctt_broker_type_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_ctt_broker_nac_code            IN         counter_types.ctt_broker_nac_code%TYPE,
  p_ctt_broker_type_code           IN         counter_types.ctt_broker_type_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_ctt_broker_nac_code            IN         counter_types.ctt_broker_nac_code%TYPE,
  p_ctt_broker_type_code           IN         counter_types.ctt_broker_type_code%TYPE);

FUNCTION GET_FULL_FUNC(
  p_ctt_code                       IN         counter_types.ctt_code%TYPE,
  p_ctt_rec                        OUT NOCOPY counter_types%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_ctt_code                       IN         counter_types.ctt_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_ctt_code                       IN         counter_types.ctt_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_ctt_code                       IN         counter_types.ctt_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_ctt_code                       IN         counter_types.ctt_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_ctt_code                       IN         counter_types.ctt_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_ctt_code                       IN         counter_types.ctt_code%TYPE);


PROCEDURE INSERT_PROC(
  p_ctt_code                    IN         counter_types.ctt_code%TYPE,
  p_ctt_description             IN         counter_types.ctt_description%TYPE,
  p_ctt_alt_description         IN         counter_types.ctt_alt_description%TYPE              DEFAULT NULL,
  p_ctt_broker_nac_code         IN         counter_types.ctt_broker_nac_code%TYPE              DEFAULT NULL,
  p_ctt_broker_type_code        IN         counter_types.ctt_broker_type_code%TYPE             DEFAULT NULL,
  p_ctt_last_date_billed        IN         counter_types.ctt_last_date_billed%TYPE             DEFAULT NULL,
  p_ctt_billing_cycle           IN         counter_types.ctt_billing_cycle%TYPE                DEFAULT NULL,
  p_ctt_telemarketing_switch    IN         counter_types.ctt_telemarketing_switch%TYPE         DEFAULT 0 ,
  p_ctt_broker_initiated_switch IN         counter_types.ctt_broker_initiated_switch%TYPE      DEFAULT 0 ,
  p_ctt_customer_rebate_switch  IN         counter_types.ctt_customer_rebate_switch%TYPE       DEFAULT 0 ,
  p_ctt_telemarketer_percent    IN         counter_types.ctt_telemarketer_percent%TYPE         DEFAULT 0 ,
  p_ctt_billing_method          IN         counter_types.ctt_billing_method%TYPE               DEFAULT 'N' ,
  p_ctt_retained_admin_percent  IN         counter_types.ctt_retained_admin_percent%TYPE       DEFAULT 0 );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY counter_types%ROWTYPE);

END CTT_PACK;
/