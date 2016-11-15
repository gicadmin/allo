CREATE TABLE phenix.shopping_cart_order_details (
  scod_id NUMBER(15) NOT NULL,
  scod_scoh_id NUMBER(15) NOT NULL,
  scod_prf_prd_code VARCHAR2(10 BYTE) NOT NULL,
  scod_prf_fmt_code VARCHAR2(7 BYTE) NOT NULL,
  scod_desired_quantity NUMBER(7),
  scod_desired_weight NUMBER(8,3),
  scod_ordered_quantity NUMBER(7),
  scod_ordered_weight NUMBER(8,3),
  scod_message VARCHAR2(100 BYTE),
  scod_creation_date DATE DEFAULT SYSDATE NOT NULL,
  scod_modification_date DATE DEFAULT SYSDATE NOT NULL,
  CONSTRAINT scod_pk PRIMARY KEY (scod_id),
  CONSTRAINT scod_prf_fk FOREIGN KEY (scod_prf_prd_code,scod_prf_fmt_code) REFERENCES phenix.product_formats (prf_prd_code,prf_fmt_code) ON DELETE CASCADE,
  CONSTRAINT scoh_scod_fk FOREIGN KEY (scod_scoh_id) REFERENCES phenix.shopping_cart_order_headers (scoh_id) ON DELETE CASCADE
);
COMMENT ON TABLE phenix.shopping_cart_order_details IS 'Table des détails de la commande du panier';
COMMENT ON COLUMN phenix.shopping_cart_order_details.scod_id IS 'Indique l''identifiant unique du détail de la commande';
COMMENT ON COLUMN phenix.shopping_cart_order_details.scod_scoh_id IS 'Indique l''identifiant de l''entête de la commande';
COMMENT ON COLUMN phenix.shopping_cart_order_details.scod_prf_prd_code IS 'Indique le code du produit';
COMMENT ON COLUMN phenix.shopping_cart_order_details.scod_prf_fmt_code IS 'Indique le code du format';
COMMENT ON COLUMN phenix.shopping_cart_order_details.scod_desired_quantity IS 'Indique la quantité désirée par le client';
COMMENT ON COLUMN phenix.shopping_cart_order_details.scod_desired_weight IS 'Indique le poids désiré par le client';
COMMENT ON COLUMN phenix.shopping_cart_order_details.scod_ordered_quantity IS 'Indique la quantité commandée';
COMMENT ON COLUMN phenix.shopping_cart_order_details.scod_ordered_weight IS 'Indique le poids commandé';
COMMENT ON COLUMN phenix.shopping_cart_order_details.scod_message IS 'Indique le message du détail de la commande client';
COMMENT ON COLUMN phenix.shopping_cart_order_details.scod_creation_date IS 'Indique la date de création';
COMMENT ON COLUMN phenix.shopping_cart_order_details.scod_modification_date IS 'Indique la date de modification';