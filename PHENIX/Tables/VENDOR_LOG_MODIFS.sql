CREATE TABLE phenix.vendor_log_modifs (
  vlm_id NUMBER(15) NOT NULL,
  vlm_use_code NUMBER(5) NOT NULL,
  vlm_ven_code NUMBER(5) NOT NULL,
  vlm_name_field VARCHAR2(30 BYTE) NOT NULL,
  vlm_befr_modif VARCHAR2(100 BYTE),
  vlm_after_modif VARCHAR2(100 BYTE),
  vlm_modification_date DATE NOT NULL,
  vlm_modification_source VARCHAR2(50 BYTE) NOT NULL,
  vlm_address_type VARCHAR2(2 BYTE),
  vlm_category_code VARCHAR2(2 BYTE),
  vlm_whs_code VARCHAR2(2 BYTE),
  vlm_dit_code NUMBER(3),
  vlm_edi_code NUMBER(3),
  vlm_vmt_id NUMBER(15),
  vlm_con_id NUMBER(15),
  vlm_vwg_pgr_code NUMBER(5),
  vlm_vcl_id NUMBER(15),
  vlm_tec_id NUMBER(15),
  vlm_vfe_fmt_code VARCHAR2(7 BYTE),
  vlm_dcs_cus_code NUMBER(10),
  vlm_vpra_id NUMBER(15),
  CONSTRAINT vlm_use_fk FOREIGN KEY (vlm_use_code) REFERENCES phenix."USERS" (use_code)
);
COMMENT ON TABLE phenix.vendor_log_modifs IS 'Table contenant les log de modification de la table VENDORS';
COMMENT ON COLUMN phenix.vendor_log_modifs.vlm_id IS 'Indique le id de la table';
COMMENT ON COLUMN phenix.vendor_log_modifs.vlm_use_code IS 'Indique l''utilisateur qui a effectué le changement';
COMMENT ON COLUMN phenix.vendor_log_modifs.vlm_ven_code IS 'Indique le code du fournisseur qui a subi un changement';
COMMENT ON COLUMN phenix.vendor_log_modifs.vlm_name_field IS 'Indique le nom du champ qui a changé';
COMMENT ON COLUMN phenix.vendor_log_modifs.vlm_befr_modif IS 'Indique la valeur du champ avant la modification';
COMMENT ON COLUMN phenix.vendor_log_modifs.vlm_after_modif IS 'Indique la valeur du champ après la modification';
COMMENT ON COLUMN phenix.vendor_log_modifs.vlm_modification_date IS 'Indique la date à laquelle le changement a été fait';
COMMENT ON COLUMN phenix.vendor_log_modifs.vlm_modification_source IS 'Indique la source changement';
COMMENT ON COLUMN phenix.vendor_log_modifs.vlm_address_type IS 'Indique le type d''adresse qui a subi un changement';
COMMENT ON COLUMN phenix.vendor_log_modifs.vlm_category_code IS 'Indique la catégorie de produit qui a subi un changement';
COMMENT ON COLUMN phenix.vendor_log_modifs.vlm_whs_code IS 'Indique l''entrepôt qui a subi un changement';
COMMENT ON COLUMN phenix.vendor_log_modifs.vlm_dit_code IS 'Indique l''escompte qui a subi un changement';
COMMENT ON COLUMN phenix.vendor_log_modifs.vlm_edi_code IS 'Indique le code de transaction EDI';
COMMENT ON COLUMN phenix.vendor_log_modifs.vlm_vmt_id IS 'Indique l''identifiant de transaction courriel';
COMMENT ON COLUMN phenix.vendor_log_modifs.vlm_con_id IS 'Indique l''identifiant du contact fournisseur';
COMMENT ON COLUMN phenix.vendor_log_modifs.vlm_vwg_pgr_code IS 'Indique l''identifiant des codes client selon le fournisseur';
COMMENT ON COLUMN phenix.vendor_log_modifs.vlm_vcl_id IS 'Indique l''identifiant des clients transporteurs';
COMMENT ON COLUMN phenix.vendor_log_modifs.vlm_tec_id IS 'Indique le code format';
COMMENT ON COLUMN phenix.vendor_log_modifs.vlm_vfe_fmt_code IS 'Indique le code du client';
COMMENT ON COLUMN phenix.vendor_log_modifs.vlm_dcs_cus_code IS 'Indique le code de transaction EDI';
COMMENT ON COLUMN phenix.vendor_log_modifs.vlm_vpra_id IS 'Indique l''identifiant de l''allocation donnée à l''achat';