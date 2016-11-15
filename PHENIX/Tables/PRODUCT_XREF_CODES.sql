CREATE TABLE phenix.product_xref_codes (
  pxc_id NUMBER(15) NOT NULL,
  pxc_code VARCHAR2(18 BYTE) NOT NULL,
  pxc_prd_code VARCHAR2(10 BYTE) NOT NULL,
  pxc_xrg_code VARCHAR2(10 BYTE) NOT NULL,
  pxc_description VARCHAR2(30 BYTE),
  pxc_alt_description VARCHAR2(30 BYTE),
  pxc_fmt_code VARCHAR2(7 BYTE),
  CONSTRAINT pxc_pk PRIMARY KEY (pxc_id),
  CONSTRAINT pxc_xrg_prd_fmt_uk UNIQUE (pxc_xrg_code,pxc_prd_code,pxc_fmt_code),
  CONSTRAINT pxc_xrg_pxc_uk UNIQUE (pxc_xrg_code,pxc_code) USING INDEX (CREATE UNIQUE INDEX phenix.pxc_xrg_pxc_uk_i ON phenix.product_xref_codes(pxc_xrg_code,pxc_code)    ),
  CONSTRAINT pxc_fmt_fk FOREIGN KEY (pxc_fmt_code) REFERENCES phenix.formats (fmt_code) ON DELETE CASCADE,
  CONSTRAINT pxc_prd_code_fk FOREIGN KEY (pxc_prd_code) REFERENCES phenix.products (prd_code),
  CONSTRAINT pxc_xrg_code_fk FOREIGN KEY (pxc_xrg_code) REFERENCES phenix.xref_grids (xrg_code)
);
COMMENT ON COLUMN phenix.product_xref_codes.pxc_id IS 'Indique le code unique de la table';
COMMENT ON COLUMN phenix.product_xref_codes.pxc_code IS 'Indique le code du produit chez le client';
COMMENT ON COLUMN phenix.product_xref_codes.pxc_prd_code IS 'Indique le code du produit';
COMMENT ON COLUMN phenix.product_xref_codes.pxc_xrg_code IS 'Indique le code de grille des references produits';
COMMENT ON COLUMN phenix.product_xref_codes.pxc_description IS 'Indique la description du produit';
COMMENT ON COLUMN phenix.product_xref_codes.pxc_fmt_code IS 'Indique le format du produit';