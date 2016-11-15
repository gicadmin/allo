CREATE TABLE phenix.pallet_model_specifics (
  pms_pmo_code NUMBER(3) NOT NULL,
  pms_id NUMBER(15) NOT NULL,
  pms_route_date DATE,
  pms_rou_code NUMBER(5),
  CONSTRAINT pmo_uk UNIQUE (pms_pmo_code,pms_route_date,pms_rou_code) USING INDEX (CREATE UNIQUE INDEX phenix.pms_uk ON phenix.pallet_model_specifics(pms_pmo_code,pms_route_date,pms_rou_code)    ),
  CONSTRAINT pms_pk PRIMARY KEY (pms_id) USING INDEX (CREATE INDEX phenix.pms_pk ON phenix.pallet_model_specifics(pms_id)    ),
  CONSTRAINT pms_pmo_fk FOREIGN KEY (pms_pmo_code) REFERENCES phenix.pallet_models (pmo_code),
  CONSTRAINT pms_rou_fk FOREIGN KEY (pms_rou_code) REFERENCES phenix.routes (rou_code)
);
COMMENT ON TABLE phenix.pallet_model_specifics IS 'Table pour les modèles spécifiques de palletisation';
COMMENT ON COLUMN phenix.pallet_model_specifics.pms_pmo_code IS 'Indique le code du modèle de palletisation';
COMMENT ON COLUMN phenix.pallet_model_specifics.pms_id IS 'Indique l''identifiant de la table';
COMMENT ON COLUMN phenix.pallet_model_specifics.pms_route_date IS 'Indique la date de route de ce modèle spécifique';
COMMENT ON COLUMN phenix.pallet_model_specifics.pms_rou_code IS 'Indique le code de la route de ce modèle spécifique';