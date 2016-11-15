CREATE OR REPLACE FORCE VIEW phenix.v_product_formats (prd_code,pgfv_fmt_code,pgf_fmt_code,ppf_fmt_code) AS
select prd_code,
           max(decode(pgfv_rk,1,pgfv_fmt_code,null)) pgfv_fmt_code,
           max(decode(pgf_rk,1,pgf_fmt_code,null)) pgf_fmt_code,
           max(decode(ppf_rk,1,ppf_fmt_code,null)) ppf_fmt_code
      from
    (
    select distinct prf.prf_prd_code prd_code,
           prf.prf_fmt_code pgfv_fmt_code,
           rank() over (partition by prf.prf_prd_code order by FMT.FMT_WEIGHTED_FORMAT_SWITCH, prf.prf_conversion_to_base DESC) pgfv_rk,
           null pgf_fmt_code,
           null pgf_rk,
           null ppf_fmt_code,
           null ppf_rk
      from product_formats prf join
           formats fmt on
            (fmt.fmt_code = prf.prf_fmt_code)
    where prf.prf_operation_flag = 'M'
       and PRF.PRF_SELLABLE_FORMAT_SWITCH = 1
    union
    select distinct prf.prf_prd_code,
           null,
           null,
           prf.prf_fmt_code pgf_fmt_code,
           rank() over (partition by prf.prf_prd_code order by FMT.FMT_WEIGHTED_FORMAT_SWITCH, prf.prf_conversion_to_base DESC) pgf_rk,
           prf.prf_fmt_code ppf_fmt_code,
           rank() over (partition by prf.prf_prd_code order by FMT.FMT_WEIGHTED_FORMAT_SWITCH, prf.prf_conversion_to_base) ppf_rk
      from product_formats prf join
           formats fmt on
            (fmt.fmt_code = prf.prf_fmt_code)
    where prf.prf_operation_flag = 'M'
    ) prod
  group by prod.prd_code;