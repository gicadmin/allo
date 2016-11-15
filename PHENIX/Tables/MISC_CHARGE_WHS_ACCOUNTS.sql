CREATE TABLE phenix.misc_charge_whs_accounts (
  mca_mct_code NUMBER(3) NOT NULL,
  mca_whs_code VARCHAR2(2 BYTE) NOT NULL,
  mca_gl_account VARCHAR2(40 BYTE) NOT NULL,
  CONSTRAINT mca_pk PRIMARY KEY (mca_mct_code,mca_whs_code) USING INDEX (CREATE UNIQUE INDEX phenix.mca_pk_i ON phenix.misc_charge_whs_accounts(mca_mct_code,mca_whs_code)    ),
  CONSTRAINT mca_mct_fk FOREIGN KEY (mca_mct_code) REFERENCES phenix.miscellaneous_charge_types (mct_code),
  CONSTRAINT mca_whs_fk FOREIGN KEY (mca_whs_code) REFERENCES phenix.warehouses (whs_code)
);
COMMENT ON TABLE phenix.misc_charge_whs_accounts IS 'Table des comptes de grand livre par entrepôt pour les types de charge diverses';
COMMENT ON COLUMN phenix.misc_charge_whs_accounts.mca_mct_code IS 'Indique le code du type de charge';
COMMENT ON COLUMN phenix.misc_charge_whs_accounts.mca_whs_code IS 'Indique le code de l''entrepôt';
COMMENT ON COLUMN phenix.misc_charge_whs_accounts.mca_gl_account IS 'Indique le compte du grand livre pour ce type de charge et cet entrepôt';