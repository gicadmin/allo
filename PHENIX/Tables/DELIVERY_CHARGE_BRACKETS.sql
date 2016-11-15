CREATE TABLE phenix.delivery_charge_brackets (
  dcb_id NUMBER(15) NOT NULL,
  dcb_dcg_code NUMBER(5) NOT NULL,
  dcb_lower_objective_bracket NUMBER(7,2) NOT NULL,
  dcb_upper_objective_bracket NUMBER(7,2) NOT NULL,
  dcb_base_delivery_charge NUMBER(7,2) NOT NULL,
  CONSTRAINT dcb_pk PRIMARY KEY (dcb_id),
  CONSTRAINT dcb_dcg_fk FOREIGN KEY (dcb_dcg_code) REFERENCES phenix.delivery_charge_grids (dcg_code) ON DELETE CASCADE
);
COMMENT ON TABLE phenix.delivery_charge_brackets IS 'Table permettant de définir différents niveaux de frais de livraison';
COMMENT ON COLUMN phenix.delivery_charge_brackets.dcb_id IS 'Indique l''identifiant unique de ce niveau de frais de livraison';
COMMENT ON COLUMN phenix.delivery_charge_brackets.dcb_dcg_code IS 'Indique le code de la grille de frais de livraison utilisé';
COMMENT ON COLUMN phenix.delivery_charge_brackets.dcb_lower_objective_bracket IS 'Indique l''objectif minimum pour ce niveau de frais';
COMMENT ON COLUMN phenix.delivery_charge_brackets.dcb_upper_objective_bracket IS 'Indique l''objectif maximum pour ce niveau de frais';
COMMENT ON COLUMN phenix.delivery_charge_brackets.dcb_base_delivery_charge IS 'Indique le montant de frais de livraison de base';