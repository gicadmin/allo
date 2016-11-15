CREATE TABLE phenix.vend_order_agreement_reclaims (
  voar_id NUMBER(15) NOT NULL,
  voar_qualifier VARCHAR2(4 BYTE) NOT NULL CONSTRAINT voar_qualifier_ck CHECK (VOAR_QUALIFIER IN ('TPAH', 'TPAB', 'OAGR')),
  voar_ven_code NUMBER(5) NOT NULL,
  voar_cod_coh_id NUMBER(15),
  voar_cod_line_number NUMBER(15),
  voar_cad_id NUMBER(15),
  voar_voad_id NUMBER(15),
  voar_vbd_id NUMBER(15),
  voar_purch_allocation NUMBER(7,2) NOT NULL,
  voar_sales_allocation NUMBER(7,2) NOT NULL,
  voar_invoiced_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT voar_invoiced_switch_ck CHECK (VOAR_INVOICED_SWITCH IN (0, 1)),
  voar_creation_date DATE DEFAULT SYSDATE NOT NULL,
  CONSTRAINT voar_cod_cad_ck CHECK (((VOAR_COD_COH_ID IS NOT NULL AND VOAR_COD_LINE_NUMBER IS NOT NULL AND VOAR_CAD_ID IS NULL)
                                      OR (VOAR_COD_COH_ID IS NULL AND VOAR_COD_LINE_NUMBER IS NULL AND VOAR_CAD_ID IS NOT NULL))),
  CONSTRAINT voar_pk PRIMARY KEY (voar_id) USING INDEX (CREATE UNIQUE INDEX phenix.voar_pk_i ON phenix.vend_order_agreement_reclaims(voar_id)    ),
  CONSTRAINT voar_uk UNIQUE (voar_cod_coh_id,voar_cod_line_number,voar_cad_id,voar_voad_id),
  CONSTRAINT voar_cad_fk FOREIGN KEY (voar_cad_id) REFERENCES phenix.customer_adjustment_details (cad_id),
  CONSTRAINT voar_cod_fk FOREIGN KEY (voar_cod_coh_id,voar_cod_line_number) REFERENCES phenix.customer_order_details (cod_coh_id,cod_line_number),
  CONSTRAINT voar_vbd_fk FOREIGN KEY (voar_vbd_id) REFERENCES phenix.vendor_billing_details (vbd_id) ON DELETE SET NULL,
  CONSTRAINT voar_ven_fk FOREIGN KEY (voar_ven_code) REFERENCES phenix.vendors (ven_code),
  CONSTRAINT voar_voad_fk FOREIGN KEY (voar_voad_id) REFERENCES phenix.vend_order_agreement_details (voad_id)
);
COMMENT ON TABLE phenix.vend_order_agreement_reclaims IS 'Table des ententes partenaires appliquées sur des commandes';
COMMENT ON COLUMN phenix.vend_order_agreement_reclaims.voar_id IS 'Indique l''identifiant unique';
COMMENT ON COLUMN phenix.vend_order_agreement_reclaims.voar_qualifier IS 'Indique le type d''entente partenaire pour cette réclamation';
COMMENT ON COLUMN phenix.vend_order_agreement_reclaims.voar_ven_code IS 'Indique le code du fournisseur de l''entente partenaire';
COMMENT ON COLUMN phenix.vend_order_agreement_reclaims.voar_cod_coh_id IS 'Indique le numéro de la commande client';
COMMENT ON COLUMN phenix.vend_order_agreement_reclaims.voar_cod_line_number IS 'Indique le numéro de ligne de la commande client';
COMMENT ON COLUMN phenix.vend_order_agreement_reclaims.voar_cad_id IS 'Indique l''identifiant de la ligne de crédit';
COMMENT ON COLUMN phenix.vend_order_agreement_reclaims.voar_voad_id IS 'Indique l''identifiant unique de la ligne de détails d''entente partenaire utilisée';
COMMENT ON COLUMN phenix.vend_order_agreement_reclaims.voar_vbd_id IS 'Indique le numéro de ligne de la facture de l''entente partenaire';
COMMENT ON COLUMN phenix.vend_order_agreement_reclaims.voar_purch_allocation IS 'Indique le montant d''allocation déjà appliqué sur l''achat du produit par le distributeur';
COMMENT ON COLUMN phenix.vend_order_agreement_reclaims.voar_sales_allocation IS 'Indique le montant d''allocation à la vente';
COMMENT ON COLUMN phenix.vend_order_agreement_reclaims.voar_invoiced_switch IS 'Indique si la ligne a passé par la facturation ''OA''';
COMMENT ON COLUMN phenix.vend_order_agreement_reclaims.voar_creation_date IS 'Indique la date de création';