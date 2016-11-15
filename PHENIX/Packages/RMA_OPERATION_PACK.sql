CREATE OR REPLACE PACKAGE phenix.RMA_OPERATION_PACK IS


PROCEDURE SET_RAP_RMA_CUS_EMAIL_FAX_PROC (
  p_cah_id  	    		      IN customer_adjustment_headers.cah_id%TYPE,
  p_report_name     		    IN VARCHAR2,
  p_cmt_report_type     		IN customer_email_transactions.cmt_report_type%TYPE
);


END RMA_OPERATION_PACK;
/