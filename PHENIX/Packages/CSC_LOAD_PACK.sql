CREATE OR REPLACE PACKAGE phenix.CSC_LOAD_PACK IS

PROCEDURE LOAD_RETAIL_CLIENT_PROC
(p_file in varchar2
);
PROCEDURE RETAIL_CLIENT_LOAD_PROC
(p_file in varchar2
);
END CSC_LOAD_PACK;
 
/