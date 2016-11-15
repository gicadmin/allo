CREATE OR REPLACE PACKAGE phenix.VMT_OPERATION_PACK IS

FUNCTION GET_EMAIL_TRANSACTION_FUNC(
	p_ven_code 	              IN vendors.ven_code%TYPE,
	p_vmt_report_type	        IN vendor_email_transactions.vmt_report_type%TYPE
) RETURN VARCHAR2 ;

END VMT_OPERATION_PACK;
/