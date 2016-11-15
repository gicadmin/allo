CREATE TABLE phenix.pallet_models (
  pmo_code NUMBER(3) NOT NULL,
  pmo_description VARCHAR2(30 BYTE) NOT NULL,
  pmo_alt_description VARCHAR2(30 BYTE),
  pmo_tolerance_max_vol_percent NUMBER(6,3) NOT NULL,
  pmo_pallet_method VARCHAR2(1 BYTE) NOT NULL CONSTRAINT pmo_pallet_method_ck CHECK (PMO_PALLET_METHOD IN ('L', 'T')),
  CONSTRAINT pmo_pk PRIMARY KEY (pmo_code) USING INDEX (CREATE INDEX phenix.pmo_pk ON phenix.pallet_models(pmo_code)    )
);
COMMENT ON TABLE phenix.pallet_models IS 'Table pour les modèles de palletisation';
COMMENT ON COLUMN phenix.pallet_models.pmo_code IS 'Indique le code du modèle de palletisation';
COMMENT ON COLUMN phenix.pallet_models.pmo_description IS 'Indique la description du modèle de palletisation';
COMMENT ON COLUMN phenix.pallet_models.pmo_alt_description IS 'Indique la description alternative du modèle de palletisation';
COMMENT ON COLUMN phenix.pallet_models.pmo_tolerance_max_vol_percent IS 'Indique la tolérance qui sera appliquée sur le volume maximum permettant de gonfler le volume si nécessaire';
COMMENT ON COLUMN phenix.pallet_models.pmo_pallet_method IS 'Indique la méthode dont les palettes seront cueillies : en couche ou en tour';