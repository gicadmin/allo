CREATE OR REPLACE PACKAGE phenix.CIU_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  cubiscan_interface_updates%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_ciu_prf_prd_code               IN         cubiscan_interface_updates.ciu_prf_prd_code%TYPE,
  p_ciu_prf_fmt_code               IN         cubiscan_interface_updates.ciu_prf_fmt_code%TYPE,
  p_ciu_rec                        OUT NOCOPY cubiscan_interface_updates%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_ciu_prf_prd_code               IN         cubiscan_interface_updates.ciu_prf_prd_code%TYPE,
  p_ciu_prf_fmt_code               IN         cubiscan_interface_updates.ciu_prf_fmt_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_ciu_prf_prd_code               IN         cubiscan_interface_updates.ciu_prf_prd_code%TYPE,
  p_ciu_prf_fmt_code               IN         cubiscan_interface_updates.ciu_prf_fmt_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_ciu_prf_prd_code               IN         cubiscan_interface_updates.ciu_prf_prd_code%TYPE,
  p_ciu_prf_fmt_code               IN         cubiscan_interface_updates.ciu_prf_fmt_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_ciu_prf_prd_code               IN         cubiscan_interface_updates.ciu_prf_prd_code%TYPE,
  p_ciu_prf_fmt_code               IN         cubiscan_interface_updates.ciu_prf_fmt_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_ciu_prf_prd_code               IN         cubiscan_interface_updates.ciu_prf_prd_code%TYPE,
  p_ciu_prf_fmt_code               IN         cubiscan_interface_updates.ciu_prf_fmt_code%TYPE);


PROCEDURE INSERT_PROC(
  p_ciu_prf_prd_code               IN         cubiscan_interface_updates.ciu_prf_prd_code%TYPE,
  p_ciu_prf_fmt_code               IN         cubiscan_interface_updates.ciu_prf_fmt_code%TYPE,
  p_ciu_prf_height                 IN         cubiscan_interface_updates.ciu_prf_height%TYPE,
  p_ciu_prf_width                  IN         cubiscan_interface_updates.ciu_prf_width%TYPE,
  p_ciu_prf_length                 IN         cubiscan_interface_updates.ciu_prf_length%TYPE,
  p_ciu_prf_purchase_weight        IN         cubiscan_interface_updates.ciu_prf_purchase_weight%TYPE,
  p_ciu_prf_upc_code               IN         cubiscan_interface_updates.ciu_prf_upc_code%TYPE                    DEFAULT NULL,
  p_ciu_loc_code                   IN         cubiscan_interface_updates.ciu_loc_code%TYPE                        DEFAULT NULL,
  p_ciu_attribute_last_update_da   IN         cubiscan_interface_updates.ciu_attribute_last_update_date%TYPE      DEFAULT SYSDATE );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY cubiscan_interface_updates%ROWTYPE);

END CIU_PACK;
/