CREATE OR REPLACE PACKAGE phenix.PCDS_OPERATION_PACK AS

PROCEDURE UPDATE_PROC(
  p_pcds_id       IN pci_customer_display_sequences.pcds_id%TYPE,
  p_pcds_sequence IN pci_customer_display_sequences.pcds_sequence%TYPE
);

PROCEDURE PURGE_PROC(
  p_pcds_prf_prd_code IN pci_customer_display_sequences.pcds_prf_prd_code%TYPE,
  p_pcds_prf_fmt_code IN pci_customer_display_sequences.pcds_prf_fmt_code%TYPE
);

END PCDS_OPERATION_PACK;
/