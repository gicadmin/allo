CREATE TABLE phenix.volume_rebate_grids (
  vrg_code NUMBER(3) NOT NULL,
  vrg_description VARCHAR2(30 BYTE) NOT NULL,
  vrg_alt_description VARCHAR2(30 BYTE),
  vrg_rebate_frequency VARCHAR2(1 BYTE) DEFAULT 'A' NOT NULL CONSTRAINT vrg_rebate_frequency_ck CHECK (VRG_REBATE_FREQUENCY IN ('A','B','P','Q')),
  vrg_exclude_royalty_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT vrg_exclude_royalty_switch_ck CHECK (VRG_EXCLUDE_ROYALTY_SWITCH IN (0, 1)),
  vrg_ven_exc_whs_sales_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT vrg_ven_exc_whs_sales_swi_ck CHECK (vrg_ven_exc_whs_sales_switch IN (0, 1)),
  CONSTRAINT vrg_pk PRIMARY KEY (vrg_code)
);
COMMENT ON TABLE phenix.volume_rebate_grids IS 'Grille de rabais volume';
COMMENT ON COLUMN phenix.volume_rebate_grids.vrg_code IS 'Code de la grille';
COMMENT ON COLUMN phenix.volume_rebate_grids.vrg_description IS 'Description';
COMMENT ON COLUMN phenix.volume_rebate_grids.vrg_alt_description IS 'Description alternative';
COMMENT ON COLUMN phenix.volume_rebate_grids.vrg_rebate_frequency IS 'Indique la fréquence de la grille de rabais volume';
COMMENT ON COLUMN phenix.volume_rebate_grids.vrg_exclude_royalty_switch IS 'Indique si les rabais volumes sont calculés sur le prix de vente sans tenir compte des royautés.';
COMMENT ON COLUMN phenix.volume_rebate_grids.vrg_ven_exc_whs_sales_switch IS 'Indique si on considére les ventes spécifiques au manufacturier';