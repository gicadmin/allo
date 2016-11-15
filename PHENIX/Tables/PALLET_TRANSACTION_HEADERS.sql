CREATE TABLE phenix.pallet_transaction_headers (
  pth_id NUMBER(15) NOT NULL,
  pth_cus_code NUMBER(10),
  pth_ven_code NUMBER(5),
  pth_car_code NUMBER(5),
  pth_trans_date DATE NOT NULL,
  pth_reference_number VARCHAR2(15 BYTE),
  pth_carrier_responsible_switch NUMBER(1) NOT NULL,
  pth_shh_id NUMBER(15),
  pth_whs_code VARCHAR2(2 BYTE) NOT NULL,
  CONSTRAINT pth_cus_ven_car_ck CHECK ((PTH_CUS_CODE IS NOT NULL AND PTH_VEN_CODE IS NULL)
																				OR (PTH_CUS_CODE IS NULL AND PTH_VEN_CODE IS NOT NULL)
																				OR (PTH_CUS_CODE IS NULL AND PTH_VEN_CODE IS NULL AND PTH_CAR_CODE IS NOT NULL)),
  CONSTRAINT pth_pk PRIMARY KEY (pth_id),
  CONSTRAINT pth_car_code_fk FOREIGN KEY (pth_car_code) REFERENCES phenix.carriers (car_code),
  CONSTRAINT pth_cus_code_fk FOREIGN KEY (pth_cus_code) REFERENCES phenix.customers (cus_code),
  CONSTRAINT pth_shh_fk FOREIGN KEY (pth_shh_id) REFERENCES phenix.shipment_headers (shh_id) ON DELETE CASCADE,
  CONSTRAINT pth_ven_code_fk FOREIGN KEY (pth_ven_code) REFERENCES phenix.vendors (ven_code),
  CONSTRAINT pth_whs_fk FOREIGN KEY (pth_whs_code) REFERENCES phenix.warehouses (whs_code)
);
COMMENT ON TABLE phenix.pallet_transaction_headers IS 'Cette table contient l''information sur les transactions de palettes';
COMMENT ON COLUMN phenix.pallet_transaction_headers.pth_id IS 'Numéro de la transaction';
COMMENT ON COLUMN phenix.pallet_transaction_headers.pth_cus_code IS 'Code du client';
COMMENT ON COLUMN phenix.pallet_transaction_headers.pth_ven_code IS 'Code du fournisseur';
COMMENT ON COLUMN phenix.pallet_transaction_headers.pth_car_code IS 'Code du transporteur';
COMMENT ON COLUMN phenix.pallet_transaction_headers.pth_trans_date IS 'Date de la transaction';
COMMENT ON COLUMN phenix.pallet_transaction_headers.pth_reference_number IS 'Numéro de référence';
COMMENT ON COLUMN phenix.pallet_transaction_headers.pth_carrier_responsible_switch IS 'Indique si le transporteur est responsable des palettes';
COMMENT ON COLUMN phenix.pallet_transaction_headers.pth_shh_id IS 'Indique le ID de l''entête d''expédition';
COMMENT ON COLUMN phenix.pallet_transaction_headers.pth_whs_code IS 'Indique l''entrepôt de la palette';