CREATE GLOBAL TEMPORARY TABLE phenix.temporary_price_changes (
  tprx_effective_date DATE NOT NULL,
  tprx_prf_prd_code VARCHAR2(10 BYTE) NOT NULL,
  tprx_prf_fmt_code VARCHAR2(7 BYTE),
  tprx_vpd_code VARCHAR2(15 BYTE),
  tprx_vpd_prf_fmt_code VARCHAR2(7 BYTE),
  tprx_ven_code NUMBER(5),
  tprx_old_cost NUMBER(7,2),
  tprx_cost NUMBER(7,2),
  tprx_old_cost_adjustment NUMBER(11,6),
  tprx_cost_adjustment NUMBER(11,6),
  tprx_old_cost_admin_1 NUMBER(11,6),
  tprx_cost_admin_1 NUMBER(11,6),
  tprx_old_cost_admin_2_percent NUMBER(6,3),
  tprx_cost_admin_2_percent NUMBER(6,3),
  tprx_old_tobacco_tax NUMBER(11,6),
  tprx_tobacco_tax NUMBER(11,6),
  tprx_old_profit_percent NUMBER(6,3),
  tprx_profit_percent NUMBER(6,3),
  tprx_old_sell_price NUMBER(7,2),
  tprx_sell_price NUMBER(7,2),
  tprx_use_code NUMBER(5),
  tprx_minimum_sale_price NUMBER(7,2)
)
ON COMMIT PRESERVE ROWS;
COMMENT ON TABLE phenix.temporary_price_changes IS 'Table des changements de prix créés en lot';
COMMENT ON COLUMN phenix.temporary_price_changes.tprx_effective_date IS 'Indique la date à laquelle le changement sera fait';
COMMENT ON COLUMN phenix.temporary_price_changes.tprx_prf_prd_code IS 'Indique le code du produit';
COMMENT ON COLUMN phenix.temporary_price_changes.tprx_prf_fmt_code IS 'Indique le code du format';
COMMENT ON COLUMN phenix.temporary_price_changes.tprx_vpd_code IS 'Indique le numéro de produit du fournisseur';
COMMENT ON COLUMN phenix.temporary_price_changes.tprx_vpd_prf_fmt_code IS 'Indique le code de format du produit du fournisseur';
COMMENT ON COLUMN phenix.temporary_price_changes.tprx_ven_code IS 'Indique le numéro du fournisseur';
COMMENT ON COLUMN phenix.temporary_price_changes.tprx_old_cost IS 'Indique l''ancienne valeur du coûtant';
COMMENT ON COLUMN phenix.temporary_price_changes.tprx_cost IS 'Indique la nouvelle valeur du coûtant';
COMMENT ON COLUMN phenix.temporary_price_changes.tprx_old_cost_adjustment IS 'Indique l''ancien ajustement au coût';
COMMENT ON COLUMN phenix.temporary_price_changes.tprx_cost_adjustment IS 'Indique le nouvel ajustement au coût';
COMMENT ON COLUMN phenix.temporary_price_changes.tprx_old_cost_admin_1 IS 'Indique l''ancien coûtant d''administration 1 ($)';
COMMENT ON COLUMN phenix.temporary_price_changes.tprx_cost_admin_1 IS 'Indique le nouveau coûtant d''administration 1 ($)';
COMMENT ON COLUMN phenix.temporary_price_changes.tprx_old_cost_admin_2_percent IS 'Indique l''ancien coûtant d''administration 2 (%)';
COMMENT ON COLUMN phenix.temporary_price_changes.tprx_cost_admin_2_percent IS 'Indique le nouveau coûtant d''administration 2 (%)';
COMMENT ON COLUMN phenix.temporary_price_changes.tprx_old_tobacco_tax IS 'Indique l''ancien montant de la taxe tabac';
COMMENT ON COLUMN phenix.temporary_price_changes.tprx_tobacco_tax IS 'Indique le nouveau montant de la taxe tabac';
COMMENT ON COLUMN phenix.temporary_price_changes.tprx_old_profit_percent IS 'Indique l''ancien pourcentage de profit';
COMMENT ON COLUMN phenix.temporary_price_changes.tprx_profit_percent IS 'Indique le nouveau pourcentage de profit';
COMMENT ON COLUMN phenix.temporary_price_changes.tprx_old_sell_price IS 'Indique l''ancien prix de vente';
COMMENT ON COLUMN phenix.temporary_price_changes.tprx_sell_price IS 'Indique le nouveau prix de vente';
COMMENT ON COLUMN phenix.temporary_price_changes.tprx_use_code IS 'Indique le code de l''utilisateur qui a créé le changement de prix';
COMMENT ON COLUMN phenix.temporary_price_changes.tprx_minimum_sale_price IS 'Indique le prix de vente minimum';