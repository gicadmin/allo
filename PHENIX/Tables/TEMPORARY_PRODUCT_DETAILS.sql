CREATE GLOBAL TEMPORARY TABLE phenix.temporary_product_details (
  tprd_cus_code NUMBER(10) NOT NULL,
  tprd_prf_prd_code VARCHAR2(10 BYTE) NOT NULL,
  tprd_prf_fmt_code VARCHAR2(7 BYTE) NOT NULL,
  tprd_prd_description VARCHAR2(45 BYTE) NOT NULL,
  tprd_special_order_switch NUMBER(1) DEFAULT 0 NOT NULL,
  tprd_infinite_inv_switch NUMBER(1) DEFAULT 0 NOT NULL,
  tprd_brn_code NUMBER(5),
  tprd_brn_description VARCHAR2(30 BYTE),
  tprd_ctg_code NUMBER(5),
  tprd_ctg_description VARCHAR2(30 BYTE),
  tprd_cutoff_time VARCHAR2(5 BYTE),
  tprd_cutoff_date DATE,
  tprd_fmt_description VARCHAR2(30 BYTE) NOT NULL,
  tprd_fmt_short_code VARCHAR2(2 BYTE) NOT NULL,
  tprd_prf_description VARCHAR2(30 BYTE) NOT NULL,
  tprd_prf_inner_weight NUMBER(8,3) NOT NULL,
  tprd_prf_pre_print_switch NUMBER(1) DEFAULT 0 NOT NULL,
  tprd_prf_cns_code NUMBER(3),
  tprd_prf_price NUMBER(7,2) NOT NULL,
  tprd_extended_prf_price NUMBER(7,2) NOT NULL,
  tprd_selling_price NUMBER(7,2) NOT NULL,
  tprd_extended_selling_price NUMBER(7,2) NOT NULL,
  tprd_fmt_solid_inventory_code VARCHAR2(7 BYTE),
  tprd_fmt_invoiced_short_code VARCHAR2(2 BYTE),
  tprd_extended_savings_amount NUMBER(7,2) NOT NULL,
  tprd_pricing_source VARCHAR2(2 BYTE) NOT NULL,
  tprd_promotional_item_switch NUMBER(1) NOT NULL,
  tprd_promotion_amount NUMBER(7,2) NOT NULL,
  tprd_quantity_weight_on_hand NUMBER(10,3) NOT NULL,
  tprd_prd_ven_code NUMBER(5) NOT NULL,
  tprd_ven_next_receipt_date DATE,
  tprd_ven_next_delivery_code NUMBER(5),
  tprd_ven_next_delivery_date DATE NOT NULL,
  tprd_ven_delivery_date_orig DATE NOT NULL,
  tprd_whs_delivery_code VARCHAR2(2 BYTE) NOT NULL,
  tprd_whs_picking_code VARCHAR2(2 BYTE) NOT NULL,
  tprd_prd_definition VARCHAR2(1 BYTE) NOT NULL,
  tprd_blue_line_switch NUMBER(1) NOT NULL,
  tprd_pxc_code VARCHAR2(18 BYTE),
  tprd_nbr_certifications NUMBER(3) NOT NULL,
  tprd_dld_sequence NUMBER(5)
)
ON COMMIT DELETE ROWS;
COMMENT ON TABLE phenix.temporary_product_details IS 'Table temporaire des détails des produits';
COMMENT ON COLUMN phenix.temporary_product_details.tprd_cus_code IS 'Indique le code du client';
COMMENT ON COLUMN phenix.temporary_product_details.tprd_prf_prd_code IS 'Indique le code du produit';
COMMENT ON COLUMN phenix.temporary_product_details.tprd_prf_fmt_code IS 'Indique le code du format de vente';
COMMENT ON COLUMN phenix.temporary_product_details.tprd_prd_description IS 'Indique la description du produit';
COMMENT ON COLUMN phenix.temporary_product_details.tprd_special_order_switch IS 'Indique si le produit est gardé en entrepôt (commande spéciale)';
COMMENT ON COLUMN phenix.temporary_product_details.tprd_infinite_inv_switch IS 'Indique si le produit est dans une localisation d''inventaire infini';
COMMENT ON COLUMN phenix.temporary_product_details.tprd_brn_code IS 'Indique le code de la marque du commerce du produit s''il en a une';
COMMENT ON COLUMN phenix.temporary_product_details.tprd_brn_description IS 'Indique soit la description de la marque du commerce du produit s''il en a une, sinon le nom court du manufacturier du produit';
COMMENT ON COLUMN phenix.temporary_product_details.tprd_ctg_code IS 'Indique le numéro majeur de la séquence du catalogue';
COMMENT ON COLUMN phenix.temporary_product_details.tprd_ctg_description IS 'Indique la description du numéro majeur de la séquence du catalogue';
COMMENT ON COLUMN phenix.temporary_product_details.tprd_cutoff_time IS 'Indique l''heure de tombée pour commander ce produit';
COMMENT ON COLUMN phenix.temporary_product_details.tprd_cutoff_date IS 'Indique la date que l''heure de tombée s''applique pour commander ce produit';
COMMENT ON COLUMN phenix.temporary_product_details.tprd_fmt_description IS 'Indique la description du format de vente';
COMMENT ON COLUMN phenix.temporary_product_details.tprd_fmt_short_code IS 'Indique le code court du format de vente';
COMMENT ON COLUMN phenix.temporary_product_details.tprd_prf_description IS 'Indique l''empaquetage du format de vente pour ce produit';
COMMENT ON COLUMN phenix.temporary_product_details.tprd_prf_inner_weight IS 'Indique le poids interne du format de vente';
COMMENT ON COLUMN phenix.temporary_product_details.tprd_prf_pre_print_switch IS 'Indique si ce produit / format nécessite une préparation à l''avance';
COMMENT ON COLUMN phenix.temporary_product_details.tprd_prf_cns_code IS 'Indique le numéro de la consigne';
COMMENT ON COLUMN phenix.temporary_product_details.tprd_prf_price IS 'Indique le prix de vente régulier';
COMMENT ON COLUMN phenix.temporary_product_details.tprd_extended_prf_price IS 'Indique le prix de vente régulier du produit / format. Seulement différent du prix de vente régulier (TPRD_PRF_PRICE) dans le cas des produits avec définition ''B'' ou ''D'' (multiplier par le poids interne du produit)';
COMMENT ON COLUMN phenix.temporary_product_details.tprd_selling_price IS 'Indique le prix de vente de la routine de prix du produit / format';
COMMENT ON COLUMN phenix.temporary_product_details.tprd_extended_selling_price IS 'Indique le prix de vente de la routine de prix du produit / format. Seulement différent du TPRD_SELLING_PRICE dans le cas des produits avec définition ''B'' ou ''D'' (multiplier par le poids interne du produit)';
COMMENT ON COLUMN phenix.temporary_product_details.tprd_fmt_solid_inventory_code IS 'Indique le code du format solide d''inventaire';
COMMENT ON COLUMN phenix.temporary_product_details.tprd_fmt_invoiced_short_code IS 'Indique le code court du format facturé si différent que le format de vente';
COMMENT ON COLUMN phenix.temporary_product_details.tprd_extended_savings_amount IS 'Indique la différence entre le TPRD_PRF_PRICE et le TPRD_EXTENDED_SELLING_PRICE';
COMMENT ON COLUMN phenix.temporary_product_details.tprd_pricing_source IS 'Indique la source du prix vendant calculé par la routine de prix';
COMMENT ON COLUMN phenix.temporary_product_details.tprd_promotional_item_switch IS 'Indique s''il s''agit d''un article promotionnel';
COMMENT ON COLUMN phenix.temporary_product_details.tprd_promotion_amount IS 'Indique le montant de la promotion de la routine de prix du produit / format';
COMMENT ON COLUMN phenix.temporary_product_details.tprd_quantity_weight_on_hand IS 'Indique la quantité ou poids en inventaire';
COMMENT ON COLUMN phenix.temporary_product_details.tprd_prd_ven_code IS 'Indique le code du manufacturier du produit';
COMMENT ON COLUMN phenix.temporary_product_details.tprd_ven_next_receipt_date IS 'Indique la prochaine date de réception de la prochaine commande d''achat existante';
COMMENT ON COLUMN phenix.temporary_product_details.tprd_ven_next_delivery_code IS 'Indique le code du fournisseur lié à la prochaine date de livraison fournisseur';
COMMENT ON COLUMN phenix.temporary_product_details.tprd_ven_next_delivery_date IS 'Indique la date de la prochaine mise en inventaire. Peut être différente de la date de livraison du prochaine cycle d''achat s''il existe une commande fournisseur ouverte';
COMMENT ON COLUMN phenix.temporary_product_details.tprd_ven_delivery_date_orig IS 'Indique la date de la prochaine mise en inventaire ayant servi à valider les ventes. Peut être différente de la date de livraison du prochaine cycle d''achat s''il existe une commande fournisseur ouverte';
COMMENT ON COLUMN phenix.temporary_product_details.tprd_whs_delivery_code IS 'Indique le code d''entrepôt de livraison du client';
COMMENT ON COLUMN phenix.temporary_product_details.tprd_whs_picking_code IS 'Indique le code d''entrepôt de cueillette pour le produit';
COMMENT ON COLUMN phenix.temporary_product_details.tprd_prd_definition IS 'Indique la définition du produit';
COMMENT ON COLUMN phenix.temporary_product_details.tprd_blue_line_switch IS 'Indique si la ligne bleue s''applique pour le client et le produit / format spécifié';
COMMENT ON COLUMN phenix.temporary_product_details.tprd_pxc_code IS 'Indique le code du produit chez le client (code équivalent)';
COMMENT ON COLUMN phenix.temporary_product_details.tprd_nbr_certifications IS 'Indique le nombre de certifications du produit';
COMMENT ON COLUMN phenix.temporary_product_details.tprd_dld_sequence IS 'Indique la séquence du détail de la liste d''affichage';