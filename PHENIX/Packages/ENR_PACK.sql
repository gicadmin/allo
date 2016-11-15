CREATE OR REPLACE PACKAGE phenix.ENR_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  edi_ni_rejects%ROWTYPE);


PROCEDURE INSERT_PROC(
  p_enr_session_id            IN         edi_ni_rejects.enr_session_id%TYPE                 DEFAULT NULL,
  p_enr_cus_code              IN         edi_ni_rejects.enr_cus_code%TYPE                   DEFAULT NULL,
  p_enr_order_date            IN         edi_ni_rejects.enr_order_date%TYPE                 DEFAULT NULL,
  p_enr_reference_number      IN         edi_ni_rejects.enr_reference_number%TYPE           DEFAULT NULL,
  p_enr_seller_prd_ref_number IN         edi_ni_rejects.enr_seller_prd_ref_number%TYPE      DEFAULT NULL,
  p_enr_upc_code              IN         edi_ni_rejects.enr_upc_code%TYPE                   DEFAULT NULL,
  p_enr_invoiced_quantity     IN         edi_ni_rejects.enr_invoiced_quantity%TYPE          DEFAULT NULL,
  p_enr_customer_order_number IN         edi_ni_rejects.enr_customer_order_number%TYPE      DEFAULT NULL,
  p_enr_ccr_code              IN         edi_ni_rejects.enr_ccr_code%TYPE                   DEFAULT NULL,
  p_enr_store_num             IN         edi_ni_rejects.enr_store_num%TYPE                  DEFAULT NULL,
  p_enr_partner_id            IN         edi_ni_rejects.enr_partner_id%TYPE                 DEFAULT NULL,
  p_enr_error_message         IN         edi_ni_rejects.enr_error_message%TYPE              DEFAULT NULL,
  p_enr_line_number           IN         edi_ni_rejects.enr_line_number%TYPE                DEFAULT NULL,
  p_enr_creation_date         IN         edi_ni_rejects.enr_creation_date%TYPE              DEFAULT SYSDATE );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY edi_ni_rejects%ROWTYPE);

END ENR_PACK;
/