CREATE TABLE phenix.product_food_certifications (
  pfc_fcr_fcg_code NUMBER(4) NOT NULL,
  pfc_prd_code VARCHAR2(10 BYTE) NOT NULL,
  pfc_fcr_code NUMBER(4) NOT NULL,
  CONSTRAINT pfc_pk PRIMARY KEY (pfc_fcr_fcg_code,pfc_prd_code,pfc_fcr_code),
  CONSTRAINT pfc_fcr_fk FOREIGN KEY (pfc_fcr_code,pfc_fcr_fcg_code) REFERENCES phenix.food_certifications (fcr_code,fcr_fcg_code) ON DELETE CASCADE,
  CONSTRAINT pfc_prd_fk FOREIGN KEY (pfc_prd_code) REFERENCES phenix.products (prd_code) ON DELETE CASCADE
);
COMMENT ON TABLE phenix.product_food_certifications IS 'Table contenant les certifications de produits';
COMMENT ON COLUMN phenix.product_food_certifications.pfc_fcr_fcg_code IS 'Indique le code du groupe de certification';
COMMENT ON COLUMN phenix.product_food_certifications.pfc_prd_code IS 'Indique le code de produit';
COMMENT ON COLUMN phenix.product_food_certifications.pfc_fcr_code IS 'Indique le code de la certification';