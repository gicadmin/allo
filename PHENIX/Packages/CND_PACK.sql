CREATE OR REPLACE PACKAGE phenix.CND_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  consignment_details%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_cnd_prf_prd_code               IN         consignment_details.cnd_prf_prd_code%TYPE,
  p_cnd_prf_fmt_code               IN         consignment_details.cnd_prf_fmt_code%TYPE,
  p_cnd_cns_code                   IN         consignment_details.cnd_cns_code%TYPE,
  p_cnd_prv_code                   IN         consignment_details.cnd_prv_code%TYPE,
  p_cnd_rec                        OUT NOCOPY consignment_details%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_cnd_prf_prd_code               IN         consignment_details.cnd_prf_prd_code%TYPE,
  p_cnd_prf_fmt_code               IN         consignment_details.cnd_prf_fmt_code%TYPE,
  p_cnd_cns_code                   IN         consignment_details.cnd_cns_code%TYPE,
  p_cnd_prv_code                   IN         consignment_details.cnd_prv_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_cnd_prf_prd_code               IN         consignment_details.cnd_prf_prd_code%TYPE,
  p_cnd_prf_fmt_code               IN         consignment_details.cnd_prf_fmt_code%TYPE,
  p_cnd_cns_code                   IN         consignment_details.cnd_cns_code%TYPE,
  p_cnd_prv_code                   IN         consignment_details.cnd_prv_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_cnd_prf_prd_code               IN         consignment_details.cnd_prf_prd_code%TYPE,
  p_cnd_prf_fmt_code               IN         consignment_details.cnd_prf_fmt_code%TYPE,
  p_cnd_cns_code                   IN         consignment_details.cnd_cns_code%TYPE,
  p_cnd_prv_code                   IN         consignment_details.cnd_prv_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_cnd_prf_prd_code               IN         consignment_details.cnd_prf_prd_code%TYPE,
  p_cnd_prf_fmt_code               IN         consignment_details.cnd_prf_fmt_code%TYPE,
  p_cnd_cns_code                   IN         consignment_details.cnd_cns_code%TYPE,
  p_cnd_prv_code                   IN         consignment_details.cnd_prv_code%TYPE);

FUNCTION GET_FULL_FUNC(
  p_cnd_cns_code                   IN         consignment_details.cnd_cns_code%TYPE,
  p_cnd_prv_code                   IN         consignment_details.cnd_prv_code%TYPE,
  p_cnd_sequence                   IN         consignment_details.cnd_sequence%TYPE,
  p_cnd_rec                        OUT NOCOPY consignment_details%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_cnd_cns_code                   IN         consignment_details.cnd_cns_code%TYPE,
  p_cnd_prv_code                   IN         consignment_details.cnd_prv_code%TYPE,
  p_cnd_sequence                   IN         consignment_details.cnd_sequence%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_cnd_cns_code                   IN         consignment_details.cnd_cns_code%TYPE,
  p_cnd_prv_code                   IN         consignment_details.cnd_prv_code%TYPE,
  p_cnd_sequence                   IN         consignment_details.cnd_sequence%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_cnd_cns_code                   IN         consignment_details.cnd_cns_code%TYPE,
  p_cnd_prv_code                   IN         consignment_details.cnd_prv_code%TYPE,
  p_cnd_sequence                   IN         consignment_details.cnd_sequence%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_cnd_cns_code                   IN         consignment_details.cnd_cns_code%TYPE,
  p_cnd_prv_code                   IN         consignment_details.cnd_prv_code%TYPE,
  p_cnd_sequence                   IN         consignment_details.cnd_sequence%TYPE);


PROCEDURE INSERT_PROC(
  p_cnd_cns_code         IN         consignment_details.cnd_cns_code%TYPE,
  p_cnd_prf_prd_code     IN         consignment_details.cnd_prf_prd_code%TYPE,
  p_cnd_prf_fmt_code     IN         consignment_details.cnd_prf_fmt_code%TYPE,
  p_cnd_sequence         IN         consignment_details.cnd_sequence%TYPE,
  p_cnd_prv_code         IN         consignment_details.cnd_prv_code%TYPE);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY consignment_details%ROWTYPE);

END CND_PACK;
/