CREATE OR REPLACE PACKAGE phenix.FCA_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  fiscal_calendars%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_fca_year                       IN         fiscal_calendars.fca_year%TYPE,
  p_fca_period                     IN         fiscal_calendars.fca_period%TYPE,
  p_fca_rec                        OUT NOCOPY fiscal_calendars%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_fca_year                       IN         fiscal_calendars.fca_year%TYPE,
  p_fca_period                     IN         fiscal_calendars.fca_period%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_fca_year                       IN         fiscal_calendars.fca_year%TYPE,
  p_fca_period                     IN         fiscal_calendars.fca_period%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION DELETE_FUNC(
  p_fca_year                       IN         fiscal_calendars.fca_year%TYPE,
  p_fca_period                     IN         fiscal_calendars.fca_period%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_fca_year                       IN         fiscal_calendars.fca_year%TYPE,
  p_fca_period                     IN         fiscal_calendars.fca_period%TYPE);


PROCEDURE INSERT_PROC(
  p_fca_year                    IN         fiscal_calendars.fca_year%TYPE,
  p_fca_period                  IN         fiscal_calendars.fca_period%TYPE,
  p_fca_start_date              IN         fiscal_calendars.fca_start_date%TYPE,
  p_fca_end_date                IN         fiscal_calendars.fca_end_date%TYPE,
  p_fca_exception_period_switch IN         fiscal_calendars.fca_exception_period_switch%TYPE      DEFAULT 0 );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY fiscal_calendars%ROWTYPE);


FUNCTION GET_FISCAL_YEAR_BY_DATE_FUNC(
	p_date IN DATE
)
RETURN NUMBER;

FUNCTION GET_PERIOD_BY_DATE_FUNC(
	p_date IN DATE
)
RETURN NUMBER;

FUNCTION GET_PERIOD_RANGE_FUNC(
	p_fca_period 		IN fiscal_calendars.fca_period%TYPE,
  p_fca_year 			IN fiscal_calendars.fca_year%TYPE,
  p_which_one 		IN VARCHAR2		--parametre spécifiant si on veut avoir la premiere ou derniere date de la période. Valeurs permises : 'START', 'END'
)
RETURN DATE;

FUNCTION GET_PERIOD_START_DATE_FUNC(	--GIC3772
	p_fca_period 			IN fiscal_calendars.fca_period%TYPE,
  p_fca_year 				IN fiscal_calendars.fca_year%TYPE
)
RETURN DATE;

FUNCTION GET_PERIOD_END_DATE_FUNC(	--GIC3772
	p_fca_period 			IN fiscal_calendars.fca_period%TYPE,
  p_fca_year 				IN fiscal_calendars.fca_year%TYPE
)
RETURN DATE;

PROCEDURE GET_BOTH_DATE_BY_KEY_PROC(
	p_fca_period 			IN fiscal_calendars.fca_period%TYPE,
  p_fca_year 				IN fiscal_calendars.fca_year%TYPE,
  p_fca_start_date	OUT fiscal_calendars.fca_start_date%TYPE,
  p_fca_end_date		OUT fiscal_calendars.fca_end_date%TYPE
);

PROCEDURE GET_YEAR_DATE_BY_YEAR_PROC(
	p_fca_year 				IN fiscal_calendars.fca_year%TYPE,
  p_year_start_date	OUT fiscal_calendars.fca_start_date%TYPE,
  p_year_end_date		OUT fiscal_calendars.fca_end_date%TYPE
);

PROCEDURE GET_YEAR_DATE_BY_DATE_PROC(
	p_date 						IN DATE,
  p_year_start_date	OUT fiscal_calendars.fca_start_date%TYPE,
  p_year_end_date		OUT fiscal_calendars.fca_end_date%TYPE
);

--trouver le pourcentage de l'année fiscale déjà passé  (basé sur la date en paramètre)
FUNCTION GET_PERCENT_YEAR_TO_DATE_FUNC(
	p_date 						IN DATE
)
RETURN NUMBER;

--trouver le pourcentage de l'année fiscale déjà passé  (basé sur la date en paramètre)
FUNCTION GET_PERCENT_YEAR_FOR_DATE_FUNC(
	p_year			IN NUMBER,	--année à analyser
	p_from_date	IN DATE,		--date de début de la période voulue
	p_to_date		IN DATE			--date de fin de la période voulue
)
RETURN NUMBER;

FUNCTION GET_NEXT_PERIOD_FUNC(
	p_fca_period 			IN fiscal_calendars.fca_period%TYPE,
  p_fca_year 				IN fiscal_calendars.fca_year%TYPE,
	p_next_fca_period OUT fiscal_calendars.fca_period%TYPE,
  p_next_fca_year 	OUT fiscal_calendars.fca_year%TYPE
)
RETURN BOOLEAN;

FUNCTION GET_PREV_PERIOD_FUNC(
	p_date IN DATE
)
RETURN NUMBER;

PROCEDURE GET_FISCAL_INFO_BY_DATE_PROC(
  p_date       IN DATE,
  p_fca_year   OUT fiscal_calendars.fca_year%TYPE,
  p_fca_period OUT fiscal_calendars.fca_period%TYPE
);

PROCEDURE GET_FISCAL_PREV_PERIOD_PROC(
  p_fca_period            IN  fiscal_calendars.fca_period%TYPE,
  p_fca_year              IN  fiscal_calendars.fca_year%TYPE,
  p_previous_fca_year     OUT fiscal_calendars.fca_year%TYPE,
  p_previous_fca_period   OUT fiscal_calendars.fca_period%TYPE
) ;

END FCA_PACK;
/