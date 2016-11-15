CREATE GLOBAL TEMPORARY TABLE phenix.temporary_edi_ni_extract (
  tene_id NUMBER(15),
  tene_type VARCHAR2(2 BYTE),
  tene_cus_code NUMBER(10),
  tene_order_date DATE,
  tene_invoice_date DATE,
  tene_reference_number VARCHAR2(15 BYTE),
  tene_seller_prd_ref_number VARCHAR2(15 BYTE),
  tene_buyer_prd_ref_number VARCHAR2(15 BYTE),
  tene_upc_code VARCHAR2(18 BYTE),
  tene_ordered_quantity NUMBER(7),
  tene_invoiced_quantity NUMBER(7),
  tene_line_number NUMBER(4),
  tene_description VARCHAR2(45 BYTE),
  tene_original_invoice_number VARCHAR2(15 BYTE),
  tene_customer_order_number VARCHAR2(15 BYTE),
  tene_customer_order_line NUMBER(4),
  tene_whs_code VARCHAR2(2 BYTE),
  tene_use_code NUMBER(5),
  tene_cus_cus_code NUMBER(10),
  tene_prf_prd_code VARCHAR2(10 BYTE),
  tene_prf_fmt_code VARCHAR2(7 BYTE),
  tene_base_selling_cost NUMBER(7,2),
  tene_cost_price NUMBER(7,2),
  tene_original_retail NUMBER(7,2),
  tene_pricing_source VARCHAR2(2 BYTE),
  tene_promotion_amount NUMBER(7,2),
  tene_project_delivery_date DATE,
  tene_selling_retail NUMBER(7,2),
  tene_surcharge NUMBER(7,2),
  tene_tobacco_tax NUMBER(6,2),
  tene_fmt_code_srp VARCHAR2(7 BYTE),
  tene_pty_code NUMBER(3),
  tene_price_srp NUMBER(7,2),
  tene_quantity_srp NUMBER(4),
  tene_average_cost_1 NUMBER(7,2),
  tene_average_cost_2 NUMBER(7,2),
  tene_average_cost_3 NUMBER(7,2),
  tene_average_cost_4 NUMBER(7,2),
  tene_average_list NUMBER(7,2),
  tene_avg_real_cost_1 NUMBER(7,2),
  tene_avg_real_cost_2 NUMBER(7,2),
  tene_avg_real_cost_3 NUMBER(7,2),
  tene_avg_real_cost_4 NUMBER(7,2),
  tene_avg_real_list NUMBER(7,2),
  tene_car_amount NUMBER(7,2),
  tene_replacement_list NUMBER(7,2),
  tene_replacement_cost_1 NUMBER(7,2),
  tene_replacement_cost_2 NUMBER(7,2),
  tene_replacement_cost_3 NUMBER(7,2),
  tene_replacement_cost_4 NUMBER(7,2),
  tene_royalty_amount NUMBER(7,2),
  tene_loc_code VARCHAR2(12 BYTE),
  tene_prv_code VARCHAR2(2 BYTE),
  tene_federal_tax_switch NUMBER(1),
  tene_provincial_tax_switch NUMBER(1),
  tene_provincial_tax_rate NUMBER(6,3),
  tene_federal_tax_rate NUMBER(6,3),
  tene_compounded_tax_switch NUMBER(1),
  tene_provincial_line_tax_rate NUMBER(6,3),
  tene_federal_line_tax_rate NUMBER(6,3),
  tene_apply_delivery_switch NUMBER(1),
  tene_crt_code NUMBER(3),
  tene_cigar_switch NUMBER(1),
  tene_invoiced_ext_price NUMBER(10,2),
  tene_invoiced_ext_surcharge NUMBER(10,2),
  tene_federal_tax_amount NUMBER(10,2),
  tene_provincial_tax_amount NUMBER(10,2),
  tene_debit_switch NUMBER(1),
  tene_ccr_code NUMBER(5),
  tene_store_num VARCHAR2(10 BYTE),
  tene_partner_id NUMBER(10)
)
ON COMMIT DELETE ROWS;
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_id IS 'Indique le id de la table';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_type IS 'Indique le type de transaction,''IN'' ou ''CR''';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_cus_code IS 'Indique le code du client, utilisé pour mettre à jour les tables COH, PLH, INH';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_order_date IS 'Indique la date de la commande client';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_invoice_date IS 'Indique la date de la facturation';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_reference_number IS 'Indique le numéro de référence de la facture partenaire';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_seller_prd_ref_number IS 'Indique le code de produit du partenaire';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_buyer_prd_ref_number IS 'Indique le code de produit du Beaudry';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_upc_code IS 'Indique le code UPC';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_ordered_quantity IS 'Indique la quantité commandée';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_invoiced_quantity IS 'Indique la quantité facturée';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_line_number IS 'Indique le numéro de ligne';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_description IS 'Indique la description du produit';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_original_invoice_number IS 'Indique le numéro de la facture originale pour les crédits non utilisé';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_customer_order_number IS 'Indique le numéro de commande du client';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_customer_order_line IS 'Indique le numéro de la ligne de la commande client';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_whs_code IS 'Indique le code d''entrepôt';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_use_code IS 'Indique le code du d’user assigné au client';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_cus_cus_code IS 'Indique le code de la maison mère du client';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_prf_prd_code IS 'Indique le code de produit';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_prf_fmt_code IS 'Indique le format de produit';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_base_selling_cost IS 'Coût servant pour le calcul des coûtants plus';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_cost_price IS 'Prix du coûtant';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_original_retail IS 'Prix de vente avant le processus de fixation des prix';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_pricing_source IS 'Source du prix';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_promotion_amount IS 'Montant des promotions';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_project_delivery_date IS 'Date de livraison projetée';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_selling_retail IS 'Prix de vente après le processus de fixation des prix';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_surcharge IS 'Supplément monétaire';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_tobacco_tax IS 'Montant de taxes tabac';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_fmt_code_srp IS 'Format du prix de détail suggéré';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_pty_code IS 'Numéro du type de promotion';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_price_srp IS 'Prix de détail suggéré ';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_quantity_srp IS 'Quantité du prix de détail suggéré';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_average_cost_1 IS 'Moyenne des prix du coûtant 1';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_average_cost_2 IS 'Moyenne des prix du coûtant 2';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_average_cost_3 IS 'Moyenne des prix du coûtant 3';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_average_cost_4 IS 'Moyenne des prix du coûtant 4';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_average_list IS 'Moyenne des prix de liste du manufacturier';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_avg_real_cost_1 IS 'Vraie moyenne des prix du coûtant 1';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_avg_real_cost_2 IS 'Vraie moyenne des prix du coûtant 2';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_avg_real_cost_3 IS 'Vraie moyenne des prix du coûtant 3';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_avg_real_cost_4 IS 'Vraie moyenne des prix du coûtant 4';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_avg_real_list IS 'Vrai moyenne des prix de liste du manufacturier';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_car_amount IS 'Indique le montant du compteur ';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_replacement_list IS 'Indique le coûtant liste si on commandait le produit maintenant, calculé selon la routine de prix aux achats';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_replacement_cost_1 IS 'Indique le coûtant 1 si on commandait le produit maintenant, calculé selon la routine de prix aux achats';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_replacement_cost_2 IS 'Indique le coûtant 2 si on commandait le produit maintenant, calculé selon la routine de prix aux achats';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_replacement_cost_3 IS 'Indique le coûtant 3 si on commandait le produit maintenant, calculé selon la routine de prix aux achats';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_replacement_cost_4 IS 'Indique le coûtant 4 si on commandait le produit maintenant, calculé selon la routine de prix aux achats';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_royalty_amount IS 'Indique le montant de royauté lorsque le prix vient par un soumission';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_loc_code IS 'Numéro de la localisation';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_prv_code IS 'Indique le code de la province du client';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_federal_tax_switch IS 'Indique si le produit est taxé au fédéral';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_provincial_tax_switch IS 'Indique si le produit est taxé au provincial';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_provincial_tax_rate IS 'Taux de la taxe provincial';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_federal_tax_rate IS 'Taux de la taxe fédéral';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_compounded_tax_switch IS 'Indique c''est il y a taxe consolidée';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_provincial_line_tax_rate IS 'Taux de la taxe provincial appliquée';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_federal_line_tax_rate IS 'Taux de la taxe fédérale appliquée';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_apply_delivery_switch IS 'Indique si des frais de livraison sont appliqués';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_crt_code IS 'Indique le code du type de crédit';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_cigar_switch IS 'Indique si c''est un produit cigare';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_invoiced_ext_price IS 'Indique le montant total de vente à la ligne';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_invoiced_ext_surcharge IS 'Indique le montant total de surcharge à la ligne';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_federal_tax_amount IS 'Indique le montant total de taxe fédérale à la ligne';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_provincial_tax_amount IS 'Indique le montant total de taxe provincial à la ligne';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_debit_switch IS 'Indique si c''est une ligne débit';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_ccr_code IS 'Indique le code d''erreur';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_store_num IS 'Indique le numéro du magasin à l''intérieur d''une chaîne, ou le numéro de client chez le partenaire';
COMMENT ON COLUMN phenix.temporary_edi_ni_extract.tene_partner_id IS 'Indique l''identification du partenaire d''affaire pour l''interface. utiliser pour envoyer le rapport de rejet';