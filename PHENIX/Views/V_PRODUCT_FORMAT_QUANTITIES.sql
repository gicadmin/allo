CREATE OR REPLACE FORCE VIEW phenix.v_product_format_quantities (pfq_prf_prd_code,pfq_prf_fmt_code,pfq_whs_code,pfq_prd_definition,pfq_quantity_on_pick_list,pfq_weight_on_pick_list,pfq_quantity_on_cust_order,pfq_weight_on_cust_order,pfq_quantity_reserved,pfq_weight_reserved,pfq_quantity_on_prebook,pfq_weight_on_prebook) AS
(
 SELECT   pfq_prf_prd_code,
          pfq_prf_fmt_code,
          pfq_whs_code,          --BER1443
          pfq_prd_definition,
          SUM(pfq_quantity_on_pick_list) 	pfq_quantity_on_pick_list,
          SUM(pfq_weight_on_pick_list)		pfq_weight_on_pick_list,
          SUM(pfq_quantity_on_cust_order) pfq_quantity_on_cust_order,
          SUM(pfq_weight_on_cust_order) 	pfq_weight_on_cust_order,
          SUM(pfq_quantity_reserved) 			pfq_quantity_reserved,     --csc1742
          SUM(pfq_weight_reserved) 				pfq_weight_reserved,         --csc1742
          SUM(pfq_quantity_on_prebook) 		pfq_quantity_on_prebook, --gic1702
          SUM(pfq_weight_on_prebook) 			pfq_weight_on_prebook       --gic1702
  FROM(
    (
    SELECT  cod_prf_prd_code pfq_prf_prd_code,
            cod_prf_fmt_code pfq_prf_fmt_code,
            cod_whs_picking_code pfq_whs_code,
            prd_definition pfq_prd_definition,
            SUM( CASE WHEN cod_order_type = 'PB'
            					THEN 0
                   		WHEN prd_definition IN ('S', 'B', 'D')
                   		THEN nvl2(cot_inh_id,0,nvl(cot_pick_quantity,0))
                   		ELSE 0
                 END) pfq_quantity_on_pick_list,
            SUM( CASE WHEN cod_order_type = 'PB'
            					THEN 0
                   		WHEN prd_definition = 'F'
                   		THEN nvl2(cot_inh_id,0,nvl(cot_pick_weight,0))
                   		ELSE 0
                 END) pfq_weight_on_pick_list,
            (CASE WHEN ROUND(cod_project_delivery_date - SYSDATE) > ctr_on_cus_order_calc_days
            			THEN 0
             			WHEN cod_order_type = 'PB'
             			THEN 0
             			ELSE NVL(CASE WHEN prd_definition IN ('S', 'B', 'D') AND cod_order_type = 'SP'
                 				    		THEN cod_leftover_quantity   --cvI830 COD_ORDER_QUANTITY * PRF_CONVERSION_TO_BASE,
                 				  			WHEN prd_definition IN ('S', 'B', 'D')
                 				    		THEN DECODE(sum(nvl2(cot_cod_coh_id,1,0)),0, cod_order_quantity,0) --pas commande speciale --
                 				  			ELSE 0
                 				  END,0)
                 			 -
                 			 NVL(CASE WHEN prd_definition IN ('S', 'B', 'D') AND cod_order_type = 'SP'
                 				    		THEN SUM(nvl2(cot_inh_id,0,cot_pick_quantity))  --CVI830 on ne prend plus les factures
                 				  			ELSE 0
                 				  END,0)
             END) pfq_quantity_on_cust_order,
            (CASE WHEN ROUND(cod_project_delivery_date - SYSDATE) > ctr_on_cus_order_calc_days
            			THEN 0
                  WHEN cod_order_type = 'PB'
                  THEN 0
                  ELSE (NVL(CASE 	WHEN ( prd_definition = 'F' AND cod_order_type = 'SP')
                  								THEN cod_leftover_weight    --CVI830 COD_ORDER_WEIGHT ,
                            			WHEN prd_definition = 'F'
                            			THEN DECODE(SUM(nvl2(cot_cod_coh_id,1,0)),0, cod_order_weight,0)--pas commande speciale
                            			ELSE 0
                            END,0))
             END)
             -
             (CASE 	WHEN ROUND(cod_project_delivery_date - SYSDATE) > ctr_on_cus_order_calc_days
             				THEN 0
             				WHEN cod_order_type = 'PB'
             				THEN 0
             				ELSE NVL((CASE 	WHEN prd_definition = 'F' AND cod_order_type = 'SP'
             												THEN SUM(cot_pick_weight)
             												ELSE 0
             									END),0)
             END) pfq_weight_on_cust_order,
             (CASE 	WHEN cod_order_type = 'PB'
             				THEN 0
                   	ELSE (NVL(cod_reserved_quantity,0))
             END) pfq_quantity_reserved, --csc1742
             (CASE 	WHEN cod_order_type = 'PB' THEN 0
                   	ELSE (NVL(cod_reserved_weight,0))
             END) pfq_weight_reserved, --csc1742
             (CASE 	WHEN cod_order_type = 'PB' THEN NVL(cod_leftover_quantity,0)
                   	ELSE 0
             END) pfq_quantity_on_prebook,
             (CASE 	WHEN cod_order_type = 'PB' THEN NVL(cod_leftover_weight,0)
                   	ELSE 0
             END) pfq_weight_on_prebook
    FROM  customer_order_details
    			left outer join customer_order_transactions
    					on (cot_cod_coh_id = cod_coh_id
                  AND cot_cod_line_number = cod_line_number
                  AND cot_plh_id > 0)
          left join products
          		on (cod_prf_prd_code = prd_code)
          left join customer_order_headers
          		on (cod_coh_id = coh_id),
          control
    WHERE cod_open_switch = 1
      AND cod_coh_id > 0
      AND coh_cross_dock_switch = 0  --csc1655
      AND cod_indirect_delivery_switch = 0
      AND cod_division_order_switch =0 --GCL530
      AND cod_order_source <> 'LIQU' --USG850
		GROUP BY cod_prf_prd_code,
		         cod_prf_fmt_code,
		         cod_whs_picking_code,
		         prd_definition,
		         cod_order_type,
		         cod_leftover_quantity,
		         cod_leftover_weight,
		         cod_order_quantity,
		         cod_order_weight,
		         cod_reserved_weight,
		         cod_reserved_quantity,
		         cod_project_delivery_date,
		         ctr_on_cus_order_calc_days,
		         cod_line_number,
		         cod_coh_id		)
		UNION ALL
		(
		SELECT 	prf_prd_code  	pfq_prf_prd_code,
		       	prf_fmt_code 		pfq_prf_fmt_code,
		       	whs_code 				pfq_whs_code,				--BER1443
		       	prd_definition 	pfq_prd_definition,
				 	 	0 							pfq_quantity_on_pick_list,
			      0 							pfq_weight_on_pick_list,
				    0 							pfq_quantity_on_cust_order,
				    0 							pfq_weight_on_cust_order,
						0 							pfq_quantity_reserved,
						0 							pfq_weight_reserved,
				 	 	0 							pfq_quantity_on_prebook,
				 	 	0 							pfq_weight_on_prebook
		FROM 	product_formats,
					products,
					warehouses			--BER1443
		WHERE prd_code = prf_prd_code
			AND prf_operation_flag = 'M'
			AND ((prd_definition = 'F' AND prf_fmt_code = prd_fmt_weighted_inv_code) /*si F, on prend le format weighted dinventaire, sinon, c'est le seul format 'M' quon ne veut pas*/
				OR (prd_definition in ('B', 'D') AND prf_fmt_code <> prd_fmt_weighted_inv_code)
				OR (prd_definition = 'S'))
		)
	)
	GROUP BY 	pfq_prf_prd_code,
						pfq_prf_fmt_code,
						pfq_whs_code,
						pfq_prd_definition	--BER1443
);