CREATE OR REPLACE FORCE VIEW phenix.v_pfi_base_sdb_l2 (prd_code,cur_prf_fmt_code,prd_definition,cur_prf_conversion_to_base,pfi_whs_code,pfi_cvt_quantity_accounting,pfi_cvt_weight_accounting,pfi_cvt_quantity_in_transit,pfi_cvt_weight_in_transit,pfi_cvt_quantity_on_dock_rcp,pfi_cvt_weight_on_dock_rcp,pfi_cvt_quantity_on_dock,pfi_cvt_weight_on_dock,pfi_cvt_quantity_damaged,pfi_cvt_weight_damaged,pfi_cvt_quantity_allocated,pfi_cvt_weight_allocated,pfi_cvt_quantity_cash_n_carry,pfi_cvt_weight_cash_n_carry,pfi_cvt_quantity_on_hold,pfi_cvt_weight_on_hold,pfi_cvt_quantity_available,pfi_cvt_weight_available,pfi_real_quantity_accounting,pfi_real_weight_accounting,pfi_real_quantity_in_transit,pfi_real_weight_in_transit,pfi_real_quantity_on_dock_rcp,pfi_real_weight_on_dock_rcp,pfi_real_quantity_on_dock,pfi_real_weight_on_dock,pfi_real_quantity_damaged,pfi_real_weight_damaged,pfi_real_quantity_allocated,pfi_real_weight_allocated,pfi_real_quantity_cash_n_carry,pfi_real_weight_cash_n_carry,pfi_real_quantity_on_hold,pfi_real_weight_on_hold,pfi_real_quantity_available,pfi_real_weight_available) AS
SELECT prd_code,
       cur_prf_fmt_code,
       prd_definition,
       cur_prf_conversion_to_base,
       lty_whs_code                                     pfi_whs_code,
       cvt_inv_quantity_on_hand                         pfi_cvt_quantity_accounting,
       CASE
           WHEN prd_definition IN ('D', 'B')
           THEN cvt_inv_quantity_on_hand * prf_average_weight
           ELSE 0
        END                                             pfi_cvt_weight_accounting,
       CASE
           WHEN lty_transit_switch = 1
           THEN cvt_inv_quantity_on_hand
           ELSE 0
       END                                              pfi_cvt_quantity_in_transit,
       CASE
           WHEN prd_definition IN ('D', 'B') AND lty_transit_switch = 1
           THEN cvt_inv_quantity_on_hand * prf_average_weight
           ELSE 0
       END                                              pfi_cvt_weight_in_transit,
       CASE
           WHEN lty_receiving_dock_switch = 1
           THEN cvt_inv_quantity_on_hand
           ELSE 0
       END                                              pfi_cvt_quantity_on_dock_rcp,
       CASE
           WHEN prd_definition IN ('D', 'B') AND lty_receiving_dock_switch = 1
           THEN cvt_inv_quantity_on_hand * prf_average_weight
           ELSE 0
       END                                              pfi_cvt_weight_on_dock_rcp,
       CASE
           WHEN lty_shipping_dock_switch = 1
           THEN cvt_inv_quantity_on_hand
           ELSE 0
        END                                             pfi_cvt_quantity_on_dock,
       CASE
           WHEN prd_definition IN ('D', 'B') AND lty_shipping_dock_switch = 1
           THEN cvt_inv_quantity_on_hand * prf_average_weight
           ELSE 0
       END                                              pfi_cvt_weight_on_dock,
       CASE
           WHEN (lty_damage_switch) > 0
           THEN cvt_inv_quantity_on_hand
           ELSE 0
       END                                              pfi_cvt_quantity_damaged,
       CASE
           WHEN prd_definition IN ('D', 'B') AND (lty_damage_switch + lty_liquidation_switch) > 0
           THEN cvt_inv_quantity_on_hand * prf_average_weight
           ELSE 0
       END                                              pfi_cvt_weight_damaged,
       CASE
           WHEN lty_damage_switch = 0
           THEN cvt_inv_quantity_to_pick
           ELSE 0
       END                                              pfi_cvt_quantity_allocated,
       CASE
           WHEN prd_definition IN ('D', 'B') AND lty_damage_switch = 0
           THEN cvt_inv_quantity_to_pick * prf_average_weight
           ELSE 0
       END                                              pfi_cvt_weight_allocated,
       CASE
           WHEN lty_cash_and_carry_switch = 1
               AND lty_picking_switch = 0
               AND lty_overstock_switch = 0
           THEN cvt_inv_quantity_on_hand
           ELSE 0
       END                                              pfi_cvt_quantity_cash_n_carry,
       CASE
           WHEN prd_definition IN ('D', 'B')
                AND lty_cash_and_carry_switch = 1
                AND lty_picking_switch = 0
                AND lty_overstock_switch = 0
           THEN cvt_inv_quantity_on_hand * prf_average_weight
           ELSE 0
       END                                              pfi_cvt_weight_cash_n_carry,
       CASE
           WHEN lty_damage_switch = 0
           THEN cvt_inv_quantity_on_hold
           ELSE 0
       END                                              pfi_cvt_quantity_on_hold,
       CASE
           WHEN prd_definition IN ('D', 'B') AND lty_damage_switch = 0
           THEN cvt_inv_quantity_on_hold * prf_average_weight
           ELSE 0
       END                                              pfi_cvt_weight_on_hold,
       CASE
           WHEN lty_picking_switch + lty_overstock_switch > 0
           THEN cvt_inv_quantity_on_hand - cvt_inv_quantity_on_hold
           ELSE 0
       END                                              pfi_cvt_quantity_available,
       CASE
           WHEN prd_definition IN ('D', 'B')
                AND lty_picking_switch + lty_overstock_switch > 0
           THEN (cvt_inv_quantity_on_hand - cvt_inv_quantity_on_hold) * prf_average_weight
           ELSE 0
       END                                              pfi_cvt_weight_available,
       real_inv_quantity_on_hand                        pfi_real_quantity_accounting,
       CASE
           WHEN prd_definition IN ('D', 'B')
           THEN real_inv_quantity_on_hand * prf_average_weight
           ELSE 0
       END                                              pfi_real_weight_accounting,
       CASE
           WHEN lty_transit_switch = 1
           THEN real_inv_quantity_on_hand
           ELSE 0
       END                                              pfi_real_quantity_in_transit,
       CASE
           WHEN prd_definition IN ('D', 'B') AND lty_transit_switch = 1
           THEN real_inv_quantity_on_hand * prf_average_weight
           ELSE 0
       END                                              pfi_real_weight_in_transit,
       CASE
           WHEN lty_receiving_dock_switch = 1
           THEN real_inv_quantity_on_hand
           ELSE 0
       END                                              pfi_real_quantity_on_dock_rcp,
       CASE
           WHEN prd_definition IN ('D', 'B') AND lty_receiving_dock_switch = 1
           THEN real_inv_quantity_on_hand * prf_average_weight
           ELSE 0
       END                                              pfi_real_weight_on_dock_rcp,
       CASE
           WHEN lty_shipping_dock_switch = 1
           THEN real_inv_quantity_on_hand
           ELSE 0
       END                                              pfi_real_quantity_on_dock,
       CASE
           WHEN prd_definition IN ('D', 'B') AND lty_shipping_dock_switch = 1
           THEN real_inv_quantity_on_hand * prf_average_weight
           ELSE 0
       END                                              pfi_real_weight_on_dock,
       CASE
           WHEN (lty_damage_switch) > 0
           THEN real_inv_quantity_on_hand
           ELSE 0
       END                                              pfi_real_quantity_damaged,
       CASE
           WHEN prd_definition IN ('D', 'B') AND (lty_damage_switch + lty_liquidation_switch) > 0
           THEN real_inv_quantity_on_hand * prf_average_weight
           ELSE 0
       END                                              pfi_real_weight_damaged,
       CASE
           WHEN lty_damage_switch = 0
           THEN real_inv_quantity_to_pick
           ELSE 0
       END                                              pfi_real_quantity_allocated,
       CASE
           WHEN prd_definition IN ('D', 'B') AND lty_damage_switch = 0
           THEN real_inv_quantity_to_pick * prf_average_weight
           ELSE 0
       END                                              pfi_real_weight_allocated,
       CASE
           WHEN lty_cash_and_carry_switch = 1
                AND lty_picking_switch = 0
                AND lty_overstock_switch = 0
           THEN real_inv_quantity_on_hand
           ELSE 0
       END                                              pfi_real_quantity_cash_n_carry,
       CASE
           WHEN lty_cash_and_carry_switch = 1
               AND lty_picking_switch = 0
               AND lty_overstock_switch = 0
           THEN real_inv_quantity_on_hand * prf_average_weight
           ELSE 0
       END                                              pfi_real_weight_cash_n_carry,
       CASE
           WHEN lty_damage_switch = 0
           THEN real_inv_quantity_on_hold
           ELSE 0
       END                                              pfi_real_quantity_on_hold,
       CASE
           WHEN prd_definition IN ('D', 'B') AND lty_damage_switch = 0
           THEN real_inv_quantity_on_hold * prf_average_weight
           ELSE 0
       END                                              pfi_real_weight_on_hold,
       CASE
           WHEN lty_picking_switch + lty_overstock_switch > 0
           THEN real_inv_quantity_on_hand - real_inv_quantity_on_hold
           ELSE 0
       END                                              pfi_real_quantity_available,
       CASE
           WHEN prd_definition IN ('D', 'B') AND lty_picking_switch + lty_overstock_switch > 0
           THEN (real_inv_quantity_on_hand - real_inv_quantity_on_hold) * prf_average_weight
           ELSE 0
       END                                              pfi_real_weight_available
FROM   V_PFI_BASE_SDB
;