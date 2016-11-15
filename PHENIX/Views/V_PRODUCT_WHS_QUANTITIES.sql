CREATE OR REPLACE FORCE VIEW phenix.v_product_whs_quantities (pwq_prd_code,pwq_whs_code,pwq_prd_definition,pwq_quantity_on_pick_list,pwq_weight_on_pick_list,pwq_quantity_on_cust_order,pwq_weight_on_cust_order,pwq_quantity_reserved,pwq_weight_reserved,pwq_quantity_on_prebook,pwq_weight_on_prebook,pwq_telev_qty_on_cust_order,pwq_telev_wgt_on_cust_order) AS
(
	  SELECT prd_code pwq_prd_code,
	  			 whs_code pwq_whs_code,			--BER1443
	 				 prd_definition pwq_prd_definition,
	 				 SUM(pwq_quantity_on_pick_list) pwq_quantity_on_pick_list,
	 				 SUM(pwq_weight_on_pick_list) pwq_weight_on_pick_list,
	 				 SUM(pwq_quantity_on_cust_order) pwq_quantity_on_cust_order,
	 				 SUM(pwq_weight_on_cust_order) pwq_weight_on_cust_order,
	 				 SUM(pwq_quantity_reserved) pwq_quantity_reserved,
	 				 SUM(pwq_weight_reserved) pwq_weight_reserved,
	 				 SUM(pwq_quantity_on_prebook) pwq_quantity_on_prebook,
	 				 SUM(pwq_weight_on_prebook) pwq_weight_on_prebook,
					 SUM(pwq_telev_qty_on_cust_order) pwq_telev_qty_on_cust_order, --USG679
					 SUM(pwq_telev_wgt_on_cust_order) pwq_telev_wgt_on_cust_order  --USG679
		FROM(
				SELECT cod_prf_prd_code prd_code,
							 cod_whs_picking_code	whs_code,			--BER1443
							 prd_definition,
			 				 (CASE 	WHEN (cod_order_type = 'PB' OR (cod_order_type = 'SP' AND cod_show_spec_prebook_switch = 1))  --ber6354
			 				 				THEN 0
			 				 				WHEN prd_definition IN ('S', 'B', 'D')
			 				 				THEN SUM(NVL2(cot_inh_id, 0, cot_pick_quantity * prf_conversion_to_base))	--NVL2( string1, value_if_NOT_null, value_if_null )
											ELSE 0
								END) pwq_quantity_on_pick_list,
			 				 (CASE 	WHEN (cod_order_type = 'PB' OR (cod_order_type = 'SP' AND cod_show_spec_prebook_switch = 1))  --ber6354
			 				 				THEN 0
			 				 				WHEN prd_definition = 'F'
			 				 				THEN SUM(NVL2(cot_inh_id, 0, cot_pick_weight))	--NVL2( string1, value_if_NOT_null, value_if_null )
			 				 				ELSE 0
								END) pwq_weight_on_pick_list,
	     				 (CASE 	WHEN (cod_order_type = 'PB' OR (cod_order_type = 'SP' AND cod_show_spec_prebook_switch = 1))  --ber6354
			 				 				THEN 0
			 				 				WHEN prd_definition IN ('S', 'B', 'D') AND cod_order_type = 'SP'
	     				 				THEN cod_leftover_quantity * prf_conversion_to_base
	     				 				WHEN prd_definition IN ('S', 'B', 'D') --mais pas commande spéciale
	     				 				THEN DECODE(SUM(NVL2(cot_plh_id, 1, 0)), 0, cod_order_quantity * prf_conversion_to_base, 0) /*si aucun pick list, on prend la qté totale*/
	     				 				ELSE 0
	     				 	END)
	     				 	-  /*on déduit les qté qui ne sont pas encore facturées*/
	     				 NVL(SUM(CASE WHEN (cod_order_type = 'PB' OR (cod_order_type = 'SP' AND cod_show_spec_prebook_switch = 1))  --ber6354
			 				 							THEN 0
			 				 							WHEN prd_definition IN ('S', 'B', 'D') AND cod_order_type = 'SP'
	     				 							THEN NVL2(cot_inh_id, 0, cot_pick_quantity * prf_conversion_to_base)
	     				 							WHEN prd_definition IN ('S', 'B', 'D')
	     				 							THEN 0
	     				 							ELSE 0
	     				 				 END),0) pwq_quantity_on_cust_order,
	     				 (CASE 	WHEN (cod_order_type = 'PB' OR (cod_order_type = 'SP' AND cod_show_spec_prebook_switch = 1))  --ber6354
			 				 				THEN 0
			 				 				WHEN prd_definition = 'F' AND cod_order_type = 'SP'
	     				 				THEN cod_leftover_weight
	     				 				WHEN prd_definition = 'F' --mais pas commande spéciale
	     				 				THEN DECODE(SUM(NVL2(cot_plh_id, 1, 0)), 0, cod_order_weight, 0) /*si aucun pick list, on prend la qté totale*/
	     				 				ELSE 0
	     				 	END)
	     				 	-  /*on déduit les qté qui ne sont pas encore facturées*/
	     				 NVL(SUM(CASE WHEN (cod_order_type = 'PB' OR (cod_order_type = 'SP' AND cod_show_spec_prebook_switch = 1))  --ber6354
			 				 							THEN 0
			 				 							WHEN prd_definition = 'F' AND cod_order_type = 'SP'
	     				 							THEN NVL2(cot_inh_id, 0, cot_pick_weight)
	     				 							WHEN prd_definition = 'F'
	     				 							THEN 0
	     				 							ELSE 0
	     				 				 END),0) pwq_weight_on_cust_order,
							 (CASE 	WHEN (cod_order_type = 'PB' OR (cod_order_type = 'SP' AND cod_show_spec_prebook_switch = 1))  --ber6354
			 				 				THEN 0
			 				 				ELSE (NVL(cod_reserved_quantity,0) * prf_conversion_to_base)
			 				 	END) pwq_quantity_reserved,
							 (CASE 	WHEN (cod_order_type = 'PB' OR (cod_order_type = 'SP' AND cod_show_spec_prebook_switch = 1))  --ber6354
			 				 				THEN 0
			 				 				ELSE NVL(cod_reserved_weight,0)
			 				 	END) pwq_weight_reserved,
				       (CASE 	WHEN (cod_order_type = 'PB' OR (cod_order_type = 'SP' AND cod_show_spec_prebook_switch = 1))  --ber6354
			 				 				THEN NVL(cod_leftover_quantity,0) * prf_conversion_to_base
			 				 				ELSE 0
			 				 	END) pwq_quantity_on_prebook,
				       (CASE 	WHEN (cod_order_type = 'PB' OR (cod_order_type = 'SP' AND cod_show_spec_prebook_switch = 1))  --ber6354
			 				 				THEN NVL(cod_leftover_weight,0) * prf_conversion_to_base
			 				 				ELSE 0
			 				 	END) pwq_weight_on_prebook,
								(CASE WHEN ROUND(cod_project_delivery_date - SYSDATE) > ctr_on_cus_order_calc_days
            			    THEN 0
								      WHEN (cod_order_type = 'PB' OR (cod_order_type = 'SP' AND cod_show_spec_prebook_switch = 1))   --ber6354
			 				 				THEN 0
			 				 				WHEN prd_definition IN ('S', 'B', 'D') AND cod_order_type = 'SP'
	     				 				THEN cod_leftover_quantity * prf_conversion_to_base
	     				 				WHEN prd_definition IN ('S', 'B', 'D') --mais pas commande spéciale
	     				 				THEN DECODE(SUM(NVL2(cot_plh_id, 1, 0)), 0, cod_order_quantity * prf_conversion_to_base, 0) /*si aucun pick list, on prend la qté totale*/
	     				 				ELSE 0
	     				 	END)
	     				 	-  /*on déduit les qté qui ne sont pas encore facturées*/
	     				  NVL(SUM(CASE WHEN ROUND(cod_project_delivery_date - SYSDATE) > ctr_on_cus_order_calc_days
             				        THEN 0
							              WHEN (cod_order_type = 'PB' OR (cod_order_type = 'SP' AND cod_show_spec_prebook_switch = 1))  --ber6354
			 				 							THEN 0
			 				 							WHEN prd_definition IN ('S', 'B', 'D') AND cod_order_type = 'SP'
	     				 							THEN NVL2(cot_inh_id, 0, cot_pick_quantity * prf_conversion_to_base)
	     				 							WHEN prd_definition IN ('S', 'B', 'D')
	     				 							THEN 0
	     				 							ELSE 0
	     				 				 END),0) pwq_telev_qty_on_cust_order, --USG679
								(CASE 	WHEN ROUND(cod_project_delivery_date - SYSDATE) > ctr_on_cus_order_calc_days
            			    THEN 0
							        WHEN (cod_order_type = 'PB' OR (cod_order_type = 'SP' AND cod_show_spec_prebook_switch = 1))    --ber6354
			 				 				THEN 0
			 				 				WHEN prd_definition = 'F' AND cod_order_type = 'SP'
	     				 				THEN cod_leftover_weight
	     				 				WHEN prd_definition = 'F' --mais pas commande spéciale
	     				 				THEN DECODE(SUM(NVL2(cot_plh_id, 1, 0)), 0, cod_order_weight, 0) /*si aucun pick list, on prend la qté totale*/
	     				 				ELSE 0
	     				 	END)
	     				 	-  /*on déduit les qté qui ne sont pas encore facturées*/
	     				  NVL(SUM(CASE WHEN ROUND(cod_project_delivery_date - SYSDATE) > ctr_on_cus_order_calc_days
             				        THEN 0
							              WHEN (cod_order_type = 'PB' OR (cod_order_type = 'SP' AND cod_show_spec_prebook_switch = 1))  --ber6354
			 				 							THEN 0
			 				 							WHEN prd_definition = 'F' AND cod_order_type = 'SP'
	     				 							THEN NVL2(cot_inh_id, 0, cot_pick_weight)
	     				 							WHEN prd_definition = 'F'
	     				 							THEN 0
	     				 							ELSE 0
	     				 				 END),0) pwq_telev_wgt_on_cust_order	--USG679
				FROM  control,
				      customer_order_details
				      left outer join customer_order_transactions
		    					on (cot_cod_coh_id = cod_coh_id
		                  AND cot_cod_line_number = cod_line_number
		                  AND cot_plh_id > 0)
		          left join product_formats on (cod_prf_prd_code = prf_prd_code AND cod_prf_fmt_code = prf_fmt_code)
		          left join products on (cod_prf_prd_code = prd_code)
		          left join customer_order_headers on (cod_coh_id = coh_id)
				WHERE cod_open_switch = 1
					AND cod_coh_id > 0
					AND	coh_cross_dock_switch = 0
					AND	cod_indirect_delivery_switch = 0
          AND cod_division_order_switch = 0 --GCL530
          AND cod_order_source <> 'LIQU' --USG850
				GROUP BY cod_prf_prd_code,
				         prf_conversion_to_base,
				         cod_whs_picking_code,
				         prd_definition,
				         cod_order_type,
                 cod_show_spec_prebook_switch,  --ber6354
				         cod_leftover_quantity,
				         cod_leftover_weight,
				         cod_order_quantity,
				         cod_order_weight,
				         cod_reserved_weight,
				         cod_reserved_quantity,
				         cod_line_number,
				         cod_coh_id,
								 cod_project_delivery_date,
                 ctr_on_cus_order_calc_days
				UNION ALL
				SELECT prd_code prd_code,
							 whs_code whs_code,			--BER1443
				       prd_definition,
				       0 pwq_quantity_on_pick_list,
				       0 pwq_weight_on_pick_list,
				       0 pwq_quantity_on_cust_order,
				       0 pwq_weight_on_cust_order,
				       0 pwq_quantity_reserved,
				       0 pwq_weight_reserved,
				       0 pwq_quantity_on_prebook,
				       0 pwq_weight_on_prebook,
							 0 pwq_telev_qty_on_cust_order, --USG679
               0 pwq_telev_wgt_on_cust_order  --USG679
				FROM 	products,
							warehouses
			  )
		GROUP BY prd_code,
						 prd_definition,
						 whs_code				--BER1443
	);
