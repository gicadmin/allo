CREATE OR REPLACE PACKAGE phenix.POSITIONING_PACK IS

--La procédure génère le pré positionnement
PROCEDURE PRE_SLOT_PROCEDURE (
					p_jsc_id           IN NUMBER
);

--La procédure calcule la moyenne des ventes pour un entrepôt / produit format et le nombre de transactions de cueillettes
PROCEDURE CALCULATE_AVERAGE_SALES_FUNC(
					p_whs_code 	 		     IN  VARCHAR2,
					p_prd_code           IN  VARCHAR2,
					p_prd_fmt_code       IN  VARCHAR2,
					p_prd_season_start   IN  DATE,
					p_nbre_weeks         IN  NUMBER,
					p_nbre_days_per_week IN  NUMBER,
					p_avg_sales          OUT NUMBER,
					p_nb_pick            OUT NUMBER
);

-- La procédure remplit la table POSITIONING_FAMILY_LOCATIONS d'enregistrements basés sur un entrepôt et un positionnement de famille
PROCEDURE BUILD_POSITIONING_LOC_PROC(
          p_whs_code         IN  VARCHAR2,
					p_pof_code         IN  NUMBER
);

-- La procédure remplit la table POSITIONING_FAMILY_PRODUCTS d'enregistrements basés sur un entrepôt et un positionnement de famille
PROCEDURE BUILD_POSITIONING_PRD_PROC(
          p_whs_code         IN  VARCHAR2,
					p_pof_code         IN  NUMBER
);

--La procédure détermine le type de rayonnage que le produit va utiliser
PROCEDURE DETERMINE_RACKING_TYPE(
          p_whs_code 	 	     IN  VARCHAR2,
  			  p_pof_code         IN  NUMBER
);

--La procédure positionne les produits dans les localisations (appelé par SLOTTING_PROCEDURE).
PROCEDURE SLOTTING_PROCEDURE_INTERNAL(
                 p_whs_code          IN  VARCHAR2,
                 p_pof_code          IN  NUMBER
);

--La procédure assigne des produits à des localisations
PROCEDURE SLOTTING_PROCEDURE(
					p_jsc_id           IN NUMBER
);

END POSITIONING_PACK;
/