CREATE TABLE phenix.warehouse_zone_printers (
  wzp_whz_code VARCHAR2(2 BYTE) NOT NULL,
  wzp_whs_code VARCHAR2(2 BYTE) NOT NULL,
  wzp_prn_id NUMBER(15) NOT NULL,
  CONSTRAINT wzp_pk PRIMARY KEY (wzp_whz_code,wzp_whs_code),
  CONSTRAINT wzp_prn_fk FOREIGN KEY (wzp_prn_id) REFERENCES phenix.printers (prn_id),
  CONSTRAINT wzp_whs_fk FOREIGN KEY (wzp_whs_code) REFERENCES phenix.warehouses (whs_code),
  CONSTRAINT wzp_whz_fk FOREIGN KEY (wzp_whz_code) REFERENCES phenix.warehouse_zones (whz_code)
);
COMMENT ON TABLE phenix.warehouse_zone_printers IS 'Table contenant les assiagantions des imprimantes aux zones des entrepôts';
COMMENT ON COLUMN phenix.warehouse_zone_printers.wzp_whz_code IS 'Indique la Zone de l''entrepôt concernée ';
COMMENT ON COLUMN phenix.warehouse_zone_printers.wzp_whs_code IS 'Indique l''entrepôt concernée ';
COMMENT ON COLUMN phenix.warehouse_zone_printers.wzp_prn_id IS 'Indique l''indentifiant de l''imprimante ';