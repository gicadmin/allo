CREATE OR REPLACE FORCE VIEW phenix.v_product_format_inv (pfi_prf_prd_code,pfi_prf_fmt_code,pfi_prd_definition,pfi_whs_code,pfi_cvt_quantity_invoiced,pfi_cvt_weight_invoiced,pfi_cvt_quantity_accounting,pfi_cvt_weight_accounting,pfi_cvt_quantity_in_transit,pfi_cvt_weight_in_transit,pfi_cvt_quantity_on_dock_rcp,pfi_cvt_weight_on_dock_rcp,pfi_cvt_quantity_on_dock,pfi_cvt_weight_on_dock,pfi_cvt_quantity_damaged,pfi_cvt_weight_damaged,pfi_cvt_quantity_allocated,pfi_cvt_weight_allocated,pfi_cvt_quantity_cash_n_carry,pfi_cvt_weight_cash_n_carry,pfi_cvt_quantity_on_hold,pfi_cvt_weight_on_hold,pfi_cvt_quantity_on_hand,pfi_cvt_weight_on_hand,pfi_cvt_quantity_available,pfi_cvt_weight_available,pfi_real_quantity_invoiced,pfi_real_weight_invoiced,pfi_real_quantity_accounting,pfi_real_weight_accounting,pfi_real_quantity_in_transit,pfi_real_weight_in_transit,pfi_real_quantity_on_dock_rcp,pfi_real_weight_on_dock_rcp,pfi_real_quantity_on_dock,pfi_real_weight_on_dock,pfi_real_quantity_damaged,pfi_real_weight_damaged,pfi_real_quantity_allocated,pfi_real_weight_allocated,pfi_real_quantity_cash_n_carry,pfi_real_weight_cash_n_carry,pfi_real_quantity_on_hold,pfi_real_weight_on_hold,pfi_real_quantity_on_hand,pfi_real_weight_on_hand,pfi_real_quantity_available,pfi_real_weight_available) AS
SELECT
   prd_code                                             pfi_prf_prd_code,
   cur_prf_fmt_code                                     pfi_prf_fmt_code,
   prd_definition                                       pfi_prd_definition,
   pfi_whs_code                                         pfi_whs_code,
   round(sum(pfi_cvt_quantity_invoiced),3)              pfi_cvt_quantity_invoiced,
   round(sum(pfi_cvt_weight_invoiced),3)                pfi_cvt_weight_invoiced,
   round(sum(pfi_cvt_quantity_accounting) -
         sum(pfi_cvt_quantity_invoiced),3)              pfi_cvt_quantity_accounting,
   round(sum(pfi_cvt_weight_accounting) -
         sum(pfi_cvt_weight_invoiced),3)                pfi_cvt_weight_accounting,
   round(sum(pfi_cvt_quantity_in_transit),3)            pfi_cvt_quantity_in_transit,
   round(sum(pfi_cvt_weight_in_transit),3)              pfi_cvt_weight_in_transit,
   round(sum(pfi_cvt_quantity_on_dock_rcp),3)           pfi_cvt_quantity_on_dock_rcp,
   round(sum(pfi_cvt_weight_on_dock_rcp),3)             pfi_cvt_weight_on_dock_rcp,
   round(sum(pfi_cvt_quantity_on_dock),3)               pfi_cvt_quantity_on_dock,
   round(sum(pfi_cvt_weight_on_dock),3)                 pfi_cvt_weight_on_dock,
   round(sum(pfi_cvt_quantity_damaged),3)               pfi_cvt_quantity_damaged,
   round(sum(pfi_cvt_weight_damaged),3)                 pfi_cvt_weight_damaged,
   round(sum(pfi_cvt_quantity_allocated),3)             pfi_cvt_quantity_allocated,
   round(sum(pfi_cvt_weight_allocated),3)               pfi_cvt_weight_allocated,
   round(sum(pfi_cvt_quantity_cash_n_carry),3)          pfi_cvt_quantity_cash_n_carry,
   round(sum(pfi_cvt_weight_cash_n_carry),3)            pfi_cvt_weight_cash_n_carry,
   round(sum(pfi_cvt_quantity_on_hold),3)               pfi_cvt_quantity_on_hold,
   round(sum(pfi_cvt_weight_on_hold),3)                 pfi_cvt_weight_on_hold,
   round(sum(pfi_cvt_quantity_accounting)
              - sum(pfi_cvt_quantity_on_hold)
              - sum(pfi_cvt_quantity_damaged)
              - sum(pfi_cvt_quantity_on_dock)
              - sum(pfi_cvt_quantity_not_on_dock),3)    pfi_cvt_quantity_on_hand,
   round(sum(pfi_cvt_weight_accounting)
              - sum(pfi_cvt_weight_on_hold)
              - sum(pfi_cvt_weight_damaged)
              - sum(pfi_cvt_weight_on_dock)
              - sum(pfi_cvt_weight_not_on_dock),3)      pfi_cvt_weight_on_hand,
   round(sum(pfi_cvt_quantity_available),3)             pfi_cvt_quantity_available,
   round(sum(pfi_cvt_weight_available),3)               pfi_cvt_weight_available,
   /* REAL */
   round(sum(pfi_real_quantity_invoiced),3)             pfi_real_quantity_invoiced,
   round(sum(pfi_real_weight_invoiced),3)               pfi_real_weight_invoiced,
   round(sum(pfi_real_quantity_accounting) -
         sum(pfi_real_quantity_invoiced),3)             pfi_real_quantity_accounting,
   round(sum(pfi_real_weight_accounting) -
         sum(pfi_real_weight_invoiced),3)               pfi_real_weight_accounting,
   round(sum(pfi_real_quantity_in_transit),3)           pfi_real_quantity_in_transit,
   round(sum(pfi_real_weight_in_transit),3)             pfi_real_weight_in_transit,
   round(sum(pfi_real_quantity_on_dock_rcp),3)          pfi_real_quantity_on_dock_rcp,
   round(sum(pfi_real_weight_on_dock_rcp),3)            pfi_real_weight_on_dock_rcp,
   round(sum(pfi_real_quantity_on_dock),3)              pfi_real_quantity_on_dock,
   round(sum(pfi_real_weight_on_dock),3)                pfi_real_weight_on_dock,
   round(sum(pfi_real_quantity_damaged),3)              pfi_real_quantity_damaged,
   round(sum(pfi_real_weight_damaged),3)                pfi_real_weight_damaged,
   round(sum(pfi_real_quantity_allocated),3)            pfi_real_quantity_allocated,
   round(sum(pfi_real_weight_allocated),3)              pfi_real_weight_allocated,
   round(sum(pfi_real_quantity_cash_n_carry),3)         pfi_real_quantity_cash_n_carry,
   round(sum(pfi_real_weight_cash_n_carry),3)           pfi_real_weight_cash_n_carry,
   round(sum(pfi_real_quantity_on_hold),3)              pfi_real_quantity_on_hold,
   round(sum(pfi_real_weight_on_hold),3)                pfi_real_weight_on_hold,
   round(sum(pfi_real_quantity_accounting)
              - sum(pfi_real_quantity_on_hold)
              - sum(pfi_real_quantity_damaged)
              - sum(pfi_real_quantity_on_dock)
              - sum(pfi_real_quantity_not_on_dock),3)   pfi_real_quantity_on_hand,
   round(sum(pfi_real_weight_accounting)
              - sum(pfi_real_weight_on_hold)
              - sum(pfi_real_weight_damaged)
              - sum(pfi_real_weight_on_dock)
              - sum(pfi_real_weight_not_on_dock),3)     pfi_real_weight_on_hand,
   round(sum(pfi_real_quantity_available),3)            pfi_real_quantity_available,
   round(sum(pfi_real_weight_available),3)              pfi_real_weight_available
