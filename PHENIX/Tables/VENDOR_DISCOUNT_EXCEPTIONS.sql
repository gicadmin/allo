CREATE TABLE phenix.vendor_discount_exceptions (
  vde_id NUMBER(15) NOT NULL,
  vde_vdi_id NUMBER(15) NOT NULL,
  vde_rcl_id NUMBER(6),
  vde_naz_nac_code NUMBER(4),
  vde_naz_zone_code NUMBER(3),
  vde_affect_drop_cost_switch NUMBER(1) NOT NULL,
  vde_drop_percent NUMBER(6,3),
  vde_drop_amount NUMBER(7,2),
  vde_rct_code NUMBER(3),
  CONSTRAINT vde_amount_perc_ck CHECK ((VDE_DROP_AMOUNT IS NULL AND VDE_DROP_PERCENT IS NOT NULL) OR
  (VDE_DROP_AMOUNT IS NOT NULL AND VDE_DROP_PERCENT IS NULL)),
  CONSTRAINT vde_rct_rcl_naz_ck CHECK (
  (VDE_RCL_ID IS NULL AND VDE_RCT_CODE IS NULL AND VDE_NAZ_NAC_CODE IS NOT NULL AND VDE_NAZ_ZONE_CODE IS NOT NULL)
 OR
  (VDE_RCL_ID IS NOT NULL AND VDE_RCT_CODE IS NULL AND VDE_NAZ_NAC_CODE IS NULL AND VDE_NAZ_ZONE_CODE IS NULL)
 OR
  (VDE_RCL_ID IS NULL AND VDE_RCT_CODE IS NOT NULL AND VDE_NAZ_NAC_CODE IS NULL AND VDE_NAZ_ZONE_CODE IS NULL)
),
  CONSTRAINT vde_pk PRIMARY KEY (vde_id),
  CONSTRAINT vde_naz_nac_fk FOREIGN KEY (vde_naz_nac_code,vde_naz_zone_code) REFERENCES phenix.national_account_zones (naz_nac_code,naz_zone_code),
  CONSTRAINT vde_rcl_fk FOREIGN KEY (vde_rcl_id) REFERENCES phenix.retail_clients (rcl_id),
  CONSTRAINT vde_rct_code_fk FOREIGN KEY (vde_rct_code) REFERENCES phenix.retail_client_types (rct_code),
  CONSTRAINT vde_vdi_fk FOREIGN KEY (vde_vdi_id) REFERENCES phenix.vendor_discounts (vdi_id)
);
COMMENT ON TABLE phenix.vendor_discount_exceptions IS 'Cette table contient les escomptes fournisseurs exceptionnelles pour un NAC ou un détaillant';
COMMENT ON COLUMN phenix.vendor_discount_exceptions.vde_id IS 'Numéro d''identifiant pour l''escompte fournisseur exceptionnelle';
COMMENT ON COLUMN phenix.vendor_discount_exceptions.vde_vdi_id IS 'Numéro d''identifiant pour l''escompte ';
COMMENT ON COLUMN phenix.vendor_discount_exceptions.vde_rcl_id IS 'Code de détaillant';
COMMENT ON COLUMN phenix.vendor_discount_exceptions.vde_naz_nac_code IS 'Numéro du compte national';
COMMENT ON COLUMN phenix.vendor_discount_exceptions.vde_naz_zone_code IS 'Numéro de la zone du compte national';
COMMENT ON COLUMN phenix.vendor_discount_exceptions.vde_affect_drop_cost_switch IS 'Indique si l''escompte affecte le coutant de la facture';
COMMENT ON COLUMN phenix.vendor_discount_exceptions.vde_drop_percent IS 'Pourcentage de l''escompte';
COMMENT ON COLUMN phenix.vendor_discount_exceptions.vde_drop_amount IS 'Montant de l''escompte';
COMMENT ON COLUMN phenix.vendor_discount_exceptions.vde_rct_code IS 'Indique le type de détaillant';