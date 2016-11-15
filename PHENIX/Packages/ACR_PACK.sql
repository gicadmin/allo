CREATE OR REPLACE PACKAGE phenix.ACR_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  action_required%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_acr_id                         IN         action_required.acr_id%TYPE,
  p_acr_rec                        OUT NOCOPY action_required%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_acr_id                         IN         action_required.acr_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_acr_id                         IN         action_required.acr_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_acr_id                         IN         action_required.acr_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_acr_id                         IN         action_required.acr_id%TYPE)
RETURN NUMBER;

FUNCTION GET_FULL_FUNC(
  p_acr_source                     IN         action_required.acr_source%TYPE,
  p_acr_source_id                  IN         action_required.acr_source_id%TYPE,
  p_acr_action                     IN         action_required.acr_action%TYPE,
  p_acr_rec                        OUT NOCOPY action_required%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_acr_source                     IN         action_required.acr_source%TYPE,
  p_acr_source_id                  IN         action_required.acr_source_id%TYPE,
  p_acr_action                     IN         action_required.acr_action%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_acr_source                     IN         action_required.acr_source%TYPE,
  p_acr_source_id                  IN         action_required.acr_source_id%TYPE,
  p_acr_action                     IN         action_required.acr_action%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_acr_source                     IN         action_required.acr_source%TYPE,
  p_acr_source_id                  IN         action_required.acr_source_id%TYPE,
  p_acr_action                     IN         action_required.acr_action%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_acr_source                     IN         action_required.acr_source%TYPE,
  p_acr_source_id                  IN         action_required.acr_source_id%TYPE,
  p_acr_action                     IN         action_required.acr_action%TYPE)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_acr_source           IN         action_required.acr_source%TYPE,
  p_acr_source_id        IN         action_required.acr_source_id%TYPE,
  p_acr_action           IN         action_required.acr_action%TYPE,
  p_acr_status           IN         action_required.acr_status%TYPE,
  p_acr_reserved_code    IN         action_required.acr_reserved_code%TYPE,
  p_acr_last_changed     IN         action_required.acr_last_changed%TYPE          DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY action_required%ROWTYPE)
RETURN NUMBER;

END ACR_PACK;
/