CREATE TABLE phenix.customer_log_modifs (
  clm_id NUMBER(15) NOT NULL,
  clm_use_code NUMBER(5) NOT NULL,
  clm_cus_code NUMBER(10) NOT NULL,
  clm_name_field VARCHAR2(30 BYTE) NOT NULL,
  clm_befr_modif VARCHAR2(100 BYTE),
  clm_after_modif VARCHAR2(100 BYTE),
  clm_modification_date DATE NOT NULL,
  clm_modification_source VARCHAR2(50 BYTE) NOT NULL,
  clm_edi_code NUMBER(3),
  clm_cmt_id NUMBER(15),
  clm_con_id NUMBER(15),
  clm_rou_code NUMBER(5),
  clm_vcl_id NUMBER(15),
  clm_tec_id NUMBER(15),
  clm_pty_code NUMBER(3),
  clm_ctt_code NUMBER(3),
  clm_cuc_prf_prd_code VARCHAR2(10 BYTE),
  clm_cuc_prf_fmt_code VARCHAR2(7 BYTE),
  clm_cls_code NUMBER(3),
  clm_crc_id NUMBER(15),
  clm_cva_id NUMBER(15),
  clm_sch_code NUMBER(6),
  clm_doc_code NUMBER(10),
  CONSTRAINT clm_use_fk FOREIGN KEY (clm_use_code) REFERENCES phenix."USERS" (use_code)
);
COMMENT ON TABLE phenix.customer_log_modifs IS 'Table contenant les log de modification de la table CUSTOMERS';
COMMENT ON COLUMN phenix.customer_log_modifs.clm_id IS 'Indique le id de la table';
COMMENT ON COLUMN phenix.customer_log_modifs.clm_use_code IS 'Indique l''utilisateur qui a effectué le changement';
COMMENT ON COLUMN phenix.customer_log_modifs.clm_cus_code IS 'Indique le code du client qui a subi un changement';
COMMENT ON COLUMN phenix.customer_log_modifs.clm_name_field IS 'Indique le nom du champ qui a changé';
COMMENT ON COLUMN phenix.customer_log_modifs.clm_befr_modif IS 'Indique la valeur du champ avant la modification';
COMMENT ON COLUMN phenix.customer_log_modifs.clm_after_modif IS 'Indique la valeur du champ après la modification';
COMMENT ON COLUMN phenix.customer_log_modifs.clm_modification_date IS 'Indique la date à laquelle le changement a été fait';
COMMENT ON COLUMN phenix.customer_log_modifs.clm_modification_source IS 'Indique la source changement';
COMMENT ON COLUMN phenix.customer_log_modifs.clm_edi_code IS 'Indique le code de transaction EDI';
COMMENT ON COLUMN phenix.customer_log_modifs.clm_cmt_id IS 'Indique l''identifiant de transaction courriel';
COMMENT ON COLUMN phenix.customer_log_modifs.clm_con_id IS 'Indique l''identifiant du contact client';
COMMENT ON COLUMN phenix.customer_log_modifs.clm_rou_code IS 'Indique le code la route';
COMMENT ON COLUMN phenix.customer_log_modifs.clm_vcl_id IS 'Indique l''identifiant des codes clients selon le  fournisseur';
COMMENT ON COLUMN phenix.customer_log_modifs.clm_tec_id IS 'Indique l''identifiant des clients transporteurs';
COMMENT ON COLUMN phenix.customer_log_modifs.clm_pty_code IS 'Indique l''identifiant de la promo client';
COMMENT ON COLUMN phenix.customer_log_modifs.clm_ctt_code IS 'Indique l''identifiant de la promo client';
COMMENT ON COLUMN phenix.customer_log_modifs.clm_cuc_prf_prd_code IS 'Indique le code de produit';
COMMENT ON COLUMN phenix.customer_log_modifs.clm_cuc_prf_fmt_code IS 'Indique le code de format';
COMMENT ON COLUMN phenix.customer_log_modifs.clm_cls_code IS 'Indique le code de classe de produit';
COMMENT ON COLUMN phenix.customer_log_modifs.clm_crc_id IS 'Indique l''identifiant de detaillant de client';
COMMENT ON COLUMN phenix.customer_log_modifs.clm_cva_id IS 'Indique l''identifiant de l association entre client et fournisseur';
COMMENT ON COLUMN phenix.customer_log_modifs.clm_sch_code IS 'Indique le code de l''horaire';
COMMENT ON COLUMN phenix.customer_log_modifs.clm_doc_code IS 'Indique le code du document';