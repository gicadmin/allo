CREATE OR REPLACE PACKAGE phenix.MAXIVENTE_INTERFACE_PACK IS

/*
*  GIMAT     DATE      AUTEUR   DESCRIPTION
* ------- ----------  --------- --------------------------------
* BER3143 19-06-2012  Mawuko    Création initiale du package
*                               Création de la procédure EXTRACT_MAXIVENTE_PROC qui extrait les données des fichiers numérisés et crée des enregistrements
*                               dans la table customer_adjustment_headers ,customer_adjustment_details et invoice_headers;
*/

PROCEDURE EXTRACT_MAXIVENTE_PROC(
  p_jsc_id IN NUMBER
);

FUNCTION READ_MAXIVENTE_FUNC(
  p_file_in           IN UTL_FILE.FILE_TYPE,
  p_nomfichier        IN VARCHAR2,
  p_log_id            IN NUMBER,
  p_loop_file         IN NUMBER
)RETURN BOOLEAN;

PROCEDURE CREATE_CREDIT_PROC (p_log_id IN NUMBER);
PROCEDURE CREATE_MAXIVENTE_PROD_PROC(p_code_entrepot IN VARCHAR2);
PROCEDURE CREATE_MAXIVENTE_CUST_PROC;
PROCEDURE CREATE_MAXIVENTE_PROC(
  p_jsc_id IN NUMBER
);
END MAXIVENTE_INTERFACE_PACK;
/