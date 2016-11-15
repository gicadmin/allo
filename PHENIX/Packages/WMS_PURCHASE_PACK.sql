CREATE OR REPLACE PACKAGE phenix.WMS_PURCHASE_PACK IS

FUNCTION CREATE_PURCH_FUNC(
  p_rth_id                    IN	NUMBER,
  p_ven_code                  IN	NUMBER,
  p_prd_code                  IN	VARCHAR2,
  p_rcd_received_quantity     IN	NUMBER,
  p_rcd_received_weight       IN	NUMBER,
  p_use_code                  IN	NUMBER,
  p_inv_loc_code              IN	VARCHAR2,
  p_rtd_start_date            IN	DATE,
  p_rtd_end_date              IN	DATE,
  p_inv_fifo_or_expiry_date   IN	DATE,
  p_rtd_number_of_stickers    IN	NUMBER,
  p_rtd_ide_id                IN    NUMBER,
  p_rtd_dmr_code              IN	NUMBER DEFAULT NULL,
  p_ide_destination_loc_code  IN	VARCHAR2,
  p_poh_id                    OUT   NUMBER
)
RETURN PLS_INTEGER;

END WMS_PURCHASE_PACK;
/