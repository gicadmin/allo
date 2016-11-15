CREATE OR REPLACE PACKAGE phenix.PRODUCTIVITY_PACK IS

PROCEDURE RAP_MOVEMENTS_PROC(
	p_date_debut        IN DATE,
	p_date_fin          IN DATE,
	p_heure_debut       IN NUMBER,
	p_heure_fin         IN NUMBER,
	p_whs_code          IN VARCHAR2,
	p_de_minute         IN NUMBER,--csc8640
	p_a_minute          IN NUMBER,
	p_language_rapport  IN VARCHAR2
);

PROCEDURE RAP_REPLEN_PROC(
	p_date_debut        IN DATE,
	p_date_fin          IN DATE,
	p_heure_debut       IN NUMBER,
	p_heure_fin         IN NUMBER,
	p_whs_code          IN VARCHAR2,
	p_de_minute         IN NUMBER,--csc8640
	p_a_minute          IN NUMBER,
	p_language_rapport  IN VARCHAR2
);

PROCEDURE RETURN_RECEIPT_LIGNES_PROC(
  p_date_debut  IN DATE,
  p_date_fin    IN DATE,
  inclure_rma   IN VARCHAR2,
  CODE_ENTREPOT IN VARCHAR2,
  tot_lignes    OUT number,
  tot_receipt   OUT number
);

END PRODUCTIVITY_PACK;
/