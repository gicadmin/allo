CREATE OR REPLACE FORCE VIEW phenix.v_control_lov (v_ctr_code,v_ctr_description,v_ctr_alt_description,v_ctr_explication,v_ctr_alt_explication) AS
SELECT 1  CODE, 'Prix vendant de la maintenance des produits'  										 																													DESCRIPTION,
                'Selling Price from Product Maintenance'													 																													ALT_DESCRIPTION,
                'Affiche le prix vendant régulier du produit format + (surcharge)'																													EXPLICATION,
                'Indicates regular selling price (maintenance product) + (surcharge)'																												ALT_EXPLICATION FROM CONTROL WHERE ROWNUM = 1 UNION
SELECT 2  CODE, 'Prix de liste moyen ajusté'           											 																																DESCRIPTION,
                'Average Adjusted List Cost'                 											 																													ALT_DESCRIPTION,
                'Affiche le prix de liste moyen ajusté '																																										EXPLICATION,
                'Indicates average adjusted list cost'														 																													ALT_EXPLICATION FROM CONTROL WHERE ROWNUM = 1 UNION
SELECT 3  CODE, CTR_COST_1_NAME||' moyen ajusté' 														 																																DESCRIPTION,
                NVL(CTR_ALT_COST_1_NAME,CTR_COST_1_NAME)||' Average Adjusted Cost' 																													ALT_DESCRIPTION,
                'Affiche le coût moyen 1 selon les cases à cocher dans les paramètres système'													 										EXPLICATION,
                'Indicates average adjusted cost 1 depending of system parameters'						 																							ALT_EXPLICATION FROM CONTROL WHERE ROWNUM = 1 UNION
SELECT 4  CODE, CTR_COST_2_NAME||' moyen ajusté' 														 																																DESCRIPTION,
                NVL(CTR_ALT_COST_2_NAME,CTR_COST_2_NAME)||' Average Adjusted Cost' 																													ALT_DESCRIPTION,
                'Affiche le coût moyen 2 selon les cases à cocher dans les paramètres système'													 										EXPLICATION,
                'Indicates average adjusted cost 2 depending of system parameters'						 																							ALT_EXPLICATION FROM CONTROL WHERE ROWNUM = 1 UNION
SELECT 5  CODE, CTR_COST_3_NAME||' moyen ajusté' 														 																																DESCRIPTION,
                NVL(CTR_ALT_COST_3_NAME,CTR_COST_3_NAME)||' Average Adjusted Cost' 																													ALT_DESCRIPTION,
                'Affiche le coût moyen 3 selon les cases à cocher dans les paramètres système'													 										EXPLICATION,
                'Indicates average adjusted cost 3 depending of system parameters'						 																							ALT_EXPLICATION FROM CONTROL WHERE ROWNUM = 1 UNION
SELECT 6  CODE, CTR_COST_4_NAME||' moyen ajusté' 														 																																DESCRIPTION,
                NVL(CTR_ALT_COST_4_NAME,CTR_COST_4_NAME)||' Average Adjusted Cost' 																													ALT_DESCRIPTION,
                'Affiche le coût moyen 4 selon les cases à cocher dans les paramètres système'													 										EXPLICATION,
                'Indicates average adjusted cost 4 depending of system parameters'						 																							ALT_EXPLICATION FROM CONTROL WHERE ROWNUM = 1 UNION
SELECT 7  CODE, 'Coût de liste moyen réel ajusté'               												 																										DESCRIPTION,
                'Average Real Adjusted List Cost'                       										 																								ALT_DESCRIPTION,
                'Affiche le coût de liste moyen réel '																																							 				EXPLICATION,
                'Indicates average real adjusted list cost'						 																																			ALT_EXPLICATION FROM CONTROL WHERE ROWNUM = 1 UNION
SELECT 8  CODE, CTR_COST_1_NAME||' moyen réel ajusté'    															 																											DESCRIPTION,
                NVL(CTR_ALT_COST_1_NAME,CTR_COST_1_NAME)||' Average Real Adjusted Cost' 		 																								ALT_DESCRIPTION,
                'Affiche le coût de liste moyen réel 1 selon les cases à cocher dans les paramètres système'													 			EXPLICATION,
                'Indicates average real adjusted cost 1 depending of system parameters'						 																												ALT_EXPLICATION FROM CONTROL WHERE ROWNUM = 1 UNION
