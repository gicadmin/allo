CREATE TABLE phenix.module_execution_restraints (
  mer_id NUMBER(15) NOT NULL,
  mer_mon_process_code VARCHAR2(30 BYTE) NOT NULL,
  mer_mon_restraining_code VARCHAR2(30 BYTE) NOT NULL,
  CONSTRAINT mer_pk PRIMARY KEY (mer_id),
  CONSTRAINT mer_uk UNIQUE (mer_mon_process_code,mer_mon_restraining_code),
  CONSTRAINT mer_mon_process_code_fk FOREIGN KEY (mer_mon_process_code) REFERENCES phenix.module_names (mon_code),
  CONSTRAINT mer_mon_restraining_code_fk FOREIGN KEY (mer_mon_restraining_code) REFERENCES phenix.module_names (mon_code)
);
COMMENT ON TABLE phenix.module_execution_restraints IS 'Indique le lien entre les modules et les autres modules qui en causent des conflits, s''ils s''exécutent en même temps';
COMMENT ON COLUMN phenix.module_execution_restraints.mer_id IS 'Indique l''identifiant de la table';
COMMENT ON COLUMN phenix.module_execution_restraints.mer_mon_process_code IS 'Indique le nom du module à exécuter';
COMMENT ON COLUMN phenix.module_execution_restraints.mer_mon_restraining_code IS 'Indique le nom du module qui empêche l''exécution';