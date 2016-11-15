CREATE OR REPLACE PACKAGE phenix.FCW_PACK IS

PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  fiscal_calendar_weeks%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_fcw_fca_year                   IN         fiscal_calendar_weeks.fcw_fca_year%TYPE,
  p_fcw_fca_period                 IN         fiscal_calendar_weeks.fcw_fca_period%TYPE,
  p_fcw_week                       IN         fiscal_calendar_weeks.fcw_week%TYPE,
  p_fcw_rec                        OUT NOCOPY fiscal_calendar_weeks%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_fcw_fca_year                   IN         fiscal_calendar_weeks.fcw_fca_year%TYPE,
  p_fcw_fca_period                 IN         fiscal_calendar_weeks.fcw_fca_period%TYPE,
  p_fcw_week                       IN         fiscal_calendar_weeks.fcw_week%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_fcw_fca_year                   IN         fiscal_calendar_weeks.fcw_fca_year%TYPE,
  p_fcw_fca_period                 IN         fiscal_calendar_weeks.fcw_fca_period%TYPE,
  p_fcw_week                       IN         fiscal_calendar_weeks.fcw_week%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION DELETE_FUNC(
  p_fcw_fca_year                   IN         fiscal_calendar_weeks.fcw_fca_year%TYPE,
  p_fcw_fca_period                 IN         fiscal_calendar_weeks.fcw_fca_period%TYPE,
  p_fcw_week                       IN         fiscal_calendar_weeks.fcw_week%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_fcw_fca_year                   IN         fiscal_calendar_weeks.fcw_fca_year%TYPE,
  p_fcw_fca_period                 IN         fiscal_calendar_weeks.fcw_fca_period%TYPE,
  p_fcw_week                       IN         fiscal_calendar_weeks.fcw_week%TYPE);


PROCEDURE INSERT_PROC(
  p_fcw_fca_year              IN         fiscal_calendar_weeks.fcw_fca_year%TYPE,
  p_fcw_fca_period            IN         fiscal_calendar_weeks.fcw_fca_period%TYPE,
  p_fcw_week                  IN         fiscal_calendar_weeks.fcw_week%TYPE,
  p_fcw_start_date            IN         fiscal_calendar_weeks.fcw_start_date%TYPE,
  p_fcw_end_date              IN         fiscal_calendar_weeks.fcw_end_date%TYPE,
  p_fcw_week_of_year          IN         fiscal_calendar_weeks.fcw_week_of_year%TYPE,
  p_fcw_exception_week_switch IN         fiscal_calendar_weeks.fcw_exception_week_switch%TYPE      DEFAULT 0 );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY fiscal_calendar_weeks%ROWTYPE);

--valider si une semaine existe vraiment avec la date de début et la date de fin donnée
FUNCTION IF_EXISTS_EXACT_WEEK_FUNC(
	p_fcw_start_date	IN fiscal_calendar_weeks.fcw_start_date%TYPE,
	p_fcw_end_date		IN fiscal_calendar_weeks.fcw_end_date%TYPE
)
RETURN BOOLEAN;

--trouver les dates de la dernière semaines complètement terminée
PROCEDURE FIND_LAST_ENDED_WEEK_PROC(
	p_date 						IN DATE,
	p_fcw_start_date	OUT fiscal_calendar_weeks.fcw_start_date%TYPE,
	p_fcw_end_date		OUT fiscal_calendar_weeks.fcw_end_date%TYPE
);

PROCEDURE GET_INFO_BY_DATE_PROC(
	p_date 						IN DATE,
	p_fcw_week				OUT fiscal_calendar_weeks.fcw_week%TYPE,
	p_fcw_fca_period	OUT fiscal_calendar_weeks.fcw_fca_period%TYPE,
	p_fcw_fca_year 		OUT fiscal_calendar_weeks.fcw_fca_year%TYPE
);

FUNCTION GET_WEEK_BY_DATE_FUNC(
	p_date IN DATE
)
RETURN NUMBER;

FUNCTION GET_START_DATE_FUNC(
  p_fcw_week				IN fiscal_calendar_weeks.fcw_week%TYPE,
	p_fcw_fca_period	IN fiscal_calendar_weeks.fcw_fca_period%TYPE,
  p_fcw_fca_year 		IN fiscal_calendar_weeks.fcw_fca_year%TYPE
)
RETURN DATE;