SELECT 9  CODE, CTR_COST_2_NAME||' moyen réel ajusté'    															 																											DESCRIPTION,
                NVL(CTR_ALT_COST_2_NAME,CTR_COST_2_NAME)||' Average Real Adjusted Cost' 		 																													ALT_DESCRIPTION,
                'Affiche le coût de liste moyen réel 2 selon les cases à cocher dans les paramètres système'													 			EXPLICATION,
                'Indicates average real adjusted cost 2 depending of system parameters'						 																												ALT_EXPLICATION FROM CONTROL WHERE ROWNUM = 1 UNION
SELECT 10  CODE, CTR_COST_3_NAME||' moyen réel ajusté'    															 																										DESCRIPTION,
                NVL(CTR_ALT_COST_3_NAME,CTR_COST_3_NAME)||' Average Real Adjusted Cost' 		 																													ALT_DESCRIPTION,
                'Affiche le coût de liste moyen réel 3 selon les cases à cocher dans les paramètres système'													 			EXPLICATION,
                'Indicates average real adjusted cost 3 depending of system parameters'						 																												ALT_EXPLICATION FROM CONTROL WHERE ROWNUM = 1 UNION
SELECT 11  CODE, CTR_COST_4_NAME||' moyen réel ajusté'    															 																										DESCRIPTION,
                NVL(CTR_ALT_COST_4_NAME,CTR_COST_4_NAME)||' Average Real Adjusted Cost' 		 																													ALT_DESCRIPTION,
                'Affiche le coût de liste moyen réel 4 selon les cases à cocher dans les paramètres système'													 			EXPLICATION,
                'Indicates average real adjusted cost 4 depending of system parameters'						 																												ALT_EXPLICATION FROM CONTROL WHERE ROWNUM = 1 UNION
SELECT 12  CODE, 'Coûtant ajusté de la maintenance des produits' 									 																													DESCRIPTION,
                'Adjusted Cost from Product Maintenance' 													 																													ALT_DESCRIPTION,
                'Affiche le coûtant ajusté (prix de liste + ajustement du coût + admin 1 ($) + admin 2 (%) + frais de transport)'		        EXPLICATION,
                'Indicates adjusted cost (list price + cost adjustment + admin 1 ($) + admin 2 (%) + transport cost)'						            ALT_EXPLICATION FROM CONTROL WHERE ROWNUM = 1 UNION
SELECT 13  CODE, 'Dernier prix payé (Client)'        															 																																DESCRIPTION,
                'Last Price Paid (Customer)'                   										 																																ALT_DESCRIPTION,
                'Affiche le prix du dernier achat de ce produit format dans le profil du client'													 												EXPLICATION,
                'Indicates last price paid by the customer in his profile'						 																																			ALT_EXPLICATION FROM CONTROL WHERE ROWNUM = 1 UNION
SELECT 14  CODE, 'Dernière quantité commandée (Client)'       										 																																DESCRIPTION,
                'Last Quantity Ordered (Customer)'             										 																																ALT_DESCRIPTION,
                'Affiche la quantité / poids du dernier achat de ce produit format dans le profil du client'													 						EXPLICATION,
                'Indicates last quantity ordered by the customer in his profile'						 																																ALT_EXPLICATION FROM CONTROL WHERE ROWNUM = 1 UNION
SELECT 15  CODE, 'Prix net du dernier achat reçu'               									 																																DESCRIPTION,
                ' Net Price from Last Purchase received'             											 																																ALT_DESCRIPTION,
                'Affiche le dernier coûtant (maintenance produit) + taxe tabac s''il y a lieu'													 														EXPLICATION,
                'Indicates list price from last purchase (maintenance product) + tobacco tax if exists'						 																				ALT_EXPLICATION FROM CONTROL WHERE ROWNUM = 1 UNION
SELECT 16  CODE, 'Prix de liste courant' 																					 																																DESCRIPTION,
                'Current List Price'                   														 																																ALT_DESCRIPTION,
                'Affiche le prix de liste (maintenance  produit) + taxe tabac s''il y a lieu '													 														EXPLICATION,
                'Indicates current list price (maintenance product) + tobacco tax if exists'						 																										ALT_EXPLICATION FROM CONTROL WHERE ROWNUM = 1 UNION
