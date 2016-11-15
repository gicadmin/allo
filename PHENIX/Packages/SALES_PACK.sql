CREATE OR REPLACE PACKAGE phenix.SALES_PACK IS

--fonction pour la somme quand on n'a que le coh_id
FUNCTION SUM_COD_PER_COH_FUNC(
  p_coh_id        IN NUMBER,
  p_sales_switch  IN NUMBER
)
RETURN NUMBER;

--gic3316 fonction pour la somme quand on a déjà le cus_code (sauve des tables dans le select)
FUNCTION SUM_COD_PER_COH_FUNC(
  p_coh_id        IN NUMBER,
  p_cus_code      IN NUMBER,
  p_sales_switch  IN NUMBER
)
RETURN NUMBER;

--Cette fonction calcule la somme d'une commande
FUNCTION SUM_COD_PER_COH_FUNC(
  p_coh_id        IN NUMBER,
  p_fed_tax       IN NUMBER,
  p_prv_tax       IN NUMBER,
  p_compound      IN NUMBER,
  p_sales_switch  IN NUMBER
)
RETURN NUMBER;

FUNCTION SUM_ALL_COD_FUNC(  --fre1593 faire un SUM_ALL pour quand on les veut tous les cod (maintain_custom_orders sen sert)
  p_cus_code      IN NUMBER,
  p_sales_switch  IN NUMBER
)
RETURN NUMBER;

--Cette fonction calcule la somme d'une ligne de commande.
FUNCTION GET_LINE_TOTAL_FUNC(
  p_qty       IN NUMBER,
  p_price     IN NUMBER,
  p_fed_tax   IN NUMBER,
  p_prv_tax   IN NUMBER,
  p_compound  IN NUMBER
)
RETURN NUMBER;

PROCEDURE INSERT_SALES_MEMO_PROC(
  p_message   IN VARCHAR2,
  p_type      IN VARCHAR2,
  p_cus_code  IN NUMBER,
  p_use_code  IN NUMBER
);

FUNCTION FIND_AVAILABLE_INCL_COD_FUNC(
    p_prd_code                      IN VARCHAR2,
    p_fmt_code                      IN VARCHAR2,
    p_whs_code                      IN VARCHAR2,
    p_cod_project_delivery_date     IN DATE,
    p_ven_delivery_date             IN DATE,
    p_sales_type                    IN VARCHAR2 DEFAULT 'REG'
)
RETURN NUMBER;

--fre1593 essais d'optimiser les select de télévente... pour quils utilisent le plus possible le même select
FUNCTION FIND_AVAILABLE_INV_ONLY_FUNC(
  p_prd_code        IN VARCHAR2,
  p_fmt_code        IN VARCHAR2 DEFAULT NULL,     --un des deux code format doit être rempli... sinon, on retourne la qté en format dinventaire
  p_fmt_short_code  IN VARCHAR2 DEFAULT NULL,
  p_whs_code        IN VARCHAR2
)
RETURN NUMBER;

--GIC2819 création de la procédure qui requiert toujours 1 des deux formats.. et cherche directement au format demandé..
FUNCTION FIND_PRF_AVAILAB_INV_ONLY_FUNC(
  p_prd_code        IN VARCHAR2,
  p_fmt_code        IN VARCHAR2 DEFAULT NULL,       --un des deux code format doit être rempli... sinon, on retourne 0 (zéro)
  p_fmt_short_code  IN VARCHAR2 DEFAULT NULL,
  p_whs_code        IN VARCHAR2
)
RETURN NUMBER;

--gic3316 remplir les valeurs par des procédures BD
PROCEDURE FIND_VALUES_PRICES_ETC_PROC(
  p_prd_code          IN VARCHAR2,
  p_fmt_code          IN VARCHAR2,  --doit être le format commandé (solide pour les B/D)
  p_ctr_admin_method  IN VARCHAR2,
  p_cost_price        IN NUMBER,
  p_selling_retail    IN NUMBER,
  p_value_01          OUT NUMBER,
  p_value_15          OUT NUMBER,
  p_value_16          OUT NUMBER,
  p_value_23          OUT NUMBER,
  p_value_26          OUT NUMBER
);

--gic3316 remplir les valeurs par des procédures BD
PROCEDURE FIND_VALUES_13_14_PROC(
  p_prd_code          IN VARCHAR2,
  p_fmt_code          IN VARCHAR2,  --doit être le format commandé (solide pour les B/D)
  p_cus_code          IN NUMBER,
  p_value_13          OUT NUMBER,   --dernier prix payé (profil)
  p_value_14          OUT NUMBER,   --derniere qté commandé (profil)
  p_last_date         OUT DATE      --date dernière vente--usg724
);

