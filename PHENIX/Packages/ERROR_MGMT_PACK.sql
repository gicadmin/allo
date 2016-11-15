CREATE OR REPLACE PACKAGE phenix.ERROR_MGMT_PACK IS

  application_error     EXCEPTION;
  pragma exception_init (application_error, -20001);

  foreign_key_error     EXCEPTION;
  pragma exception_init (foreign_key_error, -02292);

-- ---------------------------------------------------------------------
-- La fonction generique qui obtient le code identifiant le package
-- ---------------------------------------------------------------------
FUNCTION GET_SHORT_NAME RETURN VARCHAR2;

-- ---------------------------------------------------------------------
-- La fonction obtient le code qui sera leve (envoye) par le
-- RAISE_APPLICATION_ERROR.
-- ---------------------------------------------------------------------
FUNCTION GET_APP_ERROR_NUMBER
  RETURN INTEGER;

-- ---------------------------------------------------------------------
-- La fonction obtient le code qui sera leve (envoye) par le
-- RAISE_APPLICATION_ERROR.
-- ---------------------------------------------------------------------
FUNCTION GET_APP_INFO_NUMBER
  RETURN INTEGER;

-- ---------------------------------------------------------------------
-- La procedure qui levera une exception applicative.
-- ---------------------------------------------------------------------
PROCEDURE RAISE_ERROR(
  p_prefix            IN VARCHAR2,
  p_code              IN NUMBER,
  p_message           IN VARCHAR2,
  p_log_level         IN NUMBER DEFAULT 2
);

-- ---------------------------------------------------------------------
-- La procedure qui levera une exception applicative pour une cle unique
-- afin de simuler un DUP_VAL_ON_INDEX.
-- ---------------------------------------------------------------------
PROCEDURE RAISE_UNIQUE_KEY(
  p_uk_cons_name      IN VARCHAR2
);

-- --------------------------------------------------------------------------------
-- La procedure qui levera une exception applicative pour une cle de verification
-- afin de simuler une vérification de la contrainte
-- --------------------------------------------------------------------------------
PROCEDURE RAISE_CHECK_KEY(
  p_ck_cons_name      IN VARCHAR2
);

-- --------------------------------------------------------------------------------
-- La procedure qui levera une exception applicative pour une cle etrangere
-- afin de simuler une vérification de la contrainte
-- --------------------------------------------------------------------------------
PROCEDURE RAISE_FOREIGN_KEY(
  p_fk_cons_name      IN VARCHAR2
);

-- ---------------------------------------------------------------------
-- La procedure qui levera une exception applicative informative.
-- ---------------------------------------------------------------------
PROCEDURE RAISE_INFO(
  p_prefix            IN VARCHAR2,
  p_code              IN NUMBER,
  p_message           IN VARCHAR2
);

-- ---------------------------------------------------------------------
-- La procedure qui levera une exception a partir d'un SQLERRM
-- ---------------------------------------------------------------------
PROCEDURE RERAISE_ERROR(
  p_sqlerrm           IN VARCHAR2
);

-- ----------------------------------------------------------------------
-- Obtenir le code d'erreur applicatif passe au RAISE_ERROR originalement
-- par les parametres "p_prefix" et "p_code" a partir du SQLERRM. Elle
-- retournera la concatenation des deux separe par un "-".
-- ----------------------------------------------------------------------
FUNCTION EXTRACT_ERROR_CODE(
  p_sqlerrm           IN VARCHAR2
) RETURN VARCHAR2;

-- ----------------------------------------------------------------------
-- Obtenir le prefix applicatif passe au RAISE_ERROR originalement
-- par le parametre "p_prefix" a partir du SQLERRM.
-- ----------------------------------------------------------------------
FUNCTION EXTRACT_ERROR_PREFIX(
  p_sqlerrm           IN VARCHAR2
) RETURN VARCHAR2;

-- ----------------------------------------------------------------------
-- Obtenir le numero d'erreur applicatif passe au RAISE_ERROR
-- originalement par le parametre "p_code" a partir du SQLERRM.
-- ----------------------------------------------------------------------
FUNCTION EXTRACT_ERROR_NUMBER(
  p_sqlerrm           IN VARCHAR2
) RETURN NUMBER;

-- ----------------------------------------------------------------------
-- Obtenir le message d'erreur applicatif passe au RAISE_ERROR
-- originalement par le parametre "p_message" a partir du SQLERRM.
-- ----------------------------------------------------------------------
FUNCTION EXTRACT_ERROR_MESSAGE(
  p_sqlerrm           IN VARCHAR2
) RETURN VARCHAR2;

-- ----------------------------------------------------------------------
-- Obtenir le message d'erreur applicatif passe au RAISE_ERROR
-- originalement par les parametres a partir du SQLERRM. Le message aura
-- la forme "prefix"-"code":"message".
-- ----------------------------------------------------------------------
FUNCTION EXTRACT_FULL_ERROR_MESSAGE(
  p_sqlerrm           IN VARCHAR2
) RETURN VARCHAR2;

-- ----------------------------------------------------------------------
-- Determiner si le code SQL Oracle passe en parametre est celui genere
-- par ce package ou si c'est une autre erreure.Peu importe la fonction
-- de raise utilisee (RAISE_ERROR ou RAISE_INFO), cette fonction dira
-- OUI.
-- ----------------------------------------------------------------------
FUNCTION IS_APPLICATION_ERROR(
  p_sqlcode           IN NUMBER
) RETURN BOOLEAN;

-- ----------------------------------------------------------------------
-- Determiner si le code SQL Oracle passe en parametre est celui genere
-- par ce package par l'entremise de la procedure RAISE_INFO specifiquement
-- ou si c'est une autre erreure.
-- ----------------------------------------------------------------------
FUNCTION IS_APPLICATION_INFO(
  p_sqlcode           IN NUMBER
) RETURN BOOLEAN;

FUNCTION EXTRACT_ORACLE_ERROR_CODE(
  p_sqlerrm           IN VARCHAR2
) RETURN VARCHAR2;

FUNCTION EXTRACT_CONSTRAINT_NAME(
  p_sqlerrm           IN VARCHAR2
) RETURN VARCHAR2;

FUNCTION FIND_CALLER(
  p_offset              IN NUMBER DEFAULT 1
) RETURN VARCHAR2;

FUNCTION GET_XLATED_FULL_MESSAGE_FUNC(
  p_sqlerrm                   VARCHAR2,
  p_code_lang                 VARCHAR2)
  RETURN VARCHAR2;

FUNCTION GET_XLATED_MESSAGE_FUNC(
  p_sqlerrm                   VARCHAR2,
  p_code_lang                 VARCHAR2)
  RETURN VARCHAR2;

FUNCTION GET_APPLICATION_MESSAGE_FUNC(
  p_error_code          IN  NUMBER,
  p_error_text          IN  VARCHAR2,
  p_language            IN  VARCHAR2,
  p_extract_error_code  OUT VARCHAR2
)
RETURN VARCHAR2;

FUNCTION GET_MESSAGE_LANG_FUNC(
  p_error_code  IN  VARCHAR,
  p_language    IN  VARCHAR2 DEFAULT 'fr-CA',
  p_parameters  IN  VARCHAR2 DEFAULT NULL
)
RETURN VARCHAR2;

PROCEDURE RERAISE_CONSTRAINT_ERROR_PROC(
  p_sqlerrm IN VARCHAR2
);

END ERROR_MGMT_PACK;
/