SELECT 17  CODE, 'Quantité / poids en inventaire'       														 																															DESCRIPTION,
                'Quantity / Weight in Inventory'       															 																															ALT_DESCRIPTION,
                'Affiche la quantité disponible (maintenance  produit) + la quantité sur les quais'													 											EXPLICATION,
                'Indicates quantity or weight in inventory (maintenance product) + quantity on dock'						 																											ALT_EXPLICATION FROM CONTROL WHERE ROWNUM = 1 UNION
SELECT 18  CODE, 'Quantité / poids disponible'         															 																															DESCRIPTION,
                'Quantity / Weight Available'         															 																															ALT_DESCRIPTION,
                'Affiche la quantité disponible (maintenance  produit)'													 																									EXPLICATION,
                'Indicates quantity or weight available (maintenance product)'						 																																		ALT_EXPLICATION FROM CONTROL WHERE ROWNUM = 1 UNION
SELECT 19  CODE, 'Quantité / poids en commande client' 															 																															DESCRIPTION,
                'Quantity / Weight on Customer Order' 															 																															ALT_DESCRIPTION,
                'Affiche la quantité en commande client dont la date de livraison est plus petite ou égale à la date du jour + Nb de jour futur + les quantités en cueillette'		EXPLICATION,
                'Indicates quantity or weight on customer order. Delivery date is : <=sysdate + future number of day + quantity on pick list'			ALT_EXPLICATION FROM CONTROL WHERE ROWNUM = 1 UNION
SELECT 20  CODE, 'Quantité / poids en cueillette' 																	 																															DESCRIPTION,
                'Quantity / Weight on Pick List'       															 																															ALT_DESCRIPTION,
                'Affiche la quantité en cueillette'													 																																			EXPLICATION,
                'Indicates quantity or weight on pick list'						 																																						ALT_EXPLICATION FROM CONTROL WHERE ROWNUM = 1 UNION
SELECT 21  CODE, 'Nom court du manufacturier du produit'         									 																																DESCRIPTION,
                'Manufacturer Short Name'                 												 																																ALT_DESCRIPTION,
                'Affiche le nom court du manufacturier du produit'													 																											EXPLICATION,
                'Indicates manufacturer short name'						 																																										ALT_EXPLICATION FROM CONTROL WHERE ROWNUM = 1 UNION
SELECT 22  CODE, 'Empaquetage'                       															 																																DESCRIPTION,
                'Packing'                         															 																																	ALT_DESCRIPTION,
                'Affiche l''empaquetage du produit format'													 																															EXPLICATION,
                'Indicates packing of product format'						 																																									ALT_EXPLICATION FROM CONTROL WHERE ROWNUM = 1 UNION
SELECT 23  CODE, 'Allocation'                         														 																																DESCRIPTION,
                'Allocation'                         															 																																ALT_DESCRIPTION,
                'Affiche le prix de vente régulier - le prix de vente réel au client'													 																	  EXPLICATION,
                'Indicates regular selling price - real selling price'						 																																ALT_EXPLICATION FROM CONTROL WHERE ROWNUM = 1 UNION
SELECT 24  CODE, 'Quantité / poids disponible - en commande client'									 																															DESCRIPTION,
                'Quantity / Weight Available - on Customer Order'										 																															ALT_DESCRIPTION,
                'Affiche la quantité disponible (maintenance  produit) - la quantité en commande client - la quantité en cueillette'								EXPLICATION,
                'Indicates quantity or weight available (maintenance product) - quantity on customer order - quantity on pick list'								ALT_EXPLICATION FROM CONTROL WHERE ROWNUM = 1 UNION
SELECT 25  CODE, 'Extension'                         															 																																DESCRIPTION,
                'Extension'                         															 																																ALT_DESCRIPTION,
                'Affiche le total de la ligne (Prix * Qté ou Poids)'													 																										EXPLICATION,
                'Indicates total line (price * quantity or weight)'						 																																		ALT_EXPLICATION FROM CONTROL WHERE ROWNUM = 1 UNION
SELECT 26  CODE, 'Multiple d''achat'                 															 																																DESCRIPTION,
                'Purchase Multiple'                 															 																																ALT_DESCRIPTION,
                'Affiche le multiple d''achat de ce produit chez le manufacturier '													 																			EXPLICATION,
                'Indicates the product''s purchase multiple at the manufacturer'						 																											ALT_EXPLICATION FROM CONTROL WHERE ROWNUM = 1 UNION
