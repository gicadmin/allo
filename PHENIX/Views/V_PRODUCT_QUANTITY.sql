CREATE OR REPLACE FORCE VIEW phenix.v_product_quantity (prd_code,prd_quantity_on_pick_list,prd_weight_on_pick_list,prd_quantity_on_cust_order,prd_weight_on_cust_order,prd_quantity_reserved,prd_weight_reserved,prd_quantity_on_prebook,prd_weight_on_prebook) AS
(
	SELECT 	prd_code,
					SUM(prd_quantity_on_pick_list) prd_quantity_on_pick_list,
					SUM(prd_weight_on_pick_list)prd_weight_on_pick_list,
					SUM(prd_quantity_on_cust_order) prd_quantity_on_cust_order,
					SUM(prd_weight_on_cust_order) prd_weight_on_cust_order,
					SUM(prd_quantity_reserved) prd_quantity_reserved, --csc1742
					SUM(prd_weight_reserved) prd_weight_reserved, --csc1742
					SUM(prd_quantity_on_prebook) prd_quantity_on_prebook, --gic1702
					SUM(prd_weight_on_prebook) prd_weight_on_prebook --gic1702
	FROM(
		(
		SELECT cod_prf_prd_code prd_code,
				 (CASE 	WHEN (cod_order_type = 'PB' OR (cod_order_type = 'SP' AND cod_show_spec_prebook_switch = 1)) THEN 0   --ber6354
	       				ELSE	NVL(((SELECT SUM(cot_pick_quantity * prf_conversion_to_base)
		           							FROM customer_order_transactions
		 					 							WHERE cot_cod_coh_id = cod_coh_id
		           							  AND cot_cod_line_number = cod_line_number
		           							  AND cot_inh_id IS NULL
		           							  AND cot_plh_id > 0)),0)
		           	END) prd_quantity_on_pick_list,
				 (CASE 	WHEN (cod_order_type = 'PB' OR (cod_order_type = 'SP' AND cod_show_spec_prebook_switch = 1)) THEN 0   --ber6354
	       				ELSE	NVL(((SELECT SUM(cot_pick_weight)
		            						FROM customer_order_transactions
		            						WHERE cot_cod_coh_id = cod_coh_id
		            						 AND cot_cod_line_number = cod_line_number
		            						 AND cot_inh_id IS NULL
		            						 AND cot_plh_id > 0)),0)
		            END) prd_weight_on_pick_list,
		     (CASE	WHEN (cod_order_type = 'PB' OR (cod_order_type = 'SP' AND cod_show_spec_prebook_switch = 1)) THEN 0  --ber6354
	       				ELSE	NVL((DECODE(cod_order_type, 'SP', cod_leftover_quantity * prf_conversion_to_base,--CVI830 COD_ORDER_QUANTITY * PRF_CONVERSION_TO_BASE,
		      						DECODE((SELECT COUNT(cot_cod_coh_id)
		                  				FROM customer_order_transactions
		                  				WHERE cot_cod_coh_id = cod_coh_id
		                  					AND cot_cod_line_number = cod_line_number
		                  					AND cot_plh_id > 0),
		                  				0,
		                  				cod_order_quantity * prf_conversion_to_base,
		                  				0))),0)
		      						- NVL((DECODE(cod_order_type, 'SP', (	SELECT SUM(cot_pick_quantity * prf_conversion_to_base)--CVI830 on ne prend plus les facturés
		      						                                   	FROM customer_order_transactions
		      						                                   	WHERE cot_cod_coh_id = cod_coh_id
		      						                                   		AND cot_cod_line_number = cod_line_number
		      						                                   		AND cot_inh_id IS NULL --CVI830
		      						                                   		AND cot_plh_id > 0), 0)),0)
		      			END) prd_quantity_on_cust_order,
		      (CASE	WHEN (cod_order_type = 'PB' OR (cod_order_type = 'SP' AND cod_show_spec_prebook_switch = 1)) THEN 0  --ber6354
	       				ELSE	NVL((DECODE(cod_order_type, 'SP', cod_leftover_weight	,--CVI830 COD_ORDER_WEIGHT ,
		      						DECODE((SELECT COUNT(cot_cod_coh_id)
		                  				FROM customer_order_transactions
		                  				WHERE cot_cod_coh_id = cod_coh_id
		                  					AND cot_cod_line_number = cod_line_number),
		                  				0,
		                  				cod_order_weight ,
		                  				0))),0)
		      						- NVL((DECODE(cod_order_type, 'SP', (	SELECT SUM(cot_pick_weight) --CVI830
		      						                                   	FROM customer_order_transactions
		      						                                   	WHERE cot_cod_coh_id = cod_coh_id
		      						                                   		AND cot_cod_line_number = cod_line_number
		      						                                   		AND cot_inh_id IS NULL --CVI830
	        						                                  		AND cot_plh_id > 0), 0)),0)
	        			END) prd_weight_on_cust_order,
				 (CASE	WHEN (cod_order_type = 'PB' OR (cod_order_type = 'SP' AND cod_show_spec_prebook_switch = 1)) THEN 0  --ber6354
	       				ELSE (NVL(cod_reserved_quantity,0) * prf_conversion_to_base)
	       				END) prd_quantity_reserved, --csc1742
				 (CASE	WHEN (cod_order_type = 'PB' OR (cod_order_type = 'SP' AND cod_show_spec_prebook_switch = 1)) THEN 0  --ber6354
	       				ELSE (NVL(cod_reserved_weight,0) * prf_conversion_to_base)
	       				END) prd_weight_reserved, --csc1742
	       (CASE 	WHEN (cod_order_type = 'PB' OR (cod_order_type = 'SP' AND cod_show_spec_prebook_switch = 1))  --ber6354
	              THEN (NVL(cod_leftover_quantity,0) * prf_conversion_to_base)
	       				ELSE 0
	       				END) prd_quantity_on_prebook, --GIC1702
				 (CASE 	WHEN (cod_order_type = 'PB' OR (cod_order_type = 'SP' AND cod_show_spec_prebook_switch = 1))  --ber6354
				        THEN (NVL(cod_leftover_weight,0) * prf_conversion_to_base)
				        ELSE 0
	       				END) prd_weight_on_prebook --giC1702
	FROM 	customer_order_details,
				product_formats,
				customer_order_headers
	WHERE prf_prd_code = cod_prf_prd_code
		AND prf_fmt_code = cod_prf_fmt_code
		AND cod_open_switch = 1
		AND cod_coh_id > 0
		AND	cod_coh_id = coh_id
		AND	coh_cross_dock_switch = 0 --csc1655
		AND	cod_indirect_delivery_switch = 0	--csc1504
    AND cod_division_order_switch =0 --GCL530
    AND cod_order_source <> 'LIQU' --USG850
	)
	UNION ALL
	(
	SELECT prd_code,
	       0,
	       0,
	       0,
	       0,
	       0,
	       0,
	       0,
	       0
	FROM products
	)
	)
	GROUP BY prd_code
);
COMMENT ON COLUMN phenix.v_product_quantity.prd_code IS 'Numéro de produit';
COMMENT ON COLUMN phenix.v_product_quantity.prd_quantity_on_pick_list IS 'Quantité sur bon de cueillette';
COMMENT ON COLUMN phenix.v_product_quantity.prd_weight_on_pick_list IS 'Poids sur bon de cueillette';
COMMENT ON COLUMN phenix.v_product_quantity.prd_quantity_on_cust_order IS 'Quantité sur commande client';
COMMENT ON COLUMN phenix.v_product_quantity.prd_weight_on_cust_order IS 'Poids sur commande client';
COMMENT ON COLUMN phenix.v_product_quantity.prd_quantity_reserved IS 'Quantité en bulletins';
COMMENT ON COLUMN phenix.v_product_quantity.prd_weight_reserved IS 'Poids en bulletins';