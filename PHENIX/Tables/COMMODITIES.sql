CREATE TABLE phenix.commodities (
  cmd_code NUMBER(3) NOT NULL,
  cmd_description VARCHAR2(30 BYTE) NOT NULL,
  cmd_price NUMBER(7,2) NOT NULL,
  cmd_alt_description VARCHAR2(30 BYTE),
  cmd_fmt_code VARCHAR2(7 BYTE) NOT NULL,
  cmd_replace_avg_costs_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT cmd_replace_avg_costs_switc_ck CHECK (CMD_REPLACE_AVG_COSTS_SWITCH IN (0, 1)),
  cmd_differential_operation VARCHAR2(1 BYTE) NOT NULL CONSTRAINT cmd_differential_operation_ck CHECK (CMD_DIFFERENTIAL_OPERATION IN ('A','D','M')),
  cmd_hourly_rate NUMBER(7,2) DEFAULT 0 NOT NULL,
  CONSTRAINT cmd_pk PRIMARY KEY (cmd_code),
  CONSTRAINT cmd_fmt_fk FOREIGN KEY (cmd_fmt_code) REFERENCES phenix.formats (fmt_code)
);
COMMENT ON TABLE phenix.commodities IS 'Identifie les produits basés sur une composante influencée par les fluctuations de la bourse, identifie aussi sa valeur sur le marché boursier';
COMMENT ON COLUMN phenix.commodities.cmd_code IS 'Numéro de la commodité';
COMMENT ON COLUMN phenix.commodities.cmd_description IS 'Description';
COMMENT ON COLUMN phenix.commodities.cmd_price IS 'Prix';
COMMENT ON COLUMN phenix.commodities.cmd_alt_description IS 'Description alternative';
COMMENT ON COLUMN phenix.commodities.cmd_fmt_code IS 'Code de format';
COMMENT ON COLUMN phenix.commodities.cmd_replace_avg_costs_switch IS 'Indique si les coûts moyens sont remplacés';
COMMENT ON COLUMN phenix.commodities.cmd_differential_operation IS 'Détermine si le différentiel sur le produit est additionné ou multiplié';
COMMENT ON COLUMN phenix.commodities.cmd_hourly_rate IS 'Temps de manipulation';