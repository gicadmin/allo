CREATE TABLE phenix.volume_rebate_exceptions (
  vre_id NUMBER(15) NOT NULL,
  vre_pgr_code NUMBER(5),
  vre_vro_id NUMBER(15) NOT NULL,
  vre_ven_code NUMBER(5),
  vre_rebate_amount NUMBER(7,2),
  vre_rebate_percent NUMBER(6,3),
  vre_drop_partnership_percent NUMBER(6,3),
  CONSTRAINT vre_amount_perc_ck CHECK ((VRE_REBATE_AMOUNT IS NULL AND VRE_REBATE_PERCENT IS NOT NULL) OR
 (VRE_REBATE_AMOUNT IS NOT NULL AND VRE_REBATE_PERCENT IS NULL)),
  CONSTRAINT vre_group_vend_ck CHECK ((VRE_VEN_CODE IS NULL AND VRE_PGR_CODE IS NOT NULL) OR
  (VRE_VEN_CODE IS NOT NULL AND VRE_PGR_CODE IS NULL)),
  CONSTRAINT vre_pk PRIMARY KEY (vre_id),
  CONSTRAINT vre_pgr_fk FOREIGN KEY (vre_pgr_code) REFERENCES phenix.product_groups (pgr_code),
  CONSTRAINT vre_ven_fk FOREIGN KEY (vre_ven_code) REFERENCES phenix.vendors (ven_code),
  CONSTRAINT vre_vro_fk FOREIGN KEY (vre_vro_id) REFERENCES phenix.volume_rebate_objectives (vro_id) ON DELETE CASCADE
);
COMMENT ON COLUMN phenix.volume_rebate_exceptions.vre_vro_id IS 'Indique la fréquence de la grille de rabais volume';
COMMENT ON COLUMN phenix.volume_rebate_exceptions.vre_ven_code IS 'Indique le fournisseur spécifique des escomptes';
COMMENT ON COLUMN phenix.volume_rebate_exceptions.vre_rebate_amount IS 'Indique le montant spécifique des escomptes';
COMMENT ON COLUMN phenix.volume_rebate_exceptions.vre_rebate_percent IS 'Indique le pourcentage spécifique des escomptes';
COMMENT ON COLUMN phenix.volume_rebate_exceptions.vre_drop_partnership_percent IS 'Indique le pourcentage de remise pour les programmes partenariat.';