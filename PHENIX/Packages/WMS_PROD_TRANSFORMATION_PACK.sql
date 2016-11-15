CREATE OR REPLACE PACKAGE phenix.WMS_PROD_TRANSFORMATION_PACK AS

FUNCTION TRANSFORM_PRODUCT_FUNC(
  p_use_code          IN  NUMBER,
  p_src_prd_code      IN  VARCHAR2,
  p_src_fmt_code      IN  VARCHAR2,
  p_src_qty           IN  NUMBER,
  p_src_wgt           IN  NUMBER,
  p_dest_prd_code     IN  VARCHAR2,
  p_dest_fmt_code     IN  VARCHAR2,
  p_dest_qty          IN  NUMBER,
  p_dest_wgt          IN  NUMBER,
  p_dest_loc_code     IN  VARCHAR2
) RETURN PLS_INTEGER;

END WMS_PROD_TRANSFORMATION_PACK;
/