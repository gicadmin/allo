CREATE OR REPLACE PACKAGE phenix.TIV_PACK IS
/*
*	 GIMAT		 DATE			 AUTEUR		DESCRIPTION
*	-------	----------	---------	------------------
* GIC3964 25-01-2012   Mawuko   Création du package
*/

PROCEDURE INSERT_TIV_PROC(
  p_tiv_lty_whs_code    	        IN temporary_inventories.tiv_lty_whs_code%TYPE,
	p_tiv_inv_prf_prd_code    	    IN temporary_inventories.tiv_inv_prf_prd_code%TYPE,
	p_tiv_inv_prf_fmt_code          IN temporary_inventories.tiv_inv_prf_fmt_code%TYPE,
	p_tiv_inv_loc_code              IN temporary_inventories.tiv_inv_loc_code%TYPE,
	p_tiv_prd_to_spec_order_switch  IN temporary_inventories.tiv_prd_to_spec_order_switch%TYPE
);
END TIV_PACK ;
 
/