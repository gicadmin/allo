CREATE OR REPLACE PACKAGE phenix.TRK_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  trucks%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_trk_code                       IN         trucks.trk_code%TYPE,
  p_trk_rec                        OUT NOCOPY trucks%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_trk_code                       IN         trucks.trk_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_trk_code                       IN         trucks.trk_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_trk_code                       IN         trucks.trk_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_trk_code                       IN         trucks.trk_code%TYPE);


PROCEDURE INSERT_PROC(
  p_trk_code                  IN         trucks.trk_code%TYPE,
  p_trk_length                IN         trucks.trk_length%TYPE,
  p_trk_max_thawing_weight    IN         trucks.trk_max_thawing_weight%TYPE,
  p_trk_maximum_volume        IN         trucks.trk_maximum_volume%TYPE,
  p_trk_maximum_weight        IN         trucks.trk_maximum_weight%TYPE,
  p_trk_refrigerated_switch   IN         trucks.trk_refrigerated_switch%TYPE,
  p_trk_floor_spaces          IN         trucks.trk_floor_spaces%TYPE,
  p_trk_use_code              IN         trucks.trk_use_code%TYPE                   DEFAULT NULL,
  p_trk_use_aide_code         IN         trucks.trk_use_aide_code%TYPE              DEFAULT NULL,
  p_trk_maximum_pallet_volume IN         trucks.trk_maximum_pallet_volume%TYPE      DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY trucks%ROWTYPE);


  --
-- Anciennes fonctions et procedure.
-- NE PLUS UTILISER ou a deplacer dans OPERATION_PACK
--
FUNCTION GET_FULL_TRK_FUNC(
	p_trk_code  		IN trucks.trk_code%TYPE,
	p_trk_record		OUT trucks%ROWTYPE
)
RETURN BOOLEAN;

FUNCTION GET_TRK_FLOOR_SPACE_FUNC(
	p_trk_code  		IN trucks.trk_code%TYPE
)
RETURN NUMBER;

PROCEDURE GET_TRK_USE_AND_AIDE_PROC(
	p_trk_code  				IN trucks.trk_code%TYPE,
	p_trk_use_code      OUT trucks.trk_use_code%TYPE,
	p_trk_use_aide_code	OUT trucks.trk_use_aide_code%TYPE
);

FUNCTION DO_TRK_EXISTS_FUNC(
  p_trk_code IN trucks.trk_code%TYPE
)
RETURN BOOLEAN;




















END TRK_PACK;
/