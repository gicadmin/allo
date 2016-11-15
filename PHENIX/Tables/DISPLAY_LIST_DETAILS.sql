CREATE TABLE phenix.display_list_details (
  dld_id NUMBER(15) NOT NULL,
  dld_dlh_id NUMBER(15) NOT NULL,
  dld_prf_prd_code VARCHAR2(10 BYTE) NOT NULL,
  dld_prf_fmt_code VARCHAR2(7 BYTE) NOT NULL,
  dld_sequence NUMBER(5) NOT NULL,
  dld_message VARCHAR2(100 BYTE),
  dld_creation_date DATE DEFAULT SYSDATE NOT NULL,
  dld_modification_date DATE DEFAULT SYSDATE NOT NULL,
  CONSTRAINT dld_dlh_prf_uk UNIQUE (dld_dlh_id,dld_prf_prd_code,dld_prf_fmt_code),
  CONSTRAINT dld_pk PRIMARY KEY (dld_id),
  CONSTRAINT dld_dlh_fk FOREIGN KEY (dld_dlh_id) REFERENCES phenix.display_list_headers (dlh_id) ON DELETE CASCADE,
  CONSTRAINT dld_prf_fk FOREIGN KEY (dld_prf_prd_code,dld_prf_fmt_code) REFERENCES phenix.product_formats (prf_prd_code,prf_fmt_code) ON DELETE CASCADE
);
COMMENT ON TABLE phenix.display_list_details IS 'Table des groupe des listes des détails';
COMMENT ON COLUMN phenix.display_list_details.dld_id IS 'Indique l''identifiant de la table details';
COMMENT ON COLUMN phenix.display_list_details.dld_dlh_id IS 'Indique l''identifiant de la table liste';
COMMENT ON COLUMN phenix.display_list_details.dld_prf_prd_code IS 'Indique le code produit ';
COMMENT ON COLUMN phenix.display_list_details.dld_prf_fmt_code IS 'Indique le code format du produit';
COMMENT ON COLUMN phenix.display_list_details.dld_sequence IS 'Indique l''ordre d''affichage';
COMMENT ON COLUMN phenix.display_list_details.dld_message IS 'Indique le message pour un détail de la liste';
COMMENT ON COLUMN phenix.display_list_details.dld_creation_date IS 'Indique la date de création';
COMMENT ON COLUMN phenix.display_list_details.dld_modification_date IS 'Indique la date de modification';