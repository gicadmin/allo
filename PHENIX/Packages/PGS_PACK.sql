CREATE OR REPLACE PACKAGE phenix.PGS_PACK IS

--La fonction permet de récupérer la date de changement changement de prix la plus proche de la date actuelle
--return: la date de changement de prix la plus proche de la date actuelle
FUNCTION GET_RECENT_PRCHG_EFF_DATE_FUNC(
	prd_code IN VARCHAR2,
	fmt_code IN VARCHAR2
)
RETURN VARCHAR2;

--La fonction le code de format abrégé à partir d'un code de formats
--return: Le code de format abrégé
FUNCTION GET_FMT_SHORT_CODE_FUNC(
	fmt_code_param IN VARCHAR2
)
RETURN VARCHAR2;

--La fonction permet de retourner le code universel du produit à partir du code de produit
--return: Le code unversel du produit
FUNCTION GET_PRF_UPC_CODE_FUNC(
	prd_code_param 				IN VARCHAR2,
	fmt_short_code_param 	IN VARCHAR2
)
RETURN VARCHAR2;

/****** Procédures et fonctions d'aide *******/

--Cette fonction permet d'obtenir la conversion entre un format et le format vendable
--Utilisé du coté Colabor à la création.
FUNCTION  GET_CONVERSION(
  prdCode 	   						IN VARCHAR2,
  fmtShortCode 						IN VARCHAR2,
  conversionToBaseForLine IN NUMBER
)
RETURN NUMBER;

--Cette fonction permet de trouver le format équivalent  à la conversion recu du broker
FUNCTION GET_FORMAT_FOR_CONVERSION(
  prdCode 	   				IN VARCHAR2, 	-- vpd_code
  conversion   				IN NUMBER,
  invoiced_by_weight	IN NUMBER
)
RETURN VARCHAR2;

--Cette procedure permet de débuter une séquence de LOGS  en créant un LOG_HEADERS
FUNCTION  LOG_HEADER_FUNC(
  modulename IN VARCHAR2,
  moduletype IN VARCHAR2,
  filein     IN VARCHAR2,
  fileout    IN VARCHAR2,
  message    IN VARCHAR2,
  logid      IN NUMBER
)
RETURN NUMBER;

--Cette procedure permet d'ajouter des détails à une séquence de LOGS en créant un LOG_DETAILS
PROCEDURE  LOG_DETAIL_PROC (
  lohid        IN NUMBER,
  linenumber   IN NUMBER,
  message      IN VARCHAR2,
  errormessage IN VARCHAR2
);

--Cette procedure permet de conclure une séquence de LOGS  en fermant le LOG_HEADERS
PROCEDURE  LOG_COMPLETED_PROC (
  lohid   IN NUMBER,
  message IN VARCHAR2
);

--Cette fonction permet de retourner le ID du NCH en fonction du ID de colabor le ID sera validé avec le NCH_SYNCHRONIZATION_ID
FUNCTION GET_NCH_ID(
  remotench_id IN NUMBER
)
RETURN NUMBER;

--Cette fonction permet de retourner le ID du QTH en fonction du ID de colabor le ID sera validé avec le QTH_SYNCHRONIZATION_ID
FUNCTION GET_QTH_ID(
  remoteqth_id IN NUMBER
)
RETURN NUMBER;

--Cette fonction permet de retourner le FMT_CODE format d'achat de colabor chez le distributeur */
FUNCTION GET_FMT_CODE(
  remoteprd_code 				IN VARCHAR2
)
RETURN VARCHAR2;

--Cette fonction permet de retourner le PRD_CODE (local) en fonction du PRD_CODE de colabor
FUNCTION GET_LOCAL_PRD_CODE(
  remoteprd_code IN VARCHAR2
)
RETURN VARCHAR2;

--Cette fonction permet de retourner le VEN_CODE (local) en fonction du VEN_CODE de colabor
FUNCTION GET_LOCAL_VEN_CODE(
  remoteven_code IN NUMBER
)
RETURN NUMBER;

--Cette fonction permet de retourner le VCG_ID (local) en fonction du VCG_CODE / VEN_CODE de colabor
FUNCTION GET_LOCAL_VCG_ID(
  remoteven_code IN NUMBER,
  remotevcg_code IN VARCHAR2
)
RETURN NUMBER;

/******   Fonctions relatives aux NAC  *******/

