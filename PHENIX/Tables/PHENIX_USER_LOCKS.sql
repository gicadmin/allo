CREATE TABLE phenix.phenix_user_locks (
  pul_id NUMBER(15) NOT NULL,
  pul_use_code NUMBER(5) NOT NULL,
  pul_sid_id NUMBER NOT NULL,
  pul_menu_name VARCHAR2(60 BYTE) NOT NULL,
  pul_creation_date DATE DEFAULT SYSDATE NOT NULL,
  pul_whs_delivery_code VARCHAR2(2 BYTE),
  pul_whs_picking_code VARCHAR2(2 BYTE),
  pul_rou_code NUMBER(5),
  CONSTRAINT pul_pk PRIMARY KEY (pul_id),
  CONSTRAINT pul_rou_fk FOREIGN KEY (pul_rou_code) REFERENCES phenix.routes (rou_code),
  CONSTRAINT pul_use_code_fk FOREIGN KEY (pul_use_code) REFERENCES phenix."USERS" (use_code),
  CONSTRAINT pul_whs_delivery_fk FOREIGN KEY (pul_whs_picking_code) REFERENCES phenix.warehouses (whs_code),
  CONSTRAINT pul_whs_picking_fk FOREIGN KEY (pul_whs_delivery_code) REFERENCES phenix.warehouses (whs_code)
);
COMMENT ON TABLE phenix.phenix_user_locks IS 'Table utilisée pour empêcher plusieurs utilisateur d''aller dans certains écrans/rapports/programmes en même temps';
COMMENT ON COLUMN phenix.phenix_user_locks.pul_id IS 'Indique l''identifiant unique de la table';
COMMENT ON COLUMN phenix.phenix_user_locks.pul_use_code IS 'Indique le code de l''utilisateur';
COMMENT ON COLUMN phenix.phenix_user_locks.pul_sid_id IS 'Indique l''identifiant de session de l''utilisateur';
COMMENT ON COLUMN phenix.phenix_user_locks.pul_menu_name IS 'Indique le nom de l''option en cours';
COMMENT ON COLUMN phenix.phenix_user_locks.pul_whs_delivery_code IS 'Indique le code de l''entrepôt de livraison';
COMMENT ON COLUMN phenix.phenix_user_locks.pul_whs_picking_code IS 'Indique le code de l''entrepôt de cueillette';
COMMENT ON COLUMN phenix.phenix_user_locks.pul_rou_code IS 'Indique le code de la route';