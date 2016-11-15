CREATE OR REPLACE PACKAGE phenix.ULM_OPERATION_PACK IS

FUNCTION DELETE_USER_LOG_FUNC
RETURN NUMBER;

PROCEDURE CHECK_IF_CHANGED_USE_PROC(
    p_use_code        IN NUMBER,
		p_mod_source      IN VARCHAR2,
    p_field_name      IN VARCHAR2,
    p_old_value       IN NUMBER,
    p_new_value       IN NUMBER,
    p_use_modif_code  IN NUMBER DEFAULT 99999
);

PROCEDURE CHECK_IF_CHANGED_USE_PROC(
    p_use_code        IN NUMBER,
		p_mod_source      IN VARCHAR2,
    p_field_name      IN VARCHAR2,
    p_old_value       IN VARCHAR2,
    p_new_value       IN VARCHAR2,
    p_use_modif_code  IN NUMBER DEFAULT 99999
);

PROCEDURE CHECK_IF_CHANGED_USE_PROC(
    p_use_code        IN NUMBER,
		p_mod_source      IN VARCHAR2,
    p_field_name      IN VARCHAR2,
    p_old_value       IN DATE,
    p_new_value       IN DATE,
    p_use_modif_code  IN NUMBER DEFAULT 99999
);

PROCEDURE SET_CONTEXT_USE_SOURCE_PROC(
    p_use_code      IN NUMBER,
		p_source        IN VARCHAR2
);

PROCEDURE GET_CONTEXT_USER_SOURCE_PROC(
		p_use_code      OUT NUMBER,
    p_source        OUT VARCHAR2
);

FUNCTION IS_DEFAULT_CONTEXT_FUNC
    RETURN BOOLEAN;

PROCEDURE RESET_CONTEXT_USE_SOURCE_PROC;

END ULM_OPERATION_PACK;
/