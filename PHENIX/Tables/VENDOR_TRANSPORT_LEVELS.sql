CREATE TABLE phenix.vendor_transport_levels (
  vtl_id NUMBER(15) NOT NULL,
  vtl_vtr_id NUMBER(15) NOT NULL,
  vtl_lower_boundary NUMBER(9,3) NOT NULL,
  vtl_upper_boundary NUMBER(9,3) NOT NULL,
  vtl_charge_rate NUMBER(8,3) NOT NULL,
  CONSTRAINT vtl_pk PRIMARY KEY (vtl_id),
  CONSTRAINT vtl_vtr_id_fk FOREIGN KEY (vtl_vtr_id) REFERENCES phenix.vendor_transport_agreements (vtr_id) ON DELETE CASCADE
);
COMMENT ON TABLE phenix.vendor_transport_levels IS 'Table utilisée pour garder les différents niveaux de frais à charger pour les transports';
COMMENT ON COLUMN phenix.vendor_transport_levels.vtl_id IS 'Indique le numéro unique (ID) de la table';
COMMENT ON COLUMN phenix.vendor_transport_levels.vtl_vtr_id IS 'Indique le code de l''entente de transport';
COMMENT ON COLUMN phenix.vendor_transport_levels.vtl_lower_boundary IS 'Indique la limite inférieure de ce niveau';
COMMENT ON COLUMN phenix.vendor_transport_levels.vtl_upper_boundary IS 'Indique la limite supérieure de ce niveau';
COMMENT ON COLUMN phenix.vendor_transport_levels.vtl_charge_rate IS 'Indique les frais à charger pour ce niveau';