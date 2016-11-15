CREATE OR REPLACE PACKAGE phenix.TBS_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  tote_box_summaries%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_tbs_cus_code                   IN         tote_box_summaries.tbs_cus_code%TYPE,
  p_tbs_tot_code                   IN         tote_box_summaries.tbs_tot_code%TYPE,
  p_tbs_rec                        OUT NOCOPY tote_box_summaries%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_tbs_cus_code                   IN         tote_box_summaries.tbs_cus_code%TYPE,
  p_tbs_tot_code                   IN         tote_box_summaries.tbs_tot_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_tbs_cus_code                   IN         tote_box_summaries.tbs_cus_code%TYPE,
  p_tbs_tot_code                   IN         tote_box_summaries.tbs_tot_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_tbs_cus_code                   IN         tote_box_summaries.tbs_cus_code%TYPE,
  p_tbs_tot_code                   IN         tote_box_summaries.tbs_tot_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_tbs_cus_code                   IN         tote_box_summaries.tbs_cus_code%TYPE,
  p_tbs_tot_code                   IN         tote_box_summaries.tbs_tot_code%TYPE)
RETURN NUMBER;


PROCEDURE INSERT_PROC(
  p_tbs_cus_code              IN         tote_box_summaries.tbs_cus_code%TYPE,
  p_tbs_tot_code              IN         tote_box_summaries.tbs_tot_code%TYPE,
  p_tbs_quantity_in           IN         tote_box_summaries.tbs_quantity_in%TYPE,
  p_tbs_quantity_out          IN         tote_box_summaries.tbs_quantity_out%TYPE,
  p_tbs_last_transaction_date IN         tote_box_summaries.tbs_last_transaction_date%TYPE      DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY tote_box_summaries%ROWTYPE);

END TBS_PACK;
/