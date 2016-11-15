CREATE OR REPLACE PACKAGE phenix.FCW_OPERATION_PACK AS

PROCEDURE BUILD_DAYS_FOR_WEEK_PROC(
  p_fcw_fca_year      IN fiscal_calendar_weeks.fcw_fca_year%TYPE,
  p_fcw_fca_period    IN fiscal_calendar_weeks.fcw_fca_period%TYPE,
  p_fcw_week          IN fiscal_calendar_weeks.fcw_week%TYPE,
  p_fcw_start_date    IN fiscal_calendar_weeks.fcw_start_date%TYPE,
  p_fcw_end_date      IN fiscal_calendar_weeks.fcw_end_date%TYPE
);

FUNCTION GET_FULL_INFO_BY_DATE_FUNC(
  p_date        IN DATE,
  p_fcw_record  OUT fiscal_calendar_weeks%ROWTYPE
)
RETURN BOOLEAN;

END FCW_OPERATION_PACK;
/