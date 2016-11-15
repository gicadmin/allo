CREATE OR REPLACE FORCE VIEW phenix.v_temporary_product_details (tprd_cus_code,tprd_prf_prd_code,tprd_prd_definition,tprd_special_order_switch,tprd_convert_spec_ord_switch,tprd_prd_creation_date,tprd_prd_elimination_date,tprd_prd_status,tprd_prd_pgr_code,tprd_prd_ven_code,tprd_brn_code,tprd_ctg_code,tprd_fmt_solid_inventory_code,tprd_fmt_invoiced_short_code,tprd_whs_delivery_code,tprd_whs_picking_code,tprd_prf_fmt_code,tprd_prf_description,tprd_prf_conversion_to_base,tprd_prf_pre_print_switch,tprd_prf_inner_weight,tprd_cns_code,tprd_fmt_short_code,tprd_ven_short_name,tprd_ven_name,tprd_prd_description,tprd_brn_description,tprd_ctg_description,tprd_fmt_description,tprd_pgr_conversion_format,tprd_pxc_code,tprd_search_upc_code,tprd_exact_upc_code) AS
SELECT prd.cus_code,
         prd.prf_prd_code,
         prd.prd_definition,
         prd.prd_special_order_switch,
         prd.prd_convert_to_spec_ord_switch,
         prd.prd_creation_date,
         prd.prd_elimination_date,
         prd.prd_status,
         prd.prd_pgr_code,
         prd.prd_ven_code,
         prd.prd_brn_code,
         prd.prd_ctg_code,
         prd.prd_fmt_solid_inventory_code,
         prd.fmt_invoiced_short_code,
         prd.cus_whs_code,
         prd.wsp_whs_picking_code,
         prd.prf_fmt_code,
         prd.prf_description,
         prd.prf_conversion_to_base,
         prd.prf_pre_print_required_switch,
         prd.prf_inner_weight,
         prd.prf_cns_code,
         prd.fmt_short_code,
         prd.ven_short_name,
         CASE WHEN TPRD_OPERATION_PACK.GET_LANGUAGE_FUNC = 'fr-CA'
              THEN prd.ven_name
              ELSE NVL(prd.ven_alt_name, prd.ven_name) END ven_name,
         CASE WHEN TPRD_OPERATION_PACK.GET_LANGUAGE_FUNC = 'fr-CA'
              THEN prd.prd_description
              ELSE NVL(prd.prd_alt_description, prd.prd_description) END prd_description,
         CASE WHEN TPRD_OPERATION_PACK.GET_LANGUAGE_FUNC = 'fr-CA'
              THEN NVL(prd.brn_description, prd.ven_short_name)
              ELSE NVL(NVL(prd.brn_alt_description, prd.brn_description), prd.ven_short_name) END brn_description,
         CASE WHEN TPRD_OPERATION_PACK.GET_LANGUAGE_FUNC = 'fr-CA'
              THEN prd.ctg_description
              ELSE NVL(prd.ctg_alt_description, prd.ctg_description) END ctg_description,
         CASE WHEN TPRD_OPERATION_PACK.GET_LANGUAGE_FUNC = 'fr-CA'
              THEN prd.fmt_description
              ELSE NVL(prd.fmt_alt_description, prd.fmt_description) END fmt_description,
         CASE WHEN prd.pgr_sales_format = 1
              THEN prd.prf_conversion_to_base * -1
              ELSE prd.prf_conversion_to_base END pgr_conversion_format,
         xref.xref_code,
         LPAD(prd.prf_upc_code, 18, '0') search_upc_code,
         LTRIM(prd.prf_upc_code, '0') exact_upc_code
  FROM v_sellable_products prd LEFT JOIN
       v_product_xref xref ON
         (xref.xref_prd_code = prd.prf_prd_code AND
          xref.xref_fmt_code = prd.prf_fmt_code AND
          xref.xref_cus_code = prd.cus_code);