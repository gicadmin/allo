CREATE OR REPLACE PACKAGE phenix.MESSAGE_API_PACK AS

PROCEDURE SEND_MESSAGE(
	p_ccr_code    IN  NUMBER,
  p_ccr_code_sv IN  NUMBER DEFAULT 0
);

PROCEDURE SEND(
	p_ccr_code     IN  NUMBER,
  p_ccr_message  IN  VARCHAR2,
  p_ccr_code_sv  IN  NUMBER DEFAULT 0
);

PROCEDURE RECEIVE(
	p_language_flag    IN    VARCHAR2,
  p_vocal_switch     IN    NUMBER,
  p_ccr_code         OUT   NUMBER,
  p_ccr_message      OUT   VARCHAR2
);

END message_api_PACK;
 
/