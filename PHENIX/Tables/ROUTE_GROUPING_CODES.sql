CREATE TABLE phenix.route_grouping_codes (
  rgc_code NUMBER(3) NOT NULL,
  rgc_description VARCHAR2(30 BYTE) NOT NULL,
  rgc_alt_description VARCHAR2(30 BYTE),
  rgc_route_shipment_switch NUMBER(1) DEFAULT 1 NOT NULL CONSTRAINT rgc_route_shipment_switch_ck CHECK (RGC_ROUTE_SHIPMENT_SWITCH IN (0, 1)),
  rgc_cdk_code VARCHAR2(4 BYTE),
  CONSTRAINT rgc_pk PRIMARY KEY (rgc_code) USING INDEX (CREATE INDEX phenix.rgc_pk ON phenix.route_grouping_codes(rgc_code)    ),
  CONSTRAINT rgc_cdk_code_fk FOREIGN KEY (rgc_cdk_code) REFERENCES phenix.cross_docks (cdk_code)
);
COMMENT ON TABLE phenix.route_grouping_codes IS 'Table pour créer des regroupements de route utilisés au chargement des camions';
COMMENT ON COLUMN phenix.route_grouping_codes.rgc_code IS 'Indique le code du regroupement de routes';
COMMENT ON COLUMN phenix.route_grouping_codes.rgc_description IS 'Indique la description du regroupement de routes';
COMMENT ON COLUMN phenix.route_grouping_codes.rgc_alt_description IS 'Indique la description alternative du regroupement de routes';
COMMENT ON COLUMN phenix.route_grouping_codes.rgc_route_shipment_switch IS 'Indique si le chargement par route sera effectué pour le regroupement de routes';
COMMENT ON COLUMN phenix.route_grouping_codes.rgc_cdk_code IS 'Indique le code du cross-dock attribué au regroupement de route';