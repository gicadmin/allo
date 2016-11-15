CREATE OR REPLACE PACKAGE phenix.TRU_PACK IS

PROCEDURE PURGE_PROC(
  p_tru_trh_id  IN transfer_users.tru_trh_id%TYPE
);

PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  transfer_users%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_tru_use_code                   IN         transfer_users.tru_use_code%TYPE,
  p_tru_trh_id                     IN         transfer_users.tru_trh_id%TYPE,
  p_tru_rec                        OUT NOCOPY transfer_users%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_tru_use_code                   IN         transfer_users.tru_use_code%TYPE,
  p_tru_trh_id                     IN         transfer_users.tru_trh_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION DELETE_FUNC(
  p_tru_use_code                   IN         transfer_users.tru_use_code%TYPE,
  p_tru_trh_id                     IN         transfer_users.tru_trh_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_tru_use_code                   IN         transfer_users.tru_use_code%TYPE,
  p_tru_trh_id                     IN         transfer_users.tru_trh_id%TYPE);


PROCEDURE INSERT_PROC(
  p_tru_use_code         IN         transfer_users.tru_use_code%TYPE,
  p_tru_trh_id           IN         transfer_users.tru_trh_id%TYPE);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY transfer_users%ROWTYPE);


END TRU_PACK;
/