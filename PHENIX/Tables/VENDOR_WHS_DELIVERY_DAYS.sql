CREATE TABLE phenix.vendor_whs_delivery_days (
  vwd_ven_code NUMBER(5) NOT NULL,
  vwd_whs_code VARCHAR2(2 BYTE) NOT NULL,
  vwd_day NUMBER(1) NOT NULL CONSTRAINT vwd_day_ck CHECK (VWD_DAY IN (1,2,3,4,5,6,7)),
  CONSTRAINT vwd_pk PRIMARY KEY (vwd_ven_code,vwd_whs_code,vwd_day) USING INDEX (CREATE INDEX phenix.vwd_pk ON phenix.vendor_whs_delivery_days(vwd_ven_code,vwd_whs_code,vwd_day)    ),
  CONSTRAINT vwd_vwh_fk FOREIGN KEY (vwd_ven_code,vwd_whs_code) REFERENCES phenix.vendor_warehouses (vwh_ven_code,vwh_whs_code) ON DELETE CASCADE
);
COMMENT ON TABLE phenix.vendor_whs_delivery_days IS 'Table des jours de livraison par fournisseur / entrepôt';
COMMENT ON COLUMN phenix.vendor_whs_delivery_days.vwd_ven_code IS 'Indique le code du fournisseur';
COMMENT ON COLUMN phenix.vendor_whs_delivery_days.vwd_whs_code IS 'Indique le code de l''entrepôt';
COMMENT ON COLUMN phenix.vendor_whs_delivery_days.vwd_day IS 'Indique le jour de livraison';