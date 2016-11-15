CREATE TABLE phenix.vendor_groups (
  vgr_code NUMBER(5) NOT NULL,
  vgr_description VARCHAR2(30 BYTE) NOT NULL,
  vgr_alt_description VARCHAR2(30 BYTE),
  CONSTRAINT vgr_pk PRIMARY KEY (vgr_code)
);
COMMENT ON TABLE phenix.vendor_groups IS 'Table des groupe de fournisseurs';
COMMENT ON COLUMN phenix.vendor_groups.vgr_code IS 'Indique le code du groupe de fournisseur';
COMMENT ON COLUMN phenix.vendor_groups.vgr_description IS 'Indique la description du groupe de fournisseur';
COMMENT ON COLUMN phenix.vendor_groups.vgr_alt_description IS 'Indique la description alternative du groupe de fournisseur';