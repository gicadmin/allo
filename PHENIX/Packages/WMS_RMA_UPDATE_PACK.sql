CREATE OR REPLACE PACKAGE phenix.WMS_RMA_UPDATE_PACK
IS
--------------------------------------------------------------------------------
FUNCTION set_cah_status_func (
   p_cah_id       IN   customer_adjustment_headers.cah_id%TYPE,
   p_cah_status   IN   customer_adjustment_headers.cah_status%TYPE
         DEFAULT global_vars.reception
  )RETURN PLS_INTEGER;
--------------------------------------------------------------------------------
FUNCTION update_cah_with_rth_func (
   p_cah_id       IN   customer_adjustment_headers.cah_id%TYPE,
   p_rth_id         IN   receipt_transaction_headers.rth_id%TYPE
  )RETURN PLS_INTEGER;
--------------------------------------------------------------------------------
FUNCTION close_cah_func (p_cah_id IN customer_adjustment_headers.cah_id%TYPE)
  RETURN PLS_INTEGER;
--------------------------------------------------------------------------------
FUNCTION get_rtd_original_qty_wght_func (
   p_rtd_rth_id              IN              receipt_transaction_details.rtd_rth_id%TYPE,
   p_rtd_prf_prd_code        IN              receipt_transaction_details.rtd_prf_prd_code%TYPE,
   p_rtd_prf_fmt_code        IN              receipt_transaction_details.rtd_prf_fmt_code%TYPE,
   p_rtd_original_quantity   OUT NOCOPY      receipt_transaction_details.rtd_original_quantity%TYPE,
   p_rtd_original_weight     OUT NOCOPY      receipt_transaction_details.rtd_original_weight%TYPE
  )RETURN PLS_INTEGER;
--------------------------------------------------------------------------------
FUNCTION create_rtd_func (
   p_rtd_rth_id               IN   receipt_transaction_details.rtd_rth_id%TYPE,
   p_rtd_prf_prd_code         IN   receipt_transaction_details.rtd_prf_prd_code%TYPE,
   p_rtd_prf_fmt_code         IN   receipt_transaction_details.rtd_prf_fmt_code%TYPE,
   p_rtd_received_quantity    IN   receipt_transaction_details.rtd_received_quantity%TYPE,
   p_rtd_received_weight      IN   receipt_transaction_details.rtd_received_weight%TYPE,
   p_rtd_use_code             IN   receipt_transaction_details.rtd_use_code%TYPE,
   p_rtd_loc_code             IN   receipt_transaction_details.rtd_loc_code%TYPE,
   p_rtd_start_date           IN   receipt_transaction_details.rtd_start_date%TYPE,
   p_rtd_end_date             IN   receipt_transaction_details.rtd_end_date%TYPE,
   p_rtd_expiry_date          IN   receipt_transaction_details.rtd_expiry_date%TYPE,
   p_rtd_number_of_stickers   IN   receipt_transaction_details.rtd_number_of_stickers%TYPE,
   p_rtd_ide_id               IN   receipt_transaction_details.rtd_ide_id%TYPE  DEFAULT NULL
  )RETURN PLS_INTEGER;
--------------------------------------------------------------------------------
FUNCTION update_cad_func (
   p_rtd_rth_id              IN   receipt_transaction_details.rtd_rth_id%TYPE,
   p_rtd_prf_prd_code        IN   receipt_transaction_details.rtd_prf_prd_code%TYPE,
   p_rtd_prf_fmt_code        IN   receipt_transaction_details.rtd_prf_fmt_code%TYPE,
   p_cad_received_quantity   IN   customer_adjustment_details.cad_adjusted_quantity%TYPE,
   p_cad_received_weight     IN   customer_adjustment_details.cad_adjusted_weight%TYPE
  )RETURN PLS_INTEGER;
--------------------------------------------------------------------------------
END wms_rma_update_pack;
/