CREATE OR REPLACE PACKAGE phenix.RAP_DES_GAINS_SUR_INVENT_PACK IS
/*
*	 GIMAT		 DATE			 AUTEUR		DESCRIPTION
*	-------	----------	--------	---------------------------------------------------------------------------------------------------------------------
*	CSC6360	15-02-2012	Mawuko		Création du package pour remplir la table temporaire temporary_gain_inventaire
*                               pour le rapport RAP_DES_GAINS_SUR_INVENTAIRES
* CSC7236  11-02-2013 Mawuko     Ajouter un paraméetre p_type_utilisateur (Négociateur N ou Réaprovisionnneur R)
*                               Remplacer les paramètres  P_DE_ACHETEUR  et P_A_ACHETEUR par P_DE_UTILISATEUR et P_A_UTILISATEUR
*
*
*
*/
PROCEDURE rap_des_gains_sur_invent_proc (
 p_type_utilisateur    IN VARCHAR2,
 p_de_utilisateur      IN NUMBER,
 p_a_utilisateur       IN NUMBER
);
END RAP_DES_GAINS_SUR_INVENT_PACK;
/