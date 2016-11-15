CREATE OR REPLACE FORCE VIEW phenix.v_pfi_pick_sdb (pmd_id,prd_code,cur_prf_fmt_code,prd_definition,cur_prf_conversion_to_base,cvt_quantity_invoiced,cvt_quantity_not_on_dock,real_quantity_invoiced,real_quantity_not_on_dock,lty_shipping_dock_switch,lty_whs_code,prf_average_weight) AS
SELECT   distinct
         pmd.pmd_id,
         pmd.pmd_prf_prd_code                               prd_code,
         current_prf.prf_fmt_code                           cur_prf_fmt_code,
         prd.prd_definition,
         current_prf.prf_conversion_to_base                 cur_prf_conversion_to_base,
         NVL (pmd.pmd_quantity_to_ship , 0)
                * invent_prf.prf_conversion_to_base
                / current_prf.prf_conversion_to_base        cvt_quantity_invoiced,
         CASE
             WHEN lty.lty_shipping_dock_switch = 0
             THEN NVL (pmd.pmd_quantity_to_ship , 0)
                    * invent_prf.prf_conversion_to_base
                    / current_prf.prf_conversion_to_base
             ELSE 0
         END                                                cvt_quantity_not_on_dock,
         CASE
             WHEN invent_prf.prf_fmt_code = current_prf.prf_fmt_code
             THEN NVL (pmd.pmd_quantity_to_ship , 0)
             ELSE 0
         END                                                real_quantity_invoiced,
         CASE
             WHEN invent_prf.prf_fmt_code = current_prf.prf_fmt_code
                    AND lty.lty_shipping_dock_switch = 0
             THEN NVL (pmd.pmd_quantity_to_ship , 0)
             ELSE 0
         END                                                real_quantity_not_on_dock,
         lty.lty_shipping_dock_switch,
         LTY.LTY_WHS_CODE,
         CASE
             WHEN prd_definition IN ('D', 'B')
             THEN --le inner weight (toujours KG) doit être converti selon le fmt poids d'inventaire
                PRODUCT_PACK.FROM_KG_TO_WEIGHTED_INV_FUNC (
                   prd_code,
                   current_prf.prf_fmt_code
                )
             ELSE
                0
         END                                                prf_average_weight
  FROM   location_shipping_containers lsc join
         locations loc on
            (loc.loc_code = lsc.lsc_loc_code) join
         location_types lty on
            (lty.lty_code = loc.loc_lty_code) join
         pick_mission_details pmd on
            (pmd.pmd_pmh_id = lsc.lsc_pmh_id) join
         product_formats invent_prf on
            (invent_prf.prf_prd_code = pmd.pmd_prf_prd_code AND
             invent_prf.prf_fmt_code = pmd.pmd_prf_fmt_code) join
         products prd on
            (prd.prd_code = invent_prf.prf_prd_code) join
         product_formats current_prf on
            (current_prf.prf_prd_code = prd.prd_code)
 WHERE   1=1
     AND lsc_loaded_switch = 0
     AND lsc_invoiced_switch = 1
     AND current_prf.prf_operation_flag = 'M'
     AND prd.prd_definition IN ('S', 'B', 'D')
     AND invent_prf.prf_operation_flag = 'M'
;