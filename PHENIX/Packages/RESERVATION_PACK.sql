CREATE OR REPLACE PACKAGE phenix.RESERVATION_PACK IS

FUNCTION FIND_NEXT_OP_DATE_FOR_FD_FUNC(
  p_whs_delivery_code IN VARCHAR2,
  p_sysdate           IN DATE,
  p_nb_delivery_days  IN NUMBER,
  p_calendar_end_date IN DATE DEFAULT NULL  --va remplir la date lui même si elle est null
) RETURN DATE;

--procédure pour essayer de réserver l'inventaire pour les commandes placées à l'avance etc..
PROCEDURE RESERVATION_FD_AND_REG_PROC (
  p_jsc_id  IN NUMBER
);

--procédure pour attribuer de l'inventaire au ligne de réservation FD dont on garanti le total réservé
PROCEDURE ATTRIBUTE_FD_INVENTORY_PROC(
  p_prd_code            IN VARCHAR2,
  p_prd_definition      IN VARCHAR2,
  p_sysdate             IN DATE,
  p_qty_wght_to_assign  IN OUT NUMBER,
  v_file_out            IN UTL_FILE.FILE_TYPE,  --sert seulement à remplir un fichier de trace, on le garde
  p_inv_fmt             IN VARCHAR2             --sert seulement à remplir un fichier de trace, on le garde
);

--procédure pour obtenir l'inventaire qu'on considère être disponible pour un produit demandé
--au moment qu'on est dans APICK en train de modifier les qté etc... (tient compte de la table temporaire d'apick)
PROCEDURE GET_INV_APICK_AVAILABLE_PROC (
  p_prd_code        IN VARCHAR2,
  p_prd_definition  IN VARCHAR2,
  p_available_qty   OUT NUMBER,
  p_available_wght  OUT NUMBER
);

--procédure pour essayer de réserver l'inventaire pour les commandes placées à l'avance etc..
PROCEDURE PRORATA_APICK_PROC (
  p_keep_trace  IN NUMBER DEFAULT 1
);

--procédure pour attribuer de l'inventaire restant à l'entrée d'apick
PROCEDURE ATTRIBUTE_APICK_INVENTORY_PROC(
  p_prd_code            IN VARCHAR2,
  p_prd_definition      IN VARCHAR2,
  p_qty_wght_to_assign  IN OUT NUMBER,
  v_file_out            IN UTL_FILE.FILE_TYPE,    --sert seulement à remplir un fichier de trace, on le garde
  p_inv_fmt             IN VARCHAR2,              --sert seulement à remplir un fichier de trace, on le garde
  p_date_only           IN NUMBER DEFAULT 0 --CSC1890 INDIQUE SI ON UPDATE SEULEMENT LA DATE OU SI ON CHERCHE VRAIMENT DE LINVENTAIRE
);

END RESERVATION_PACK;
/