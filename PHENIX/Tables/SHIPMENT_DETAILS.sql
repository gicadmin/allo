CREATE TABLE phenix.shipment_details (
  shd_id NUMBER(15) NOT NULL,
  shd_shh_id NUMBER(15) NOT NULL,
  shd_container_id NUMBER(12) NOT NULL,
  shd_prf_prd_code VARCHAR2(10 BYTE) NOT NULL,
  shd_prf_fmt_code VARCHAR2(7 BYTE) NOT NULL,
  shd_shipped_quantity NUMBER(7),
  shd_shipped_weight NUMBER(10,3),
  shd_pmh_id NUMBER(15),
  shd_cus_code NUMBER(10),
  shd_ven_code NUMBER(5),
  shd_expiry_date DATE,
  shd_fifo_date DATE,
  CONSTRAINT shd_pk PRIMARY KEY (shd_id),
  CONSTRAINT shd_pmh_fk FOREIGN KEY (shd_pmh_id) REFERENCES phenix.pick_mission_headers (pmh_id),
  CONSTRAINT shd_prf_fk FOREIGN KEY (shd_prf_prd_code,shd_prf_fmt_code) REFERENCES phenix.product_formats (prf_prd_code,prf_fmt_code),
  CONSTRAINT shd_shh_fk FOREIGN KEY (shd_shh_id) REFERENCES phenix.shipment_headers (shh_id) ON DELETE CASCADE
);
COMMENT ON TABLE phenix.shipment_details IS 'Table utilisée pour les détails d''expédition';
COMMENT ON COLUMN phenix.shipment_details.shd_id IS 'Indique l''identifiant unique de la table';
COMMENT ON COLUMN phenix.shipment_details.shd_shh_id IS 'Indique à quelle en-tête d''expédition appartient cette ligne de détail';
COMMENT ON COLUMN phenix.shipment_details.shd_container_id IS 'Indique le code du conteneur';
COMMENT ON COLUMN phenix.shipment_details.shd_prf_prd_code IS 'Indique le code du produit de la ligne d''expédition';
COMMENT ON COLUMN phenix.shipment_details.shd_prf_fmt_code IS 'Indique le code du format de la ligne d''expédition';
COMMENT ON COLUMN phenix.shipment_details.shd_shipped_quantity IS 'Indique la quantité à expédier sur cette ligne d''expédition ';
COMMENT ON COLUMN phenix.shipment_details.shd_shipped_weight IS 'Indique le poids à expédier sur cette ligne d''expédition ';
COMMENT ON COLUMN phenix.shipment_details.shd_pmh_id IS 'Indique le numéro de mission';
COMMENT ON COLUMN phenix.shipment_details.shd_cus_code IS 'Indique le numéro du client associé au conteneur';
COMMENT ON COLUMN phenix.shipment_details.shd_ven_code IS 'Indique le numéro du fournisseur associé au conteneur';
COMMENT ON COLUMN phenix.shipment_details.shd_expiry_date IS 'Indique la date d''expiration du produit associé à l''identifiant';
COMMENT ON COLUMN phenix.shipment_details.shd_fifo_date IS 'Indique la date FIFO du produit associé à l''identifiant';