CREATE OR REPLACE PACKAGE phenix.CDA_OPERATION_PACK IS

--csc3111 création de la fonction pour trouver l'heure-minute de possession du quai
FUNCTION FIND_POSSESSION_TIME_FUNC(
	p_cus_code            IN  NUMBER,
	p_ven_code            IN  NUMBER,
	p_route_code          IN  NUMBER,   --sert seulement à savoir si le client est une commande comptoir
	p_shipping_dock_code  IN  VARCHAR2,   --doit toujours passé un seul de ces 5 paramètres (aucun nécessaire pour le vendor)
	p_plh_id              IN  NUMBER,   --doit toujours passé un seul de ces 5 paramètres (aucun nécessaire pour le vendor)
	p_osm_id              IN  NUMBER,   --doit toujours passé un seul de ces 5 paramètres (aucun nécessaire pour le vendor)
	p_pmd_id              IN  NUMBER,   --doit toujours passé un seul de ces 5 paramètres (aucun nécessaire pour le vendor)
	p_pmh_id              IN  NUMBER,   --doit toujours passé un seul de ces 5 paramètres (aucun nécessaire pour le vendor)
	p_separateur          IN  VARCHAR2 DEFAULT NULL   --indique le séparateur entre les heures et minutes
)
RETURN VARCHAR2;

--fonction qui vérifie si le client ou le fournisseur est assigné à un quai et le mettre a pret pour le chargement
FUNCTION OPEN_DOCK_FUNC(
  p_cda_id         IN  NUMBER,
  p_language_flag  IN  VARCHAR2,
  p_vocal_switch   IN  NUMBER,
  p_ccr_code       OUT NUMBER,
  p_ccr_message    OUT VARCHAR2
)
RETURN PLS_INTEGER;

--fonction qui ferme un quai d'expédition assigné à un client ou fournisseur
FUNCTION CLOSE_DOCK_FUNC(
  p_cda_id        IN  NUMBER,
  p_language_flag IN  VARCHAR2,
  p_vocal_switch  IN  NUMBER,
  p_ccr_code      OUT NUMBER,
  p_ccr_message   OUT VARCHAR2,
  p_do_commit			IN 	NUMBER DEFAULT 1	--CSC4253, par défaut, on commit, car c'est ce que ca faisait originalement
)
RETURN PLS_INTEGER;

PROCEDURE PURGE_PROC(
  p_cda_ven_code IN customer_dock_assignments.cda_ven_code%TYPE
);

END CDA_OPERATION_PACK;
/