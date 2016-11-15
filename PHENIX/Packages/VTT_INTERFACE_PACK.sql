CREATE OR REPLACE PACKAGE phenix.VTT_INTERFACE_PACK IS
FUNCTION EXISTS_TRANSP_REF_CUS_FUNC(
  p_ven_code                  IN  transporter_ref_customers.tec_ven_code%TYPE,
  p_cus_transporter_code      IN  transporter_ref_customers.tec_cus_transporter_code%TYPE,
  p_cus_code                  IN  transporter_ref_customers.tec_cus_code%TYPE,
  p_tec_transporter_reference IN  transporter_ref_customers.tec_transporter_reference%TYPE

)RETURN BOOLEAN;

--procédure utilisé pour transféré une transaction de transport de la table temporaire vers les vrais tables du système
PROCEDURE TRANSFERT_VTT_PROC(
	p_vat_id 	IN NUMBER,
  p_path    IN VARCHAR2, --BER3604,
  p_source                      IN VARCHAR2,--BER6537
  p_form_modif_exception_switch IN BOOLEAN,
  p_correct_values              IN BOOLEAN,
  p_log_id	IN NUMBER DEFAULT NULL
);

PROCEDURE CALL_TRANSFERT_PROC(
	p_path       IN VARCHAR2,
  p_log_id     IN NUMBER DEFAULT NULL
);
--lecture d un fichier de transaction de transport et insertion des records dans la table qui recueille temporarirement les données
FUNCTION READ_TRANSP_TRANS_FUNC(
	p_file_in 		      IN UTL_FILE.FILE_TYPE,
  p_nom_fichier       IN VARCHAR2,
	p_log_id 		        IN NUMBER,
	p_loop_file		      IN NUMBER,
	p_path_and_name	    IN VARCHAR2,
	p_bckpath_and_name	IN VARCHAR2
)
RETURN BOOLEAN;


PROCEDURE FIND_ERRORS_BY_ID_PROC (
    p_vat_id                         IN         validate_transp_transactions.vat_id%TYPE,
    p_source                         IN VARCHAR2,
    p_vat_vtt_delivery_date          IN OUT     validate_transp_transactions.vat_vtt_delivery_date%TYPE,
    p_vat_vtt_id_existant            IN OUT     validate_transp_transactions.vat_vtt_id_existant%TYPE,--BER3604
    p_vat_vtt_cus_code               IN OUT     validate_transp_transactions.vat_vtt_cus_code%TYPE,
    p_vat_vtt_ven_code               IN OUT     validate_transp_transactions.vat_vtt_ven_code%TYPE,
    p_vat_vtt_billed_cus_code        IN OUT     validate_transp_transactions.vat_vtt_billed_cus_code%TYPE,
    p_vat_transporter_ref_cus        IN OUT     validate_transp_transactions.vat_transporter_ref_cus%TYPE,
    p_vat_vtt_doc_id                 IN OUT     validate_transp_transactions.vat_vtt_doc_id%TYPE,
    p_vat_pass                       IN OUT     validate_transp_transactions.vat_pass%TYPE,
    p_vat_vtt_number_of_pallets      IN OUT     validate_transp_transactions.vat_vtt_number_of_pallets%TYPE,
    p_vat_vtt_number_of_packages     IN OUT     validate_transp_transactions.vat_vtt_number_of_packages%TYPE,
    p_vat_vtt_value                  IN OUT     validate_transp_transactions.vat_vtt_value%TYPE,
    p_vat_vtt_vtr_id                 IN OUT     validate_transp_transactions.vat_vtt_vtr_id%TYPE,
    p_vat_vtt_reference_number       IN OUT     validate_transp_transactions.vat_vtt_reference_number%TYPE,
    p_vat_vtt_vtr_invoicing_method   IN OUT     validate_transp_transactions.vat_vtt_vtr_invoicing_method%TYPE,
    p_vat_vtt_whs_code               IN OUT     validate_transp_transactions.vat_vtt_whs_code%TYPE,
    p_vat_vtt_vts_code               IN OUT     validate_transp_transactions.vat_vtt_vts_code%TYPE,
    p_vat_vtt_weight                 IN OUT     validate_transp_transactions.vat_vtt_weight%TYPE,
    p_vat_vtt_weight_uom             IN OUT     validate_transp_transactions.vat_vtt_weight_uom%TYPE,
    p_vat_vtt_rou_code               IN OUT     validate_transp_transactions.vat_vtt_rou_code%TYPE,
    p_vat_vtt_position               IN OUT     validate_transp_transactions.vat_vtt_position%TYPE,
    p_vat_tdh_route_trk_code         IN OUT     validate_transp_transactions.vat_tdh_route_trk_code%TYPE,
    p_vat_tdh_route_loc_dock_code    IN OUT     validate_transp_transactions.vat_tdh_route_loc_dock_code%TYPE,
    p_vat_tdh_use_code               IN OUT     validate_transp_transactions.vat_tdh_use_code%TYPE,
    p_vat_tdh_use_aide_code          IN OUT     validate_transp_transactions.vat_tdh_use_aide_code%TYPE,
    p_vat_vtt_exception_switch       IN OUT     validate_transp_transactions.vat_vtt_exception_switch%TYPE,
    p_vat_vtt_stamp_switch           IN OUT     validate_transp_transactions.vat_vtt_stamp_switch%TYPE,
    p_vat_vtt_signed_switch          IN OUT     validate_transp_transactions.vat_vtt_signed_switch%TYPE,
    p_vat_vtt_volume                 IN OUT     validate_transp_transactions.vat_vtt_volume%TYPE,
    p_vat_ccr_code                   IN OUT     validate_transp_transactions.vat_ccr_code%TYPE
    );
PROCEDURE EXTRACT_TRANSPORT_PROC (
p_jsc_id IN NUMBER
);
END VTT_INTERFACE_PACK;
/