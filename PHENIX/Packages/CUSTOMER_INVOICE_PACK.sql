CREATE OR REPLACE PACKAGE phenix.CUSTOMER_INVOICE_PACK IS

PROCEDURE CUSTOMER_INVOICING_PROC( --BER78
  p_jsc_id IN NUMBER
);

PROCEDURE CLOSE_INVOICE_HEADERS_PROC(       --BER78
  p_inh_id                    IN NUMBER,
  p_cus_code                  IN NUMBER,
  p_fed_tax                   IN NUMBER,
  p_prov_tax                  IN NUMBER,
  p_cost                      IN NUMBER,
  p_sale                      IN NUMBER,
  p_qty_wght_invoiced         IN NUMBER,  --CHA798  savoir si une qté a été facturé
  p_surcharge_tot             IN NUMBER,  --USG506  transférer la surcharge dans la fin de facture
  p_cig                       IN NUMBER,
  p_ticket                    IN NUMBER,
  p_pack                      IN NUMBER,
  p_in_route                  IN NUMBER,
  p_rou_type                  IN VARCHAR2,        --BER183
  p_date                      IN DATE,
  p_copies                    IN NUMBER,
  p_fed_rate                  IN NUMBER,
  p_prov_rate                 IN NUMBER,
  p_compound                  IN NUMBER,
  p_language                  IN VARCHAR2,
  p_log_id                    IN NUMBER,            --csc2415
  p_indirect_delivery_switch  IN NUMBER,    --csc1504
  p_print_invoice             IN NUMBER DEFAULT 1,  --cvi186 0 si on ne veut pas .. 1 si on veut imprimer le rapport
  p_check_credit              IN NUMBER,          --0 ou 1  CSC2415
  p_use_code                  IN NUMBER, --CVI2772
  p_credit_id_taken           IN OUT VARCHAR2,      --csc2415
  p_cash_and_carry_switch     IN NUMBER
);

FUNCTION FIND_VSA_FUNC( --BER78
  p_cus_code      IN NUMBER,
  p_prd_code      IN VARCHAR2,
  p_prd_ven_code  IN NUMBER,    --gic2201
  p_prd_pgr_code  IN NUMBER,    --gic2201
  p_fmt_code      IN VARCHAR2
)
RETURN NUMBER;

FUNCTION INVOICING_CASH_AND_CARRY_FUNC( --BER78
  p_coh_id   IN customer_order_headers.coh_id%TYPE,
  p_use_code IN users.use_code%TYPE
)
RETURN NUMBER;

--csc2415 fonction qui vérifie si le montant promotion sera donné OFF-INVOICE ou en tant que NOTE DE CRÉDIT
FUNCTION CHECK_CREDIT_PROMO_FUNC(
  p_cus_code                    IN customer_order_headers.coh_cus_code%TYPE,
  p_coh_id                      IN customer_order_details.cod_coh_id%TYPE,
  p_cod_line_number             IN customer_order_details.cod_line_number%TYPE,
  p_cod_selling_retail          IN customer_order_details.cod_selling_retail%TYPE,
  p_cod_pty_code                IN customer_order_details.cod_pty_code%TYPE,
  p_cod_pricing_source          IN customer_order_details.cod_pricing_source%TYPE,
  p_cod_promotion_amount        IN customer_order_details.cod_promotion_amount%TYPE,
  p_cod_credit_promotion_switch IN customer_order_details.cod_credit_promotion_switch%TYPE
)
RETURN NUMBER;  --LE RETOUR SERA COD_SELLING_RETAIL

--USG323 fonction qui vérifie si le montant de taxe sur les CIGARES
FUNCTION CHECK_CIGAR_TAX_FUNC(
  p_cus_code           IN customer_order_headers.coh_cus_code%TYPE,
  p_prv_code           IN provinces.prv_code%TYPE,
  p_coh_id             IN customer_order_details.cod_coh_id%TYPE,
  p_cod_line_number    IN customer_order_details.cod_line_number%TYPE,
  p_cod_selling_retail IN customer_order_details.cod_selling_retail%TYPE
)
RETURN NUMBER;  --LE RETOUR SERA COD_SELLING_RETAIL

--CSC2415 Procédure utilisé pour générer les notes de crédit, à la facturation, pour les promotions remboursé en crédit
-- et les AVR remboursée en crédit
PROCEDURE GENERATE_CREDIT_PROC(
  p_inh_id            IN NUMBER,
  p_log_id            IN NUMBER,
  p_comptoir_switch   IN NUMBER, --(0 ou 1)
  p_number_of_copies  IN NUMBER,
  p_credit_id_taken   IN OUT VARCHAR2
);

