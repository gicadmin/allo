CREATE OR REPLACE PACKAGE phenix.ACR_OPERATION_PACK IS

PROCEDURE DELETE_ACTIONS_PROC(
  p_acr_source     IN action_required.acr_source%TYPE,
  p_acr_source_id  IN action_required.acr_source_id%TYPE,
  p_acr_action     IN action_required.acr_action%TYPE DEFAULT NULL
);

PROCEDURE RESERVE_ACTIONS_PROC(
  p_acr_id             IN action_required.acr_id%TYPE,
  p_acr_reserved_code  IN OUT action_required.acr_reserved_code%TYPE
);

PROCEDURE CLOSE_ACTIONS_PROC(
  p_acr_action         IN action_required.acr_action%TYPE,
  p_acr_reserved_code  IN action_required.acr_reserved_code%TYPE
);

PROCEDURE OPEN_ACTIONS_PROC(
  p_acr_action         IN action_required.acr_action%TYPE,
  p_acr_reserved_code  IN action_required.acr_reserved_code%TYPE
);

FUNCTION DOES_ACR_EXISTS_FUNC(
  p_acr_source     IN action_required.acr_source%TYPE,
  p_acr_source_id  IN action_required.acr_source_id%TYPE,
  p_acr_action     IN action_required.acr_action%TYPE DEFAULT NULL
) RETURN BOOLEAN;

PROCEDURE ADD_ACTION_PROC(
  p_acr_source    IN action_required.acr_source%TYPE,
  p_acr_source_id IN action_required.acr_source_id%TYPE,
  p_acr_action    IN action_required.acr_action%TYPE
);

PROCEDURE CLOSE_ACTIONS_PROC(
  p_acr_source    IN action_required.acr_source%TYPE,
  p_acr_source_id IN action_required.acr_source_id%TYPE,
  p_acr_action    IN action_required.acr_action%TYPE
);

PROCEDURE OPEN_ACTIONS_PROC(
  p_acr_source    IN action_required.acr_source%TYPE,
  p_acr_source_id IN action_required.acr_source_id%TYPE,
  p_acr_action    IN action_required.acr_action%TYPE
);

END ACR_OPERATION_PACK;
/