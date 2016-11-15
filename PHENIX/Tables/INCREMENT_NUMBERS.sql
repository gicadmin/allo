CREATE TABLE phenix.increment_numbers (
  inn_number NUMBER NOT NULL
);
COMMENT ON TABLE phenix.increment_numbers IS 'Table contenant simplement des numéros qui incrémentent (de 1 à 200), pour pouvoir servir dans différents SELECT du système';
COMMENT ON COLUMN phenix.increment_numbers.inn_number IS 'Indique un numéro unique dans la table qui incrémente';