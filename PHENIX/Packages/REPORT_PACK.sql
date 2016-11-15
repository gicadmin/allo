CREATE OR REPLACE PACKAGE phenix.REPORT_PACK IS

FUNCTION ACTIF_CUSTOMER_FUNC(p_from_date IN DATE,
                             p_end_date  IN DATE) RETURN NUMBER;

FUNCTION GET_MIN_LINE_WEIGHT_QTY_FUNC(p_cot_cod_coh_id      IN NUMBER,
                                      p_cot_cod_line_number IN NUMBER,
                                      p_cot_inh_id          IN NUMBER)
RETURN NUMBER;

FUNCTION GET_DISPLAY_TAX_FUNC(p_prd_code products.prd_code%TYPE,
                              p_type     VARCHAR2,
                              p_whs_code warehouses.whs_code%TYPE)
RETURN VARCHAR2;

FUNCTION GET_TOTAL_CASE_TAX_FUNC(p_cot_cod_coh_id           IN NUMBER,
                                 p_cot_cod_line_number      IN NUMBER,
                                 p_cot_inh_id               IN NUMBER,
                                 p_cot_federal_tax_rate     IN NUMBER,
                                 p_cot_provincial_tax_rate  IN NUMBER,
                                 p_cod_selling_retail       IN NUMBER)
RETURN NUMBER;

FUNCTION CALCUL_MOYENNE_FUNC(p_vendor   IN NUMBER,
                             p_prd_code IN VARCHAR2)
RETURN NUMBER;

FUNCTION SOMME_WEIGHT_COT_FUNC(p_inh_id IN NUMBER,
                               p_coh_id IN NUMBER,
                               p_ligne  IN NUMBER)
RETURN NUMBER;

FUNCTION DECODE_LANGUE_FUNC(p_language_user IN VARCHAR2,
                            p_if            IN VARCHAR2,
                            p_then_text     IN VARCHAR2,
						                p_else_text     IN VARCHAR2)
RETURN VARCHAR2;

FUNCTION GET_TOTAL_TPS_FUNC(p_cot_cod_coh_id          IN NUMBER,
                            p_cot_cod_line_number     IN NUMBER,
                            p_cot_inh_id              IN NUMBER,
                            p_cot_federal_tax_rate    IN NUMBER,
                            p_cot_provincial_tax_rate IN NUMBER,
                            p_cod_selling_retail      IN NUMBER)
RETURN NUMBER;

FUNCTION GET_TAX_TABAC_FUNC(p_prf_prd_code IN VARCHAR2)
RETURN NUMBER;

--CVI1544 trouver la taxe tabac sur l'inventaire
--Inventaire = la quantité totale entre les quatre murs moins la quantité dans les localisations de produits endommagés et en retenu
FUNCTION GET_TAX_TABAC_HAND_N_DOCK_FUNC(p_prf_prd_code IN VARCHAR2)
RETURN NUMBER;

FUNCTION GET_SRP_FUNC(p_prd_code     IN VARCHAR2,
                      p_fmt_code     IN VARCHAR2,
                      p_cus_srt_code IN NUMBER)
RETURN NUMBER;

FUNCTION GET_PROFIT_MAX_FUNC(p_prd_code        IN VARCHAR2,
                             p_prd_pgr_code    IN NUMBER DEFAULT NULL) --fre877 ne pas accéder à la table product si pas nécessaire
RETURN NUMBER;

FUNCTION GET_PROFIT_MIN_FUNC(p_prd_code        IN VARCHAR2,
                             p_prd_pgr_code    IN NUMBER DEFAULT NULL) --fre877 ne pas accéder à la table product si pas nécessaire
RETURN NUMBER;

FUNCTION FORMAT_TYPE_FUNC(p_prd_code IN VARCHAR2)
RETURN VARCHAR2;

FUNCTION CALCUL_PO_ON_ORDER_FUNC(p_prd_code       IN VARCHAR2,
                                 p_prf_fmt_code   IN VARCHAR2,
                                 p_prd_definition IN VARCHAR2 DEFAULT NULL,
                                 p_max_poh_date   IN DATE DEFAULT NULL )
RETURN NUMBER;
								--SIl y a des pod fixed delivery, on prendra seulement ceux livrable avant la date en paramètre
                                --si le paramètre est null, on ne valide pas la date

FUNCTION TOTAL_SALES_FUNC(p_year_in      IN NUMBER,
                          p_period_in    IN NUMBER,
                          p_week_in      IN NUMBER,
                          p_current_flag IN VARCHAR2,
                          p_cumul_flag   IN VARCHAR2,
                          p_total        IN NUMBER,
                          p_invoice_date IN DATE)
RETURN NUMBER;

