CREATE TABLE phenix.module_execution_status (
  mes_id NUMBER(15) NOT NULL,
  mes_whs_code VARCHAR2(2 BYTE),
  mes_mon_code VARCHAR2(30 BYTE) NOT NULL,
  mes_sid_id NUMBER,
  CONSTRAINT mes_pk PRIMARY KEY (mes_id),
  CONSTRAINT mes_uk UNIQUE (mes_mon_code,mes_whs_code),
  CONSTRAINT mes_mon_code_fk FOREIGN KEY (mes_mon_code) REFERENCES phenix.module_names (mon_code),
  CONSTRAINT mes_whs_code_fk FOREIGN KEY (mes_whs_code) REFERENCES phenix.warehouses (whs_code)
);
COMMENT ON TABLE phenix.module_execution_status IS 'Indique la table qui contient le noms des modules et indiquent s''ils sont présentement en exécution';
COMMENT ON COLUMN phenix.module_execution_status.mes_id IS 'Indique l''identifiant de la table ';
COMMENT ON COLUMN phenix.module_execution_status.mes_whs_code IS 'Indique l''entrepôt ';
COMMENT ON COLUMN phenix.module_execution_status.mes_mon_code IS 'Indique le nom du module ';
COMMENT ON COLUMN phenix.module_execution_status.mes_sid_id IS 'Indique le numéro de la session';