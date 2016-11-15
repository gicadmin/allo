CREATE OR REPLACE PACKAGE phenix.BCN_OPERATION_PACK AS

FUNCTION GET_NEXT_START_POSITION_FUNC(
  p_bcn_bct_code IN barcode_nomenclatures.bcn_bct_code%TYPE,
  p_bcn_id       IN barcode_nomenclatures.bcn_id%TYPE DEFAULT NULL
)
RETURN NUMBER;

FUNCTION IS_START_POSITION_EXISTS_FUNC(
  p_bcn_bct_code       IN barcode_nomenclatures.bcn_bct_code%TYPE,
  p_bcn_start_position IN barcode_nomenclatures.bcn_start_position%TYPE,
  p_bcn_id             IN barcode_nomenclatures.bcn_id%TYPE
)
RETURN BOOLEAN;

FUNCTION GET_START_POSITION_FUNC(
  p_bcn_start_position IN barcode_nomenclatures.bcn_start_position%TYPE,
  p_bcn_ai             IN barcode_nomenclatures.bcn_ai%TYPE,
  p_bcn_nb_decimal     IN barcode_nomenclatures.bcn_nb_decimal%TYPE
)
RETURN NUMBER;

FUNCTION IS_POSITION_ALREADY_USED_FUNC(
  p_bcn_bct_code       IN barcode_nomenclatures.bcn_bct_code%TYPE,
  p_bcn_start_position IN barcode_nomenclatures.bcn_start_position%TYPE,
  p_bcn_length         IN barcode_nomenclatures.bcn_length%TYPE,
  p_bcn_id             IN barcode_nomenclatures.bcn_id%TYPE
)
RETURN BOOLEAN;

FUNCTION EXISTS_HOLE_IN_BARCODE_FUNC(
  p_bcn_bct_code       IN barcode_nomenclatures.bcn_bct_code%TYPE,
  p_bcn_id             IN barcode_nomenclatures.bcn_id%TYPE,
  p_bcn_start_position IN barcode_nomenclatures.bcn_start_position%TYPE,
  p_bcn_length         IN barcode_nomenclatures.bcn_length%TYPE,
  p_last_component     IN BOOLEAN DEFAULT FALSE
)
RETURN BOOLEAN;

END BCN_OPERATION_PACK;
/