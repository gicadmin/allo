CREATE OR REPLACE PACKAGE phenix.EXTRACT_PALLET_PACK IS

PROCEDURE VALIDATION_PALLET_PROC(
  p_jsc_id   IN job_schedules.jsc_id%TYPE
);

PROCEDURE GENERATE_INFO_PROC(
  p_mail          IN OUT MAIL_PACK.T_MAIL_INFORMATION,
  p_whs_code      IN pallet_transaction_balances.ptb_whs_code%TYPE,
  p_solde_deb_fin IN VARCHAR2,
  p_year          IN OUT pallet_transaction_balances.ptb_fca_year%TYPE,
  p_period        IN OUT pallet_transaction_balances.ptb_fca_period%TYPE,
  p_pallet_type   IN pallet_transaction_balances.ptb_pal_code%TYPE,
  p_file_out      IN VARCHAR2,
  p_language      IN job_recipients.jre_lang_code%TYPE DEFAULT 'FR'
 ) ;

PROCEDURE GENERATE_INFO_START_PROC (
  p_mail          IN OUT MAIL_PACK.T_MAIL_INFORMATION,
  p_whs_code      IN pallet_transaction_balances.ptb_whs_code%TYPE,
  p_solde_deb_fin IN VARCHAR2,
  p_year          IN pallet_transaction_balances.ptb_fca_year%TYPE,
  p_period        IN pallet_transaction_balances.ptb_fca_period%TYPE,
  p_pallet_type   IN pallet_transaction_balances.ptb_pal_code%TYPE,
  p_file_out      IN VARCHAR2,
  p_language      IN job_recipients.jre_lang_code%TYPE DEFAULT 'FR'
  ) ;

PROCEDURE GENERATE_INFO_END_PROC (
  p_mail          IN OUT MAIL_PACK.T_MAIL_INFORMATION,
  p_whs_code      IN pallet_transaction_balances.ptb_whs_code%TYPE,
  p_solde_deb_fin IN VARCHAR2,
  p_year          IN pallet_transaction_balances.ptb_fca_year%TYPE,
  p_period        IN pallet_transaction_balances.ptb_fca_period%TYPE,
  p_pallet_type   IN pallet_transaction_balances.ptb_pal_code%TYPE,
  p_file_out      IN VARCHAR2,
  p_language      IN job_recipients.jre_lang_code%TYPE DEFAULT 'FR'
) ;

END EXTRACT_PALLET_PACK;
/