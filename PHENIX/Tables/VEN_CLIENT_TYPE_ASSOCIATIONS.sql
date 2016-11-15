CREATE TABLE phenix.ven_client_type_associations (
  vta_id NUMBER(15) NOT NULL,
  vta_ven_code NUMBER(5) NOT NULL,
  vta_rct_code NUMBER(3) NOT NULL,
  vta_prv_code VARCHAR2(2 BYTE) NOT NULL,
  vta_rebate_percent NUMBER(6,3) DEFAULT 0 NOT NULL,
  vta_obligatory_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT vta_obligatory_switch_ck CHECK (VTA_OBLIGATORY_SWITCH IN (0, 1)),
  CONSTRAINT vta_pk PRIMARY KEY (vta_id),
  CONSTRAINT vta_uk UNIQUE (vta_ven_code,vta_rct_code,vta_prv_code),
  CONSTRAINT vta_prv_fk FOREIGN KEY (vta_prv_code) REFERENCES phenix.provinces (prv_code),
  CONSTRAINT vta_rct_fk FOREIGN KEY (vta_rct_code) REFERENCES phenix.retail_client_types (rct_code),
  CONSTRAINT vta_ven_fk FOREIGN KEY (vta_ven_code) REFERENCES phenix.vendors (ven_code)
);
COMMENT ON TABLE phenix.ven_client_type_associations IS 'Indique le pourcentage de rabais pour un fournisseur, une province et un type de détaillant';
COMMENT ON COLUMN phenix.ven_client_type_associations.vta_id IS 'Indique l''identifiant unique de la table';
COMMENT ON COLUMN phenix.ven_client_type_associations.vta_ven_code IS 'Indique le code du fournisseur';
COMMENT ON COLUMN phenix.ven_client_type_associations.vta_rct_code IS 'Indique le code du type de détaillant';
COMMENT ON COLUMN phenix.ven_client_type_associations.vta_prv_code IS 'Indique le code de la province';
COMMENT ON COLUMN phenix.ven_client_type_associations.vta_rebate_percent IS 'Indique le pourcentage de rabais';
COMMENT ON COLUMN phenix.ven_client_type_associations.vta_obligatory_switch IS 'Indique si le fournisseur est obligé d''être assigné au type de détaillant';