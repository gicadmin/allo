CREATE OR REPLACE PACKAGE phenix.CPF_PACK IS

PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  customer_profiles%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_cpf_cus_code                   IN         customer_profiles.cpf_cus_code%TYPE,
  p_cpf_prf_prd_code               IN         customer_profiles.cpf_prf_prd_code%TYPE,
  p_cpf_prf_fmt_code               IN         customer_profiles.cpf_prf_fmt_code%TYPE,
  p_cpf_rec                        OUT NOCOPY customer_profiles%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_cpf_cus_code                   IN         customer_profiles.cpf_cus_code%TYPE,
  p_cpf_prf_prd_code               IN         customer_profiles.cpf_prf_prd_code%TYPE,
  p_cpf_prf_fmt_code               IN         customer_profiles.cpf_prf_fmt_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_cpf_cus_code                   IN         customer_profiles.cpf_cus_code%TYPE,
  p_cpf_prf_prd_code               IN         customer_profiles.cpf_prf_prd_code%TYPE,
  p_cpf_prf_fmt_code               IN         customer_profiles.cpf_prf_fmt_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_cpf_cus_code                   IN         customer_profiles.cpf_cus_code%TYPE,
  p_cpf_prf_prd_code               IN         customer_profiles.cpf_prf_prd_code%TYPE,
  p_cpf_prf_fmt_code               IN         customer_profiles.cpf_prf_fmt_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_cpf_cus_code                   IN         customer_profiles.cpf_cus_code%TYPE,
  p_cpf_prf_prd_code               IN         customer_profiles.cpf_prf_prd_code%TYPE,
  p_cpf_prf_fmt_code               IN         customer_profiles.cpf_prf_fmt_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_cpf_cus_code                   IN         customer_profiles.cpf_cus_code%TYPE,
  p_cpf_prf_prd_code               IN         customer_profiles.cpf_prf_prd_code%TYPE,
  p_cpf_prf_fmt_code               IN         customer_profiles.cpf_prf_fmt_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_cpf_cus_code                   IN         customer_profiles.cpf_cus_code%TYPE,
  p_cpf_prf_prd_code               IN         customer_profiles.cpf_prf_prd_code%TYPE,
  p_cpf_prf_fmt_code               IN         customer_profiles.cpf_prf_fmt_code%TYPE);


PROCEDURE INSERT_PROC(
  p_cpf_cus_code                  IN         customer_profiles.cpf_cus_code%TYPE,
  p_cpf_prf_prd_code              IN         customer_profiles.cpf_prf_prd_code%TYPE,
  p_cpf_prf_fmt_code              IN         customer_profiles.cpf_prf_fmt_code%TYPE,
  p_cpf_prd_description           IN         customer_profiles.cpf_prd_description%TYPE,
  p_cpf_prf_description           IN         customer_profiles.cpf_prf_description%TYPE,
  p_cpf_last_order_date           IN         customer_profiles.cpf_last_order_date%TYPE                DEFAULT NULL,
  p_cpf_last_order_price          IN         customer_profiles.cpf_last_order_price%TYPE               DEFAULT NULL,
  p_cpf_last_pricing_source       IN         customer_profiles.cpf_last_pricing_source%TYPE            DEFAULT NULL,
  p_cpf_last_order_quantity       IN         customer_profiles.cpf_last_order_quantity%TYPE            DEFAULT NULL,
  p_cpf_last_order_weight         IN         customer_profiles.cpf_last_order_weight%TYPE              DEFAULT NULL,
  p_cpf_prd_alt_description       IN         customer_profiles.cpf_prd_alt_description%TYPE            DEFAULT NULL,
  p_cpf_prd_definition            IN         customer_profiles.cpf_prd_definition%TYPE                 DEFAULT NULL,
  p_cpf_brn_description           IN         customer_profiles.cpf_brn_description%TYPE                DEFAULT NULL,
  p_cpf_brn_alt_description       IN         customer_profiles.cpf_brn_alt_description%TYPE            DEFAULT NULL,
  p_cpf_ven_short_name            IN         customer_profiles.cpf_ven_short_name%TYPE                 DEFAULT NULL,
  p_cpf_prd_ctg_code              IN         customer_profiles.cpf_prd_ctg_code%TYPE                   DEFAULT NULL,
  p_cpf_prd_catalog_sequence_cod  IN         customer_profiles.cpf_prd_catalog_sequence_code%TYPE      DEFAULT NULL,
  p_cpf_history_calculated_date   IN         customer_profiles.cpf_history_calculated_date%TYPE        DEFAULT NULL,
  p_cpf_empty_value               IN         customer_profiles.cpf_empty_value%TYPE                    DEFAULT NULL,
  p_cpf_ven_next_delivery_code    IN         customer_profiles.cpf_ven_next_delivery_code%TYPE         DEFAULT NULL,
  p_cpf_ven_next_delivery_date    IN         customer_profiles.cpf_ven_next_delivery_date%TYPE         DEFAULT NULL );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY customer_profiles%ROWTYPE);

