CREATE OR REPLACE PACKAGE phenix.INH_OPERATION_PACK IS

FUNCTION GET_SHORT_NAME RETURN VARCHAR2;

FUNCTION  IS_CUSTOMER_INVOICE_FUNC(
  p_inh_id            IN  INVOICE_HEADERS.INH_ID%TYPE)
  RETURN BOOLEAN;

FUNCTION  IS_SUPPLIER_INVOICE_FUNC(
  p_inh_id            IN  INVOICE_HEADERS.INH_ID%TYPE)
  RETURN BOOLEAN;

PROCEDURE PURGE_PROC(
  p_nb_days_to_keep   IN NUMBER,
  p_max_items         IN NUMBER
);

PROCEDURE ARCHIVE_PROC(
  p_inh_id            IN  INVOICE_HEADERS.INH_ID%TYPE,
  p_pdf_directory     IN  VARCHAR2
);

--
-- Procedure qui injectera les factures non archivees du passe s'il y en as.
--
PROCEDURE ARCHIVE_INJECTOR_PROC(
  p_jsc_id            IN  NUMBER
);

FUNCTION IS_TTY_USED_ON_INH_FUNC(
  p_inh_tty_code IN invoice_headers.inh_tty_code%TYPE
)
RETURN BOOLEAN;

FUNCTION GET_CUS_LANG_FUNC(
  p_inh_id  VARCHAR2
)
RETURN VARCHAR2;

PROCEDURE SET_TRANSP_CREDIT_PROC(  -- Mets à jour les données de la facture du crédit de transpor
  p_inh_id                   IN invoice_headers.inh_id%TYPE,
  p_inh_cost_price_total     IN invoice_headers.inh_cost_price_total%TYPE,
  p_inh_sale_price_total     IN invoice_headers.inh_cost_price_total%TYPE,
  p_inh_federal_tax_total    IN invoice_headers.inh_sale_price_total%TYPE,
  p_inh_provincial_tax_total IN invoice_headers.inh_provincial_tax_total%TYPE,
  p_inh_delivery_charge      IN invoice_headers.inh_delivery_charge%TYPE,
  p_inh_print_switch         IN invoice_headers.inh_print_switch %TYPE
);

FUNCTION PRINT_TRANSPORT_FUNC(
  p_inh_id        IN invoice_headers.inh_id%TYPE,
  p_inh_cus_code  IN invoice_headers.inh_cus_code%TYPE,
  p_inh_type      IN invoice_headers.inh_type%TYPE,
  p_use_code      IN users.use_code%TYPE
)
RETURN VARCHAR2;

PROCEDURE UPDATE_SCI_COST_PROC(
  p_prd_code  IN customer_adjustment_details.cad_prf_prd_code%TYPE,
  p_inh_id    IN customer_adjustment_details.cad_inh_id%TYPE
);

--ber4898 procédure qui recalcule le coûtant total des factures qui sont concernées par la ligne de commande modifié
PROCEDURE UPDATE_COST_ON_INH_COD_PROC(
  p_cod_coh_id      IN customer_order_details.cod_coh_id%TYPE,
  p_cod_line_number IN customer_order_details.cod_line_number%TYPE,
  p_diff_to_add     IN NUMBER
);

--ber4898 procédure qui recalcule le coûtant total de la facture dont un détails de la note de crédit a été modifié
PROCEDURE UPDATE_COST_ON_INH_CAD_PROC(
  p_inh_id       IN invoice_headers.inh_id%TYPE,
  p_diff_to_add     IN NUMBER
);

FUNCTION PRINT_VENDOR_INVOICING_FUNC(
  p_cred_inh_id  IN invoice_headers.inh_id%TYPE,
  p_ven_code     IN vendors.ven_code%TYPE

) RETURN VARCHAR2;

