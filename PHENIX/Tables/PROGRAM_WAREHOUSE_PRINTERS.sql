CREATE TABLE phenix.program_warehouse_printers (
  pwp_pro_id NUMBER(38) NOT NULL,
  pwp_whs_code VARCHAR2(2 BYTE) NOT NULL,
  pwp_prn_id NUMBER(38) NOT NULL,
  CONSTRAINT pwp_pk PRIMARY KEY (pwp_pro_id,pwp_whs_code),
  CONSTRAINT pwp_prn_fk FOREIGN KEY (pwp_prn_id) REFERENCES phenix.printers (prn_id),
  CONSTRAINT pwp_pro_fk FOREIGN KEY (pwp_pro_id) REFERENCES phenix.programs (pro_id),
  CONSTRAINT pwp_whs_code_fk FOREIGN KEY (pwp_whs_code) REFERENCES phenix.warehouses (whs_code)
);
COMMENT ON TABLE phenix.program_warehouse_printers IS 'Table permettant de définir une imprimante par défaut par entrepôt pour les rapports';
COMMENT ON COLUMN phenix.program_warehouse_printers.pwp_pro_id IS 'Indique l''identifiant unique de la tâche (rapport) concernée';
COMMENT ON COLUMN phenix.program_warehouse_printers.pwp_whs_code IS 'Indique le code de l''entrepôt pour lequel on veut spécifier une imprimante';
COMMENT ON COLUMN phenix.program_warehouse_printers.pwp_prn_id IS 'Indique l''identifiant unique de l''imprimante';