--Fonction qui NETTOYE les tables NAC, vide toutes les données relatives aux NAC
--RETURN  STATUS  NUMBER  0 = rien de fait, 1 = créé, -1 = erreur
FUNCTION  NAC_CLEAN_UP_FUNC (
  lohId           IN NUMBER,    -- LOH_ID
  commitedstatus	OUT NUMBER    -- Confirme si tout est ok ou si un ROLLback est survenu
)
RETURN VARCHAR2;

--Fonction qui recoit les valeurs permettant de créer/mettre à jour un compte national
-- @RETURN  STATUS  NUMBER  0 = rien de fait, 1 = créé, -1 = erreur
FUNCTION  NAC_INSERT_NAC_FUNC (
  lohid                         IN NUMBER,    -- LOH_ID
  naccode                       IN NUMBER,    -- NAC_CODE
  nacdescription                IN VARCHAR2,  -- NAC_DESCRIPTION
  nacalt_description            IN VARCHAR2,  -- NAC_ALT_DESCRIPTION
  nacadmin_method               IN VARCHAR2,  -- NAC_ADMIN_METHOD
  nacproduct_identifier         IN VARCHAR2,  -- NAC_PRODUCT_IDENTIFIER
  nacinclude_car_amount_switch  IN NUMBER,    -- NAC_INCLUDE_CAR_AMOUNT_SWITCH
  nacaddress                    IN VARCHAR2,  -- NAC_ADDRESS
  naccity                       IN VARCHAR2,  -- NAC_CITY
  nacprv_code                   IN VARCHAR2,  -- NAC_PRV_CODE
  nacpostal_code                IN VARCHAR2,  -- NAC_POSTAL_CODE
  naccode_uniqueid              IN NUMBER     -- NAC_SYNCHRONIZATION_ID
)
RETURN VARCHAR2;

--Fonction qui recoit les valeurs permettant de créer/mettre à jour une zone NAC
-- @RETURN  STATUS  NUMBER   0 = rien de fait, 1 = créé, -1 = erreur
FUNCTION  NAC_INSERT_ZONE_FUNC (
  lohid               IN NUMBER,    -- loh_id
  naznac_code         IN NUMBER,    -- naz_nac_code
  nazcode             IN NUMBER,    -- naz_code
  nazdescription      IN VARCHAR2,  -- naz_description
  nazalt_description  IN VARCHAR2,  -- naz_alt_description
  nazprv_code         IN VARCHAR2,  -- naz_prv_code
  nazsrt_code         IN NUMBER,    -- naz_srt_code
  uniqueid            IN NUMBER     -- naz_synchronization_id
)
RETURN VARCHAR2;

--Fonction qui recoit les valeurs permettant de créer/mettre à jour un GROUPE de produits NAC
-- @RETURN  STATUS  NUMBER  0 = rien de fait, 1 = créé, -1 = erreur
FUNCTION  NAC_INSERT_GROUP_FUNC (
  lohid                         IN NUMBER,    -- loh_id
  nagnac_code                   IN NUMBER,    -- nag_nac_code
  nagcode                       IN VARCHAR2,  -- nag_code
  nagdescription                IN VARCHAR2,  -- nag_description
  nagalt_description            IN VARCHAR2,  -- nag_alt_description
  uniqueid                      IN NUMBER     -- nag_synchronization_id
)
RETURN VARCHAR2;

--Fonction qui recoit les valeurs permettant de créer/mettre à jour une en-tête de catalogue NAC
-- @RETURN  STATUS  NUMBER  0 = rien de fait, 1 = créé, -1 = erreur
FUNCTION  NAC_INSERT_CATALOG_HEADER_FUNC (
  lohid                IN NUMBER,    -- loh_id
  nchnac_code          IN NUMBER,    -- nch_nac_code
  nchprint_sequence    IN NUMBER,    -- nch_print_sequence
  nchdescription       IN VARCHAR2,  -- nch_description
  nchalt_description   IN VARCHAR2,  -- nch_alt_description
  nchid                IN NUMBER     -- nch_synchronization_id
)
RETURN VARCHAR2;

--Fonction qui recoit les valeurs permettant de créer/mettre à jour PRODUIT-FORMAT NAC
-- @RETURN  STATUS  NUMBER  0 = rien de fait, 1 = créé, -1 = erreur
FUNCTION  NAC_INSERT_PRODUCT_FORMAT_FUNC (
  lohid                 IN NUMBER,    -- loh_id
  npfnac_code           IN NUMBER,    -- npf_nac_code
  npfprf_prd_code       IN VARCHAR2,  -- npf_prf_prd_code
  npfprf_fmt_code       IN VARCHAR2,  -- npf_prf_fmt_code
  npfsequence           IN NUMBER,    -- npf_sequence
  npfnch_id             IN NUMBER,    -- npf_nch_id
  npfnag_nac_code       IN NUMBER,    -- npf_nag_nac_code
  npfnag_code           IN VARCHAR2,  -- npf_nag_code
  npfproduct_code       IN VARCHAR2,  -- npf_product_code
  npfconversion				  IN NUMBER,	--
  npfinvoiced_by_weight	IN NUMBER,	--
  uniqueid              IN NUMBER     -- npf_synchronization_id
)
RETURN VARCHAR2;