SELECT 27  CODE, 'Pourcentage de profit'             															 																																DESCRIPTION,
                'Profit Percent'                    															 																																ALT_DESCRIPTION,
                'Selon la méthode du calcul des profits : Achat  X / (1 - %) ou Vente  X * (1 + %)'																								EXPLICATION,
                'Depending of the profit calculation method : Purchases X/ (1-%) or Sales X* (1+%)'						 																    ALT_EXPLICATION FROM CONTROL WHERE ROWNUM = 1 UNION
SELECT 28  CODE, 'Marque déposée'                   															 																																DESCRIPTION,
                'Brand Name'                        															 																																ALT_DESCRIPTION,
                'Affiche la marque déposée ou le nom court du manufacturier '																																			EXPLICATION,
                'Indicates brand name or manufacturer short name'						 																																	  	ALT_EXPLICATION FROM CONTROL WHERE ROWNUM = 1 UNION
SELECT 29  CODE, 'Réapprovisionneur'                       												 																																DESCRIPTION,
                'Replenisher'                             												 																																ALT_DESCRIPTION,
                'Affiche le réapprovisionneur de ce produit chez le manufacturier '													 																			EXPLICATION,
                'Indicates product replenisher for the manufacturer'						 																																	ALT_EXPLICATION FROM CONTROL WHERE ROWNUM = 1 UNION
SELECT 30  CODE, 'Ententes fournisseurs à la vente ($)'     												 																															DESCRIPTION,
                'Vendor Sales Agreements ($)'        															 																																ALT_DESCRIPTION,
                'Affiche le montant de remise de l''entente fournisseur à la vente'							 																									EXPLICATION,
								'Indicates the vendor sales agreement amount' 						 																																				ALT_EXPLICATION FROM CONTROL WHERE ROWNUM = 1 UNION
SELECT 31  CODE, 'Prix minimum ajusté (télévente)'          											 																																DESCRIPTION,
                'Adjusted Minimum Sale Price (Telemarketing)' 										 																																ALT_DESCRIPTION,
								'Affiche le prix minimum de vente selon la borne minimum de profit dans les groupes (calculé selon le coûtant choisi dans les paramètres système)'    EXPLICATION,
                'Indicates adjusted minimum sale price (telem.) according to the minimum profit bound in the groups (calculated with the cost chosen in system parameters)'						 																					ALT_EXPLICATION FROM CONTROL WHERE ROWNUM = 1 UNION
SELECT 32  CODE, 'Prix maximum ajusté (télévente)'          											 																																DESCRIPTION,
                'Adjusted Maximum Sale Price (Telemarketing)'      								 																																ALT_DESCRIPTION,
								'Affiche le prix maximum de vente selon la borne maximum de profit dans les groupes (calculé selon le coûtant choisi dans les paramètres système)'  														EXPLICATION,
                'Indicates adjusted maximum sale price (telem.) according to the maximum profit bound in the groups (calculated with the cost chosen in system parameters)'						 																					ALT_EXPLICATION FROM CONTROL WHERE ROWNUM = 1 UNION
SELECT 33  CODE, 'Profit en dollar ajusté'                 												 																																DESCRIPTION,
                'Adjusted Profit Amount'                     											 																																ALT_DESCRIPTION,
                'Affiche le profit en $ '													 																																								EXPLICATION,
                'Indicates adjusted profit amount ($)'						 																																								ALT_EXPLICATION FROM CONTROL WHERE ROWNUM = 1 UNION
SELECT 34  CODE, 'Pourcentage de profit minimum (télévente)'          						 																																DESCRIPTION,
                'Minimum Profit Percentage (Telemarketing)' 													 																														ALT_DESCRIPTION,
                'Affiche le % de la borne de profit minimum dans les groupes de produits'													 																EXPLICATION,
                'Indicates minimum profit percentage in product group maintenance'						 																										ALT_EXPLICATION FROM CONTROL WHERE ROWNUM = 1 UNION
SELECT 35  CODE, 'Pourcentage de profit maximum (télévente)'          						 																																DESCRIPTION,
                'Maximum Profit Percentage (Telemarketing)'      										 																															ALT_DESCRIPTION,
                'Affiche le % de la borne de profit maximum dans les groupes de produits'													 																EXPLICATION,
                'Indicates maximum profit percentage in product group maintenance'						 																										ALT_EXPLICATION FROM CONTROL WHERE ROWNUM = 1 UNION
