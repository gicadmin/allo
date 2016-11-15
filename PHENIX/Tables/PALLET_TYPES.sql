CREATE TABLE phenix.pallet_types (
  pal_code NUMBER(3) NOT NULL,
  pal_description VARCHAR2(15 BYTE) NOT NULL,
  pal_alt_description VARCHAR2(15 BYTE),
  pal_pallet_price NUMBER(7,2) DEFAULT 0 NOT NULL,
  pal_provincial_tax_switch NUMBER(1) DEFAULT 0 NOT NULL,
  pal_federal_tax_switch NUMBER(1) DEFAULT 0 NOT NULL,
  pal_invoice_vendor_switch NUMBER(1) DEFAULT 0 NOT NULL,
  pal_invoice_customer_switch NUMBER(1) DEFAULT 0 NOT NULL,
  pal_invoice_carrier_switch NUMBER(1) DEFAULT 0 NOT NULL,
  CONSTRAINT pal_pk PRIMARY KEY (pal_code)
);
COMMENT ON TABLE phenix.pallet_types IS 'Table contenant les différents types de palette';
COMMENT ON COLUMN phenix.pallet_types.pal_code IS 'Numéro du type de palette';
COMMENT ON COLUMN phenix.pallet_types.pal_description IS 'Description';
COMMENT ON COLUMN phenix.pallet_types.pal_alt_description IS 'Description alternative';
COMMENT ON COLUMN phenix.pallet_types.pal_pallet_price IS 'Indique le montant à facturer / créditer par palette.';
COMMENT ON COLUMN phenix.pallet_types.pal_provincial_tax_switch IS 'Indique si la taxe provinciale est applicable';
COMMENT ON COLUMN phenix.pallet_types.pal_federal_tax_switch IS 'Indique si la taxe fédérale est applicable';
COMMENT ON COLUMN phenix.pallet_types.pal_invoice_vendor_switch IS 'Indique si les transactions fournisseur sont facturées';
COMMENT ON COLUMN phenix.pallet_types.pal_invoice_customer_switch IS 'Indique si les transactions clients sont facturées';
COMMENT ON COLUMN phenix.pallet_types.pal_invoice_carrier_switch IS 'Indique si les transactions transporteur sont facturées';