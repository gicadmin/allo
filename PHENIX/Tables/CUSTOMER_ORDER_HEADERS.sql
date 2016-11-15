CREATE TABLE phenix.customer_order_headers (
  coh_id NUMBER(15) NOT NULL,
  coh_cus_code NUMBER(10) NOT NULL,
  coh_use_code NUMBER(5) NOT NULL,
  coh_approved_switch NUMBER(1) NOT NULL CONSTRAINT coh_approved_switch_ck CHECK (COH_APPROVED_SWITCH IN (0, 1)),
  coh_open_switch NUMBER(1) NOT NULL CONSTRAINT coh_open_switch_ck CHECK (COH_OPEN_SWITCH IN (0, 1)),
  coh_order_date DATE NOT NULL,
  coh_use_telemark_code NUMBER(5),
  coh_message VARCHAR2(100 BYTE),
  coh_reference_number VARCHAR2(15 BYTE),
  coh_credit_approval_switch NUMBER(1) NOT NULL CONSTRAINT coh_credit_approval_switch_ck CHECK (COH_CREDIT_APPROVAL_SWITCH IN (0, 1)),
  coh_use_credit_code NUMBER(5),
  coh_surcharge_per_delivery NUMBER(7,2) DEFAULT 0 NOT NULL,
  coh_cross_dock_switch NUMBER(1) DEFAULT 0 NOT NULL,
  coh_hold_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT coh_hold_switch_ck CHECK (COH_HOLD_SWITCH IN (0,1)),
  coh_delivery_type_flag VARCHAR2(2 BYTE) DEFAULT 'RG' NOT NULL CONSTRAINT coh_delivery_type_flag_ck CHECK (COH_DELIVERY_TYPE_FLAG IN ('RG', 'CX', 'CT', 'PM')),
  coh_delivery_override_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT coh_delivery_override_swi_ck CHECK (COH_DELIVERY_OVERRIDE_SWITCH in (0,1)
		),
  coh_whs_delivery_code VARCHAR2(2 BYTE) NOT NULL,
  coh_credit_hold_reason NUMBER(1),
  coh_orig_ven_name VARCHAR2(35 BYTE),
  coh_pci_order_rgf_number NUMBER(10),
  coh_proposed_delivery_charge NUMBER(7,2) DEFAULT 0 NOT NULL,
  coh_cash_and_carry_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT coh_cash_and_carry_switch_ck CHECK (COH_CASH_AND_CARRY_SWITCH IN (0,1)),
  CONSTRAINT coh_pk PRIMARY KEY (coh_id),
  CONSTRAINT coh_cus_fk FOREIGN KEY (coh_cus_code) REFERENCES phenix.customers (cus_code),
  CONSTRAINT coh_use_credit_fk FOREIGN KEY (coh_use_credit_code) REFERENCES phenix."USERS" (use_code),
  CONSTRAINT coh_use_fk FOREIGN KEY (coh_use_code) REFERENCES phenix."USERS" (use_code),
  CONSTRAINT coh_use_telemark_fk FOREIGN KEY (coh_use_telemark_code) REFERENCES phenix."USERS" (use_code),
  CONSTRAINT coh_whs_delivery_fk FOREIGN KEY (coh_whs_delivery_code) REFERENCES phenix.warehouses (whs_code)
);
COMMENT ON TABLE phenix.customer_order_headers IS 'Entête d''une commande d''un client';
COMMENT ON COLUMN phenix.customer_order_headers.coh_id IS 'Numéro de la commande';
COMMENT ON COLUMN phenix.customer_order_headers.coh_cus_code IS 'Numéro de client';
COMMENT ON COLUMN phenix.customer_order_headers.coh_use_code IS 'Numéro de l''usager';
COMMENT ON COLUMN phenix.customer_order_headers.coh_approved_switch IS 'Indique si la commandé a été approuvé';
COMMENT ON COLUMN phenix.customer_order_headers.coh_open_switch IS 'Indique si la commande est ouverte';
COMMENT ON COLUMN phenix.customer_order_headers.coh_order_date IS 'Date de la commande';
COMMENT ON COLUMN phenix.customer_order_headers.coh_use_telemark_code IS 'Numéro de l''usager (Télémarking)';
COMMENT ON COLUMN phenix.customer_order_headers.coh_message IS 'Message de la commande client';
COMMENT ON COLUMN phenix.customer_order_headers.coh_reference_number IS 'Numéro de commande d''achat du client';
COMMENT ON COLUMN phenix.customer_order_headers.coh_credit_approval_switch IS 'Indique si la commande a été approuvé par le control de crédit';
COMMENT ON COLUMN phenix.customer_order_headers.coh_use_credit_code IS 'Numéro de l''usager (gérant de crédit)';
COMMENT ON COLUMN phenix.customer_order_headers.coh_surcharge_per_delivery IS 'Surcharge de livraison';
COMMENT ON COLUMN phenix.customer_order_headers.coh_cross_dock_switch IS 'Indique si c''est une commande quai à quai';
COMMENT ON COLUMN phenix.customer_order_headers.coh_hold_switch IS 'Indique si un télévendeur traite présentement cette commande';
COMMENT ON COLUMN phenix.customer_order_headers.coh_delivery_type_flag IS 'Indique le type de livraison de la commande (RG = Régulier, PM = Route rapide, CT = Comptoir, CX = Quai à quai)';
COMMENT ON COLUMN phenix.customer_order_headers.coh_delivery_override_switch IS 'Indique si le montant de frais de livraison a été modifié par l''utilisateur';
COMMENT ON COLUMN phenix.customer_order_headers.coh_whs_delivery_code IS 'Indique l''entrepôt de livraison';
COMMENT ON COLUMN phenix.customer_order_headers.coh_credit_hold_reason IS 'Indique la raison pour laquelle la commande doit être validée.';
COMMENT ON COLUMN phenix.customer_order_headers.coh_orig_ven_name IS 'Indique la référence au fournisseur sur la commande originale de la division';
COMMENT ON COLUMN phenix.customer_order_headers.coh_pci_order_rgf_number IS 'Indique la sequence de commande PCI';
COMMENT ON COLUMN phenix.customer_order_headers.coh_proposed_delivery_charge IS 'Indique la surcharge de livraison proposée par le système';
COMMENT ON COLUMN phenix.customer_order_headers.coh_cash_and_carry_switch IS 'Indique si la commande est payer et emporter';