CREATE TABLE phenix.customer_classes (
  ccl_cus_code NUMBER(10) NOT NULL,
  ccl_cls_code NUMBER(3) NOT NULL,
  ccl_use_code NUMBER(5),
  CONSTRAINT ccl_pk PRIMARY KEY (ccl_cus_code,ccl_cls_code),
  CONSTRAINT ccl_cls_fk FOREIGN KEY (ccl_cls_code) REFERENCES phenix.classes (cls_code),
  CONSTRAINT ccl_cus_fk FOREIGN KEY (ccl_cus_code) REFERENCES phenix.customers (cus_code) ON DELETE CASCADE,
  CONSTRAINT ccl_use_fk FOREIGN KEY (ccl_use_code) REFERENCES phenix."USERS" (use_code)
);
COMMENT ON TABLE phenix.customer_classes IS 'Lien qui permet de savoir les classes qui sont exclus du clients';
COMMENT ON COLUMN phenix.customer_classes.ccl_cus_code IS 'Numéro de client';
COMMENT ON COLUMN phenix.customer_classes.ccl_cls_code IS 'Numéro de classe client';
COMMENT ON COLUMN phenix.customer_classes.ccl_use_code IS 'Code usager';