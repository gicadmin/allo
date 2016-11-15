CREATE OR REPLACE PACKAGE phenix.VSI_OPERATION_PACK AS

-- Recherche pour une prime donnée cherche s’il existent d'autres primes (autre qu'elle même)qui ont des dates qui chevauchent avec les dates en parametre.
FUNCTION EXIST_OVERLAP_DATES_FUNC(
  p_vsi_code        IN  vendor_sales_incentives.vsi_code%TYPE,
  p_vsi_start_date  IN  vendor_sales_incentives.vsi_start_date%TYPE,
  p_vsi_end_date    IN  vendor_sales_incentives.vsi_end_date%TYPE
) RETURN BOOLEAN ;
--------------------------------------------------------------------------
FUNCTION  EXIST_OVERLAP_CUS_FUNC(
  p_vsi_code    IN  vendor_sales_incent_customers.vsic_vsi_code%TYPE,
  P_cus_code    IN  vendor_sales_incent_customers.vsic_cus_code%TYPE,
  P_cgr_code    IN  vendor_sales_incent_customers.vsic_cgr_code%TYPE
) RETURN BOOLEAN ;

--------------------------------------------------------------------------
FUNCTION  EXIST_OVERLAP_PRD_FUNC(
  p_vsi_code           IN  vendor_sales_incentives.vsi_code%TYPE,
  p_vsip_prf_prd_code  IN  vendor_sales_incent_products.vsip_prf_prd_code%TYPE,
  p_vsip_prf_fmt_code  IN  vendor_sales_incent_products.vsip_prf_fmt_code%TYPE
) RETURN BOOLEAN ;

-----------------------------------------------------------------------------------------------
PROCEDURE CREATE_INH_PROC(
  p_inh_ven_code             IN NUMBER, --payable
  p_inh_ven_invoice_for_code IN NUMBER,  --Original
  p_inh_id                   OUT NUMBER
)  ;
 ---------------------------------------------------------
--fonction  pour la mise à jour  les totaux du invoice_headers
PROCEDURE UPDATE_INH_PROC(
  p_inh_federal_tax_total     IN NUMBER,
  p_inh_provincial_tax_total  IN NUMBER,
  p_inh_sale_price_total      IN NUMBER,
  p_inh_cost_price_total      IN NUMBER,
  p_inh_id                    IN NUMBER
)  ;
 ---------------------------------------------------------------------
FUNCTION HAS_SAME_MANUF_FUNC(
 p_vsi_code IN vendor_sales_incentives.vsi_code%TYPE
 )  RETURN BOOLEAN ;
------------------------------------------------------------------------------

PROCEDURE PURGE_PROC(
  p_prd_code  IN vendor_sales_incentives.vsi_freegood_prf_prd_code%TYPE
) ;
--------------------------------------------------------------------------

PROCEDURE INVOICE_INCENTIVES_PROC;

-----------------------------------------------------------------------------------------------

PROCEDURE INSERT_ALL_FORMATS_PROC (
 p_vsip_vsi_code     IN vendor_sales_incent_products.vsip_vsi_code%TYPE,
 p_insert            OUT BOOLEAN
 );
 --------------------------------
 FUNCTION DELETE_PROD_NOTSAME_MANUF_FUNC(
 p_vsip_vsi_code     IN vendor_sales_incent_products.vsip_vsi_code%TYPE
 ) RETURN NUMBER;


 PROCEDURE GET_FREEGOOD_ALLOWED_PROC(
  p_vsi_code                        IN vendor_sales_incentives.vsi_code%TYPE,
  p_qty_prd_participants_sold       IN NUMBER,  --qté vendue de produits participants à la prime
  p_qty_prd_freegood_sold           IN NUMBER,  --qté vendue de produits de gratuité de la prime
  p_free_not_vsi_qty_sold           IN NUMBER,
  p_add_free_if_enough_switch       IN NUMBER ,
  p_qty_prd_pacticipants_added      OUT NUMBER, --qté gratuite meritée du produit prime
  p_qty_prd_freegood_added          OUT NUMBER, --qté gratuite meritée du produit de gratuité
  p_qty_prd_freegood_to_add         OUT NUMBER  --qté de produit gratuit à ajouter lorsqu il n'y en a pas sufisamment dans la commande
);

 PROCEDURE APPLICATE_FREEGOOD_INCENT_PROC(
 p_coh_id                     IN customer_order_headers.coh_id%TYPE,
 p_vsi_code                   IN vendor_sales_incent_products.vsip_vsi_code%TYPE,
 p_qty_prd_pacticipants_added IN vendor_sales_incent_products.vsip_prf_prd_code%TYPE, --qté gratuite meritée du produit prime
 p_qty_prd_freegood_added     IN vendor_sales_incentives.vsi_freegood_prf_prd_code%TYPE, --qté gratuite meritée du produit de gratuité
 p_qty_prd_freegood_to_add    IN NUMBER,
 p_cod_order_source           IN VARCHAR2,
 p_incentives_calculated      OUT NUMBER
)  ;
FUNCTION  EXIST_VSI_FOR_FMT_FUNC (
  p_vsi_freegood_prf_prd_code  IN vendor_sales_incentives.vsi_freegood_prf_prd_code%TYPE,
  p_vsi_freegood_prf_fmt_code  IN vendor_sales_incentives.vsi_freegood_prf_fmt_code%TYPE
 ) RETURN BOOLEAN;

FUNCTION LOCK_VSI_FUNC(
  p_vsi_code  IN  vendor_sales_incentives.vsi_code%TYPE
) RETURN BOOLEAN;


END VSI_OPERATION_PACK;
/