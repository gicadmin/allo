CREATE OR REPLACE FORCE VIEW phenix.v_purchase_prd_warehouses (ppw_prd_code,ppw_whs_code,ppw_items_per_pallet,ppw_items_per_row,ppw_replenish_coefficient,ppw_replenish_point,ppw_replenish_quantity,ppw_shr_code,ppw_added_transp_amount,ppw_purchasable_switch,ppw_sellable_switch,ppw_pickable_switch) AS
(
	SELECT prw_courant.prw_prd_code ppw_prd_code,
	       prw_courant.prw_whs_code ppw_whs_code,
	       DECODE(prw_courant.prw_purchasable_switch, 1, prw_courant.prw_items_per_pallet, 			prw_purchasing.prw_items_per_pallet) ppw_items_per_pallet,
	       DECODE(prw_courant.prw_purchasable_switch, 1, prw_courant.prw_items_per_row,    			prw_purchasing.prw_items_per_row) ppw_items_per_row,
	       DECODE(prw_courant.prw_purchasable_switch, 1, prw_courant.prw_replenish_coefficient, prw_purchasing.prw_replenish_coefficient) ppw_replenish_coefficient,
	       DECODE(prw_courant.prw_purchasable_switch, 1, prw_courant.prw_replenish_point, 			prw_purchasing.prw_replenish_point) ppw_replenish_point,
	       DECODE(prw_courant.prw_purchasable_switch, 1, prw_courant.prw_replenish_quantity, 		prw_purchasing.prw_replenish_quantity) ppw_replenish_quantity,
	       DECODE(prw_courant.prw_purchasable_switch, 1, prw_courant.prw_shr_code, 							prw_purchasing.prw_shr_code) ppw_shr_code,
	       DECODE(prw_courant.prw_purchasable_switch, 1, prw_courant.prw_added_transp_amount, 	prw_purchasing.prw_added_transp_amount) ppw_added_transp_amount,
	       DECODE(prw_courant.prw_purchasable_switch, 1, prw_courant.prw_purchasable_switch, 		prw_purchasing.prw_purchasable_switch) ppw_purchasable_switch,
	       DECODE(prw_courant.prw_purchasable_switch, 1, prw_courant.prw_sellable_switch, 			prw_purchasing.prw_sellable_switch) ppw_sellable_switch,
	       DECODE(prw_courant.prw_purchasable_switch, 1, prw_courant.prw_pickable_switch, 			prw_purchasing.prw_pickable_switch) ppw_pickable_switch
	FROM product_warehouses prw_courant,
	     product_warehouses prw_purchasing
	WHERE prw_courant.prw_prd_code = prw_purchasing.prw_prd_code
		AND ((prw_courant.prw_purchasable_switch = 1 AND prw_courant.prw_whs_code = prw_purchasing.prw_whs_code)
			OR (prw_courant.prw_purchasable_switch = 0 AND prw_purchasing.prw_whs_code = VENDOR_INVOICE_PACK.FIND_PURCHASE_WAREHOUSE_FUNC(prw_courant.prw_prd_code,prw_courant.prw_whs_code))--gic3413
				)
)
 ;