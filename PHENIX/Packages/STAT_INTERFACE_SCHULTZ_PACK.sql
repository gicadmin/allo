CREATE OR REPLACE PACKAGE phenix.STAT_INTERFACE_SCHULTZ_PACK IS

PROCEDURE PRG_SHULTZ_EXTRACT_PROC(
	p_jsc_id IN NUMBER
);

PROCEDURE PRG_SHULTZ_ORDERS_PROC(
	p_from_date 	IN DATE,
	p_to_date 		IN DATE,
 	p_whs_code		IN VARCHAR2  --BER3573
);

FUNCTION GET_LINE_FUNC(
  p_poh_ven_purchase_code   IN NUMBER,
  p_inh_ven_code	          IN NUMBER,
  p_inh_type                IN VARCHAR2,
  p_vbd_prf_prd_code        IN VARCHAR2,
  p_vpd_code                IN VARCHAR2,
  p_prd_description         IN VARCHAR2,
  p_brn_description         IN VARCHAR2,
  p_prf_upc_code            IN VARCHAR2,
  p_prf_description         IN VARCHAR2,
  p_prd_definition_type     IN NUMBER,
  p_pdi_percent             IN NUMBER,
  p_pdi_amount              IN NUMBER,
  p_vbd_pod_poh_id          IN NUMBER,
  p_vbd_pod_line_number     IN NUMBER,
  p_vbd_dit_code            IN NUMBER,
  p_pdi_qualifier           IN VARCHAR2,
  p_pod_pty_code            IN NUMBER,
  p_vbd_billed_quantity	    IN NUMBER,
  p_vbd_billed_weight	      IN NUMBER,
  p_vbd_billed_retail	      IN NUMBER,
  p_extension               IN NUMBER,
  p_vbd_inh_id              IN NUMBER,
  p_inh_invoice_date        IN DATE,
  p_pod_mad_mah_ap_invoice  IN NUMBER,
  p_vbd_from_date           IN DATE,
	p_vbd_to_date             IN DATE
)
RETURN VARCHAR2;

PROCEDURE PRG_SHULTZ_CHARGES_PROC(
 p_from_date 	IN DATE,
 p_to_date 		IN DATE,
 p_whs_code		IN VARCHAR2  --BER3573
);

END STAT_INTERFACE_SCHULTZ_PACK;
/