--gic3870 création dune nouvelle procédure
FUNCTION FIND_CPW_LAST_4_WEEKS_FUNC(  --exclue toujours la semaine courante... donc les 4 semaines avant ca
  p_prd_code            IN VARCHAR2,
  p_fmt_code            IN VARCHAR2,  --doit être le format commandé (solide pour les B/D)
  p_cus_code            IN NUMBER,
  p_season_start        IN DATE,      --NULL pour un produit pas saisonnier
  p_season_end          IN DATE,      --NULL pour un produit pas saisonnier
  p_oldest_date         IN DATE,      --date il y a 4 semaine.... doit être utilisé seulement pour les produits réguliers, car pour les saisonniers, ca varie tjrs selon les dates de saison
  p_current_fcw_week    IN NUMBER,    --doit TOUJOURS etre rempli
  p_current_fca_period  IN NUMBER,    --doit TOUJOURS etre rempli
  p_current_fca_year    IN NUMBER   --doit TOUJOURS etre rempli
)
RETURN NUMBER;    --somme des ventes des quatre dernières semaines

--gic3316 remplir les valeurs par des procédures BD
PROCEDURE FIND_VALUES_17_18_PROC(
  p_prd_code          IN VARCHAR2,
  p_fmt_code          IN VARCHAR2,  --doit être le format commandé (solide pour les B/D)
  p_whs_picking_code  IN VARCHAR2,
  p_value_17          OUT NUMBER,
  p_value_18          OUT NUMBER
);

--gic3316 remplir les valeurs par des procédures BD
PROCEDURE FIND_VALUES_19_20_PROC(
  p_prd_code          IN VARCHAR2,
  p_fmt_code          IN VARCHAR2,  --doit être le format commandé (solide pour les B/D)
  p_whs_picking_code  IN VARCHAR2,
  p_value_19          OUT NUMBER,
  p_value_20          OUT NUMBER
);

--gic3316 remplir les valeurs par des procédures BD
PROCEDURE FIND_VALUES_21_28_29_PROC(
  p_prd_code          IN VARCHAR2,
  p_language          IN VARCHAR2,
  p_value_21          OUT VARCHAR2,
  p_value_28          OUT VARCHAR2,
  p_value_29          OUT VARCHAR2
);

--gic3316 remplir les valeurs par des procédures BD
PROCEDURE FIND_VALUES_22_PROC(
  p_prd_code              IN VARCHAR2,
  p_fmt_code              IN VARCHAR2,  --doit être le format commandé (solide pour les B/D)
  p_value_22              OUT VARCHAR2,
  p_prf_surcharge         OUT product_formats.prf_surcharge%TYPE,
  p_prf_surcharge_percent OUT product_formats.prf_surcharge_percent%TYPE,
  p_fmt_surcharge         OUT formats.fmt_surcharge%TYPE,
  p_fmt_surcharge_percent OUT formats.fmt_surcharge_percent%TYPE
);

PROCEDURE FIND_VALUES_25_27_33_PROC(
  p_line_total        IN NUMBER,
  p_selling_retail    IN NUMBER,
  p_ctr_admin_method  IN VARCHAR2,
  p_cost_price        IN NUMBER,
  p_value_25          OUT VARCHAR2,
  p_value_27          OUT VARCHAR2,
  p_value_33          OUT VARCHAR2
);

--gic3316 remplir les valeurs par des procédures BD
PROCEDURE FIND_VALUES_36_PROC(
  p_prd_code          IN VARCHAR2,
  p_broker_ven_code   IN NUMBER,  --doit être le format commandé (solide pour les B/D)
  p_language          IN VARCHAR2,
  p_value_36          OUT VARCHAR2
);

--gic3316 remplir les valeurs par des procédures BD
PROCEDURE FIND_VALUES_38_PROC(
  p_prd_code          IN VARCHAR2,
  p_whs_picking_code  IN VARCHAR2,  --doit être le format commandé (solide pour les B/D)
  p_language          IN VARCHAR2,
  p_value_38          OUT VARCHAR2
);

--USG679 Fonction qui retourne si l'invnetaire du produit/format/entrepôt est infini ou non
FUNCTION FIND_INFINITE_INVENTORY_FUNC(
  p_prd_code  IN VARCHAR2,
  p_fmt_code  IN VARCHAR2,
  p_whs_code  IN VARCHAR2
)
RETURN NUMBER;

FUNCTION VALIDATE_DELIVERY_DATE_FUNC(
  p_prd_code                    IN products.prd_code%TYPE,
  p_whs_code                    IN warehouses.whs_code%TYPE,
  p_cus_whs_code                IN customers.cus_whs_code%TYPE,
  p_delivery_date               IN DATE,
  p_ven_next_delivery_code      IN OUT NUMBER,
  p_ven_next_delivery_date      IN OUT DATE,
  p_cutoff_time                 OUT VARCHAR2,
  p_cutoff_date                 OUT DATE,
  p_ven_next_delivery_date_orig OUT DATE
)
RETURN BOOLEAN;

