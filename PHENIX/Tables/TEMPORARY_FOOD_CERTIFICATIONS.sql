CREATE GLOBAL TEMPORARY TABLE phenix.temporary_food_certifications (
  tfc_prf_upc_code VARCHAR2(18 BYTE) NOT NULL,
  tfc_fcg_code NUMBER(4) NOT NULL,
  tfc_fcr_code NUMBER(4) NOT NULL,
  tfc_fcr_description VARCHAR2(45 BYTE),
  tfc_prd_code VARCHAR2(10 BYTE)
)
ON COMMIT PRESERVE ROWS;
COMMENT ON TABLE phenix.temporary_food_certifications IS 'Table des certifications de produits';
COMMENT ON COLUMN phenix.temporary_food_certifications.tfc_prf_upc_code IS 'Indique le code UPC';
COMMENT ON COLUMN phenix.temporary_food_certifications.tfc_fcg_code IS 'Indique le code du groupe de certification';
COMMENT ON COLUMN phenix.temporary_food_certifications.tfc_fcr_code IS 'Indique le code de certification';
COMMENT ON COLUMN phenix.temporary_food_certifications.tfc_fcr_description IS 'Indique la description de la certification';
COMMENT ON COLUMN phenix.temporary_food_certifications.tfc_prd_code IS 'Indique le code produit';