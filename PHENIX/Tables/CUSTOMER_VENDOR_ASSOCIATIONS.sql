CREATE TABLE phenix.customer_vendor_associations (
  cva_id NUMBER(15) NOT NULL,
  cva_cus_code NUMBER(10) NOT NULL,
  cva_ven_code NUMBER(5) NOT NULL,
  cva_included_switch NUMBER(1) NOT NULL CONSTRAINT cva_included_switch_ck CHECK (CVA_INCLUDED_SWITCH IN (0, 1)),
  cva_redistribute_switch NUMBER(1) NOT NULL CONSTRAINT cva_redistribute_switch_ck CHECK (CVA_REDISTRIBUTE_SWITCH IN (0, 1)),
  CONSTRAINT cva_pk PRIMARY KEY (cva_id),
  CONSTRAINT cva_cus_fk FOREIGN KEY (cva_cus_code) REFERENCES phenix.customers (cus_code) ON DELETE CASCADE,
  CONSTRAINT cva_ven_fk FOREIGN KEY (cva_ven_code) REFERENCES phenix.vendors (ven_code)
);
COMMENT ON TABLE phenix.customer_vendor_associations IS 'Association entre client et fournisseur';
COMMENT ON COLUMN phenix.customer_vendor_associations.cva_id IS 'Identifiant unique';
COMMENT ON COLUMN phenix.customer_vendor_associations.cva_cus_code IS 'Numéro du client';
COMMENT ON COLUMN phenix.customer_vendor_associations.cva_ven_code IS 'Numéro du fournisseur';
COMMENT ON COLUMN phenix.customer_vendor_associations.cva_included_switch IS 'Indique si le client est inclus dans les retours fournisseurs';
COMMENT ON COLUMN phenix.customer_vendor_associations.cva_redistribute_switch IS 'Indique si on redistribue une partie au client';