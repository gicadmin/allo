CREATE OR REPLACE PACKAGE phenix.VOAH_OPERATION_PACK AS

FUNCTION GET_NUMBER_BY_UNIQUE_KEY_FUNC(
  p_voah_ven_code                  IN         vend_order_agreement_headers.voah_ven_code%TYPE,
  p_voah_qualifier                 IN         vend_order_agreement_headers.voah_qualifier%TYPE,
  p_voah_agreement_id              IN         vend_order_agreement_headers.voah_agreement_id%TYPE,
  p_column_name                    IN         VARCHAR2,
  p_raise                          IN         BOOLEAN  DEFAULT TRUE
)
RETURN NUMBER;

PROCEDURE FIND_LINKED_VOAH_PROC(
  p_voad_id   IN NUMBER,
  p_ven_code  IN NUMBER DEFAULT NULL,  --pas obligatoire si un ID est vraiment passé.. si le ID est null, on assume c'est un OAGR du fournisseur (le 1er trouvé)
  p_voah_rec  OUT vend_order_agreement_headers%ROWTYPE
);

PROCEDURE PURGE_PROC(
  p_voah_id IN vend_order_agreement_headers.voah_id%TYPE,
  p_raise   IN BOOLEAN DEFAULT TRUE
);

END VOAH_OPERATION_PACK;
/