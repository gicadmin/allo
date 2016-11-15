CREATE TABLE phenix.statistics_tracking_customers (
  scu_stt_code VARCHAR2(6 BYTE) NOT NULL,
  scu_cus_code NUMBER(10) NOT NULL,
  scu_customer_code VARCHAR2(15 BYTE),
  scu_stg_stt_code VARCHAR2(6 BYTE),
  scu_stg_code VARCHAR2(10 BYTE),
  scu_ship_to_id VARCHAR2(10 BYTE),
  CONSTRAINT scu_stg_stt_code_ck CHECK ( (SCU_STG_STT_CODE IS NOT NULL AND SCU_STG_STT_CODE = SCU_STT_CODE) OR
          (SCU_STG_STT_CODE IS NULL) ),
  CONSTRAINT scu_pk PRIMARY KEY (scu_stt_code,scu_cus_code),
  CONSTRAINT scu_cus_fk FOREIGN KEY (scu_cus_code) REFERENCES phenix.customers (cus_code) ON DELETE CASCADE,
  CONSTRAINT scu_stg_fk FOREIGN KEY (scu_stg_stt_code,scu_stg_code) REFERENCES phenix.statistics_tracking_groups (stg_stt_code,stg_code),
  CONSTRAINT scu_stt_fk FOREIGN KEY (scu_stt_code) REFERENCES phenix.statistics_tracking_types (stt_code)
);
COMMENT ON TABLE phenix.statistics_tracking_customers IS 'Table de suivi des statistiques clients  ';
COMMENT ON COLUMN phenix.statistics_tracking_customers.scu_stt_code IS 'Indique le code du type de statistique';
COMMENT ON COLUMN phenix.statistics_tracking_customers.scu_cus_code IS 'Indique le code du client';
COMMENT ON COLUMN phenix.statistics_tracking_customers.scu_customer_code IS 'Indique le code du client pour les statistiques';
COMMENT ON COLUMN phenix.statistics_tracking_customers.scu_stg_stt_code IS 'Indique le code du type des statistiques';
COMMENT ON COLUMN phenix.statistics_tracking_customers.scu_stg_code IS 'Indique le code de regroupement de ce client dans ce fichier de statistiques';
COMMENT ON COLUMN phenix.statistics_tracking_customers.scu_ship_to_id IS 'Indique le code d''identification du client';