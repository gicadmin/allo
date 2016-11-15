CREATE TABLE phenix.vendor_credit_types (
  vct_code VARCHAR2(2 BYTE) NOT NULL,
  vct_description VARCHAR2(30 BYTE) NOT NULL,
  vct_pick_switch NUMBER(1) NOT NULL CONSTRAINT vct_pick_switch_ck CHECK (VCT_PICK_SWITCH IN (0, 1)),
  vct_alt_description VARCHAR2(30 BYTE),
  vct_damage_switch NUMBER(1) NOT NULL CONSTRAINT vct_damage_switch_ck CHECK (VCT_DAMAGE_SWITCH IN (0, 1)),
  vct_price_source VARCHAR2(2 BYTE) NOT NULL CONSTRAINT vct_price_source_ck CHECK (VCT_PRICE_SOURCE IN ('CO', 'SE', 'MO', 'PA')),
  vct_formats_allowed_switch NUMBER(1) NOT NULL CONSTRAINT vct_formats_allowed_switch_ck CHECK (VCT_FORMATS_ALLOWED_SWITCH IN (0, 1)),
  vct_quantity_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT vct_quantity_switch_ck CHECK (VCT_QUANTITY_SWITCH IN (0, 1)),
  vct_include_consignment_switch NUMBER(1) DEFAULT 0 NOT NULL,
  vct_gl_account VARCHAR2(40 BYTE),
  vct_admin_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT vct_admin_switch_ck CHECK ( vct_admin_switch IN (0,1)),
  vct_charges_flag VARCHAR2(1 BYTE) NOT NULL CONSTRAINT vct_charges_flag_ck CHECK (
    VCT_CHARGES_FLAG IN('P', 'R', 'D')
    ),
  CONSTRAINT vct_pk PRIMARY KEY (vct_code)
);
COMMENT ON TABLE phenix.vendor_credit_types IS 'Indique les types de crédit qui sert aux notes de crédit du fournisseur';
COMMENT ON COLUMN phenix.vendor_credit_types.vct_code IS 'Numéro de type de crédit fournisseur';
COMMENT ON COLUMN phenix.vendor_credit_types.vct_description IS 'Description';
COMMENT ON COLUMN phenix.vendor_credit_types.vct_pick_switch IS 'Indique si la note de crédit exige un retour de marchandises';
COMMENT ON COLUMN phenix.vendor_credit_types.vct_alt_description IS 'Description alternative';
COMMENT ON COLUMN phenix.vendor_credit_types.vct_damage_switch IS 'Indique si la note de crédit inclus un bris de la marchandise';
COMMENT ON COLUMN phenix.vendor_credit_types.vct_price_source IS 'Source du prix';
COMMENT ON COLUMN phenix.vendor_credit_types.vct_formats_allowed_switch IS 'Indique si un autre format que le format d''achat peut être entrer';
COMMENT ON COLUMN phenix.vendor_credit_types.vct_quantity_switch IS 'Indique si le type inclus une différence entre le crédit et la facture';
COMMENT ON COLUMN phenix.vendor_credit_types.vct_include_consignment_switch IS 'Indique si la consigne est incluse dans les charges de crédit';
COMMENT ON COLUMN phenix.vendor_credit_types.vct_gl_account IS 'Indique le compte GL pour ce type de charge fournisseur';
COMMENT ON COLUMN phenix.vendor_credit_types.vct_admin_switch IS 'Indique si on peut ajouter des frais d''administration sur ce type de charges fournisseurs';
COMMENT ON COLUMN phenix.vendor_credit_types.vct_charges_flag IS 'Indique si la charge sera envoyée aux comptes à payer, aux comptes à recevoir ou selon les division du Grand Livre';