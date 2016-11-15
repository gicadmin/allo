CREATE TABLE phenix.temporary_pick_details (
  tpd_cod_coh_id NUMBER(15),
  tpd_cod_line_number NUMBER(4),
  tpd_ordered_quantity NUMBER(7),
  tpd_ordered_weight NUMBER(9,3),
  tpd_leftover_quantity NUMBER(7),
  tpd_leftover_weight NUMBER(9,3),
  tpd_suggested_quantity NUMBER(7),
  tpd_suggested_weight NUMBER(9,3),
  tpd_to_deliver_quantity NUMBER(7),
  tpd_to_deliver_weight NUMBER(9,3),
  tpd_cod_process_flag NUMBER(1),
  tpd_cus_code NUMBER(10),
  tpd_cod_order_type VARCHAR2(2 BYTE),
  tpd_cod_prebook_method VARCHAR2(2 BYTE),
  tpd_cod_prf_prd_code VARCHAR2(10 BYTE),
  tpd_cod_prf_fmt_code VARCHAR2(7 BYTE),
  tpd_cod_selling_retail NUMBER(7,2),
  tpd_prd_description VARCHAR2(45 BYTE),
  tpd_prd_definition VARCHAR2(1 BYTE),
  tpd_prf_description VARCHAR2(30 BYTE),
  tpd_prf_conversion_to_base NUMBER(8),
  tpd_prf_height NUMBER(8,3),
  tpd_prf_width NUMBER(8,3),
  tpd_prf_length NUMBER(8,3),
  tpd_prf_purchase_weight NUMBER(8,3),
  tpd_fmt_short_code VARCHAR2(2 BYTE),
  tpd_marque_manuf VARCHAR2(15 BYTE),
  tpd_cod_pty_code NUMBER(3),
  tpd_cod_spec_order_status VARCHAR2(2 BYTE),
  tpd_coh_was_chosen_switch NUMBER(1),
  tpd_cod_customer_po_number VARCHAR2(15 BYTE),
  tpd_coh_message VARCHAR2(100 BYTE),
  tpd_whc_code VARCHAR2(2 BYTE),
  tpd_cod_customer_po_line NUMBER(4),
  tpd_jumelle_line_switch NUMBER(1) DEFAULT 0 NOT NULL,
  tpd_coh_whs_delivery_code VARCHAR2(2 BYTE),
  tpd_cod_whs_picking_code VARCHAR2(2 BYTE),
  tpd_cod_project_delivery_date DATE
);
COMMENT ON TABLE phenix.temporary_pick_details IS 'Table temporaire pour la sélection de commandes à livrer';
COMMENT ON COLUMN phenix.temporary_pick_details.tpd_cod_coh_id IS 'Numéro de la commande';
COMMENT ON COLUMN phenix.temporary_pick_details.tpd_cod_line_number IS 'Numéro de la ligne de commande';
COMMENT ON COLUMN phenix.temporary_pick_details.tpd_ordered_quantity IS 'La quantité commandée';
COMMENT ON COLUMN phenix.temporary_pick_details.tpd_ordered_weight IS 'Le poids commandé';
COMMENT ON COLUMN phenix.temporary_pick_details.tpd_leftover_quantity IS 'La quantité restante';
COMMENT ON COLUMN phenix.temporary_pick_details.tpd_leftover_weight IS 'Le poids restant';
COMMENT ON COLUMN phenix.temporary_pick_details.tpd_suggested_quantity IS 'La quantité suggérée';
COMMENT ON COLUMN phenix.temporary_pick_details.tpd_suggested_weight IS 'Le poids suggéré';
COMMENT ON COLUMN phenix.temporary_pick_details.tpd_to_deliver_quantity IS 'La quantité à livrer';
COMMENT ON COLUMN phenix.temporary_pick_details.tpd_to_deliver_weight IS 'Le poids à livrer';
COMMENT ON COLUMN phenix.temporary_pick_details.tpd_cod_process_flag IS 'Indique l"état de la commande';
COMMENT ON COLUMN phenix.temporary_pick_details.tpd_cus_code IS 'Indique le code du client concerné par la ligne';
COMMENT ON COLUMN phenix.temporary_pick_details.tpd_cod_order_type IS 'Indique le type de commande';
COMMENT ON COLUMN phenix.temporary_pick_details.tpd_cod_prebook_method IS 'Indique la méthode de bulletin utilisée';
COMMENT ON COLUMN phenix.temporary_pick_details.tpd_cod_prf_prd_code IS 'Indique le code du produit';
COMMENT ON COLUMN phenix.temporary_pick_details.tpd_cod_prf_fmt_code IS 'Indique le code du format';
COMMENT ON COLUMN phenix.temporary_pick_details.tpd_cod_selling_retail IS 'Indique le prix du produit format';
COMMENT ON COLUMN phenix.temporary_pick_details.tpd_prd_description IS 'Indique la description du produit';
COMMENT ON COLUMN phenix.temporary_pick_details.tpd_prd_definition IS 'Indique le code de définition du produit (D,F,B,S)';
COMMENT ON COLUMN phenix.temporary_pick_details.tpd_prf_description IS 'Indique la description de l''empaquetage du produit format';
COMMENT ON COLUMN phenix.temporary_pick_details.tpd_prf_conversion_to_base IS 'Indique la conversion vers le format d''inventaire';
COMMENT ON COLUMN phenix.temporary_pick_details.tpd_prf_height IS 'Indique la hauteur du produit format';
COMMENT ON COLUMN phenix.temporary_pick_details.tpd_prf_width IS 'Indique la largeur du produit format';
COMMENT ON COLUMN phenix.temporary_pick_details.tpd_prf_length IS 'Indique la longueur du produit format';
COMMENT ON COLUMN phenix.temporary_pick_details.tpd_prf_purchase_weight IS 'Indique le poids d''achat du produit format';
COMMENT ON COLUMN phenix.temporary_pick_details.tpd_fmt_short_code IS 'Indique le code court du format du produit';
COMMENT ON COLUMN phenix.temporary_pick_details.tpd_marque_manuf IS 'Indique le nom de la marque ou du manufacturier du produit';
COMMENT ON COLUMN phenix.temporary_pick_details.tpd_cod_pty_code IS 'Indique le type de promotion utilisé sur la commande';
COMMENT ON COLUMN phenix.temporary_pick_details.tpd_cod_spec_order_status IS 'Indique le statut de la ligne si c''est une commande spéciale';
COMMENT ON COLUMN phenix.temporary_pick_details.tpd_coh_was_chosen_switch IS 'Indique la zone sélectionnée pour la génération de pick list';
COMMENT ON COLUMN phenix.temporary_pick_details.tpd_cod_customer_po_number IS 'Indique le numéro de PO selon le client';
COMMENT ON COLUMN phenix.temporary_pick_details.tpd_coh_message IS 'Message initial sur la commande client';
COMMENT ON COLUMN phenix.temporary_pick_details.tpd_whc_code IS 'Indique la zone du produit de la ligne de commande';
COMMENT ON COLUMN phenix.temporary_pick_details.tpd_cod_customer_po_line IS 'Numéro de ligne sur le PO du client';
COMMENT ON COLUMN phenix.temporary_pick_details.tpd_jumelle_line_switch IS 'Indique si la ligne représente plusieurs lignes jumelles';
COMMENT ON COLUMN phenix.temporary_pick_details.tpd_coh_whs_delivery_code IS 'Indique le code de l''entrepôt de livraison';
COMMENT ON COLUMN phenix.temporary_pick_details.tpd_cod_whs_picking_code IS 'Indique le code de l''entrepôt de cueillette';
COMMENT ON COLUMN phenix.temporary_pick_details.tpd_cod_project_delivery_date IS 'Indique la date de livraison projetée';