CREATE OR REPLACE PACKAGE phenix.RAP_VENTE_PROFIT_VENDEUR_PACK IS

----fre2782 procédure utilisé pour le rapport : rap_ventes_profit_vendeur
----BER2579 Déplacer du package REPORT_PACK à ce package
PROCEDURE RAP_VENTE_PROFIT_VENDEUR_PROC(
  p_de_date 			        IN DATE,
  p_a_date 				        IN DATE,
  p_du_client 			      IN NUMBER,
  p_au_client 			      IN NUMBER,
  p_du_vendeur 			      IN NUMBER,
  p_au_vendeur 			      IN NUMBER,
  p_de_date_passee		    IN DATE,
  p_a_date_passee         IN DATE,
  p_date_period_1         IN DATE,
  p_date_period_1_passee  IN DATE,
  p_vendeur_ou_televend   IN VARCHAR2,
  p_code_entrepot		      IN VARCHAR2 DEFAULT NULL,
  p_du_televendeur 		    IN NUMBER   DEFAULT NULL,
  p_au_televendeur 		    IN NUMBER   DEFAULT NULL,
  p_toutes_semaines       IN VARCHAR2 DEFAULT 'NON',  --FRE3165
  p_coutant               IN NUMBER   DEFAULT NULL,   --BER2579
  p_language              IN VARCHAR2 DEFAULT 'FR',                --ARM394
  p_de_groupe_client      IN NUMBER   DEFAULT NULL,                --ARM625
  p_a_groupe_client       IN NUMBER   DEFAULT NULL
  );

-- BER2839
-- Rapport de vente profit vendeur / télévendeur par semaine
PROCEDURE RAP_VENTE_PROFIT_SEMAINE_PROC(
  p_de_date 			        IN DATE,
  p_a_date 				        IN DATE,
  p_du_client 			      IN NUMBER,
  p_au_client 			      IN NUMBER,
  p_du_vendeur 			      IN NUMBER,
  p_au_vendeur 			      IN NUMBER,
  p_de_date_passee		    IN DATE,
  p_a_date_passee         IN DATE,
  p_date_period_1         IN DATE,
  p_date_period_1_passee  IN DATE,
  p_vendeur_ou_televend   IN VARCHAR2,
  p_code_entrepot		      IN VARCHAR2 DEFAULT NULL,
  p_du_televendeur 		    IN NUMBER   DEFAULT NULL,
  p_au_televendeur 		    IN NUMBER   DEFAULT NULL,
  p_coutant               IN NUMBER   DEFAULT NULL,    --BER2579
  p_language              IN VARCHAR2 DEFAULT 'FR',                --ARM394
  p_de_groupe_client      IN NUMBER   DEFAULT NULL,                --ARM625
  p_a_groupe_client       IN NUMBER   DEFAULT NULL
);

-- BER2839
-- Rapport de vente profit vendeur / télévendeur sans semaine
PROCEDURE RAP_VENTE_PROFIT_PROC(
  p_de_date 			        IN DATE,
  p_a_date 				        IN DATE,
  p_du_client 			      IN NUMBER,
  p_au_client 			      IN NUMBER,
  p_du_vendeur 			      IN NUMBER,
  p_au_vendeur 			      IN NUMBER,
  p_de_date_passee		    IN DATE,
  p_a_date_passee         IN DATE,
  p_date_period_1         IN DATE,
  p_date_period_1_passee  IN DATE,
  p_vendeur_ou_televend   IN VARCHAR2,
  p_code_entrepot		      IN VARCHAR2 DEFAULT NULL,
  p_du_televendeur 		    IN NUMBER   DEFAULT NULL,
  p_au_televendeur 		    IN NUMBER   DEFAULT NULL,
  p_coutant               IN NUMBER   DEFAULT NULL,    --BER2579
  p_language              IN VARCHAR2 DEFAULT 'FR',                --ARM394
  p_de_groupe_client      IN NUMBER   DEFAULT NULL,                --ARM625
  p_a_groupe_client       IN NUMBER   DEFAULT NULL
);

END RAP_VENTE_PROFIT_VENDEUR_PACK;
/