CREATE OR REPLACE PACKAGE phenix.SCD_PACK IS

PROCEDURE TREAT_CDS_PROC(
  p_inh_id  IN invoice_headers.inh_id%TYPE
);

--GIC3627 procédure servant à reloader toutes les factures de la table SCI
--cette procédure peut seulement être exécuté directement dans SQL
--On doit arrêter la job READ_NEW_INH_IN_QUEUE_PROC et aucune facture ne doit se crééer en même temps que la job reload (donc, arrêter CUSTOMER_INVOICE etc.)
PROCEDURE RELOAD_ALL_SCD_INH_PROC(
  p_treated_inh_only_switch IN NUMBER DEFAULT 1,  --indique si on veut seulement les factures qui ont déjà passé dans la QUEUE (dont la inh_stats_calculated_Date IS NOT NULL)
	p_log_id                  IN NUMBER DEFAULT NULL
);

END SCD_PACK;
/