CREATE TABLE phenix.report_merge (
  rme_id VARCHAR2(32 BYTE) NOT NULL,
  rme_seq NUMBER(6) NOT NULL,
  rme_route_code NUMBER(5),
  rme_route_date DATE,
  rme_whs_code VARCHAR2(2 BYTE) NOT NULL,
  rme_report_name VARCHAR2(400 BYTE) NOT NULL,
  rme_included_switch NUMBER(1) DEFAULT 1 NOT NULL CONSTRAINT rme_included_switch_ck CHECK (rme_included_switch IN (0,1)),
  rme_report_path VARCHAR2(4000 BYTE) NOT NULL,
  rme_print_status_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT rme_print_status_switch_ck CHECK (rme_print_status_switch IN (0,1)),
  rme_nb_copies NUMBER(2) DEFAULT 1 NOT NULL,
  rme_creation_date DATE DEFAULT SYSDATE NOT NULL,
  rme_modif_date DATE DEFAULT SYSDATE NOT NULL,
  rme_cus_code NUMBER(10),
  CONSTRAINT rme_cus_route_ck CHECK ( (RME_ROUTE_CODE IS NULL AND RME_ROUTE_DATE IS NULL AND RME_CUS_CODE IS NOT NULL) OR (RME_ROUTE_CODE IS NOT NULL AND RME_ROUTE_DATE IS NOT NULL AND RME_CUS_CODE IS NULL) ),
  CONSTRAINT rme_pk PRIMARY KEY (rme_id,rme_seq) USING INDEX (CREATE INDEX phenix.rme_pk ON phenix.report_merge(rme_id,rme_seq)    ),
  CONSTRAINT rme_cus_fk FOREIGN KEY (rme_cus_code) REFERENCES phenix.customers (cus_code),
  CONSTRAINT rme_whs_fk FOREIGN KEY (rme_whs_code) REFERENCES phenix.warehouses (whs_code)
);
COMMENT ON TABLE phenix.report_merge IS 'Table contenant les différents rapports à fusionner lors de l''impression d''une route.';
COMMENT ON COLUMN phenix.report_merge.rme_id IS 'Indique le nom du fichier de fusion (sys_guid).';
COMMENT ON COLUMN phenix.report_merge.rme_seq IS 'Indique l''ordre dans laquelle les rapports devront être imprimés.';
COMMENT ON COLUMN phenix.report_merge.rme_route_code IS 'Indique le code de la route.';
COMMENT ON COLUMN phenix.report_merge.rme_route_date IS 'Indique la date de la route.';
COMMENT ON COLUMN phenix.report_merge.rme_whs_code IS 'Indique le code de l''entrepôt.';
COMMENT ON COLUMN phenix.report_merge.rme_report_name IS 'Indique le nom du rapport à fusionner.';
COMMENT ON COLUMN phenix.report_merge.rme_included_switch IS 'Indique si le rapport est à inclure dans la fusion ou non.';
COMMENT ON COLUMN phenix.report_merge.rme_report_path IS 'Indique le nom du fichier .pdf du rapport.';
COMMENT ON COLUMN phenix.report_merge.rme_print_status_switch IS 'Indique si la route a été imprimée ou non.';
COMMENT ON COLUMN phenix.report_merge.rme_nb_copies IS 'Indique le nombre de copies de rapport à fusionner.';
COMMENT ON COLUMN phenix.report_merge.rme_creation_date IS 'Indique la date de création de l''enregistrement.';
COMMENT ON COLUMN phenix.report_merge.rme_modif_date IS 'Indique la date de la dernière modification de l''enregistrement.';