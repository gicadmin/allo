CREATE TABLE phenix.price_changes (
  prx_id NUMBER(9) NOT NULL,
  prx_effective_date DATE NOT NULL,
  prx_posted_switch NUMBER(1) NOT NULL CONSTRAINT prx_posted_switch_ck CHECK (PRX_POSTED_SWITCH IN (0, 1)),
  prx_prf_prd_code VARCHAR2(10 BYTE),
  prx_prf_fmt_code VARCHAR2(7 BYTE),
  prx_vpd_code VARCHAR2(15 BYTE),
  prx_vpd_ven_code NUMBER(5),
  prx_cost NUMBER(7,2),
  prx_profit_percent NUMBER(6,3),
  prx_sell_price NUMBER(7,2),
  prx_tobacco_tax NUMBER(11,6),
  prx_cost_adjustment NUMBER(11,6),
  prx_cost_admin_1 NUMBER(11,6),
  prx_srt_code NUMBER(3),
  prx_minimum_sale_price NUMBER(7,2),
  prx_creation_date DATE DEFAULT SYSDATE NOT NULL,
  prx_elimination_date DATE,
  prx_modification_date DATE DEFAULT SYSDATE NOT NULL,
  prx_fixed_srp_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT prx_fixed_srp_switch_ck CHECK (PRX_FIXED_SRP_SWITCH in (0, 1)),
  prx_use_code NUMBER(5),
  prx_modification_source VARCHAR2(30 BYTE),
  prx_alt_modif_source VARCHAR2(30 BYTE),
  prx_cost_admin_2_percent NUMBER(6,3),
  CONSTRAINT prx_vendor_product_format_ck CHECK ("PRX_VPD_CODE" IS NOT NULL AND "PRX_VPD_VEN_CODE" IS NOT NULL AND "PRX_PRF_FMT_CODE" IS NULL AND "PRX_PRF_PRD_CODE" IS NULL AND "PRX_PROFIT_PERCENT" IS NULL AND "PRX_SELL_PRICE" IS NULL AND "PRX_SRT_CODE" IS NULL AND ("PRX_COST" IS NOT NULL OR "PRX_COST_ADMIN_1" IS NOT NULL OR "PRX_COST_ADJUSTMENT" IS NOT NULL) AND "PRX_TOBACCO_TAX" IS NULL OR "PRX_VPD_CODE" IS NULL AND "PRX_VPD_VEN_CODE" IS NULL AND "PRX_PRF_FMT_CODE" IS NOT NULL AND "PRX_PRF_PRD_CODE" IS NOT NULL AND "PRX_COST" IS NULL AND "PRX_TOBACCO_TAX" IS NULL AND "PRX_PROFIT_PERCENT" IS NOT NULL AND "PRX_SELL_PRICE" IS NOT NULL AND "PRX_SRT_CODE" IS NULL OR "PRX_VPD_CODE" IS NULL AND "PRX_VPD_VEN_CODE" IS NULL AND "PRX_PRF_FMT_CODE" IS NOT NULL AND "PRX_PRF_PRD_CODE" IS NOT NULL AND "PRX_COST" IS NULL AND "PRX_TOBACCO_TAX" IS NOT NULL AND "PRX_PROFIT_PERCENT" IS NOT NULL AND "PRX_SELL_PRICE" IS NOT NULL AND "PRX_SRT_CODE" IS NULL OR "PRX_VPD_CODE" IS NULL AND "PRX_VPD_VEN_CODE" IS NULL AND "PRX_PRF_FMT_CODE" IS NOT NULL AND "PRX_PRF_PRD_CODE" IS NOT NULL AND "PRX_COST" IS NULL AND "PRX_TOBACCO_TAX" IS NULL AND "PRX_PROFIT_PERCENT" IS NOT NULL AND "PRX_SELL_PRICE" IS NOT NULL AND "PRX_SRT_CODE" IS NOT NULL),
  CONSTRAINT prx_pk PRIMARY KEY (prx_id),
  CONSTRAINT prx_prf_fk FOREIGN KEY (prx_prf_prd_code,prx_prf_fmt_code) REFERENCES phenix.product_formats (prf_prd_code,prf_fmt_code),
  CONSTRAINT prx_srt_fk FOREIGN KEY (prx_srt_code) REFERENCES phenix.suggested_retail_price_types (srt_code),
  CONSTRAINT prx_use_code_fk FOREIGN KEY (prx_use_code) REFERENCES phenix."USERS" (use_code),
  CONSTRAINT prx_vpd_fk FOREIGN KEY (prx_vpd_code,prx_vpd_ven_code) REFERENCES phenix.vendor_products (vpd_code,vpd_ven_distributed_by_code)
);
COMMENT ON TABLE phenix.price_changes IS 'Trace des changements de prix';
COMMENT ON COLUMN phenix.price_changes.prx_id IS 'Identifiant des changements de prix';
COMMENT ON COLUMN phenix.price_changes.prx_effective_date IS 'Date à laquelle le changement sera fait';
COMMENT ON COLUMN phenix.price_changes.prx_posted_switch IS 'Indique si le prix a été désigner';
COMMENT ON COLUMN phenix.price_changes.prx_prf_prd_code IS 'Numéro de produit';
COMMENT ON COLUMN phenix.price_changes.prx_prf_fmt_code IS 'Numéro du format';
COMMENT ON COLUMN phenix.price_changes.prx_vpd_code IS 'Numéro de produit du fournisseur';
COMMENT ON COLUMN phenix.price_changes.prx_vpd_ven_code IS 'Numéro du fournisseur';
COMMENT ON COLUMN phenix.price_changes.prx_cost IS 'Nouvelle valeur du coûtant';
COMMENT ON COLUMN phenix.price_changes.prx_profit_percent IS 'Nouveau pourcentage de profit';
COMMENT ON COLUMN phenix.price_changes.prx_sell_price IS 'Nouveau prix de vente';
COMMENT ON COLUMN phenix.price_changes.prx_tobacco_tax IS 'Nouveau montant de la taxe tabac';
COMMENT ON COLUMN phenix.price_changes.prx_cost_adjustment IS 'Ajustement au cout';
COMMENT ON COLUMN phenix.price_changes.prx_cost_admin_1 IS 'Indique le coûtant d''administration 1 ($) pour le changement de prix';
COMMENT ON COLUMN phenix.price_changes.prx_srt_code IS 'Type de prix de détail suggéré';
COMMENT ON COLUMN phenix.price_changes.prx_minimum_sale_price IS 'Prix de vente minimum';
COMMENT ON COLUMN phenix.price_changes.prx_creation_date IS 'Date de création du changement de prix';
COMMENT ON COLUMN phenix.price_changes.prx_elimination_date IS 'Date à laquelle le changement de prix a été éliminé';
COMMENT ON COLUMN phenix.price_changes.prx_modification_date IS 'Date de la dernière modification du changement de prix';
COMMENT ON COLUMN phenix.price_changes.prx_fixed_srp_switch IS 'Indique si le prix du PDS est fixe ou pas';
COMMENT ON COLUMN phenix.price_changes.prx_use_code IS 'Indique le code de l''utilisateur qui a crée le changement de prix.';
COMMENT ON COLUMN phenix.price_changes.prx_modification_source IS 'Indique la source de la modification du changement de prix.';
COMMENT ON COLUMN phenix.price_changes.prx_alt_modif_source IS 'Indique la source de la modification du changement de prix en anglais.';
COMMENT ON COLUMN phenix.price_changes.prx_cost_admin_2_percent IS 'Indique le coûtant d''administration 2 (%) pour le changement de prix';