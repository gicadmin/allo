CREATE TABLE phenix.warehouse_source_warehouses (
  wsw_whs_code VARCHAR2(2 BYTE) NOT NULL,
  wsw_pgr_code NUMBER(5) NOT NULL,
  wsw_whs_source_code VARCHAR2(2 BYTE) NOT NULL,
  CONSTRAINT wsw_pk PRIMARY KEY (wsw_whs_code,wsw_pgr_code),
  CONSTRAINT wsw_pgr_fk FOREIGN KEY (wsw_pgr_code) REFERENCES phenix.product_groups (pgr_code),
  CONSTRAINT wsw_whs_fk FOREIGN KEY (wsw_whs_code) REFERENCES phenix.warehouses (whs_code),
  CONSTRAINT wsw_whs_source_fk FOREIGN KEY (wsw_whs_source_code) REFERENCES phenix.warehouses (whs_code)
);
COMMENT ON TABLE phenix.warehouse_source_warehouses IS 'Table utilisée pour identifier l''entrepôt de vente et l''entrepôt de cueillette des produits d''un groupe de produits';
COMMENT ON COLUMN phenix.warehouse_source_warehouses.wsw_whs_code IS 'Indique le code de l''entrepôt de livraison';
COMMENT ON COLUMN phenix.warehouse_source_warehouses.wsw_pgr_code IS 'Indique le code de groupe de produit';
COMMENT ON COLUMN phenix.warehouse_source_warehouses.wsw_whs_source_code IS 'Indique le code de l''entrepôt de cueillette pour le groupe de produit si l''entrepôt de vente ne maintient pas ce groupe';