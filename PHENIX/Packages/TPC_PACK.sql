CREATE OR REPLACE PACKAGE phenix.TPC_PACK IS

PROCEDURE INSERT_TPC_PROC(
	p_tpc_customer_code				IN temporary_pc_file.tpc_customer_code%TYPE,
	p_tpc_customer_name       IN temporary_pc_file.tpc_customer_name%TYPE,
	p_tpc_order_number        IN temporary_pc_file.tpc_order_number%TYPE,
	p_tpc_line_number         IN temporary_pc_file.tpc_line_number%TYPE,
	p_tpc_product_code        IN temporary_pc_file.tpc_product_code%TYPE,
	p_tpc_completion_code     IN temporary_pc_file.tpc_completion_code%TYPE,
	p_tpc_date_shipped        IN temporary_pc_file.tpc_date_shipped%TYPE,
	p_tpc_order_date          IN temporary_pc_file.tpc_order_date%TYPE,
	p_tpc_ordered_quantity    IN temporary_pc_file.tpc_ordered_quantity%TYPE,
	p_tpc_ordered_weight      IN temporary_pc_file.tpc_ordered_weight%TYPE,
	p_tpc_pack_size           IN temporary_pc_file.tpc_pack_size%TYPE,
	p_tpc_picked_quantity     IN temporary_pc_file.tpc_picked_quantity%TYPE,
	p_tpc_picked_weight       IN temporary_pc_file.tpc_picked_weight%TYPE,
	p_tpc_required_date       IN temporary_pc_file.tpc_required_date%TYPE,
	p_tpc_transaction_type    IN temporary_pc_file.tpc_transaction_type%TYPE,
	p_tpc_number_of_packages  IN temporary_pc_file.tpc_number_of_packages%TYPE	DEFAULT NULL,
	p_tpc_trailer_number      IN temporary_pc_file.tpc_trailer_number%TYPE			DEFAULT NULL,
	p_tpc_palette_number      IN temporary_pc_file.tpc_palette_number%TYPE			DEFAULT NULL,
	p_tpc_customer_po_number  IN temporary_pc_file.tpc_customer_po_number%TYPE	DEFAULT NULL,
	p_tpc_upc_code            IN temporary_pc_file.tpc_upc_code%TYPE						DEFAULT NULL
);

FUNCTION DO_TPC_ALREADY_EXISTS_FUNC(
	p_plh_id						IN NUMBER,
	p_pick_line_number 	IN NUMBER
)
RETURN NUMBER;

PROCEDURE COMPLETE_TPC_TRANSACTION_PROC(
	p_plh_or_vph_id IN NUMBER
);

FUNCTION COMPLETE_TPC_AND_TRAILER_FUNC(
	p_plh_id 					IN NUMBER,
	p_trailer_number 	IN VARCHAR
)
RETURN NUMBER;

FUNCTION FIND_NB_PACKAGE_FUNC(
	p_plh_id IN NUMBER
)
RETURN NUMBER;

FUNCTION INSERT_PLH_ZERO_LINES_FUNC(
	p_plh_id	IN pick_list_headers.plh_id%TYPE
)
RETURN NUMBER;

END TPC_PACK;
 
/