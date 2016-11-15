CREATE TABLE phenix.match_details (
  mad_mah_ap_invoice_number NUMBER(15) NOT NULL,
  mad_line_number NUMBER(6) NOT NULL,
  mad_consignment_price NUMBER(7,2) NOT NULL,
  mad_federal_tax_rate NUMBER(6,3) NOT NULL,
  mad_list_price NUMBER(7,2) NOT NULL,
  mad_promotion_amount NUMBER(6,2) NOT NULL,
  mad_provincial_tax_rate NUMBER(6,3) NOT NULL,
  mad_source VARCHAR2(1 BYTE) NOT NULL CONSTRAINT mad_source_ck CHECK (MAD_SOURCE in ('I', 'S')),
  mad_pod_poh_id NUMBER(15),
  mad_pod_line_number NUMBER(4),
  mad_date_closed DATE,
  mad_difference_price NUMBER(7,2),
  mad_difference_quantity NUMBER(7),
  mad_difference_weight NUMBER(9,3),
  mad_invoiced_quantity NUMBER(7),
  mad_invoiced_weight NUMBER(9,3),
  mad_reference_promotion VARCHAR2(5 BYTE),
  mad_reorder_quantity NUMBER(7),
  mad_reorder_weight NUMBER(9,3),
  CONSTRAINT mad_solid_weight_ck CHECK ((MAD_INVOICED_QUANTITY is not NULL and
MAD_INVOICED_WEIGHT is NULL) or
(MAD_INVOICED_QUANTITY is NULL and
MAD_INVOICED_WEIGHT is not NULL) or
(MAD_INVOICED_QUANTITY is not NULL and
MAD_INVOICED_WEIGHT is not NULL)),
  CONSTRAINT mad_pk PRIMARY KEY (mad_mah_ap_invoice_number,mad_line_number),
  CONSTRAINT mad_mah_fk FOREIGN KEY (mad_mah_ap_invoice_number) REFERENCES phenix.match_headers (mah_ap_invoice_number),
  CONSTRAINT mad_pod_fk FOREIGN KEY (mad_pod_poh_id,mad_pod_line_number) REFERENCES phenix.purchase_order_details (pod_poh_id,pod_line_number)
);
COMMENT ON TABLE phenix.match_details IS 'Contient les informations pour les détails de la marchandise reçue à la ligne de détail';
COMMENT ON COLUMN phenix.match_details.mad_mah_ap_invoice_number IS 'Numéro de l''entête de la reconciliation';
COMMENT ON COLUMN phenix.match_details.mad_line_number IS 'Numéro de ligne de la réconciliation';
COMMENT ON COLUMN phenix.match_details.mad_consignment_price IS 'Prix de la consigne';
COMMENT ON COLUMN phenix.match_details.mad_federal_tax_rate IS 'Taux de la tax fédérale';
COMMENT ON COLUMN phenix.match_details.mad_list_price IS 'Prix de liste du fournisseur';
COMMENT ON COLUMN phenix.match_details.mad_promotion_amount IS 'Montant de la promotion';
COMMENT ON COLUMN phenix.match_details.mad_provincial_tax_rate IS 'Taux de la taxe provinciale';
COMMENT ON COLUMN phenix.match_details.mad_source IS 'Indique si l''enregistrement fut créé électroniquement ou via l''application';
COMMENT ON COLUMN phenix.match_details.mad_pod_poh_id IS 'Numéro de commande d''achat';
COMMENT ON COLUMN phenix.match_details.mad_pod_line_number IS 'Numéro de ligne de commande d''achat';
COMMENT ON COLUMN phenix.match_details.mad_date_closed IS 'Date de fermeture de la ligne';
COMMENT ON COLUMN phenix.match_details.mad_difference_price IS 'Prix qui exécutera une refacturation si non NULL';
COMMENT ON COLUMN phenix.match_details.mad_difference_quantity IS 'Quantité qui exécutera une refacturation si non NULL';
COMMENT ON COLUMN phenix.match_details.mad_difference_weight IS 'Poids qui exécutera une refacturation si non NULL';
COMMENT ON COLUMN phenix.match_details.mad_invoiced_quantity IS 'Quantité facturée';
COMMENT ON COLUMN phenix.match_details.mad_invoiced_weight IS 'Poids facturé';
COMMENT ON COLUMN phenix.match_details.mad_reference_promotion IS 'Référence de la promotion fournisseur';
COMMENT ON COLUMN phenix.match_details.mad_reorder_quantity IS 'Quantité à recommander';
COMMENT ON COLUMN phenix.match_details.mad_reorder_weight IS 'Poids à recommander';