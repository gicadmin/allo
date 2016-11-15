CREATE OR REPLACE PACKAGE phenix.FCD_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  fiscal_calendar_days%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_fcd_date                       IN         fiscal_calendar_days.fcd_date%TYPE,
  p_fcd_rec                        OUT NOCOPY fiscal_calendar_days%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_fcd_date                       IN         fiscal_calendar_days.fcd_date%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_fcd_date                       IN         fiscal_calendar_days.fcd_date%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION DELETE_FUNC(
  p_fcd_date                       IN         fiscal_calendar_days.fcd_date%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_fcd_date                       IN         fiscal_calendar_days.fcd_date%TYPE);


PROCEDURE INSERT_PROC(
  p_fcd_date                       IN         fiscal_calendar_days.fcd_date%TYPE,
  p_fcd_fcw_fca_year               IN         fiscal_calendar_days.fcd_fcw_fca_year%TYPE,
  p_fcd_fcw_fca_period             IN         fiscal_calendar_days.fcd_fcw_fca_period%TYPE,
  p_fcd_fcw_week                   IN         fiscal_calendar_days.fcd_fcw_week%TYPE,
  p_fcd_corresponding_vpc_pcy_da   IN         fiscal_calendar_days.fcd_corresponding_vpc_pcy_day%TYPE,
  p_fcd_corresponding_vpc_pcy_we   IN         fiscal_calendar_days.fcd_corresponding_vpc_pcy_week%TYPE,
  p_fcd_holiday_switch             IN         fiscal_calendar_days.fcd_holiday_switch%TYPE                  DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY fiscal_calendar_days%ROWTYPE);

END FCD_PACK;
/