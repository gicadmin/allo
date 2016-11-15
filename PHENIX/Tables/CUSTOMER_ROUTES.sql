CREATE TABLE phenix.customer_routes (
  cro_cus_code NUMBER(10) NOT NULL,
  cro_rou_code NUMBER(5) NOT NULL,
  cro_position NUMBER(7,2) NOT NULL,
  CONSTRAINT cro_pk PRIMARY KEY (cro_cus_code,cro_rou_code),
  CONSTRAINT cro_cus_fk FOREIGN KEY (cro_cus_code) REFERENCES phenix.customers (cus_code) ON DELETE CASCADE,
  CONSTRAINT cro_rou_fk FOREIGN KEY (cro_rou_code) REFERENCES phenix.routes (rou_code)
);
COMMENT ON TABLE phenix.customer_routes IS 'Identifie les routes d''un client';
COMMENT ON COLUMN phenix.customer_routes.cro_cus_code IS 'Indique le code de client';
COMMENT ON COLUMN phenix.customer_routes.cro_rou_code IS 'Indique le code de la route';
COMMENT ON COLUMN phenix.customer_routes.cro_position IS 'Indique la position du client dans la route';