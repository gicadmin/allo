CREATE TABLE phenix.user_picking_times (
  upt_id NUMBER(15) NOT NULL,
  upt_use_code NUMBER(5) NOT NULL,
  upt_whz_code VARCHAR2(2 BYTE),
  upt_method VARCHAR2(1 BYTE) NOT NULL CONSTRAINT upt_method_ck CHECK (upt_method IN ('P','T','V')),
  upt_start_date DATE NOT NULL,
  upt_end_date DATE,
  upt_whs_code VARCHAR2(2 BYTE) NOT NULL,
  upt_type VARCHAR2(1 BYTE) NOT NULL CONSTRAINT upt_type_ck CHECK (UPT_TYPE IN ('P','B')),
  CONSTRAINT upt_pk PRIMARY KEY (upt_id),
  CONSTRAINT upt_use_fk FOREIGN KEY (upt_use_code) REFERENCES phenix."USERS" (use_code),
  CONSTRAINT upt_whs_fk FOREIGN KEY (upt_whs_code) REFERENCES phenix.warehouses (whs_code),
  CONSTRAINT upt_whz_fk FOREIGN KEY (upt_whz_code) REFERENCES phenix.warehouse_zones (whz_code)
);
COMMENT ON TABLE phenix.user_picking_times IS 'Table qui contient les temps des usagers lors de la cueillette';
COMMENT ON COLUMN phenix.user_picking_times.upt_id IS 'Indique l''identifiant de la table';
COMMENT ON COLUMN phenix.user_picking_times.upt_use_code IS 'Indique le code de l''usager';
COMMENT ON COLUMN phenix.user_picking_times.upt_whz_code IS 'Indique le code de la zone';
COMMENT ON COLUMN phenix.user_picking_times.upt_method IS 'Indique la méthode utilisée lors de la cueillette';
COMMENT ON COLUMN phenix.user_picking_times.upt_start_date IS 'Indique la date de début';
COMMENT ON COLUMN phenix.user_picking_times.upt_end_date IS 'Indique la date de fin';
COMMENT ON COLUMN phenix.user_picking_times.upt_whs_code IS 'Indique l''entrepôt où a eu lieu la ceuillette';
COMMENT ON COLUMN phenix.user_picking_times.upt_type IS 'Indique quel type de temps (temps de cueillette (P=Picking) ou de pause (B=Break))';