CREATE OR REPLACE PACKAGE phenix.RME_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  report_merge%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_rme_id                         IN         report_merge.rme_id%TYPE,
  p_rme_seq                        IN         report_merge.rme_seq%TYPE,
  p_rme_rec                        OUT NOCOPY report_merge%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_rme_id                         IN         report_merge.rme_id%TYPE,
  p_rme_seq                        IN         report_merge.rme_seq%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_rme_id                         IN         report_merge.rme_id%TYPE,
  p_rme_seq                        IN         report_merge.rme_seq%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_rme_id                         IN         report_merge.rme_id%TYPE,
  p_rme_seq                        IN         report_merge.rme_seq%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_rme_id                         IN         report_merge.rme_id%TYPE,
  p_rme_seq                        IN         report_merge.rme_seq%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_rme_id                         IN         report_merge.rme_id%TYPE,
  p_rme_seq                        IN         report_merge.rme_seq%TYPE);


PROCEDURE INSERT_PROC(
  p_rme_id                  IN         report_merge.rme_id%TYPE,
  p_rme_seq                 IN         report_merge.rme_seq%TYPE,
  p_rme_whs_code            IN         report_merge.rme_whs_code%TYPE,
  p_rme_report_name         IN         report_merge.rme_report_name%TYPE,
  p_rme_report_path         IN         report_merge.rme_report_path%TYPE,
  p_rme_route_code          IN         report_merge.rme_route_code%TYPE               DEFAULT NULL,
  p_rme_route_date          IN         report_merge.rme_route_date%TYPE               DEFAULT NULL,
  p_rme_cus_code            IN         report_merge.rme_cus_code%TYPE                 DEFAULT NULL,
  p_rme_included_switch     IN         report_merge.rme_included_switch%TYPE          DEFAULT 1,
  p_rme_print_status_switch IN         report_merge.rme_print_status_switch%TYPE      DEFAULT 0 ,
  p_rme_nb_copies           IN         report_merge.rme_nb_copies%TYPE                DEFAULT 1 ,
  p_rme_creation_date       IN         report_merge.rme_creation_date%TYPE            DEFAULT SYSDATE ,
  p_rme_modif_date          IN         report_merge.rme_modif_date%TYPE               DEFAULT SYSDATE);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY report_merge%ROWTYPE);

END RME_PACK;
/