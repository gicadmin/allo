CREATE OR REPLACE FORCE VIEW phenix.v_product_xref (xref_cus_code,xref_prd_code,xref_fmt_code,xref_code,xref_xrg_code,xref_description,xref_alt_description,xref_unique_switch) AS
WITH XREF AS
(
  SELECT cus.cus_code,
         prf.prf_prd_code prd_code,
         prf.prf_fmt_code fmt_code,
         pxc.pxc_code xref_code,
         pxc.pxc_xrg_code xref_xrg_code,
         NVL(pxc.pxc_description, prd.prd_description) xref_description,
         NVL(pxc.pxc_alt_description, prd.prd_alt_description) xref_alt_description,
         NVL(prd.prd_fmt_solid_inventory_code, prd.prd_fmt_weighted_inv_code) fmt_inventory_code,
         1 priority
  FROM product_xref_codes pxc JOIN
       customers cus ON
         (cus.cus_xrg_code = pxc.pxc_xrg_code) JOIN
       product_formats prf ON
         (prf.prf_prd_code = pxc.pxc_prd_code AND
          prf.prf_fmt_code = pxc.pxc_fmt_code) JOIN
       products prd ON
         (prd.prd_code = prf.prf_prd_code)
  UNION ALL
  SELECT cus.cus_code,
         prf.prf_prd_code prd_code,
         prf.prf_fmt_code fmt_code,
         pxc.pxc_code xref_code,
         pxc.pxc_xrg_code xref_xrg_code,
         NVL(pxc.pxc_description, prd.prd_description) xref_description,
         NVL(pxc.pxc_alt_description, prd.prd_alt_description) xref_alt_description,
         NVL(prd.prd_fmt_solid_inventory_code, prd.prd_fmt_weighted_inv_code) fmt_inventory_code,
         2 priority
  FROM product_xref_codes pxc JOIN
       customers cus ON
         (cus.cus_xrg_code = pxc.pxc_xrg_code) JOIN
       product_formats prf ON
         (prf.prf_prd_code = pxc.pxc_prd_code) JOIN
       products prd ON
         (prd.prd_code = prf.prf_prd_code)
  WHERE pxc.pxc_fmt_code IS NULL
  UNION ALL
  SELECT cus.cus_code,
         prf.prf_prd_code prd_code,
         prf.prf_fmt_code fmt_code,
         pxc.pxc_code xref_code,
         pxc.pxc_xrg_code xref_xrg_code,
         NVL(pxc.pxc_description, prd.prd_description) xref_description,
         NVL(pxc.pxc_alt_description, prd.prd_alt_description) xref_alt_description,
         NVL(prd.prd_fmt_solid_inventory_code, prd.prd_fmt_weighted_inv_code) fmt_inventory_code,
         3 priority
  FROM product_xref_codes pxc JOIN
       quotation_types qty ON
         (qty.qty_xrg_code = pxc.pxc_xrg_code) JOIN
       customers cus ON
         (cus.cus_qty_code = qty.qty_code) JOIN
       product_formats prf ON
         (prf.prf_prd_code = pxc.pxc_prd_code AND
          prf.prf_fmt_code = pxc.pxc_fmt_code) JOIN
       products prd ON
         (prd.prd_code = prf.prf_prd_code)
  UNION ALL
  SELECT cus.cus_code,
         prf.prf_prd_code prd_code,
         prf.prf_fmt_code fmt_code,
         pxc.pxc_code xref_code,
         pxc.pxc_xrg_code xref_xrg_code,
         NVL(pxc.pxc_description, prd.prd_description) xref_description,
         NVL(pxc.pxc_alt_description, prd.prd_alt_description) xref_alt_description,
         NVL(prd.prd_fmt_solid_inventory_code, prd.prd_fmt_weighted_inv_code) fmt_inventory_code,
         4 priority
  FROM product_xref_codes pxc JOIN
       quotation_types qty ON
         (qty.qty_xrg_code = pxc.pxc_xrg_code) JOIN
       customers cus ON
         (cus.cus_qty_code = qty.qty_code) JOIN
       product_formats prf ON
         (prf.prf_prd_code = pxc.pxc_prd_code) JOIN
       products prd ON
         (prd.prd_code = prf.prf_prd_code)
  WHERE pxc.pxc_fmt_code IS NULL
  UNION ALL
  SELECT cus.cus_code,
         prf.prf_prd_code prd_code,
         prf.prf_fmt_code fmt_code,
         qtd.qtd_customer_product_code xref_code,
         CASE WHEN qth.qth_cus_code IS NOT NULL THEN cus.cus_xrg_code
              WHEN qth.qth_qty_code IS NOT NULL THEN qty.qty_xrg_code END xref_xrg_code,
         prd.prd_description xref_description,
         prd.prd_alt_description xref_alt_description,
         NVL(prd.prd_fmt_solid_inventory_code, prd.prd_fmt_weighted_inv_code) fmt_inventory_code,
         CASE WHEN qth.qth_cus_code IS NOT NULL THEN 5
              WHEN qth.qth_qty_code IS NOT NULL THEN 6 END priority
  FROM quotation_headers qth LEFT JOIN
       quotation_types qty ON
         (qty.qty_code = qth.qth_qty_code) JOIN
       quotation_details qtd ON
         (qtd.qtd_qth_id = qth.qth_id) JOIN
       products prd ON
         (prd.prd_code = qtd.qtd_prf_prd_code) JOIN
       product_formats prf ON
         (prf.prf_prd_code = prd.prd_code AND
          prf.prf_fmt_code = CASE WHEN prd.prd_definition IN ('D', 'B') THEN prf.prf_fmt_code ELSE qtd.qtd_prf_fmt_code END) JOIN
       customers cus ON
         (cus.cus_code = qth.qth_cus_code OR
          cus.cus_qty_code = qth.qth_qty_code)
  WHERE qtd.qtd_customer_product_code IS NOT NULL
    AND TRUNC(SYSDATE) BETWEEN qth.qth_start_date AND qth.qth_end_date
)
SELECT cus_code,
       prd_code,
       fmt_code,
       xref_code,
       xref_xrg_code,
       xref_description,
       xref_alt_description,
       ROW_NUMBER() OVER (PARTITION BY cus_code, prd_code, xref_code ORDER BY fmt_inventory_switch DESC) unique_switch
FROM
(
  SELECT xref.cus_code,
         xref.prd_code,
         xref.fmt_code,
         xref.xref_code,
         xref.xref_xrg_code,
         xref.xref_description,
         xref.xref_alt_description,
         CASE WHEN xref.fmt_inventory_code = xref.fmt_code THEN 1 ELSE 0 END fmt_inventory_switch,
         ROW_NUMBER() OVER (PARTITION BY xref.cus_code, xref.prd_code, xref.fmt_code ORDER BY xref.priority ASC) selected
  FROM xref
)
WHERE selected = 1;