CREATE OR REPLACE FORCE VIEW phenix.v_product_format_avail (pfa_prf_prd_code,pfa_prf_fmt_code,pfa_prd_definition,pfa_whs_code,pfa_real_quantity_available,pfa_real_weight_available) AS
SELECT prd_code pfa_prf_prd_code,
            cur_prf_fmt_code pfa_prf_fmt_code,
            prd_definition pfa_prd_definition,
            pfa_whs_code pfa_whs_code,
            /* REAL */
            ROUND (SUM (pfa_real_quantity_available), 3)
               pfa_real_quantity_available,
            ROUND (SUM (pfa_real_weight_available), 3)
               pfa_real_weight_available
       FROM (SELECT v.prd_code,
                    v.cur_prf_fmt_code,
                    v.prd_definition,
                    v.pfa_whs_code,
                    0 pfa_real_quantity_available,
                    v.pfa_real_weight_available
               FROM v_pfa_BASE_F_L2 V
             UNION ALL
             SELECT v.prd_code,
                    v.cur_prf_fmt_code,
                    v.prd_definition,
                    v.pfa_whs_code,
                    v.pfa_real_quantity_available,
                    v.pfa_real_weight_available
               FROM v_pfa_BASE_SDB_L2 V)
   GROUP BY prd_code,
            cur_prf_fmt_code,
            prd_definition,
            pfa_whs_code;