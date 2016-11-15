CREATE OR REPLACE FORCE VIEW phenix.v_product_whs_inv_tpl (pwi_prd_code,pwi_whs_code,pwi_prd_definition,pwi_quantity_available,pwi_weight_available) AS
(
	SELECT 	pwi_prd_code,
					pwi_whs_code,
					pwi_prd_definition, 	--gic3284
				 	pwi_quantity_available,
				 	pwi_weight_available
	FROM(
			 SELECT prd_code pwi_prd_code,
					 		whs_code pwi_whs_code,
							prd_definition pwi_prd_definition,	--gic3284
							ROUND(SUM(pwi_quantity_available),3) pwi_quantity_available,
							ROUND(SUM(pwi_weight_available),3) * (CASE 	WHEN prd_definition IN ('D', 'B')
																													THEN PRODUCT_PACK.FROM_KG_TO_WEIGHTED_INV_FUNC(prd_code, prd_fmt_solid_inventory_code)
																													ELSE 1 END) pwi_weight_available
			 FROM(
						SELECT prd_code,
									 whs_code,
								 	 prd_definition,
								 	 prd_fmt_solid_inventory_code,
						 			 (CASE 	WHEN prd_definition IN ('S', 'D', 'B')
						 			 				THEN
						 			 				 	(CASE WHEN lty_picking_switch = 1 OR lty_overstock_switch = 1
						 			 					 		 	THEN  (NVL(inv_quantity_on_hand,0) - NVL(inv_quantity_on_hold,0))
						 			 					 		   			* DECODE(prf_operation_flag, 'M', prf_conversion_to_base, 1/prf_conversion_to_base)
						 			 								ELSE 0 END)
						 			 			 	ELSE NULL END) pwi_quantity_available,
						 			 (CASE 	WHEN prd_definition = 'F'
						 			 				THEN
						 			 			 	 	(CASE WHEN lty_picking_switch = 1 OR lty_overstock_switch = 1
						 			 					 			THEN NVL(inv_weight_on_hand,0) - NVL(inv_weight_on_hold,0)
						 			 								ELSE 0 END)
						 			 			 	WHEN prd_definition IN ('D', 'B') THEN
						 			 				 	(CASE WHEN lty_picking_switch = 1 OR lty_overstock_switch = 1
						 			 								THEN (NVL(inv_quantity_on_hand,0) - NVL(inv_quantity_on_hold,0))
						 			 					 		 	ELSE 0 END)
						 			 			 	ELSE NULL END) pwi_weight_available
						FROM(
								 SELECT prd_code,
								 			  prd_definition,
								 			  prd_fmt_solid_inventory_code,
								 			  prf_fmt_code,
								 			  prf_operation_flag,
								 			  prf_conversion_to_base,
								 			  inv_quantity_on_hand,
								 			  inv_weight_on_hand,
								 			  inv_quantity_on_hold,
								 			  inv_weight_on_hold,
								 			  lty_picking_switch,
								 			  lty_overstock_switch,
								 			  whs_code
								 FROM inventories,
								 		  locations,
								 		  location_types,
								 		  product_formats,
								 		  products,
								 		  warehouses
								 WHERE loc_code = inv_loc_code
								 	 AND lty_code = loc_lty_code
								 	 AND prf_prd_code = inv_prf_prd_code
								 	 AND prf_fmt_code = inv_prf_fmt_code
								 	 AND prd_code = prf_prd_code
								 	 AND whs_code = lty_whs_code
								 	 AND (lty_picking_switch = 1 OR lty_overstock_switch = 1)
								 /*UNION ALL
								 SELECT prd_code,
								 			  prd_definition,
								 			  prd_fmt_solid_inventory_code,
								 			  prf_fmt_code,
								 			  prf_operation_flag,
								 			  prf_conversion_to_base,
								 			  0 inv_quantity_on_hand,
								 			  0 inv_weight_on_hand,
								 			  0 inv_quantity_on_hold,
								 			  0 inv_weight_on_hold,
								 			  NULL lty_picking_switch,
								 			  NULL lty_overstock_switch,
								 			  whs_code whs_code--,
								 			  --(CASE WHEN prd_definition IN ('D', 'B') THEN --le inner weight (toujours KG) doit être converti selon le fmt poids d'inventaire
								 			 	--				PRODUCT_PACK.FROM_KG_TO_WEIGHTED_INV_FUNC(prd_code, prf_fmt_code)
								 			 	--			ELSE NULL END) prf_average_weight
								 FROM products,
								 		 	product_formats,
								 		 	warehouses
								 WHERE prf_prd_code = prd_code
								 	AND prf_operation_flag = 'M'
								 	AND prf_conversion_to_base = 1
								 	AND prf_fmt_code = NVL(prd_fmt_solid_inventory_code, prd_fmt_weighted_inv_code)*/
								)
					 )
			 GROUP BY prd_code,
			 					whs_code,
			 					prd_fmt_solid_inventory_code,
								prd_definition
	 )
	)
 ;