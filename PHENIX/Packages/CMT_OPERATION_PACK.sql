CREATE OR REPLACE PACKAGE phenix.CMT_OPERATION_PACK IS

FUNCTION DOES_TRANSACTION_FUNC(
  p_cmt_cus_code         IN  customer_email_transactions.cmt_cus_code%TYPE,
  p_cmt_report_type      IN  customer_email_transactions.cmt_report_type%TYPE,
  p_cmt_transmit_method  IN  customer_email_transactions.cmt_transmit_method%TYPE
)
RETURN BOOLEAN;

FUNCTION DOES_CUS_SEND_TRANSACTION_FUNC(
	p_cus_code 				IN customers.cus_code%TYPE,
	p_transmit_method	IN customer_email_transactions.cmt_transmit_method%TYPE,
	p_type 						IN customer_email_transactions.cmt_report_type%TYPE
)
RETURN NUMBER;

FUNCTION GET_EMAIL_TRANSACTION_FUNC(
	p_cus_code 	              IN customers.cus_code%TYPE,
	p_type_transaction	      IN customer_email_transactions.cmt_report_type%TYPE
)
RETURN VARCHAR2;

PROCEDURE ADD_MAIL_CHIEF_PROC(
	p_cmt_cus_code 	          IN customer_email_transactions.cmt_cus_code%TYPE,
  p_cmt_report_type         IN customer_email_transactions.cmt_report_type%TYPE
);

PROCEDURE DEL_MAIL_CHIEF_PROC(
	p_cus_code 	              IN customers.cus_code%TYPE
);

FUNCTION DOES_CUS_HERIT_HEAD_EMAIL_FUNC(
	p_cus_code 				IN customers.cus_code%TYPE,
  p_cus_cus_code 		IN customers.cus_code%TYPE,
	p_transmit_method	IN customer_email_transactions.cmt_transmit_method%TYPE,
	p_type 						IN customer_email_transactions.cmt_report_type%TYPE
) RETURN NUMBER;

FUNCTION EXISTS_EMAIL_CUS_CMT_TYPE_FUNC(
  p_cmt_cus_code       IN customer_email_transactions.cmt_cus_code%TYPE,
  p_cmt_report_type    IN customer_email_transactions.cmt_report_type%type,
  p_cmt_email          IN customer_email_transactions.cmt_email%type
)
RETURN BOOLEAN;

PROCEDURE SEND_MAIL_TO_CUS_PROC(
  p_cmt_cus_code    IN customer_email_transactions.cmt_cus_code%TYPE,
  p_cmt_report_type IN customer_email_transactions.cmt_report_type%type,
  p_directory_name  IN VARCHAR2,
  p_file_name       IN VARCHAR2,
  p_as_file_name    IN VARCHAR2 DEFAULT NULL
);

FUNCTION EXISTS_ACCOUNT_STATEMENT_FUNC(
  p_cmt_cus_code IN customer_email_transactions.cmt_cus_code%TYPE
)
RETURN BOOLEAN;

END CMT_OPERATION_PACK;
/