CREATE TABLE phenix.division_discounts (
  dvt_dit_code NUMBER(3) NOT NULL,
  dvt_ar_drop_discounts VARCHAR2(40 BYTE) NOT NULL,
  dvt_ar_warehouse_discounts VARCHAR2(40 BYTE) NOT NULL,
  dvt_div_id NUMBER(15) NOT NULL,
  CONSTRAINT dvt_pk PRIMARY KEY (dvt_div_id,dvt_dit_code),
  CONSTRAINT dvt_dit_fk FOREIGN KEY (dvt_dit_code) REFERENCES phenix.discount_types (dit_code),
  CONSTRAINT dvt_div_fk FOREIGN KEY (dvt_div_id) REFERENCES phenix.divisions (div_id) ON DELETE CASCADE
);
COMMENT ON TABLE phenix.division_discounts IS 'Contient les informations des numéros de comptes GL selon les  différente escomptes fournisseurs';
COMMENT ON COLUMN phenix.division_discounts.dvt_dit_code IS 'Code des types d''escomptes fournisseurs';
COMMENT ON COLUMN phenix.division_discounts.dvt_ar_drop_discounts IS 'Compte à recevoir aux escomptes de livraison directe';
COMMENT ON COLUMN phenix.division_discounts.dvt_ar_warehouse_discounts IS 'Compte à recevoir aux escomptes entrepôt';
COMMENT ON COLUMN phenix.division_discounts.dvt_div_id IS 'Indique l''identifiant unique de la division';