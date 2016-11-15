CREATE GLOBAL TEMPORARY TABLE phenix.roadnet_imp_orders (
  rio_location_id VARCHAR2(15 BYTE) NOT NULL,
  rio_location_type VARCHAR2(3 BYTE) NOT NULL,
  rio_route VARCHAR2(15 BYTE) NOT NULL,
  rio_position NUMBER(10) NOT NULL,
  rio_priority TIMESTAMP NOT NULL,
  rio_truck_code VARCHAR2(8 BYTE),
  rio_delivery_date DATE NOT NULL
)
ON COMMIT DELETE ROWS;
COMMENT ON COLUMN phenix.roadnet_imp_orders.rio_delivery_date IS 'Indique la date de livraison de la route';