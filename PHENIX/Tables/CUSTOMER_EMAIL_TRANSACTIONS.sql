CREATE TABLE phenix.customer_email_transactions (
  cmt_id NUMBER(15) NOT NULL,
  cmt_cus_code NUMBER(10) NOT NULL,
  cmt_report_type VARCHAR2(3 BYTE) NOT NULL CONSTRAINT cmt_report_type_ck CHECK (cmt_report_type IN('REJ','RMA','RUP','LIN','CRE','ETA','PT','FAC', 'CM', 'DRO', 'LCP', 'REM','RBH')),
  cmt_email VARCHAR2(100 BYTE),
  cmt_transmit_method VARCHAR2(3 BYTE) DEFAULT 'EMA' NOT NULL CONSTRAINT cmt_transmit_method_ck CHECK (CMT_TRANSMIT_METHOD IN ('FAX','EMA','MAI','ROU','WEB')),
  cmt_fax_number NUMBER(11),
  CONSTRAINT cmt_transmit_ck CHECK ((CMT_TRANSMIT_METHOD = 'EMA' AND CMT_EMAIL IS NOT NULL)
																			 OR (CMT_TRANSMIT_METHOD = 'FAX' AND CMT_FAX_NUMBER IS NOT NULL)
																			 OR CMT_TRANSMIT_METHOD NOT IN ('EMA','FAX')),
  CONSTRAINT cmt_id_pk PRIMARY KEY (cmt_id) USING INDEX (CREATE INDEX phenix.cmt_id_pk_i ON phenix.customer_email_transactions(cmt_id)    ),
  CONSTRAINT cmt_cus_code_fk FOREIGN KEY (cmt_cus_code) REFERENCES phenix.customers (cus_code) ON DELETE CASCADE
);
COMMENT ON COLUMN phenix.customer_email_transactions.cmt_id IS 'Indique le numéro d''identification unique (ID) de l''enregistrement';
COMMENT ON COLUMN phenix.customer_email_transactions.cmt_cus_code IS 'Indique le code du client';
COMMENT ON COLUMN phenix.customer_email_transactions.cmt_report_type IS 'Indique le type de transaction';
COMMENT ON COLUMN phenix.customer_email_transactions.cmt_email IS 'Indique l''adresse courriel pour la transaction';
COMMENT ON COLUMN phenix.customer_email_transactions.cmt_transmit_method IS 'Indique la méthode de transmission des états de compte';
COMMENT ON COLUMN phenix.customer_email_transactions.cmt_fax_number IS 'Indique le numéro de fax';