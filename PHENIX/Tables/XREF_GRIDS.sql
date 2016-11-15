CREATE TABLE phenix.xref_grids (
  xrg_code VARCHAR2(10 BYTE) NOT NULL,
  xrg_description VARCHAR2(30 BYTE) NOT NULL,
  xrg_alt_description VARCHAR2(30 BYTE),
  xrg_interface_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT xrg_interface_switch_ck CHECK (XRG_INTERFACE_SWITCH IN (0,1)),
  CONSTRAINT xrg_pk PRIMARY KEY (xrg_code)
);
COMMENT ON COLUMN phenix.xref_grids.xrg_code IS 'Indique le code de la  grilles';
COMMENT ON COLUMN phenix.xref_grids.xrg_description IS 'Indique la description de la grilles';
COMMENT ON COLUMN phenix.xref_grids.xrg_alt_description IS 'Indique La description alternative';
COMMENT ON COLUMN phenix.xref_grids.xrg_interface_switch IS 'Indique si on génère des fichiers interface pour les factures, crédits, et inventaire.';