--Fonction qui recoit les valeurs permettant de créer/mettre à jour une en-tête de soumission NAC
-- @RETURN  STATUS  NUMBER  0 = rien de fait, 1 = créé, -1 = erreur
FUNCTION  NAC_INSERT_QUOTATION_HDR_FUNC (
  lohid                   IN NUMBER,    -- loh_id
  qthnaz_nac_code         IN NUMBER,    -- qth_naz_nac_code
  qthnaz_zone_code        IN NUMBER,    -- qth_naz_zone_code
  qthstart_date           IN DATE,      -- qth_start_date
  qthend_date             IN DATE,      -- qth_end_date
  qthprice_change_percent IN NUMBER,    -- qth_price_change_percent
  qthpromotion_percent    IN NUMBER,    -- qth_promotion_percent
  qthcus_code             IN NUMBER,    -- qth_cus_code
  qthqty_code             IN NUMBER,    -- qth_qty_code
  qthinterval             IN NUMBER,    -- qth_interval
  qthrenewal_flag         IN VARCHAR2,  -- qth_renewal_flag
  qthrecalc_lead_days     IN NUMBER,    -- qth_recalc_lead_days
  qthrecalculated_switch  IN NUMBER,    -- qth_recalculated_switch
  qthagreement_percent    IN NUMBER,    -- qth_agreement_percent
  qthcreation_date        IN DATE,      -- syt_creation_date
  qthmodification_date    IN DATE,      -- syt_modification_date
  qthelimination_date     IN DATE,      -- syt_elimination_date
  qthid                   IN NUMBER     -- qth_synchronization_id
)
RETURN VARCHAR2;

--Fonction qui recoit les valeurs permettant  de créer/mettre à jour les détails de soumission NAC
-- @RETURN  STATUS  NUMBER  0 = rien de fait, 1 = créé, -1 = erreur
FUNCTION  NAC_INSERT_QUOTATION_DTL_FUNC (
  lohid                         IN NUMBER,              -- loh_id
  qtdqth_id                     IN NUMBER,              -- qtd_qth_id
  qtdline_number                IN NUMBER,              -- qtd_line_number
  qtdprf_prd_code               IN VARCHAR2,            -- qtd_prf_prd_code
  qtdfmt_short_code             IN VARCHAR2,            -- qtd_prf_fmt_code
  qtdadditional_adjustment      IN NUMBER,              -- qtd_additional_adjustment
  qtdadmin_amount               IN NUMBER,              -- qtd_admin_amount
  qtdauto_extend_switch         IN NUMBER,              -- qtd_auto_extend_switch
  qtdcost_strategy              IN NUMBER,              -- qtd_cost_strategy
  qtdmarkup_used                IN NUMBER,              -- qtd_markup_used
  qtdprint_control              IN VARCHAR2,            -- qtd_print_control
  qtdprint_sequence             IN NUMBER,              -- qtd_print_sequence
  qtdpromotion_amount           IN NUMBER,              -- qtd_promotion_amount
  qtdselling_price              IN NUMBER,              -- qtd_selling_price
  qtdcustomer_product_code      IN VARCHAR2,            -- qtd_customer_product_code
  qtdsuggested_retail_price     IN NUMBER,              -- qtd_suggested_retail_price
  qtdcount_amount               IN NUMBER,              -- qtd_count_amount
  qtdoriginal_cost              IN NUMBER,              -- qtd_original_cost
  qtdoriginal_retail            IN NUMBER,              -- qtd_original_retail
  qtdtobacco_tax                IN NUMBER,              -- qtd_tobacco_tax
  qtdsrp_quantity               IN NUMBER,              -- qtd_srp_quantity
  qtdsrp_percentage             IN NUMBER,              -- qtd_srp_percentage
  qtdsub_total                  IN NUMBER,              -- qtd_sub_total
  qtdroyalty_amount             IN NUMBER,              -- qtd_royalty_amount
  qtdpty_code                   IN NUMBER,              -- qtd_pty_code
  qtdnpf_nac_code               IN NUMBER,              -- qtd_npf_nac_code
  qtdnpf_prf_prd_code           IN VARCHAR2,            -- qtd_npf_prf_prd_code
  qtdnpf_prf_fmt_short_code     IN VARCHAR2,            -- qtd_npf_prf_fmt_code
  qtdcreation_date              IN DATE,                -- syt_creation_date
  qtdmodification_date          IN DATE,                -- syt_modification_date
  qtdelimination_date           IN DATE,                -- syt_elimination_date
  qtdconversion				  				IN NUMBER,		          --
  qtdinvoiced_by_weight 		  	IN NUMBER,		          --
  uniqueid                      IN NUMBER,              -- qtd_synchronization_id
	qtduser_set_srp_fix_switch	  IN NUMBER,		          -- qtd_user_set_srp_fix_switch
  qtdprw_trans_in_cost_switch   IN NUMBER DEFAULT 1,    -- qtd_prw_trans_in_cost_switch
  qtdprd_admin_1_in_cost_switch IN NUMBER DEFAULT 1,    -- qtd_prd_admin_1_in_cost_switch
  qtdprd_adj_in_cost_switch     IN NUMBER DEFAULT 1,    -- qtd_prd_adj_in_cost_switch
  qtdprd_admin_2_in_cost_switch IN NUMBER DEFAULT 1     -- qtd_prd_admin_2_in_cost_switch
)
RETURN VARCHAR2;

