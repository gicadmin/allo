CREATE TABLE phenix.deleted_price_changes (
  dpc_id NUMBER(15) NOT NULL,
  dpc_prx_id NUMBER(15) NOT NULL,
  dpc_prx_prf_prd_code VARCHAR2(10 BYTE),
  dpc_prx_prf_fmt_code VARCHAR2(7 BYTE),
  dpc_prx_vpd_code VARCHAR2(15 BYTE),
  dpc_prx_vpd_ven_code NUMBER(5),
  dpc_prx_effective_date DATE NOT NULL,
  dpc_deletion_date DATE DEFAULT SYSDATE NOT NULL,
  dpc_modification_date DATE DEFAULT SYSDATE NOT NULL,
  CONSTRAINT dpc_id_pk PRIMARY KEY (dpc_id) USING INDEX (CREATE INDEX phenix.dpc_id_pk_i ON phenix.deleted_price_changes(dpc_id)    )
);
COMMENT ON COLUMN phenix.deleted_price_changes.dpc_id IS 'Identifiant unique';
COMMENT ON COLUMN phenix.deleted_price_changes.dpc_prx_id IS 'Code de changement de prix';
COMMENT ON COLUMN phenix.deleted_price_changes.dpc_prx_prf_prd_code IS 'Code de produit de la promotion';
COMMENT ON COLUMN phenix.deleted_price_changes.dpc_prx_prf_fmt_code IS 'Code de format du produit de la promotion';
COMMENT ON COLUMN phenix.deleted_price_changes.dpc_prx_vpd_code IS 'Numéro de produit du fournisseur';
COMMENT ON COLUMN phenix.deleted_price_changes.dpc_prx_vpd_ven_code IS 'Numéro du fournisseur';
COMMENT ON COLUMN phenix.deleted_price_changes.dpc_prx_effective_date IS 'Date à laquelle le changement devait être fait';
COMMENT ON COLUMN phenix.deleted_price_changes.dpc_deletion_date IS 'Date à laquelle le changement de prix a été supprimé';
COMMENT ON COLUMN phenix.deleted_price_changes.dpc_modification_date IS 'Date de modification';