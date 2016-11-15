CREATE TABLE phenix.fuel_surcharge_brackets (
  fsb_id NUMBER(15) NOT NULL,
  fsb_fsg_code NUMBER(5) NOT NULL,
  fsb_lower_objective_bracket NUMBER(5,3) NOT NULL,
  fsb_upper_objective_bracket NUMBER(5,3) NOT NULL,
  fsb_fuel_surcharge NUMBER(7,2),
  fsb_fuel_surcharge_percent NUMBER(6,3),
  CONSTRAINT fsb_fuel_surcharge_not_null_ck CHECK (fsb_fuel_surcharge IS NOT NULL OR fsb_fuel_surcharge_percent IS NOT NULL),
  CONSTRAINT fsb_fuel_surcharge_null_ck CHECK (fsb_fuel_surcharge IS NULL OR fsb_fuel_surcharge_percent IS NULL),
  CONSTRAINT fsb_pk PRIMARY KEY (fsb_id),
  CONSTRAINT fsb_fsg_fk FOREIGN KEY (fsb_fsg_code) REFERENCES phenix.fuel_surcharge_grids (fsg_code) ON DELETE CASCADE
);
COMMENT ON TABLE phenix.fuel_surcharge_brackets IS 'Table permettant de définir différents niveaux de surcharge de carburant';
COMMENT ON COLUMN phenix.fuel_surcharge_brackets.fsb_id IS 'Indique l''identifiant unique de ce niveau de surcharge de carburant';
COMMENT ON COLUMN phenix.fuel_surcharge_brackets.fsb_fsg_code IS 'Indique le code de la grille de surcharge de carburant utilisé';
COMMENT ON COLUMN phenix.fuel_surcharge_brackets.fsb_lower_objective_bracket IS 'Indique le montant minimum pour ce niveau de surcharge';
COMMENT ON COLUMN phenix.fuel_surcharge_brackets.fsb_upper_objective_bracket IS 'Indique le montant maximum pour ce niveau de surcharge';
COMMENT ON COLUMN phenix.fuel_surcharge_brackets.fsb_fuel_surcharge IS 'Indique le montant de surcharge de carburant de base';
COMMENT ON COLUMN phenix.fuel_surcharge_brackets.fsb_fuel_surcharge_percent IS 'Indique le pourcentage à appliquer sur le montant de la facture pour calculer la surcharge';