CREATE TABLE phenix.vendor_transport_customers (
  vtc_id NUMBER(15) NOT NULL,
  vtc_vtr_id NUMBER(15) NOT NULL,
  vtc_cus_code NUMBER(10),
  vtc_pty_code NUMBER(3),
  vtc_trt_code NUMBER(2),
  CONSTRAINT vtc_cus_pty_trt_ck CHECK (
			(VTC_CUS_CODE IS NOT NULL AND VTC_PTY_CODE IS NULL AND VTC_TRT_CODE IS NULL)
	OR 	(VTC_PTY_CODE IS NOT NULL AND VTC_CUS_CODE IS NULL AND VTC_TRT_CODE IS NULL)
	OR	(VTC_TRT_CODE IS NOT NULL AND VTC_CUS_CODE IS NULL AND VTC_PTY_CODE IS NULL)
	OR	(VTC_PTY_CODE IS NOT NULL AND VTC_TRT_CODE IS NOT NULL AND VTC_CUS_CODE IS NULL)),
  CONSTRAINT vtc_pk PRIMARY KEY (vtc_id),
  CONSTRAINT vtc_uk UNIQUE (vtc_vtr_id,vtc_cus_code,vtc_pty_code,vtc_trt_code),
  CONSTRAINT vtc_cus_code_fk FOREIGN KEY (vtc_cus_code) REFERENCES phenix.customers (cus_code) ON DELETE CASCADE,
  CONSTRAINT vtc_pty_code_fk FOREIGN KEY (vtc_pty_code) REFERENCES phenix.promotion_types (pty_code),
  CONSTRAINT vtc_trt_code_fk FOREIGN KEY (vtc_trt_code) REFERENCES phenix.territories (trt_code),
  CONSTRAINT vtc_vtr_id_fk FOREIGN KEY (vtc_vtr_id) REFERENCES phenix.vendor_transport_agreements (vtr_id) ON DELETE CASCADE
);
COMMENT ON TABLE phenix.vendor_transport_customers IS 'Table utilisée pour garder les associations de clients avec les ententes de transport';
COMMENT ON COLUMN phenix.vendor_transport_customers.vtc_id IS 'Indique le numéro unique (ID) de la table';
COMMENT ON COLUMN phenix.vendor_transport_customers.vtc_vtr_id IS 'Indique le code de l''entente de transport';
COMMENT ON COLUMN phenix.vendor_transport_customers.vtc_cus_code IS 'Indique le code du client';
COMMENT ON COLUMN phenix.vendor_transport_customers.vtc_pty_code IS 'Indique le code du type de promotion';
COMMENT ON COLUMN phenix.vendor_transport_customers.vtc_trt_code IS 'Indique le code du territoire';