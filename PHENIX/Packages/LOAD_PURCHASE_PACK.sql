CREATE OR REPLACE PACKAGE phenix.LOAD_PURCHASE_PACK IS
--procédure principale appellé pour lire le fichier des produits dont il faut insérer des PO
PROCEDURE LOAD_PURCHASE_PROC(
	p_fichier in varchar2,
	p_kilo_fmt_code in varchar2,		--code format qui signifie KILO (un update s'assurera que le poids de ces formats est de 1KG)
	p_update_all_inner_weight in number	default 0	-- 1 pour modifier le inner weight de tous... 0 pour modifier juste les 'B', 'D', fluctué
	);
--sous fonction qui sert exclusivement à l'insertion des lignes de POD
FUNCTION INSERT_POD_FUNC (
	p_prd_code 					in varchar2,
  p_vpd_prf_fmt_code 	in varchar2,
  p_list_cost 				in number,
  p_cost_1_2		 			in number,
  p_cost_3_4 					in number,
  p_average_weight 		in number,
  p_price_per_kilo 		in number,
  p_prd_ven_code 			in number,
  p_prd_definition		in varchar2,
  p_prd_cmd_code			in number,
  p_log_id						in number,
  p_ligne_rendu				in number,
  p_update_all_inner_weight in number,
	p_kilo_fmt_code			in varchar2
  ) return boolean;
--sous fonction qui sert exclusivement à trouver un POH qui convient, ou à en créer un nouveau s'il n'y en a pas
FUNCTION FIND_MATCHING_POH_FUNC(
	p_prd_ven_code 			in 			number,
	p_log_id						in 			number,
	p_ligne_rendu				in 			number,
	p_poh_id 						in out 	number,
	p_pod_line_number 	in out 	number
	) return boolean;
--sous fonction qui loop parmi les POH 'LOAD INITIAL' sans ASN et qui leur créer des ASN
--pour ensuite appellé la fonction qui se chargera de créer les Factures pour ces même POH
FUNCTION LOAD_RCH_RCD_FUNC(
	p_log_id in number
	) return boolean;
--sous fonction qui se charge de créer les Factures pour les ASN qui lui sont envoyé
FUNCTION LOAD_MAH_MAD_FUNC (
	p_rch_ven_code 					in 			number,
	p_rch_number 						in 			varchar2,
	p_rch_source 						in 			varchar2,
	p_log_id 								in 			number,
	p_mah_ap_invoice_number in out 	number
	) return boolean;
--sous fonction qui se charge de recalculer le inner_weight des produits, et les cout moyens
FUNCTION UPDATE_WEIGHT_COST_FUNC(
	p_log_id 					in number,
	p_ligne_rendu 		in number,
	p_prd_code 				in varchar2,
	p_prd_definition 	in varchar2,
	p_fmt_code 				in varchar2,
	p_average_weight 	in number,
	p_list_cost 			in number,
	p_cost_1_2 				in number,
	p_cost_3_4 				in number,
	p_cost_only 			in number,
	p_kilo_fmt_code		in varchar2
	) return boolean;
END LOAD_PURCHASE_PACK;
/