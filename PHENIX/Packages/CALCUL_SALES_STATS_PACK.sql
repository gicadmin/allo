CREATE OR REPLACE PACKAGE phenix.CALCUL_SALES_STATS_PACK IS

FUNCTION CALCUL_SALES_STATS_FUNC (
	p_process_type 						  IN VARCHAR2,
	p_prd_code 								  IN VARCHAR2,
	p_prd_definition 					  IN VARCHAR2,
	p_prd_availability_date		  IN DATE,
	p_week_average						  IN NUMBER,
	p_week_discard						  IN NUMBER,
	p_ctr_exclude_week_switch	  IN NUMBER,	--UTILISÉ Seulement pour CALCUL_SALES_STATS_PACK.FIND_REG_FUNC
	p_facteur_conversion 			  IN NUMBER,
	p_prd_season_start				  IN DATE	DEFAULT NULL,
	p_prd_season_end					  IN DATE DEFAULT NULL,
  p_update_tpo_flag           IN OUT NUMBER,	--FRE1691
  p_error_message							OUT VARCHAR2,
  p_whs_code 								  IN VARCHAR2 DEFAULT NULL  --BER1463
)
RETURN NUMBER;

--CSC1416 fonction pour trouver les ventes moyennes en comparant le passé au présent.. et en inventant le futur
-- pour les produits réguliers ayant assez de semaines depuis leur entrée en vigueur
FUNCTION FIND_REG_PAST_AND_FUTURE_FUNC (
	p_prd_code 						      IN VARCHAR2,
	p_prd_definition 			      IN VARCHAR2,
	p_date_debut_stats_LY       IN DATE,
	p_year_debut_stats_LY       IN NUMBER,	--USG346
	p_period_debut_stats_LY     IN NUMBER,	--USG346
	p_week_debut_stats_LY       IN NUMBER,	--USG346
	p_date_debut_stats_TY       IN DATE,
	p_year_debut_stats_TY       IN NUMBER,	--USG346
	p_period_debut_stats_TY     IN NUMBER,	--USG346
	p_week_debut_stats_TY       IN NUMBER,	--USG346
	p_week_average 				      IN NUMBER,
	p_week_discard				      IN NUMBER,
	p_week_past 					      IN NUMBER,
	p_facteur_conversion 	      IN NUMBER,
  p_update_tpo_flag           IN OUT NUMBER, --FRE1691 valeur 1 si on a utitlisé la valeur CTR_MAX_GROWTH_PERCENTAGE pourle calcul du pct
  p_whs_code 								  IN VARCHAR2 DEFAULT NULL  --BER1463
 )
RETURN NUMBER;

--csc1416 mettre dans un fonction séparée le calcul de vente moyennes en utilisant les X semaines passées seulement
-- bon pour les produits réguliers
FUNCTION FIND_REG_FUNC (
	p_facteur_conversion 			IN NUMBER,
	p_prd_code 								IN VARCHAR2,
	p_product_format 					IN VARCHAR2,
	p_week_average						IN NUMBER,
	p_week_discard						IN NUMBER,
	p_ctr_exclude_week_switch	IN NUMBER,
	pYearStart 								IN NUMBER,
	pPeriodStart 							IN NUMBER,
	pWeekStart 								IN NUMBER,
	p_prd_availability_date		IN DATE,	--USG346
	p_whs_code 							  IN VARCHAR2 DEFAULT NULL  --BER1463
)
RETURN NUMBER;

--csc1416 fonction pour trouver les ventes moyennes de semaines futures de la saison
--en se fiant tout simplement aux semaines futures de la saison dernieres sans taux de croissance
--utilisé seulement lorsquon est pendant la premiere semaine de la saison
FUNCTION FIND_SEASON_WITH_ZERO_FUNC (
	p_prd_code							IN VARCHAR2,
	p_prd_definition 				IN VARCHAR2,
	p_year									IN NUMBER, 	--année 	a partir de laquelle on prendra les X semaines futures pour la moyenne
	p_period								IN NUMBER, 	--période a partir de laquelle on prendra les X semaines futures pour la moyenne
	p_week									IN NUMBER,	--semaine a partir de laquelle on prendra les X semaines futures pour la moyenne
	p_week_average 					IN NUMBER,
	p_week_discard					IN NUMBER,
	p_prd_season_start			IN DATE, --Date de début de saison
	p_prd_season_end				IN DATE, --Date de la fin de saison
	p_facteur_conversion		IN NUMBER,
	p_whs_code 							IN VARCHAR2 DEFAULT NULL  --BER1463
)
RETURN NUMBER;

--csc1416 fonction pour trouver les ventes moyennes de semaines futures de la saison
--en se fiant au taux de croissance des semaines passées appliqué aux semaines futures de la saison dernieres
FUNCTION FIND_SEASON_PAST_FUTURE_FUNC (
	p_prd_code							IN VARCHAR2,
	p_prd_definition 				IN VARCHAR2,
	p_year									IN NUMBER, 	--année 	a partir de laquelle on prendra les X semaines futures pour la moyenne
	p_period								IN NUMBER, 	--période a partir de laquelle on prendra les X semaines futures pour la moyenne
	p_week									IN NUMBER,	--semaine a partir de laquelle on prendra les X semaines futures pour la moyenne
	p_week_average 					IN NUMBER,
	p_week_discard					IN NUMBER,
	p_prd_season_start			IN DATE, --DAte de début de saison
	p_prd_season_end				IN DATE, --DAte de la fin de saison
	p_prd_availability_date	IN DATE,
	p_facteur_conversion		IN NUMBER,
  p_update_tpo_flag       IN OUT NUMBER,--FRE1691
  p_whs_code 						  IN VARCHAR2 DEFAULT NULL  --BER1463
)
RETURN NUMBER;

--fonction pour les appels qui nont pas a savoir si la croissance à été modifié (ex: rapport car les variable OUT ne sont pas permis dans les select)
FUNCTION CALCUL_MOYENNE_NO_OUT_FUNC( --FRE1691 nouvelle fonction appelée pour le calcul de la moyenne ds le rapport produit_a_recommander
	p_process_type 						   IN VARCHAR2,
	p_prd_code 								   IN VARCHAR2,
	p_prd_definition 					   IN VARCHAR2,
	p_prd_availability_date		   IN DATE,
	p_week_average						   IN NUMBER,
	p_week_discard						   IN NUMBER,
	p_ctr_exclude_week_switch	   IN NUMBER,
	p_facteur_conversion 			   IN NUMBER,
	p_prd_season_start				   IN DATE DEFAULT NULL,
	p_prd_season_end					   IN DATE DEFAULT NULL
)
RETURN NUMBER;
--CSC5203 Fonction pareille que FUNCTION CALCUL_MOYENNE_NO_OUT_FUNC : a cette nouvelle fonction le code d entrepot est passé en paramŠtre
FUNCTION CALCUL_MOYENNE_WHS_NO_OUT_FUNC(
	p_process_type 						   IN VARCHAR2,
	p_prd_code 								   IN VARCHAR2,
	p_prd_definition 					   IN VARCHAR2,
	p_prd_availability_date		   IN DATE,
	p_week_average						   IN NUMBER,
	p_week_discard						   IN NUMBER,
	p_ctr_exclude_week_switch	   IN NUMBER,
	p_facteur_conversion 			   IN NUMBER,
	p_prd_season_start				   IN DATE DEFAULT NULL,
	p_prd_season_end					   IN DATE DEFAULT NULL,
	p_whs_code                   IN VARCHAR2 DEFAULT NULL
)
RETURN NUMBER;
END CALCUL_SALES_STATS_PACK;
/