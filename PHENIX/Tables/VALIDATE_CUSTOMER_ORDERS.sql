CREATE TABLE phenix.validate_customer_orders (
  vco_coh_cus_code VARCHAR2(10 BYTE),
  vco_coh_use_code VARCHAR2(5 BYTE),
  vco_coh_approved_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT vco_coh_approved_switch_ck CHECK (VCO_COH_APPROVED_SWITCH IN (0,1)),
  vco_coh_order_date VARCHAR2(8 BYTE),
  vco_coh_use_telemark_code NUMBER(5),
  vco_coh_message VARCHAR2(100 BYTE),
  vco_coh_reference_number VARCHAR2(15 BYTE),
  vco_cod_coh_id NUMBER(15),
  vco_cod_line_number NUMBER(4),
  vco_cod_prf_prd_code VARCHAR2(10 BYTE),
  vco_cod_prf_fmt_code VARCHAR2(7 BYTE),
  vco_cod_base_selling_cost NUMBER(7,2),
  vco_cod_cost_price NUMBER(7,2),
  vco_cod_order_type VARCHAR2(2 BYTE),
  vco_cod_original_retail NUMBER(7,2),
  vco_cod_prebook_method VARCHAR2(2 BYTE),
  vco_cod_pricing_source VARCHAR2(2 BYTE),
  vco_cod_project_delivery_date VARCHAR2(8 BYTE),
  vco_cod_promotion_amount NUMBER(7,2),
  vco_cod_selling_retail VARCHAR2(8 BYTE),
  vco_cod_spec_order_status VARCHAR2(2 BYTE),
  vco_cod_surcharge NUMBER(7,2),
  vco_cod_tobacco_tax NUMBER(6,2),
  vco_cod_cod_coh_id NUMBER(15),
  vco_cod_cod_line_number NUMBER(4),
  vco_cod_fmt_code_srp VARCHAR2(7 BYTE),
  vco_cod_pod_poh_id NUMBER(15),
  vco_cod_pod_line_number NUMBER(4),
  vco_cod_prf_prd_original_code VARCHAR2(10 BYTE),
  vco_cod_prf_fmt_original_code VARCHAR2(7 BYTE),
  vco_cod_pty_code NUMBER(3),
  vco_cod_leftover_quantity NUMBER(7),
  vco_cod_leftover_weight NUMBER(8,3),
  vco_cod_message VARCHAR2(100 BYTE),
  vco_cod_order_quantity VARCHAR2(7 BYTE),
  vco_cod_order_weight VARCHAR2(9 BYTE),
  vco_cod_price_srp NUMBER(7,2),
  vco_cod_quantity_srp NUMBER(4),
  vco_ccr_code NUMBER(5),
  vco_cod_average_cost_1 NUMBER(7,2),
  vco_cod_average_cost_2 NUMBER(7,2),
  vco_cod_average_cost_3 NUMBER(7,2),
  vco_cod_average_cost_4 NUMBER(7,2),
  vco_cod_average_list NUMBER(7,2),
  vco_cod_avg_real_cost_1 NUMBER(7,2),
  vco_cod_avg_real_cost_2 NUMBER(7,2),
  vco_cod_avg_real_cost_3 NUMBER(7,2),
  vco_cod_avg_real_cost_4 NUMBER(7,2),
  vco_cod_avg_real_list NUMBER(7,2),
  vco_reject_and_printed_switch NUMBER(1),
  vco_cod_customer_product_code VARCHAR2(10 BYTE),
  vco_cod_customer_product_loc VARCHAR2(8 BYTE),
  vco_accept_flag VARCHAR2(1 BYTE),
  vco_cod_customer_po_line NUMBER(4),
  vco_upc_code VARCHAR2(18 BYTE),
  vco_transfered_product_code VARCHAR2(10 BYTE),
  vco_cod_car_amount NUMBER(7,2),
  vco_inserted_switch NUMBER(1),
  vco_coh_whs_delivery_code VARCHAR2(2 BYTE),
  vco_cod_whs_picking_code VARCHAR2(2 BYTE),
  vco_selling_retail_orig NUMBER(7,2),
  vco_pricing_source_orig VARCHAR2(2 BYTE),
  vco_use_override_code NUMBER(5),
  vco_cod_royalty_amount NUMBER(7,2) DEFAULT 0 NOT NULL,
  vco_cod_desired_quantity NUMBER(7),
  vco_cod_desired_weight NUMBER(8,3),
  vco_orig_ven_name VARCHAR2(35 BYTE),
  vco_cod_division_order_switch NUMBER(1) DEFAULT 0 NOT NULL,
  vco_coh_pci_order_rgf_number NUMBER(10),
  vco_requested_price VARCHAR2(8 BYTE),
  vco_requested_delivery_date VARCHAR2(8 BYTE),
  vco_availability_date DATE,
  vco_display_line_number NUMBER(4),
  vco_cod_customer_po_number VARCHAR2(15 BYTE),
  vco_pxc_code VARCHAR2(18 BYTE),
  vco_id NUMBER(15) NOT NULL,
  vco_shorted_id NUMBER(15),
  vco_cod_subst_inv_quantity NUMBER(7),
  vco_cod_subst_inv_weight NUMBER(8,3),
  vco_ven_next_delivery_date DATE,
  CONSTRAINT vco_pk PRIMARY KEY (vco_id),
  CONSTRAINT vco_ccr_fk FOREIGN KEY (vco_ccr_code) REFERENCES phenix.error_codes (ccr_code),
  CONSTRAINT vco_coh_whs_delivery_fk FOREIGN KEY (vco_coh_whs_delivery_code) REFERENCES phenix.warehouses (whs_code),
  CONSTRAINT vco_coh_whs_picking_fk FOREIGN KEY (vco_cod_whs_picking_code) REFERENCES phenix.warehouses (whs_code),
  CONSTRAINT vco_shorted_fk FOREIGN KEY (vco_shorted_id) REFERENCES phenix.validate_customer_orders (vco_id)
);
COMMENT ON TABLE phenix.validate_customer_orders IS 'Contient les informations temporaires pour les commandes clients';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_coh_cus_code IS 'Numéro de client';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_coh_use_code IS 'Numéro de l''usager';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_coh_approved_switch IS 'Indique si la commandé a été approuvé';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_coh_order_date IS 'Date de la commande';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_coh_use_telemark_code IS 'Numéro de l''usager (Télémarking)';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_coh_message IS 'Message de la commande client';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_coh_reference_number IS 'Numéro de commande d''achat du client';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_cod_coh_id IS 'Numéro de la commande';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_cod_line_number IS 'Ligne de commande';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_cod_prf_prd_code IS 'Code produit';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_cod_prf_fmt_code IS 'Numéro de format';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_cod_base_selling_cost IS 'Coût servant pour le calcul des coûtants plus';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_cod_cost_price IS 'Prix du coûtant';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_cod_order_type IS 'Type de la ligne';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_cod_original_retail IS 'Prix de vente avant le processus de fixation des prix';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_cod_prebook_method IS 'Méthode selon laquelle la commande bulletin est effectuée';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_cod_pricing_source IS 'Source du prix';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_cod_project_delivery_date IS 'Date de livraison projetée';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_cod_promotion_amount IS 'Montant des promotions';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_cod_selling_retail IS 'Prix de vente après le processus de fixation des prix';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_cod_spec_order_status IS 'Status de la commande spéciale';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_cod_surcharge IS 'Supplément monétaire';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_cod_tobacco_tax IS 'Montant de taxe tabac';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_cod_cod_coh_id IS 'Numéro de la commande dont cette ligne fait référence';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_cod_cod_line_number IS 'Numéro de la ligne dont cette ligne fait référence';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_cod_fmt_code_srp IS 'Format du prix de détail suggéré';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_cod_pod_poh_id IS 'Numéro de la facture de commande d''achat';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_cod_pod_line_number IS 'Numéro de la ligne de commande d''achat';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_cod_prf_prd_original_code IS 'Code produit original (si subsitution)';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_cod_prf_fmt_original_code IS 'Code format original (si subsitution)';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_cod_pty_code IS 'Numéro du type de promotion';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_cod_leftover_quantity IS 'Quantité restante d''une commande';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_cod_leftover_weight IS 'Poids restant d''une commande';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_cod_message IS 'Message du détail de la commande client';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_cod_order_quantity IS 'Quantité commandé';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_cod_order_weight IS 'Poids commandé';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_cod_price_srp IS 'Prix de détail suggéré';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_cod_quantity_srp IS 'Quantité du prix de détail suggéré';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_ccr_code IS 'Code d''erreur';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_cod_average_cost_1 IS 'Moyenne des prix du coûtant 1';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_cod_average_cost_2 IS 'Moyenne des prix du coûtant 2';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_cod_average_cost_3 IS 'Moyenne des prix du coûtant 3';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_cod_average_cost_4 IS 'Moyenne des prix du coûtant 4';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_cod_average_list IS 'Moyenne des prix de liste du manufacturier';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_cod_avg_real_cost_1 IS 'Vraie moyenne des prix du coûtant 1';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_cod_avg_real_cost_2 IS 'Vraie moyenne des prix du coûtant 2';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_cod_avg_real_cost_3 IS 'Vraie moyenne des prix du coûtant 3';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_cod_avg_real_cost_4 IS 'Vraie moyenne des prix du coûtant 4';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_cod_avg_real_list IS 'Vrai moyenne des prix de liste du manufacturier';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_reject_and_printed_switch IS 'Indique si la ligne est rejetée et déjà incluse dans le rapport des rejets MSI (pour le delete after-report)';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_cod_customer_product_code IS 'Numero du client pour le produit';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_cod_customer_product_loc IS 'Code de lendroit ou se trouve le produit defini par le client';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_accept_flag IS 'Indique si cette ligne de commande est acceptée malgré le code d''erreur';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_upc_code IS 'Indique le numéro universel de produit (CUP)';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_transfered_product_code IS 'Indique le code du produit directement importé du fichier entrant';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_cod_car_amount IS 'Indique le montant du compteur ("count and recount")';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_inserted_switch IS 'Indique si la ligne a déjà été insérée dans les commandes clients';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_coh_whs_delivery_code IS 'Indique l''entrepôt de livraison';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_cod_whs_picking_code IS 'Indique l''entrepôt de cueillette';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_selling_retail_orig IS 'Indique le prix de vente d''origine apès le processus de fixation des prix.';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_pricing_source_orig IS 'Indique la source de prix d''origine.';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_use_override_code IS 'Indique le code de l''utilisateur qui a effectué le changement.';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_cod_royalty_amount IS 'Indique le montant de royauté lorsque le prix vient d''une soumission';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_cod_desired_quantity IS 'Indique la quantité désirée par le client';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_cod_desired_weight IS 'Indique le poids désiré par le client';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_orig_ven_name IS 'Indique la référence au fournisseur sur la commande originale de la division';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_cod_division_order_switch IS 'Indique si la commande provient d''une livraison indirecte d''une division';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_coh_pci_order_rgf_number IS 'Indique le numéro de commande PCI';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_requested_price IS 'Indique le prix demandé par le client';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_requested_delivery_date IS 'Indique la date de livraison demandée initialement par le client';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_availability_date IS 'Indique la prochaine date de disponibilité du produit';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_display_line_number IS 'Indique le numéro de ligne dans le fichier qui servira d''ordre lors de la création de la commande aussi';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_pxc_code IS 'Indique le code du produit chez le client';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_id IS 'Indique l''identifiant de la ligne de commande';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_shorted_id IS 'Indique le numéro de la ligne à court qui a créé cette ligne de substitution';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_cod_subst_inv_quantity IS 'Indique la quantité disponible du produit de substitution';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_cod_subst_inv_weight IS 'Indique le poids disponible du produit de substitution';
COMMENT ON COLUMN phenix.validate_customer_orders.vco_ven_next_delivery_date IS 'Indique la prochaine date de livraison fournisseur ';