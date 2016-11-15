CREATE TABLE phenix.product_log_modifs (
  plm_id NUMBER(15) NOT NULL,
  plm_use_code NUMBER(5) NOT NULL,
  plm_prd_code VARCHAR2(10 BYTE) NOT NULL,
  plm_name_champ VARCHAR2(50 BYTE) NOT NULL,
  plm_befr_modif VARCHAR2(100 BYTE),
  plm_after_modif VARCHAR2(100 BYTE),
  plm_modification_date DATE NOT NULL,
  plm_fmt_code VARCHAR2(7 BYTE),
  plm_whs_code VARCHAR2(2 BYTE),
  plm_modification_source VARCHAR2(50 BYTE),
  plm_ven_code NUMBER(5),
  CONSTRAINT plm_pk PRIMARY KEY (plm_id),
  CONSTRAINT plm_prd_fk FOREIGN KEY (plm_prd_code) REFERENCES phenix.products (prd_code) ON DELETE CASCADE,
  CONSTRAINT plm_use_fk FOREIGN KEY (plm_use_code) REFERENCES phenix."USERS" (use_code),
  CONSTRAINT plm_ven_fk FOREIGN KEY (plm_ven_code) REFERENCES phenix.vendors (ven_code) ON DELETE CASCADE
);
COMMENT ON TABLE phenix.product_log_modifs IS 'Table utilisée pour les modifications sur les données de la table Products';
COMMENT ON COLUMN phenix.product_log_modifs.plm_id IS 'Indique le numéro de la modification';
COMMENT ON COLUMN phenix.product_log_modifs.plm_use_code IS 'Indique le code de l usager qui a fait les modifications';
COMMENT ON COLUMN phenix.product_log_modifs.plm_prd_code IS 'Indique le code du produit dont les données ont été modifiées';
COMMENT ON COLUMN phenix.product_log_modifs.plm_name_champ IS 'Indique le nom du champ qui a été modifié';
COMMENT ON COLUMN phenix.product_log_modifs.plm_befr_modif IS 'Indique la valeur avant la modification';
COMMENT ON COLUMN phenix.product_log_modifs.plm_after_modif IS 'Indique la valeur après la modification';
COMMENT ON COLUMN phenix.product_log_modifs.plm_modification_date IS 'Indique la date de la modification';
COMMENT ON COLUMN phenix.product_log_modifs.plm_fmt_code IS 'Indique le format du produit relié à la modification.';
COMMENT ON COLUMN phenix.product_log_modifs.plm_whs_code IS 'Indique le code de l''entrepôt relié à la modification.';
COMMENT ON COLUMN phenix.product_log_modifs.plm_modification_source IS 'Indique la source d''où provenait la modification.';
COMMENT ON COLUMN phenix.product_log_modifs.plm_ven_code IS 'Indique le code du fournisseur du produit modifié (lorsque la modification concerne un produit fournisseur) ';