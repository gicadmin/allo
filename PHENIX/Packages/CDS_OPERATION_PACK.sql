CREATE OR REPLACE PACKAGE phenix.CDS_OPERATION_PACK IS

PROCEDURE PURGE_PROC(
	p_inh_id                    IN INVOICE_HEADERS.INH_ID%type
);

PROCEDURE FREE_INH_RETAIL_PROC(
    p_inh_id                    IN INVOICE_HEADERS.INH_ID%type
);

END CDS_OPERATION_PACK;
/