PROCEDURE PRINT_INVOICE_PROC(
  p_inh_id       IN  invoice_headers.inh_id%TYPE,
  p_cus_code     IN  customer_email_transactions.cmt_cus_code%TYPE,
  p_report_type  IN  customer_email_transactions.cmt_report_type%TYPE,
  p_report_name  IN  programs.pro_name%TYPE
);

PROCEDURE PRINT_CUS_INVOICE_PROC(
  p_inh_id       IN  invoice_headers.inh_id%TYPE,
  p_cus_code     IN  customer_email_transactions.cmt_cus_code%TYPE,
  p_report_type  IN  customer_email_transactions.cmt_report_type%TYPE,
  p_report_name  IN  programs.pro_name%TYPE
);
FUNCTION PRINT_RAP_RMA_FUNC(
  p_cus_code  IN customer_email_transactions.cmt_cus_code%TYPE,
  p_cah_id    IN customer_adjustment_headers.cah_id%TYPE,
  p_whs_code  IN warehouses.whs_code%TYPE
)RETURN VARCHAR2;
FUNCTION INSERT_INH_FUNC(
  p_inh_type                   IN invoice_headers.inh_type%TYPE,
  p_inh_delivery_charge        IN invoice_headers.inh_delivery_charge%TYPE,
  p_inh_federal_tax_total      IN invoice_headers.inh_federal_tax_total%TYPE,
  p_inh_invoice_date           IN invoice_headers.inh_invoice_date%TYPE,
  p_inh_package_total          IN invoice_headers.inh_package_total%TYPE,
  p_inh_ticket_charges         IN invoice_headers.inh_ticket_charges%TYPE,
  p_inh_cost_price_total       IN invoice_headers.inh_cost_price_total%TYPE,
  p_inh_print_switch           IN invoice_headers.inh_print_switch%TYPE,
  p_inh_provincial_tax_total   IN invoice_headers.inh_provincial_tax_total%TYPE,
  p_inh_sale_price_total       IN invoice_headers.inh_sale_price_total%TYPE,
  p_inh_cus_code               IN invoice_headers.inh_cus_code%TYPE,
  p_inh_use_code               IN invoice_headers.inh_use_code%TYPE,
  p_inh_cigarette_shipped      IN invoice_headers.inh_cigarette_shipped%TYPE,
  p_inh_reference_number       IN invoice_headers.inh_reference_number%TYPE,
  p_inh_ven_code               IN invoice_headers.inh_ven_code%TYPE,
  p_inh_route_date             IN invoice_headers.inh_route_date%TYPE,
  p_inh_cus_invoiced_code      IN invoice_headers.inh_cus_invoiced_code%TYPE,
  p_inh_ven_invoice_for_code   IN invoice_headers.inh_ven_invoice_for_code%TYPE,
  p_inh_surcharge_amount       IN invoice_headers.inh_surcharge_amount%TYPE,
  p_inh_offinv_vol_reb_percent IN invoice_headers.inh_offinv_vol_reb_percent%TYPE,
  p_inh_offinv_vol_reb_amount  IN invoice_headers.inh_offinv_vol_reb_amount%TYPE,
  p_called_from                IN VARCHAR2,
  p_inh_provincial_tax_rate    IN invoice_headers.inh_provincial_tax_rate%TYPE,
  p_inh_federal_tax_rate       IN invoice_headers.inh_federal_tax_rate%TYPE,
  p_inh_compounded_tax_switch  IN invoice_headers.inh_compounded_tax_switch%TYPE

) RETURN NUMBER;

