CREATE OR REPLACE PACKAGE phenix.LOC_PACK IS

PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  locations%ROWTYPE);

FUNCTION GET_FULL_FUNC(
  p_loc_code                       IN         locations.loc_code%TYPE,
  p_loc_rec                        OUT NOCOPY locations%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_DATE_COLUMN_FUNC(
  p_loc_code                       IN         locations.loc_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN DATE;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_loc_code                       IN         locations.loc_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_loc_code                       IN         locations.loc_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_loc_code                       IN         locations.loc_code%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION DELETE_FUNC(
  p_loc_code                       IN         locations.loc_code%TYPE)
RETURN NUMBER;

PROCEDURE CHECK_DEPENDENCIES_PROC(
  p_loc_code                       IN         locations.loc_code%TYPE);


PROCEDURE INSERT_PROC(
  p_loc_code                 IN         locations.loc_code%TYPE,
  p_loc_lty_code             IN         locations.loc_lty_code%TYPE,
  p_loc_depth                IN         locations.loc_depth%TYPE,
  p_loc_width                IN         locations.loc_width%TYPE,
  p_loc_height               IN         locations.loc_height%TYPE,
  p_loc_hold_switch          IN         locations.loc_hold_switch%TYPE,
  p_loc_alt_code             IN         locations.loc_alt_code%TYPE                  DEFAULT NULL,
  p_loc_validation_code      IN         locations.loc_validation_code%TYPE           DEFAULT NULL,
  p_loc_last_count_date      IN         locations.loc_last_count_date%TYPE           DEFAULT NULL,
  p_loc_door_validation_code IN         locations.loc_door_validation_code%TYPE      DEFAULT NULL,
  p_loc_rac_code             IN         locations.loc_rac_code%TYPE                  DEFAULT NULL,
  p_loc_pof_code             IN         locations.loc_pof_code%TYPE                  DEFAULT NULL,
  p_loc_order                IN         locations.loc_order%TYPE                     DEFAULT NULL,
  p_loc_direction_up_switch  IN         locations.loc_direction_up_switch%TYPE       DEFAULT 1 ,
  p_loc_position_skip_switch IN         locations.loc_position_skip_switch%TYPE      DEFAULT 0 );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY locations%ROWTYPE);

-----------------------------------------------------------------------------------------------
-- Ajuster les fonctions / procédures ci-dessous afin de ne plus les utiliser au fil du temps
-- Les fonctions ci-haut doivent être considérées à la place
-- Déplacer les traitements dans un package OPERATION au besoin
-----------------------------------------------------------------------------------------------

FUNCTION LOCK_LOC_FUNC(
  p_loc_code      IN locations.loc_code%TYPE
)
RETURN BOOLEAN;

PROCEDURE INSERT_LOC_PROC(
  p_loc_code                  IN locations.loc_code%TYPE,
  p_loc_lty_code              IN locations.loc_lty_code%TYPE,
  p_loc_depth                 IN locations.loc_depth%TYPE,
  p_loc_width                 IN locations.loc_width%TYPE,
  p_loc_height                IN locations.loc_height%TYPE,
  p_loc_hold_switch           IN locations.loc_hold_switch%TYPE,
  p_loc_rac_code              IN locations.loc_rac_code%TYPE,
  p_loc_pof_code              IN locations.loc_pof_code%TYPE,
  p_loc_order                 IN locations.loc_order%TYPE,
  p_loc_alt_code              IN locations.loc_alt_code%TYPE              DEFAULT NULL,
  p_loc_validation_code       IN locations.loc_validation_code%TYPE       DEFAULT NULL,
  p_loc_last_count_date       IN locations.loc_last_count_date%TYPE       DEFAULT NULL,
  p_loc_door_validation_code  IN locations.loc_door_validation_code%TYPE  DEFAULT NULL,
  p_loc_direction_up_switch   IN locations.loc_direction_up_switch%TYPE   DEFAULT 1,
  p_loc_position_skip_switch  IN locations.loc_position_skip_switch%TYPE  DEFAULT 0 --GIC3383 --IN NUMBER DEFAULT 0 --BER2751
);

FUNCTION FORMAT_USE_LOC_CODE_FUNC(
  p_use_code IN NUMBER
)
RETURN VARCHAR2;

FUNCTION ASK_IF_LOC_IS_EMPTY_FUNC(   --GIC1797
  p_pmd_id            IN      NUMBER,
  p_language_flag     IN      VARCHAR2,
  p_vocal_switch      IN      NUMBER,
  p_empty_loc_switch  OUT     NUMBER,
  p_error_code        OUT     NUMBER,
  p_error_message     OUT     VARCHAR2
)
RETURN PLS_INTEGER;

END LOC_PACK;
/