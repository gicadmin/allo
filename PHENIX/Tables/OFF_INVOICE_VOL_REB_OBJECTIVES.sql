CREATE TABLE phenix.off_invoice_vol_reb_objectives (
  ovo_id NUMBER(15) NOT NULL,
  ovo_ovg_code NUMBER(5) NOT NULL,
  ovo_objective NUMBER(7,2) NOT NULL,
  ovo_rebate_percent NUMBER(6,3) NOT NULL,
  CONSTRAINT ovo_pk PRIMARY KEY (ovo_id),
  CONSTRAINT ovo_uk UNIQUE (ovo_ovg_code,ovo_objective),
  CONSTRAINT ovo_ovg_fk FOREIGN KEY (ovo_ovg_code) REFERENCES phenix.off_invoice_vol_rebate_grids (ovg_code) ON DELETE CASCADE
);
COMMENT ON TABLE phenix.off_invoice_vol_reb_objectives IS 'Table utilisée pour les objectifs des grilles de rabais volume sur facture';
COMMENT ON COLUMN phenix.off_invoice_vol_reb_objectives.ovo_id IS 'Indique l''identifiant de la clé primaire';
COMMENT ON COLUMN phenix.off_invoice_vol_reb_objectives.ovo_ovg_code IS 'Indique le code de la grille de rabais volume sur facture';
COMMENT ON COLUMN phenix.off_invoice_vol_reb_objectives.ovo_objective IS 'Indique le montant visé pour obtenir le rabais volume sur facture';
COMMENT ON COLUMN phenix.off_invoice_vol_reb_objectives.ovo_rebate_percent IS 'Indique le pourcentage de rabais volume sur facture obtenu lorsque le montant visé est atteint';