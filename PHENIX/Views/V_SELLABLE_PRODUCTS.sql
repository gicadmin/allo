CREATE OR REPLACE FORCE VIEW phenix.v_sellable_products (cus_code,cus_name,cus_alt_name,cus_whs_code,cus_substitution_switch,prf_prd_code,prd_description,prd_alt_description,prd_definition,prd_attribute,prd_special_order_switch,prd_convert_to_spec_ord_switch,prd_prd_is_substitute_code,prd_prd_is_replacement_code,prd_creation_date,prd_elimination_date,prd_status,prd_pgr_code,pgr_description,pgr_alt_description,pgr_sales_format,prd_ven_code,ven_name,ven_alt_name,ven_short_name,prd_brn_code,brn_description,brn_alt_description,prd_ctg_code,ctg_description,ctg_alt_description,prd_fmt_solid_inventory_code,prd_fmt_weighted_inv_code,fmt_invoiced_short_code,wsp_prw_whs_delivery_code,wsp_whs_picking_code,prf_fmt_code,prf_description,prf_conversion_to_base,prf_upc_code,prf_cash_n_carry_only_switch,prf_pre_print_required_switch,prf_inner_weight,prf_cns_code,fmt_short_code,fmt_description,fmt_alt_description,fmt_weighted_format_switch) AS
WITH allowed AS
(
  SELECT cus.cus_code,
         qtd.qtd_prf_prd_code prd_code,
         qtd.qtd_prf_fmt_code fmt_code,
         prd.prd_definition
  FROM quotation_headers qth JOIN
       quotation_details qtd ON
         (qtd.qtd_qth_id = qth.qth_id) JOIN
       customers cus ON
         (cus.cus_code = qth.qth_cus_code OR
          cus.cus_qty_code = qth.qth_qty_code OR
          (cus.cus_naz_nac_code = qth.qth_naz_nac_code AND cus.cus_naz_zone_code = qth.qth_naz_zone_code)) JOIN
       products prd ON
         (prd.prd_code = qtd.qtd_prf_prd_code)
  WHERE TRUNC(SYSDATE) BETWEEN qth.qth_start_date AND qth.qth_end_date
  GROUP BY cus.cus_code,
           qtd.qtd_prf_prd_code,
           qtd.qtd_prf_fmt_code,
           prd.prd_definition
)
SELECT cus.cus_code,
       cus.cus_name,
       cus.cus_alt_name,
       cus.cus_whs_code,
       cus.cus_substitution_switch,
       prf.prf_prd_code,
       prd.prd_description,
       prd.prd_alt_description,
       prd.prd_definition,
       prd.prd_attribute,
       prd.prd_special_order_switch,
       prd.prd_convert_to_spec_ord_switch,
       prd.prd_prd_is_substitute_code,
       prd.prd_prd_is_replacement_code,
       prd.prd_creation_date,
       prd.prd_elimination_date,
       prd.prd_status,
       prd.prd_pgr_code,
       pgr.pgr_description,
       pgr.pgr_alt_description,
       pgr.pgr_sales_format,
       prd.prd_ven_code,
       ven.ven_name,
       ven.ven_alt_name,
       ven.ven_short_name,
       prd.prd_brn_code,
       brn.brn_description,
       brn.brn_alt_description,
       prd.prd_ctg_code,
       ctg.ctg_description,
       ctg.ctg_alt_description,
       prd.prd_fmt_solid_inventory_code,
       prd.prd_fmt_weighted_inv_code,
       fmt_invoiced.fmt_short_code fmt_invoiced_short_code,
       wsp.wsp_prw_whs_delivery_code,
       wsp.wsp_whs_picking_code,
       prf.prf_fmt_code,
       prf.prf_description,
       prf.prf_conversion_to_base,
       prf.prf_upc_code,
       prf.prf_cash_n_carry_only_switch,
       prf.prf_pre_print_required_switch,
       prf.prf_inner_weight,
       prf.prf_cns_code,
       fmt.fmt_short_code,
       fmt.fmt_description,
       fmt.fmt_alt_description,
       fmt.fmt_weighted_format_switch
FROM customers cus JOIN
     product_warehouses prw ON
       ( (prw.prw_whs_code = PRW_OPERATION_PACK.GET_WAREHOUSE_FUNC) OR
         (PRW_OPERATION_PACK.GET_WAREHOUSE_FUNC IS NULL AND prw.prw_whs_code = cus.cus_whs_code) ) JOIN
     warehouse_sellable_products wsp ON
       (wsp.wsp_prw_whs_delivery_code = prw.prw_whs_code AND
        wsp.wsp_prw_prd_code = prw.prw_prd_code) JOIN
     product_formats prf ON
       (prf.prf_prd_code = wsp.wsp_prw_prd_code) JOIN
     formats fmt ON
       (fmt.fmt_code = prf.prf_fmt_code) JOIN
     products prd ON
       (prd.prd_code = prf.prf_prd_code) JOIN
     product_groups pgr ON
       (pgr.pgr_code = prd.prd_pgr_code) JOIN
     vendors ven ON
       (ven.ven_code = prd.prd_ven_code) LEFT JOIN
     brand_names brn ON
       (brn.brn_code = prd.prd_brn_code) LEFT JOIN
     catalog_sequences ctg ON
       (ctg.ctg_code = prd.prd_ctg_code) LEFT JOIN
     formats fmt_invoiced ON
       (fmt_invoiced.fmt_code = prd.prd_fmt_weighted_inv_code) JOIN
     customer_classes ccl ON
       (ccl.ccl_cls_code = prd.prd_cls_code AND
        ccl.ccl_cus_code = cus.cus_code) LEFT JOIN
     allowed ON
       (allowed.cus_code = cus.cus_code AND
        allowed.prd_code = prd.prd_code AND
        (CASE WHEN allowed.prd_definition in ('D', 'B') THEN fmt.fmt_code ELSE allowed.fmt_code END) = fmt.fmt_code)
WHERE prd.prd_status IN ('A','P','D')
  AND prd.prd_attribute NOT IN ('COU', 'CON')
  AND prf.prf_sellable_format_switch = 1
  AND (cus.cus_open_quotation_switch = 1 OR
       (cus.cus_open_quotation_switch = 0 AND allowed.fmt_code IS NOT NULL)
      );