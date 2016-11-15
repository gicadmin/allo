CREATE OR REPLACE PACKAGE phenix.PGSPHX_FUNCTIONS_PACK IS

   /*  Cette fonction permet de retourner les jours d'achats
    *  en fonction du VEN_CODE et d'un #de semaine (1 à 5)
    */
FUNCTION GET_PURCHASE_DAYS
(venCode IN NUMBER,
 nWeek   IN NUMBER
 )
 RETURN VARCHAR2;

 FUNCTION GET_ALL_GTIN_FUNC
(P_PRD_CODE IN VARCHAR2
)
 RETURN VARCHAR2;

END PGSPHX_FUNCTIONS_PACK ;
 
/