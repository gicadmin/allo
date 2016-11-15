CREATE TABLE phenix.customer_messages (
  cum_id NUMBER(15) NOT NULL,
  cum_cus_code NUMBER(10) NOT NULL,
  cum_stm_code NUMBER(5) NOT NULL,
  CONSTRAINT cum_pk PRIMARY KEY (cum_id),
  CONSTRAINT cum_uk UNIQUE (cum_cus_code,cum_stm_code),
  CONSTRAINT cum_cus_fk FOREIGN KEY (cum_cus_code) REFERENCES phenix.customers (cus_code) ON DELETE CASCADE,
  CONSTRAINT cum_stm_fk FOREIGN KEY (cum_stm_code) REFERENCES phenix.standard_messages (stm_code)
);
COMMENT ON COLUMN phenix.customer_messages.cum_id IS 'Indique l''identifiant unique du message du client';
COMMENT ON COLUMN phenix.customer_messages.cum_cus_code IS 'Indique le code du client';
COMMENT ON COLUMN phenix.customer_messages.cum_stm_code IS 'Indique le code du message';