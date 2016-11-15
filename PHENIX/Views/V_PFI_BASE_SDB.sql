CREATE OR REPLACE FORCE VIEW phenix.v_pfi_base_sdb (prd_code,cur_prf_fmt_code,prd_definition,cur_prf_conversion_to_base,lty_whs_code,cvt_inv_quantity_on_hand,cvt_inv_quantity_to_pick,cvt_inv_quantity_on_hold,real_inv_quantity_on_hand,real_inv_quantity_to_pick,real_inv_quantity_on_hold,lty_transit_switch,lty_receiving_dock_switch,lty_shipping_dock_switch,lty_damage_switch,lty_cash_and_carry_switch,lty_picking_switch,lty_overstock_switch,lty_liquidation_switch,prf_average_weight) AS
SELECT prd.prd_code prd_code,
          current_prf.prf_fmt_code cur_prf_fmt_code,
          prd_definition,
          current_prf.prf_conversion_to_base cur_prf_conversion_to_base,
          lty_whs_code,
            NVL (inv_quantity_on_hand, 0)
          * invent_prf.prf_conversion_to_base
          / current_prf.prf_conversion_to_base
             cvt_inv_quantity_on_hand,
            NVL (inv_quantity_to_pick, 0)
          * invent_prf.prf_conversion_to_base
          / current_prf.prf_conversion_to_base
             cvt_inv_quantity_to_pick,
            NVL (inv_quantity_on_hold, 0)
          * invent_prf.prf_conversion_to_base
          / current_prf.prf_conversion_to_base
             cvt_inv_quantity_on_hold,
          CASE
             WHEN invent_prf.prf_fmt_code = current_prf.prf_fmt_code
             THEN
                NVL (inv_quantity_on_hand, 0)
             ELSE
                0
          END
             real_inv_quantity_on_hand,
          CASE
             WHEN invent_prf.prf_fmt_code = current_prf.prf_fmt_code
             THEN
                NVL (inv_quantity_to_pick, 0)
             ELSE
                0
          END
             real_inv_quantity_to_pick,
          CASE
             WHEN invent_prf.prf_fmt_code = current_prf.prf_fmt_code
             THEN
                NVL (inv_quantity_on_hold, 0)
             ELSE
                0
          END
             real_inv_quantity_on_hold,
          lty_transit_switch,
          lty_receiving_dock_switch,
          lty_shipping_dock_switch,
          lty_damage_switch,
          lty_cash_and_carry_switch,
          lty_picking_switch,
          lty_overstock_switch,
          lty_liquidation_switch,
          CASE
             WHEN prd_definition IN ('D', 'B')
             THEN --le inner weight (toujours KG) doit être converti selon le fmt poids d'inventaire
                PRODUCT_PACK.FROM_KG_TO_WEIGHTED_INV_FUNC (
                   prd_code,
                   current_prf.prf_fmt_code)
             ELSE
                0
          END
             prf_average_weight
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
    WHERE     current_prf.prf_operation_flag = 'M'
          AND prd.prd_definition IN ('S', 'B', 'D')
          AND fmt.fmt_weighted_format_switch = 0
          AND invent_prf.prf_operation_flag = 'M'
          AND invent_prf.prf_conversion_to_base >=
                 current_prf.prf_conversion_to_base;