PROCEDURE RECALC_FOR_INVOICE_PROC(
  p_coh_cus_code            IN customer_order_headers.coh_cus_code%TYPE,
  p_cod_prf_prd_code        IN customer_order_details.cod_prf_prd_code%TYPE,
  p_cod_prf_fmt_code        IN customer_order_details.cod_prf_fmt_code%TYPE,
  p_cod_whs_picking_code    IN customer_order_details.cod_whs_picking_code%TYPE,
  p_coh_whs_delivery_code   IN customer_order_headers.coh_whs_delivery_code%TYPE,
  p_cod_base_selling_cost   IN OUT customer_order_details.cod_base_selling_cost%TYPE,
  p_cod_original_retail     IN OUT customer_order_details.cod_original_retail%TYPE,
  p_cod_pricing_source      IN OUT customer_order_details.cod_pricing_source%TYPE,
  p_cod_cost_price          IN OUT customer_order_details.cod_cost_price%TYPE,
  p_cod_promotion_amount    IN OUT customer_order_details.cod_promotion_amount%TYPE,
  p_cod_selling_retail      IN OUT customer_order_details.cod_selling_retail%TYPE,
  p_cod_surcharge           IN OUT customer_order_details.cod_surcharge%TYPE,
  p_cod_fmt_code_srp        IN OUT customer_order_details.cod_fmt_code_srp%TYPE,
  p_cod_pty_code            IN OUT customer_order_details.cod_pty_code%TYPE,
  p_cod_price_srp           IN OUT customer_order_details.cod_price_srp%TYPE,
  p_cod_quantity_srp        IN OUT customer_order_details.cod_quantity_srp%TYPE,
  p_cod_average_cost_1      IN OUT customer_order_details.cod_average_cost_1%TYPE,
  p_cod_average_cost_2      IN OUT customer_order_details.cod_average_cost_2%TYPE,
  p_cod_average_cost_3      IN OUT customer_order_details.cod_average_cost_3%TYPE,
  p_cod_average_cost_4      IN OUT customer_order_details.cod_average_cost_4%TYPE,
  p_cod_average_list        IN OUT customer_order_details.cod_average_list%TYPE,
  p_cod_avg_real_cost_1     IN OUT customer_order_details.cod_avg_real_cost_1%TYPE,
  p_cod_avg_real_cost_2     IN OUT customer_order_details.cod_avg_real_cost_2%TYPE,
  p_cod_avg_real_cost_3     IN OUT customer_order_details.cod_avg_real_cost_3%TYPE,
  p_cod_avg_real_cost_4     IN OUT customer_order_details.cod_avg_real_cost_4%TYPE,
  p_cod_avg_real_list       IN OUT customer_order_details.cod_avg_real_list%TYPE,
  p_cod_royalty_amount      IN OUT customer_order_details.cod_royalty_amount%TYPE,
  p_cod_car_amount          IN OUT customer_order_details.cod_car_amount%TYPE,
  p_cod_replacement_list    OUT customer_order_details.cod_replacement_list%TYPE,
  p_cod_replacement_cost_1  OUT customer_order_details.cod_replacement_cost_1%TYPE,
  p_cod_replacement_cost_2  OUT customer_order_details.cod_replacement_cost_2%TYPE,
  p_cod_replacement_cost_3  OUT customer_order_details.cod_replacement_cost_3%TYPE,
  p_cod_replacement_cost_4  OUT customer_order_details.cod_replacement_cost_4%TYPE
);

PROCEDURE SET_RAP_CUS_MAIL_FAX_PROC (
  p_inh_id  	    		      IN invoice_headers.inh_id%TYPE,
  p_report_name     		    IN VARCHAR2,
  p_report_type     		    IN customer_email_transactions.cmt_report_type%TYPE
);

PROCEDURE SET_RAP_CUS_PRINT_PROC (
  p_inh_id  	    		      IN invoice_headers.inh_id%TYPE,
  p_report_name     		    IN VARCHAR2,
  p_whs_code                IN VARCHAR2,
  p_number_of_copies        IN NUMBER
) ;

PROCEDURE SET_RAP_VENDOR_MAIL_PROC(
 p_inh_id  	    		      IN invoice_headers.inh_id%TYPE,
 p_report_name     		    IN VARCHAR2,
 p_report_type     		    IN vendor_email_transactions.vmt_report_type%TYPE
);

FUNCTION SET_RAP_CUS_PRINT_FUNC(
  p_inh_id            IN invoice_headers.inh_id%TYPE,
  p_report_name       IN VARCHAR2,
  p_prn_id            IN job_recipients.jre_prn_id%TYPE ,
  p_copies            IN NUMBER,
  p_direct_to_printer IN NUMBER,
  p_language          IN VARCHAR2
)
RETURN VARCHAR2;

PROCEDURE SET_RAP_CUS_PRINT_PROC(
  p_inh_id      IN invoice_headers.inh_id%TYPE,
  p_report_name IN VARCHAR2,
  p_prn_id      IN job_recipients.jre_prn_id%TYPE,
  p_copies      IN NUMBER,
  p_language    IN VARCHAR2
);

FUNCTION PRINT_CASH_AND_CARRY_FUNC(
  p_inh_id            IN invoice_headers.inh_id%TYPE,
  p_cre_code          IN cash_registers.cre_code%TYPE,
  p_direct_to_printer IN NUMBER,
  p_invoice_copies    IN NUMBER,
  p_language          IN VARCHAR2
)
RETURN VARCHAR2;

FUNCTION PROCESS_CASH_AND_CARRY_FUNC(
  p_coh_id   IN customer_order_headers.coh_id%TYPE,
  p_use_code IN users.use_code%TYPE
)
RETURN NUMBER;

PROCEDURE ACCPAC_CASH_AND_CARRY_PROC(
  p_inh_id IN invoice_headers.inh_id%TYPE
);

PROCEDURE CALCULATE_LINE_PROC(
  p_sale_to_invoice         IN NUMBER,
  p_surcharge_to_invoice    IN NUMBER,
  p_federal_tax_rate        IN NUMBER,
  p_provincial_tax_rate     IN NUMBER,
  p_compounded_tax_switch   IN NUMBER,
  p_invoiced_ext_price      OUT NUMBER,
  p_invoiced_ext_surcharge  OUT NUMBER,
  p_federal_tax_amount      OUT NUMBER,
  p_provincial_tax_amount   OUT NUMBER
);

FUNCTION GET_OFFINV_VOLUME_REBATE_FUNC(
  p_cus_code      IN customer_order_headers.coh_cus_code%TYPE,
  p_delivery_date IN customer_order_details.cod_project_delivery_date%TYPE,
  p_sum_sales     IN NUMBER,
  p_sum_coc_sales IN NUMBER
)
RETURN NUMBER;

END CUSTOMER_INVOICE_PACK;
/