/****  Fonctions relatives aux Produits  *****/

--Fonction qui recoit les valeurs permettant de créer/mettre à jour un fournisseur
FUNCTION SET_VENDOR_FUNC(
  lohid                        IN NUMBER,      -- loh_id
  vencode                      IN NUMBER,      -- ven_code
  venstatus                    IN VARCHAR2,    -- ven_status
  venduns_number               IN VARCHAR2,    -- ven_duns_number
  venname                      IN VARCHAR2,    -- ven_name
  vadaddress                   IN VARCHAR2,    -- vad_address
  vadcity                      IN VARCHAR2,    -- vad_city
  vadprv_code                  IN VARCHAR2,    -- vad_prv_code
  vadpostal_code               IN VARCHAR2,    -- vad_postal_code
  vadtelephone                 IN NUMBER,      -- vad_telephone
  vadfax_number                IN NUMBER,      -- vad_fax_number
  uselast_name                 IN VARCHAR2,    -- use_last_name
  usefirst_name                IN VARCHAR2,    -- use_first_name
  vencheck_deliv_date_switch   IN NUMBER,      -- ven_check_deliv_date_switch
  vencreation_date             IN DATE,        -- ven_creation_date
  venmodification_date         IN DATE,        -- ven_modification_date
  venelimination_date          IN DATE         -- ven_elimination_date
)
RETURN VARCHAR2;

--Fonction qui recoit les valeurs permettant de créer/mettre à jour un produit
FUNCTION SET_VENDOR_PRODUCT_FUNC(
  lohid                      		IN NUMBER,        -- loh_id
  vpdven_distributed_by_code 		IN NUMBER,        -- vpd_ven_distributed_by_code
  prdcode                    		IN VARCHAR2,      -- prd_code
  prfconversion_to_base      		IN NUMBER,        -- prf_conversion_to_base
  prfprice                   		IN NUMBER,        -- prf_price
  prfsales_multiple          		IN NUMBER,        -- prf_sales_multiple
  vpdven_manufactured_by_code 	IN NUMBER,       	-- vpd_ven_manufactured_by_code
  vpdmanufacturer_code       		IN VARCHAR2,      -- vpd_manufacturer_code
  prdcatalog_sequence_code  		IN NUMBER,        -- prd_catalog_sequence_code
  vcgcategory_code          		IN VARCHAR2,      -- vcg_category_code
  fmtshort_code             		IN VARCHAR2,      -- vpd_fmt_short_code
  prdattribute              		IN VARCHAR2,      -- prd_attribute
  prditems_per_palette      		IN NUMBER,        -- prd_items_per_palette
  prditems_per_row          		IN NUMBER,        -- prd_items_per_row
  prdshort_description      		IN VARCHAR2,      -- prd_short_description
  prdshort_alt_description  		IN VARCHAR2,      -- prd_short_alt_description
  prddescription            		IN VARCHAR2,      -- prd_description
  prdalt_description        		IN VARCHAR2,      -- prd_alt_description
  prdspecial_order_switch   		IN NUMBER,        -- prd_special_order_switch
  prdstatus                 		IN VARCHAR2,      -- prd_status
  prdseason_start           		IN DATE,          -- prd_season_start
  prdseason_end             		IN DATE,          -- prd_season_end
  prdproduct_life           		IN NUMBER,        -- prd_product_life
  prdsize                       IN products.prd_size%TYPE,        -- prd_size
  prdsize_uom               		IN products.prd_size_uom%TYPE,    -- prd_size_uom
  prdcreation_date          		IN DATE,          -- prd_creation_date
  prdmodification_date      		IN DATE,          -- prd_modification_date
  prdelimination_date       		IN DATE,          -- prd_elimination_date
  prfupc_code               		IN VARCHAR2,      -- prf_upc_code
  prfpurchase_weight        		IN NUMBER,        -- prf_purchase_weight
  prfheight                 		IN NUMBER,        -- prf_height
  prfwidth                  		IN NUMBER,        -- prf_width
  prflength                 		IN NUMBER,        -- prf_length
  prfnumber_of_items        		IN product_formats.prf_number_of_items%TYPE     -- prf_number_of_items
)
RETURN VARCHAR2;

