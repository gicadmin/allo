CREATE OR REPLACE PACKAGE phenix.VCR_OPERATION_PACK IS

PROCEDURE PURGE_PROC(
    p_inh_id                    IN INVOICE_HEADERS.INH_ID%type
);

FUNCTION PRINT_RAP_CREDIT_TRANS_FUNC(
 p_inh_id    IN invoice_headers.inh_id%TYPE,
 p_use_code  IN users.use_code%TYPE
) RETURN VARCHAR2;

END VCR_OPERATION_PACK;
/