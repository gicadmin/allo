CREATE TABLE phenix.outstanding_inventory_counts (
  oic_id NUMBER(15) NOT NULL,
  oic_loc_code VARCHAR2(12 BYTE) NOT NULL,
  oic_prd_code VARCHAR2(10 BYTE),
  oic_type VARCHAR2(1 BYTE) NOT NULL CONSTRAINT oic_type_ck CHECK (OIC_TYPE IN ('E','R','C')),
  oic_rma_reference_number NUMBER(15),
  oic_status VARCHAR2(3 BYTE) NOT NULL CONSTRAINT oic_status_ck CHECK (OIC_STATUS IN ('OPN','IPR')),
  oic_creation_date DATE DEFAULT SYSDATE,
  oic_whs_code VARCHAR2(2 BYTE) NOT NULL,
  CONSTRAINT oic_pk PRIMARY KEY (oic_id),
  CONSTRAINT oic_cah_fk FOREIGN KEY (oic_rma_reference_number) REFERENCES phenix.customer_adjustment_headers (cah_id) ON DELETE CASCADE,
  CONSTRAINT oic_loc_fk FOREIGN KEY (oic_loc_code) REFERENCES phenix.locations (loc_code),
  CONSTRAINT oic_prd_fk FOREIGN KEY (oic_prd_code) REFERENCES phenix.products (prd_code),
  CONSTRAINT oic_whs_fk FOREIGN KEY (oic_whs_code) REFERENCES phenix.warehouses (whs_code)
);
COMMENT ON TABLE phenix.outstanding_inventory_counts IS 'La table des décomptes est utilisée pour conserver les décomptes d''inventaire à faire';
COMMENT ON COLUMN phenix.outstanding_inventory_counts.oic_id IS 'Indique l''identifiant unique';
COMMENT ON COLUMN phenix.outstanding_inventory_counts.oic_loc_code IS 'Indique la localisation du décompte';
COMMENT ON COLUMN phenix.outstanding_inventory_counts.oic_prd_code IS 'Indique le produit à décompter';
COMMENT ON COLUMN phenix.outstanding_inventory_counts.oic_type IS 'Indique le type de décompte';
COMMENT ON COLUMN phenix.outstanding_inventory_counts.oic_rma_reference_number IS 'Indique le numéro RMA qui a généré le décompte d''inventaire';
COMMENT ON COLUMN phenix.outstanding_inventory_counts.oic_status IS 'Indique le statut du décompte';
COMMENT ON COLUMN phenix.outstanding_inventory_counts.oic_creation_date IS 'Indique la date de la création du décompte d''inventaire';