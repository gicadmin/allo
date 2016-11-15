CREATE OR REPLACE PACKAGE phenix.CPW_OPERATION_PACK IS

PROCEDURE CALCUL_ALL_CPW_FOR_CPF_PROC(
	p_cpw_cpf_cus_code          IN customer_profile_weeks.cpw_cpf_cus_code%TYPE,
	p_cpw_cpf_prf_prd_code      IN customer_profile_weeks.cpw_cpf_prf_prd_code%TYPE,
	p_cpw_cpf_prf_fmt_code      IN customer_profile_weeks.cpw_cpf_prf_fmt_code%TYPE,
	p_nb_of_weeks								IN NUMBER,		--doit toujours être rempli...
	p_prd_type									IN VARCHAR2 DEFAULT NULL,		--R pour régulier, S pour saisonnier (si laisser vide, le code cherchera la valeur)
	p_prd_season_start					IN DATE DEFAULT NULL,				--(si laisser vide pour un produit saisonnier, le code cherchera la valeur)
	p_prd_season_end						IN DATE DEFAULT NULL,				--(si laisser vide pour un produit saisonnier, le code cherchera la valeur)
	p_oldest_date 							IN DATE DEFAULT NULL				--(si laisser vide, le code cherchera la valeur)
);

--fonction appeller surtout par les fonctions de purges
--delete des profils clients basé sur la date recu en paramètre (le code produit doit être passé pour détruire des saisonniers)
FUNCTION DELETE_CPW_OLDER_FUNC(
	p_fca_year		IN NUMBER,
	p_fca_period	IN NUMBER,
	p_fcw_week		IN NUMBER,
	p_prd_code		IN VARCHAR2	DEFAULT NULL	--sans code produit, on delete seulement les produits NON SAISONNIER
)
RETURN NUMBER;

--gic3870 création dune nouvelle procédure
--procédure pour trouver les ventes des 4 dernieres semaines d'un profil client en connaissant juste le produit/format/code client
PROCEDURE FIND_CPW_LAST_4_WEEKS_PROC(	--exclue toujours la semaine courante... donc les 4 semaines avant ca
	p_prd_code 						IN VARCHAR2,
	p_fmt_code 						IN VARCHAR2,	--doit être le format commandé (solide pour les B/D)
	p_cus_code 						IN NUMBER,
	p_week_1							OUT NUMBER,
	p_week_2							OUT NUMBER,
	p_week_3							OUT NUMBER,
	p_week_4							OUT NUMBER
);

--gic3870 création dune nouvelle procédure
PROCEDURE FIND_CPW_LAST_4_WEEKS_PROC(	--exclue toujours la semaine courante... donc les 4 semaines avant ca
	p_prd_code 						IN VARCHAR2,
	p_fmt_code 						IN VARCHAR2,	--doit être le format commandé (solide pour les B/D)
	p_cus_code 						IN NUMBER,
	p_season_start				IN DATE,			--NULL pour un produit pas saisonnier
	p_season_end					IN DATE,			--NULL pour un produit pas saisonnier
	p_oldest_date					IN DATE,			--date il y a 4 semaine.... doit être utilisé seulement pour les produits réguliers, car pour les saisonniers, ca varie tjrs selon les dates de saison
	p_current_fcw_week		IN NUMBER,		--doit TOUJOURS etre rempli
	p_current_fca_period	IN NUMBER,		--doit TOUJOURS etre rempli
	p_current_fca_year		IN NUMBER,		--doit TOUJOURS etre rempli
	p_week_1							OUT NUMBER,
	p_week_2							OUT NUMBER,
	p_week_3							OUT NUMBER,
	p_week_4							OUT NUMBER
);

--gic3870 création dune nouvelle procédure
--procédure pour trouver les ventes des X dernieres semaines (max 12) d'un profil client en connaissant juste le produit/format/code client
PROCEDURE FIND_CPW_LAST_12_WEEK_MAX_PROC(	--exclue toujours la semaine courante... donc les semaines avant ca
	p_prd_code 						IN VARCHAR2,
	p_fmt_code 						IN VARCHAR2,	--doit être le format commandé (solide pour les B/D)
	p_cus_code 						IN NUMBER,
	p_nb_of_weeks_wanted	IN NUMBER,		--MAXIMUM de 12
	p_week_1							OUT NUMBER,
	p_week_2							OUT NUMBER,
	p_week_3							OUT NUMBER,
	p_week_4							OUT NUMBER,
	p_week_5							OUT NUMBER,
	p_week_6							OUT NUMBER,
	p_week_7							OUT NUMBER,
	p_week_8							OUT NUMBER,
	p_week_9							OUT NUMBER,
	p_week_10							OUT NUMBER,
	p_week_11							OUT NUMBER,
	p_week_12							OUT NUMBER
);

--gic3870 création dune nouvelle procédure
--pour trouver les vente des dernières X semaines (maximum 12) quand on connait déjà une partie des informations (évite de répéter des calculs inutile, améliore la vitesse)
PROCEDURE FIND_CPW_LAST_12_WEEK_MAX_PROC(	--exclue toujours la semaine courante... donc les semaines avant ca
	p_prd_code 						IN VARCHAR2,
	p_fmt_code 						IN VARCHAR2,	--doit être le format commandé (solide pour les B/D)
	p_cus_code 						IN NUMBER,
	p_season_start				IN DATE,			--NULL pour un produit pas saisonnier
	p_season_end					IN DATE,			--NULL pour un produit pas saisonnier
	p_nb_of_weeks_wanted	IN NUMBER,		--MAXIMUM de 12
	p_oldest_date					IN DATE,			--la date de début d'il y a X semaine...(selon le nb de week wanted) OPTIONNEL, si c'est null, la procédure la rempli, Si c'est rempli, on s'en sert seulement pour les produits réguliers, car pour les saisonniers, ca varie tjrs selon les dates de saison
	p_current_fcw_week		IN NUMBER,		--doit TOUJOURS etre rempli
	p_current_fca_period	IN NUMBER,		--doit TOUJOURS etre rempli
	p_current_fca_year		IN NUMBER,		--doit TOUJOURS etre rempli
	p_week_1							OUT NUMBER,
	p_week_2							OUT NUMBER,
	p_week_3							OUT NUMBER,
	p_week_4							OUT NUMBER,
	p_week_5							OUT NUMBER,
	p_week_6							OUT NUMBER,
	p_week_7							OUT NUMBER,
	p_week_8							OUT NUMBER,
	p_week_9							OUT NUMBER,
	p_week_10							OUT NUMBER,
	p_week_11							OUT NUMBER,
	p_week_12							OUT NUMBER
);

PROCEDURE PURGE_PROC(
  p_cpw_cpf_cus_code     IN customer_profile_weeks.cpw_cpf_cus_code%TYPE,
  p_cpw_cpf_prf_prd_code IN customer_profile_weeks.cpw_cpf_prf_prd_code%TYPE,
  p_cpw_cpf_prf_fmt_code IN customer_profile_weeks.cpw_cpf_prf_fmt_code%TYPE
);

END CPW_OPERATION_PACK;
/