-----------------------------------------------------------------------------------------------
-- Ajuster les fonctions / procédures ci-dessous afin de ne plus les utiliser au fil du temps
-- Les fonctions ci-haut doivent être considérées à la place
-- Déplacer les traitements dans un package OPERATION au besoin
-----------------------------------------------------------------------------------------------

FUNCTION GET_FULL_CPF_FUNC(
	p_cpf_cus_code       	IN customer_profiles.cpf_cus_code%TYPE,
	p_cpf_prf_prd_code   	IN customer_profiles.cpf_prf_prd_code%TYPE,
	p_cpf_prf_fmt_code   	IN customer_profiles.cpf_prf_fmt_code%TYPE,
	p_cpf_record					OUT customer_profiles%ROWTYPE
)
RETURN BOOLEAN;

FUNCTION COUNT_ALL_CPF_FUNC
RETURN NUMBER;

PROCEDURE INSERT_CPF_PROC(
    p_cpf_cus_code                    IN customer_profiles.cpf_cus_code%TYPE,
    p_cpf_prf_prd_code                IN customer_profiles.cpf_prf_prd_code%TYPE,
    p_cpf_prf_fmt_code                IN customer_profiles.cpf_prf_fmt_code%TYPE,
    p_cpf_last_order_date             IN customer_profiles.cpf_last_order_date%TYPE,
    p_cpf_last_order_price            IN customer_profiles.cpf_last_order_price%TYPE,
    p_cpf_last_pricing_source         IN customer_profiles.cpf_last_pricing_source%TYPE,
    p_cpf_last_order_quantity         IN customer_profiles.cpf_last_order_quantity%TYPE,
    p_cpf_last_order_weight           IN customer_profiles.cpf_last_order_weight%TYPE,
    p_cpf_prd_description             IN customer_profiles.cpf_prd_description%TYPE,
    p_cpf_prd_alt_description         IN customer_profiles.cpf_prd_alt_description%TYPE,
    p_cpf_prd_definition              IN customer_profiles.cpf_prd_definition%TYPE,
    p_cpf_prf_description             IN customer_profiles.cpf_prf_description%TYPE,
    p_cpf_brn_description             IN customer_profiles.cpf_brn_description%TYPE,
    p_cpf_brn_alt_description         IN customer_profiles.cpf_brn_alt_description%TYPE,
    p_cpf_ven_short_name              IN customer_profiles.cpf_ven_short_name%TYPE,
    p_cpf_ven_next_delivery           IN customer_profiles.cpf_ven_next_delivery_date%TYPE,
    p_cpf_prd_ctg_code                IN customer_profiles.cpf_prd_ctg_code%TYPE,
    p_cpf_prd_catalog_seq_code        IN customer_profiles.cpf_prd_catalog_sequence_code%TYPE,
    p_cpf_ven_next_delivery_code      IN customer_profiles.cpf_ven_next_delivery_code%TYPE,
    p_cpf_history_calculated_date     IN customer_profiles.cpf_history_calculated_date%TYPE    DEFAULT NULL
);

FUNCTION LOCK_CPF_FUNC(
	p_cpf_cus_code       	IN customer_profiles.cpf_cus_code%TYPE,
	p_cpf_prf_prd_code   	IN customer_profiles.cpf_prf_prd_code%TYPE,
	p_cpf_prf_fmt_code   	IN customer_profiles.cpf_prf_fmt_code%TYPE
)
RETURN BOOLEAN;

FUNCTION DOES_CPF_ALREADY_EXISTS_FUNC(
	p_cpf_cus_code       	IN customer_profiles.cpf_cus_code%TYPE,
	p_cpf_prf_prd_code   	IN customer_profiles.cpf_prf_prd_code%TYPE,
	p_cpf_prf_fmt_code   	IN customer_profiles.cpf_prf_fmt_code%TYPE
)
RETURN BOOLEAN;

PROCEDURE UPDATE_DATE_CALCULATED_PROC(
	p_cpf_cus_code       	IN customer_profiles.cpf_cus_code%TYPE,
	p_cpf_prf_prd_code   	IN customer_profiles.cpf_prf_prd_code%TYPE,
	p_cpf_prf_fmt_code   	IN customer_profiles.cpf_prf_fmt_code%TYPE,
	p_date								IN DATE DEFAULT SYSDATE
);

END CPF_PACK;
/