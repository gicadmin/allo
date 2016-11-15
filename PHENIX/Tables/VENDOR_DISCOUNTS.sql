CREATE TABLE phenix.vendor_discounts (
  vdi_id NUMBER(15) NOT NULL,
  vdi_vdt_dit_code NUMBER(3) NOT NULL,
  vdi_vdt_ven_code NUMBER(5) NOT NULL,
  vdi_cost_affected_flag NUMBER(1) NOT NULL CONSTRAINT vdi_cost_affected_flag_ck CHECK (VDI_COST_AFFECTED_FLAG IN (0, 1, 2, 3, 4)),
  vdi_vpd_ven_code NUMBER(5),
  vdi_vpd_code VARCHAR2(15 BYTE),
  vdi_amount NUMBER(7,2),
  vdi_drop_amount NUMBER(7,2),
  vdi_drop_percent NUMBER(6,3),
  vdi_percent NUMBER(6,3),
  vdi_affect_match_cost_switch NUMBER(1) NOT NULL CONSTRAINT vdi_affect_match_cost_switc_ck CHECK (VDI_AFFECT_MATCH_COST_SWITCH IN (0, 1)),
  vdi_apply_on_all_vendor_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT vdi_apply_on_all_vendor_swi_ck CHECK (VDI_APPLY_ON_ALL_VENDOR_SWITCH IN (0, 1)),
  vdi_all_products_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT vdi_all_products_switch_ck CHECK (VDI_ALL_PRODUCTS_SWITCH IN (0, 1)),
  vdi_qualifier VARCHAR2(2 BYTE) DEFAULT 'IT' NOT NULL CONSTRAINT vdi_qualifier_ck CHECK (VDI_QUALIFIER IN ('IT', 'KG', 'KD', 'VO')),
  vdi_vcg_id NUMBER(15),
  vdi_affect_drop_cost_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT vdi_affect_drop_cost_switch_ck CHECK (VDI_AFFECT_DROP_COST_SWITCH in (0, 1)),
  CONSTRAINT vdi_discount_ck CHECK ((VDI_AMOUNT is not NULL and
 VDI_PERCENT is NULL) or
(VDI_AMOUNT is NULL and
 VDI_PERCENT is not NULL) or
(VDI_AMOUNT is NULL and
 VDI_PERCENT is NULL)),
  CONSTRAINT vdi_drop_discount_ck CHECK ((VDI_DROP_AMOUNT is not NULL and
 VDI_DROP_PERCENT is NULL) or
(VDI_DROP_AMOUNT is NULL and
 VDI_DROP_PERCENT is not NULL) or
(VDI_DROP_AMOUNT is NULL and
 VDI_DROP_PERCENT is  NULL)),
  CONSTRAINT vdi_percent_qualifier_ck CHECK ((VDI_QUALIFIER = 'IT') or
(VDI_QUALIFIER <> 'IT' and
VDI_DROP_PERCENT is NULL and
VDI_PERCENT is NULL)),
  CONSTRAINT vdi_vendor_product_ck CHECK ((VDI_VPD_VEN_CODE =
VDI_VDT_VEN_CODE) or
(VDI_VPD_VEN_CODE is NULL and
VDI_VDT_VEN_CODE is not NULL)),
  CONSTRAINT vdi_pk PRIMARY KEY (vdi_id),
  CONSTRAINT vdi_vcg_fk FOREIGN KEY (vdi_vcg_id) REFERENCES phenix.vendor_product_categories (vcg_id),
  CONSTRAINT vdi_vdt_fk FOREIGN KEY (vdi_vdt_ven_code,vdi_vdt_dit_code) REFERENCES phenix.vendor_discount_types (vdt_ven_code,vdt_dit_code),
  CONSTRAINT vdi_vpd_fk FOREIGN KEY (vdi_vpd_code,vdi_vpd_ven_code) REFERENCES phenix.vendor_products (vpd_code,vpd_ven_distributed_by_code)
);
COMMENT ON TABLE phenix.vendor_discounts IS 'Indique les escomptes et rabais de volume annuel au niveau du fournisseur';
COMMENT ON COLUMN phenix.vendor_discounts.vdi_id IS 'Numéro d''escompte fournisseur';
COMMENT ON COLUMN phenix.vendor_discounts.vdi_vdt_dit_code IS 'Numéro de type d''escompte';
COMMENT ON COLUMN phenix.vendor_discounts.vdi_vdt_ven_code IS 'Numéro de fournisseur';
COMMENT ON COLUMN phenix.vendor_discounts.vdi_cost_affected_flag IS 'Indique le coûtant sur lequel l''escompte est affecté';
COMMENT ON COLUMN phenix.vendor_discounts.vdi_vpd_ven_code IS 'Numéro du fournisseur';
COMMENT ON COLUMN phenix.vendor_discounts.vdi_vpd_code IS 'Numéro de produit du fournisseur';
COMMENT ON COLUMN phenix.vendor_discounts.vdi_amount IS 'Montant à déduire';
COMMENT ON COLUMN phenix.vendor_discounts.vdi_drop_amount IS 'Montant à déduire sur les comandes "drops"';
COMMENT ON COLUMN phenix.vendor_discounts.vdi_drop_percent IS 'Pourcentage à déduire sur les commandes "drops"';
COMMENT ON COLUMN phenix.vendor_discounts.vdi_percent IS 'pourcentage à déduire';
COMMENT ON COLUMN phenix.vendor_discounts.vdi_affect_match_cost_switch IS 'Indique si la valeur est inclus dans la calculation (net) de la réconciliation';
COMMENT ON COLUMN phenix.vendor_discounts.vdi_apply_on_all_vendor_switch IS 'Indique si les escomptes sont appliqués sur tous les fournisseurs';
COMMENT ON COLUMN phenix.vendor_discounts.vdi_all_products_switch IS 'Indique si l''escompte s''applique à tous les produits';
COMMENT ON COLUMN phenix.vendor_discounts.vdi_qualifier IS 'Qualificatif de l''escompte';
COMMENT ON COLUMN phenix.vendor_discounts.vdi_vcg_id IS 'Identifiant de la catégorie de prodution fournisseur';
COMMENT ON COLUMN phenix.vendor_discounts.vdi_affect_drop_cost_switch IS 'Indique si le montant ou le pourcentage de l''escompte affecte le coutant de la facture';