CREATE OR REPLACE PACKAGE phenix.IMPORT_IMAGE_PACK IS

PROCEDURE IMPORT_REPORT_IMAGE_PROC(
	                               p_rpi_name 			  IN VARCHAR2,
	                               p_rpi_description 	  IN VARCHAR2,
	                               p_rpi_alt_description  IN VARCHAR2,
	                               p_directory            IN VARCHAR2,
	                               p_filename             IN VARCHAR2
);

END IMPORT_IMAGE_PACK;
/