CREATE OR REPLACE PACKAGE phenix.PWID_OPERATION_PACK IS

PROCEDURE PURGE_PWPD_HEADER_PROC(
  p_pwpd_id  IN  public_whse_identifiers.pwid_pwpd_id%TYPE
);

PROCEDURE PURGE_PWRD_HEADER_PROC(
  p_pwrd_id  IN  public_whse_identifiers.pwid_pwrd_id%TYPE
);

PROCEDURE PURGE_PROC(
  p_max_items                     IN NUMBER
);

FUNCTION CREATE_PWID_FUNC(
  p_pwid_pwrd_id              IN public_whse_identifiers.pwid_pwrd_id%TYPE,
  p_pwid_lot_code             IN public_whse_identifiers.pwid_lot_code%TYPE DEFAULT NULL,
  p_pwid_identifier           IN public_whse_identifiers.pwid_identifier%TYPE,
  p_pwid_loc_code             IN public_whse_identifiers.pwid_loc_code%TYPE,
  p_pwid_quantity             IN public_whse_identifiers.pwid_quantity%TYPE,
  p_pwid_use_reception_code   IN public_whse_identifiers.pwid_use_reception_code%TYPE
)
RETURN NUMBER;

FUNCTION FIND_TOTAL_RECEIVED_FUNC(
  p_pwrd_id           IN public_whse_identifiers.pwid_pwrd_id%TYPE
)
RETURN NUMBER;

PROCEDURE GET_PWPD_ID_PROC(
  p_identifier          IN public_whse_identifiers.pwid_identifier%TYPE,
  p_pwph_id             IN public_whse_pick_headers.pwph_id%TYPE,
  p_pwpd_id             OUT NUMBER,
  p_quantity            OUT NUMBER
);

PROCEDURE MOVE_IDENTIFIER_PROC(
  p_identifier    IN public_whse_identifiers.pwid_identifier%TYPE,
  p_loc_code      IN public_whse_identifiers.pwid_loc_code%TYPE,
  p_use_code      IN users.use_code%TYPE
);

PROCEDURE PROCESS_IDENT_FOR_PICK_PROC(
  p_identifier    IN public_whse_identifiers.pwid_identifier%TYPE,
  p_pwph_id       IN public_whse_pick_headers.pwph_id%TYPE,
  p_use_code      IN users.use_code%TYPE
);

PROCEDURE UPDATE_FOR_PICK_PROC(
  p_identifier    IN public_whse_identifiers.pwid_identifier%TYPE,
  p_pwpd_id       IN public_whse_pick_details.pwpd_id%TYPE,
  p_use_code      IN users.use_code%TYPE
);

PROCEDURE VALIDATE_IDENTIFIER_PROC(
  p_identifier    IN public_whse_identifiers.pwid_identifier%TYPE
);

PROCEDURE VAL_IDENT_FOR_PICK_PROC(
  p_identifier    IN public_whse_identifiers.pwid_identifier%TYPE,
  p_pwph_id       IN public_whse_pick_headers.pwph_id%TYPE
);

--CSC9049 valider si la loc est en utilisation pour l'entreposage public en ce moment
FUNCTION IS_LOC_IN_USE_FUNC(
  p_loc_code IN VARCHAR2
)
RETURN BOOLEAN;

END PWID_OPERATION_PACK;
/