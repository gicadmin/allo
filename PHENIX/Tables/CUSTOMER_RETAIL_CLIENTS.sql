CREATE TABLE phenix.customer_retail_clients (
  crc_id NUMBER(15) NOT NULL,
  crc_cus_code NUMBER(10) NOT NULL,
  crc_activity_start_date DATE NOT NULL,
  crc_activity_end_date DATE NOT NULL,
  crc_drops_permitted_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT crc_drops_permitted_switch_ck CHECK (CRC_DROPS_PERMITTED_SWITCH IN (0, 1)),
  crc_rcl_id NUMBER(6) NOT NULL,
  crc_cus_client_code VARCHAR2(15 BYTE) NOT NULL,
  CONSTRAINT crc_id_code_uk UNIQUE (crc_rcl_id,crc_cus_code),
  CONSTRAINT crc_pk PRIMARY KEY (crc_id),
  CONSTRAINT crc_uk UNIQUE (crc_cus_code,crc_cus_client_code),
  CONSTRAINT crc_cus_fk FOREIGN KEY (crc_cus_code) REFERENCES phenix.customers (cus_code) ON DELETE CASCADE,
  CONSTRAINT crc_rcl_fk FOREIGN KEY (crc_rcl_id) REFERENCES phenix.retail_clients (rcl_id)
);
COMMENT ON TABLE phenix.customer_retail_clients IS 'Identifie les clients du détaillant';
COMMENT ON COLUMN phenix.customer_retail_clients.crc_id IS 'Identifiant unique de la table';
COMMENT ON COLUMN phenix.customer_retail_clients.crc_cus_code IS 'Code du client';
COMMENT ON COLUMN phenix.customer_retail_clients.crc_activity_start_date IS 'Date à laquelle le détaillant peut commencer ses opérations';
COMMENT ON COLUMN phenix.customer_retail_clients.crc_activity_end_date IS 'Date à laquelle le détaillant termine ses opérations';
COMMENT ON COLUMN phenix.customer_retail_clients.crc_drops_permitted_switch IS 'Indique si le détaillant a droit aux commandes indirectes';
COMMENT ON COLUMN phenix.customer_retail_clients.crc_rcl_id IS 'Code de détaillant';