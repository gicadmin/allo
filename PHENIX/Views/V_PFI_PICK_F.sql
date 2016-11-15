CREATE OR REPLACE FORCE VIEW phenix.v_pfi_pick_f (pmd_id,prd_code,cur_prf_fmt_code,prd_definition,cur_prf_conversion_to_base,pfi_whs_code,pfi_cvt_weight_invoiced,pfi_cvt_weight_not_on_dock,pfi_real_weight_invoiced,pfi_real_weight_not_on_dock) AS
SELECT   distinct
         pmd.pmd_id,
         pmd.pmd_prf_prd_code                               prd_code,
         current_prf.prf_fmt_code                           cur_prf_fmt_code,
         prd.prd_definition,
         current_prf.prf_conversion_to_base                 cur_prf_conversion_to_base,
         LTY.LTY_WHS_CODE                                   pfi_whs_code,
         NVL (pmd.pmd_weight_to_ship , 0)                   pfi_cvt_weight_invoiced,
         CASE
             WHEN lty.lty_shipping_dock_switch = 0
             THEN NVL (pmd.pmd_weight_to_ship , 0)
             ELSE 0
         END                                                pfi_cvt_weight_not_on_dock,
         NVL (pmd.pmd_weight_to_ship , 0)                   pfi_real_weight_invoiced,
         CASE
             WHEN lty.lty_shipping_dock_switch = 0
             THEN NVL (pmd.pmd_weight_to_ship , 0)
             ELSE 0
         END                                                pfi_real_weight_not_on_dock
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
     AND prd.prd_definition = 'F'
     AND invent_prf.prf_operation_flag = 'M'
;