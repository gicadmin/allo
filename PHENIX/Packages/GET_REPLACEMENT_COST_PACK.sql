CREATE OR REPLACE PACKAGE phenix.GET_REPLACEMENT_COST_PACK IS

PROCEDURE GET_REPLACEMENT_COSTS_PROC(
			p_prd_code               IN  products.prd_code%type,
			p_fmt_code               IN  product_formats.prf_fmt_code%type,
			p_cod_coh_id             IN  customer_order_details.cod_coh_id%type,
			p_cod_line_number        IN  customer_order_details.cod_line_number%type,
			p_cod_whs_picking_code   IN  customer_order_details.cod_whs_picking_code%type,
			p_coh_whs_delivery_code  IN  customer_order_headers.coh_whs_delivery_code%type,
			p_cod_replacement_list   OUT customer_order_details.cod_replacement_list%type,
			p_cod_replacement_cost_1 OUT customer_order_details.cod_replacement_cost_1%type,
			p_cod_replacement_cost_2 OUT customer_order_details.cod_replacement_cost_2%type,
			p_cod_replacement_cost_3 OUT customer_order_details.cod_replacement_cost_3%type,
			p_cod_replacement_cost_4 OUT customer_order_details.cod_replacement_cost_4%type
);

END GET_REPLACEMENT_COST_PACK;
/