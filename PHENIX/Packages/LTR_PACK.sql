CREATE OR REPLACE PACKAGE phenix.LTR_PACK IS

--fonction qui met à jour la ligne de pmd existante avec les nouvelle valeurs déduites de qty et insére une nouvelle ligne avec la qty à transférere
FUNCTION GENERATE_TRACE_FUNC(
  p_rowid               IN	ROWID)
  RETURN VARCHAR2;  -- Retourne un numero de billet.

END LTR_PACK;
/