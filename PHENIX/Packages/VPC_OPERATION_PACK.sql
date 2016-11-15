CREATE OR REPLACE PACKAGE phenix.VPC_OPERATION_PACK IS

PROCEDURE FIND_NEXT_CYCLE_PROC(
  p_ven_code        IN NUMBER,      --pour quel fournisseur on veut savoir le prochain cycle
  p_sysdate         IN DATE,        --date pour laquelle on veut savoir quand est la prochaine journée du cycle (si on connait pas les 2 paramètres précédents)
  p_next_day        OUT NUMBER,     --journée prochaine du cycle (trouvé avec les 2 premiers paramètres, ou le 3e)
  p_next_week       OUT NUMBER,     --semaine prochaine du cycle (trouvé avec les 2 premiers paramètres, ou le 3e)
  p_next_cycle_date OUT DATE        --date prochaine du cycle (trouvé avec les 2 premiers paramètres, ou le 3e)
);

END VPC_OPERATION_PACK;
/