CREATE TABLE phenix.route_transport_exceptions (
  rte_id NUMBER(15) NOT NULL,
  rte_cus_code NUMBER(10) NOT NULL,
  rte_route_date DATE NOT NULL,
  rte_rou_type VARCHAR2(2 BYTE) NOT NULL CONSTRAINT rte_rou_type_ck CHECK (RTE_ROU_TYPE in ('PM', 'RG', 'SP')),
  rte_delivery_charge NUMBER(5,2) NOT NULL,
  rte_applied_switch NUMBER(1) NOT NULL CONSTRAINT rte_applied_switch_ck CHECK (RTE_APPLIED_SWITCH in (0, 1)),
  rte_creation_date DATE DEFAULT SYSDATE NOT NULL,
  rte_use_code NUMBER(5) NOT NULL,
  rte_applied_date DATE,
  CONSTRAINT rte_pk PRIMARY KEY (rte_id),
  CONSTRAINT rte_cus_fk FOREIGN KEY (rte_cus_code) REFERENCES phenix.customers (cus_code),
  CONSTRAINT rte_use_fk FOREIGN KEY (rte_use_code) REFERENCES phenix."USERS" (use_code)
);
COMMENT ON TABLE phenix.route_transport_exceptions IS 'Table utilisée pour entrer les frais de transport spécifiques par cueillette pour un client';
COMMENT ON COLUMN phenix.route_transport_exceptions.rte_id IS 'Indique l''identifiant unique de la table';
COMMENT ON COLUMN phenix.route_transport_exceptions.rte_cus_code IS 'Indique le code du client concerné par les frais de transport spécifiques';
COMMENT ON COLUMN phenix.route_transport_exceptions.rte_route_date IS 'Indique la date de route concernée par les frais de transport spécifiques';
COMMENT ON COLUMN phenix.route_transport_exceptions.rte_rou_type IS 'Indique le type de route concerné par les frais de transport spécifiques';
COMMENT ON COLUMN phenix.route_transport_exceptions.rte_delivery_charge IS 'Indique le montant des frais de transport spécifiques';
COMMENT ON COLUMN phenix.route_transport_exceptions.rte_applied_switch IS 'Indique si le montant de transport a été appliqué';
COMMENT ON COLUMN phenix.route_transport_exceptions.rte_creation_date IS 'Indique la date de création';
COMMENT ON COLUMN phenix.route_transport_exceptions.rte_use_code IS 'Indique le code de l''utilisateur ayant créé ces frais de transport spécifiques';
COMMENT ON COLUMN phenix.route_transport_exceptions.rte_applied_date IS 'Indique la date exacte où les frais de transport ont été chargés sur une facture';