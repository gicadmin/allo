CREATE OR REPLACE FORCE VIEW phenix.v_pfi_pick_sdb_l2 (prd_code,cur_prf_fmt_code,prd_definition,cur_prf_conversion_to_base,pfi_whs_code,pfi_cvt_quantity_invoiced,pfi_cvt_weight_invoiced,pfi_cvt_quantity_not_on_dock,pfi_cvt_weight_not_on_dock,pfi_real_quantity_invoiced,pfi_real_weight_invoiced,pfi_real_quantity_not_on_dock,pfi_real_weight_not_on_dock) AS
SELECT prd_code,
       cur_prf_fmt_code,
       prd_definition,
       cur_prf_conversion_to_base,
       lty_whs_code                                     pfi_whs_code,
       cvt_quantity_invoiced                            pfi_cvt_quantity_invoiced,
       CASE
           WHEN prd_definition IN ('D', 'B')
           THEN cvt_quantity_invoiced * prf_average_weight
           ELSE 0
       END                                              pfi_cvt_weight_invoiced,
       cvt_quantity_not_on_dock                         pfi_cvt_quantity_not_on_dock,
       CASE
           WHEN prd_definition IN ('D', 'B')
           THEN cvt_quantity_not_on_dock * prf_average_weight
           ELSE 0
       END                                              pfi_cvt_weight_not_on_dock,
       real_quantity_invoiced                           pfi_real_quantity_invoiced,
       CASE
           WHEN prd_definition IN ('D', 'B')
           THEN real_quantity_invoiced * prf_average_weight
           ELSE 0
       END                                              pfi_real_weight_invoiced,
       real_quantity_not_on_dock                        pfi_real_quantity_not_on_dock,
       CASE
           WHEN prd_definition IN ('D', 'B')
           THEN real_quantity_not_on_dock * prf_average_weight
           ELSE 0
       END                                              pfi_real_weight_not_on_dock
FROM   V_PFI_PICK_SDB
;