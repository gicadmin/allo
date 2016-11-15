CREATE TABLE phenix.vendor_warehouse_groups (
  vwg_vwh_ven_code NUMBER(5) NOT NULL,
  vwg_vwh_whs_code VARCHAR2(2 BYTE) NOT NULL,
  vwg_pgr_code NUMBER(5) NOT NULL,
  vwg_cutoff_time VARCHAR2(5 BYTE) CONSTRAINT vwg_cutoff_time_ck CHECK (REGEXP_LIKE(VWG_CUTOFF_TIME,'^(20|21|22|23|[01][[:digit:]]|[[:digit:]])(([:][0-5][[:digit:]]){1})$')),
  vwg_delivery_gap NUMBER(2),
  vwg_percent_extra NUMBER(5,2),
  CONSTRAINT vwg_pk PRIMARY KEY (vwg_vwh_ven_code,vwg_vwh_whs_code,vwg_pgr_code) USING INDEX (CREATE UNIQUE INDEX phenix.vwg_pk_i ON phenix.vendor_warehouse_groups(vwg_vwh_ven_code,vwg_vwh_whs_code,vwg_pgr_code)    ),
  CONSTRAINT vwg_pgr_fk FOREIGN KEY (vwg_pgr_code) REFERENCES phenix.product_groups (pgr_code),
  CONSTRAINT vwg_vwh_fk FOREIGN KEY (vwg_vwh_ven_code,vwg_vwh_whs_code) REFERENCES phenix.vendor_warehouses (vwh_ven_code,vwh_whs_code) ON DELETE CASCADE
);
COMMENT ON TABLE phenix.vendor_warehouse_groups IS 'Table qui lie le fournisseur au groupe de produit pour la ligne bleue';
COMMENT ON COLUMN phenix.vendor_warehouse_groups.vwg_vwh_ven_code IS 'Indique le code du fournisseur';
COMMENT ON COLUMN phenix.vendor_warehouse_groups.vwg_vwh_whs_code IS 'Indique le code d''entrepôt';
COMMENT ON COLUMN phenix.vendor_warehouse_groups.vwg_pgr_code IS 'Indique le code du groupe de produit';
COMMENT ON COLUMN phenix.vendor_warehouse_groups.vwg_cutoff_time IS 'Indique l''heure du cut off pour la commande';
COMMENT ON COLUMN phenix.vendor_warehouse_groups.vwg_delivery_gap IS 'Indique le délai de livraison';
COMMENT ON COLUMN phenix.vendor_warehouse_groups.vwg_percent_extra IS 'Indique le pourcentage d''extra';