--ramène la date de fin de la semaine (en return) selon la clé primaire donnée (semaine/période/année)
FUNCTION GET_END_DATE_FUNC(
  p_fcw_week				IN fiscal_calendar_weeks.fcw_week%TYPE,
	p_fcw_fca_period	IN fiscal_calendar_weeks.fcw_fca_period%TYPE,
  p_fcw_fca_year 		IN fiscal_calendar_weeks.fcw_fca_year%TYPE
)
RETURN DATE;

--ramène ldes 2 dates de la semaine selon la clé primaire donnée (semaine/période/année)
PROCEDURE GET_BOTH_DATE_PROC(
  p_fcw_week				IN fiscal_calendar_weeks.fcw_week%TYPE,
	p_fcw_fca_period	IN fiscal_calendar_weeks.fcw_fca_period%TYPE,
  p_fcw_fca_year 		IN fiscal_calendar_weeks.fcw_fca_year%TYPE,
  p_fcw_start_date	OUT fiscal_calendar_weeks.fcw_start_date%TYPE,
  p_fcw_end_date		OUT fiscal_calendar_weeks.fcw_end_date%TYPE
);

--ramène les 2 dates de la semaine selon la date courante passée
PROCEDURE GET_BOTH_DATE_BY_DATE_PROC(
  p_current_date		IN DATE,
	p_fcw_start_date	OUT fiscal_calendar_weeks.fcw_start_date%TYPE,
  p_fcw_end_date		OUT fiscal_calendar_weeks.fcw_end_date%TYPE
);

--ramène la semaine/période/année selon une date donnée
PROCEDURE GET_WK_OF_YEAR_BY_DATE_PROC(
	p_date 							IN DATE,
	p_fcw_fca_year			OUT fiscal_calendar_weeks.fcw_fca_year%TYPE,
	p_fcw_week_of_year	OUT fiscal_calendar_weeks.fcw_week_of_year%TYPE
);

--GIC3870 --Fonction qui retourne 0 ou 1, pour le PCI surtout
-- et qui trouve l'année,la période,la semaine d'une date donnée, avec un nombre de semaine donné dans le passé ou futur
FUNCTION DATE_PLUS_MINUS_WEEKS_NUM_FUNC(	--USG346
	p_date	 										IN	DATE,		 --Date donnée
	p_nb_weeks									IN	NUMBER,	 --nombre de semaine à reculer ou avancer
	p_past_or_futur							IN	VARCHAR2, --P = PAST,F = FUTUR
	p_fcw_fca_year    					OUT	fiscal_calendar_weeks.fcw_fca_year%TYPE,
	p_fcw_fca_period						OUT fiscal_calendar_weeks.fcw_fca_period%TYPE,
	p_fcw_week    							OUT fiscal_calendar_weeks.fcw_week%TYPE,
	p_fcw_start_date  					OUT fiscal_calendar_weeks.fcw_start_date%TYPE,
	p_fcw_end_date    					OUT fiscal_calendar_weeks.fcw_end_date%TYPE,
	p_take_default_oldest_date	IN NUMBER DEFAULT 0	--si une date il y a X semaine n'est pas trouvé, on prendra la plus vieille date fiscale plutot que retourner une erreur
) RETURN NUMBER;

FUNCTION DATE_PLUS_MINUS_CAL_WEEKS_FUNC(	--USG346
	p_date	 					IN	DATE,		 --Date donnée
	p_nb_weeks				IN	NUMBER,	 --nombre de semaine à reculer ou avancer
	p_past_or_futur		IN	VARCHAR2, --P = PAST,F = FUTUR
	p_fcw_fca_year    OUT	fiscal_calendar_weeks.fcw_fca_year%TYPE,
	p_fcw_fca_period	OUT fiscal_calendar_weeks.fcw_fca_period%TYPE,
	p_fcw_week    		OUT fiscal_calendar_weeks.fcw_week%TYPE,
	p_fcw_start_date  OUT fiscal_calendar_weeks.fcw_start_date%TYPE,
	p_fcw_end_date    OUT fiscal_calendar_weeks.fcw_end_date%TYPE
) RETURN BOOLEAN;

FUNCTION GET_FULL_INFO_BY_DATE_FUNC(
	p_date 							IN 	DATE,
	p_fcw_fca_year			OUT fiscal_calendar_weeks.fcw_fca_year%TYPE,
	p_fcw_fca_period    OUT fiscal_calendar_weeks.fcw_fca_period%TYPE,
	p_fcw_week					OUT fiscal_calendar_weeks.fcw_week%TYPE,
	p_fcw_start_date		OUT fiscal_calendar_weeks.fcw_start_date%TYPE,
	p_fcw_end_date			OUT fiscal_calendar_weeks.fcw_end_date%TYPE,
	p_fcw_week_of_year	OUT fiscal_calendar_weeks.fcw_week_of_year%TYPE
)
RETURN BOOLEAN;

