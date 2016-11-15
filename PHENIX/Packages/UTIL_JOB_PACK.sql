CREATE OR REPLACE PACKAGE phenix.UTIL_JOB_PACK AS

PROCEDURE SETJOBLOGSUCCESS (
	p_jsc_id IN NUMBER
);

PROCEDURE SETJOBLOGFAILURE (
	p_jsc_id 			IN NUMBER,
	p_errcode 		IN NUMBER,
	p_statustext 	IN VARCHAR2 DEFAULT 'Echec / Failure'
);

PROCEDURE SETLOGFAILURE (
	p_modulename 	IN VARCHAR2,
	p_errcode 		IN NUMBER DEFAULT -1,
	p_errmessage 	IN VARCHAR2 DEFAULT NULL
);

PROCEDURE PURGEJOBFROMQUEUE (
	p_jsc_id IN NUMBER
);

PROCEDURE DELETEALLJOBFROMQUEUE;

PROCEDURE VERIFJOBTOQUEUE(
  p_jsc_id IN NUMBER
);

FUNCTION GETJOBPARAMETER(
	p_jsc_id 				IN NUMBER,
	p_parametername IN VARCHAR2
)
RETURN VARCHAR2;

PROCEDURE DELETEALLLOGS;

PROCEDURE DELETELOGSOLDERTHAN(
	p_jsc_id IN NUMBER
);

PROCEDURE DELETELOGSOLDERTHAN(
	p_date IN DATE
);

FUNCTION RUNHOSTCMD_FUNC(
	p_cmd IN VARCHAR2
)
RETURN NUMBER;

PROCEDURE DEACTIVATEJOB (
  p_jsc_id IN NUMBER
);

PROCEDURE ACTIVATEJOB (
  p_jsc_id IN NUMBER
);

/*Fonctions et procédures anciennement sur le IAS UTIL_UTILITY_IAS_PACK*/
--csc2546 nouvelle fonction utilisée par l'interval 'PER'
FUNCTION FIND_NEXT_PERIOD_DATE_FUNC
RETURN DATE;

--BER4898 création d'une fonction pour permettre les intervals à tous les débuts d'année fiscal
FUNCTION FIND_NEXT_YEAR_DATE_FUNC
RETURN DATE;

FUNCTION FIND_END_PERIOD_DATE_FUNC(
  p_nbr_hours IN NUMBER
)
RETURN DATE;

END UTIL_JOB_PACK;
/