CREATE OR REPLACE PACKAGE phenix.STAT_INTERFACE_PACK IS

PROCEDURE CREATE_MULTICAT_PROC(
	p_jsc_id IN NUMBER
);

PROCEDURE CREATE_MULTICAT_PROC_TEMP(
	p_jsc_id IN NUMBER
);

PROCEDURE GET_TAXES_PROC(
	p_fed_rate 		IN NUMBER,
	p_prov_rate 	IN NUMBER,
	p_extension 	IN NUMBER,
	p_fed_amount 	OUT NUMBER,
	p_prov_amount OUT NUMBER
);

FUNCTION GET_HID_LINE_FUNC(
	p_log_id 				IN NUMBER,
	p_date 					IN DATE,
	p_v_line_number IN NUMBER,
	p_whs_code		  IN VARCHAR2,  --BER3396
  p_stt_code      IN VARCHAR2  --GCL10623
)
RETURN VARCHAR2;

FUNCTION SUM_CONSIGNMENTS_FUNC(
	p_cot_cod_coh_id 			IN NUMBER,
	p_cot_cod_line_number IN NUMBER,
	p_cot_line_number 		IN NUMBER
)
RETURN NUMBER;

FUNCTION GET_ORDER_QTY_FUNC(
	p_order_weight 									IN NUMBER,
	p_order_quantity 								IN NUMBER,
	p_prf_prd_code 									IN VARCHAR2,
	p_prf_fmt_code 									IN VARCHAR2,
	p_prd_fmt_solid_inventory_code 	IN VARCHAR2
)
RETURN NUMBER;

FUNCTION SUM_CONSIGNMENTS_CAD_FUNC(
	p_cac_cad_id IN NUMBER
)
RETURN NUMBER;

PROCEDURE GET_FIELDS_PROC(
	p_quantity 						IN NUMBER,
	p_weight 							IN NUMBER,
	p_surcharge 					IN NUMBER,
	p_price 							IN NUMBER,
	p_prd_code 						IN VARCHAR2,
	p_fmt_code 						IN VARCHAR2,
	p_solid 							IN VARCHAR2,
	p_ctr_broker 					IN VARCHAR2,
	p_format 							OUT VARCHAR2,
	p_sale_qty 						OUT NUMBER,
	p_extension 					OUT NUMBER,
	p_invoice_qty 				OUT NUMBER,
	p_broker_stat_switch 	OUT NUMBER
);

FUNCTION GET_ORDER_QTY_FUNC(
	p_invoice_weight 								IN NUMBER,
	p_order_weight 									IN NUMBER,
	p_order_quantity 								IN NUMBER,
	p_prf_prd_code 									IN VARCHAR2,
	p_prf_fmt_code 									IN VARCHAR2,
	p_prd_fmt_solid_inventory_code 	IN VARCHAR2
)
RETURN NUMBER;

FUNCTION GET_TELEPHONE_FUNC(
	p_phone1 IN NUMBER,
	p_phone2 IN NUMBER,
	p_phone3 IN NUMBER := NULL,
	p_phone4 IN NUMBER := NULL
)
RETURN VARCHAR2;

FUNCTION GET_PUR_LINE_FUNC(
	p_v_file_in 		IN UTL_FILE.FILE_TYPE,
	p_log_id 				IN NUMBER,
	p_v_line_number IN OUT NUMBER,
	v_number_tot 		OUT NUMBER,
	v_measure_tot 	OUT NUMBER,
	p_cus_code 			IN NUMBER,
	p_type_call 		IN NUMBER
)
RETURN NUMBER;

FUNCTION GET_TOT_LINE_FUNC(
	p_bid_tot 			IN NUMBER,
	p_sid_tot 			IN NUMBER,
	p_pur_tot 			IN NUMBER,
	p_pur_sum 			IN NUMBER,
	p_bid_sum 			IN NUMBER,
	p_date    			IN DATE,
	p_log_id  			IN NUMBER,
	p_v_line_number IN NUMBER,
	p_whs_code   		IN VARCHAR2, --BER3396
  p_ship_to_id    IN VARCHAR2  --GCL10623
)
RETURN VARCHAR2;

FUNCTION GET_PUR_LINE_FUNC_TEMP(
	p_v_file_in 		IN UTL_FILE.FILE_TYPE,
	p_log_id 				IN NUMBER,
	p_v_line_number IN OUT NUMBER,
	v_number_tot 		OUT NUMBER,
	v_measure_tot 	OUT NUMBER,
	p_dat_debut 		IN DATE,
	p_dat_fin 			IN DATE,
	p_cus_code 			IN NUMBER,
	p_type_call 		IN NUMBER
)
RETURN NUMBER;

