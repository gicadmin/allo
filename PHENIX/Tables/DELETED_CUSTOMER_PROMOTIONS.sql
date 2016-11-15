CREATE TABLE phenix.deleted_customer_promotions (
  dcp_id NUMBER(15) NOT NULL,
  dcp_cpr_id NUMBER(15) NOT NULL,
  dcp_cpr_prf_prd_code VARCHAR2(10 BYTE) NOT NULL,
  dcp_cpr_prf_fmt_code VARCHAR2(7 BYTE) NOT NULL,
  dcp_cpr_pty_code NUMBER(3) NOT NULL,
  dcp_cpr_from_date DATE NOT NULL,
  dcp_cpr_to_date DATE NOT NULL,
  dcp_deletion_date DATE DEFAULT SYSDATE NOT NULL,
  dcp_modification_date DATE DEFAULT SYSDATE NOT NULL,
  CONSTRAINT dcp_id_pk PRIMARY KEY (dcp_id) USING INDEX (CREATE INDEX phenix.dcp_id_pk_i ON phenix.deleted_customer_promotions(dcp_id)    )
);
COMMENT ON COLUMN phenix.deleted_customer_promotions.dcp_id IS 'Identifiant unique';
COMMENT ON COLUMN phenix.deleted_customer_promotions.dcp_cpr_id IS 'Code de la promotion client';
COMMENT ON COLUMN phenix.deleted_customer_promotions.dcp_cpr_prf_prd_code IS 'Code du produit de la promotion';
COMMENT ON COLUMN phenix.deleted_customer_promotions.dcp_cpr_prf_fmt_code IS 'Code de format du produit de la promotion';
COMMENT ON COLUMN phenix.deleted_customer_promotions.dcp_cpr_pty_code IS 'Type de promotion';
COMMENT ON COLUMN phenix.deleted_customer_promotions.dcp_cpr_from_date IS 'Date de début de la promotion';
COMMENT ON COLUMN phenix.deleted_customer_promotions.dcp_cpr_to_date IS 'Date de fin de la promotion';
COMMENT ON COLUMN phenix.deleted_customer_promotions.dcp_deletion_date IS 'Date à laquelle la promotion a été enlevée';
COMMENT ON COLUMN phenix.deleted_customer_promotions.dcp_modification_date IS 'Date de modification';