CREATE OR REPLACE PACKAGE phenix.VOAR_OPERATION_PACK AS

PROCEDURE PURGE_PROC(
  p_cad_id  IN customer_adjustment_details.cad_id%TYPE
);

PROCEDURE PURGE_PROC(
  p_cod_coh_id       IN customer_order_details.cod_coh_id%TYPE,
  p_cod_line_number  IN customer_order_details.cod_line_number%TYPE
);

PROCEDURE DELETE_VOAR_FOR_COD_PROC(
  p_cod_coh_id            IN NUMBER,            --devra etre rempli si on veut lié les réclamations à un COD
  p_cod_line_number       IN NUMBER            --devra etre rempli si on veut lié les réclamations à un COD
);

PROCEDURE DELETE_ALL_VOAR_FOR_COH_PROC(
  p_cod_coh_id            IN NUMBER
);

PROCEDURE DELETE_VOAR_FOR_CAD_PROC(
  p_cad_id            IN NUMBER
);

--cvi2821 trouver la somme des VOAR déjà insérés...
FUNCTION FIND_TOTAL_VOAR_FUNC(
  p_cod_coh_id            IN NUMBER,
  p_cod_line_number       IN NUMBER,
  p_cad_id                IN NUMBER
)
RETURN NUMBER;

--trouver la somme des VOAR pour un COD
FUNCTION FIND_TOTAL_COD_VOAR_FUNC(
  p_cod_coh_id       IN NUMBER,
  p_cod_line_number  IN NUMBER
)
RETURN NUMBER;

--trouver la somme des VOAR pour un CAD
FUNCTION FIND_TOTAL_CAD_VOAR_FUNC(
  p_cad_id   IN NUMBER
)
RETURN NUMBER;

PROCEDURE COPY_VOAR_COD_TO_CAD_PROC(
  p_cod_coh_id      IN NUMBER,
  p_cod_line_number IN NUMBER,
  p_cad_id          IN NUMBER,
  p_do_commit       IN NUMBER DEFAULT 0
);

--cvi2821 création de la job qui facture les OA/TPA
PROCEDURE INVOICE_OA_TPA_PROC(
  p_jsc_id IN NUMBER
);

PROCEDURE INVOICED_VOAR_PROC(
  p_voar_id IN NUMBER,
  p_vbd_id  IN NUMBER   --peut être NULL si la qté est zéro et qu'on na pas vraiment facturé...
);

PROCEDURE CREATE_OA_TPA_APPLIED_PROC(
  p_inh_id    IN NUMBER,
  p_qualifier IN VARCHAR2,  --OA  ou TPA
  p_sysdate   IN DATE DEFAULT SYSDATE --permettre de passer la même date à toutes les factures pour être dans le même fichier..
);

END VOAR_OPERATION_PACK;
/