COMMENT ON TABLE phenix.v_product_whs_quantities IS 'Vue contenant différentes quantité pour chaque produit par entrepôt';
COMMENT ON COLUMN phenix.v_product_whs_quantities.pwq_prd_code IS 'Indique le code de produit';
COMMENT ON COLUMN phenix.v_product_whs_quantities.pwq_whs_code IS 'Indique le code de l''entrepôt';
COMMENT ON COLUMN phenix.v_product_whs_quantities.pwq_prd_definition IS 'Indique le type de produit (solide/bacon/dinde/vrac)';
COMMENT ON COLUMN phenix.v_product_whs_quantities.pwq_quantity_on_pick_list IS 'Indique la quantité sur bon de cueillette';
COMMENT ON COLUMN phenix.v_product_whs_quantities.pwq_weight_on_pick_list IS 'Indique le poids sur bon de cueillette';
COMMENT ON COLUMN phenix.v_product_whs_quantities.pwq_quantity_on_cust_order IS 'Indique la quantité sur commande client';
COMMENT ON COLUMN phenix.v_product_whs_quantities.pwq_weight_on_cust_order IS 'Indique le poids sur commande client';
COMMENT ON COLUMN phenix.v_product_whs_quantities.pwq_quantity_reserved IS 'Indique la quantité en bulletins';
COMMENT ON COLUMN phenix.v_product_whs_quantities.pwq_weight_reserved IS 'Indique le poids en bulletins';
COMMENT ON COLUMN phenix.v_product_whs_quantities.pwq_quantity_on_prebook IS 'Indique la quantité réservée en bulletin client';
COMMENT ON COLUMN phenix.v_product_whs_quantities.pwq_weight_on_prebook IS 'Indique le poids réservé en bulletin client';
COMMENT ON COLUMN phenix.v_product_whs_quantities.pwq_telev_qty_on_cust_order IS 'Indique la quantité sur commande client en tenant compte du nombre de jour dans paramètre système';
COMMENT ON COLUMN phenix.v_product_whs_quantities.pwq_telev_wgt_on_cust_order IS 'Indique le poids sur commande client en tenant compte du nombre de jour dans paramètre système';