CREATE OR REPLACE FORCE VIEW phenix.vue_reappro_non_combles (localisation,produit,"FORMAT",entrepot,qte_reappro,qte_restante,qte_loc,qte_maximum,code_utilisateur,prenom,nom,items_par_rangee,items_par_palette,date_reappro,type_reappro) AS
SELECT localisation,
        produit,
        format,
        entrepot,
        qte_reappro,
        qte_restante,
        qte_loc,
        qte_maximum,
        code_utilisateur,
        prenom,
        nom,
        items_par_rangee,
        items_par_palette,
        date_reappro,
        type_reappro
 FROM
 (
     SELECT   inm_to_loc_code            			          localisation,
              prd_code                       	          produit,
              inm_prf_destination_fmt_code   	          format,
              inm_whs_code										          entrepot,		  -- ber1460
              SUM(NVL(inm_moved_quantity_in,0))         qte_reappro,  -- GIC3674
              MIN(NVL(inm_src_loc_quantity_on_hand,0))  qte_restante, -- GIC3674
              MAX(NVL(inm_dest_loc_quantity_on_hand,0)) qte_loc,      -- GIC3674
              inv_quantity_max               	          qte_maximum,
              inm_use_code                   	          code_utilisateur,
              use_first_name                 	          prenom,
              use_last_name                  	          nom,
              prw_items_per_row              	          items_par_rangee, 		--ber1460 utiliser PRW au lieu de PRD
              prw_items_per_pallet          	          items_par_palette,		--ber1460 utiliser PRW au lieu de PRD
              inm_end_date                   	          date_reappro,
              inm_trans_type                 	          type_reappro
     FROM   products,
            inventory_movements,
            inventories,
            users,
            product_warehouses	--ber1460
     WHERE prd_code = inv_prf_prd_code || ''
       AND inm_prf_destination_fmt_code = inv_prf_fmt_code
       AND inm_prf_prd_code = inv_prf_prd_code || ''
       AND inm_to_loc_code = inv_loc_code
       AND use_code = inm_use_code
       AND prw_whs_code = inm_whs_code	--ber1460
       AND prw_prd_code = inm_prf_prd_code	--ber1460
       AND inm_end_date > sysdate - 90
       AND inm_from_loc_code LIKE '#%'
       AND inv_quantity_max IS NOT NULL
       AND inm_src_loc_quantity_on_hand > 0	--csc5042 on ne veut pas les réappro qui avait été fait au complet...
       AND inm_src_loc_quantity_on_hand <= inv_quantity_max - inm_dest_loc_quantity_on_hand
       AND inm_prf_prd_code = prd_code || ''
     GROUP BY inm_to_loc_code, prd_code, inm_prf_destination_fmt_code, inm_whs_code, inv_quantity_max, inm_use_code, use_first_name, -- GIC3674
              use_last_name, prw_items_per_row, prw_items_per_pallet, inm_end_date, inm_trans_type, inm_group_id
  )
  WHERE qte_restante < qte_maximum - qte_loc -- GIC3674
    AND qte_restante > 0                     -- GIC3674
;