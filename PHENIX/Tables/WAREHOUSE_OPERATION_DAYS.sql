CREATE TABLE phenix.warehouse_operation_days (
  wod_whs_code VARCHAR2(2 BYTE) NOT NULL,
  wod_day NUMBER(1) NOT NULL CONSTRAINT wod_day_ck CHECK (WOD_DAY IN (1,2,3,4,5,6,7)),
  wod_operation VARCHAR2(3 BYTE) NOT NULL CONSTRAINT wod_operation_ck CHECK (WOD_OPERATION IN ('DEL', 'REC')),
  CONSTRAINT wod_pk PRIMARY KEY (wod_whs_code,wod_day,wod_operation) USING INDEX (CREATE INDEX phenix.wod_pk ON phenix.warehouse_operation_days(wod_whs_code,wod_day,wod_operation)    ),
  CONSTRAINT wod_whs_fk FOREIGN KEY (wod_whs_code) REFERENCES phenix.warehouses (whs_code) ON DELETE CASCADE
);
COMMENT ON TABLE phenix.warehouse_operation_days IS 'Table des jours d''opération pour les entrepôts';
COMMENT ON COLUMN phenix.warehouse_operation_days.wod_whs_code IS 'Indique le code de l''entrepôt';
COMMENT ON COLUMN phenix.warehouse_operation_days.wod_day IS 'Indique le jour d''opération';
COMMENT ON COLUMN phenix.warehouse_operation_days.wod_operation IS 'Indique le type d''opération';