CREATE GLOBAL TEMPORARY TABLE phenix.roadnet_ext_orders (
  reo_location_id VARCHAR2(15 BYTE) NOT NULL,
  reo_location_type VARCHAR2(3 BYTE) NOT NULL,
  reo_order_id VARCHAR2(15 BYTE) NOT NULL,
  reo_origin_id VARCHAR2(15 BYTE) NOT NULL,
  reo_origin_type VARCHAR2(3 BYTE) NOT NULL,
  reo_preferred_route VARCHAR2(15 BYTE),
  reo_quantity NUMBER(7),
  reo_weight NUMBER(8,3),
  reo_volume NUMBER(10,3) NOT NULL,
  reo_void_flag VARCHAR2(1 BYTE),
  reo_creation_date TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL,
  reo_type VARCHAR2(4 BYTE) DEFAULT 'EXP' NOT NULL,
  reo_items NUMBER(7) DEFAULT 0 NOT NULL
)
ON COMMIT DELETE ROWS;
COMMENT ON COLUMN phenix.roadnet_ext_orders.reo_items IS 'Indique le nombre d éléments dans la commande';