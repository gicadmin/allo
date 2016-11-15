CREATE TABLE phenix.validate_transp_transactions (
  vat_nom_fichier VARCHAR2(255 BYTE),
  vat_id NUMBER(15) NOT NULL,
  vat_pass NUMBER(1),
  vat_vtt_id_existant NUMBER(15),
  vat_vtt_ven_code VARCHAR2(5 BYTE),
  vat_vtt_ven_name VARCHAR2(100 BYTE),
  vat_vtt_cus_code VARCHAR2(20 BYTE),
  vat_vtt_cus_name VARCHAR2(100 BYTE),
  vat_vtt_billed_cus_code VARCHAR2(10 BYTE),
  vat_vtt_billed_cus_name VARCHAR2(100 BYTE),
  vat_vtt_delivery_date DATE,
  vat_vtt_reference_number VARCHAR2(15 BYTE),
  vat_vtt_vts_code VARCHAR2(10 BYTE),
  vat_vtt_vtr_id NUMBER(15),
  vat_vtt_rou_code NUMBER(5),
  vat_vtt_position NUMBER(7,2),
  vat_vtt_weight VARCHAR2(9 BYTE),
  vat_vtt_weight_uom VARCHAR2(3 BYTE),
  vat_vtt_number_of_packages VARCHAR2(7 BYTE),
  vat_vtt_number_of_pallets VARCHAR2(7 BYTE),
  vat_vtt_value VARCHAR2(8 BYTE),
  vat_vtt_message VARCHAR2(100 BYTE),
  vat_vtt_receipt_switch NUMBER(1),
  vat_vtt_number_of_stickers NUMBER(3),
  vat_vtt_shipped_switch NUMBER(1),
  vat_vtt_inh_id NUMBER(15),
  vat_ccr_code NUMBER(5),
  vat_vtt_invoiced_minimum_value NUMBER(7,2),
  vat_vtt_invoiced_trans_amount NUMBER(7,2),
  vat_vtt_skip_invoicing_switch NUMBER(1),
  vat_vtt_provincial_tax_rate NUMBER(6,3),
  vat_vtt_federal_tax_rate NUMBER(6,3),
  vat_vtt_whs_code VARCHAR2(2 BYTE),
  vat_vtt_invoiced_fuel_amount NUMBER(7,2),
  vat_vtt_vtr_invoicing_method VARCHAR2(3 BYTE),
  vat_vtt_vtr_fixed_amount NUMBER(7,2),
  vat_vtt_vtr_minimum_charge NUMBER(7,2),
  vat_vtt_vtr_min_charge_method VARCHAR2(3 BYTE),
  vat_vtt_vtr_min_charge_group VARCHAR2(3 BYTE),
  vat_vtt_vtl_charge_rate NUMBER(8,3),
  vat_vtt_doc_id VARCHAR2(15 BYTE),
  vat_vtt_path_img_original VARCHAR2(500 BYTE),
  vat_vtt_path_img_updated VARCHAR2(500 BYTE),
  vat_vtt_path_img_signed VARCHAR2(500 BYTE),
  vat_vtt_stamp_switch NUMBER(1),
  vat_vtt_signed_switch NUMBER(1),
  vat_vtt_exception_switch NUMBER(1),
  vat_vtt_page_missed VARCHAR2(20 BYTE),
  vat_tdh_to_insert NUMBER(1),
  vat_tdh_route_date DATE,
  vat_tdh_route_trk_code VARCHAR2(8 BYTE),
  vat_tdh_use_code NUMBER(5),
  vat_tdh_use_aide_code NUMBER(5),
  vat_tdh_route_loc_dock_code VARCHAR2(12 BYTE),
  vat_trd_to_insert NUMBER(1),
  vat_vtt_path_img_original_prin VARCHAR2(500 BYTE),
  vat_vtt_path_img_updated_prin VARCHAR2(500 BYTE),
  vat_transporter_ref_cus VARCHAR2(20 BYTE),
  vat_vtt_volume NUMBER(10,3),
  CONSTRAINT vat_id_pk PRIMARY KEY (vat_id),
  CONSTRAINT vat_ccr_fk FOREIGN KEY (vat_ccr_code) REFERENCES phenix.error_codes (ccr_code),
  CONSTRAINT vat_vtt_whs_code_fk FOREIGN KEY (vat_vtt_whs_code) REFERENCES phenix.warehouses (whs_code)
);
COMMENT ON TABLE phenix.validate_transp_transactions IS 'Table utilisée pour les informations temporaires sur les transactions de transport lues dans le fichier numérisé';
COMMENT ON COLUMN phenix.validate_transp_transactions.vat_nom_fichier IS 'Indique le nom du fichier';
COMMENT ON COLUMN phenix.validate_transp_transactions.vat_id IS 'Indique l''identifiant de la table';
COMMENT ON COLUMN phenix.validate_transp_transactions.vat_pass IS 'Indique le numéro d''étape';
COMMENT ON COLUMN phenix.validate_transp_transactions.vat_vtt_id_existant IS 'Indique le VTT_ID existant lié à la reference, client livré et au fournisseur (Au cas le VTT était déja crée)';
COMMENT ON COLUMN phenix.validate_transp_transactions.vat_vtt_ven_code IS 'Indique le code du fournisseur des produits livrés';
COMMENT ON COLUMN phenix.validate_transp_transactions.vat_vtt_ven_name IS 'Indique le code du fournisseur des produits livrés lu dans le fichier';
COMMENT ON COLUMN phenix.validate_transp_transactions.vat_vtt_cus_code IS 'Indique le code du client livré';
COMMENT ON COLUMN phenix.validate_transp_transactions.vat_vtt_cus_name IS 'Indique le nom du client livré lu dans les fichier';
COMMENT ON COLUMN phenix.validate_transp_transactions.vat_vtt_billed_cus_code IS 'Indique le code du client facturé pour le transport';
COMMENT ON COLUMN phenix.validate_transp_transactions.vat_vtt_billed_cus_name IS 'Indique le code du client facturé pour le transport lu dans le fichier';
COMMENT ON COLUMN phenix.validate_transp_transactions.vat_vtt_delivery_date IS 'Indique la date de livraison';
COMMENT ON COLUMN phenix.validate_transp_transactions.vat_vtt_reference_number IS 'Indique le numéro de référence';
COMMENT ON COLUMN phenix.validate_transp_transactions.vat_vtt_vts_code IS 'Indique le code du type de transport';
COMMENT ON COLUMN phenix.validate_transp_transactions.vat_vtt_vtr_id IS 'Indique le code de la spécification de transport utilisée';
COMMENT ON COLUMN phenix.validate_transp_transactions.vat_vtt_rou_code IS 'Indique le code de la route';
COMMENT ON COLUMN phenix.validate_transp_transactions.vat_vtt_position IS 'Indique la position sur la route';
COMMENT ON COLUMN phenix.validate_transp_transactions.vat_vtt_weight IS 'Indique le poids de la livraison';
COMMENT ON COLUMN phenix.validate_transp_transactions.vat_vtt_weight_uom IS 'Indique l''unité de mesure du poids';
COMMENT ON COLUMN phenix.validate_transp_transactions.vat_vtt_number_of_packages IS 'Indique le nombre de colis';
COMMENT ON COLUMN phenix.validate_transp_transactions.vat_vtt_number_of_pallets IS 'Indique le nombre de palettes';
COMMENT ON COLUMN phenix.validate_transp_transactions.vat_vtt_value IS 'Indique la valeur de la livraison';
COMMENT ON COLUMN phenix.validate_transp_transactions.vat_vtt_message IS 'indique le message';
COMMENT ON COLUMN phenix.validate_transp_transactions.vat_vtt_receipt_switch IS 'Indique si la réception de ce transport a été faite';
COMMENT ON COLUMN phenix.validate_transp_transactions.vat_vtt_number_of_stickers IS 'Indique le nombre d''étiquettes à imprimer';
COMMENT ON COLUMN phenix.validate_transp_transactions.vat_vtt_shipped_switch IS 'Indique si ce transport a été envoyé';
COMMENT ON COLUMN phenix.validate_transp_transactions.vat_vtt_inh_id IS 'Indique le numéro de facture associé à ce transport';
COMMENT ON COLUMN phenix.validate_transp_transactions.vat_ccr_code IS 'Indique le code d''erreur';
COMMENT ON COLUMN phenix.validate_transp_transactions.vat_vtt_invoiced_minimum_value IS 'Indique la valeur minimum à facturer';
COMMENT ON COLUMN phenix.validate_transp_transactions.vat_vtt_invoiced_trans_amount IS 'Indique le montant facturé';
COMMENT ON COLUMN phenix.validate_transp_transactions.vat_vtt_skip_invoicing_switch IS 'Indique si le transport doit être livré sans aucune facturation';
COMMENT ON COLUMN phenix.validate_transp_transactions.vat_vtt_provincial_tax_rate IS 'Indique le taux de taxe provinciale appliqué à la facturation';
COMMENT ON COLUMN phenix.validate_transp_transactions.vat_vtt_federal_tax_rate IS 'Indique le taux de taxe fédérale appliqué à la facturation';
COMMENT ON COLUMN phenix.validate_transp_transactions.vat_vtt_whs_code IS 'Indique l''entrepôt concerné par ce transport';
COMMENT ON COLUMN phenix.validate_transp_transactions.vat_vtt_invoiced_fuel_amount IS 'Indique le montant de carburant facturé';
COMMENT ON COLUMN phenix.validate_transp_transactions.vat_vtt_vtr_invoicing_method IS 'Indique la méthode de facturation';
COMMENT ON COLUMN phenix.validate_transp_transactions.vat_vtt_vtr_fixed_amount IS 'Indique le montant fixe';
COMMENT ON COLUMN phenix.validate_transp_transactions.vat_vtt_vtr_minimum_charge IS 'Indique la charge minimum';
COMMENT ON COLUMN phenix.validate_transp_transactions.vat_vtt_vtr_min_charge_method IS 'Indique la méthode de facturation de la charge minimum';
COMMENT ON COLUMN phenix.validate_transp_transactions.vat_vtt_vtr_min_charge_group IS 'Indique le regroupement à utiliser pour la charge minimum';
COMMENT ON COLUMN phenix.validate_transp_transactions.vat_vtt_vtl_charge_rate IS 'Indique les frais à charger pour ce niveau';
COMMENT ON COLUMN phenix.validate_transp_transactions.vat_vtt_doc_id IS 'Indique l''ID du fichier.';
COMMENT ON COLUMN phenix.validate_transp_transactions.vat_vtt_path_img_original IS 'Indique le chemin pour le fichier de facture original.';
COMMENT ON COLUMN phenix.validate_transp_transactions.vat_vtt_path_img_updated IS 'Indique le  chemin pour le fichier de facture recadré (avec code à barre).';
COMMENT ON COLUMN phenix.validate_transp_transactions.vat_vtt_path_img_signed IS 'Indique le chemin pour le fichier signé.';
COMMENT ON COLUMN phenix.validate_transp_transactions.vat_vtt_stamp_switch IS 'Indique si la facture est estampée.';
COMMENT ON COLUMN phenix.validate_transp_transactions.vat_vtt_signed_switch IS 'Indique si la facture est signée.';
COMMENT ON COLUMN phenix.validate_transp_transactions.vat_vtt_exception_switch IS 'Indique si la facture en exception (si elle doit faire l¿objet d¿une correction).';
COMMENT ON COLUMN phenix.validate_transp_transactions.vat_vtt_page_missed IS 'Indique les pages manquantes (liste des pages manquantes ex : 1,4,6).';
COMMENT ON COLUMN phenix.validate_transp_transactions.vat_tdh_to_insert IS 'Indique si un TRH sera crée au cours de ce processus';
COMMENT ON COLUMN phenix.validate_transp_transactions.vat_tdh_route_date IS 'Indique la date de la route';
COMMENT ON COLUMN phenix.validate_transp_transactions.vat_tdh_route_trk_code IS 'Indique le camion qui sera utilisé lors du chargement "par route"';
COMMENT ON COLUMN phenix.validate_transp_transactions.vat_tdh_use_code IS 'Indique le code d''utilisateur du camionneur';
COMMENT ON COLUMN phenix.validate_transp_transactions.vat_tdh_use_aide_code IS 'Indique le code d''utilisateur de l''aide camionneur';
COMMENT ON COLUMN phenix.validate_transp_transactions.vat_tdh_route_loc_dock_code IS 'Indique le quai d''expédition qui sera utilisé lors du chargement "par route" ';
COMMENT ON COLUMN phenix.validate_transp_transactions.vat_trd_to_insert IS 'Indique si un TRD sera crée au cours de ce processus';
COMMENT ON COLUMN phenix.validate_transp_transactions.vat_vtt_path_img_original_prin IS 'Indique le chemin du fichier de facture original pour l impression au cours de la génération de la route.';
COMMENT ON COLUMN phenix.validate_transp_transactions.vat_vtt_path_img_updated_prin IS 'Indique le  chemin du fichier de facture recadré (avec code à barre) pour l impression au cours de la génération de la route.';
COMMENT ON COLUMN phenix.validate_transp_transactions.vat_vtt_volume IS 'Indique le volume en mètre cubes de cette transaction';