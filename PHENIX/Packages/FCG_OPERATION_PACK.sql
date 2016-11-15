CREATE OR REPLACE PACKAGE phenix.FCG_OPERATION_PACK AS
PROCEDURE IMPORT_CERTIFICATIONS_PROC (
  p_jsc_id   IN NUMBER
  );
PROCEDURE IMP_FCG_PROC (
  p_file				      IN VARCHAR2,
  p_nom_reel_fichier  IN VARCHAR2,
  p_language          IN VARCHAR2
  );
PROCEDURE VALID_FCG(
  p_file     IN VARCHAR2,
  p_language IN VARCHAR2
  );
PROCEDURE VALIDATE_AND_PROCESS_TFC_PROC;
PROCEDURE TRANSFER_ALIM_QC_FILE_PROC(
  p_elements        IN INTEGER,
  p_files_clob      IN CLOB,
  p_from_directory  IN VARCHAR2,
  p_to_directory    IN VARCHAR2
);

FUNCTION DELETE_CASCADE_FCG_FUNC (
 p_fcg_code  IN  food_certification_groups.fcg_code%TYPE
) RETURN VARCHAR2;

END FCG_OPERATION_PACK;
/