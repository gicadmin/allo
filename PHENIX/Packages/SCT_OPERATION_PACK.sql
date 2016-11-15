CREATE OR REPLACE PACKAGE phenix.SCT_OPERATION_PACK IS

PROCEDURE TREAT_VTT_PROC(
  p_inh_id    IN invoice_headers.inh_id%TYPE
);

PROCEDURE TREAT_VCR_PROC(
  p_inh_id    IN invoice_headers.inh_id%TYPE
);

PROCEDURE RELOAD_ALL_SCT_INH_PROC(
  p_treated_inh_only_switch IN NUMBER DEFAULT 1,  --indique si on veut seulement les factures qui ont dÃ©jÃ  passÃ© dans la QUEUE (dont la inh_stats_calculated_Date IS NOT NULL)
  p_log_id                  IN NUMBER DEFAULT NULL
);

PROCEDURE PURGE_PROC(
  p_nb_days_to_keep IN NUMBER,
  p_max_items       IN NUMBER
);

END SCT_OPERATION_PACK;
/