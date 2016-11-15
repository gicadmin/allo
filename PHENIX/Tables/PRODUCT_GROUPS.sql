CREATE TABLE phenix.product_groups (
  pgr_code NUMBER(5) NOT NULL,
  pgr_description VARCHAR2(30 BYTE) NOT NULL,
  pgr_commission_percent NUMBER(6,3) NOT NULL,
  pgr_price_change_switch NUMBER(1) NOT NULL CONSTRAINT pgr_price_change_switch_ck CHECK (PGR_PRICE_CHANGE_SWITCH IN (0, 1)),
  pgr_tobacco_switch NUMBER(1) NOT NULL CONSTRAINT pgr_tobacco_switch_ck CHECK (PGR_TOBACCO_SWITCH IN (0, 1)),
  pgr_alt_description VARCHAR2(30 BYTE),
  pgr_updt_by_broker_switch NUMBER(1) NOT NULL CONSTRAINT pgr_updt_by_broker_switch_ck CHECK (PGR_UPDT_BY_BROKER_SWITCH IN (0, 1)),
  pgr_sales_format NUMBER(1) NOT NULL CONSTRAINT pgr_sales_format_ck CHECK (PGR_SALES_FORMAT IN (1, 2)),
  pgr_maximum_profit_percent NUMBER(6,3),
  pgr_minimum_profit_percent NUMBER(6,3),
  pgr_invoice_counter_switch NUMBER(1) NOT NULL CONSTRAINT pgr_invoice_counter_switch_ck CHECK (PGR_INVOICE_COUNTER_SWITCH IN (0, 1)),
  pgr_auto_adjustment_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT pgr_auto_adjustment_switch_ck CHECK (PGR_AUTO_ADJUSTMENT_SWITCH IN (0, 1)),
  pgr_min_telemark_prof_percent NUMBER(6,3),
  pgr_max_telemark_prof_percent NUMBER(6,3),
  pgr_tobacco_inv_counter_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT pgr_tobacco_inv_counter_swi_ck CHECK (PGR_TOBACCO_INV_COUNTER_SWITCH IN (0, 1)),
  pgr_report_counter_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT pgr_report_counter_switch_ck CHECK (pgr_report_counter_switch IN (0, 1)),
  pgr_growth_percentage NUMBER(6,3) DEFAULT 0 NOT NULL,
  pgr_coca_code NUMBER(10),
  CONSTRAINT pgr_pk PRIMARY KEY (pgr_code),
  CONSTRAINT pgr_coca_fk FOREIGN KEY (pgr_coca_code) REFERENCES phenix.contract_categories (coca_code)
);
COMMENT ON TABLE phenix.product_groups IS 'Groupement hièrachique de produit';
COMMENT ON COLUMN phenix.product_groups.pgr_code IS 'Numéro de groupe';
COMMENT ON COLUMN phenix.product_groups.pgr_description IS 'Description';
COMMENT ON COLUMN phenix.product_groups.pgr_commission_percent IS 'Pourcentage de profit pour les commissions';
COMMENT ON COLUMN phenix.product_groups.pgr_price_change_switch IS 'Indique si le coûtant du produit pour ce groupe peut-être modifié durant une commande d''achat';
COMMENT ON COLUMN phenix.product_groups.pgr_tobacco_switch IS 'Indique si le groupe est associé aux produits tabacs. (Change la longueur du champs PGR_DESCRIPTION à VARCHAR2(15) si à 1)';
COMMENT ON COLUMN phenix.product_groups.pgr_alt_description IS 'Description alternative';
COMMENT ON COLUMN phenix.product_groups.pgr_updt_by_broker_switch IS 'Indique si les produits asscié à un groupe sera mis à jour via le courtier';
COMMENT ON COLUMN phenix.product_groups.pgr_sales_format IS 'Indique le fomat de vente par défaut';
COMMENT ON COLUMN phenix.product_groups.pgr_maximum_profit_percent IS 'Pourcentage maximum de profit pour ce groupe';
COMMENT ON COLUMN phenix.product_groups.pgr_minimum_profit_percent IS 'Pourcentage minimum de profit pour ce groupe';
COMMENT ON COLUMN phenix.product_groups.pgr_invoice_counter_switch IS 'Indique si doit être compté dans le sommaire de la facturation';
COMMENT ON COLUMN phenix.product_groups.pgr_auto_adjustment_switch IS 'Indique si l''ajustement sera recalculé automatiquement au changement de prix ou à la recalculation du coût moyen';
COMMENT ON COLUMN phenix.product_groups.pgr_min_telemark_prof_percent IS 'Pourcentage maximum de profit pour ce groupe au niveau de télévente';
COMMENT ON COLUMN phenix.product_groups.pgr_max_telemark_prof_percent IS 'Pourcentage maximum de profit pour ce groupe au niveau de télévente';
COMMENT ON COLUMN phenix.product_groups.pgr_tobacco_inv_counter_switch IS 'Indique si la taxe tabac doit être comptée dans le sommaire de la facture';
COMMENT ON COLUMN phenix.product_groups.pgr_report_counter_switch IS 'Indique si les produits de ce groupe doivent être comptabilsés dans le rapport de rentabililté par route';
COMMENT ON COLUMN phenix.product_groups.pgr_growth_percentage IS 'Indique le pourcentage de croissance';
COMMENT ON COLUMN phenix.product_groups.pgr_coca_code IS 'Indique la classification pour les engagements des contrats';