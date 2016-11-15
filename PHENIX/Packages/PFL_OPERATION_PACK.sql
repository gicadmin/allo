CREATE OR REPLACE PACKAGE phenix.PFL_OPERATION_PACK IS

PROCEDURE INIT_CANDIDAT_SEARCH(
	p_pof_measure            IN  POSITIONING_FAMILIES.POF_MEASURE%type,
  p_loc_order              IN  LOCATIONS.LOC_ORDER%type
);

FUNCTION CONSIDER_AS_CANDIDAT(
    p_pfp_id                 IN  POSITIONING_FAMILY_PRODUCTS.PFP_ID%type,
    p_prf_height             IN  NUMBER,
    p_prf_weight             IN  NUMBER,
    p_pfp_average_daily_sales IN  NUMBER,
		p_pfp_item_per_rows      IN  NUMBER) RETURN BOOLEAN;

FUNCTION GET_CHOOSEN_CANDIDAT RETURN POSITIONING_FAMILY_PRODUCTS.PFP_ID%type;

END PFL_OPERATION_PACK;
 
/