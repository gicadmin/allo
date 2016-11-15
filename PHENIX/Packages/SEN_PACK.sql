CREATE OR REPLACE PACKAGE phenix.SEN_PACK IS

-----------------------------------------------------------------------------------------------
-- IMPORTANT: Ne pas regénérer le paquet pour avoir les fonctions / procédures standards
-- Les plus utiles ont été modifiés pour ramener les données sans regarder le code
-- On ne peut pas se servir du code de l'environnement (SEN CODE) pour ramener des données
-- car cette valeur change d'un environnement à l'autre (d'un client à l'autre)
-----------------------------------------------------------------------------------------------

FUNCTION GET_FULL_FUNC(
  p_sen_rec                        OUT NOCOPY system_environments%ROWTYPE)
RETURN BOOLEAN;

FUNCTION GET_NUMBER_COLUMN_FUNC(
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN NUMBER;

FUNCTION GET_VARCHAR_COLUMN_FUNC(
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

FUNCTION GET_VARCHAR_ALT_COLUMN_FUNC(
  p_column_name                    IN         VARCHAR2,
  p_alt_column_name                IN         VARCHAR2,
  p_language                       IN         VARCHAR2 DEFAULT 'F',
  p_raise                          IN         BOOLEAN  DEFAULT TRUE)
RETURN VARCHAR2;

-----------------------------------------------------------------------------------------------
-- Ajuster les fonctions / procédures ci-dessous afin de ne plus les utiliser au fil du temps
-- Les fonctions ci-haut doivent être considérées à la place
-----------------------------------------------------------------------------------------------

FUNCTION FIND_PARAMETER_VARCHAR_FUNC(
  p_parameter_name IN VARCHAR2
)
RETURN VARCHAR2;

FUNCTION FIND_PARAMETER_NUMBER_FUNC(
  p_parameter_name IN VARCHAR2
)
RETURN NUMBER;

END SEN_PACK;
/