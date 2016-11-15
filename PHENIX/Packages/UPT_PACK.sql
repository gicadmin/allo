CREATE OR REPLACE PACKAGE phenix.UPT_PACK IS

FUNCTION GET_UPT_ID RETURN NUMBER;

PROCEDURE INSERT_UPT_PROC(
	p_upt_id         IN user_picking_times.upt_id%TYPE,
	p_upt_use_code   IN user_picking_times.upt_use_code%TYPE,
	p_upt_whz_code   IN user_picking_times.upt_whz_code%TYPE,
	p_upt_method     IN user_picking_times.upt_method%TYPE,
	p_upt_start_date IN user_picking_times.upt_start_date%TYPE,
	p_upt_end_date   IN user_picking_times.upt_end_date%TYPE,
	p_upt_whs_code   IN user_picking_times.upt_whs_code%TYPE,
	p_upt_type       IN user_picking_times.upt_type%TYPE
);

FUNCTION CREATE_UPT_FUNC(
	p_use_code		IN NUMBER,
	p_whz_code		IN VARCHAR2,
	p_method			IN VARCHAR2,
	p_start_date	IN DATE,
	p_end_date		IN DATE,
	p_upt_type    IN VARCHAR2 DEFAULT 'P'  --CSC4594  Par défaut, on met la valeur ¿ P :pick(Cueillette)
)
RETURN PLS_INTEGER;

--	Fonction qui met à jour une date/heure de fin pour les rapports de performance																																	--
FUNCTION UPDATE_UPT_FUNC(
	p_use_code		NUMBER,
	p_whz_code		VARCHAR2,
	p_method			VARCHAR2
)
RETURN PLS_INTEGER;

END UPT_PACK;
 
/