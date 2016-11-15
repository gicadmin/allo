CREATE TABLE phenix.vendor_transport_service_types (
  vts_code VARCHAR2(10 BYTE) NOT NULL,
  vts_description VARCHAR2(30 BYTE) NOT NULL,
  vts_alt_description VARCHAR2(30 BYTE),
  vts_provincial_tax_switch NUMBER(1) NOT NULL CONSTRAINT vts_provincial_tax_switch_ck CHECK (VTS_PROVINCIAL_TAX_SWITCH IN (0, 1)),
  vts_federal_tax_switch NUMBER(1) NOT NULL CONSTRAINT vts_federal_tax_switch_ck CHECK (VTS_FEDERAL_TAX_SWITCH IN (0, 1)),
  CONSTRAINT vts_pk PRIMARY KEY (vts_code)
);
COMMENT ON TABLE phenix.vendor_transport_service_types IS 'Table utilisée pour maintenir les types de transport fournis';
COMMENT ON COLUMN phenix.vendor_transport_service_types.vts_code IS 'Indique le code unique du type de transport';
COMMENT ON COLUMN phenix.vendor_transport_service_types.vts_description IS 'Indique la description du type de transport';
COMMENT ON COLUMN phenix.vendor_transport_service_types.vts_alt_description IS 'Indique la description alternative du type de transport';
COMMENT ON COLUMN phenix.vendor_transport_service_types.vts_provincial_tax_switch IS 'Indique si la taxe provinciale est applicable sur ce type de transport';
COMMENT ON COLUMN phenix.vendor_transport_service_types.vts_federal_tax_switch IS 'Indique si la taxe fédérale est applicable sur ce type de transport';