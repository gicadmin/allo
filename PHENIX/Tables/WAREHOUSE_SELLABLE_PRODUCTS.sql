CREATE TABLE phenix.warehouse_sellable_products (
  wsp_prw_whs_delivery_code VARCHAR2(2 BYTE) NOT NULL,
  wsp_prw_prd_code VARCHAR2(10 BYTE) NOT NULL,
  wsp_whs_picking_code VARCHAR2(2 BYTE) NOT NULL,
  wsp_pgr_code NUMBER(5),
  CONSTRAINT wsp_pk PRIMARY KEY (wsp_prw_whs_delivery_code,wsp_prw_prd_code),
  CONSTRAINT wsp_pgr_fk FOREIGN KEY (wsp_pgr_code) REFERENCES phenix.product_groups (pgr_code),
  CONSTRAINT wsp_prw_fk FOREIGN KEY (wsp_prw_prd_code,wsp_prw_whs_delivery_code) REFERENCES phenix.product_warehouses (prw_prd_code,prw_whs_code) ON DELETE CASCADE,
  CONSTRAINT wsp_whs_picking_fk FOREIGN KEY (wsp_whs_picking_code) REFERENCES phenix.warehouses (whs_code)
);
COMMENT ON TABLE phenix.warehouse_sellable_products IS 'Table permettant de voir quel entrepôt livre et cueille quel produit';
COMMENT ON COLUMN phenix.warehouse_sellable_products.wsp_prw_whs_delivery_code IS 'Indique l''entrepôt de livraison du produit';
COMMENT ON COLUMN phenix.warehouse_sellable_products.wsp_prw_prd_code IS 'Indique le code du produit';
COMMENT ON COLUMN phenix.warehouse_sellable_products.wsp_whs_picking_code IS 'Indique l''entrepôt de cueillette du produit';
COMMENT ON COLUMN phenix.warehouse_sellable_products.wsp_pgr_code IS 'Indique le code de groupe de produit';