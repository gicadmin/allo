CREATE TABLE phenix.vendor_product_allocations (
  vpra_id NUMBER(15) NOT NULL,
  vpra_vpd_code VARCHAR2(15 BYTE) NOT NULL,
  vpra_vpd_ven_distrib_by_code NUMBER(5) NOT NULL,
  vpra_purch_allocation NUMBER(7,2) NOT NULL,
  vpra_start_date DATE NOT NULL,
  vpra_end_date DATE,
  vpra_creation_date DATE DEFAULT SYSDATE NOT NULL,
  CONSTRAINT vpra_pk PRIMARY KEY (vpra_id) USING INDEX (CREATE UNIQUE INDEX phenix.vpra_pk_i ON phenix.vendor_product_allocations(vpra_id)    ),
  CONSTRAINT vpra_vpd_fk FOREIGN KEY (vpra_vpd_code,vpra_vpd_ven_distrib_by_code) REFERENCES phenix.vendor_products (vpd_code,vpd_ven_distributed_by_code)
);
COMMENT ON TABLE phenix.vendor_product_allocations IS 'Table des allocations données à l''achat';
COMMENT ON COLUMN phenix.vendor_product_allocations.vpra_id IS 'Indique l''identifiant unique';
COMMENT ON COLUMN phenix.vendor_product_allocations.vpra_vpd_code IS 'Indique le code du produit chez le fournisseur';
COMMENT ON COLUMN phenix.vendor_product_allocations.vpra_vpd_ven_distrib_by_code IS 'Indique le code du fournisseur du produit';
COMMENT ON COLUMN phenix.vendor_product_allocations.vpra_purch_allocation IS 'Indique l''allocation déjà prise à l''achat sur les ententes partenaire de type OAGR';
COMMENT ON COLUMN phenix.vendor_product_allocations.vpra_start_date IS 'Indique la date de début de cette allocation';
COMMENT ON COLUMN phenix.vendor_product_allocations.vpra_end_date IS 'Indique la date de fin de cette allocation';
COMMENT ON COLUMN phenix.vendor_product_allocations.vpra_creation_date IS 'Indique la date de création de cette allocation';