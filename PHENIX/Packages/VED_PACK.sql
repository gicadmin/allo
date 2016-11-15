CREATE OR REPLACE PACKAGE phenix.VED_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  vendor_agreement_details%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_ved_id                         IN         vendor_agreement_details.ved_id%TYPE,
  p_ved_rec                        OUT NOCOPY vendor_agreement_details%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_ved_id                         IN         vendor_agreement_details.ved_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_ved_id                         IN         vendor_agreement_details.ved_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_ved_id                         IN         vendor_agreement_details.ved_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_ved_id                         IN         vendor_agreement_details.ved_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_ved_id                         IN         vendor_agreement_details.ved_id%TYPE);


FUNCTION INSERT_FUNC(
  p_ved_vsa_code                  IN         vendor_agreement_details.ved_vsa_code%TYPE,
  p_ved_agreement_type            IN         vendor_agreement_details.ved_agreement_type%TYPE,
  p_ved_cost_used                 IN         vendor_agreement_details.ved_cost_used%TYPE,
  p_ved_bill_to_vendor_switch     IN         vendor_agreement_details.ved_bill_to_vendor_switch%TYPE,
  p_ved_pgr_code                  IN         vendor_agreement_details.ved_pgr_code%TYPE                       DEFAULT NULL,
  p_ved_prf_prd_code              IN         vendor_agreement_details.ved_prf_prd_code%TYPE                   DEFAULT NULL,
  p_ved_prf_fmt_code              IN         vendor_agreement_details.ved_prf_fmt_code%TYPE                   DEFAULT NULL,
  p_ved_agreement_amount          IN         vendor_agreement_details.ved_agreement_amount%TYPE               DEFAULT NULL,
  p_ved_agreement_percent         IN         vendor_agreement_details.ved_agreement_percent%TYPE              DEFAULT NULL,
  p_ved_end_date                  IN         vendor_agreement_details.ved_end_date%TYPE                       DEFAULT NULL,
  p_ved_start_date                IN         vendor_agreement_details.ved_start_date%TYPE                     DEFAULT NULL,
  p_ved_guaranteed_cost           IN         vendor_agreement_details.ved_guaranteed_cost%TYPE                DEFAULT NULL,
  p_ved_use_modification_code     IN         vendor_agreement_details.ved_use_modification_code%TYPE          DEFAULT NULL,
  p_ved_exclude_in_selling_switc  IN         vendor_agreement_details.ved_exclude_in_selling_switch%TYPE      DEFAULT 0 ,
  p_ved_exclude_in_qtd_switch     IN         vendor_agreement_details.ved_exclude_in_qtd_switch%TYPE          DEFAULT 0 ,
  p_ved_creation_date             IN         vendor_agreement_details.ved_creation_date%TYPE                  DEFAULT SYSDATE ,
  p_ved_modification_date         IN         vendor_agreement_details.ved_modification_date%TYPE              DEFAULT SYSDATE )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY vendor_agreement_details%ROWTYPE)
RETURN NUMBER;

FUNCTION GET_VED_ID_FUNC RETURN NUMBER;

PROCEDURE INSERT_VED_PROC(
	p_ved_id                     		IN vendor_agreement_details.ved_id%TYPE,
	p_ved_vsa_code               		IN vendor_agreement_details.ved_vsa_code%TYPE,
	p_ved_agreement_type         		IN vendor_agreement_details.ved_agreement_type%TYPE,
	p_ved_cost_used              		IN vendor_agreement_details.ved_cost_used%TYPE,
	p_ved_bill_to_vendor_switch  		IN vendor_agreement_details.ved_bill_to_vendor_switch%TYPE,
	p_ved_pgr_code               		IN vendor_agreement_details.ved_pgr_code%TYPE,
	p_ved_prf_prd_code           		IN vendor_agreement_details.ved_prf_prd_code%TYPE,
	p_ved_prf_fmt_code           		IN vendor_agreement_details.ved_prf_fmt_code%TYPE,
	p_ved_agreement_amount       		IN vendor_agreement_details.ved_agreement_amount%TYPE,
	p_ved_agreement_percent      		IN vendor_agreement_details.ved_agreement_percent%TYPE,
	p_ved_start_date             		IN vendor_agreement_details.ved_start_date%TYPE									DEFAULT NULL,
	p_ved_end_date               		IN vendor_agreement_details.ved_end_date%TYPE										DEFAULT NULL,
	p_ved_guaranteed_cost        		IN vendor_agreement_details.ved_guaranteed_cost%TYPE						DEFAULT NULL,
	p_ved_exclude_in_selling_switc	IN vendor_agreement_details.ved_exclude_in_selling_switch%TYPE	DEFAULT 0,
  p_ved_creation_date             IN vendor_agreement_details.ved_creation_date%TYPE	            DEFAULT SYSDATE,
  p_ved_modification_date         IN vendor_agreement_details.ved_modification_date%TYPE	        DEFAULT SYSDATE,
  p_use_modification_code         IN vendor_agreement_details.ved_use_modification_code%TYPE
);

--Fonction qui retourne les montants à mettre dans le cod_vendor_reclaim_amount
FUNCTION CALCULATE_VO_RECLAIM_FUNC(
	p_coh_cus_code 				IN NUMBER,
	p_cod_prf_prd_code 		IN VARCHAR2,
	p_cod_prf_fmt_code 		IN VARCHAR2,
  p_date                IN DATE DEFAULT SYSDATE   --ROL4333
)
RETURN NUMBER;

END VED_PACK;
/