FUNCTION VALIDATE_DELIVERY_DATE_FUNC(
  p_prd_code               IN products.prd_code%TYPE,
  p_whs_code               IN warehouses.whs_code%TYPE,
  p_cus_whs_code           IN customers.cus_whs_code%TYPE,
  p_delivery_date          IN DATE,
  p_ven_next_delivery_date IN OUT DATE,
  p_ven_next_delivery_code IN NUMBER
)
RETURN BOOLEAN;

FUNCTION VALIDATE_QTY_DATE_FUNC(
  p_prd_code                    IN products.prd_code%TYPE,
  p_fmt_code                    IN formats.fmt_code%TYPE,
  p_whs_code                    IN warehouses.whs_code%TYPE,
  p_cus_whs_code                IN customers.cus_whs_code%TYPE,
  p_delivery_date               IN DATE,
  p_infinite_inventory_switch   IN NUMBER,
  p_prd_special_order_switch    IN NUMBER,
  p_ven_next_delivery_date      IN OUT DATE,
  p_ven_next_delivery_code      IN OUT NUMBER,
  p_cutoff_time                 OUT VARCHAR2,
  p_cutoff_date                 OUT DATE,
  p_ven_next_delivery_date_orig OUT DATE
)
RETURN BOOLEAN;

FUNCTION VALIDATE_QTY_DATE_FUNC(
  p_prd_code                   IN products.prd_code%TYPE,
  p_fmt_code                   IN formats.fmt_code%TYPE,
  p_whs_code                   IN warehouses.whs_code%TYPE,
  p_cus_whs_code               IN customers.cus_whs_code%TYPE,
  p_delivery_date              IN DATE,
  p_ven_next_delivery_date     IN OUT DATE,
  p_ven_next_delivery_code     IN NUMBER,
  p_infinite_inventory_switch  IN NUMBER DEFAULT NULL,
  p_prd_special_order_switch   IN NUMBER DEFAULT NULL
)
RETURN BOOLEAN;

--BER7084 creer cette procedure pour le calcul des valeurs 31,32,34,35 en tenant compte exceptions de groupes de produit
PROCEDURE FIND_VALUES_31_32_34_35_PROC(
  p_cus_code                IN NUMBER,
  p_cus_qty_code            IN NUMBER,
  p_cus_pug_code            IN NUMBER,
  p_cus_cgr_code            IN NUMBER,
  p_prd_code                IN VARCHAR2,
  p_ctr_admin_method        IN VARCHAR2,
  p_cost_price              IN NUMBER,
  p_ctr_profit_range_used   IN VARCHAR2,
  p_value_31                OUT NUMBER,   --prix minimum
  p_value_32                OUT NUMBER,   --prix maximum
  p_value_34                OUT NUMBER,   --pourcentage profit minimum
  p_value_35                OUT NUMBER    --pourcentage profit maximum
);

PROCEDURE VALIDATE_SUBSTITUTION_PROC(
  p_cus_code               IN  customers.cus_code%TYPE,
  p_project_delivery_date  IN  DATE,
  p_ven_delivery_date      IN  DATE,
  p_prf_prd_code           IN  product_formats.prf_prd_code%TYPE,
  p_prf_fmt_code           IN  product_formats.prf_fmt_code%TYPE,
  p_whs_delivery_code      IN  warehouses.whs_code%TYPE,
  p_subst_current_qty_wgt  IN  NUMBER,
  p_subst_prf_prd_code     OUT product_formats.prf_prd_code%TYPE,
  p_subst_prf_fmt_code     OUT product_formats.prf_fmt_code%TYPE,
  p_subst_whs_picking_code OUT warehouses.whs_code%TYPE,
  p_subst_quantity_weight  OUT NUMBER
);

--BER9182 procedure pour remplir les valeurs 42, 43 et 44
PROCEDURE FIND_VALUES_42_43_44_PROC(
  p_selling_retail    IN NUMBER,
  p_ctr_admin_method  IN VARCHAR2,
  p_cost_price        IN NUMBER,
  p_best_promo_amount IN NUMBER,
  p_agreement_amount  IN NUMBER,
  p_vol_rebate_amount IN NUMBER,
  p_royalty_amount    IN NUMBER,
  p_car_amount        IN NUMBER,
  p_value_42          OUT NUMBER,  --best promo
  p_value_43          OUT NUMBER,  --pourcentage de profit
  p_value_44          OUT NUMBER   --coutant_ajuste selon les cases à cocher de paramétre systeme
);

END SALES_PACK;
/