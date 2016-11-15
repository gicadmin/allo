CREATE OR REPLACE FORCE VIEW phenix.v_pfa_base_sdb_l2 (prd_code,cur_prf_fmt_code,prd_definition,pfa_whs_code,pfa_real_quantity_available,pfa_real_weight_available) AS
SELECT prd_code,
          cur_prf_fmt_code,
          prd_definition,
          lty_whs_code pfa_whs_code,
          CASE
             WHEN lty_picking_switch + lty_overstock_switch > 0
             THEN
                real_inv_quantity_on_hand - real_inv_quantity_on_hold
             ELSE
                0
          END
             pfa_real_quantity_available,
          CASE
             WHEN     prd_definition IN ('D', 'B')
                  AND lty_picking_switch + lty_overstock_switch > 0
             THEN
                  (real_inv_quantity_on_hand - real_inv_quantity_on_hold)
                * prf_average_weight
             ELSE
                0
          END
             pfa_real_weight_available
     FROM v_pfa_BASE_SDB;