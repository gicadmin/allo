CREATE OR REPLACE PACKAGE phenix.AUTONOMOUS_PACK IS

FUNCTION UPDATE_CONTACT_REMARKS_FUNC (
	p_con_id  IN NUMBER,
	p_remarks IN VARCHAR2
) RETURN BOOLEAN;

--procédure qui débute un log en utilisant la variable du package (par session)
PROCEDURE START_AUTOMATED_LOG_PROC(
  p_module_name IN VARCHAR2,
  p_module_type IN VARCHAR2,
  p_message     IN VARCHAR2
);

--BER4749 fonction pour pouvoir insérer un détail de log à l'extérieur de la session courante pour le commiter sans commit le reste
PROCEDURE DETAIL_AUTOMATED_LOG_PROC(
  p_line_number IN NUMBER,
  p_message     IN VARCHAR2,
  p_error       IN VARCHAR2
);

--procédure qui ferme un log en utilisant la variable du package (par session)
PROCEDURE END_AUTOMATED_LOG_PROC(
  p_message IN VARCHAR2
);

PROCEDURE ADD_TO_START_AUTOMATED_PROC(
  p_message IN VARCHAR2
);

--ROL2173 fonction pour pouvoir insérer un début de log à l'extérieur de la session courante pour le commiter sans commit le reste
FUNCTION START_AUTONOMOUS_LOG_FUNC(
  p_module_name   IN VARCHAR2,
  p_module_type   IN VARCHAR2,
  p_file_name_in  IN VARCHAR2,
  p_file_name_out IN VARCHAR2,
  p_message       IN VARCHAR2,
  p_loh_id        OUT NUMBER,
  p_error_code    OUT NUMBER,
  p_error_msg     OUT VARCHAR2
) RETURN BOOLEAN;

--ROL2173 fonction pour pouvoir insérer un détail de log à l'extérieur de la session courante pour le commiter sans commit le reste
PROCEDURE DETAIL_AUTONOMOUS_LOG_PROC(
  p_loh_id      IN NUMBER,
  p_line_number IN NUMBER,
  p_message     IN VARCHAR2,
  p_error       IN VARCHAR2
);

--ROL2173 fonction pour pouvoir terminer un log à l'extérieur de la session courante pour le commiter sans commit le reste
PROCEDURE END_AUTONOMOUS_LOG_PROC(
  p_loh_id  IN NUMBER,
  p_message IN VARCHAR2
);

--ROL2173 fonction pour pouvoir insérer un log complet de 1 détail à l'extérieur de la session courante pour le commiter sans commit le reste
FUNCTION INSERT_FULL_AUTO_LOG_FUNC (
	p_module_name 	IN VARCHAR2,
	p_module_type 	IN VARCHAR2,
	p_file_name_in 	IN VARCHAR2,
	p_file_name_out IN VARCHAR2,
	p_message_hdr 	IN VARCHAR2,
	p_insert_det		IN NUMBER DEFAULT 0,
	p_message_det 	IN VARCHAR2 DEFAULT NULL,
	p_error_det			IN VARCHAR2 DEFAULT NULL
) RETURN BOOLEAN;

--ROL2173 fonction pour pouvoir terminer un log à l'extérieur de la session courante pour le commiter sans commit le reste
PROCEDURE UPDATE_LOH_MESSAGE_PROC(
  p_loh_id  IN NUMBER,
  p_message IN VARCHAR2
);

FUNCTION INSERT_TCC_PRODUCTS_FUNC (
  p_tcc_sid           IN NUMBER,
	p_tcc_prf_prd_code	IN VARCHAR2,
	p_tcc_prf_fmt_code	IN VARCHAR2,
	p_tcc_quantity	    IN NUMBER,
  p_tcc_weight	      IN NUMBER,
	p_tcc_loc_code 			IN VARCHAR2
) RETURN BOOLEAN;

FUNCTION GENERATE_REPORT_FUNC(
  p_tcc_sid  IN NUMBER,
  p_use_code IN NUMBER,
  p_output   OUT VARCHAR2
) RETURN BOOLEAN;

PROCEDURE DELETE_TCC_PRODUCTS_PROC (
  p_tcc_sid           IN NUMBER
);

--BER3820 procédure pour deleter un log
PROCEDURE DELETE_AUTONOMOUS_LOG_PROC(
  p_loh_id      IN NUMBER
);

END AUTONOMOUS_PACK;
/