--Fonction qui recoit les valeurs permettant de créer/mettre à jour une catégorie de produit
FUNCTION SET_VENDPRODCAT_FUNC(
  lohid                         IN NUMBER,   -- loh_id
  vcgven_code                   IN NUMBER,   -- vcg_ven_code
  vcgcategory_code              IN VARCHAR2, -- vcg_category_code
  vcgdescription                IN VARCHAR2, -- vcg_description
  vcgcollected_avr_percent      IN NUMBER,   -- vcg_collected_avr_percent
  vcgdistributed_avr_percent    IN NUMBER,   -- vcg_distributed_avr_percent
  vcgalt_description            IN VARCHAR2, -- vcg_alt_description
  vcgdrop_terms                 IN NUMBER,   -- vcg_drop_terms
  vcgquart_drop_ship_avr        IN NUMBER,   -- vcg_quart_drop_ship_avr
  vcgquart_warehouse_avr        IN NUMBER,    -- vcg_quart_warehouse_avr
  vcgdistributed_avr_amount     IN NUMBER,    --csc8720
  vcgcollect_distrib_qualifier  IN VARCHAR2,  --csc8720
  vcgquart_drop_ship_avr_amount IN NUMBER,    --csc8720
  vcgquart_warehouse_avr_amount IN NUMBER,    --csc8720
  vcgqualifier                  IN VARCHAR2   --csc8720
)
RETURN VARCHAR2;

/****  Fonctions relatives aux Promotions  ***/

--Fonction qui recoit les valeurs permettant de  créer/mettre à jour un type de promotion
FUNCTION SET_PROMOTION_TYPE_FUNC(
  lohid                           IN NUMBER,    -- loh_id
  ptycode                         IN NUMBER,    -- pty_code
  ptybroker_switch                IN NUMBER,    -- pty_broker_switch
  ptycost_plus_switch             IN NUMBER,    -- pty_cost_plus_switch
  ptydescription                  IN VARCHAR2,  -- pty_description
  ptyalt_description              IN VARCHAR2,  -- pty_alt_description
  ptytelemark_only_switch         IN NUMBER,    -- pty_telemark_only_switch
  ptyexceptional_sales_switch     IN NUMBER,    -- pty_exceptional_sales_switch
  ptyguaranteed_price_switch      IN NUMBER,    -- pty_guaranteed_price_switch
  ptyprebook_reservation_days     IN NUMBER    -- pty_prebook_reservation_days
)
RETURN VARCHAR2;

