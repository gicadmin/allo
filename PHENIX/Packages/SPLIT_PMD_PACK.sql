CREATE OR REPLACE PACKAGE phenix.SPLIT_PMD_PACK IS

--gic1700 pour la fermeture des mission
FUNCTION SPLIT_PMD_ON_COT_FUNC(
  p_pmh_id           IN      NUMBER,
  p_picker_code      IN      NUMBER,   --gic1842
  p_completion_code  IN      NUMBER,   --gic1842
  p_rf_switch        IN      NUMBER,   --GIC1797
  p_error_code       OUT     NUMBER,
  p_error_message    OUT     VARCHAR2
)
RETURN BOOLEAN;

--gic1700 pour la fermeture des mission
FUNCTION SPLIT_PMD_ON_VBD_FUNC(
  p_pmh_id           IN      NUMBER,
  p_picker_code      IN      NUMBER,   --gic1842
  p_completion_code  IN      NUMBER,   --gic1842
  p_rf_switch        IN      NUMBER,   --GIC1797
  p_error_code       OUT     NUMBER,
  p_error_message    OUT     VARCHAR2
)
RETURN BOOLEAN;

--EFE62 pour le split des dates
FUNCTION INSERT_DATES_QUANTITY_FUNC(
	p_pmd_id 							IN NUMBER ,
	p_prd_definition 			IN VARCHAR2,
	p_qty_taken_cot 			IN NUMBER,
	p_cot_cod_coh_id 			IN NUMBER,
	p_cot_cod_line_number IN NUMBER,
	p_cot_line_number 		IN NUMBER,
  p_rf_switch 					IN NUMBER,
  p_error_code          OUT NUMBER,
  p_error_message       OUT VARCHAR2
)
RETURN BOOLEAN;

END SPLIT_PMD_PACK;
/