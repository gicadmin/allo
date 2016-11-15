CREATE OR REPLACE PACKAGE phenix.INH_QUEUE_PACK IS

PROCEDURE TREAT_NEW_INH_PROC(
  p_inh_id  IN invoice_headers.inh_id%TYPE
);

PROCEDURE PUT_UPDATED_INH_IN_QUEUE_PROC(
  p_inh_id                      IN invoice_headers.inh_id%TYPE,
  p_cus_code                    IN invoice_headers.inh_cus_code%TYPE,
  p_prd_code                    IN products.prd_code%TYPE,
  p_inh_cash_and_carry_switch   IN invoice_headers.inh_cash_and_carry_switch%TYPE
);

--ancienne procédure TOUCH
PROCEDURE PUT_NEW_INH_IN_QUEUE_PROC(
  p_inh_id  IN invoice_headers.inh_id%TYPE
);

--ancienne procédure RUN
PROCEDURE READ_NEW_INH_IN_QUEUE_PROC;

PROCEDURE RELOAD_ALL_SCD_SCI_INH_PROC(
  p_treated_inh_only_switch IN NUMBER DEFAULT 1  --GCL9340 indique si on veut seulement les factures qui ont déjà passé dans la QUEUE (dont la inh_stats_calculated_Date IS NOT NULL)
);

PROCEDURE SEND_INH_TO_ARCHIVE_PROC(
  p_inh_id  IN invoice_headers.inh_id%TYPE
);

PROCEDURE ARCHIVE_INH_PROC(
    p_jsc_id            IN NUMBER
);

END INH_QUEUE_PACK;
/