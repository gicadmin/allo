CREATE GLOBAL TEMPORARY TABLE phenix.temporary_detail_potentials (
  tdp_cod_coh_id NUMBER(15),
  tdp_cod_line_number NUMBER(4),
  tdp_ordered_quantity NUMBER(7),
  tdp_ordered_weight NUMBER(9,3),
  tdp_leftover_quantity NUMBER(7),
  tdp_leftover_weight NUMBER(9,3),
  tdp_suggested_quantity NUMBER(7),
  tdp_suggested_weight NUMBER(9,3),
  tdp_to_deliver_quantity NUMBER(7),
  tdp_to_deliver_weight NUMBER(9,3),
  tdp_cod_process_flag NUMBER(1),
  tdp_cus_code NUMBER(10),
  tdp_cod_order_type VARCHAR2(2 BYTE),
  tdp_cod_prebook_method VARCHAR2(2 BYTE),
  tdp_cod_prf_prd_code VARCHAR2(10 BYTE),
  tdp_cod_prf_fmt_code VARCHAR2(7 BYTE),
  tdp_cod_selling_retail NUMBER(7,2),
  tdp_prd_description VARCHAR2(45 BYTE),
  tdp_prd_definition VARCHAR2(1 BYTE),
  tdp_prf_description VARCHAR2(30 BYTE),
  tdp_prf_conversion_to_base NUMBER(8),
  tdp_prf_height NUMBER(8,3),
  tdp_prf_width NUMBER(8,3),
  tdp_prf_length NUMBER(8,3),
  tdp_brand_or_ven_name VARCHAR2(15 BYTE),
  tdp_prf_purchase_weight NUMBER(8,3),
  tdp_cod_pty_code NUMBER(3),
  tdp_cod_spec_order_status VARCHAR2(2 BYTE),
  tdp_fmt_short_code VARCHAR2(2 BYTE),
  tdp_coh_was_chosen_switch NUMBER(1),
  tdp_cod_customer_po_number VARCHAR2(15 BYTE),
  tdp_coh_message VARCHAR2(100 BYTE),
  tdp_whc_code VARCHAR2(2 BYTE),
  tdp_cod_customer_po_line NUMBER(4),
  tdp_twin_line_switch NUMBER(1) DEFAULT 0 NOT NULL,
  tdp_coh_whs_delivery_code VARCHAR2(2 BYTE),
  tdp_cod_whs_picking_code VARCHAR2(2 BYTE)
)
ON COMMIT PRESERVE ROWS;
COMMENT ON COLUMN phenix.temporary_detail_potentials.tdp_cod_coh_id IS 'Indique le numéro de commande client interne';
COMMENT ON COLUMN phenix.temporary_detail_potentials.tdp_cod_line_number IS 'Indique le numéro de ligne de la commande client';
COMMENT ON COLUMN phenix.temporary_detail_potentials.tdp_ordered_quantity IS 'Indique la quantité commandée par le client';
COMMENT ON COLUMN phenix.temporary_detail_potentials.tdp_ordered_weight IS 'Indique le poids commandé par le client';
COMMENT ON COLUMN phenix.temporary_detail_potentials.tdp_leftover_quantity IS 'Indique la quantité restante sur la commande client';
COMMENT ON COLUMN phenix.temporary_detail_potentials.tdp_leftover_weight IS 'Indique le poids restant sur la commande client';
COMMENT ON COLUMN phenix.temporary_detail_potentials.tdp_suggested_quantity IS 'Indique la quantité suggérée pour la livraison de la commande client';
COMMENT ON COLUMN phenix.temporary_detail_potentials.tdp_suggested_weight IS 'Indique le poids suggéré pour la livraison de la commande client';
COMMENT ON COLUMN phenix.temporary_detail_potentials.tdp_to_deliver_quantity IS 'Indique la quantité à livrer pour la commande client';
COMMENT ON COLUMN phenix.temporary_detail_potentials.tdp_to_deliver_weight IS 'Indique le poids à livrer pour la commande client';
COMMENT ON COLUMN phenix.temporary_detail_potentials.tdp_cod_process_flag IS 'Indique si la ligne en cours est sélectionnée';
COMMENT ON COLUMN phenix.temporary_detail_potentials.tdp_cus_code IS 'Indique le code du client';
COMMENT ON COLUMN phenix.temporary_detail_potentials.tdp_cod_order_type IS 'Indique le type de la ligne de commande';
COMMENT ON COLUMN phenix.temporary_detail_potentials.tdp_cod_prebook_method IS 'Indique la méthode de bulletin utilisée pour la ligne de commande';
COMMENT ON COLUMN phenix.temporary_detail_potentials.tdp_cod_prf_prd_code IS 'Indique le code du produit commandé';
COMMENT ON COLUMN phenix.temporary_detail_potentials.tdp_cod_prf_fmt_code IS 'Indique le code de format du produit commandé';
COMMENT ON COLUMN phenix.temporary_detail_potentials.tdp_cod_selling_retail IS 'Indique le prix de vente du produit commandé';
COMMENT ON COLUMN phenix.temporary_detail_potentials.tdp_prd_description IS 'Indique la description du produit commandé';
COMMENT ON COLUMN phenix.temporary_detail_potentials.tdp_prd_definition IS 'Indique la définition du produit commandé';
COMMENT ON COLUMN phenix.temporary_detail_potentials.tdp_prf_description IS 'Indique l''empaquetage du produit format commandé';
COMMENT ON COLUMN phenix.temporary_detail_potentials.tdp_prf_conversion_to_base IS 'Indique le facteur de conversion du produit format commandé';
COMMENT ON COLUMN phenix.temporary_detail_potentials.tdp_prf_height IS 'Indique la hauteur du produit format commandé';
COMMENT ON COLUMN phenix.temporary_detail_potentials.tdp_prf_width IS 'Indique la largeur du produit format commandé';
COMMENT ON COLUMN phenix.temporary_detail_potentials.tdp_prf_length IS 'Indique la longueur du produit format commandé';
COMMENT ON COLUMN phenix.temporary_detail_potentials.tdp_brand_or_ven_name IS 'Indique le nom de la marque ou du manufacturier du produit';
COMMENT ON COLUMN phenix.temporary_detail_potentials.tdp_prf_purchase_weight IS 'Indique le poids à l''achat du produit format commandé';
COMMENT ON COLUMN phenix.temporary_detail_potentials.tdp_cod_pty_code IS 'Indique le type de promotion pour la ligne de commande client';
COMMENT ON COLUMN phenix.temporary_detail_potentials.tdp_cod_spec_order_status IS 'Indique le statut de la ligne de commande si le produit est en commande spéciale';
COMMENT ON COLUMN phenix.temporary_detail_potentials.tdp_fmt_short_code IS 'Indique le code court du format';
COMMENT ON COLUMN phenix.temporary_detail_potentials.tdp_coh_was_chosen_switch IS 'Indique si la commande client a été sélectionnée';
COMMENT ON COLUMN phenix.temporary_detail_potentials.tdp_cod_customer_po_number IS 'Indique le numéro de commande selon le client';
COMMENT ON COLUMN phenix.temporary_detail_potentials.tdp_coh_message IS 'Indique le message de la commande client';
COMMENT ON COLUMN phenix.temporary_detail_potentials.tdp_whc_code IS 'Indique le type d''entreposage du produit format commandé';
COMMENT ON COLUMN phenix.temporary_detail_potentials.tdp_cod_customer_po_line IS 'Indique le numéro de ligne de commande selon le client';
COMMENT ON COLUMN phenix.temporary_detail_potentials.tdp_twin_line_switch IS 'Indique que la ligne de commande client originale a du être partagée en deux (doublée) pour des raisons de différence de prix (habituellement pour les réservations pige)';
COMMENT ON COLUMN phenix.temporary_detail_potentials.tdp_coh_whs_delivery_code IS 'Indique le code de l''entrepôt de livraison';
COMMENT ON COLUMN phenix.temporary_detail_potentials.tdp_cod_whs_picking_code IS 'Indique le code de l''entrepôt de cueillette';