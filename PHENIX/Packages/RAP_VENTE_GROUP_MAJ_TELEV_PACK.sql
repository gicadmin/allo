CREATE OR REPLACE PACKAGE phenix.RAP_VENTE_GROUP_MAJ_TELEV_PACK IS

/*
*	 GIMAT		 DATE			 AUTEUR		DESCRIPTION
*	-------	----------	--------	---------------------------------------------------------------------------------------------------------------------
*	BER2459	24-06-2011	Hiba		  Création de la procédure FILL_TEMP_SALES_GROUP_PROC pour remplir une table pour le rapport
*                               RAP_VENTE_GROUPE_MAJEUR_TELEVENDEUR
*
*
*
*/

------------------------------------------------------------------------------------------------------
--Procédure utilisée pour remplir la table temporaire du rapport RAP_VENTE_GROUPE_MAJEUR_TELEVENDEUR
------------------------------------------------------------------------------------------------------

Procedure FILL_TEMP_SALES_GROUP_PROC(
   p_televendeur_client     IN VARCHAR2,
   p_coutant_utilise        IN NUMBER  ,
   p_date_debut             IN DATE    ,
	 p_heure_debut            IN NUMBER  ,
	 p_min_debut              IN NUMBER  ,
	 p_date_fin               IN DATE    ,
	 p_heure_fin              IN NUMBER  ,
	 p_min_fin                IN NUMBER  ,
	 p_du_televendeur         IN NUMBER  ,
   p_au_televendeur         IN NUMBER  ,
   p_du_vendeur             IN NUMBER  ,
   p_au_vendeur             IN NUMBER  ,
   p_code_entrepot          IN VARCHAR2,
	 p_groupe_majeur		      IN NUMBER  ,
	 p_create_log_flat_switch IN NUMBER  ,
	 p_heure_min_debut        OUT VARCHAR2,
	 p_heure_min_fin          OUT VARCHAR2
);

END RAP_VENTE_GROUP_MAJ_TELEV_PACK;
/