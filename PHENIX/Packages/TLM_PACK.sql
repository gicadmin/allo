CREATE OR REPLACE PACKAGE phenix.TLM_PACK AS


FUNCTION GET_KEY_FUNC
RETURN NUMBER;


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  transaction_by_lot_log_modifs%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_tlm_id                         IN         transaction_by_lot_log_modifs.tlm_id%TYPE,
  p_tlm_rec                        OUT NOCOPY transaction_by_lot_log_modifs%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_tlm_id                         IN         transaction_by_lot_log_modifs.tlm_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_tlm_id                         IN         transaction_by_lot_log_modifs.tlm_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_tlm_id                         IN         transaction_by_lot_log_modifs.tlm_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_tlm_id                         IN         transaction_by_lot_log_modifs.tlm_id%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_tlm_id                         IN         transaction_by_lot_log_modifs.tlm_id%TYPE);


FUNCTION INSERT_FUNC(
  p_tlm_tbl_id              IN         transaction_by_lot_log_modifs.tlm_tbl_id%TYPE,
  p_tlm_name_field          IN         transaction_by_lot_log_modifs.tlm_name_field%TYPE,
  p_tlm_modification_date   IN         transaction_by_lot_log_modifs.tlm_modification_date%TYPE,
  p_tlm_modification_source IN         transaction_by_lot_log_modifs.tlm_modification_source%TYPE,
  p_tlm_use_code            IN         transaction_by_lot_log_modifs.tlm_use_code%TYPE,
  p_tlm_before_modif        IN         transaction_by_lot_log_modifs.tlm_before_modif%TYPE             DEFAULT NULL,
  p_tlm_after_modif         IN         transaction_by_lot_log_modifs.tlm_after_modif%TYPE              DEFAULT NULL)
RETURN NUMBER;


FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY transaction_by_lot_log_modifs%ROWTYPE)
RETURN NUMBER;

END TLM_PACK;
/