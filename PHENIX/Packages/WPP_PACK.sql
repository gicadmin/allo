CREATE OR REPLACE PACKAGE phenix.WPP_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  warehouse_pallet_programs%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_wpp_program_code               IN         warehouse_pallet_programs.wpp_program_code%TYPE,
  p_wpp_whs_code                   IN         warehouse_pallet_programs.wpp_whs_code%TYPE,
  p_wpp_rec                        OUT NOCOPY warehouse_pallet_programs%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_wpp_program_code               IN         warehouse_pallet_programs.wpp_program_code%TYPE,
  p_wpp_whs_code                   IN         warehouse_pallet_programs.wpp_whs_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_wpp_program_code               IN         warehouse_pallet_programs.wpp_program_code%TYPE,
  p_wpp_whs_code                   IN         warehouse_pallet_programs.wpp_whs_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_wpp_program_code               IN         warehouse_pallet_programs.wpp_program_code%TYPE,
  p_wpp_whs_code                   IN         warehouse_pallet_programs.wpp_whs_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_wpp_program_code               IN         warehouse_pallet_programs.wpp_program_code%TYPE,
  p_wpp_whs_code                   IN         warehouse_pallet_programs.wpp_whs_code%TYPE);


PROCEDURE INSERT_PROC(
  p_wpp_whs_code         IN         warehouse_pallet_programs.wpp_whs_code%TYPE,
  p_wpp_program_code     IN         warehouse_pallet_programs.wpp_program_code%TYPE,
  p_wpp_pal_code         IN         warehouse_pallet_programs.wpp_pal_code%TYPE              DEFAULT NULL,
  p_wpp_global_number    IN         warehouse_pallet_programs.wpp_global_number%TYPE         DEFAULT NULL,
  p_wpp_customer_number  IN         warehouse_pallet_programs.wpp_customer_number%TYPE       DEFAULT NULL,
  p_wpp_sequence         IN         warehouse_pallet_programs.wpp_sequence%TYPE              DEFAULT 0 );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY warehouse_pallet_programs%ROWTYPE);

END WPP_PACK;
/