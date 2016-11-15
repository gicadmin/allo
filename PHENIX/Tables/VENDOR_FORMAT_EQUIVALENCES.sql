CREATE TABLE phenix.vendor_format_equivalences (
  vfe_ven_code NUMBER(5) NOT NULL,
  vfe_fmt_code VARCHAR2(7 BYTE) NOT NULL,
  vfe_vendor_format VARCHAR2(3 BYTE) NOT NULL,
  CONSTRAINT vfe_pk PRIMARY KEY (vfe_ven_code,vfe_fmt_code) USING INDEX (CREATE UNIQUE INDEX phenix.vfe_pk_i ON phenix.vendor_format_equivalences(vfe_ven_code,vfe_fmt_code)    ),
  CONSTRAINT vfe_uk UNIQUE (vfe_ven_code,vfe_vendor_format) USING INDEX (CREATE UNIQUE INDEX phenix.vfe_uk_i ON phenix.vendor_format_equivalences(vfe_ven_code,vfe_vendor_format)    ),
  CONSTRAINT vfe_fmt_fk FOREIGN KEY (vfe_fmt_code) REFERENCES phenix.formats (fmt_code),
  CONSTRAINT vfe_ven_fk FOREIGN KEY (vfe_ven_code) REFERENCES phenix.vendors (ven_code)
);
COMMENT ON TABLE phenix.vendor_format_equivalences IS 'Table d''équivalence de code format selon le fournisseur';
COMMENT ON COLUMN phenix.vendor_format_equivalences.vfe_ven_code IS 'Indique le code du fournisseur';
COMMENT ON COLUMN phenix.vendor_format_equivalences.vfe_fmt_code IS 'Indique le code du format interne';
COMMENT ON COLUMN phenix.vendor_format_equivalences.vfe_vendor_format IS 'Indique le code du format utilisé par le fournisseur';