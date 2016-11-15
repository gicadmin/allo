CREATE TABLE phenix.action_required (
  acr_id NUMBER(15) NOT NULL,
  acr_source VARCHAR2(4 BYTE) NOT NULL,
  acr_source_id NUMBER(15) NOT NULL,
  acr_action VARCHAR2(4 BYTE) NOT NULL CONSTRAINT acr_action_ck CHECK (ACR_ACTION IN ('TINV', 'COLL')),
  acr_status VARCHAR2(4 BYTE) NOT NULL CONSTRAINT acr_status_ck CHECK (ACR_STATUS IN ('OPEN', 'SEL', 'CLOS')),
  acr_reserved_code VARCHAR2(32 BYTE),
  acr_last_changed DATE DEFAULT SYSDATE NOT NULL,
  CONSTRAINT acr_pk PRIMARY KEY (acr_id) USING INDEX (CREATE INDEX phenix.acr_pk ON phenix.action_required(acr_id)    ),
  CONSTRAINT acr_uk UNIQUE (acr_source,acr_source_id,acr_action)
);
COMMENT ON COLUMN phenix.action_required.acr_id IS 'Indique l''identifiant unique des actions à prendre';
COMMENT ON COLUMN phenix.action_required.acr_source IS 'Indique de quelle table provient l''identifiant unique sur laquelle une action doit être prise';
COMMENT ON COLUMN phenix.action_required.acr_source_id IS 'Indique l''identifiant unique sur laquelle une action doit être prise';
COMMENT ON COLUMN phenix.action_required.acr_action IS 'Indique l''action à prendre';
COMMENT ON COLUMN phenix.action_required.acr_status IS 'Indique le statut de l''action à prendre';
COMMENT ON COLUMN phenix.action_required.acr_reserved_code IS 'Indique le code de réservation unique si l''action à prendre est en cours de traitement';
COMMENT ON COLUMN phenix.action_required.acr_last_changed IS 'Indique la date de la dernière modification';