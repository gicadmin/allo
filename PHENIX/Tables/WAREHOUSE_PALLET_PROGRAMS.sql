CREATE TABLE phenix.warehouse_pallet_programs (
  wpp_whs_code VARCHAR2(2 BYTE) NOT NULL,
  wpp_program_code VARCHAR2(5 BYTE) NOT NULL,
  wpp_pal_code NUMBER(3),
  wpp_global_number NUMBER(10),
  wpp_customer_number NUMBER(4),
  wpp_sequence NUMBER(10) DEFAULT 0 NOT NULL,
  CONSTRAINT wpp_pk PRIMARY KEY (wpp_program_code,wpp_whs_code),
  CONSTRAINT wpp_pal_fk FOREIGN KEY (wpp_pal_code) REFERENCES phenix.pallet_types (pal_code),
  CONSTRAINT wpp_whs_fk FOREIGN KEY (wpp_whs_code) REFERENCES phenix.warehouses (whs_code) ON DELETE CASCADE
);
COMMENT ON TABLE phenix.warehouse_pallet_programs IS 'Table des programmes d''échange des palettes';
COMMENT ON COLUMN phenix.warehouse_pallet_programs.wpp_whs_code IS 'Indique le code de l''entrepôt';
COMMENT ON COLUMN phenix.warehouse_pallet_programs.wpp_program_code IS 'Indique le code du programme';
COMMENT ON COLUMN phenix.warehouse_pallet_programs.wpp_pal_code IS 'Indique le type de palette';
COMMENT ON COLUMN phenix.warehouse_pallet_programs.wpp_global_number IS 'Indique le code d''identifiant';
COMMENT ON COLUMN phenix.warehouse_pallet_programs.wpp_customer_number IS 'Indique le numéro du client';
COMMENT ON COLUMN phenix.warehouse_pallet_programs.wpp_sequence IS 'Indique la séquence lors de la génération du fichier';