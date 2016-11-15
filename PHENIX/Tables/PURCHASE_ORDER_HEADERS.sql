CREATE TABLE phenix.purchase_order_headers (
  poh_id NUMBER(15) NOT NULL,
  poh_use_code NUMBER(5) NOT NULL,
  poh_ven_to_pay_code NUMBER(5) NOT NULL,
  poh_ven_purchase_code NUMBER(5) NOT NULL,
  poh_expected_recep_date DATE NOT NULL,
  poh_order_date DATE NOT NULL,
  poh_prebook_switch NUMBER(1) NOT NULL CONSTRAINT poh_prebook_switch_ck CHECK (POH_PREBOOK_SWITCH IN (0, 1)),
  poh_status VARCHAR2(2 BYTE) NOT NULL CONSTRAINT poh_status_ck CHECK (POH_STATUS IN ('OP', 'CA', 'ST', 'RC', 'PA')),
  poh_transport_cost NUMBER(6,2) NOT NULL,
  poh_prv_code VARCHAR2(2 BYTE),
  poh_cancel_date DATE,
  poh_message VARCHAR2(100 BYTE),
  poh_pickup_address VARCHAR2(45 BYTE),
  poh_pickup_city VARCHAR2(30 BYTE),
  poh_pickup_postal_code VARCHAR2(10 BYTE),
  poh_sent_date DATE,
  poh_indirect_delivery_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT poh_indirect_delivery_swi_ck CHECK (POH_INDIRECT_DELIVERY_SWITCH IN (0, 1)),
  poh_original_delivery_date DATE,
  poh_whs_code VARCHAR2(2 BYTE) NOT NULL,
  poh_pickup_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT poh_pickup_switch_ck CHECK (POH_PICKUP_SWITCH IN (0, 1)),
  poh_pickup_reference VARCHAR2(15 BYTE),
  poh_division_order_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT poh_division_order_switch_ck CHECK (POH_DIVISION_ORDER_SWITCH IN (0, 1)),
  poh_cus_po_number VARCHAR2(15 BYTE),
  poh_reopened_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT poh_reopened_switch_ck CHECK (POH_REOPENED_SWITCH IN (0, 1)),
  poh_inh_id NUMBER(15),
  poh_is_send_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT poh_is_send_switch_ck CHECK (POH_IS_SEND_SWITCH IN (0,1)),
  poh_created_on_receipt_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT poh_created_on_receipt_swi_ck CHECK (POH_CREATED_ON_RECEIPT_SWITCH IN (0,1)),
  poh_inventory_avalability_date DATE DEFAULT trunc(SYSDATE) NOT NULL,
  poh_unloaded_packages_charged NUMBER(7),
  poh_reception_charge NUMBER(7,2),
  CONSTRAINT poh_sent_date_ck CHECK ((POH_SENT_DATE >=
 POH_ORDER_DATE)),
  CONSTRAINT poh_pk PRIMARY KEY (poh_id),
  CONSTRAINT poh_inh_fk FOREIGN KEY (poh_inh_id) REFERENCES phenix.invoice_headers (inh_id),
  CONSTRAINT poh_prv_fk FOREIGN KEY (poh_prv_code) REFERENCES phenix.provinces (prv_code),
  CONSTRAINT poh_use_fk FOREIGN KEY (poh_use_code) REFERENCES phenix."USERS" (use_code),
  CONSTRAINT poh_ven_purchase_fk FOREIGN KEY (poh_ven_purchase_code) REFERENCES phenix.vendors (ven_code),
  CONSTRAINT poh_ven_to_pay_fk FOREIGN KEY (poh_ven_to_pay_code) REFERENCES phenix.vendors (ven_code),
  CONSTRAINT poh_whs_fk FOREIGN KEY (poh_whs_code) REFERENCES phenix.warehouses (whs_code)
);
COMMENT ON TABLE phenix.purchase_order_headers IS 'Entête d''une commande d''achat';
COMMENT ON COLUMN phenix.purchase_order_headers.poh_id IS 'Numéro de la commande d''achat';
COMMENT ON COLUMN phenix.purchase_order_headers.poh_use_code IS 'Numéro de l''usager (Acheteur)';
COMMENT ON COLUMN phenix.purchase_order_headers.poh_ven_to_pay_code IS 'Numéro du fournisseur à payer';
COMMENT ON COLUMN phenix.purchase_order_headers.poh_ven_purchase_code IS 'Numéro du fournisseur à l''achat';
COMMENT ON COLUMN phenix.purchase_order_headers.poh_expected_recep_date IS 'Date de réception attendue';
COMMENT ON COLUMN phenix.purchase_order_headers.poh_order_date IS 'Date de commande';
COMMENT ON COLUMN phenix.purchase_order_headers.poh_prebook_switch IS 'Indique si la commande est une commande bulletin';
COMMENT ON COLUMN phenix.purchase_order_headers.poh_status IS 'Status de la commande';
COMMENT ON COLUMN phenix.purchase_order_headers.poh_transport_cost IS 'Coût de transport';
COMMENT ON COLUMN phenix.purchase_order_headers.poh_prv_code IS 'Numéro de la province du lieu de cueillette';
COMMENT ON COLUMN phenix.purchase_order_headers.poh_cancel_date IS 'Date de cancellation';
COMMENT ON COLUMN phenix.purchase_order_headers.poh_message IS 'Message de l''entête de commande d''achat';
COMMENT ON COLUMN phenix.purchase_order_headers.poh_pickup_address IS 'Adresse du lieu de cueillette';
COMMENT ON COLUMN phenix.purchase_order_headers.poh_pickup_city IS 'Ville du lieu de cueillette';
COMMENT ON COLUMN phenix.purchase_order_headers.poh_pickup_postal_code IS 'Code postal du lieu de cueillette';
COMMENT ON COLUMN phenix.purchase_order_headers.poh_sent_date IS 'Date d''envoi';
COMMENT ON COLUMN phenix.purchase_order_headers.poh_indirect_delivery_switch IS 'Numéro ASN';
COMMENT ON COLUMN phenix.purchase_order_headers.poh_original_delivery_date IS 'Indique la date de livraison originale ';
COMMENT ON COLUMN phenix.purchase_order_headers.poh_whs_code IS 'Indique le code de l''entrepôt';
COMMENT ON COLUMN phenix.purchase_order_headers.poh_pickup_switch IS 'Indique si la commande doit être ramassée chez le fournisseur';
COMMENT ON COLUMN phenix.purchase_order_headers.poh_pickup_reference IS 'Indique le numéro de référence lors du ramassage chez le fournisseur';
COMMENT ON COLUMN phenix.purchase_order_headers.poh_division_order_switch IS 'Indique si la commande provient d''une livraison indirecte d''une division';
COMMENT ON COLUMN phenix.purchase_order_headers.poh_cus_po_number IS 'Indique le numéro de PO originale envoyée par la division ';
COMMENT ON COLUMN phenix.purchase_order_headers.poh_reopened_switch IS 'Indique si la commande d''achat a été réouverte après avoir été envoyée';
COMMENT ON COLUMN phenix.purchase_order_headers.poh_inh_id IS 'Indique le numéro de facture pour les charges de réception';
COMMENT ON COLUMN phenix.purchase_order_headers.poh_is_send_switch IS 'Indique si le bon de commande a été envoyé';
COMMENT ON COLUMN phenix.purchase_order_headers.poh_created_on_receipt_switch IS 'Indique si le bon de commande est crée pendant la réception';
COMMENT ON COLUMN phenix.purchase_order_headers.poh_inventory_avalability_date IS 'Indique la date ou les produits commandés seront disponibles en inventaire';
COMMENT ON COLUMN phenix.purchase_order_headers.poh_unloaded_packages_charged IS 'Indique le nombre de colis de cette commande d''achat qui se trouve sur une facture fournisseur de type ''RC'' pour les frais de déchargement d''un camion  ';
COMMENT ON COLUMN phenix.purchase_order_headers.poh_reception_charge IS 'Indique le montant qui a été chargé par item reçu lors de la facturation pour les frais de déchargement d''un camion  ';