SELECT 36  CODE, 'Statut du produit chez le courtier'	 																																														DESCRIPTION,
								 'Broker''s Product Status'					 																																															ALT_DESCRIPTION,
                'Affiche le statut du produit chez le courtier (Actif, Inactif, Commande spéciale)'													 											EXPLICATION,
                'Indicates broker''s product status (Active, Inactive, Special order)'						 																								ALT_EXPLICATION FROM CONTROL WHERE ROWNUM = 1 UNION
SELECT 37  CODE, 'Montant du rabais volume'																				 																																DESCRIPTION,
								 'Volume Rebate Amount'																						 																																ALT_DESCRIPTION,
                'Affiche le montant de remise du rabais volume'													 																													EXPLICATION,
                'Indicates volume rebate amount'						 																																											ALT_EXPLICATION FROM CONTROL WHERE ROWNUM = 1 UNION
SELECT 38  CODE, 'Message à court'																								 																																DESCRIPTION,
								 'Short Message'																									 																																ALT_DESCRIPTION,
                'Affiche le message à court du produit entrepôt (selon l''entrepôt de cueillette de la commande)'											 						EXPLICATION,
                'Indicates short warehouse message for the product (depending of the picking warehouse of the order) '						 								ALT_EXPLICATION FROM CONTROL WHERE ROWNUM = 1 UNION
SELECT 39  CODE, 'Surcharge du format'																						 																																DESCRIPTION,
								 'Format Surcharge'																								 																																ALT_DESCRIPTION,
                'Affiche la surcharge applicable au produit format ou au format'													 																				EXPLICATION,
                'Indicates format surcharge applicable on the product format or the format'						 																						ALT_EXPLICATION FROM CONTROL WHERE ROWNUM = 1 UNION
SELECT 40  CODE, 'Coûtant de remplacement'																				 																																DESCRIPTION,
								 'Replacement Cost'  																							 																																ALT_DESCRIPTION,
                'Affiche le coûtant de remplacement pour le calcul des commissions des télévendeurs'																							EXPLICATION,
                'Indicates replacement cost to calculate the telemarketer commission'						 																									ALT_EXPLICATION FROM CONTROL WHERE ROWNUM = 1 UNION
SELECT 41  CODE, 'Power Colabor'																				 																																          DESCRIPTION,
								 'Power Colabor'  																							 																																  ALT_DESCRIPTION,
                 'Affiche le montant de compteur'																							                                                    EXPLICATION,
                 'Indicates counter amount'						 																		              						                              ALT_EXPLICATION FROM CONTROL WHERE ROWNUM = 1 UNION
SELECT 42  CODE, 'Meilleure promotion du client' 									 																												        	              DESCRIPTION,
                'Best Customer Promotion' 													 																													                    ALT_DESCRIPTION,
                'Affiche le montant de l''allocation de la meilleure promotion du client'		                                                      EXPLICATION,
                'Indicates the allocation amount of the best customer promotion'						                                                      ALT_EXPLICATION FROM CONTROL WHERE ROWNUM = 1 UNION
SELECT 43  CODE, '% de profit selon le coûtant ajusté - promo'             																															          DESCRIPTION,
                'Profit(%) depending of Adjusted Cost - Promo'                    																																ALT_DESCRIPTION,
                'Selon la méthode du calcul des profits : Achat  X / (1 - %) ou Vente  X * (1 + %)'																								EXPLICATION,
                'Depending of the profit calculation method : Purchases X/ (1-%) or Sales X* (1+%)'	                                              ALT_EXPLICATION FROM CONTROL WHERE ROWNUM = 1 UNION
SELECT 44  CODE, 'Coûtant ajusté affecté selon les cases à cocher'             																														DESCRIPTION,
                'Adjusted Cost according checkbox' 													 																													      ALT_DESCRIPTION,
                'Affiche le coût. ajusté (prix de liste + ajustement du coût + admin 1($) + admin 2(%) + frais de trans.) selon les cases à cocher dans les paramètres système'		        EXPLICATION,
                'Indicates adjusted cost (list price + cost adjustment + admin 1 ($) + admin 2 (%) + transport cost) depending of system parameters'				  ALT_EXPLICATION FROM CONTROL WHERE ROWNUM = 1;