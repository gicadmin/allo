CREATE OR REPLACE PACKAGE phenix.GENERIC_PACK IS

FUNCTION GET_DAY_FUNC(
  p_ctr_start_day IN NUMBER, --Doit Ãªtre CTR_WEEK_START_DAY pour un bon fonctionnement
  p_date          IN DATE
)
RETURN NUMBER;

FUNCTION GET_DAY_CHAR_FUNC(
  p_day       IN NUMBER,
  p_language  IN VARCHAR2 DEFAULT 'FR'
)
RETURN VARCHAR2;

FUNCTION GET_DAY_CHAR_VIA_CTR_FUNC(
  p_day       IN NUMBER,
  p_language  IN VARCHAR2 DEFAULT 'FR'
)
RETURN VARCHAR2;

FUNCTION ARE_DATES_OVERLAPPING_FUNC(
  p_date_from   IN DATE,
  p_date_to     IN DATE,
  p_check_from  IN DATE,
  p_check_to    IN DATE
)
RETURN NUMBER;

/* encore appellÃƒÆ’Ã‚Â© par:
  - appellÃƒÆ’Ã‚Â© seulement par PGSPHX dans Eclipse (java)
*/
FUNCTION GET_DELIVERY_DATES_FUNC (  --ajoutÃ©e par Rostom
  cpr_id        IN NUMBER,
  nbr_of_dates  IN NUMBER
)
RETURN VARCHAR2;

FUNCTION SUBSTR_LAST_FUNC(  --fonction crÃ©ee par Emiliano
  p_char  IN VARCHAR2,
  p_width IN NUMBER
)
RETURN VARCHAR2;

FUNCTION IS_A_LETTER_FUNC(
  p_character   IN CHAR,
  p_allow_dieze IN NUMBER DEFAULT 0
)
RETURN NUMBER;

FUNCTION STAR_POSITION_FUNC(
  p_string      IN VARCHAR2,
  p_position    IN NUMBER,
  p_separateur  IN VARCHAR2 DEFAULT '*' --cha451 permettre de choisir un caractere autre que l'Ã©toile comme dÃ©limitateur
)
RETURN VARCHAR2;

FUNCTION GEN_REPLACE_CARACTERE_FUNC(  --CSC1136
  p_chaine IN VARCHAR2
)
RETURN VARCHAR2;

FUNCTION CHANGE_TO_NUMBER_FUNC( --fre1545 fonction qui retourne une chaine avec juste des chiffres
  p_value_to_change IN VARCHAR2
)
RETURN NUMBER;

FUNCTION ROLLBACK_DATABASE_FUNC(
  p_savepoint_name IN VARCHAR2 DEFAULT NULL
)
RETURN BOOLEAN;

FUNCTION CREATE_SAVEPOINT_FUNC(
  p_savepoint_name IN VARCHAR2 DEFAULT NULL
)
RETURN BOOLEAN;

PROCEDURE EXECUTE_BD_COMMIT_PROC;

FUNCTION EXECUTE_SQL_RETURN_NUM_FUNC(
  p_select IN VARCHAR2
)
RETURN NUMBER;

FUNCTION DECRYPT_FUNCT (
  p_use_password IN VARCHAR2
)
RETURN VARCHAR2;

FUNCTION CHECK_NUMBER_FUNC( --GIC2045
  p_num_to_test IN VARCHAR2,
  p_allow_minus IN VARCHAR2 := 'N'
)
RETURN BOOLEAN;

FUNCTION CHECK_NUMBER_NUM_FUNC( --GIC2045
  p_num_to_test IN VARCHAR2,
  p_allow_minus IN VARCHAR2 := 'N'
)
RETURN NUMBER;

FUNCTION CHECK_ALPHABETIC_FUNC( --GIC2045
  p_chaine IN VARCHAR2
)
RETURN BOOLEAN;

