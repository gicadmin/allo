CREATE OR REPLACE PACKAGE phenix.AMES_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  application_messages%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_ames_id                        IN         application_messages.ames_id%TYPE,
  p_ames_rec                       OUT NOCOPY application_messages%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_ames_id                        IN         application_messages.ames_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_ames_id                        IN         application_messages.ames_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_ames_id                        IN         application_messages.ames_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_ames_id                        IN         application_messages.ames_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_ames_id                        IN         application_messages.ames_id%TYPE);


FUNCTION INSERT_FUNC(
  p_ames_start_date        IN         application_messages.ames_start_date%TYPE,
  p_ames_end_date          IN         application_messages.ames_end_date%TYPE,
  p_ames_status            IN         application_messages.ames_status%TYPE                 DEFAULT 'ACTIVE'              ,
  p_ames_type              IN         application_messages.ames_type%TYPE                   DEFAULT 'SYS_BLK'             ,
  p_ames_source            IN         application_messages.ames_source%TYPE                 DEFAULT 'WEB'                 ,
  p_ames_creation_date     IN         application_messages.ames_creation_date%TYPE          DEFAULT sysdate               ,
  p_ames_modification_date IN         application_messages.ames_modification_date%TYPE      DEFAULT sysdate               )
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY application_messages%ROWTYPE)
RETURN NUMBER;

END AMES_PACK;
/