FUNCTION INSERT_INH_FUNC(
  p_inh_id                     IN invoice_headers.inh_id%TYPE,
  p_inh_type                   IN invoice_headers.inh_type%TYPE,
  p_inh_delivery_charge        IN invoice_headers.inh_delivery_charge%TYPE,
  p_inh_federal_tax_total      IN invoice_headers.inh_federal_tax_total%TYPE,
  p_inh_invoice_date           IN invoice_headers.inh_invoice_date%TYPE,
  p_inh_package_total          IN invoice_headers.inh_package_total%TYPE,
  p_inh_ticket_charges         IN invoice_headers.inh_ticket_charges%TYPE,
  p_inh_cost_price_total       IN invoice_headers.inh_cost_price_total%TYPE,
  p_inh_print_switch           IN invoice_headers.inh_print_switch%TYPE,
  p_inh_provincial_tax_total   IN invoice_headers.inh_provincial_tax_total%TYPE,
  p_inh_sale_price_total       IN invoice_headers.inh_sale_price_total%TYPE,
  p_inh_cus_code               IN invoice_headers.inh_cus_code%TYPE,
  p_inh_use_code               IN invoice_headers.inh_use_code%TYPE,
  p_inh_cigarette_shipped      IN invoice_headers.inh_cigarette_shipped%TYPE,
  p_inh_reference_number       IN invoice_headers.inh_reference_number%TYPE,
  p_inh_route_date             IN invoice_headers.inh_route_date%TYPE,
  p_inh_surcharge_amount       IN invoice_headers.inh_surcharge_amount%TYPE,
  p_inh_offinv_vol_reb_percent IN invoice_headers.inh_offinv_vol_reb_percent%TYPE,
  p_inh_offinv_vol_reb_amount  IN invoice_headers.inh_offinv_vol_reb_amount%TYPE,
  p_inh_provincial_tax_rate    IN invoice_headers.inh_provincial_tax_rate%TYPE,
  p_inh_federal_tax_rate       IN invoice_headers.inh_federal_tax_rate%TYPE,
  p_inh_compounded_tax_switch  IN invoice_headers.inh_compounded_tax_switch%TYPE
) RETURN NUMBER;

PROCEDURE UPDATE_INH_SALE_AND_TAX_PROC(
  p_inh_id                    IN invoice_headers.inh_id%TYPE,
  p_inh_sale_price_total      IN invoice_headers.inh_sale_price_total%TYPE,
  p_inh_provincial_tax_total  IN invoice_headers.inh_provincial_tax_total%TYPE,
  p_inh_federal_tax_total     IN invoice_headers.inh_federal_tax_total%TYPE
);

PROCEDURE GET_INH_INFO_PROC(
  p_inh_id                          IN  invoice_headers.inh_id%TYPE,
  p_inh_type                        OUT invoice_headers.inh_type%TYPE,
  p_inh_ven_code                    OUT invoice_headers.inh_ven_code%TYPE,
  p_ven_no_prs_on_cus_bf_switch     OUT vendors.ven_no_prices_on_cus_bf_switch%TYPE
);

PROCEDURE INSERT_INH_AND_CAD_PROC(
  p_inh_id                     IN invoice_headers.inh_id%TYPE,
  p_inh_type                   IN invoice_headers.inh_type%TYPE,
  p_inh_delivery_charge        IN invoice_headers.inh_delivery_charge%TYPE,
  p_inh_federal_tax_total      IN invoice_headers.inh_federal_tax_total%TYPE,
  p_inh_package_total          IN invoice_headers.inh_package_total%TYPE,
  p_inh_ticket_charges         IN invoice_headers.inh_ticket_charges%TYPE,
  p_inh_cost_price_total       IN invoice_headers.inh_cost_price_total%TYPE,
  p_inh_provincial_tax_total   IN invoice_headers.inh_provincial_tax_total%TYPE,
  p_inh_sale_price_total       IN invoice_headers.inh_sale_price_total%TYPE,
  p_inh_cus_code               IN invoice_headers.inh_cus_code%TYPE,
  p_inh_use_code               IN invoice_headers.inh_use_code%TYPE,
  p_inh_cigarette_shipped      IN invoice_headers.inh_cigarette_shipped%TYPE,
  p_inh_surcharge_amount       IN invoice_headers.inh_surcharge_amount%TYPE,
  p_inh_offinv_vol_reb_percent IN invoice_headers.inh_offinv_vol_reb_percent%TYPE,
  p_inh_offinv_vol_reb_amount  IN invoice_headers.inh_offinv_vol_reb_amount%TYPE,
  p_crt_wms_interface_flag     IN credit_types.crt_wms_interface_flag%TYPE,
  p_cah_whs_delivery_code      IN customer_adjustment_headers.cah_whs_delivery_code%TYPE,
  p_cred_inh_id                OUT NUMBER,
  p_cah_id                     OUT customer_adjustment_headers.cah_id%TYPE,
  p_inh_provincial_tax_rate    IN invoice_headers.inh_provincial_tax_rate%TYPE,
  p_inh_federal_tax_rate       IN invoice_headers.inh_federal_tax_rate%TYPE,
  p_inh_compounded_tax_switch  IN invoice_headers.inh_compounded_tax_switch%TYPE
);

