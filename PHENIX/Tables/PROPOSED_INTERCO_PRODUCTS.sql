CREATE TABLE phenix.proposed_interco_products (
  pip_id NUMBER(15) NOT NULL,
  pip_whs_code VARCHAR2(2 BYTE) NOT NULL,
  pip_prf_prd_code VARCHAR2(10 BYTE) NOT NULL,
  pip_prf_fmt_code VARCHAR2(7 BYTE) NOT NULL,
  pip_priority_code NUMBER(2) NOT NULL,
  pip_creation_date DATE NOT NULL,
  pip_requested_quantity NUMBER(7),
  pip_requested_weight NUMBER(9,3),
  pip_shipped_quantity NUMBER(7),
  pip_shipped_weight NUMBER(9,3),
  CONSTRAINT pip_pk PRIMARY KEY (pip_id)
);
COMMENT ON TABLE phenix.proposed_interco_products IS 'Table contenant une liste de produits qui peuvent être utilisés pour remplir un camion inter-compagnie';
COMMENT ON COLUMN phenix.proposed_interco_products.pip_id IS 'Indique l''identifiant unique';
COMMENT ON COLUMN phenix.proposed_interco_products.pip_whs_code IS 'Indique le code de l''entrepôt de destination';
COMMENT ON COLUMN phenix.proposed_interco_products.pip_prf_prd_code IS 'Indique le code du produit';
COMMENT ON COLUMN phenix.proposed_interco_products.pip_prf_fmt_code IS 'Indique le code du format';
COMMENT ON COLUMN phenix.proposed_interco_products.pip_priority_code IS 'Indique l''ordre de priorité pour le produit';
COMMENT ON COLUMN phenix.proposed_interco_products.pip_creation_date IS 'Indique la date à laquelle l''enregistrement a été créé';
COMMENT ON COLUMN phenix.proposed_interco_products.pip_requested_quantity IS 'Indique la quantité demandée';
COMMENT ON COLUMN phenix.proposed_interco_products.pip_requested_weight IS 'Indique le poids demandé';
COMMENT ON COLUMN phenix.proposed_interco_products.pip_shipped_quantity IS 'Indique la quantité expédiée jusqu''à présent';
COMMENT ON COLUMN phenix.proposed_interco_products.pip_shipped_weight IS 'Indique le poids expédié jusqu''à présent';