--CHA451 fonction crÃƒÆ’Ã‚Â©er pour compter le nombre d'occurence d'un caractere Ã Â  l'intÃ©rieur d'une chaine de caractere
FUNCTION COUNT_OCCURENCE_FUNC(
  p_line          IN VARCHAR2,
  p_char_to_find  IN VARCHAR2
)
RETURN NUMBER;

/* encore appellÃ© par:
  - appellÃ© seulement par PGSPHX dans Eclipse (java)
*/
FUNCTION VALIDATE_PASSWORD_NUM_FUNC( --cvi1487
  p_new_password IN VARCHAR2
)
RETURN PLS_INTEGER;

--GIC3395 permet de trouver Ã Â  quel date correspond le type d'interval
FUNCTION FIND_NEXT_EXECUTION_FUNC(
  p_int_id IN NUMBER
)
RETURN DATE;

/* encore appellÃ© par:
  - appellÃ© seulement par PGSPHX dans Eclipse (java)
*/
--CSC5368 permet de valider le code GTIN pour le Cubiscan
FUNCTION VALIDATE_GTIN_FUNC(
  p_GTIN_code     IN VARCHAR2,
  p_language      IN VARCHAR2
)
RETURN VARCHAR2;

--GIC3686 mettre ici la fonction qui sappellait CHECK LOC_CHARACTERS_FUNC avant... elle valide que c'est chiffre + lettre + #
FUNCTION CHECK_LETTER_AND_NUMBER_FUNC(
  p_value       IN VARCHAR2,
  p_allow_dieze IN NUMBER DEFAULT 0 --par dÃ©faut, on ne permet pas le dieze (#) --si on valide des LOC, on doit le mettre Ã Â  1
)
RETURN BOOLEAN;

FUNCTION CHECK_REAL_FUNC(
    p_num_to_test           IN      VARCHAR2,
    p_allow_minus           IN      VARCHAR2 := 'N',
    p_numeric_sep           IN      VARCHAR2 := NULL,
    p_use_thousand_sep      IN      BOOLEAN := FALSE
) RETURN BOOLEAN;

 FUNCTION COUNT_OCCURENCE (
 p_chaine           IN  VARCHAR2,
 p_caractere        IN  VARCHAR2
 )
 RETURN NUMBER ;

-- CSC7176 - Valide si la chaÃ®ne de caractÃ¨re est une adresse courriel
FUNCTION EMAIL_VALIDATION_FUNC (
  p_email_address    IN VARCHAR2
) RETURN BOOLEAN;

--BER3866 Arrondir au nombre entier le plus haut
--        Peut tenir compte des dÃ©cimales
FUNCTION CEIL_FUNC(
  p_value       IN NUMBER,
  p_nbr_decimal IN NUMBER DEFAULT 0
) RETURN NUMBER;
PRAGMA RESTRICT_REFERENCES (CEIL_FUNC,RNDS,WNDS,RNPS,WNPS);

FUNCTION LAST_STRING_CARACTER_FUNC( --BER3416
  p_string        IN VARCHAR2,
  p_first_or_last IN VARCHAR2 DEFAULT NULL
) RETURN BOOLEAN;

FUNCTION LOAD_BLOB_FROM_FILE_FUNC(
    p_dir_name  VARCHAR2,
    p_file_name VARCHAR2
) RETURN BLOB;

FUNCTION GET_BASENAME_FUNC(
    v_full_path IN VARCHAR2,
    v_suffix IN VARCHAR2 DEFAULT NULL,
    v_separator IN CHAR DEFAULT '\'
) RETURN VARCHAR2;

FUNCTION GET_DIRNAME_FUNC(
    v_full_path IN VARCHAR2,
    v_separator IN CHAR DEFAULT '\'
) RETURN VARCHAR2;

FUNCTION ENCODE_MD5_FUNC(
    p_param     IN VARCHAR2
) RETURN VARCHAR2;

FUNCTION CHECK_IF_FILE_EXIST_FUNC(
  p_dir_name   IN VARCHAR2,
  p_file_name  IN VARCHAR2
) RETURN BOOLEAN;

FUNCTION GET_DIRECTORY_PATH_FUNC(
  p_directory_name IN VARCHAR2
) RETURN VARCHAR2;

--cvi2821 crÃ©ation d'une procÃ©dure utilisant des OUT pour splitter le nom du fichier et son extension
PROCEDURE SPLIT_NAME_AND_EXTENSION_PROC(
  p_full_file_name  IN VARCHAR2,      --Ex: 'facture_entrante.inv'
  p_name_only       OUT VARCHAR2,     --Ex: 'facture_entrante'
  p_extension_type  OUT VARCHAR2      --Ex: 'inv'
);

--cvi2821 parmet d'ajouter (1) au nom dun fichier... ou s'il y a dÃ©jÃ  un (1), on augmente Ã  (2) (3) .. etc etc..
FUNCTION ADD_ONE_TO_NAME_FUNC(
  p_full_file_name  IN VARCHAR2
)
RETURN VARCHAR2;

FUNCTION CUBIC_FEET_TO_METER_FUNC
RETURN NUMBER;

FUNCTION LINEAR_FEET_TO_METER_FUNC
RETURN NUMBER;

--GCL8571 nouvelle fonction qui retourne une nouvelle chaine de courriels sÃ©parÃ©s par des point virgule
--construite Ã  partir de la chaine de caractÃ©re p_email_address sans la chaine p_email_to_move
FUNCTION NEW_EMAIL_VALIDATE_FUNC (
  p_email_address    IN VARCHAR2,
  p_email_to_move    IN VARCHAR2
)
RETURN VARCHAR2;

FUNCTION CRYPT_FUNC (
  p_use_password IN VARCHAR2
)
RETURN VARCHAR2;

FUNCTION GET_SESSION_ID_FUNC
RETURN NUMBER;

PROCEDURE SEPARATE_STRING_PROC(
  p_string         IN  VARCHAR2,
  p_start_position IN  NUMBER,
  p_length         IN  NUMBER,
  p_string_before  OUT VARCHAR2,
  p_string_target  OUT VARCHAR2,
  p_string_after   OUT VARCHAR2
);

FUNCTION REPLACE_PART_STRING_FUNC(
  p_full_string          IN VARCHAR2,
  p_start_position       IN NUMBER,
  p_length               IN NUMBER,
  p_character_to_replace IN VARCHAR2,
  p_new_character        IN VARCHAR2
)
RETURN VARCHAR2;

FUNCTION SUBSTITUTE_PART_STRING_FUNC(
  p_full_string     IN VARCHAR2,
  p_start_position  IN NUMBER,
  p_length          IN NUMBER,
  p_new_part_string IN VARCHAR2
)
RETURN VARCHAR2;

FUNCTION GET_CHECKBOX_VALUE_FUNC(
  p_value IN VARCHAR2
)
RETURN NUMBER;

FUNCTION GET_ORACLE_DAY_FUNC(
  p_weekday IN NUMBER
)
RETURN NUMBER;

FUNCTION NEXT_DAY_FUNC(
  p_date    IN DATE,
  p_weekday IN NUMBER
)
RETURN DATE;

FUNCTION GET_KG_TO_LB_FUNC
RETURN NUMBER;

FUNCTION ROUND_CASH_CARRY_FUNC(
  p_amount IN NUMBER
)
RETURN NUMBER;

FUNCTION IS_NUMBER_FUNC(
  p_value  IN VARCHAR2
)
RETURN BOOLEAN;

FUNCTION IS_DATE_FUNC(
  p_value  IN VARCHAR2
)
RETURN BOOLEAN;

FUNCTION REMOVE_NOT_ALLOWED_CAR_FUNC(
  p_value IN VARCHAR2,
  p_space_allowed_switch  IN NUMBER DEFAULT 1
)
RETURN VARCHAR2;

FUNCTION GET_MULTIPLE_VALUES_FUNC(
  p_list IN VARCHAR2,
  p_type IN VARCHAR2 DEFAULT 'CHAR'
)
RETURN VARCHAR2;

END GENERIC_PACK;
/