--Fonction qui recoit les valeurs permettant de créer/mettre à jour une  promotion client chez l'associé
-- Cette fonction est utilisée depuis SET_VENDOR_PROMOTION_FUNC()
FUNCTION SET_CUSTOMER_PROMOTION_FUNC(
  lohid                        IN NUMBER,    -- loh_id
  cprid                        IN NUMBER,    -- cpr_id
  cprtype                      IN VARCHAR2,  -- cpr_type
  cprprf_prd_code              IN VARCHAR2,  -- cpr_prf_prd_code
  fmtshort_code                IN VARCHAR2,  -- fmt_short_code
  cprpty_code                  IN NUMBER,    -- cpr_pty_code
  cprallocation_amount         IN NUMBER,    -- cpr_allocation_amount
  cprcount_switch              IN NUMBER,    -- cpr_count_switch
  cprposition_promo            IN VARCHAR2,  -- cpr_position_promo
  cprprebook_only_switch       IN NUMBER,    -- cpr_prebook_only_switch
  cprven_car_code              IN NUMBER,    -- cpr_ven_car_code
  cprcar_amount                IN NUMBER,    -- cpr_car_amount
  cprprebook_price             IN NUMBER,    -- cpr_prebook_price
  cprspecial_allocation        IN NUMBER,    -- cpr_special_allocation
  cprsrp_promo_price           IN NUMBER,    -- cpr_srp_promo_price
  cprsrp_quantity              IN NUMBER,    -- cpr_srp_quantity
  cprpage_number               IN NUMBER,    -- cpr_page_number
  cprrecount_processed_switch  IN NUMBER,    -- cpr_recount_processed_switch
  cprguaranteed_price          IN NUMBER,    -- cpr_guaranteed_price
  cprmessage_1                 IN VARCHAR2,  -- cpr_message_1
  cprmessage_2                 IN VARCHAR2,  -- cpr_message_2
  cprmessage_3                 IN VARCHAR2,  -- cpr_message_3
  cprfrom_date                 IN DATE,      -- cpr_from_date
  cprto_date                   IN DATE,      -- cpr_to_date
  cprbanner_from_date          IN DATE,      -- cpr_banner_from_date
  cprbanner_to_date            IN DATE,      -- cpr_banner_to_date
  cprlast_order_date           IN DATE,      -- cpr_last_order_date
  pbddelivery_dates            IN VARCHAR2,  -- pbd_delivery_dates
  cprelimination_date          IN DATE,      -- elimination_date
  cprcreation_date             IN DATE,      -- cpr_creation_date
  cprmodification_date         IN DATE,      -- cpr_elimination_date
  p_broker_vendor_id           IN NUMBER,    -- valeur provenant de la fonction
  p_vpd_prd_code               IN VARCHAR2,  -- valeur provenant de la fonction
  p_vpd_prf_fmt_code           IN VARCHAR2,  -- valeur provenant de la fonction
  cprmember_price              IN NUMBER     -- cpr_member_price
)
RETURN VARCHAR2;

--Fonction qui recoit les valeurs permettant de créer/mettre à jour une  promotion fournisseur chez l'associé
FUNCTION SET_VENDOR_PROMOTION_FUNC(
  lohid                        IN NUMBER,    -- loh_id
  cprid                        IN NUMBER,    -- cpr_id
  cprtype                      IN VARCHAR2,  -- cpr_type
  cprprf_prd_code              IN VARCHAR2,  -- cpr_prf_prd_code
  fmtshort_code                IN VARCHAR2,  -- fmt_short_code
  cprpty_code                  IN NUMBER,    -- cpr_pty_code
  cprallocation_amount         IN NUMBER,    -- cpr_allocation_amount
  cprcount_switch              IN NUMBER,    -- cpr_count_switch
  cprposition_promo            IN VARCHAR2,  -- cpr_position_promo
  cprprebook_only_switch       IN NUMBER,    -- cpr_prebook_only_switch
  cprven_car_code              IN NUMBER,    -- cpr_ven_car_code
  cprcar_amount                IN NUMBER,    -- cpr_car_amount
  cprfreegood_amount           IN NUMBER,    -- cpr_freegood_amount
  cprfreegood_volume           IN NUMBER,    -- cpr_freegood_volume
  cprprebook_price             IN NUMBER,    -- cpr_prebook_price
  cprspecial_allocation        IN NUMBER,    -- cpr_special_allocation
  cprsrp_promo_price           IN NUMBER,    -- cpr_srp_promo_price
  cprsrp_quantity              IN NUMBER,    -- cpr_srp_quantity
  cprpage_number               IN NUMBER,    -- cpr_page_number
  cprrecount_processed_switch  IN NUMBER,    -- cpr_recount_processed_switch
  cprguaranteed_price          IN NUMBER,    -- cpr_guaranteed_price
  cprmessage_1                 IN VARCHAR2,  -- cpr_message_1
  cprmessage_2                 IN VARCHAR2,  -- cpr_message_2
  cprmessage_3                 IN VARCHAR2,  -- cpr_message_3
  cprfrom_date                 IN DATE,      -- cpr_from_date
  cprto_date                   IN DATE,      -- cpr_to_date
  cprbanner_from_date          IN DATE,      -- cpr_banner_from_date
  cprbanner_to_date            IN DATE,      -- cpr_banner_to_date
  cprlast_order_date           IN DATE,      -- cpr_last_order_date
  pbddelivery_dates            IN VARCHAR2,  -- pbd_delivery_dates
  cprelimination_date          IN DATE,      -- elimination_date
  cprcreation_date             IN DATE,      -- cpr_creation_date
  cprmodification_date         IN DATE,      -- cpr_elimination_date
  cprmember_price              IN NUMBER,    -- cpr_member_price
	cpydecline_method_switch	   IN NUMBER	 	-- cpy_decline_method_switch
)
RETURN VARCHAR2;

