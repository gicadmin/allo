CREATE TABLE phenix.memos (
  mem_id VARCHAR2(15 BYTE) NOT NULL,
  mem_message VARCHAR2(1000 BYTE) NOT NULL,
  mem_processed_switch NUMBER(1) NOT NULL CONSTRAINT mem_processed_switch_ck CHECK (MEM_PROCESSED_SWITCH IN (0, 1)),
  mem_timestamp TIMESTAMP(3) NOT NULL,
  mem_type VARCHAR2(3 BYTE) NOT NULL CONSTRAINT mem_type_ck CHECK (MEM_TYPE
IN ('UNI', 'ALL', 'ADM', 'ACC', 'BUY', 'CON', 'DEL', 'PIK', 'REC',
'SAL', 'SHP', 'TEL')),
  mem_cus_code NUMBER(10),
  mem_use_code NUMBER(5),
  CONSTRAINT unique_user_ck CHECK ((MEM_USE_CODE is not NULL
and MEM_TYPE = 'UNI') or
(MEM_USE_CODE is NULL)),
  CONSTRAINT mem_pk PRIMARY KEY (mem_id),
  CONSTRAINT mem_cus_fk FOREIGN KEY (mem_cus_code) REFERENCES phenix.customers (cus_code) ON DELETE CASCADE,
  CONSTRAINT mem_use_fk FOREIGN KEY (mem_use_code) REFERENCES phenix."USERS" (use_code)
);
COMMENT ON TABLE phenix.memos IS 'Memos divers';
COMMENT ON COLUMN phenix.memos.mem_id IS 'Identifiant du mémo';
COMMENT ON COLUMN phenix.memos.mem_message IS 'Message du mémo';
COMMENT ON COLUMN phenix.memos.mem_processed_switch IS 'Indique si le mémo a été traité';
COMMENT ON COLUMN phenix.memos.mem_timestamp IS 'Temps de création du mémos';
COMMENT ON COLUMN phenix.memos.mem_type IS 'Type de mémo';
COMMENT ON COLUMN phenix.memos.mem_cus_code IS 'Code client';
COMMENT ON COLUMN phenix.memos.mem_use_code IS 'Code usager';