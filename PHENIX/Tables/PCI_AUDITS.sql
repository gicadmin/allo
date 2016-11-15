CREATE TABLE phenix.pci_audits (
  pau_id NUMBER(15) NOT NULL,
  pau_pus_id NUMBER(15) NOT NULL,
  pau_ip VARCHAR2(30 BYTE) NOT NULL,
  pau_operation VARCHAR2(200 BYTE) NOT NULL,
  pau_messages VARCHAR2(200 BYTE) NOT NULL,
  pau_creation_date DATE DEFAULT SYSDATE NOT NULL,
  CONSTRAINT pau_pk PRIMARY KEY (pau_id) USING INDEX (CREATE UNIQUE INDEX phenix.pau_pk_i ON phenix.pci_audits(pau_id)    ),
  CONSTRAINT pau_pus_fk FOREIGN KEY (pau_pus_id) REFERENCES phenix.pci_users (pus_id)
);
COMMENT ON TABLE phenix.pci_audits IS 'Table des audites dans PCI';
COMMENT ON COLUMN phenix.pci_audits.pau_id IS 'Indique l''identifiant unique';
COMMENT ON COLUMN phenix.pci_audits.pau_pus_id IS 'Indique le id de l''utilisateur ';
COMMENT ON COLUMN phenix.pci_audits.pau_ip IS 'Indique l''adresse IP de la machine de l''utilisateur ';
COMMENT ON COLUMN phenix.pci_audits.pau_operation IS 'Indique l''operation effectuée par l''utilisateur';
COMMENT ON COLUMN phenix.pci_audits.pau_messages IS 'Indique le message ';
COMMENT ON COLUMN phenix.pci_audits.pau_creation_date IS 'Indique la date de creation';