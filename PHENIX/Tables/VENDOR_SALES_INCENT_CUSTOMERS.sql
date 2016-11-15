CREATE TABLE phenix.vendor_sales_incent_customers (
  vsic_vsi_code NUMBER(10) NOT NULL,
  vsic_cus_code NUMBER(10),
  vsic_cgr_code NUMBER(3),
  CONSTRAINT vsic_cus_cgr_ck CHECK ((VSIC_CUS_CODE IS NULL AND VSIC_CGR_CODE IS NOT NULL) OR (VSIC_CUS_CODE IS NOT NULL AND VSIC_CGR_CODE IS NULL)),
  CONSTRAINT vsic_vsi_cus_cgr_uk UNIQUE (vsic_vsi_code,vsic_cus_code,vsic_cgr_code),
  CONSTRAINT vsic_cgr_fk FOREIGN KEY (vsic_cgr_code) REFERENCES phenix.customer_groups (cgr_code) ON DELETE CASCADE,
  CONSTRAINT vsic_cus_fk FOREIGN KEY (vsic_cus_code) REFERENCES phenix.customers (cus_code) ON DELETE CASCADE,
  CONSTRAINT vsic_vsi_fk FOREIGN KEY (vsic_vsi_code) REFERENCES phenix.vendor_sales_incentives (vsi_code) ON DELETE CASCADE
);
COMMENT ON COLUMN phenix.vendor_sales_incent_customers.vsic_vsi_code IS 'Indique la prime';
COMMENT ON COLUMN phenix.vendor_sales_incent_customers.vsic_cus_code IS 'Indique le client';
COMMENT ON COLUMN phenix.vendor_sales_incent_customers.vsic_cgr_code IS 'Indique le groupe client';