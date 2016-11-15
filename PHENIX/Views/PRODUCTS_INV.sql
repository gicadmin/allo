CREATE OR REPLACE FORCE VIEW phenix.products_inv (prd_code,piv_prd_definition,prd_quantity_invoiced,prd_weight_invoiced,prd_quantity_accounting,prd_weight_accounting,prd_quantity_in_transit,prd_weight_in_transit,prd_quantity_on_dock_recep,prd_weight_on_dock_recep,prd_quantity_on_dock,prd_weight_on_dock,prd_quantity_damaged,prd_weight_damaged,prd_quantity_allocated,prd_weight_allocated,prd_quantity_cash_and_carry,prd_weight_cash_and_carry,prd_quantity_on_hold,prd_weight_on_hold,prd_quantity_on_hand,prd_weight_on_hand,prd_quantity_available,prd_weight_available) AS
(
SELECT 	prd_code,
			 	prd_definition piv_prd_definition,	--gic3284
			 	prd_quantity_invoiced,			/*CSC4253*/
				prd_weight_invoiced,				/*CSC4253*/
				(prd_quantity_accounting - prd_quantity_invoiced) prd_quantity_accounting,	/*csc4253 diminué le facturé de la qté comptable*/
			 	(prd_weight_accounting - prd_weight_invoiced) prd_weight_accounting,	/*csc4253 diminué le facturé de la qté comptable*/
			 	prd_quantity_in_transit,
			 	prd_weight_in_transit,
			 	prd_quantity_on_dock_recep,
			 	prd_weight_on_dock_recep,
			 	prd_quantity_on_dock,
			 	prd_weight_on_dock,
			 	prd_quantity_damaged,
			 	prd_weight_damaged,
			 	prd_quantity_allocated,
			 	prd_weight_allocated,
			 	prd_quantity_cash_and_carry,
			 	prd_weight_cash_and_carry,
			 	prd_quantity_on_hold,
			 	prd_weight_on_hold,
			 	(prd_quantity_accounting - prd_quantity_on_hold - prd_quantity_damaged 	- prd_quantity_on_dock - prd_qty_invoiced_not_on_dock) prd_quantity_on_hand, /*csc4631 ajouter prd_qty_invoiced_not_on_dock*/
			 	(prd_weight_accounting 	- prd_weight_on_hold - prd_weight_damaged - prd_weight_on_dock - prd_wght_invoiced_not_on_dock) prd_weight_on_hand,  /*csc4631 ajouter prd_wght_invoiced_not_on_dock*/
			 	prd_quantity_available,
			 	prd_weight_available
FROM(
	SELECT 	prd_code,
				 	prd_definition,	--gic3284 ajouter la définition
				 	ROUND(NVL((	SELECT SUM(DECODE(prd_definition, 'F', NULL, NVL(pmd_quantity_to_ship,0) * DECODE(prf_operation_flag, 'M', prf_conversion_to_base, 1/prf_conversion_to_base)))
				 							FROM 	pick_mission_details,
				 										product_formats
				 							WHERE pmd_prf_prd_code = prd_code
				 								AND pmd_prf_prd_code = prf_prd_code
				 								AND pmd_prf_fmt_code = prf_fmt_code
				 								AND pmd_pmh_id IN (	SELECT lsc_pmh_id	--gic3284 faire IN au lieu de EXISTS
				 																		FROM location_shipping_containers
				 																		WHERE lsc_loaded_switch = 0 /*csc4933 si loaded = 1... linventaire est déjà supprimé, donc on ne le compte pas*/
				 																			AND lsc_invoiced_switch = 1)),
				 							DECODE(prd_definition, 'F', NULL, 0)),3) prd_quantity_invoiced,			/*CSC4253*/
				 	ROUND(NVL((	SELECT SUM(DECODE(prd_definition, 'S', NULL, NVL(pmd_weight_to_ship,0)))
				 							FROM 	pick_mission_details
				 							WHERE pmd_prf_prd_code = prd_code
				 								AND pmd_pmh_id IN (	SELECT lsc_pmh_id
				 																		FROM location_shipping_containers
				 																		WHERE lsc_loaded_switch = 0 /*csc4933 si loaded = 1... linventaire est déjà supprimé, donc on ne le compte pas*/
				 																			AND lsc_invoiced_switch = 1)),
				 							DECODE(prd_definition, 'S', NULL, 0)),3) prd_weight_invoiced,			/*CSC4253*/
				 	ROUND(NVL((	SELECT SUM(DECODE(prd_definition, 'F', NULL, NVL(pmd_quantity_to_ship,0) * DECODE(prf_operation_flag, 'M', prf_conversion_to_base, 1/prf_conversion_to_base)))
				 							FROM 	pick_mission_details,
				 										product_formats
				 							WHERE pmd_prf_prd_code = prd_code
				 								AND pmd_prf_prd_code = prf_prd_code
				 								AND pmd_prf_fmt_code = prf_fmt_code
				 								AND pmd_pmh_id IN (	SELECT lsc_pmh_id
				 																		FROM 	location_shipping_containers,
				 																					locations,
				 																					location_types
				 																		WHERE lsc_loaded_switch = 0 /*csc4933 si loaded = 1... linventaire est déjà supprimé, donc on ne le compte pas*/
				 																			AND lsc_invoiced_switch = 1
				 																			AND lsc_loc_code = loc_code
				 																			AND loc_lty_code = lty_code
				 																			AND lty_shipping_dock_switch = 0)),
				 							DECODE(prd_definition, 'F', NULL, 0)),3) prd_qty_invoiced_not_on_dock,			/*CSC4631*/
				 	ROUND(NVL((	SELECT SUM(DECODE(prd_definition, 'S', NULL, NVL(pmd_weight_to_ship,0)))
				 							FROM 	pick_mission_details
				 							WHERE pmd_prf_prd_code = prd_code
				 								AND pmd_pmh_id IN (	SELECT lsc_pmh_id
				 																		FROM 	location_shipping_containers,
				 																					locations,
				 																					location_types
				 																		WHERE lsc_loaded_switch = 0 /*csc4933 si loaded = 1... linventaire est déjà supprimé, donc on ne le compte pas*/
				 																			AND lsc_invoiced_switch = 1
				 																			AND lsc_loc_code = loc_code
				 																			AND loc_lty_code = lty_code
				 																			AND lty_shipping_dock_switch = 0)),
				 							DECODE(prd_definition, 'S', NULL, 0)),3) prd_wght_invoiced_not_on_dock,			/*CSC4631*/
				 	ROUND(SUM(prd_quantity_accounting),3) prd_quantity_accounting,
				 	ROUND(SUM(prd_weight_accounting),3) prd_weight_accounting,
				 	ROUND(SUM(prd_quantity_in_transit),3) prd_quantity_in_transit,
				 	ROUND(SUM(prd_weight_in_transit),3) prd_weight_in_transit,
				 	ROUND(SUM(prd_quantity_on_dock_recep),3) prd_quantity_on_dock_recep,
				 	ROUND(SUM(prd_weight_on_dock_recep),3) prd_weight_on_dock_recep,
				 	ROUND(SUM(prd_quantity_on_dock),3) prd_quantity_on_dock,
				 	ROUND(SUM(prd_weight_on_dock),3) prd_weight_on_dock,
				 	ROUND(SUM(prd_quantity_damaged),3) prd_quantity_damaged,
				 	ROUND(SUM(prd_weight_damaged),3) prd_weight_damaged,
				 	ROUND(SUM(prd_quantity_allocated),3) prd_quantity_allocated,
				 	ROUND(SUM(prd_weight_allocated),3) prd_weight_allocated,
				 	ROUND(SUM(prd_quantity_cash_and_carry),3) prd_quantity_cash_and_carry,
				 	ROUND(SUM(prd_weight_cash_and_carry),3) prd_weight_cash_and_carry,
				 	ROUND(SUM(prd_quantity_on_hold),3) prd_quantity_on_hold,
				 	ROUND(SUM(prd_weight_on_hold),3) prd_weight_on_hold,
				 	ROUND(SUM(prd_quantity_available),3) prd_quantity_available,
				 	ROUND(SUM(prd_weight_available),3) prd_weight_available
	FROM(
		SELECT 	prd_code,
					 	prd_definition,
					 	(CASE WHEN prd_definition IN ('S','D','B') THEN
					 	   				 NVL(inv_quantity_on_hand,0) * DECODE(prf_operation_flag, 'M', prf_conversion_to_base, 1/prf_conversion_to_base)
					 	 		 	ELSE NULL END) prd_quantity_accounting,  			--PRD_QUANTITY_ACCOUNTING
					 	(CASE WHEN prd_definition = 'F' THEN NVL(inv_weight_on_hand,0)
						 		 	WHEN prd_definition IN ('D','B') THEN NVL(inv_quantity_on_hand,0) * prf_average_weight
						 		 	ELSE NULL END) prd_weight_accounting,					--PRD_WEIGHT_ACCOUNTING
					 	(CASE WHEN prd_definition IN ('S','D','B') THEN
			 			 	 				 DECODE(lty_transit_switch, 0, 0,
			 			 	 						NVL(inv_quantity_on_hand,0) * DECODE(prf_operation_flag, 'M', prf_conversion_to_base, 1/prf_conversion_to_base))
			 			 			ELSE NULL END) prd_quantity_in_transit,				--PRD_QUANTITY_IN_TRANSIT
					 	(CASE WHEN prd_definition = 'F' THEN
			 			 	 				 DECODE(lty_transit_switch, 0, 0, NVL(inv_weight_on_hand,0))
			 			 			WHEN prd_definition IN ('D','B') THEN
			 			 	 				 DECODE(lty_transit_switch, 0, 0, NVL(inv_quantity_on_hand,0) * prf_average_weight)
			 			 			ELSE NULL END) prd_weight_in_transit,					--PRD_WEIGHT_IN_TRANSIT
					 	(CASE WHEN prd_definition IN ('S','D','B') THEN
			 			   				 DECODE(lty_receiving_dock_switch, 0, 0,
			 			 	 						NVL(inv_quantity_on_hand,0) * DECODE(prf_operation_flag, 'M', prf_conversion_to_base, 1/prf_conversion_to_base))
			 			 			ELSE NULL END) prd_quantity_on_dock_recep,		--PRD_QUANTITY_ON_DOCK_RECEP
					 	(CASE WHEN prd_definition = 'F' THEN
			 			 	 				 DECODE(lty_receiving_dock_switch, 0, 0, NVL(inv_weight_on_hand,0))
			 			 			WHEN prd_definition IN ('D','B') THEN
			 			 	 				 DECODE(lty_receiving_dock_switch, 0, 0, NVL(inv_quantity_on_hand,0) * prf_average_weight)
			 			 			ELSE NULL END) prd_weight_on_dock_recep,			--PRD_WEIGHT_ON_DOCK_RECEP
					 	(CASE WHEN prd_definition IN ('S','D','B') THEN
			 			 	 				 DECODE(lty_shipping_dock_switch, 0, 0,
			 			 	 						NVL(inv_quantity_on_hand,0) * DECODE(prf_operation_flag, 'M', prf_conversion_to_base, 1/prf_conversion_to_base))
			 			 			ELSE NULL END) prd_quantity_on_dock,					--PRD_QUANTITY_ON_DOCK
					 	(CASE WHEN prd_definition = 'F' THEN
			 			 	 				 DECODE(lty_shipping_dock_switch, 0, 0, NVL(inv_weight_on_hand,0))
			 			 			WHEN prd_definition IN ('D','B') THEN
			 			 	 				 DECODE(lty_shipping_dock_switch, 0, 0, NVL(inv_quantity_on_hand,0) * prf_average_weight)
			 			 			ELSE NULL END) prd_weight_on_dock,						--PRD_WEIGHT_ON_DOCK
					 	(CASE WHEN prd_definition IN ('S','D','B') THEN
                       (CASE WHEN lty_damage_switch = 1 OR lty_liquidation_switch = 1 THEN --USG850
                               NVL(inv_quantity_on_hand,0) * DECODE(prf_operation_flag, 'M', prf_conversion_to_base, 1/prf_conversion_to_base)
                             ELSE 0 END)
                  ELSE NULL END) prd_quantity_damaged,					--PRD_QUANTITY_DAMAGED
					 	(CASE WHEN prd_definition = 'F' THEN
                       (CASE WHEN lty_damage_switch = 1 OR lty_liquidation_switch = 1 THEN --USG850
                               NVL(inv_weight_on_hand,0)
                             ELSE 0 END)
			 			 			WHEN prd_definition IN ('D','B') THEN
			 			 	 				 (CASE WHEN lty_damage_switch = 1 OR lty_liquidation_switch = 1 THEN --USG850
                               NVL(inv_quantity_on_hand,0) * prf_average_weight
                             ELSE 0 END)
			 			 			ELSE NULL END) prd_weight_damaged,						--PRD_WEIGHT_DAMAGED
					 	(CASE WHEN prd_definition IN ('S','D','B') THEN
			 			 	 				 DECODE(lty_damage_switch, 1, 0, NVL(inv_quantity_to_pick,0) * DECODE(prf_operation_flag, 'M', prf_conversion_to_base, 1/prf_conversion_to_base))
			 			 			ELSE NULL END) prd_quantity_allocated,				--PRD_QUANTITY_ALLOCATED
					 	(CASE WHEN prd_definition = 'F' THEN
					 						 DECODE(lty_damage_switch, 1, 0, NVL(inv_weight_to_pick,0))
			 			 			WHEN prd_definition IN ('D','B') THEN
			 			 	 				 DECODE(lty_damage_switch, 1, 0, NVL(inv_quantity_to_pick,0) * prf_average_weight)
			 			 			ELSE NULL END) prd_weight_allocated,					--PRD_WEIGHT_ALLOCATED
					 	(CASE WHEN prd_definition IN ('S','D','B') THEN
			 			 	 				 (CASE WHEN lty_cash_and_carry_switch = 1 AND lty_picking_switch = 0 AND lty_overstock_switch = 0 THEN
			 			 	 				  					NVL(inv_quantity_on_hand,0) * DECODE(prf_operation_flag, 'M', prf_conversion_to_base, 1/prf_conversion_to_base)
			 			 	 	 			 			 ELSE 0 END)
			 			 			ELSE NULL END) prd_quantity_cash_and_carry,		--PRD_QUANTITY_CASH_AND_CARRY
					 	(CASE WHEN prd_definition = 'F' THEN
			 			 	 				 (CASE WHEN lty_cash_and_carry_switch = 1 AND lty_picking_switch = 0 AND lty_overstock_switch = 0 THEN
			 			 	 				 					  NVL(inv_weight_on_hand,0)
			 			 	 	 			 			 ELSE 0 END)
			 			 			WHEN prd_definition IN ('D','B') THEN
			 			 	 				 (CASE WHEN lty_cash_and_carry_switch = 1 AND lty_picking_switch = 0 AND lty_overstock_switch = 0 THEN
			 			 	 		 								NVL(inv_quantity_on_hand,0) * prf_average_weight
			 			 	 	 						 ELSE 0 END)
			 			 			ELSE NULL END) prd_weight_cash_and_carry,			--PRD_WEIGHT_CASH_AND_CARRY
					 	(CASE WHEN prd_definition IN ('S','D','B') THEN
						 	 				 DECODE(lty_damage_switch, 1, 0, NVL(inv_quantity_on_hold,0) * DECODE(prf_operation_flag, 'M', prf_conversion_to_base, 1/prf_conversion_to_base))
						 			ELSE NULL END) prd_quantity_on_hold,					--PRD_QUANTITY_ON_HOLD
					 	(CASE WHEN prd_definition = 'F' THEN
			 			 	 				 DECODE(lty_damage_switch, 1, 0, NVL(inv_weight_on_hold,0))
			 			 			WHEN prd_definition IN ('D','B') THEN
			 			 	 				 DECODE(lty_damage_switch, 1, 0, NVL(inv_quantity_on_hold,0) * prf_average_weight)
			 			 			ELSE NULL END) prd_weight_on_hold,						--PRD_WEIGHT_ON_HOLD
			 			(CASE WHEN prd_definition IN ('S', 'D', 'B') THEN
			 								 (CASE WHEN lty_picking_switch = 1 OR lty_overstock_switch = 1 THEN
			 								 						(NVL(inv_quantity_on_hand,0) - NVL(inv_quantity_on_hold,0)) * DECODE(prf_operation_flag, 'M', prf_conversion_to_base, 1/prf_conversion_to_base)
			 								 	ELSE 0 END)
			 						ELSE NULL END) prd_quantity_available,
			 			(CASE WHEN prd_definition = 'F' THEN
			 								 (CASE WHEN lty_picking_switch = 1 OR lty_overstock_switch = 1 THEN
			 								 						NVL(inv_weight_on_hand,0) - NVL(inv_weight_on_hold,0)
			 								 	ELSE 0 END)
			 						WHEN prd_definition IN ('D', 'B') THEN
			 								 (CASE WHEN lty_picking_switch = 1 OR lty_overstock_switch = 1 THEN
			 								 						(NVL(inv_quantity_on_hand,0) - NVL(inv_quantity_on_hold,0)) * prf_average_weight
			 								 			 ELSE 0 END)
			 						ELSE NULL END) prd_weight_available
		FROM(
			SELECT prd_code,
						 prd_definition,
						 prf_fmt_code,
						 prf_operation_flag,
						 prf_conversion_to_base,
						 inv_quantity_on_hand,
						 inv_weight_on_hand,
						 inv_quantity_to_pick,
						 inv_weight_to_pick,
						 inv_quantity_on_hold,
						 inv_weight_on_hold,
						 lty_transit_switch,
						 lty_receiving_dock_switch,
						 lty_shipping_dock_switch,
						 lty_damage_switch,
						 lty_cash_and_carry_switch,
						 lty_picking_switch,
						 lty_overstock_switch,
						 (CASE 	WHEN 	prd_definition IN ('D', 'B') THEN --le inner weight (toujours KG) doit être converti selon le fmt poids d'inventaire
						 							PRODUCT_PACK.FROM_KG_TO_WEIGHTED_INV_FUNC(prd_code, prf_fmt_code)
						 				ELSE 	NULL END) prf_average_weight,
             lty_liquidation_switch
			FROM v_inventories,
					 locations,
					 location_types,
					 product_formats,
					 products
			WHERE loc_code = inv_loc_code
				AND lty_code = loc_lty_code
				AND prf_prd_code = inv_prf_prd_code
				AND prf_fmt_code = inv_prf_fmt_code
				AND prd_code = prf_prd_code
			)
		)
		GROUP BY 	prd_code,
							prd_definition
	)
);