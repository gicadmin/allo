CREATE TABLE phenix.vend_order_agreement_headers (
  voah_id NUMBER(15) NOT NULL,
  voah_ven_code NUMBER(5) NOT NULL,
  voah_qualifier VARCHAR2(4 BYTE) NOT NULL CONSTRAINT voah_qualifier_ck CHECK (VOAH_QUALIFIER IN ('TPAH', 'TPAB', 'OAGR')),
  voah_agreement_id VARCHAR2(9 BYTE) NOT NULL,
  voah_description VARCHAR2(40 BYTE) NOT NULL,
  voah_alt_description VARCHAR2(40 BYTE),
  voah_source VARCHAR2(1 BYTE) NOT NULL CONSTRAINT voah_source_ck CHECK (VOAH_SOURCE IN ('I', 'S')),
  voah_creation_date DATE DEFAULT SYSDATE NOT NULL,
  voah_modification_date DATE DEFAULT SYSDATE NOT NULL,
  CONSTRAINT voah_pk PRIMARY KEY (voah_id) USING INDEX (CREATE UNIQUE INDEX phenix.voah_pk_i ON phenix.vend_order_agreement_headers(voah_id)    ),
  CONSTRAINT voah_uk UNIQUE (voah_ven_code,voah_qualifier,voah_agreement_id) USING INDEX (CREATE UNIQUE INDEX phenix.voah_uk_i ON phenix.vend_order_agreement_headers(voah_ven_code,voah_qualifier,voah_agreement_id)    ),
  CONSTRAINT voah_ven_fk FOREIGN KEY (voah_ven_code) REFERENCES phenix.vendors (ven_code)
);
COMMENT ON TABLE phenix.vend_order_agreement_headers IS 'Table des ententes partenaires';
COMMENT ON COLUMN phenix.vend_order_agreement_headers.voah_id IS 'Indique l''identifiant unique';
COMMENT ON COLUMN phenix.vend_order_agreement_headers.voah_ven_code IS 'Indique le code du fournisseur';
COMMENT ON COLUMN phenix.vend_order_agreement_headers.voah_qualifier IS 'Indique le type d''entente partenaire';
COMMENT ON COLUMN phenix.vend_order_agreement_headers.voah_agreement_id IS 'Indique le numéro de l''entente partenaire chez le fournisseur';
COMMENT ON COLUMN phenix.vend_order_agreement_headers.voah_description IS 'Indique la description de l''entente partenaire';
COMMENT ON COLUMN phenix.vend_order_agreement_headers.voah_alt_description IS 'Indique la description alternative de l''entente partenaire';
COMMENT ON COLUMN phenix.vend_order_agreement_headers.voah_source IS 'Indique la source de l''entente partenaire';
COMMENT ON COLUMN phenix.vend_order_agreement_headers.voah_creation_date IS 'Indique la date de création de l''entente partenaire';
COMMENT ON COLUMN phenix.vend_order_agreement_headers.voah_modification_date IS 'Indique la date de modification de l''entente partenaire';