FUNCTION CIG_SALES_FUNC(p_inh_id      IN NUMBER,
                        p_inh_type    IN VARCHAR2,
                        p_carton_switch IN NUMBER)
RETURN NUMBER;

FUNCTION NEXT_WEEK_SALES_FUNC(p_year_in      IN NUMBER,
                              p_period_in    IN NUMBER,
                              p_week_in      IN NUMBER)
RETURN NUMBER;

FUNCTION GET_PCT_ID_FUNC(p_ctt_code IN NUMBER,
                         p_cus_code IN NUMBER,
                         p_prd_code IN VARCHAR2,
                         p_prf_code IN VARCHAR2,
                         p_pgr_code IN NUMBER,
                         p_date     IN DATE)
RETURN NUMBER;

FUNCTION GET_FORMAT_PGR_FUNC(p_prd_code IN VARCHAR2)
RETURN VARCHAR2;

FUNCTION CHECK_NUMBER_FUNC(p_num_to_test IN VARCHAR2,
                           p_allow_minus IN VARCHAR2 := 'N')
RETURN NUMBER;

FUNCTION FIND_RECLAIMS_TOTAL_FUNC(p_coh_id      IN NUMBER,  --fre815
                                  p_cod_line_number IN NUMBER)
RETURN NUMBER;

FUNCTION FIND_OBJECT_FUNC(p_vrg_code  IN NUMBER,  --cvi85
                          p_amount   IN NUMBER)
RETURN NUMBER;

--------------------------------------------------------------------------------------------------------------------------------
--Procédure qui appel la procédure IMPORT_REPORT_IMAGE_PROC du schéma SYSTEM pour importer une image dans la table report_images
--------------------------------------------------------------------------------------------------------------------------------
PROCEDURE CALL_IMPORT_REPORT_IMAGE_PROC(p_jsc_id IN NUMBER);

--------------------------------------------------------------------------------------------------------------------------------
--Fonction qui retourne le plus grand format de conversion
--------------------------------------------------------------------------------------------------------------------------------
FUNCTION FIND_FMT_CONV_LARGER_FUNC(p_prf_prd_code      IN VARCHAR2,
                                   p_prd_definition    IN VARCHAR2,
                                   p_conversion_tested IN NUMBER,
                                   p_whs_code          IN VARCHAR2 DEFAULT NULL,  --GIC2866 pr suggèrer de reconstruire des formats qui sont dans le même entrepôt.
                                   p_loc_code          IN VARCHAR2 DEFAULT NULL)
RETURN NUMBER; --GIC2866 pr suggèrer de reconstruire des formats qui sont dans la même localisation.

--CVI1073 création de la fonction pour calculer à l'avance de montant des escomptes drops
FUNCTION FIND_DROP_DISCOUNTS_FUNC(p_reference_number IN VARCHAR2, --validera contre le CDS_... et le CDD_CDS...
                                  p_cus_code         IN NUMBER,  --validera contre le CDS_... et le CDD_CDS..
                                  p_vds_id           IN NUMBER)
RETURN NUMBER;   --validera contre le CDS_... et le CDD_CDS..

--gic2898procédure utilisé pour le rapport : rap_vente_sommaire_par_manuf
PROCEDURE RAP_VENTE_SOMMAIRE_MANUF_PROC(p_du_manuf           IN NUMBER,
                                        p_au_manuf           IN NUMBER,
                                        p_period             IN NUMBER,
                                        p_year               IN NUMBER,
                                        p_include_retailers  IN VARCHAR2,
                                        p_language_rapport   IN VARCHAR2 DEFAULT 'FR');

FUNCTION FIND_INVOICE_DATE_FUNC(p_prd_code IN VARCHAR2, --fre2782
                                p_cus_code IN NUMBER)
RETURN DATE;

--BER7084 nouvelle fonction qui sera appelée ds les rapports
FUNCTION GET_PROFIT_CUS_MIN_FUNC(p_cus_code        IN NUMBER,
                                 p_prd_code        IN VARCHAR2,
                                 p_profit_percent  IN NUMBER)
RETURN NUMBER;

--BER7084 nouvelle fonction qui sera appelée ds les rapports
FUNCTION GET_PROFIT_CUS_MAX_FUNC(p_cus_code        IN NUMBER,
                                 p_prd_code        IN VARCHAR2,
                                 p_profit_percent  IN NUMBER)
RETURN NUMBER;

--cvi3264 nouvelle fonction
FUNCTION GET_TAX_TABAC_WHS_FUNC(
  p_prf_prd_code  IN VARCHAR2,
  p_whs_code      IN VARCHAR2
)
RETURN NUMBER;
END REPORT_PACK;
/