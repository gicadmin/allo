CREATE TABLE phenix.vendor_transport_transactions (
  vtt_id NUMBER(15) NOT NULL,
  vtt_ven_code NUMBER(5) NOT NULL,
  vtt_cus_code NUMBER(10) NOT NULL,
  vtt_billed_cus_code NUMBER(10) NOT NULL,
  vtt_delivery_date DATE NOT NULL,
  vtt_reference_number VARCHAR2(15 BYTE) NOT NULL,
  vtt_vts_code VARCHAR2(10 BYTE) NOT NULL,
  vtt_vtr_id NUMBER(15) NOT NULL,
  vtt_rou_code NUMBER(5) NOT NULL,
  vtt_position NUMBER(7,2) NOT NULL,
  vtt_weight NUMBER(8,3) NOT NULL,
  vtt_weight_uom VARCHAR2(3 BYTE) NOT NULL CONSTRAINT vtt_weight_uom_ck CHECK (VTT_WEIGHT_UOM IN ('KIL', 'LBS')),
  vtt_number_of_packages NUMBER(7) NOT NULL,
  vtt_number_of_pallets NUMBER(7),
  vtt_value NUMBER(7,2) NOT NULL,
  vtt_message VARCHAR2(100 BYTE),
  vtt_receipt_switch NUMBER(1) DEFAULT 1 NOT NULL CONSTRAINT vtt_receipt_switch_ck CHECK (VTT_RECEIPT_SWITCH IN (0, 1)),
  vtt_number_of_stickers NUMBER(3) NOT NULL,
  vtt_shipped_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT vtt_shipped_switch_ck CHECK (VTT_SHIPPED_SWITCH IN (0, 1)),
  vtt_inh_id NUMBER(15),
  vtt_invoiced_minimum_value NUMBER(7,2) DEFAULT 0 NOT NULL,
  vtt_invoiced_trans_amount NUMBER(7,2) DEFAULT 0 NOT NULL,
  vtt_skip_invoicing_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT vtt_skip_invoicing_switch_ck CHECK (VTT_SKIP_INVOICING_SWITCH IN (0, 1)),
  vtt_federal_tax_rate NUMBER(6,3) DEFAULT 0 NOT NULL,
  vtt_provincial_tax_rate NUMBER(6,3) DEFAULT 0 NOT NULL,
  vtt_whs_code VARCHAR2(2 BYTE) NOT NULL,
  vtt_invoiced_fuel_amount NUMBER(7,2),
  vtt_vtr_invoicing_method VARCHAR2(3 BYTE) CONSTRAINT vtt_vtr_invoicing_method_ck CHECK (VTT_VTR_INVOICING_METHOD IN ('FIX', 'KIL', 'LBS', 'PAL', 'PKG', 'VAL', 'NCH','PER')),
  vtt_vtr_fixed_amount NUMBER(7,2),
  vtt_vtr_minimum_charge NUMBER(7,2),
  vtt_vtr_min_charge_method VARCHAR2(3 BYTE) CONSTRAINT vtt_vtr_min_charge_method_ck CHECK (VTT_VTR_MIN_CHARGE_METHOD IN ('ADD', 'REP', 'N/A')),
  vtt_vtr_min_charge_grouping VARCHAR2(3 BYTE) CONSTRAINT vtt_vtr_min_charge_grouping_ck CHECK (VTT_VTR_MIN_CHARGE_GROUPING IN ('STP', 'TRN', 'CUS', 'N/A')),
  vtt_vtl_charge_rate NUMBER(8,3),
  vtt_creation_date DATE DEFAULT SYSDATE NOT NULL,
  vtt_doc_id NUMBER(15),
  vtt_path_img_original VARCHAR2(500 BYTE),
  vtt_path_img_updated VARCHAR2(500 BYTE),
  vtt_path_img_signed VARCHAR2(500 BYTE),
  vtt_stamp_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT vtt_stamp_switch_ck CHECK (vtt_stamp_switch IN (0, 1)),
  vtt_signed_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT vtt_signed_switch_ck CHECK (vtt_signed_switch IN (0, 1)),
  vtt_exception_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT vtt_exception_switch_ck CHECK (vtt_exception_switch IN (0, 1)),
  vtt_page_missed VARCHAR2(20 BYTE),
  vtt_path_img_original_print VARCHAR2(500 BYTE),
  vtt_path_img_updated_print VARCHAR2(500 BYTE),
  vtt_fuel_federal_tax_rate NUMBER(6,3) DEFAULT 0 NOT NULL,
  vtt_fuel_provincial_tax_rate NUMBER(6,3) DEFAULT 0 NOT NULL,
  vtt_volume NUMBER(10,3) NOT NULL,
  CONSTRAINT vtt_pk PRIMARY KEY (vtt_id),
  CONSTRAINT vtt_ref_uk UNIQUE (vtt_billed_cus_code,vtt_delivery_date,vtt_reference_number),
  CONSTRAINT vtt_billed_cus_code_fk FOREIGN KEY (vtt_billed_cus_code) REFERENCES phenix.customers (cus_code),
  CONSTRAINT vtt_cus_code_fk FOREIGN KEY (vtt_cus_code) REFERENCES phenix.customers (cus_code),
  CONSTRAINT vtt_inh_id_fk FOREIGN KEY (vtt_inh_id) REFERENCES phenix.invoice_headers (inh_id),
  CONSTRAINT vtt_rou_code_fk FOREIGN KEY (vtt_rou_code) REFERENCES phenix.routes (rou_code),
  CONSTRAINT vtt_ven_code_fk FOREIGN KEY (vtt_ven_code) REFERENCES phenix.vendors (ven_code),
  CONSTRAINT vtt_vtr_id_fk FOREIGN KEY (vtt_vtr_id) REFERENCES phenix.vendor_transport_agreements (vtr_id),
  CONSTRAINT vtt_vts_code_fk FOREIGN KEY (vtt_vts_code) REFERENCES phenix.vendor_transport_service_types (vts_code),
  CONSTRAINT vtt_whs_code_fk FOREIGN KEY (vtt_whs_code) REFERENCES phenix.warehouses (whs_code)
);
COMMENT ON TABLE phenix.vendor_transport_transactions IS 'Table utilisée pour les transactions de transport déjà facturées et à facturer';
COMMENT ON COLUMN phenix.vendor_transport_transactions.vtt_id IS 'Indique le numéro unique (ID) de la table';
COMMENT ON COLUMN phenix.vendor_transport_transactions.vtt_ven_code IS 'Indique le code du fournisseur des produits livrés';
COMMENT ON COLUMN phenix.vendor_transport_transactions.vtt_cus_code IS 'Indique le code du client livré';
COMMENT ON COLUMN phenix.vendor_transport_transactions.vtt_billed_cus_code IS 'Indique le code du client facturé pour le transport';
COMMENT ON COLUMN phenix.vendor_transport_transactions.vtt_delivery_date IS 'Indique la date de livraison';
COMMENT ON COLUMN phenix.vendor_transport_transactions.vtt_reference_number IS 'Indique le numéro de référence';
COMMENT ON COLUMN phenix.vendor_transport_transactions.vtt_vts_code IS 'Indique le code du type de transport';
COMMENT ON COLUMN phenix.vendor_transport_transactions.vtt_vtr_id IS 'Indique le code de la spécification de transport utilisée';
COMMENT ON COLUMN phenix.vendor_transport_transactions.vtt_rou_code IS 'Indique le code de la route';
COMMENT ON COLUMN phenix.vendor_transport_transactions.vtt_position IS 'Indique la position sur la route';
COMMENT ON COLUMN phenix.vendor_transport_transactions.vtt_weight IS 'Indique le poids de la livraison';
COMMENT ON COLUMN phenix.vendor_transport_transactions.vtt_weight_uom IS 'Indique l''unité de mesure du poids';
COMMENT ON COLUMN phenix.vendor_transport_transactions.vtt_number_of_packages IS 'Indique le nombre de colis';
COMMENT ON COLUMN phenix.vendor_transport_transactions.vtt_number_of_pallets IS 'Indique le nombre de palettes';
COMMENT ON COLUMN phenix.vendor_transport_transactions.vtt_value IS 'Indique la valeur de la livraison';
COMMENT ON COLUMN phenix.vendor_transport_transactions.vtt_message IS 'Indique le message';
COMMENT ON COLUMN phenix.vendor_transport_transactions.vtt_receipt_switch IS 'Indique si la réception de ce transport a été faite';
COMMENT ON COLUMN phenix.vendor_transport_transactions.vtt_number_of_stickers IS 'Indique le nombre d''étiquettes à imprimer';
COMMENT ON COLUMN phenix.vendor_transport_transactions.vtt_shipped_switch IS 'Indique si ce transport a été envoyé';
COMMENT ON COLUMN phenix.vendor_transport_transactions.vtt_inh_id IS 'Indique le numéro de facture associé à ce transport';
COMMENT ON COLUMN phenix.vendor_transport_transactions.vtt_invoiced_minimum_value IS 'Indique la valeur minimum à facturer';
COMMENT ON COLUMN phenix.vendor_transport_transactions.vtt_invoiced_trans_amount IS 'Indique le montant facturé';
COMMENT ON COLUMN phenix.vendor_transport_transactions.vtt_skip_invoicing_switch IS 'Indique si le transport doit être livré sans aucune facturation';
COMMENT ON COLUMN phenix.vendor_transport_transactions.vtt_federal_tax_rate IS 'Indique le taux de taxe fédérale appliqué à la facturation';
COMMENT ON COLUMN phenix.vendor_transport_transactions.vtt_provincial_tax_rate IS 'Indique le taux de taxe provinciale appliqué à la facturation';
COMMENT ON COLUMN phenix.vendor_transport_transactions.vtt_whs_code IS 'Indique l''entrepôt concerné par ce transport';
COMMENT ON COLUMN phenix.vendor_transport_transactions.vtt_invoiced_fuel_amount IS 'Indique le montant de carburant facturé';
COMMENT ON COLUMN phenix.vendor_transport_transactions.vtt_vtr_invoicing_method IS 'Indique la méthode de facturation';
COMMENT ON COLUMN phenix.vendor_transport_transactions.vtt_vtr_fixed_amount IS 'Indique le montant fixe';
COMMENT ON COLUMN phenix.vendor_transport_transactions.vtt_vtr_minimum_charge IS 'Indique la charge minimum';
COMMENT ON COLUMN phenix.vendor_transport_transactions.vtt_vtr_min_charge_method IS 'Indique la méthode de facturation de la charge minimum';
COMMENT ON COLUMN phenix.vendor_transport_transactions.vtt_vtr_min_charge_grouping IS 'Indique le regroupement à utiliser pour la charge minimum';
COMMENT ON COLUMN phenix.vendor_transport_transactions.vtt_vtl_charge_rate IS 'Indique les frais à charger pour ce niveau';
COMMENT ON COLUMN phenix.vendor_transport_transactions.vtt_creation_date IS 'Indique la date de création du transport';
COMMENT ON COLUMN phenix.vendor_transport_transactions.vtt_doc_id IS 'Indique l''ID du fichier.';
COMMENT ON COLUMN phenix.vendor_transport_transactions.vtt_path_img_original IS 'Indique le chemin pour le fichier de facture original.';
COMMENT ON COLUMN phenix.vendor_transport_transactions.vtt_path_img_updated IS 'Indique le  chemin pour le fichier de facture recadré (avec code à barre).';
COMMENT ON COLUMN phenix.vendor_transport_transactions.vtt_path_img_signed IS 'Indique le chemin pour le fichier signé.';
COMMENT ON COLUMN phenix.vendor_transport_transactions.vtt_stamp_switch IS 'Indique si la facture est estampée.';
COMMENT ON COLUMN phenix.vendor_transport_transactions.vtt_signed_switch IS 'Indique si la facture est signée.';
COMMENT ON COLUMN phenix.vendor_transport_transactions.vtt_exception_switch IS 'Indique si la facture en exception (si elle doit faire l¿objet d¿une correction).';
COMMENT ON COLUMN phenix.vendor_transport_transactions.vtt_page_missed IS 'Indique les pages manquantes (liste des pages manquantes ex : 1,4,6).';
COMMENT ON COLUMN phenix.vendor_transport_transactions.vtt_path_img_original_print IS 'Indique le chemin du fichier de facture original pour l impression au cours de la génération de la route.';
COMMENT ON COLUMN phenix.vendor_transport_transactions.vtt_path_img_updated_print IS 'Indique le  chemin du fichier de facture recadré (avec code à barre) pour l impression au cours de la génération de la route.';
COMMENT ON COLUMN phenix.vendor_transport_transactions.vtt_fuel_federal_tax_rate IS 'Indique le taux de taxe fÃ©dÃ©rale sur le carburant appliquÃ© Ã  la facturation';
COMMENT ON COLUMN phenix.vendor_transport_transactions.vtt_fuel_provincial_tax_rate IS 'Indique le taux de taxe provinciale sur le carburant appliquÃ© Ã  la facturation';