FUNCTION GET_SID_LINE_FUNC(
	p_v_file_in 				IN UTL_FILE.FILE_TYPE,
	p_log_id 						IN NUMBER,
	p_v_line_number 		IN NUMBER,
	p_code_func_pur 		IN VARCHAR2,
	v_total_number_pur 	OUT NUMBER,
	v_total_number_tot 	OUT NUMBER,
	p_dat_debut 				IN DATE,
	p_dat_fin 					IN DATE,
	p_whs_code		      IN VARCHAR2  --BER3396
)
RETURN NUMBER;

PROCEDURE INVSTAT_EXTRACT_PROC(
	p_jsc_id IN NUMBER
);

FUNCTION PREPARE_LINE_FUNC(
	p_mbr_code 						IN NUMBER,
	p_cust_code 					IN NUMBER,
	p_transaction_nbr 		IN NUMBER,
	p_transaction_date 		IN DATE,
	p_transaction_sign 		IN VARCHAR2,
	p_products 						IN VARCHAR2,
	p_sale_qty 						IN NUMBER,
	p_base_price 					IN NUMBER,
	p_extension 					IN NUMBER,
	p_deposit_extension 	IN NUMBER,
	p_promos 							IN VARCHAR2,
	p_qty_ordered 				IN NUMBER,
	p_qty_invoiced 				IN NUMBER,
	p_format_invoiced 		IN VARCHAR2,
	p_off_invoice 				IN VARCHAR2,
	p_prov_tax_amount 		IN NUMBER,
	p_prov_tax_rate 			IN NUMBER,
	p_fed_tax_amount 			IN NUMBER,
	p_fed_tax_rate 				IN NUMBER,
	p_short_code 					IN VARCHAR2,
	p_credit_reason 			IN VARCHAR2,
	p_invoice_ref_number 	IN VARCHAR2,	--CSC1254 était number...est maintenant varchar2
	p_cot_line_number 		IN NUMBER DEFAULT NULL
)
RETURN VARCHAR2;

FUNCTION GET_BID_LINE_FUNC(
	p_v_file_in 		IN OUT UTL_FILE.FILE_TYPE,
	p_log_id 				IN NUMBER,
	p_v_line_number IN OUT NUMBER,
	p_measure_bid 	OUT NUMBER,
	p_whs_code	    IN VARCHAR2  --BER3396
)
RETURN NUMBER;

PROCEDURE GENERATE_ACNIELSEN_PROC(
	p_jsc_id IN NUMBER
);

PROCEDURE EXTRACT_ACNIELSEN_CUST_PROC(
	p_whs_code IN VARCHAR2  --BER3573
) ;

PROCEDURE EXTRACT_ACNIELSEN_PROD_PROC(
	p_whs_code IN VARCHAR2  --BER3573
) ;

PROCEDURE EXTRACT_ACNIELSEN_SALES_PROC(
	p_from_date IN DATE,
	p_to_date 	IN DATE,
	p_whs_code IN VARCHAR2  --BER3573
);

PROCEDURE GEN_YEAR_END_STATS_PROC(
	p_jsc_id IN NUMBER
);

PROCEDURE GEN_YEAR_END_SALES_PROC(
	p_from_date IN DATE,
	p_to_date 	IN DATE,
	p_whs_code	IN VARCHAR2 --BER3573
);

PROCEDURE GEN_YEAR_END_PURCHASES_PROC(
	p_from_date IN DATE,
	p_to_date 	IN DATE,
	p_whs_code	IN VARCHAR2 --BER3573
);

-- CVI443
PROCEDURE GEN_RBH_STATS_PROC(	--CVI443
	p_jsc_id IN NUMBER
);

PROCEDURE EXTRACT_RBH_STATS(
	p_from_date IN DATE,
	p_to_date 	IN DATE,
	p_whs_code	IN VARCHAR2 --ber3573
);
--CVI443

PROCEDURE PROCESS_WHS_MULTICAT_PROC( --BER3396
	p_whs_code IN VARCHAR2,
  p_ship_to_id  IN VARCHAR2,  --GCL10623
  p_stt_code    IN VARCHAR2
);

PROCEDURE PROCESS_WHS_MULTICAT_TEMP_PROC(
	p_whs_code 	IN VARCHAR2,
	p_dat_debut IN DATE,
	p_dat_fin   IN DATE,
  p_ship_to_id  IN VARCHAR2,  --GCL10623
  p_stt_code    IN VARCHAR2
);

PROCEDURE GEN_DUF_PRICE_LIST_PROC(
  p_jsc_id IN job_schedules.jsc_id%TYPE
);

END STAT_INTERFACE_PACK;
/