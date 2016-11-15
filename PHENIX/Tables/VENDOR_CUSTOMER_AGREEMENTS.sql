CREATE TABLE phenix.vendor_customer_agreements (
  vca_id NUMBER(15) NOT NULL,
  vca_vsa_code NUMBER(10) NOT NULL,
  vca_cus_code NUMBER(10),
  vca_qty_code NUMBER(5),
  vca_naz_nac_code NUMBER(4),
  vca_naz_zone_code NUMBER(3),
  CONSTRAINT vca_cus_nac_qty_ck CHECK ((VCA_CUS_CODE IS NOT NULL AND VCA_NAZ_NAC_CODE IS NULL AND VCA_NAZ_ZONE_CODE IS NULL AND VCA_QTY_CODE IS NULL)
 	OR
	(VCA_CUS_CODE IS NULL AND VCA_NAZ_NAC_CODE IS NOT NULL AND VCA_NAZ_ZONE_CODE IS NOT NULL AND VCA_QTY_CODE IS NULL)
	OR
	(VCA_CUS_CODE IS NULL AND VCA_NAZ_NAC_CODE IS NULL AND VCA_NAZ_ZONE_CODE IS NULL AND VCA_QTY_CODE IS NOT NULL)),
  CONSTRAINT vca_pk PRIMARY KEY (vca_id),
  CONSTRAINT vca_cus_fk FOREIGN KEY (vca_cus_code) REFERENCES phenix.customers (cus_code) ON DELETE CASCADE,
  CONSTRAINT vca_naz_fk FOREIGN KEY (vca_naz_nac_code,vca_naz_zone_code) REFERENCES phenix.national_account_zones (naz_nac_code,naz_zone_code),
  CONSTRAINT vca_qty_fk FOREIGN KEY (vca_qty_code) REFERENCES phenix.quotation_types (qty_code),
  CONSTRAINT vca_vsa_fk FOREIGN KEY (vca_vsa_code) REFERENCES phenix.vendor_sales_agreements (vsa_code) ON DELETE CASCADE
);
COMMENT ON TABLE phenix.vendor_customer_agreements IS 'Grille des ententes clients et fournisseurs';
COMMENT ON COLUMN phenix.vendor_customer_agreements.vca_id IS 'Idenfiant';
COMMENT ON COLUMN phenix.vendor_customer_agreements.vca_vsa_code IS 'Code des ententes';
COMMENT ON COLUMN phenix.vendor_customer_agreements.vca_cus_code IS 'Code client';
COMMENT ON COLUMN phenix.vendor_customer_agreements.vca_qty_code IS 'Code des types de soumissions';
COMMENT ON COLUMN phenix.vendor_customer_agreements.vca_naz_nac_code IS 'Indique le compte national de l''entente';
COMMENT ON COLUMN phenix.vendor_customer_agreements.vca_naz_zone_code IS 'Indique la zone du compte national de l''entente';