CREATE TABLE phenix.show_orders (
  sor_member VARCHAR2(5 BYTE),
  sor_customer VARCHAR2(15 BYTE),
  sor_order_number VARCHAR2(10 BYTE),
  sor_broker_ven_code VARCHAR2(5 BYTE),
  sor_broker_product_code VARCHAR2(10 BYTE),
  sor_upc_code VARCHAR2(14 BYTE),
  sor_show_sale_price VARCHAR2(6 BYTE),
  sor_quantity_1 VARCHAR2(6 BYTE),
  sor_quantity_2 VARCHAR2(6 BYTE),
  sor_coh_id NUMBER(15),
  sor_poh_id_1 NUMBER(15),
  sor_poh_id_2 NUMBER(15),
  sor_ccr_code NUMBER(5),
  sor_prd_ven_code NUMBER(5),
  CONSTRAINT sor_ccr_fk FOREIGN KEY (sor_ccr_code) REFERENCES phenix.error_codes (ccr_code),
  CONSTRAINT sor_coh_fk FOREIGN KEY (sor_coh_id) REFERENCES phenix.customer_order_headers (coh_id),
  CONSTRAINT sor_poh_1_fk FOREIGN KEY (sor_poh_id_1) REFERENCES phenix.purchase_order_headers (poh_id),
  CONSTRAINT sor_poh_2_fk FOREIGN KEY (sor_poh_id_2) REFERENCES phenix.purchase_order_headers (poh_id)
);
COMMENT ON TABLE phenix.show_orders IS 'Sert à identifier et valider les commandes du show colabor';
COMMENT ON COLUMN phenix.show_orders.sor_member IS 'Code membre';
COMMENT ON COLUMN phenix.show_orders.sor_customer IS 'Code client';
COMMENT ON COLUMN phenix.show_orders.sor_order_number IS 'Numéro de la commande';
COMMENT ON COLUMN phenix.show_orders.sor_broker_ven_code IS 'Code fournisseur du courtier';
COMMENT ON COLUMN phenix.show_orders.sor_broker_product_code IS 'Code produit du fournisseur';
COMMENT ON COLUMN phenix.show_orders.sor_upc_code IS 'Code CUP';
COMMENT ON COLUMN phenix.show_orders.sor_show_sale_price IS 'Prix de vente';
COMMENT ON COLUMN phenix.show_orders.sor_quantity_1 IS 'Quantité 1';
COMMENT ON COLUMN phenix.show_orders.sor_quantity_2 IS 'Quantité 2';
COMMENT ON COLUMN phenix.show_orders.sor_coh_id IS 'Identifiant de la commande client';
COMMENT ON COLUMN phenix.show_orders.sor_poh_id_1 IS 'Identifiant de la commande d''achat #1';
COMMENT ON COLUMN phenix.show_orders.sor_poh_id_2 IS 'Identifiant de la commande d''achat #2';
COMMENT ON COLUMN phenix.show_orders.sor_ccr_code IS 'Code d''erreur';
COMMENT ON COLUMN phenix.show_orders.sor_prd_ven_code IS 'Indique le code du manufacturier du produit';