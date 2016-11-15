CREATE OR REPLACE PACKAGE phenix.SGE_PUBLIC_WHSE_PACK IS

PROCEDURE CLOSE_PICKING_PROC(
  p_pwph_id     IN  public_whse_pick_headers.pwph_id%TYPE,
  p_use_code    IN users.use_code%TYPE
);

PROCEDURE CLOSE_RECEPTION_PROC(
  p_pwrh_id     IN  public_whse_receipt_headers.pwrh_id%TYPE,
  p_use_code    IN users.use_code%TYPE
);

PROCEDURE GET_PWPD_ID_PROC(
  p_identifier          IN public_whse_identifiers.pwid_identifier%TYPE,
  p_pwph_id             IN public_whse_pick_headers.pwph_id%TYPE,
  p_pwpd_id             OUT NUMBER,
  p_quantity            OUT NUMBER
);

FUNCTION FIND_TOTAL_RECEIVED_FUNC(
  p_pwrd_id           IN public_whse_identifiers.pwid_pwrd_id%TYPE
)
RETURN NUMBER;

FUNCTION CREATE_PWID_FUNC(
  p_pwid_pwrd_id              IN public_whse_identifiers.pwid_pwrd_id%TYPE,
  p_pwid_lot_code             IN public_whse_identifiers.pwid_lot_code%TYPE DEFAULT NULL,
  p_pwid_identifier           IN public_whse_identifiers.pwid_identifier%TYPE,
  p_pwid_loc_code             IN public_whse_identifiers.pwid_loc_code%TYPE,
  p_pwid_quantity             IN public_whse_identifiers.pwid_quantity%TYPE,
  p_pwid_use_reception_code   IN public_whse_identifiers.pwid_use_reception_code%TYPE
)
RETURN NUMBER;

FUNCTION CREATE_PWPH_FUNC(
  p_pwph_pwo_code             IN public_whse_pick_headers.pwph_pwo_code%TYPE,
  p_pwph_whs_code             IN public_whse_pick_headers.pwph_whs_code%TYPE,
  p_pwph_picking_number       IN public_whse_pick_headers.pwph_picking_number%TYPE
)
RETURN NUMBER;

PROCEDURE CREATE_PWPU_PROC(
  p_pwpu_pwph_id        IN public_whse_pick_users.pwpu_pwph_id%TYPE,
  p_pwpu_use_code       IN public_whse_pick_users.pwpu_use_code%TYPE
);

FUNCTION CREATE_PWRD_FUNC(
  p_pwrd_pwrh_id              IN public_whse_receipt_details.pwrd_pwrh_id%TYPE,
  p_pwrd_owner_product_code   IN public_whse_receipt_details.pwrd_owner_product_code%TYPE
)
RETURN NUMBER;

FUNCTION CREATE_PWRH_FUNC(
  p_pwrh_pwo_code                 IN public_whse_receipt_headers.pwrh_pwo_code%TYPE,
  p_pwrh_whs_code                 IN public_whse_receipt_headers.pwrh_whs_code%TYPE,
  p_pwrh_receipt_number           IN public_whse_receipt_headers.pwrh_receipt_number%TYPE,
  p_pwrh_seal_number              IN public_whse_receipt_headers.pwrh_seal_number%TYPE DEFAULT NULL
)
RETURN NUMBER;

PROCEDURE CREATE_PWRU_PROC(
  p_pwru_pwrh_id        IN public_whse_receipt_users.pwru_pwrh_id%TYPE,
  p_pwru_use_code       IN public_whse_receipt_users.pwru_use_code%TYPE
);

FUNCTION IS_IDENTIFIER_USED_FUNC(
  p_container_id  IN NUMBER
) RETURN BOOLEAN;

FUNCTION IS_PUBLIC_WHSE_LOC_FUNC(
  p_loc_code IN locations.loc_code%type
) RETURN BOOLEAN;

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



END SGE_PUBLIC_WHSE_PACK;
/