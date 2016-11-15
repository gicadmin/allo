CREATE TABLE phenix.customer_route_docum_headers (
  crdh_id NUMBER(15) NOT NULL,
  crdh_cus_code NUMBER(10) NOT NULL,
  crdh_rou_code NUMBER(5) NOT NULL,
  crdh_rou_date DATE NOT NULL,
  crdh_sequence NUMBER(6) NOT NULL,
  crdh_whs_code VARCHAR2(2 BYTE) NOT NULL,
  CONSTRAINT crdh_cus_rou_date_uk UNIQUE (crdh_cus_code,crdh_rou_code,crdh_rou_date),
  CONSTRAINT crdh_date_seq_uk UNIQUE (crdh_rou_date,crdh_sequence,crdh_whs_code),
  CONSTRAINT crdh_pk PRIMARY KEY (crdh_id),
  CONSTRAINT crdh_cus_fk FOREIGN KEY (crdh_cus_code) REFERENCES phenix.customers (cus_code) ON DELETE CASCADE,
  CONSTRAINT crdh_rou_code_fk FOREIGN KEY (crdh_rou_code) REFERENCES phenix.routes (rou_code) ON DELETE CASCADE,
  CONSTRAINT crdh_whs_fk FOREIGN KEY (crdh_whs_code) REFERENCES phenix.warehouses (whs_code)
);
COMMENT ON COLUMN phenix.customer_route_docum_headers.crdh_id IS 'Indique le code unique de la table';
COMMENT ON COLUMN phenix.customer_route_docum_headers.crdh_cus_code IS 'Indique le code du client';
COMMENT ON COLUMN phenix.customer_route_docum_headers.crdh_rou_code IS 'Indique le code de la route';
COMMENT ON COLUMN phenix.customer_route_docum_headers.crdh_rou_date IS 'Indique la date de la route de livraison';
COMMENT ON COLUMN phenix.customer_route_docum_headers.crdh_sequence IS 'Indique la sequence dans la meme journÃ©e';
COMMENT ON COLUMN phenix.customer_route_docum_headers.crdh_whs_code IS 'Indique le code de l''entrepot';