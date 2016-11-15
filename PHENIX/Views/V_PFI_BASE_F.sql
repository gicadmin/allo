CREATE OR REPLACE FORCE VIEW phenix.v_pfi_base_f (prd_code,cur_prf_fmt_code,prd_definition,cur_prf_conversion_to_base,lty_whs_code,real_inv_weight_on_hand,real_inv_weight_to_pick,real_inv_weight_on_hold,lty_transit_switch,lty_receiving_dock_switch,lty_shipping_dock_switch,lty_damage_switch,lty_cash_and_carry_switch,lty_picking_switch,lty_overstock_switch,lty_liquidation_switch) AS
SELECT prd.prd_code prd_code,
          current_prf.prf_fmt_code cur_prf_fmt_code,
          prd_definition,
          current_prf.prf_conversion_to_base cur_prf_conversion_to_base,
          lty_whs_code,
          NVL (inv_weight_on_hand, 0) real_inv_weight_on_hand,
          NVL (inv_weight_to_pick, 0) real_inv_weight_to_pick,
          NVL (inv_weight_on_hold, 0) real_inv_weight_on_hold,
          lty_transit_switch,
          lty_receiving_dock_switch,
          lty_shipping_dock_switch,
          lty_damage_switch,
          lty_cash_and_carry_switch,
          lty_picking_switch,
          lty_overstock_switch,
          lty_liquidation_switch
     FROM products prd
          JOIN product_formats current_prf
             ON (current_prf.prf_prd_code = prd.prd_code)
          JOIN formats fmt ON (fmt.fmt_code = current_prf.prf_fmt_code)
          JOIN v_inventories inv ON (inv.inv_prf_prd_code = prd.prd_code)
          JOIN
          product_formats invent_prf
             ON (    invent_prf.prf_prd_code = prd.prd_code
                 AND invent_prf.prf_fmt_code = inv.inv_prf_fmt_code)
          JOIN locations loc ON (loc.loc_code = inv.inv_loc_code)
          JOIN location_types lty ON (lty.lty_code = loc.loc_lty_code)
    WHERE     1 = 1
          --    AND prd.prd_code = '694'
          AND current_prf.prf_operation_flag = 'M'
          AND prd_definition = 'F'
          AND fmt.fmt_weighted_format_switch = 1
          AND invent_prf.prf_operation_flag = 'M'
          AND invent_prf.prf_conversion_to_base >=
                 current_prf.prf_conversion_to_base;