PROCEDURE CALCUL_TAX_FOR_UPDATE_INH_PROC(
  p_cus_code  IN  customers.cus_code%TYPE,
  p_cred_inh_id  IN invoice_headers.inh_id%TYPE
);

PROCEDURE PRINT_DIFFERENT_REPORT_PROC(
  p_inh_id                  IN  invoice_headers.inh_id%TYPE,
  p_cus_code                IN  customers.cus_code%TYPE,
  p_cred_inh_id             IN  invoice_headers.inh_id%TYPE,
  p_crt_wms_interface_flag  IN  credit_types.crt_wms_interface_flag%TYPE,
  p_whs_code                IN  warehouses.whs_code%TYPE,
  p_cah_id                  IN  customer_adjustment_headers.cah_id%TYPE,
  p_cah_id_for_rma          OUT customer_adjustment_headers.cah_id%TYPE
);
PROCEDURE GET_TOTAL_FOR_CUS_DATE_PROC (
  p_cus_code                  IN NUMBER,
  p_delivery_date             IN DATE,
  p_sales_amt_for_cus_date    OUT NUMBER,
  p_vol_reb_amt_for_cus_date  OUT NUMBER
);

PROCEDURE SET_OFFINV_FOR_CUS_DATE_PROC(
  p_cus_code                  IN NUMBER,
  p_delivery_date             IN DATE,
  p_offinv_vol_reb_percent    IN NUMBER
);

FUNCTION GET_TOTAL_AMOUNT_FUNC(
  p_inh_rec IN invoice_headers%ROWTYPE
)
RETURN NUMBER;

FUNCTION GET_TOTAL_AMOUNT_FUNC(
  p_inh_id IN invoice_headers.inh_id%TYPE
)
RETURN NUMBER;

FUNCTION PRINT_VENDOR_RAP_FUNC(
	p_inh_id                       IN NUMBER,
  p_use_code                     IN NUMBER,
	p_inh_type                     IN VARCHAR2,
	p_ven_detail_va_invoice_switch IN NUMBER,
	p_ven_detail_vr_invoice_switch IN NUMBER,
	p_ven_detail_vg_invoice_switch IN NUMBER ,--usg709
	p_ven_detail_vt_invoice_switch IN NUMBER ,--ber6830
  p_ven_detail_vs_invoice_switch IN NUMBER ,--BEA90
  P_extend                       IN VARCHAR2
) RETURN VARCHAR2;

FUNCTION IS_INH_INFO_EXIST_FUNC(
  p_inh_cus_code          IN invoice_headers.inh_cus_code%TYPE,
  p_inh_reference_number  IN invoice_headers.inh_reference_number%TYPE,
  p_inh_invoice_date      IN invoice_headers.inh_invoice_date%TYPE
)
RETURN BOOLEAN;

FUNCTION GET_UNPOSTED_PAYMENTS_FUNC(
  p_inh_id IN invoice_headers.inh_id%TYPE
)
RETURN NUMBER;

FUNCTION GET_UNPOSTED_PAYMENTS_FUNC(
  p_inh_cus_code IN invoice_headers.inh_cus_code%TYPE
)
RETURN NUMBER;

END INH_OPERATION_PACK;
/