FROM (
        SELECT
           v.prd_code,
           v.cur_prf_fmt_code,
           v.prd_definition,
           v.pfi_whs_code,
           0 pfi_cvt_quantity_accounting,       v.pfi_cvt_weight_accounting,
           0 pfi_cvt_quantity_in_transit,       v.pfi_cvt_weight_in_transit,
           0 pfi_cvt_quantity_on_dock_rcp,      v.pfi_cvt_weight_on_dock_rcp,
           0 pfi_cvt_quantity_on_dock,          v.pfi_cvt_weight_on_dock,
           0 pfi_cvt_quantity_damaged,          v.pfi_cvt_weight_damaged,
           0 pfi_cvt_quantity_allocated,        v.pfi_cvt_weight_allocated,
           0 pfi_cvt_quantity_cash_n_carry,     v.pfi_cvt_weight_cash_n_carry,
           0 pfi_cvt_quantity_on_hold,          v.pfi_cvt_weight_on_hold,
           0 pfi_cvt_quantity_available,        v.pfi_cvt_weight_available,
           0 pfi_real_quantity_accounting,      v.pfi_real_weight_accounting,
           0 pfi_real_quantity_in_transit,      v.pfi_real_weight_in_transit,
           0 pfi_real_quantity_on_dock_rcp,     v.pfi_real_weight_on_dock_rcp,
           0 pfi_real_quantity_on_dock,         v.pfi_real_weight_on_dock,
           0 pfi_real_quantity_damaged,         v.pfi_real_weight_damaged,
           0 pfi_real_quantity_allocated,       v.pfi_real_weight_allocated,
           0 pfi_real_quantity_cash_n_carry,    v.pfi_real_weight_cash_n_carry,
           0 pfi_real_quantity_on_hold,         v.pfi_real_weight_on_hold,
           0 pfi_real_quantity_available,       v.pfi_real_weight_available,
           0 pfi_cvt_quantity_invoiced,         0 pfi_cvt_weight_invoiced,
           0 pfi_cvt_quantity_not_on_dock,      0 pfi_cvt_weight_not_on_dock,
           0 pfi_real_quantity_invoiced,        0 pfi_real_weight_invoiced,
           0 pfi_real_quantity_not_on_dock,     0 pfi_real_weight_not_on_dock
        FROM V_PFI_BASE_F_L2 V
        UNION ALL
        SELECT
           v.prd_code,
           v.cur_prf_fmt_code,
           v.prd_definition,
           v.pfi_whs_code,
           v.pfi_cvt_quantity_accounting,       v.pfi_cvt_weight_accounting,
           v.pfi_cvt_quantity_in_transit,       v.pfi_cvt_weight_in_transit,
           v.pfi_cvt_quantity_on_dock_rcp,      v.pfi_cvt_weight_on_dock_rcp,
           v.pfi_cvt_quantity_on_dock,          v.pfi_cvt_weight_on_dock,
           v.pfi_cvt_quantity_damaged,          v.pfi_cvt_weight_damaged,
           v.pfi_cvt_quantity_allocated,        v.pfi_cvt_weight_allocated,
           v.pfi_cvt_quantity_cash_n_carry,     v.pfi_cvt_weight_cash_n_carry,
           v.pfi_cvt_quantity_on_hold,          v.pfi_cvt_weight_on_hold,
           v.pfi_cvt_quantity_available,        v.pfi_cvt_weight_available,
           v.pfi_real_quantity_accounting,      v.pfi_real_weight_accounting,
           v.pfi_real_quantity_in_transit,      v.pfi_real_weight_in_transit,
           v.pfi_real_quantity_on_dock_rcp,     v.pfi_real_weight_on_dock_rcp,
           v.pfi_real_quantity_on_dock,         v.pfi_real_weight_on_dock,
           v.pfi_real_quantity_damaged,         v.pfi_real_weight_damaged,
           v.pfi_real_quantity_allocated,       v.pfi_real_weight_allocated,
           v.pfi_real_quantity_cash_n_carry,    v.pfi_real_weight_cash_n_carry,
           v.pfi_real_quantity_on_hold,         v.pfi_real_weight_on_hold,
           v.pfi_real_quantity_available,       v.pfi_real_weight_available,
           0 pfi_cvt_quantity_invoiced,         0 pfi_cvt_weight_invoiced,
           0 pfi_cvt_quantity_not_on_dock,      0 pfi_cvt_weight_not_on_dock,
           0 pfi_real_quantity_invoiced,        0 pfi_real_weight_invoiced,
           0 pfi_real_quantity_not_on_dock,     0 pfi_real_weight_not_on_dock
        FROM V_PFI_BASE_SDB_L2 V
        UNION ALL
        SELECT
           v.prd_code,
           v.cur_prf_fmt_code,
           v.prd_definition,
           v.pfi_whs_code,
           0 pfi_cvt_quantity_accounting,       0 pfi_cvt_weight_accounting,
           0 pfi_cvt_quantity_in_transit,       0 pfi_cvt_weight_in_transit,
           0 pfi_cvt_quantity_on_dock_rcp,      0 pfi_cvt_weight_on_dock_rcp,
           0 pfi_cvt_quantity_on_dock,          0 pfi_cvt_weight_on_dock,
           0 pfi_cvt_quantity_damaged,          0 pfi_cvt_weight_damaged,
           0 pfi_cvt_quantity_allocated,        0 pfi_cvt_weight_allocated,
           0 pfi_cvt_quantity_cash_n_carry,     0 pfi_cvt_weight_cash_n_carry,
           0 pfi_cvt_quantity_on_hold,          0 pfi_cvt_weight_on_hold,
           0 pfi_cvt_quantity_available,        0 pfi_cvt_weight_available,
           0 pfi_real_quantity_accounting,      0 pfi_real_weight_accounting,
           0 pfi_real_quantity_in_transit,      0 pfi_real_weight_in_transit,
           0 pfi_real_quantity_on_dock_rcp,     0 pfi_real_weight_on_dock_rcp,
           0 pfi_real_quantity_on_dock,         0 pfi_real_weight_on_dock,
           0 pfi_real_quantity_damaged,         0 pfi_real_weight_damaged,
           0 pfi_real_quantity_allocated,       0 pfi_real_weight_allocated,
           0 pfi_real_quantity_cash_n_carry,    0 pfi_real_weight_cash_n_carry,
           0 pfi_real_quantity_on_hold,         0 pfi_real_weight_on_hold,
           0 pfi_real_quantity_available,       0 pfi_real_weight_available,
           0 pfi_cvt_quantity_invoiced,         v.pfi_cvt_weight_invoiced,
           0 pfi_cvt_quantity_not_on_dock,      v.pfi_cvt_weight_not_on_dock,
           0 pfi_real_quantity_invoiced,        v.pfi_real_weight_invoiced,
           0 pfi_real_quantity_not_on_dock,     v.pfi_real_weight_not_on_dock
        FROM V_PFI_PICK_F V
        UNION ALL
        SELECT
           v.prd_code,
           v.cur_prf_fmt_code,
           v.prd_definition,
           v.pfi_whs_code,
           0 pfi_cvt_quantity_accounting,       0 pfi_cvt_weight_accounting,
           0 pfi_cvt_quantity_in_transit,       0 pfi_cvt_weight_in_transit,
           0 pfi_cvt_quantity_on_dock_rcp,      0 pfi_cvt_weight_on_dock_rcp,
           0 pfi_cvt_quantity_on_dock,          0 pfi_cvt_weight_on_dock,
           0 pfi_cvt_quantity_damaged,          0 pfi_cvt_weight_damaged,
           0 pfi_cvt_quantity_allocated,        0 pfi_cvt_weight_allocated,
           0 pfi_cvt_quantity_cash_n_carry,     0 pfi_cvt_weight_cash_n_carry,
           0 pfi_cvt_quantity_on_hold,          0 pfi_cvt_weight_on_hold,
           0 pfi_cvt_quantity_available,        0 pfi_cvt_weight_available,
           0 pfi_real_quantity_accounting,      0 pfi_real_weight_accounting,
           0 pfi_real_quantity_in_transit,      0 pfi_real_weight_in_transit,
           0 pfi_real_quantity_on_dock_rcp,     0 pfi_real_weight_on_dock_rcp,
           0 pfi_real_quantity_on_dock,         0 pfi_real_weight_on_dock,
           0 pfi_real_quantity_damaged,         0 pfi_real_weight_damaged,
           0 pfi_real_quantity_allocated,       0 pfi_real_weight_allocated,
           0 pfi_real_quantity_cash_n_carry,    0 pfi_real_weight_cash_n_carry,
           0 pfi_real_quantity_on_hold,         0 pfi_real_weight_on_hold,
           0 pfi_real_quantity_available,       0 pfi_real_weight_available,
           v.pfi_cvt_quantity_invoiced,         v.pfi_cvt_weight_invoiced,
           v.pfi_cvt_quantity_not_on_dock,      v.pfi_cvt_weight_not_on_dock,
           v.pfi_real_quantity_invoiced,        v.pfi_real_weight_invoiced,
           v.pfi_real_quantity_not_on_dock,     v.pfi_real_weight_not_on_dock
        FROM V_PFI_PICK_SDB_L2 V
)
group by prd_code,
   cur_prf_fmt_code,
   prd_definition,
   pfi_whs_code;