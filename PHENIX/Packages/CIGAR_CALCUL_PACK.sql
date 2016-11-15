CREATE OR REPLACE PACKAGE phenix.CIGAR_CALCUL_PACK IS

--USG323 fonction qui vérifie si le montant de taxe sur les CIGARES
PROCEDURE CALCUL_CIGAR_TAX_PROC(
	p_prd_code 											IN VARCHAR2,
	p_fmt_code 											IN VARCHAR2,
	p_selling_retail 								IN NUMBER,
	p_current_tobacco_tax 					IN NUMBER,
	p_is_fed_taxable								IN NUMBER,	--0 ou 1
	p_prv_code											IN VARCHAR2,
	p_new_selling_retail						OUT NUMBER,
	p_new_tobacco_tax								OUT NUMBER,
	p_new_tobacco_markup_rate				OUT NUMBER,
	p_new_tobacco_tax_rate					OUT NUMBER,
	p_new_number_of_cigars 					OUT NUMBER,
	p_new_selling_before_tob_tax		OUT NUMBER,
	p_new_before_tob_tax_with_fed		OUT NUMBER,
	p_new_selling_bf_tob_per_cigar	OUT NUMBER,
	p_new_taxable_amount_per_cigar	OUT NUMBER,
	p_new_tobacco_tax_per_cigar 		OUT NUMBER
);

--USG323 fonction qui vérifie si le montant de taxe sur les CIGARES
--mais à partir dun taux de majoration etc déjà donnée (utile surtout lorsqu'il y a des overrides / valeurs entrées en retard ) Ex : drop details
PROCEDURE CALCUL_CIGAR_TAX_GVN_RATE_PROC(
	p_prd_code 											IN VARCHAR2,
	p_fmt_code 											IN VARCHAR2,
	p_selling_retail 								IN NUMBER,
	p_current_tobacco_tax 					IN NUMBER,
	p_is_fed_taxable								IN NUMBER,	--0 ou 1
	p_federal_tax_rate							IN NUMBER,	--taux de taxe déjà donné
	p_tobacco_markup_rate						IN NUMBER,	--markup rate déjà donné....
	p_tobacco_tax_rate							IN NUMBER,  --taux de taxe déjà donné...
	p_new_selling_retail						OUT NUMBER,
	p_new_tobacco_tax								OUT NUMBER,
	p_new_number_of_cigars 					OUT NUMBER,
	p_new_selling_before_tob_tax		OUT NUMBER,
	p_new_before_tob_tax_with_fed		OUT NUMBER,
	p_new_selling_bf_tob_per_cigar	OUT NUMBER,
	p_new_taxable_amount_per_cigar	OUT NUMBER,
	p_new_tobacco_tax_per_cigar 		OUT NUMBER
);

--USG323 fonction pour le calcul de la taxe tabac
FUNCTION FIND_SELLING_BEFORE_TOB_FUNC(
	p_selling_retail 					IN NUMBER,
	p_nb_of_cigars						IN NUMBER,
	p_prv_federal_tax 				IN NUMBER, --passer zéro si le produit n'est pas taxable au fédérale
	p_prv_tobacco_markup_rate IN NUMBER,
	p_prv_tobacco_tax_rate 		IN NUMBER
)
RETURN NUMBER;

--usg323 recalcul des vendant dans certaines formes etc..
PROCEDURE FORM_RECALC_CIGAR_SELLING_PROC(
	p_prd_code 									IN VARCHAR2,
	p_fmt_code 									IN VARCHAR2,
	p_whs_code                  IN VARCHAR2,   --EFE344
	p_cigar_switch 							IN NUMBER,
	p_prv_code 									IN VARCHAR2,
	p_cus_federal_exempt_switch	IN NUMBER,
	p_prv_federal_tax						IN NUMBER,
	p_prv_tobacco_markup_rate 	IN NUMBER,
	p_prv_tobacco_tax_rate 			IN NUMBER,
	p_selling_retail 						IN OUT NUMBER,
	p_tobacco_tax 							IN OUT NUMBER,
	p_tco_base_selling_cost 		IN OUT NUMBER,
	p_tco_cost_price 						IN OUT NUMBER,
	p_tco_original_retail 			IN OUT NUMBER,
	p_tco_average_cost_1 				IN OUT NUMBER,
	p_tco_average_cost_2 				IN OUT NUMBER,
	p_tco_average_cost_3 				IN OUT NUMBER,
	p_tco_average_cost_4 				IN OUT NUMBER,
	p_tco_average_list 					IN OUT NUMBER,
	p_tco_avg_real_cost_1 			IN OUT NUMBER,
	p_tco_avg_real_cost_2 			IN OUT NUMBER,
	p_tco_avg_real_cost_3 			IN OUT NUMBER,
	p_tco_avg_real_cost_4 			IN OUT NUMBER,
	p_tco_avg_real_list 				IN OUT NUMBER,
	p_ccr_code									IN OUT NUMBER
);

PROCEDURE FILL_ALL_CAD_CIGAR_FIELDS_PROC (
	p_coh_id 											IN NUMBER,
	p_cod_line_number 						IN NUMBER,
	p_prd_code										IN VARCHAR2,
	p_fmt_code 										IN VARCHAR2,
	p_cigar_switch 								IN NUMBER,
	p_prd_federal_tax_switch 			IN NUMBER,
	p_cus_fed_tax_exempt_switch		IN NUMBER,
	p_prv_code										IN VARCHAR2,
	p_tobacco_tax 								IN OUT NUMBER,
	p_selling_retail							IN OUT NUMBER,
	p_number_of_cigars						IN OUT NUMBER,
	p_selling_before_tobacco_tax	IN OUT NUMBER,
	p_before_tob_tax_incl_fed_tx	IN OUT NUMBER,
	p_selling_bf_tob_per_cigar		IN OUT NUMBER,
	p_taxable_amount_per_cigar		IN OUT NUMBER,
	p_tobacco_tax_per_cigar				IN OUT NUMBER,
	p_tobacco_markup_rate					IN OUT NUMBER,
	p_tobacco_tax_rate						IN OUT NUMBER
);

END CIGAR_CALCUL_PACK;
 
/