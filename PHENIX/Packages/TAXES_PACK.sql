CREATE OR REPLACE PACKAGE phenix.TAXES_PACK IS

--procédure pour calculer les taux de taxes à la vente (pour un client)
--BER3866 Les montants des taxes sont toujours arrondit maintenant
PROCEDURE FIND_SALES_TAX_WITH_PRV_PROC(
  p_prd_code         IN  products.prd_code%TYPE,
  p_whs_code         IN  warehouses.whs_code%TYPE,  -- EFE344
  p_cus_code         IN  customers.cus_code%TYPE,
  p_prv_code         IN  provinces.prv_code%TYPE,
  p_sale_price       IN  NUMBER,
  p_prov_tax_amount  OUT NUMBER,
  p_fed_tax_amount   OUT NUMBER,
  p_prov_tax_rate    OUT NUMBER,
  p_fed_tax_rate     OUT NUMBER,
  p_tax_transport    IN  VARCHAR2 DEFAULT NULL
);

--procédure pour calculer les taux de taxes à la vente (pour un client)
--BER3866 Les montants des taxes sont toujours arrondit maintenant
PROCEDURE FIND_SALES_TAX_PROC(
  p_prd_code         IN  products.prd_code%TYPE,
  p_whs_code         IN  warehouses.whs_code%TYPE,  -- EFE344
  p_cus_code         IN  customers.cus_code%TYPE,
  p_sale_price       IN  NUMBER,
  p_prov_tax_amount  OUT NUMBER,
  p_fed_tax_amount   OUT NUMBER,
  p_prov_tax_rate    OUT NUMBER,
  p_fed_tax_rate     OUT NUMBER,
  p_tax_transport    IN  VARCHAR2 DEFAULT NULL
);

--CSC1485 procédure utilisé pour trouver les taux de taxes appliquées, et pour calculer le montant de taxe que ca donne appliqué sur le prix
PROCEDURE FIND_VENDOR_TAXES_PROC(
  p_prd_code          IN  VARCHAR2,
  p_whs_code          IN  warehouses.whs_code%TYPE,    -- EFE344
  p_ven_code          IN  vendors.ven_code%TYPE,
  p_cost_price        IN  NUMBER,
  p_prov_tax_amount   OUT NUMBER,
  p_fed_tax_amount    OUT NUMBER,
  p_prov_tax_rate     OUT NUMBER,
  p_fed_tax_rate      OUT NUMBER,
  p_dit_prov_tax_flag IN  VARCHAR2 DEFAULT 'P',      -- P = appliqué selon le produit (variable utile à précisé seulement pour les refacturations d'escomptes)
  p_dit_fed_tax_flag  IN  VARCHAR2 DEFAULT 'P'        -- P = appliqué selon le produit (variable utile à précisé seulement pour les refacturations d'escomptes)
);

--CSC1485 procédure qui applique les taux de taxes passés en paramètres, en utiliser la switch de taxe composé passée aussi en paramètre
PROCEDURE APPLY_PURCHASE_TAX_PROC (
  p_cost_price         IN NUMBER,
  p_fed_tax_rate        IN NUMBER,
  p_prov_tax_rate       IN NUMBER,
  p_prv_compounded_tax_switch IN NUMBER,
  p_fed_tax_amount      OUT NUMBER,
  p_prov_tax_amount      OUT NUMBER
);

--CSC1485 procédure qui cherche la province du fournisseur payable avant dappliquer les taxes
--permets de ne pas avoir a chercher nous même la province pour trouver la compounded switch
PROCEDURE APPLY_PURCH_TAX_WITH_VEN_PROC (
  p_cost_price     IN NUMBER,
  p_fed_tax_rate    IN NUMBER,
  p_prov_tax_rate   IN NUMBER,
  p_ven_code     IN NUMBER,
  p_fed_tax_amount  OUT NUMBER,
  p_prov_tax_amount  OUT NUMBER,
  p_find_tax_rate   IN NUMBER DEFAULT 0 --USG709 servant pour le calcul des taxes des surcharges pour les factures VG...
); --usg709

--BER3025 Calcul de base pour une taxe
FUNCTION CALCULATE_TAX_FUNC (
  p_tax_rate IN NUMBER,
  p_amount   IN NUMBER
) RETURN NUMBER;

--BER3025 Calcul la taxe fédérale
FUNCTION CALCULATE_FEDERAL_TAX_FUNC (
  p_tax_rate IN NUMBER,
  p_amount   IN NUMBER
) RETURN NUMBER;

--BER3025 Calcul la taxe consolidée
FUNCTION CALCULATE_COMPOUNDED_TAX_FUNC (
  p_tax_rate       IN NUMBER,
  p_amount         IN NUMBER,
  p_fed_tax_amount IN NUMBER
) RETURN NUMBER;

--BER3025 Calcul la taxe provinciale
FUNCTION CALCULATE_PROVINCIAL_TAX_FUNC (
  p_prov_tax_rate         IN NUMBER,
  p_fed_tax_rate          IN NUMBER,    --gcl9574
  p_amount                IN NUMBER,
  p_compounded_tax_switch IN NUMBER
) RETURN NUMBER;

--BER3025 Retourne la taxe provinciale et fédérale selon les taux spécifiés
PROCEDURE FIND_SALES_TAX_WITH_RATE_PROC (
  p_sale_price             IN NUMBER,
  p_prov_tax_rate          IN NUMBER,
  p_fed_tax_rate           IN NUMBER,
  p_compounded_tax_switch  IN NUMBER,
  p_prov_tax_amount        OUT NUMBER,
  p_fed_tax_amount         OUT NUMBER
);

FUNCTION GET_TAX_RATE_FUNC(
  p_tax_rate          IN NUMBER,
  p_tax_exempt_switch IN NUMBER
)
RETURN NUMBER;
PRAGMA RESTRICT_REFERENCES (GET_TAX_RATE_FUNC,RNDS,WNDS,RNPS,WNPS);

FUNCTION GET_TAX_RATE_FUNC(
  p_tax_rate   IN NUMBER,
  p_tax_switch IN NUMBER
)
RETURN NUMBER;
PRAGMA RESTRICT_REFERENCES (GET_TAX_RATE_FUNC,RNDS,WNDS,RNPS,WNPS);

END TAXES_PACK;
/