/****  Fonctions relatives aux Chg de prix ****/

--Fonction qui recoit les valeurs permettant  de créer/mettre à jour un changement de prix
-- @RETURN  détails de décomptes  VARCHAR2
FUNCTION  SET_PRICE_CHANGE_FUNC (
  lohid                   IN NUMBER,    -- loh_id
  prxprf_prd_code         IN VARCHAR2,  -- prx_prf_prd_code
  prxprf_fmt_short_code   IN VARCHAR2,  -- prx_prf_fmt_code
  prxeffective_date	      IN DATE,      -- prx_effective_date
  prxposted_switch        IN NUMBER,    -- prx_posted_switch
  prxsell_price	        	IN NUMBER,    -- prx_sell_price
  prxtobacco_tax	      	IN NUMBER,    -- prx_tobacco_tax
  prxcreation_date	    	IN DATE,      -- prx_creation_date
  prxmodification_date  	IN DATE,      -- prx_modification_date
  prxelimination_date   	IN DATE,      -- prx_elimination_date
  prxinvoiced_by_weight 	IN NUMBER,    -- prd_invoiced_by_weight
	prxminimum_sale_price		IN NUMBER	  	-- prx_minimum_sale_price
)
RETURN VARCHAR2;

--CSC3108: fonction qui valide si tous les produits de la famille qu'on veut appliquer le changement de prix
-- possèdent tous les mêmes formats, sinon les conversions ne seront pas possible
FUNCTION APPROVE_FAMILY_FUNC(
	p_ppf_code 				IN NUMBER,
	p_prd_code 				IN VARCHAR2,
	p_prxprf_prd_code IN VARCHAR2
)
RETURN BOOLEAN;

--cvi84 Procédure qui véerifie les différents critéres avan d'insérer ou updater une promo client
PROCEDURE MISE_A_JOUR_CPR_PROC(
  lohid                        IN NUMBER,    -- loh_id
  cprid                        IN NUMBER,    -- cpr_id
  cprtype                      IN VARCHAR2,  -- cpr_type
  cprprf_prd_code              IN VARCHAR2,  -- cpr_prf_prd_code
  fmtshort_code                IN VARCHAR2,  -- fmt_short_code
  cprpty_code                  IN NUMBER,    -- cpr_pty_code
  cprallocation_amount         IN NUMBER,    -- cpr_allocation_amount
  cprcount_switch              IN NUMBER,    -- cpr_count_switch
  cprposition_promo            IN VARCHAR2,  -- cpr_position_promo
  cprprebook_only_switch       IN NUMBER,    -- cpr_prebook_only_switch
  cprven_car_code              IN NUMBER,    -- cpr_ven_car_code
  cprcar_amount                IN NUMBER,    -- cpr_car_amount
  cprprebook_price             IN NUMBER,    -- cpr_prebook_price
  p_cus_spec_allocation        IN NUMBER,    -- cpr_special_allocation calculé selon le margin
  cprsrp_promo_price           IN NUMBER,    -- cpr_srp_promo_price
  cprsrp_quantity              IN NUMBER,    -- cpr_srp_quantity
  cprpage_number               IN NUMBER,    -- cpr_page_number
  cprrecount_processed_switch  IN NUMBER,    -- cpr_recount_processed_switch
  cprguaranteed_price          IN NUMBER,    -- cpr_guaranteed_price
  cprmessage_1                 IN VARCHAR2,  -- cpr_message_1
  cprmessage_2                 IN VARCHAR2,  -- cpr_message_2
  cprmessage_3                 IN VARCHAR2,  -- cpr_message_3
  cprfrom_date                 IN DATE,      -- cpr_from_date
  cprto_date                   IN DATE,      -- cpr_to_date
  cprbanner_from_date          IN DATE,      -- cpr_banner_from_date
  cprbanner_to_date            IN DATE,      -- cpr_banner_to_date
  cprlast_order_date           IN DATE,      -- cpr_last_order_date
  pbddelivery_dates            IN VARCHAR2,  -- pbd_delivery_dates
  cprelimination_date          IN DATE,      -- elimination_date
  cprcreation_date             IN DATE,      -- cpr_creation_date
  cprmodification_date         IN DATE,      -- cpr_elimination_date
  p_broker_vendor_id           IN NUMBER,    -- valeur provenant de la fonction
  p_vpd_prd_code               IN VARCHAR2,  -- valeur provenant de la fonction
  p_vpd_prf_fmt_code           IN VARCHAR2,  -- valeur provenant de la fonction
  cprmember_price              IN NUMBER ,    -- cpr_member_price
  p_apt_pty_code               IN NUMBER,    -- p_apt_pty_code
  p_deliv_date1                IN DATE,
  p_deliv_date2                IN DATE,
  p_deliv_date3                IN DATE,
  p_deliv_date4                IN DATE,
  p_pty_allow_spec_order_sw    IN NUMBER,
  p_ok_with_rules              IN out NUMBER     -- flag
);

