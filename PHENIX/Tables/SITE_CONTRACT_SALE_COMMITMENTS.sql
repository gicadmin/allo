CREATE TABLE phenix.site_contract_sale_commitments (
  scsc_id NUMBER(15) NOT NULL,
  scsc_ssch_code VARCHAR2(15 BYTE) NOT NULL,
  scsc_coca_code NUMBER(10),
  scsc_vgr_code NUMBER(5),
  scsc_commitment_dollars NUMBER(8,2),
  scsc_commitment_elements NUMBER(8,2),
  CONSTRAINT scsc_coca_vgr_ck CHECK ( (SCSC_VGR_CODE IS NULL AND SCSC_COCA_CODE IS NOT NULL) OR
        (SCSC_VGR_CODE IS NOT NULL AND SCSC_COCA_CODE IS NULL) ),
  CONSTRAINT scsc_commitment_ck CHECK ( (SCSC_COCA_CODE IS NOT NULL AND ( (SCSC_COMMITMENT_DOLLARS IS NULL AND SCSC_COMMITMENT_ELEMENTS IS NOT NULL) OR
                                          (SCSC_COMMITMENT_DOLLARS IS NOT NULL AND SCSC_COMMITMENT_ELEMENTS IS NULL)
                                        )
        ) OR
        (SCSC_VGR_CODE IS NOT NULL AND SCSC_COMMITMENT_DOLLARS IS NOT NULL)
      ),
  CONSTRAINT scsc_pk PRIMARY KEY (scsc_id),
  CONSTRAINT scsc_uk UNIQUE (scsc_ssch_code,scsc_coca_code,scsc_vgr_code),
  CONSTRAINT scsc_coca_fk FOREIGN KEY (scsc_coca_code) REFERENCES phenix.contract_categories (coca_code),
  CONSTRAINT scsc_ssch_fk FOREIGN KEY (scsc_ssch_code) REFERENCES phenix.site_sales_contract_headers (ssch_code),
  CONSTRAINT scsc_vgr_fk FOREIGN KEY (scsc_vgr_code) REFERENCES phenix.vendor_groups (vgr_code)
);
COMMENT ON TABLE phenix.site_contract_sale_commitments IS 'Table des engagements d''achat';
COMMENT ON COLUMN phenix.site_contract_sale_commitments.scsc_id IS 'Indique l''identifiant des engagements d''achat';
COMMENT ON COLUMN phenix.site_contract_sale_commitments.scsc_ssch_code IS 'Indique le numéro de contrat';
COMMENT ON COLUMN phenix.site_contract_sale_commitments.scsc_coca_code IS 'Indique le code de la catégorie du contrat';
COMMENT ON COLUMN phenix.site_contract_sale_commitments.scsc_vgr_code IS 'Indique le code du groupe de fournisseur';
COMMENT ON COLUMN phenix.site_contract_sale_commitments.scsc_commitment_dollars IS 'Indique l''engagement d''achat pour cette catégorie de contrat ou ce groupe de fournisseurs en dollars';
COMMENT ON COLUMN phenix.site_contract_sale_commitments.scsc_commitment_elements IS 'Indique l''engagement d''achat pour cette catégorie de contrat ou ce groupe de fournisseurs en éléments';