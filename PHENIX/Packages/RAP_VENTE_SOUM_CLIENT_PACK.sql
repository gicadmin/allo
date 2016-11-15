CREATE OR REPLACE PACKAGE phenix.RAP_VENTE_SOUM_CLIENT_PACK IS

------------------------------------------------------------------------------------------------------
--Procédure utilisée pour remplir la table temporaire du rapport RAP_VENTE_SOUMISSION_CLIENT
------------------------------------------------------------------------------------------------------

Procedure FILL_TEMP_QUOTATION_SALES_PROC(
   p_date_debut             IN DATE    ,
   p_date_fin               IN DATE    ,
   p_du_vendeur             IN NUMBER  ,
   p_au_vendeur             IN NUMBER  ,
   p_du_client              IN NUMBER  ,
   p_au_client              IN NUMBER  ,
   p_du_type                IN NUMBER  ,
   p_au_type                IN NUMBER  ,
   p_vendant_choisi         IN VARCHAR2,
   p_choix_selection        IN VARCHAR2,
   p_products               IN VARCHAR2,   --FRE3672
   p_language_rapport       IN VARCHAR2    --FRE3672
) ;
END RAP_VENTE_SOUM_CLIENT_PACK;
/