CREATE OR REPLACE PACKAGE phenix.CATALYST_PACK IS

PROCEDURE CAT_PICK_LIST_PROC(
	p_plh_id IN NUMBER
);

PROCEDURE CAT_CREATE_RHRDFILE_PROC(
	p_vendor_code   IN NUMBER,
	p_order_number  IN VARCHAR2,
	p_order_source  IN VARCHAR2,
	p_header_detail IN VARCHAR2   --nouveau parametre pour detail/header(HD) ou header(HH)
);

END CATALYST_PACK;

 
/