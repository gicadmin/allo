CREATE OR REPLACE PACKAGE phenix.STAT_GREENBRIDGE_PACK IS

--procédure pour créer les statistiques à envoyer à tous les X jours/semaines etc...
PROCEDURE GEN_GREENBRIDGE_STATS_PROC(
  p_jsc_id IN job_schedules.jsc_id%TYPE
);

--génération du fichier des transactions des clients du groupe
--Volontairement (à la demande du client), on rempli le moins d'infos possible, tous les champs optionnel restent vides
PROCEDURE GEN_TRANSACTION_FILE_PROC(
  p_de_date IN DATE,
  p_a_date  IN DATE
) ;

--génération du fichier des clients du groupe (inclus dans les transactions)
--Volontairement (à la demande du client), on rempli le moins d'infos possible, tous les champs optionnel restent vides
PROCEDURE GEN_CUSTOMER_FILE_PROC(
  p_de_date IN DATE,
  p_a_date  IN DATE,
  p_affiche_vendeur  IN VARCHAR2 --mtp555
);

--génération du fichier des produits du groupe (inclus dans les transactions)
--Volontairement (à la demande du client), on rempli le moins d'infos possible, tous les champs optionnel restent vides
PROCEDURE GEN_PRODUCT_FILE_PROC(
  p_de_date IN DATE,
  p_a_date  IN DATE
);

--génération des 3 fichiers INITIAUX
PROCEDURE GEN_GLOBAL_FILE_PROC(
  p_jsc_id IN job_schedules.jsc_id%TYPE
);

--génération du fichier INITIAL contenant tous les clients
--Volontairement (à la demande du client), on rempli le moins d'infos possible, tous les champs optionnel restent vides
PROCEDURE GLOBAL_CUSTOMER_FILE_PROC(
  p_affiche_vendeur  IN VARCHAR2 --mtp555
);

--génération du fichier INITIAL contenant tous les produits
--Volontairement (à la demande du client), on rempli le moins d'infos possible, tous les champs optionnel restent vides
PROCEDURE GLOBAL_PRODUCT_FILE_PROC;

--génération du fichier INITIAL contenant les infos du distributeur
--Volontairement (à la demande du client), on rempli le moins d'infos possible, tous les champs optionnel restent vides
PROCEDURE GLOBAL_DISTRIBUTOR_FILE_PROC;

END STAT_GREENBRIDGE_PACK;
/