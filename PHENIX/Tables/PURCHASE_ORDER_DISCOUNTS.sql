CREATE TABLE phenix.purchase_order_discounts (
  pdi_dit_code NUMBER(3) NOT NULL,
  pdi_pod_poh_id NUMBER(15) NOT NULL,
  pdi_pod_line_number NUMBER(4) NOT NULL,
  pdi_cost_affected NUMBER(1) NOT NULL,
  pdi_rebill_switch NUMBER(1) NOT NULL CONSTRAINT pdi_rebill_switch_ck CHECK (PDI_REBILL_SWITCH IN (0, 1)),
  pdi_amount NUMBER(7,2),
  pdi_percent NUMBER(6,3),
  pdi_affect_match_cost_switch NUMBER(1) NOT NULL CONSTRAINT pdi_affect_match_cost_switc_ck CHECK (PDI_AFFECT_MATCH_COST_SWITCH IN (0, 1)),
  pdi_ven_code NUMBER(5) NOT NULL,
  pdi_ven_to_pay_code NUMBER(5) NOT NULL,
  pdi_qualifier VARCHAR2(2 BYTE) DEFAULT 'IT' NOT NULL CONSTRAINT pdi_qualifier_ck CHECK (PDI_QUALIFIER IN ('IT', 'KG', 'KD', 'VO')),
  pdi_skip_invoicing_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT pdi_skip_invoicing_switch_ck CHECK (PDI_SKIP_INVOICING_SWITCH IN (0, 1)),
  CONSTRAINT pdi_amount_percent_ck CHECK ((PDI_AMOUNT is not NULL and
PDI_PERCENT is NULL) or
(PDI_AMOUNT is NULL and
PDI_PERCENT is not NULL)),
  CONSTRAINT pdi_pk PRIMARY KEY (pdi_pod_poh_id,pdi_pod_line_number,pdi_dit_code,pdi_ven_code),
  CONSTRAINT pdi_dit_fk FOREIGN KEY (pdi_dit_code) REFERENCES phenix.discount_types (dit_code),
  CONSTRAINT pdi_pod_fk FOREIGN KEY (pdi_pod_poh_id,pdi_pod_line_number) REFERENCES phenix.purchase_order_details (pod_poh_id,pod_line_number) ON DELETE CASCADE,
  CONSTRAINT pdi_ven_fk FOREIGN KEY (pdi_ven_code) REFERENCES phenix.vendors (ven_code),
  CONSTRAINT pdi_ven_to_pay_fk FOREIGN KEY (pdi_ven_to_pay_code) REFERENCES phenix.vendors (ven_code)
);
COMMENT ON TABLE phenix.purchase_order_discounts IS 'Escomptes à la ligne d''achat';
COMMENT ON COLUMN phenix.purchase_order_discounts.pdi_dit_code IS 'Numéro du type d''escompte';
COMMENT ON COLUMN phenix.purchase_order_discounts.pdi_pod_poh_id IS 'Numéro de l''entête de la commande d''achat';
COMMENT ON COLUMN phenix.purchase_order_discounts.pdi_pod_line_number IS 'Numéro de la ligne de la commande d''achat';
COMMENT ON COLUMN phenix.purchase_order_discounts.pdi_cost_affected IS 'Coût affecté';
COMMENT ON COLUMN phenix.purchase_order_discounts.pdi_rebill_switch IS 'Indique si il y a refacturation';
COMMENT ON COLUMN phenix.purchase_order_discounts.pdi_amount IS 'Montant l''escompte';
COMMENT ON COLUMN phenix.purchase_order_discounts.pdi_percent IS 'Pourcentage de l''escompte';
COMMENT ON COLUMN phenix.purchase_order_discounts.pdi_affect_match_cost_switch IS 'Indique si la valeur est inclus dans la calculation (net) de la réconciliation';
COMMENT ON COLUMN phenix.purchase_order_discounts.pdi_ven_code IS 'Indique le fournisseur donnant l''escompte';
COMMENT ON COLUMN phenix.purchase_order_discounts.pdi_ven_to_pay_code IS 'Indique le fournisseur payable du fournisseur donnant l''escompte (au moment où la commande a été passée)';
COMMENT ON COLUMN phenix.purchase_order_discounts.pdi_qualifier IS 'Qualificatif de l''escompte';
COMMENT ON COLUMN phenix.purchase_order_discounts.pdi_skip_invoicing_switch IS 'Indique s''il y''a facturation';