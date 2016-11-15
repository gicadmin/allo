CREATE OR REPLACE PACKAGE BODY phenix.PHXWEB_PACK
AS
/*
 *    GIMAT       DATE   AUTEUR      DESCRIPTION
 *   ------- ----------  --------    ---------------------------------------------------------------------------------------------------
 *   GIC3058 04-03-2010  TAHAR       Modification de la string de connexion pour que SQLPLUS nous demande pas les valeurs de key1 et key2
 *   CSC5685 18-02-2011  HIBA        Modifier la taille de la variable URL PSW dans la fonction URL PHXWEB BUILD FUNC
 *   USG730  13-05-2011  Najoua      Modifier les fonctions IS DISCOUNT FUNC, GET DISCOUNT FUNC  pour retourner la valeur du type de coutant (CUD COST USED) utilisé ds l'escompte
 *   GCL7708 27-08-2013  PMCANO      Refonte du coeur de l'application PHXWEB :
 * (+GCL7889)                                - Retrait de IS DISCOUNT FUNC, GET QUOTATION ID FUNC, ENCRYPT FUNC, DECRYPT FUNC, ENCRYPT2 FUNC, DECRYPT2 FUNC
 *                                           - Ajout de LOAD PHXWEB DATAS FUNC, LOAD MIN MAX TELE PROF FUNC, FIND TOTAL SAR FUNC, SET RECONCILIATION PROC, LOGIN PROC,
 *                                             GET USER FUNC, AUTO LOGIN FUNC, GET PERIOD START DATE FUNC, CHECK SPJ NAME CONTEXT FUNC, GET CONF BY NAME CONTEXT FUNC
 *                                           - Refaire URL PHXWEB CALL DRILLDOWN FUNC
 *   BER5710 27-05-2014  Carl C     Remettre IS DISCOUNT FUNC / GET QUOTATION ID FUNC
 *   BER7084 18-03-2015  Najoua     Modifier la fonction LOADMIN_MAX_TELE_PROF_FUNC pr tenir compte des exceptions de groupes de produits en priorité
 */

-----------------------------------------------------------------------------------------------------------------------
-- Construit un URL pour se connecter à l'écran d'enquête des ventes et profits
-----------------------------------------------------------------------------------------------------------------------
FUNCTION URL_PHXWEB_CALL_DRILLDOWN_FUNC (
     p_user_Code          IN NUMBER
)
RETURN VARCHAR2
AS
     v_app_name      VARCHAR(256);
     v_app_context   VARCHAR(25);
     v_param         VARCHAR(50);
BEGIN
     -- Nom de l'application
     SELECT sen_wms_server_name
     INTO   v_app_name
     FROM   system_environments;

     -- Context de l'application
     v_app_context := 'DRILLDOWN';

     -- Encryption de l'utilisateur
     v_param := GENERIC_PACK.ENCODE_MD5_FUNC(p_user_Code);

     -- Retourne l'URL
     RETURN 'http://' || v_app_name || '/' || v_app_context || '/controler?action=UserPhxLoginAction' || '&' || 'key=' || v_param;
END URL_PHXWEB_CALL_DRILLDOWN_FUNC;

-----------------------------------------------------------------------------------------------------------------------
-- 3 fonctions pour charger les valeurs du tableau de l'enquête des ventes et profits
-----------------------------------------------------------------------------------------------------------------------
FUNCTION LOAD_DRILLDOWN_DATAS_FUNC (
   p_from_date           IN DATE,
   p_to_date             IN DATE,
   p_verified            IN NUMBER,
   p_coh_id              IN CUSTOMER_ORDER_HEADERS.COH_ID%TYPE,
   p_cus_code            IN CUSTOMERS.CUS_CODE%TYPE,
   p_use_telemark_code   IN USERS.USE_CODE%TYPE,
   p_inh_id              IN INVOICE_HEADERS.INH_ID%TYPE,
   p_prd_code            IN CUSTOMER_ORDER_DETAILS.COD_PRF_PRD_CODE%TYPE,
   p_whs_delivery        IN CUSTOMER_ORDER_HEADERS.COH_WHS_DELIVERY_CODE%TYPE
)
RETURN SYS_REFCURSOR
AS
   v_recordset   SYS_REFCURSOR;
   v_sql         VARCHAR2(32000);
