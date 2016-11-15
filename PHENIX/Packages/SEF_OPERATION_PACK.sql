CREATE OR REPLACE PACKAGE phenix.sef_operation_pack AS

PROCEDURE submit_on_commit_proc(
  p_sef_id                IN send_fax.sef_id%TYPE,
  p_pdf                   IN varchar2,
  p_fax_number            IN send_fax.sef_number%TYPE);

--
-- Doit etre publique puisque submit_on_commit l'execute par
-- l'utilisation d'un DBMS_JOB
--
PROCEDURE submit_proc(
  p_sef_id                IN send_fax.sef_id%TYPE,
  p_pdf                   IN varchar2,
  p_fax_number            IN send_fax.sef_number%TYPE);

PROCEDURE SEND_TO_RECIPIENTS_PROC(
  p_jre_id                IN job_recipients.jre_id%TYPE,
  p_pdf                   IN VARCHAR2
);

PROCEDURE GET_FAX_STATUS_PROC(
  P_JSC_ID IN NUMBER
);

END sef_operation_PACK;
/