--procédure pour trouver le jour en paramètre correspond à quoi dans les cycles d'achat etc...
PROCEDURE FIND_CURRENT_DAY_OF_CYCLE_PROC(
	p_sysdate 				IN DATE,				--date pour laquelle on veut savoir quand est la prochaine journée du cycle (si on connait pas les 2 paramètres précédents)
	p_current_day 		OUT NUMBER,			--journée prochaine du cycle (trouvé avec les 2 premiers paramètres, ou le 3e)
	p_current_week 		OUT NUMBER			--semaine prochaine du cycle (trouvé avec les 2 premiers paramètres, ou le 3e)
);

FUNCTION GET_WEEK_FUNC(
	p_year_en_cours 	IN fiscal_calendar_weeks.fcw_fca_year%TYPE,		--année en cours selon sysdate
	p_per_en_cours 		IN fiscal_calendar_weeks.fcw_fca_period%TYPE,		--période en cours selon sysdate
	p_week_en_cours 	IN fiscal_calendar_weeks.fcw_week%TYPE,		--semaine en cours selon sysdate
	p_year 						IN fiscal_calendar_weeks.fcw_fca_year%TYPE,
	p_per 						IN fiscal_calendar_weeks.fcw_fca_period%TYPE,
	p_week 						IN fiscal_calendar_weeks.fcw_week%TYPE,
	p_nb_weeks 				IN NUMBER,
	p_season_start 		IN DATE DEFAULT NULL,
	p_season_end 			IN DATE DEFAULT NULL
)
RETURN NUMBER;

FUNCTION FIND_NB_OF_WEEKS_BETWEEN_FUNC(
	p_year_en_cours 					IN NUMBER,		--année en cours selon sysdate
	p_week_of_year_en_cours 	IN NUMBER,		--semaine en cours selon sysdate
	p_year 										IN NUMBER,
	p_week_of_year 						IN NUMBER,
	p_past_or_futur						IN	VARCHAR2 DEFAULT 'P' --P = PAST,F = FUTUR
)
RETURN NUMBER;

--retourne la date de début de la plus vieille semaine fiscale voulue selon un nombre de semaine demandé (4eme paramètre)
--on prend les semaines plus vieilles que la semaine courante (passé dans les 3 premiers paramètres)
--sert habituellement au calcul des statistiques de ventes etc...
FUNCTION OLDEST_DATE_FOR_NB_OF_WKS_FUNC(	--GIC1172
	p_year_en_cours 	IN NUMBER,		--année en cours selon sysdate
	p_per_en_cours 		IN NUMBER,		--période en cours selon sysdate
	p_week_en_cours 	IN NUMBER,		--semaine en cours selon sysdate
	p_nb_weeks 				IN NUMBER			--nombre de semaine voulu pour statistique
)
RETURN DATE;

--retourne la date de début de la plus vieille semaine fiscale voulue qui est inclus dans les dates de saison en paramètre
--selon un nombre de semaine demandé (4eme paramètre)
--on prend les semaines plus vieilles que la semaine courante (passé dans les 3 premiers paramètres)
--sert habituellement au calcul des statistiques de ventes etc...
FUNCTION OLDEST_DATE_IN_SEASON_FUNC(	--GIC1172
	p_year_en_cours 	IN NUMBER,		--année en cours selon sysdate
	p_per_en_cours 		IN NUMBER,		--période en cours selon sysdate
	p_week_en_cours 	IN NUMBER,		--semaine en cours selon sysdate
	p_nb_weeks 				IN NUMBER,		--nombre de semaine voulu pour statistique
	p_season_start 		IN DATE,			--début de saison du produit
	p_season_end 			IN DATE				--fin de saison du produit
)
RETURN DATE;

--gic3870 création dune fonction pour trouver la plus vieille date du calendrier fiscal
FUNCTION FIND_OLDEST_CALENDAR_DATE_FUNC
RETURN DATE;

FUNCTION GET_FULL_INFO_BY_KEY_FUNC(
  p_fcw_week        IN fiscal_calendar_weeks.fcw_week%TYPE,
  p_fcw_fca_period  IN fiscal_calendar_weeks.fcw_fca_period%TYPE,
  p_fcw_fca_year    IN fiscal_calendar_weeks.fcw_fca_year%TYPE,
  p_fcw_record      OUT fiscal_calendar_weeks%ROWTYPE
)
RETURN BOOLEAN;

END FCW_PACK;
/