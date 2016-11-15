CREATE OR REPLACE PACKAGE phenix.DEP_OPERATION_PACK IS

FUNCTION PRINT_RAP_DEPOSIT_FUNC(
  p_use_code   IN users.use_code%TYPE,
  p_srth_id    IN deposits.dep_srth_id%TYPE
)
RETURN VARCHAR2;

FUNCTION INSERT_DEP_FUNC(
  p_dep_nb_of_100  IN deposits.dep_nb_of_100%TYPE,
  p_dep_nb_of_50   IN deposits.dep_nb_of_50%TYPE,
  p_dep_nb_of_20   IN deposits.dep_nb_of_20%TYPE,
  p_dep_nb_of_10   IN deposits.dep_nb_of_10%TYPE,
  p_dep_nb_of_5    IN deposits.dep_nb_of_5%TYPE,
  p_dep_nb_of_2    IN deposits.dep_nb_of_2 %TYPE,
  p_dep_nb_of_1    IN deposits.dep_nb_of_1%TYPE,
  p_dep_nb_of_025  IN deposits.dep_nb_of_025%TYPE,
  p_dep_nb_of_010  IN deposits.dep_nb_of_010%TYPE,
  p_dep_nb_of_005  IN deposits.dep_nb_of_005%TYPE,
  p_srth_cre_code  IN sales_register_trans_headers.srth_cre_code%TYPE,
  p_srth_use_code  IN sales_register_trans_headers.srth_use_code%TYPE,
  p_srth_whs_code  IN sales_register_trans_headers.srth_whs_code%TYPE,
  p_srth_amount    IN sales_register_trans_headers.srth_amount%TYPE,
  p_srth_date      IN sales_register_trans_headers.srth_date%TYPE,
  p_language       IN VARCHAR2
)
RETURN NUMBER;

END DEP_OPERATION_PACK;
/