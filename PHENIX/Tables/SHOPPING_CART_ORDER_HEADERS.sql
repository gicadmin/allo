CREATE TABLE phenix.shopping_cart_order_headers (
  scoh_id NUMBER(15) NOT NULL,
  scoh_order_ref_number NUMBER(10) NOT NULL,
  scoh_cus_code NUMBER(10) NOT NULL,
  scoh_ause_id NUMBER(15) NOT NULL,
  scoh_project_delivery_date DATE NOT NULL,
  scoh_status VARCHAR2(1 BYTE) NOT NULL CONSTRAINT scoh_status_ck CHECK (SCOH_STATUS IN ('D', 'W')),
  scoh_message VARCHAR2(100 BYTE),
  scoh_creation_date DATE DEFAULT SYSDATE NOT NULL,
  scoh_modification_date DATE DEFAULT SYSDATE NOT NULL,
  scoh_customer_order_number VARCHAR2(15 BYTE),
  CONSTRAINT scoh_pk PRIMARY KEY (scoh_id),
  CONSTRAINT scoh_ause_fk FOREIGN KEY (scoh_ause_id) REFERENCES phenix.application_users (ause_id) ON DELETE CASCADE,
  CONSTRAINT scoh_cus_fk FOREIGN KEY (scoh_cus_code) REFERENCES phenix.customers (cus_code) ON DELETE CASCADE
);
COMMENT ON TABLE phenix.shopping_cart_order_headers IS 'Table de l''entête de la commande du panier';
COMMENT ON COLUMN phenix.shopping_cart_order_headers.scoh_id IS 'Indique l''identifiant unique de l''entête de la commande';
COMMENT ON COLUMN phenix.shopping_cart_order_headers.scoh_order_ref_number IS 'Indique le numéro de commande PCI';
COMMENT ON COLUMN phenix.shopping_cart_order_headers.scoh_cus_code IS 'Indique le numéro du client';
COMMENT ON COLUMN phenix.shopping_cart_order_headers.scoh_ause_id IS 'Indique l''utilisateur d''application';
COMMENT ON COLUMN phenix.shopping_cart_order_headers.scoh_project_delivery_date IS 'Indique la date de livraison projetée';
COMMENT ON COLUMN phenix.shopping_cart_order_headers.scoh_status IS 'Indique le statut de la commande';
COMMENT ON COLUMN phenix.shopping_cart_order_headers.scoh_message IS 'Indique le message de la commande client';
COMMENT ON COLUMN phenix.shopping_cart_order_headers.scoh_creation_date IS 'Indique la date de création';
COMMENT ON COLUMN phenix.shopping_cart_order_headers.scoh_modification_date IS 'Indique la date de modification';
COMMENT ON COLUMN phenix.shopping_cart_order_headers.scoh_customer_order_number IS 'Indique le numéro de référence pour la commande chez le client';