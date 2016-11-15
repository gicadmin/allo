CREATE OR REPLACE PACKAGE phenix.FCD_OPERATION_PACK AS

FUNCTION CHECK_CALENDAR_CREATED_FUNC(
  p_nb_days OUT NUMBER
)
RETURN BOOLEAN;

FUNCTION IS_BUSINESS_DAY_FUNC(
  p_cus_code IN     customers.cus_code%TYPE,
  p_date     IN OUT fiscal_calendar_days.fcd_date%TYPE,
  p_day      OUT    fiscal_calendar_days.fcd_corresponding_vpc_pcy_day%TYPE
)
RETURN BOOLEAN;

FUNCTION GET_NEXT_BUSINESS_DAY_FUNC(
  p_cus_code   IN  customers.cus_code%TYPE,
  p_start_date IN  fiscal_calendar_days.fcd_date%TYPE,
  p_start_day  OUT fiscal_calendar_days.fcd_corresponding_vpc_pcy_day%TYPE
)
RETURN DATE;

--gic3870 création dune fonction pour trouver la plus vieille date du calendrier fiscal
--csc8593 déplacer la fonction de FCW PACK pour la mettre dans FCD OPERATION PACK
FUNCTION FIND_OLDEST_CALENDAR_DATE_FUNC
RETURN DATE;

--csc8593 créer une fonction pour trouver la date la plus dans le futur du calendrier fiscal
FUNCTION FIND_NEWEST_CALENDAR_DATE_FUNC
RETURN DATE;

END FCD_OPERATION_PACK;
/