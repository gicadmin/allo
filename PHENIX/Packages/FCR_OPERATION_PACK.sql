CREATE OR REPLACE PACKAGE phenix.FCR_OPERATION_PACK IS
FUNCTION CHECK_BLOB (p_fcr_fcg_code  IN NUMBER,
                     p_fcr_code      IN NUMBER)
RETURN NUMBER;
PROCEDURE IMPORT_FCR_IMAGE_PROC( p_fcr_fcg_code  IN NUMBER,
                                 p_fcr_code      IN NUMBER,
	                               p_directory		 IN VARCHAR2,
	                               p_filename 		 IN VARCHAR2
);
END FCR_OPERATION_PACK;
/