--GIC2069: Permet d'aller chercher la partie gauche de la clé dynamique passé en paramètres dans l'adresse URL
--(cette clé dynamique est additionné à une clé statique qui existait déjà 4375234
FUNCTION GET_LEFT_DYNAM_VALIDATION_KEY
RETURN VARCHAR2;

--GIC2069: Permet d'aller chercher la partie droite de la clé dynamique(cette clé dynamique est additionné à une
--clé statique qui existait déjà 2995629
FUNCTION GET_RIGHT_DYNAM_VALIDATION_KEY
RETURN VARCHAR2;

--CSC6452
	FUNCTION RETRIEVE_PRODUCT_INFO(
	p_prd_code			        IN	VARCHAR2,
	p_fmt_code			        IN	VARCHAR2,
	p_whs_code    	        IN	VARCHAR2,
	v_inventory_qty_weight  OUT NUMBER,
	v_next_recpt_qty_weight OUT NUMBER,
	v_next_reception_date   OUT DATE
) RETURN PLS_INTEGER;


FUNCTION  NAC_INSERT_VSA_FUNC (
  p_loh_id                      IN NUMBER,
  p_nac_code                    IN NUMBER
 )  RETURN VARCHAR2;


FUNCTION  NAC_INSERT_VED_FUNC (
  p_loh_id                    IN NUMBER,
  p_nac_code                  IN NUMBER,
  p_ved_agreement_type        IN VARCHAR2,
 	p_ved_cost_used             IN NUMBER,
 	p_vpd_code                  IN VARCHAR2,
  p_ved_agreement_amount      IN NUMBER,
  p_ved_agreement_percent     IN NUMBER,
  p_ved_end_date              IN DATE,
  p_ved_start_date            IN DATE
 )
RETURN VARCHAR2;

FUNCTION  NAC_INSERT_VCA_FUNC (
  p_lohid                     IN NUMBER,    -- loh_id
  p_nac_code                  IN NUMBER
 ) RETURN VARCHAR2;

FUNCTION  INSERT_FCG_FUNC (
  p_lohid                     IN NUMBER,
  p_fcg_code                  IN food_certification_groups.fcg_code%TYPE,
  p_fcg_description           IN food_certification_groups.fcg_description%TYPE,
  p_fcg_alt_description       IN food_certification_groups.fcg_alt_description%TYPE
 )
RETURN VARCHAR2;

FUNCTION  INSERT_FCR_FUNC (
  p_lohid                IN NUMBER,
  p_fcr_code             IN food_certifications.fcr_code%TYPE,
  p_fcr_description      IN food_certifications.fcr_description%TYPE,
  p_fcr_fcg_code         IN food_certifications.fcr_fcg_code%TYPE,
  p_fcr_alt_description  IN food_certifications.fcr_alt_description%TYPE,
  p_fcr_short_code       IN food_certifications.fcr_short_code%TYPE,
  p_fcr_logo             IN food_certifications.fcr_logo%TYPE,
  p_fcr_bottin_switch    IN food_certifications.fcr_bottin_switch%TYPE
)
RETURN VARCHAR2;

FUNCTION  INSERT_PFC_FUNC (
  p_lohid                IN NUMBER,
  p_pfc_fcr_fcg_code     IN product_food_certifications.pfc_fcr_fcg_code%TYPE,
  p_pfc_prd_code         IN product_food_certifications.pfc_prd_code%TYPE,
  p_pfc_fcr_code         IN product_food_certifications.pfc_fcr_code%TYPE
 )
RETURN VARCHAR2;

END PGS_PACK;
/