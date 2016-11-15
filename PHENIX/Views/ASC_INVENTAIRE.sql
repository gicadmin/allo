CREATE OR REPLACE FORCE VIEW phenix.asc_inventaire (localisation,produit,"FORMAT",description_du_produit,marque_manuf,empaquetage,type_de_localisation,decription_du_type_de_loc,en_inventaire_quantite,en_inventaire_poids,disponible_quantite,disponible_poids,cueillette_quantite,cueillette_poids,en_retenue_quantite,en_retenue_poids,entrante_quantite,entrant_poids,sortant_quantite,sortant_poids,minimum_quantite,maximum_quantite,minimum_poids,maximum_poids,deplacement_quantite_entree,deplacement_quantite_sortie,deplace_poids_sorti,date_reception,date_cueillette,dae_entree,date_sortie,date_expiration,date_decompte,code_entrepot,nom_entrepot,zone_entrepot,zone_entrepot_description,largeur,hauteur,profondeur,quai_de_reception_o_n,quai_expedition_o_n,inventire_infini_o_n,inventaire_endommage_o_n,inventaire_en_reserve_o_n,loc_payer_et_emporter_o_n,loc_pour_en_transit_o_n,loc_produit_unique_o_n,loc_commande_speciale_o_n,loc_exclus_des_decomptes_o_n,loc_de_cueillette_o_n,loc_dediee_o_n,rotation_vie,rotation_reception,rotation_alerte,rotation_entreposage) AS
SELECT ALL
          INV_LOC_CODE LOCALISATION,
          INV_PRF_PRD_CODE PRODUIT,
          INV_PRF_FMT_CODE FORMAT,
          PRD_DESCRIPTION DESCRIPTION_DU_PRODUIT,
          NVL (BRN_DESCRIPTION, VEN_SHORT_NAME) MARQUE_MANUF,
          PRF_DESCRIPTION EMPAQUETAGE,
          LOC_LTY_CODE TYPE_DE_LOCALISATION,
          LTY_DESCRIPTION DECRIPTION_DU_TYPE_DE_LOC,
          INV_QUANTITY_ON_HAND EN_INVENTAIRE_QUANTITE,
          INV_WEIGHT_ON_HAND EN_INVENTAIRE_POIDS,
          (CASE
              WHEN LTY_PICKING_SWITCH = 1 THEN INV_QUANTITY_ON_HAND
              WHEN LTY_OVERSTOCK_SWITCH = 1 THEN 0
           END)
             AS DISPONIBLE_QUANTITE,
          (CASE
              WHEN LTY_PICKING_SWITCH = 1 THEN INV_WEIGHT_ON_HAND
              WHEN LTY_OVERSTOCK_SWITCH = 1 THEN 0
           END)
             AS DISPONIBLE_POIDS,
          INV_QUANTITY_TO_PICK CUEILLETTE_QUANTITE,
          INV_WEIGHT_TO_PICK CUEILLETTE_POIDS,
          INV_QUANTITY_ON_HOLD EN_RETENUE_QUANTITE,
          INV_WEIGHT_ON_HOLD EN_RETENUE_POIDS,
          INV_QUANTITY_IN ENTRANTE_QUANTITE,
          INV_WEIGHT_IN ENTRANT_POIDS,
          INV_QUANTITY_IN SORTANT_QUANTITE,
          INV_WEIGHT_OUT SORTANT_POIDS,
          INV_QUANTITY_IN MINIMUM_QUANTITE,
          INV_QUANTITY_MAX MAXIMUM_QUANTITE,
          INV_WEIGHT_MIN MINIMUM_POIDS,
          INV_WEIGHT_MAX MAXIMUM_POIDS,
          INV_QUANTITY_MOVED_IN DEPLACEMENT_QUANTITE_ENTREE,
          INV_QUANTITY_MOVED_OUT DEPLACEMENT_QUANTITE_SORTIE,
          INV_WEIGHT_MOVED_OUT DEPLACE_POIDS_SORTI,
          INV_FIFO_DATE DATE_RECEPTION,
          INV_LAST_PICK_DATE DATE_CUEILLETTE,
          INV_IN_DATE DAE_ENTREE,
          INV_OUT_DATE DATE_SORTIE,
          INV_EXPIRY_DATE DATE_EXPIRATION,
          INV_LAST_COUNT_DATE DATE_DECOMPTE,
          LTY_WHS_CODE CODE_ENTREPOT,
          WHS_NAME NOM_ENTREPOT,
          LTY_WHZ_CODE ZONE_ENTREPOT,
          WHZ_DESCRIPTION ZONE_ENTREPOT_DESCRIPTION,
          LOC_WIDTH LARGEUR,
          LOC_HEIGHT HATEUR,
          LOC_DEPTH PROFONDEUR,
          (CASE
              WHEN LTY_RECEIVING_DOCK_SWITCH = 1 THEN 'N'
              WHEN LTY_RECEIVING_DOCK_SWITCH = 0 THEN 'O'
           END)
             AS QUAI_DE_RECEPTION_O_N,
          (CASE
              WHEN LTY_SHIPPING_DOCK_SWITCH = 0 THEN 'N'
              WHEN LTY_SHIPPING_DOCK_SWITCH = 1 THEN 'O'
           END)
             AS QUAI_EXPEDITION_O_N,
          (CASE
              WHEN LTY_INFINITE_INVENTORY_SWITCH = 0 THEN 'N'
              WHEN LTY_INFINITE_INVENTORY_SWITCH = 1 THEN 'O'
           END)
             AS INVENTIRE_INFINI_O_N,
          (CASE
              WHEN LTY_DAMAGE_SWITCH = 0 THEN 'N'
              WHEN LTY_DAMAGE_SWITCH = 1 THEN 'O'
           END)
             AS INVENTAIRE_ENDOMMAGE_O_N,
          (CASE
              WHEN LTY_OVERSTOCK_SWITCH = 0 THEN 'N'
              WHEN LTY_OVERSTOCK_SWITCH = 1 THEN 'O'
           END)
             AS INVENTAIRE_EN_RESERVE_O_N,
          (CASE
              WHEN LTY_CASH_AND_CARRY_SWITCH = 0 THEN 'N'
              WHEN LTY_CASH_AND_CARRY_SWITCH = 1 THEN 'O'
           END)
             AS LOC_PAYER_ET_EMPORTER_O_N,
          (CASE
              WHEN LTY_TRANSIT_SWITCH = 0 THEN 'N'
              WHEN LTY_TRANSIT_SWITCH = 1 THEN 'O'
           END)
             AS LOC_POUR_EN_TRANSIT_O_N,
          (CASE
              WHEN LTY_ONE_PRODUCT_SWITCH = 0 THEN 'N'
              WHEN LTY_ONE_PRODUCT_SWITCH = 1 THEN 'O'
           END)
             AS LOC_PRODUIT_UNIQUE_O_N,
          (CASE
              WHEN LTY_SPEC_ORDER_SWITCH = 0 THEN 'N'
              WHEN LTY_SPEC_ORDER_SWITCH = 1 THEN 'O'
           END)
             LOC_COMMANDE_SPECIALE_O_N,
          (CASE
              WHEN LTY_NO_COUNT_SWITCH = 0 THEN 'N'
              WHEN LTY_NO_COUNT_SWITCH = 1 THEN 'O'
           END)
             AS LOC_EXCLUS_DES_DECOMPTES_O_N,
          (CASE
              WHEN LTY_PICKING_SWITCH = 0 THEN 'N'
              WHEN LTY_PICKING_SWITCH = 1 THEN 'O'
           END)
             AS LOC_DE_CUEILLETTE_O_N,
          (CASE
              WHEN LTY_DEDICATED_LOCATIONS_SWITCH = 0 THEN 'N'
              WHEN LTY_DEDICATED_LOCATIONS_SWITCH = 1 THEN 'O'
           END)
             AS LOC_DEDIEE_O_N,
          PRD_PRODUCT_LIFE ROTATION_VIE,
          PRD_MINIMUM_RECEPTION_DAYS ROTATION_RECEPTION,
          PRD_PERISHABLE_ALERT ROTATION_ALERTE,
          PRD_PERISHABLE_EXPIRY ROTATION_ENTREPOSAGE
     FROM V_INVENTORIES,
          LOCATIONS,
          LOCATION_TYPES,
          WAREHOUSE_ZONES,
          WAREHOUSES,
          PRODUCTS,
          PRODUCT_FORMATS,
          BRAND_NAMES,
          VENDORS
    WHERE     INV_LOC_CODE = LOC_CODE
          AND LOC_LTY_CODE = LTY_CODE
          AND LTY_WHS_CODE = WHS_CODE
          AND LTY_WHZ_CODE = WHZ_CODE
          AND INV_PRF_FMT_CODE = PRF_FMT_CODE
          AND INV_PRF_PRD_CODE = PRF_PRD_CODE
          AND PRF_PRD_CODE = PRD_CODE
          AND PRD_VEN_CODE = VEN_CODE
          AND PRD_BRN_CODE = BRN_CODE(+);