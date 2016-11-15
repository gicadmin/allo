CREATE OR REPLACE PACKAGE phenix.VBH_OPERATION_PACK IS

PROCEDURE PURGE_PROC(
  p_vbh_id  IN vendor_billing_headers.vbh_id%TYPE
);

-- Procedure de purge d'un header. Cette procédure détruira les VBD/VBHs relies
-- mais SEULEMENT si TOUS les VBDs enfants du VBH n'ont pas de INH attaches.
PROCEDURE PURGE_PROC(
  p_nb_days_to_keep               IN  NUMBER,
  p_max_items                     IN  NUMBER
);

--GCL8845 fonction d'insertion similaire aux fonction de base, mais qui peut accepter un ID déjà donné.. et qui peut copier ce ID dans le original_vbh (quil soit déjà en paramètre ou pas)
FUNCTION INSERT_FUNC(
  p_rec           IN OUT NOCOPY vendor_billing_headers%ROWTYPE
)
RETURN NUMBER;

FUNCTION DUPLICATE_VBH_FUNC (
	p_vbd_vbh_id 	                	IN vendor_billing_details.vbd_vbh_id%TYPE,
  p_vbh_status	                  IN vendor_billing_headers.vbh_status%TYPE,
  p_vbh_invoice_matching_switch 	IN vendor_billing_headers.vbh_invoice_matching_switch%TYPE DEFAULT 0
)
RETURN NUMBER;

PROCEDURE GET_INFO_PROC(
 p_vbh_id                       IN  vendor_billing_headers.vbh_id%TYPE,
 p_vbh_ven_purchase_code        OUT vendor_billing_headers.vbh_ven_purchase_code%TYPE,
 p_vbh_ven_payable_code         OUT vendor_billing_headers.vbh_ven_payable_code%TYPE,
 p_vbh_order_date               OUT vendor_billing_headers.vbh_order_date%TYPE,
 p_vbh_invoice_matching_switch  OUT vendor_billing_headers.vbh_invoice_matching_switch%TYPE,
 p_vbh_rma                      OUT vendor_billing_headers.vbh_rma%TYPE,
 p_vbh_message                  OUT vendor_billing_headers.vbh_message%TYPE,
 p_vbh_original_vbh_id          OUT vendor_billing_headers.vbh_original_vbh_id%TYPE
);


END VBH_OPERATION_PACK;
/