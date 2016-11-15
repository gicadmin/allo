CREATE OR REPLACE PACKAGE phenix.SCH_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  schedules%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_sch_code                       IN         schedules.sch_code%TYPE,
  p_sch_rec                        OUT NOCOPY schedules%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_sch_code                       IN         schedules.sch_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_sch_code                       IN         schedules.sch_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_sch_code                       IN         schedules.sch_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_sch_code                       IN         schedules.sch_code%TYPE)
RETURN NUMBER;


PROCEDURE INSERT_PROC(
  p_sch_code             IN         schedules.sch_code%TYPE,
  p_sch_use_code         IN         schedules.sch_use_code%TYPE,
  p_sch_description      IN         schedules.sch_description%TYPE,
  p_sch_day              IN         schedules.sch_day%TYPE,
  p_sch_type             IN         schedules.sch_type%TYPE,
  p_sch_week             IN         schedules.sch_week%TYPE,
  p_sch_alt_description  IN         schedules.sch_alt_description%TYPE);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY schedules%ROWTYPE);

END SCH_PACK;
/