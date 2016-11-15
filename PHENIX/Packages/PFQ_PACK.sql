CREATE OR REPLACE PACKAGE phenix.PFQ_PACK IS

PROCEDURE RELOAD_PROC;

PROCEDURE CUSTOMER_ORDER_PROC(
  p_whs_code                   IN product_format_qty_timeline.pfq_whs_code%TYPE,
  p_prf_prd_code               IN product_format_qty_timeline.pfq_prf_prd_code%TYPE,
  p_prf_fmt_code               IN product_format_qty_timeline.pfq_prf_fmt_code%TYPE,
  p_date                       IN product_format_qty_timeline.pfq_date%TYPE,
  p_quantity                   IN product_format_qty_timeline.pfq_quantity%TYPE,
  p_weight                     IN product_format_qty_timeline.pfq_weight%TYPE,
  p_sales_type                 IN product_format_qty_timeline.pfq_sales_type%TYPE
);

PROCEDURE CUSTOMER_ORDER_PROC(
  p_whs_code                   IN product_format_qty_timeline.pfq_whs_code%TYPE,
  p_prf_prd_code               IN product_format_qty_timeline.pfq_prf_prd_code%TYPE,
  p_prf_fmt_code               IN product_format_qty_timeline.pfq_prf_fmt_code%TYPE,
  p_quantity                   IN product_format_qty_timeline.pfq_quantity%TYPE,
  p_weight                     IN product_format_qty_timeline.pfq_weight%TYPE,
  p_sales_type                 IN product_format_qty_timeline.pfq_sales_type%TYPE
);

PROCEDURE PURCHASE_ORDER_PROC(
  p_whs_code                   IN product_format_qty_timeline.pfq_whs_code%TYPE,
  p_prf_prd_code               IN product_format_qty_timeline.pfq_prf_prd_code%TYPE,
  p_prf_fmt_code               IN product_format_qty_timeline.pfq_prf_fmt_code%TYPE,
  p_date                       IN product_format_qty_timeline.pfq_date%TYPE,
  p_quantity                   IN product_format_qty_timeline.pfq_quantity%TYPE,
  p_weight                     IN product_format_qty_timeline.pfq_weight%TYPE
);

PROCEDURE TRANSFER_PROC(
  p_whs_code                   IN product_format_qty_timeline.pfq_whs_code%TYPE,
  p_prf_prd_code               IN product_format_qty_timeline.pfq_prf_prd_code%TYPE,
  p_prf_fmt_code               IN product_format_qty_timeline.pfq_prf_fmt_code%TYPE,
  p_date                       IN product_format_qty_timeline.pfq_date%TYPE,
  p_quantity                   IN product_format_qty_timeline.pfq_quantity%TYPE,
  p_weight                     IN product_format_qty_timeline.pfq_weight%TYPE,
  p_sales_type                 IN product_format_qty_timeline.pfq_sales_type%TYPE
);

PROCEDURE GET_PROJECTION_PROC(
  p_whs_code                   IN product_format_qty_timeline.pfq_whs_code%TYPE,
  p_prf_prd_code               IN product_format_qty_timeline.pfq_prf_prd_code%TYPE,
  p_prf_fmt_code               IN product_format_qty_timeline.pfq_prf_fmt_code%TYPE,
  p_order_date                 IN product_format_qty_timeline.pfq_date%TYPE,
  p_ven_cycle_date             IN product_format_qty_timeline.pfq_date%TYPE,
  p_quantity                   IN OUT product_format_qty_timeline.pfq_quantity%TYPE,
  p_weight                     IN OUT product_format_qty_timeline.pfq_weight%TYPE,
  p_sales_type                 IN product_format_qty_timeline.pfq_sales_type%TYPE
);

END PFQ_PACK;
/