BEGIN
    v_sql := q'|    SELECT  coh.coh_id,
                            coh.coh_use_telemark_code,
                            use.use_first_name || ' ' || use.use_last_name AS telemarketerName,
                            coh.coh_whs_delivery_code,
                            cod.cod_line_number,
                            cod.cod_prf_prd_code,
                            cod.cod_whs_picking_code,
                            cod.cod_car_amount,
                            cod.cod_selling_retail_orig,
                            cod.cod_pricing_source_orig,
                            cod.cod_promotion_amount,
                            cod.cod_pty_code,
                            cod.cod_prebook_method,
                            cod.cod_royalty_amount,
                            cod.cod_surcharge,
                            cod.cod_pricing_source,
                            cod.cod_freegood_switch,
                            cod.cod_cod_coh_id,
                            inh.inh_id,
                            inh.inh_cus_code,
                            cus.cus_name AS customerNameFr,
                            NVL (cus.cus_alt_name, cus.cus_name) AS customerNameEn,
                            inh.inh_invoice_date,
                            inh.inh_sale_price_total,
                            inh.inh_cost_price_total,
                            prd.prd_description AS descriptionFr,
                            prd.prd_definition,
                            prd.prd_special_order_switch,
                            NVL (prd.prd_alt_description, prd.prd_description) AS descriptionEn,
                            PRD_PACK.FIND_BRN_MANUF_FUNC (cod.cod_prf_prd_code, 'F') AS brandnameFr,
                            PRD_PACK.FIND_BRN_MANUF_FUNC (cod.cod_prf_prd_code, 'E') AS brandnameEn,
                            prd.prd_pgr_code,
                            pgr.pgr_description AS groupDescFr,
                            NVL(pgr.pgr_alt_description, pgr.pgr_description) AS groupDescEn,
                            (inh.inh_sale_price_total - inh.inh_cost_price_total) AS total_profit,
                            ROUND((CASE WHEN ctr.ctr_admin_method = 'P' THEN
                                        (CASE WHEN inh.inh_sale_price_total > 0 THEN ((inh.inh_sale_price_total - inh.inh_cost_price_total) / inh.inh_sale_price_total) * 100
                                              ELSE 0
                                        END)
                                   ELSE (CASE WHEN inh.inh_cost_price_total > 0 THEN (1 - (  inh.inh_cost_price_total / inh.inh_sale_price_total)) * 100
                                              ELSE 0
                                        END)
                                   END), 2) AS total_profit_percent,
                            (CASE WHEN prd.prd_definition = 'S' THEN cod.cod_prf_fmt_code
                                  ELSE prd.prd_fmt_weighted_inv_code
                            END) AS format_code,
                            (CASE WHEN prd.prd_definition = 'S' THEN prf.prf_description
                                  ELSE prf2.prf_description
                            END) AS prf_description,
                            (CASE WHEN prd.prd_definition = 'S' THEN cot.cot_invoice_quantity
                                  ELSE cot.cot_invoice_weight
                            END) AS quantity,
                            (CASE WHEN prd.prd_definition = 'D' THEN cot.cot_invoice_quantity
                                  ELSE 0
                            END) AS dindeQuantity,
                            (cod_selling_retail - cod_credit_rebate_amount - DECODE (cod_credit_promotion_switch, 0, 0, cod_promotion_amount)) AS vendant,
                            cod.cod_cost_price,
                            cod.cod_average_list,
                            cod.cod_average_cost_1,
                            cod.cod_average_cost_2,
                            cod.cod_average_cost_3,
                            cod.cod_average_cost_4,
                            cod.cod_avg_real_list,
                            cod.cod_avg_real_cost_1,
                            cod.cod_avg_real_cost_2,
                            cod.cod_avg_real_cost_3,
                            cod.cod_avg_real_cost_4,
                            cod.cod_base_selling_cost,
                            ctr.ctr_admin_method,
                            (CASE WHEN cot.cot_use_code is not null THEN 1
                                  ELSE 0
                            END) AS verified,
                            cus.cus_dgt_code,
                            cod.cod_selling_retail
                    FROM    customer_order_headers coh JOIN
                            customer_order_details cod ON
                                (cod.cod_coh_id = coh.coh_id) JOIN
                            customer_order_transactions cot ON
                                (cot.cot_cod_line_number = cod.cod_line_number AND
                                cot.cot_cod_coh_id = cod.cod_coh_id) JOIN
                            invoice_headers inh ON
                                (inh.inh_id = cot.cot_inh_id) JOIN
                            product_formats prf ON
                                (prf.prf_fmt_code = cod.cod_prf_fmt_code AND
                                prf.prf_prd_code = cod.cod_prf_prd_code) JOIN
                            products prd ON
                                (prd.prd_code = prf.prf_prd_code) JOIN
                            product_groups pgr ON
                                (pgr.pgr_code = prd.prd_pgr_code) JOIN
                            customers cus ON
                                (cus.cus_code = inh.inh_cus_code) LEFT JOIN
                            users use ON
                                (use.use_code = coh.coh_use_telemark_code) LEFT JOIN
                            product_formats prf2 ON
                                (prf2.prf_fmt_code = prd.prd_fmt_weighted_inv_code AND
                                 prf2.prf_prd_code = prd.prd_code) JOIN
                            control ctr ON
                            (ctr.ctr_code = 1)
                    WHERE   ROWNUM <= 2000
                        AND prd.prd_attribute != 'COU'
               |';

    -- S'il y a des dates
    IF (p_from_date IS NOT NULL) THEN
        v_sql := v_sql || ' AND TRUNC(inh.inh_invoice_date) BETWEEN to_date('''||to_char(p_from_date,'YYYYMMDD')||''',''YYYYMMDD'') AND to_date('''||to_char(p_to_date,'YYYYMMDD')||''',''YYYYMMDD'') ';
    END IF;

    -- Transactions vérifiées
    IF (p_verified = 1) THEN
        v_sql := v_sql || ' AND cot.cot_use_code IS NOT NULL ';
    ELSE
        v_sql := v_sql || ' AND cot.cot_use_code IS NULL ';
    END IF;

    -- Facture
    IF (p_inh_id IS NOT NULL) THEN
         v_sql := v_sql || ' AND inh.inh_id = ' || p_inh_id;
    END IF;

    -- NumÃ©ro de commande
    IF (p_coh_id IS NOT NULL) THEN
         v_sql := v_sql || ' AND coh.coh_id = ' || p_coh_id;
    END IF;

    -- Code client
    IF (p_cus_code IS NOT NULL) THEN
         v_sql := v_sql || ' AND inh.inh_cus_code = ' || p_cus_code;
    END IF;

    -- Code télévendeur
    IF (p_use_telemark_code IS NOT NULL) THEN
         v_sql := v_sql || ' AND coh.coh_use_telemark_code = ' || p_use_telemark_code;
    END IF;

    -- Produit
    IF (p_prd_code IS NOT NULL) THEN
         v_sql := v_sql || ' AND cod.cod_prf_prd_code = ''' || UPPER(p_prd_code) || '''';
    END IF;

    -- Entrepot de livraison
    IF (p_whs_delivery IS NOT NULL) THEN
         v_sql := v_sql || ' AND coh.coh_whs_delivery_code = ' || p_whs_delivery;
    END IF;

    v_sql := v_sql || ' ORDER BY inh.inh_invoice_date DESC ';

    OPEN v_recordset FOR v_sql;

   RETURN v_recordset;
END LOAD_DRILLDOWN_DATAS_FUNC;

-----------------------------------------------------------------------------------------------------------------------
-- Charge les valeurs nécessaire à certains filtres de PHXWEB dans les groupes de produit
-----------------------------------------------------------------------------------------------------------------------
FUNCTION LOAD_MIN_MAX_TELE_PROF_FUNC
RETURN SYS_REFCURSOR
AS
   v_recordset   SYS_REFCURSOR;

BEGIN
  --BER7084 les exceptions de groupes de produits en priorité ....
  OPEN v_recordset FOR
      SELECT prd_code,
             pgr_max_telemark_prof_percent,
             pgr_min_telemark_prof_percent,
             pgr_maximum_profit_percent,
             pgr_minimum_profit_percent,
             cus_code
      FROM (
          SELECT prd.prd_code,
                         pgre.pgre_max_telemark_prof_percent pgr_max_telemark_prof_percent,
                         pgre.pgre_min_telemark_prof_percent pgr_min_telemark_prof_percent,
                         pgre.pgre_maximum_profit_percent pgr_maximum_profit_percent,
                         pgre.pgre_minimum_profit_percent pgr_minimum_profit_percent,
                         pgre.pgre_cus_code cus_code,
                         1 ordre
                  FROM	product_group_exceptions pgre,
                        products prd
                  WHERE pgre.pgre_pgr_code = prd.prd_pgr_code
                    AND prd.prd_status != 'D'
                    AND pgre.pgre_cus_code IS NOT NULL
                  UNION ALL
                  SELECT prd.prd_code,
                          pgr.pgr_max_telemark_prof_percent pgr_max_telemark_prof_percent,
                          pgr.pgr_min_telemark_prof_percent pgr_min_telemark_prof_percent,
                          pgr.pgr_maximum_profit_percent pgr_maximum_profit_percent,
                          pgr.pgr_minimum_profit_percent pgr_minimum_profit_percent,
                          NULL cus_code,
                          2 ordre
                   FROM product_groups pgr, products prd
                    WHERE prd.prd_pgr_code IS NOT NULL
                      AND prd.prd_pgr_code = pgr.pgr_code
                      AND prd.prd_status != 'D'
               )  ORDER BY prd_code, ordre ASC;

  RETURN v_recordset;

END LOAD_MIN_MAX_TELE_PROF_FUNC;


-----------------------------------------------------------------------------------------------------------------------
-- Trouve l'entente fournisseur
-----------------------------------------------------------------------------------------------------------------------
FUNCTION FIND_TOTAL_SAR_FUNC (p_coh_id           IN NUMBER,
                              p_cod_line_number  IN NUMBER,
                              p_cad_id           IN NUMBER DEFAULT NULL)
RETURN NUMBER
IS
BEGIN
     RETURN VENDOR_AGREEMENT_PACK.FIND_TOTAL_SAR_FUNC(p_coh_id,
                                                      p_cod_line_number,
                                                      p_cad_id);
END FIND_TOTAL_SAR_FUNC;

-----------------------------------------------------------------------------------------------------------------------
-- Met à jour les informations de validation d'une ligne de commande COT
-----------------------------------------------------------------------------------------------------------------------
PROCEDURE SET_RECONCILIATION_PROC(  p_coh_id                IN CUSTOMER_ORDER_HEADERS.coh_id%type,
                                    p_cod_line_number       IN CUSTOMER_ORDER_DETAILS.cod_line_number%type,
                                    p_use_code              IN USERS.use_code%type,
                                    p_reconciliation_date   IN DATE)
IS
BEGIN
    IF (p_cod_line_number is null) THEN
        COH_OPERATION_PACK.SET_RECONCILIATION_PROC( p_coh_id,
                                                    p_use_code,
                                                    p_reconciliation_date);
    ELSE
        COD_OPERATION_PACK.SET_RECONCILIATION_PROC( p_coh_id,
                                                    p_cod_line_number,
                                                    p_use_code,
                                                    p_reconciliation_date);
    END IF;

END SET_RECONCILIATION_PROC;

-----------------------------------------------------------------------------------------------------------------------
-- Login usager
-----------------------------------------------------------------------------------------------------------------------
PROCEDURE LOGIN_PROC (   phx_user IN USERS.use_login%type,
                         password IN USERS.use_password%type)
IS
BEGIN
    USE_OPERATION_PACK.LOGIN_PROC(phx_user, password);
END LOGIN_PROC;

-----------------------------------------------------------------------------------------------------------------------
-- Retourne les informations d'un utilisateur avec le login
-----------------------------------------------------------------------------------------------------------------------
FUNCTION GET_USER_FUNC(
     p_use_login     IN users.use_login%TYPE
)
RETURN SYS_REFCURSOR
AS
    v_use_code      NUMBER;
BEGIN
    v_use_code := USE_OPERATION_PACK.GET_USE_CODE_FUNC(p_use_login);
    RETURN GET_USER_FUNC(v_use_code);
END GET_USER_FUNC;

-----------------------------------------------------------------------------------------------------------------------
-- Retourne les informations d'un utilisateur
-----------------------------------------------------------------------------------------------------------------------
FUNCTION GET_USER_FUNC(
    p_use_code      IN users.use_code%TYPE
)
RETURN SYS_REFCURSOR
AS
    v_recordset     SYS_REFCURSOR;
BEGIN
    OPEN v_recordset FOR
        SELECT  use.use_code,
                use.use_login,
                use.use_first_name,
                use.use_last_name,
                use.use_language,
                use.use_whs_code
        FROM users use
        WHERE use.use_code = p_use_code;

    RETURN v_recordset;
END GET_USER_FUNC;

-----------------------------------------------------------------------------------------------------------------------
-- VÃ©rifie l'authentification automatique d'un utilisateur utilisant le menu d'enquête des ventes et profits de Phenix
-----------------------------------------------------------------------------------------------------------------------
FUNCTION AUTO_LOGIN_FUNC(
    p_param     IN VARCHAR2
)
RETURN users.use_code%TYPE
IS
BEGIN
    RETURN USE_OPERATION_PACK.CHECK_PHENIX_LOGIN_FUNC(p_param);
END AUTO_LOGIN_FUNC;

-----------------------------------------------------------------------------------------------------------------------
-- Retourne la date de début d'une période
-----------------------------------------------------------------------------------------------------------------------
FUNCTION GET_PERIOD_START_DATE_FUNC
RETURN fiscal_calendars.fca_start_date%TYPE
IS
    v_fca_period        fiscal_calendars.fca_period%TYPE;
    v_fca_year          fiscal_calendars.fca_year%TYPE;
    v_fca_start_date    fiscal_calendars.fca_start_date%TYPE;
BEGIN
    FCA_PACK.GET_FISCAL_INFO_BY_DATE_PROC(  SYSDATE,
                                            v_fca_year,
                                            v_fca_period);

    v_fca_start_date := FCA_PACK.GET_PERIOD_START_DATE_FUNC(    v_fca_period,
                                                                v_fca_year);

    RETURN v_fca_start_date;
END GET_PERIOD_START_DATE_FUNC;

-----------------------------------------------------------------------------------------------------------------------
-- Vérifie si le nom et le context du projet existe dans la BD
-----------------------------------------------------------------------------------------------------------------------
FUNCTION CHECK_SPJ_NAME_CONTEXT_FUNC (
    p_spj_name       IN SYSTEM_PROJECTS.SPJ_NAME%TYPE,
    p_spj_context    IN SYSTEM_PROJECTS.SPJ_CONTEXT%TYPE
)
RETURN NUMBER
IS
BEGIN
    RETURN SPJ_PACK.GET_NUMBER_COLUMN_FUNC(UPPER(p_spj_name), UPPER(p_spj_context), 'spj_id', false);
END CHECK_SPJ_NAME_CONTEXT_FUNC;

-----------------------------------------------------------------------------------------------------------------------
-- Retourne toutes le configurations du projet
-----------------------------------------------------------------------------------------------------------------------
FUNCTION GET_CONF_BY_NAME_CONTEXT_FUNC (
    p_spj_name       IN SYSTEM_PROJECTS.SPJ_NAME%TYPE,
    p_spj_context    IN SYSTEM_PROJECTS.SPJ_CONTEXT%TYPE
)
RETURN SYS_REFCURSOR
AS
BEGIN
    RETURN SPJ_OPERATION_PACK.GET_CONF_BY_NAME_CONTEXT_FUNC(  p_spj_name,
                                                              p_spj_context);
END GET_CONF_BY_NAME_CONTEXT_FUNC;

-------------------------------------------------------------------------------------------------------------
-- Détermine s'il y a un escompte et retourne les informations en conséquence
-------------------------------------------------------------------------------------------------------------
FUNCTION IS_DISCOUNT_FUNC (
  p_ncus_code           IN NUMBER,
  p_sprf_prd_code       IN VARCHAR2,
  p_sprf_fmt_code       IN VARCHAR2,
  p_nadmin_amount       IN OUT NUMBER,
  p_nadmin_percent      IN OUT NUMBER,
  p_npricing_strategy   IN OUT NUMBER,
  p_ncud_cost_used      IN OUT NUMBER --USG730
)
RETURN PLS_INTEGER IS
  v_return BOOLEAN := FALSE;
  v_integer PLS_INTEGER :=0 ;
BEGIN

   v_return := PRICE_ROUTINE_PACK.GET_DISCOUNT_FUNC(
    p_ncus_code,
    p_sprf_prd_code,
    p_sprf_fmt_code,
    p_nadmin_amount,
    p_nadmin_percent,
    p_npricing_strategy,
    p_ncud_cost_used --USG730
   );

  IF v_return THEN
    v_integer := 1;
  ELSE
    v_integer := 0;
  END IF;

  RETURN v_integer;

END IS_DISCOUNT_FUNC;

-------------------------------------------------------------------------------------------------------------
-- Détermine s'il existe une soumission et retourne un ID de la soummission
-------------------------------------------------------------------------------------------------------------
FUNCTION GET_QUOTATION_ID_FUNC(
  p_ncus_code       IN NUMBER,
  p_sprf_prd_code   IN VARCHAR2,
  p_sprf_fmt_code   IN VARCHAR2,
  p_nprf_price      IN OUT NUMBER,
  p_srp_promo_price IN OUT NUMBER,
  p_pty_code        IN OUT NUMBER,
  p_car_amount      IN OUT NUMBER,
  p_srp_quantity    IN OUT NUMBER,
  p_srp_format      IN OUT VARCHAR2
)
RETURN NUMBER IS

  v_integer NUMBER :=0 ;

  CURSOR cur_quotation IS
    SELECT  qtd_selling_price,
            qtd_srp_quantity,
            qtd_suggested_retail_price,
            qtd_pty_code,
            qtd_car_amount,
            QTD_QTH_ID
    FROM  quotation_headers,
          quotation_details,
          customers
    WHERE cus_code = p_ncus_code
      AND ((qth_cus_code = cus_code)
          OR (qth_qty_code = cus_qty_code)
          OR (qth_naz_nac_code = cus_naz_nac_code AND qth_naz_zone_code = cus_naz_zone_code))
      AND TRUNC(SYSDATE, 'DD') BETWEEN TRUNC(qth_start_date, 'DD') AND TRUNC(qth_end_date, 'DD')
      AND qth_id = qtd_qth_id
      AND qtd_prf_prd_code  = p_sprf_prd_code
      AND qtd_prf_fmt_code  = p_sprf_fmt_code
      AND qtd_selling_price > 0
    ORDER BY  qth_naz_nac_code,
              qth_cus_code,
              qth_qty_code;
  rec_quotation cur_quotation%ROWTYPE;

  CURSOR find_format_pds IS
    SELECT prd_srp_fmt_code
    FROM products
    WHERE prd_code = p_sprf_prd_code;

BEGIN

  OPEN cur_quotation;
  FETCH cur_quotation INTO rec_quotation;
  IF cur_quotation%FOUND THEN

    OPEN find_format_pds;
    FETCH find_format_pds INTO p_srp_format;
    CLOSE find_format_pds;
    p_srp_promo_price   := rec_quotation.qtd_suggested_retail_price;
    p_srp_quantity      := rec_quotation.qtd_srp_quantity;
    p_nprf_price        := rec_quotation.qtd_selling_price;
    p_pty_code          := rec_quotation.qtd_pty_code;
    p_car_amount        := rec_quotation.qtd_car_amount;
    v_integer           := rec_quotation.qtd_qth_id;

  ELSE
   v_integer := 0;
  END IF;

  CLOSE cur_quotation;

  RETURN v_integer;
END GET_QUOTATION_ID_FUNC;

-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
END PHXWEB_PACK;
/