CREATE TABLE phenix.off_invoice_vol_rebate_grids (
  ovg_code NUMBER(5) NOT NULL,
  ovg_description VARCHAR2(30 BYTE) NOT NULL,
  ovg_alt_description VARCHAR2(30 BYTE),
  CONSTRAINT ovg_pk PRIMARY KEY (ovg_code)
);
COMMENT ON TABLE phenix.off_invoice_vol_rebate_grids IS 'Table utilisée pour les grilles de rabais volume sur facture';
COMMENT ON COLUMN phenix.off_invoice_vol_rebate_grids.ovg_code IS 'Indique le code de la grille de rabais volume sur facture';
COMMENT ON COLUMN phenix.off_invoice_vol_rebate_grids.ovg_description IS 'Indique la description de la grille de rabais volume sur facture';
COMMENT ON COLUMN phenix.off_invoice_vol_rebate_grids.ovg_alt_description IS 'Indique la description alternative de la grille de rabais volume sur facture';