CREATE OR REPLACE FORCE VIEW phenix.v_product_whs_inv (pwi_prd_code,pwi_whs_code,pwi_prd_definition,pwi_quantity_invoiced,pwi_weight_invoiced,pwi_quantity_accounting,pwi_weight_accounting,pwi_quantity_in_transit,pwi_weight_in_transit,pwi_quantity_on_dock_recep,pwi_weight_on_dock_recep,pwi_quantity_on_dock,pwi_weight_on_dock,pwi_quantity_damaged,pwi_weight_damaged,pwi_quantity_allocated,pwi_weight_allocated,pwi_quantity_cash_and_carry,pwi_weight_cash_and_carry,pwi_quantity_on_hold,pwi_weight_on_hold,pwi_quantity_on_hand,pwi_weight_on_hand,pwi_quantity_available,pwi_weight_available) AS
(
SELECT 	pwi_prd_code,
				pwi_whs_code,
			 	pwi_prd_definition,	--GIC3284 amener la définition dans la vue
				pwi_quantity_invoiced,
				pwi_weight_invoiced,
				(pwi_quantity_accounting - pwi_quantity_invoiced) pwi_quantity_accounting,
			 	(pwi_weight_accounting - pwi_weight_invoiced) pwi_weight_accounting,
			 	pwi_quantity_in_transit,
			 	pwi_weight_in_transit,
			 	pwi_quantity_on_dock_recep,
			 	pwi_weight_on_dock_recep,
			 	pwi_quantity_on_dock,
			 	pwi_weight_on_dock,
			 	pwi_quantity_damaged,
			 	pwi_weight_damaged,
			 	pwi_quantity_allocated,
			 	pwi_weight_allocated,
			 	pwi_quantity_cash_and_carry,
			 	pwi_weight_cash_and_carry,
			 	pwi_quantity_on_hold,
			 	pwi_weight_on_hold,
			 	(pwi_quantity_accounting - pwi_quantity_on_hold - pwi_quantity_damaged 	- pwi_quantity_on_dock - pwi_qty_invoiced_not_on_dock) pwi_quantity_on_hand,
			 	(pwi_weight_accounting - pwi_weight_on_hold - pwi_weight_damaged - pwi_weight_on_dock - pwi_wght_invoiced_not_on_dock) pwi_weight_on_hand,
			 	pwi_quantity_available,
			 	pwi_weight_available
FROM(
		 SELECT prd_code pwi_prd_code,
		 				whs_code pwi_whs_code,
						prd_definition pwi_prd_definition,	--GIC3284 amener la définition dans la vue
		 			  ROUND(NVL((SELECT SUM(DECODE(prd_definition, 'F', NULL, NVL(pmd_quantity_to_ship,0) * DECODE(prf_operation_flag, 'M', prf_conversion_to_base, 1/prf_conversion_to_base)))
											 FROM	pick_mission_details,
														product_formats
											 WHERE pmd_prf_prd_code = prd_code
												 AND pmd_prf_prd_code = prf_prd_code
												 AND pmd_prf_fmt_code = prf_fmt_code
												 AND pmd_pmh_id IN (SELECT lsc_pmh_id
																		 				FROM location_shipping_containers
																		 				WHERE lsc_loaded_switch = 0 /*csc4933 si loaded = 1... linventaire est déjà supprimé, donc on ne le compte pas*/
																						 	AND lsc_invoiced_switch = 1)),
											DECODE(prd_definition, 'F', NULL, 0)),3) pwi_quantity_invoiced,
						ROUND(NVL((SELECT SUM(DECODE(prd_definition, 'S', NULL, NVL(pmd_weight_to_ship,0)))
											 FROM pick_mission_details
											 WHERE pmd_prf_prd_code = prd_code
												 AND pmd_pmh_id IN (SELECT lsc_pmh_id
																		 				FROM location_shipping_containers
																		 				WHERE lsc_loaded_switch = 0 /*csc4933 si loaded = 1... linventaire est déjà supprimé, donc on ne le compte pas*/
																			 				AND lsc_invoiced_switch = 1)),
											DECODE(prd_definition, 'S', NULL, 0)),3) pwi_weight_invoiced,
						ROUND(NVL((SELECT SUM(DECODE(prd_definition, 'F', NULL, NVL(pmd_quantity_to_ship,0) * DECODE(prf_operation_flag, 'M', prf_conversion_to_base, 1/prf_conversion_to_base)))
											 FROM	pick_mission_details,
														product_formats
											 WHERE pmd_prf_prd_code = prd_code
												 AND pmd_prf_prd_code = prf_prd_code
												 AND pmd_prf_fmt_code = prf_fmt_code
												 AND pmd_pmh_id IN (SELECT lsc_pmh_id
																		 				FROM	location_shipping_containers,
																									locations,
																									location_types
																		 				WHERE lsc_loaded_switch = 0 /*csc4933 si loaded = 1... linventaire est déjà supprimé, donc on ne le compte pas*/
																						 	AND lsc_invoiced_switch = 1
																						 	AND lsc_loc_code = loc_code
																						 	AND loc_lty_code = lty_code
																						 	AND lty_shipping_dock_switch = 0)),
											DECODE(prd_definition, 'F', NULL, 0)),3) pwi_qty_invoiced_not_on_dock,
						ROUND(NVL((SELECT SUM(DECODE(prd_definition, 'S', NULL, NVL(pmd_weight_to_ship,0)))
											 FROM	pick_mission_details
											 WHERE pmd_prf_prd_code = prd_code
												 AND pmd_pmh_id IN (SELECT lsc_pmh_id
																		 				FROM 	location_shipping_containers,
																									locations,
																									location_types
																		 				WHERE lsc_loaded_switch = 0 /*csc4933 si loaded = 1... linventaire est déjà supprimé, donc on ne le compte pas*/
																						 	AND lsc_invoiced_switch = 1
																						 	AND lsc_loc_code = loc_code
																						 	AND loc_lty_code = lty_code
																						 	AND lty_shipping_dock_switch = 0)),
											DECODE(prd_definition, 'S', NULL, 0)),3) pwi_wght_invoiced_not_on_dock,
						ROUND(SUM(pwi_quantity_accounting),3) pwi_quantity_accounting,
						ROUND(SUM(pwi_weight_accounting),3) pwi_weight_accounting,
						ROUND(SUM(pwi_quantity_in_transit),3) pwi_quantity_in_transit,
						ROUND(SUM(pwi_weight_in_transit),3) pwi_weight_in_transit,
						ROUND(SUM(pwi_quantity_on_dock_recep),3) pwi_quantity_on_dock_recep,
						ROUND(SUM(pwi_weight_on_dock_recep),3) pwi_weight_on_dock_recep,
						ROUND(SUM(pwi_quantity_on_dock),3) pwi_quantity_on_dock,
						ROUND(SUM(pwi_weight_on_dock),3) pwi_weight_on_dock,
						ROUND(SUM(pwi_quantity_damaged),3) pwi_quantity_damaged,
						ROUND(SUM(pwi_weight_damaged),3) pwi_weight_damaged,
						ROUND(SUM(pwi_quantity_allocated),3) pwi_quantity_allocated,
						ROUND(SUM(pwi_weight_allocated),3) pwi_weight_allocated,
						ROUND(SUM(pwi_quantity_cash_and_carry),3) pwi_quantity_cash_and_carry,
						ROUND(SUM(pwi_weight_cash_and_carry),3) pwi_weight_cash_and_carry,
						ROUND(SUM(pwi_quantity_on_hold),3) pwi_quantity_on_hold,
						ROUND(SUM(pwi_weight_on_hold),3) pwi_weight_on_hold,
						ROUND(SUM(pwi_quantity_available),3) pwi_quantity_available,
						ROUND(SUM(pwi_weight_available),3) pwi_weight_available
		 FROM(
					SELECT prd_code,
								 whs_code,
							 	 prd_definition,
							 	 (CASE WHEN prd_definition IN ('S','D','B') THEN
							 	    	 	 NVL(inv_quantity_on_hand,0) * DECODE(prf_operation_flag, 'M', prf_conversion_to_base, 1/prf_conversion_to_base)
							 	  		 ELSE NULL END) pwi_quantity_accounting,
							 	 (CASE WHEN prd_definition = 'F' THEN NVL(inv_weight_on_hand,0)
								  		 	 WHEN prd_definition IN ('D','B') THEN
								  		 	   NVL(inv_quantity_on_hand,0) * prf_average_weight
								  		 ELSE NULL END) pwi_weight_accounting,
							 	 (CASE WHEN prd_definition IN ('S','D','B') THEN
					 			  	 		 DECODE(lty_transit_switch, 0, 0,NVL(inv_quantity_on_hand,0) * DECODE(prf_operation_flag, 'M', prf_conversion_to_base, 1/prf_conversion_to_base))
					 			  		 ELSE NULL END) pwi_quantity_in_transit,
							 	 (CASE WHEN prd_definition = 'F' THEN
					 			  	 		 DECODE(lty_transit_switch, 0, 0, NVL(inv_weight_on_hand,0))
					 			  		 WHEN prd_definition IN ('D','B') THEN
					 			  	 		 DECODE(lty_transit_switch, 0, 0, NVL(inv_quantity_on_hand,0) * prf_average_weight)
					 			  		 ELSE NULL END) pwi_weight_in_transit,
							 	 (CASE WHEN prd_definition IN ('S','D','B') THEN
					 			    	 	 DECODE(lty_receiving_dock_switch, 0, 0,NVL(inv_quantity_on_hand,0) * DECODE(prf_operation_flag, 'M', prf_conversion_to_base, 1/prf_conversion_to_base))
					 			  		 ELSE NULL END) pwi_quantity_on_dock_recep,
							 	 (CASE WHEN prd_definition = 'F' THEN
					 			  	 		 DECODE(lty_receiving_dock_switch, 0, 0, NVL(inv_weight_on_hand,0))
					 			  		 WHEN prd_definition IN ('D','B') THEN
					 			  	 		 DECODE(lty_receiving_dock_switch, 0, 0, NVL(inv_quantity_on_hand,0) * prf_average_weight)
					 			  		 ELSE NULL END) pwi_weight_on_dock_recep,
							 	 (CASE WHEN prd_definition IN ('S','D','B') THEN
					 			  	 		 DECODE(lty_shipping_dock_switch, 0, 0,NVL(inv_quantity_on_hand,0) * DECODE(prf_operation_flag, 'M', prf_conversion_to_base, 1/prf_conversion_to_base))
					 			  		 ELSE NULL END) pwi_quantity_on_dock,
							 	 (CASE WHEN prd_definition = 'F' THEN
					 			  	 		 DECODE(lty_shipping_dock_switch, 0, 0, NVL(inv_weight_on_hand,0))
					 			  		 WHEN prd_definition IN ('D','B') THEN
					 			  	 		 DECODE(lty_shipping_dock_switch, 0, 0, NVL(inv_quantity_on_hand,0) * prf_average_weight)
					 			  		 ELSE NULL END) pwi_weight_on_dock,
							 	 (CASE WHEN prd_definition IN ('S','D','B') THEN
					 			  	 		 (CASE WHEN lty_damage_switch = 1 OR lty_liquidation_switch = 1 THEN --USG850
                                 NVL(inv_quantity_on_hand,0) * DECODE(prf_operation_flag, 'M', prf_conversion_to_base, 1/prf_conversion_to_base)
					 			  		         ELSE 0 END)
                       ELSE NULL END) pwi_quantity_damaged,
							 	 (CASE WHEN prd_definition = 'F' THEN
					 			  	 		 (CASE WHEN lty_damage_switch = 1 OR lty_liquidation_switch = 1 THEN --USG850
                                 NVL(inv_weight_on_hand,0)
                               ELSE 0 END)
					 			  		 WHEN prd_definition IN ('D','B') THEN
					 			  	 		 (CASE WHEN lty_damage_switch = 1 OR lty_liquidation_switch = 1 THEN --USG850
                                 NVL(inv_quantity_on_hand,0) * prf_average_weight
                               ELSE 0 END)
					 			  		 ELSE NULL END) pwi_weight_damaged,
							 	 (CASE WHEN prd_definition IN ('S','D','B') THEN
					 			  	 		 DECODE(lty_damage_switch, 1, 0, NVL(inv_quantity_to_pick,0) * DECODE(prf_operation_flag, 'M', prf_conversion_to_base, 1/prf_conversion_to_base))
					 			  		 ELSE NULL END) pwi_quantity_allocated,
							 	 (CASE WHEN prd_definition = 'F' THEN
							 	 			   DECODE(lty_damage_switch, 1, 0, NVL(inv_weight_to_pick,0))
					 			  		 WHEN prd_definition IN ('D','B') THEN
					 			  	 		 DECODE(lty_damage_switch, 1, 0, NVL(inv_quantity_to_pick,0) * prf_average_weight)
					 			  		 ELSE NULL END) pwi_weight_allocated,
							 	 (CASE WHEN prd_definition IN ('S','D','B') THEN
			 			  	 				 	(CASE WHEN lty_cash_and_carry_switch = 1 AND lty_picking_switch = 0 AND lty_overstock_switch = 0 THEN
			 			  	 				  		   NVL(inv_quantity_on_hand,0) * DECODE(prf_operation_flag, 'M', prf_conversion_to_base, 1/prf_conversion_to_base)
			 			  	 	 			 			 ELSE 0 END)
					 			  		 ELSE NULL END) pwi_quantity_cash_and_carry,
							 	 (CASE WHEN prd_definition = 'F' THEN
					 			  	 		 	(CASE WHEN lty_cash_and_carry_switch = 1 AND lty_picking_switch = 0 AND lty_overstock_switch = 0 THEN
					 			  	 			 		   NVL(inv_weight_on_hand,0)
					 			  	 	 			 	 ELSE 0 END)
					 			  		 WHEN prd_definition IN ('D','B') THEN
					 			  	 			(CASE WHEN lty_cash_and_carry_switch = 1 AND lty_picking_switch = 0 AND lty_overstock_switch = 0 THEN
					 			  	 		 				 NVL(inv_quantity_on_hand,0) * prf_average_weight
					 			  	 	 		 		 	ELSE 0 END)
					 			  		 ELSE NULL END) pwi_weight_cash_and_carry,
							 	 (CASE WHEN prd_definition IN ('S','D','B') THEN
								  	 		 DECODE(lty_damage_switch, 1, 0, NVL(inv_quantity_on_hold,0) * DECODE(prf_operation_flag, 'M', prf_conversion_to_base, 1/prf_conversion_to_base))
								  		 ELSE NULL END) pwi_quantity_on_hold,
							 	 (CASE WHEN prd_definition = 'F' THEN
					 			  	 		 DECODE(lty_damage_switch, 1, 0, NVL(inv_weight_on_hold,0))
					 			  		 WHEN prd_definition IN ('D','B') THEN
					 			  	 		 DECODE(lty_damage_switch, 1, 0, NVL(inv_quantity_on_hold,0) * prf_average_weight)
					 			  		 ELSE NULL END) pwi_weight_on_hold,
					 			 (CASE WHEN prd_definition IN ('S', 'D', 'B') THEN
					 			 				 (CASE WHEN lty_picking_switch = 1 OR lty_overstock_switch = 1 THEN
					 			 					 		   (NVL(inv_quantity_on_hand,0) - NVL(inv_quantity_on_hold,0)) * DECODE(prf_operation_flag, 'M', prf_conversion_to_base, 1/prf_conversion_to_base)
					 			 					ELSE 0 END)
					 			 			 ELSE NULL END) pwi_quantity_available,
					 			 (CASE WHEN prd_definition = 'F' THEN
					 			 			 	 (CASE WHEN lty_picking_switch = 1 OR lty_overstock_switch = 1 THEN
					 			 					 			 NVL(inv_weight_on_hand,0) - NVL(inv_weight_on_hold,0)
					 			 					ELSE 0 END)
					 			 			 WHEN prd_definition IN ('D', 'B') THEN
					 			 				 (CASE WHEN lty_picking_switch = 1 OR lty_overstock_switch = 1 THEN
					 			 								 (NVL(inv_quantity_on_hand,0) - NVL(inv_quantity_on_hold,0)) * prf_average_weight
					 			 					 		 ELSE 0 END)
					 			 			 ELSE NULL END) pwi_weight_available
					FROM(
							 SELECT prd_code,
							 			  prd_definition,
							 			  prf_fmt_code,
							 			  prf_operation_flag,
							 			  prf_conversion_to_base,
							 			  inv_quantity_on_hand,
							 			  inv_weight_on_hand,
							 			  0 inv_quantity_to_pick,
							 			  0 inv_weight_to_pick,
							 			  inv_quantity_on_hold,
							 			  inv_weight_on_hold,
							 			  lty_transit_switch,
							 			  lty_receiving_dock_switch,
							 			  lty_shipping_dock_switch,
							 			  lty_damage_switch,
							 			  lty_cash_and_carry_switch,
							 			  lty_picking_switch,
							 			  lty_overstock_switch,
							 			  whs_code,
							 			  (CASE WHEN prd_definition IN ('D', 'B') THEN --le inner weight (toujours KG) doit être converti selon le fmt poids d'inventaire
							 			 					PRODUCT_PACK.FROM_KG_TO_WEIGHTED_INV_FUNC(prd_code, prf_fmt_code)
							 			 				ELSE NULL END) prf_average_weight,
                      lty_liquidation_switch
							 FROM v_inventories,
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
               UNION ALL
  						 SELECT prd_code,
							 			  prd_definition,
							 			  prf_fmt_code,
							 			  prf_operation_flag,
							 			  prf_conversion_to_base,
							 			  0 inv_quantity_on_hand,
							 			  0 inv_weight_on_hand,
							 			  0 inv_quantity_to_pick,
							 			  0 inv_weight_to_pick,
							 			  0 inv_quantity_on_hold,
							 			  0 inv_weight_on_hold,
							 			  NULL lty_transit_switch,
							 			  NULL lty_receiving_dock_switch,
							 			  NULL lty_shipping_dock_switch,
							 			  NULL lty_damage_switch,
							 			  NULL lty_cash_and_carry_switch,
							 			  NULL lty_picking_switch,
							 			  NULL lty_overstock_switch,
							 			  whs_code,
							 			  (CASE WHEN prd_definition IN ('D', 'B') THEN --le inner weight (toujours KG) doit être converti selon le fmt poids d'inventaire
							 			 					PRODUCT_PACK.FROM_KG_TO_WEIGHTED_INV_FUNC(prd_code, prf_fmt_code)
							 			 				ELSE NULL END) prf_average_weight,
                      NULL lty_liquidation_switch
							 FROM products,
							 		 	product_formats,
							 		 	warehouses
							 WHERE prf_prd_code = prd_code
							)
				 )
		 GROUP BY prd_code,
		 					whs_code,
							prd_definition
	  )
);
COMMENT ON TABLE phenix.v_product_whs_inv IS 'Vue contenant l''inventaire pour chaque produit par entrepôt';
COMMENT ON COLUMN phenix.v_product_whs_inv.pwi_prd_code IS 'Indique le code de produit';
COMMENT ON COLUMN phenix.v_product_whs_inv.pwi_whs_code IS 'Indique le code de l''entrepôt';
COMMENT ON COLUMN phenix.v_product_whs_inv.pwi_quantity_invoiced IS 'Indique la quantité facturée';
COMMENT ON COLUMN phenix.v_product_whs_inv.pwi_weight_invoiced IS 'Indique le poids facturé';
COMMENT ON COLUMN phenix.v_product_whs_inv.pwi_quantity_accounting IS 'Indique la quantité totale entre les quatre murs (n''inclus pas les conteneurs déjà facturés)';
COMMENT ON COLUMN phenix.v_product_whs_inv.pwi_weight_accounting IS 'Indique le poids totale entre les quatre murs (n''inclus pas les conteneurs déjà facturés)';
COMMENT ON COLUMN phenix.v_product_whs_inv.pwi_quantity_in_transit IS 'Indique la quantité en transit';
COMMENT ON COLUMN phenix.v_product_whs_inv.pwi_weight_in_transit IS 'Indique le poids en transit';
COMMENT ON COLUMN phenix.v_product_whs_inv.pwi_quantity_on_dock_recep IS 'Indique la quantité sur les quais de réception';
COMMENT ON COLUMN phenix.v_product_whs_inv.pwi_weight_on_dock_recep IS 'Indique le poids sur les quais de réception';
COMMENT ON COLUMN phenix.v_product_whs_inv.pwi_quantity_on_dock IS 'Indique la quantité sur les quais';
COMMENT ON COLUMN phenix.v_product_whs_inv.pwi_weight_on_dock IS 'Indique le poids sur les quais';
COMMENT ON COLUMN phenix.v_product_whs_inv.pwi_quantity_damaged IS 'Indique la quantité endommagée';
COMMENT ON COLUMN phenix.v_product_whs_inv.pwi_weight_damaged IS 'Indique le poids endommagé';
COMMENT ON COLUMN phenix.v_product_whs_inv.pwi_quantity_allocated IS 'Indique la quantité déjà sur des missions de cueillette';
COMMENT ON COLUMN phenix.v_product_whs_inv.pwi_weight_allocated IS 'Indique le poids déjà sur des missions de cueillette';
COMMENT ON COLUMN phenix.v_product_whs_inv.pwi_quantity_cash_and_carry IS 'Indique la quantité dans les localisations servant uniquement au payer et emporter';
COMMENT ON COLUMN phenix.v_product_whs_inv.pwi_weight_cash_and_carry IS 'Indique le poids dans les localisations servant uniquement au payer et emporter';
COMMENT ON COLUMN phenix.v_product_whs_inv.pwi_quantity_on_hold IS 'Indique la quantité en retenue';
COMMENT ON COLUMN phenix.v_product_whs_inv.pwi_weight_on_hold IS 'Indique le poids en retenu';
COMMENT ON COLUMN phenix.v_product_whs_inv.pwi_quantity_on_hand IS 'Indique la quantité totale entre les quatre murs moins la quantité dans les localisations de produits endommagés, en retenu et sur le quai d''expédition';
COMMENT ON COLUMN phenix.v_product_whs_inv.pwi_weight_on_hand IS 'Indique le poids total entre les quatre murs moins le poids dans les localisations de produits endommagés, en retenu et sur le quai d''expédition';
COMMENT ON COLUMN phenix.v_product_whs_inv.pwi_quantity_available IS 'Indique la quantité totale entre les quatres murs moins les quantité dans les localisations de produits endommagés, en retenu, le quai d''expédition et de réception, localisation d''utilisateur et les transits';
COMMENT ON COLUMN phenix.v_product_whs_inv.pwi_weight_available IS 'Indique le poids total entre les quatres murs moins le poids dans les localisations de produits endommagés, en retenu, le quai d''expédition et de réception, localisation d''utilisateur et les transits';