CREATE OR REPLACE PACKAGE phenix.FCA_OPERATION_PACK AS

PROCEDURE GET_NEXT_FCA_PROC(
  p_fca_year      OUT fiscal_calendars.fca_year%TYPE,
  p_fca_end_date  OUT fiscal_calendars.fca_end_date%TYPE
);

FUNCTION GET_COUNT_DESTINCT_YEARS_FUNC
RETURN NUMBER;

FUNCTION GET_MAX_FCA_YEARS_FUNC
RETURN NUMBER;

PROCEDURE INSERT_FISCAL_YEAR_PROC(
  p_year                 IN NUMBER,
  p_end_date_first_week  IN DATE,
  p_start_period         IN DATE,
  p_end_period           IN DATE
);

PROCEDURE DELETE_FCA_PER_YEAR_PROC(
  p_fca_year IN fiscal_calendars.fca_year%TYPE);

FUNCTION GET_FULL_INFO_BY_DATE_FUNC(
  p_date        IN DATE,
  p_fca_record  OUT fiscal_calendars%ROWTYPE
)
RETURN BOOLEAN;

END FCA_OPERATION_PACK;
/