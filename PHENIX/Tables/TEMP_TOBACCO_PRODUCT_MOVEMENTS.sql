CREATE GLOBAL TEMPORARY TABLE phenix.temp_tobacco_product_movements (
  ttpm_whs_code VARCHAR2(2 BYTE) NOT NULL,
  ttpm_trans_date DATE NOT NULL,
  ttpm_trans_type VARCHAR2(4 BYTE) NOT NULL,
  ttpm_trans_id VARCHAR2(22 BYTE),
  ttpm_cus_code NUMBER(10),
  ttpm_ven_code NUMBER(5),
  ttpm_prf_prd_code VARCHAR2(10 BYTE),
  ttpm_prf_fmt_code VARCHAR2(7 BYTE),
  ttpm_prd_ven_code NUMBER(5),
  ttpm_tbpc_code NUMBER(3),
  ttpm_tbpc_description VARCHAR2(30 BYTE),
  ttpm_trans_quantity NUMBER(7),
  ttpm_trans_tobacco_tax NUMBER(6,2),
  ttpm_base_number_of_items NUMBER(6),
  ttpm_conversion_factor NUMBER(4),
  ttpm_prf_tobacco_tax NUMBER(6,2),
  ttpm_prd_size NUMBER(8,3),
  ttpm_prd_size_uom VARCHAR2(2 BYTE),
  ttpm_prd_description VARCHAR2(45 BYTE),
  ttpm_base_quantity NUMBER(7,2),
  ttpm_base_units NUMBER(8),
  ttpm_trans_units NUMBER(8),
  ttpm_extended_units NUMBER(10),
  ttpm_extended_trans_tax NUMBER(10,2),
  ttpm_extended_units_tax NUMBER(10,2)
)
ON COMMIT DELETE ROWS;
COMMENT ON COLUMN phenix.temp_tobacco_product_movements.ttpm_whs_code IS 'Indique le code de l''entrepôt';
COMMENT ON COLUMN phenix.temp_tobacco_product_movements.ttpm_trans_date IS 'Indique la date de la transaction';
COMMENT ON COLUMN phenix.temp_tobacco_product_movements.ttpm_trans_type IS 'Indique le type de transaction (SALE: Vente, CRED: Crédit/Débit, DRPU: Drop Achat, DRSA: Drop Vente, PURC: Réception, INVC: Décompte, RETU: Retour fournisseur)';
COMMENT ON COLUMN phenix.temp_tobacco_product_movements.ttpm_trans_id IS 'Indique le numéro de la transaction';
COMMENT ON COLUMN phenix.temp_tobacco_product_movements.ttpm_cus_code IS 'Indique le numéro du client';
COMMENT ON COLUMN phenix.temp_tobacco_product_movements.ttpm_ven_code IS 'Indique numéro du fournisseur de la transaction';
COMMENT ON COLUMN phenix.temp_tobacco_product_movements.ttpm_prf_prd_code IS 'Indique le code du produit';
COMMENT ON COLUMN phenix.temp_tobacco_product_movements.ttpm_prf_fmt_code IS 'Indique le code du format';
COMMENT ON COLUMN phenix.temp_tobacco_product_movements.ttpm_prd_ven_code IS 'Indique le manufacturier du produit';
COMMENT ON COLUMN phenix.temp_tobacco_product_movements.ttpm_tbpc_code IS 'Indique la catégorie de tabac';
COMMENT ON COLUMN phenix.temp_tobacco_product_movements.ttpm_tbpc_description IS 'Indique la description de la catégorie de tabac';
COMMENT ON COLUMN phenix.temp_tobacco_product_movements.ttpm_trans_quantity IS 'Indique la quantité de la transaction';
COMMENT ON COLUMN phenix.temp_tobacco_product_movements.ttpm_trans_tobacco_tax IS 'Indique la taxe tabac par format';
COMMENT ON COLUMN phenix.temp_tobacco_product_movements.ttpm_base_number_of_items IS 'Indique le nombre d''articles consommables';
COMMENT ON COLUMN phenix.temp_tobacco_product_movements.ttpm_conversion_factor IS 'Indique le facteur de conversion';
COMMENT ON COLUMN phenix.temp_tobacco_product_movements.ttpm_prf_tobacco_tax IS 'Indique le taux de taxe sur le fichier produit format';
COMMENT ON COLUMN phenix.temp_tobacco_product_movements.ttpm_prd_size IS 'Indique l''unité de mesure du format du produit';
COMMENT ON COLUMN phenix.temp_tobacco_product_movements.ttpm_prd_size_uom IS 'Indique l''unité de mesure';
COMMENT ON COLUMN phenix.temp_tobacco_product_movements.ttpm_prd_description IS 'Indique la description du produit';
COMMENT ON COLUMN phenix.temp_tobacco_product_movements.ttpm_base_quantity IS 'Indique la quantité de la transaction convertie dans le format vendable (il y a juste un format vendable pour les produits de tabac, mais des crédits peuvent se faire sur des sous-formats)';
COMMENT ON COLUMN phenix.temp_tobacco_product_movements.ttpm_base_units IS 'Indique le nombre d''unités pour le format vendable';
COMMENT ON COLUMN phenix.temp_tobacco_product_movements.ttpm_trans_units IS 'Indique le nombre d''unités pour le format de la transaction';
COMMENT ON COLUMN phenix.temp_tobacco_product_movements.ttpm_extended_units IS 'Indique le nombre d''unités totales par ligne';
COMMENT ON COLUMN phenix.temp_tobacco_product_movements.ttpm_extended_trans_tax IS 'Indique la taxe totale pour la transaction';
COMMENT ON COLUMN phenix.temp_tobacco_product_movements.ttpm_extended_units_tax IS 'Indique la taxe unitaire multipliée par le nombre d''unités';