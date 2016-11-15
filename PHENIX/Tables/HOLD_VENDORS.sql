CREATE TABLE phenix.hold_vendors (
  hvn_broker_ven_code NUMBER(5) NOT NULL,
  hvn_update_type VARCHAR2(1 BYTE) NOT NULL CONSTRAINT hvn_update_type_ck CHECK (HVN_UPDATE_TYPE IN ('A', 'D')),
  hvn_address VARCHAR2(45 BYTE),
  hvn_buyer VARCHAR2(30 BYTE),
  hvn_city VARCHAR2(30 BYTE),
  hvn_contact_1 VARCHAR2(20 BYTE),
  hvn_contact_2 VARCHAR2(20 BYTE),
  hvn_fax NUMBER(11),
  hvn_name VARCHAR2(30 BYTE),
  hvn_postal_code VARCHAR2(10 BYTE),
  hvn_province VARCHAR2(15 BYTE),
  hvn_purchase_days NUMBER(5),
  hvn_purchase_weeks NUMBER(4),
  hvn_telephone NUMBER(11),
  CONSTRAINT hvn_pk PRIMARY KEY (hvn_broker_ven_code)
);
COMMENT ON TABLE phenix.hold_vendors IS 'Table temporaire d''un fournisseur';
COMMENT ON COLUMN phenix.hold_vendors.hvn_broker_ven_code IS 'Code fournisseur';
COMMENT ON COLUMN phenix.hold_vendors.hvn_update_type IS 'Indique si le fournisseur est a jouter ou detruire';
COMMENT ON COLUMN phenix.hold_vendors.hvn_address IS 'Adresse';
COMMENT ON COLUMN phenix.hold_vendors.hvn_buyer IS 'Acheteur';
COMMENT ON COLUMN phenix.hold_vendors.hvn_city IS 'Ville';
COMMENT ON COLUMN phenix.hold_vendors.hvn_contact_1 IS 'Contact 1';
COMMENT ON COLUMN phenix.hold_vendors.hvn_contact_2 IS 'Contact 1';
COMMENT ON COLUMN phenix.hold_vendors.hvn_fax IS 'Numéro de fax';
COMMENT ON COLUMN phenix.hold_vendors.hvn_name IS 'Nom du fournisseur';
COMMENT ON COLUMN phenix.hold_vendors.hvn_postal_code IS 'Code postal';
COMMENT ON COLUMN phenix.hold_vendors.hvn_province IS 'Province';
COMMENT ON COLUMN phenix.hold_vendors.hvn_purchase_days IS 'Contient les journées allouées à l''achat';
COMMENT ON COLUMN phenix.hold_vendors.hvn_purchase_weeks IS 'Contient les semaines allouées à l''achat';
COMMENT ON COLUMN phenix.hold_vendors.hvn_telephone IS 'Numéro de téléphone';