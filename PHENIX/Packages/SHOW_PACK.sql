CREATE OR REPLACE PACKAGE phenix.SHOW_PACK IS

PROCEDURE EXTRACT_SHOW_PRODUCTS_PROC(
	p_jsc_id		IN NUMBER
);

PROCEDURE VALIDATE_SHOW_PRODUCTS_PROC;

PROCEDURE ERROR_SHOW_PRODUCTS_PROC(
	p_ccr_code 	IN NUMBER,
	p_rowid 	IN ROWID
);

PROCEDURE EXTRACT_SHOW_ORDERS_PROC(
	p_jsc_id		IN NUMBER
);

PROCEDURE VALIDATE_SHOW_ORDERS_PROC(
	p_pty_code 					IN NUMBER,
	p_from_ven_code 			IN NUMBER,
	p_to_ven_code 				IN NUMBER,
	p_update_purchase_switch 	IN NUMBER,
	p_update_sales_switch 		IN NUMBER,
	p_broker_vendor_flag 		IN VARCHAR2,
	p_delivery_date_1 			IN DATE,
	p_delivery_date_2 			IN DATE,
	p_prebook_weeks 			IN NUMBER, --CSC1295
	p_whs_code                  IN VARCHAR2, ---BER1417
	p_nb_items					IN NUMBER DEFAULT NULL--USG570
);

PROCEDURE ERROR_SHOW_ORDERS_PROC(
	p_ccr_code 	IN NUMBER,
	p_rowid 	IN ROWID
);

PROCEDURE LOAD_COH_INTERFACE_PROC(	--ber2159 enlever les codes fournisseurs, ils servent pas
	p_pty_code 		  IN NUMBER,
	p_delivery_date_1 IN DATE,
	p_delivery_date_2 IN DATE,
	p_prebook_weeks   IN NUMBER, --CSC1295
	p_whs_code		  IN VARCHAR2,	--ber2159
	v_file_out 		  IN UTL_FILE.FILE_TYPE,
	p_nb_coh_created	OUT NUMBER,	--fre3030
	p_nb_cod_created	OUT NUMBER	--fre3030
);

PROCEDURE LOAD_COD_INTERFACE_PROC(
	p_coh_id 				IN NUMBER,
	p_cus_code 				IN VARCHAR2,
	p_pty_code 				IN NUMBER,
	p_prebook_method 		IN VARCHAR2,
	p_delivery_date_1 	    IN DATE,
	p_delivery_date_2 		IN DATE,
	p_prebook_weeks 		IN NUMBER, --CSC1295
	p_cus_use_code			IN NUMBER,	--ber2159
	p_cus_use_telemark_code	IN NUMBER,	--ber2159
	v_file_out 				IN UTL_FILE.FILE_TYPE,
	p_nb_cod_created		IN OUT NUMBER	--fre3030
);

PROCEDURE LOAD_POH_INTERFACE_PROC(
	p_pty_code 			 IN NUMBER,
	p_from_ven_code 	 IN NUMBER,
	p_to_ven_code 		 IN NUMBER,
	p_broker_vendor_flag IN VARCHAR2,
	p_delivery_date_1 	 IN DATE,
	p_delivery_date_2 	 IN DATE,
	p_whs_code           IN VARCHAR2, ---BER1417--ber2159
	v_file_out 			 IN UTL_FILE.FILE_TYPE
);

PROCEDURE INSERT_POH_PROC(
	p_poh_id	 			IN NUMBER,
	p_use_code 				IN NUMBER,
	p_ven_payable_code 		IN NUMBER,
	p_ven_code 				IN NUMBER,
	p_delivery_date 		IN DATE,
	p_prv_code 				IN VARCHAR2,
	p_ctr_cancelation_days 	IN NUMBER,
	p_ven_address 			IN VARCHAR2,
	p_ven_city 				IN VARCHAR2,
	p_ven_postal_code 		IN VARCHAR2,
	p_whs_code              IN VARCHAR2, ---BER1417
    p_status                  IN VARCHAR2  ---USG791
);

FUNCTION LOAD_POD_INTERFACE_FUNC(
	p_ven_code 			    IN VARCHAR2,
	p_poh_id 			    IN NUMBER,
	p_quantity 			    IN NUMBER,
	p_pty_code 			    IN NUMBER,
	p_broker_vendor_flag 	IN VARCHAR2,
	p_whs_code				IN VARCHAR2,        --BER2159
	p_delivery_date_1 		IN DATE, --CSC5901
  v_file_out     			IN UTL_FILE.FILE_TYPE
)
RETURN BOOLEAN;	--gic1166

--FRE1729 fix pour ajouter des quantités sur le PO du show déjà créée (appellé directement dans SQL)
--celui ci ne doit pas avoir 2 fois le même produits sur des lignes différentes du POH
--pour voir le résultat, il est bien d'avoir mis le serveroutput on dans SQL
PROCEDURE FIX_POH_INTERFACE_PROC(
	p_poh_id_to_check		IN NUMBER,
	p_pty_code 				IN NUMBER,
	p_broker_vendor_flag 	IN VARCHAR2,
	p_delivery_date_1 		IN DATE,
	p_delivery_date_2 		IN DATE,
	p_do_commit_switch		IN NUMBER DEFAULT 0 	--(0 = on commit pas,  1 = on commit)
);

--FRE1729 sous procédure du fix pour ajouter des quantités sur le PO du show déjà créée (FIX_POH_INTERFACE_PROC)
--pour voir le résultat, il est bien d'avoir mis le serveroutput on dans SQL
PROCEDURE CHECK_POD_INTERFACE_PROC(
	p_poh_id_to_check		IN NUMBER,
	p_ven_code 				IN VARCHAR2,
	p_quantity 				IN NUMBER,
	p_pty_code 				IN NUMBER,
	p_broker_vendor_flag 	IN VARCHAR2,
	decompte				OUT NUMBER,
	v_file_out     			IN UTL_FILE.FILE_TYPE
);

FUNCTION PRINT_BADG_FUNC(
  p_pro_name        IN programs.pro_name%TYPE,
  p_cus_code        IN customers.cus_code%TYPE,
  p_prn_code_badge  IN printers.prn_code%TYPE,
  p_prn_id_badge    IN printers.prn_id%TYPE
) RETURN VARCHAR2 ;

END SHOW_PACK;
/