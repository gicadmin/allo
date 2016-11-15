CREATE TABLE phenix.temporary_models (
  tmo_sid_id NUMBER(15) NOT NULL,
  tmo_rou_code NUMBER(5) NOT NULL,
  tmo_pmr_pms_pmo_code NUMBER(3) NOT NULL,
  tmo_pmr_pms_id NUMBER(15) NOT NULL,
  tmo_description VARCHAR2(30 BYTE) NOT NULL,
  tmo_tolerance_max_vol_percent NUMBER(6,3) NOT NULL,
  tmo_pallet_method VARCHAR2(1 BYTE) NOT NULL,
  CONSTRAINT tmo_pk PRIMARY KEY (tmo_sid_id,tmo_rou_code,tmo_pmr_pms_pmo_code,tmo_pmr_pms_id) USING INDEX (CREATE INDEX phenix.tmo_pk ON phenix.temporary_models(tmo_sid_id,tmo_rou_code,tmo_pmr_pms_pmo_code,tmo_pmr_pms_id)    ),
  CONSTRAINT tmo_pmr_pms_fk FOREIGN KEY (tmo_pmr_pms_id) REFERENCES phenix.pallet_model_specifics (pms_id)
);