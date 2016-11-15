CREATE TABLE phenix.deposits (
  dep_id NUMBER(15) NOT NULL,
  dep_srth_id NUMBER(15) NOT NULL,
  dep_nb_of_100 NUMBER(2),
  dep_nb_of_50 NUMBER(2),
  dep_nb_of_20 NUMBER(3),
  dep_nb_of_10 NUMBER(3),
  dep_nb_of_5 NUMBER(3),
  dep_nb_of_2 NUMBER(3),
  dep_nb_of_1 NUMBER(3),
  dep_nb_of_025 NUMBER(3),
  dep_nb_of_010 NUMBER(3),
  dep_nb_of_005 NUMBER(3),
  CONSTRAINT dep_pk PRIMARY KEY (dep_id),
  CONSTRAINT dep_srth_id_fk FOREIGN KEY (dep_srth_id) REFERENCES phenix.sales_register_trans_headers (srth_id) ON DELETE CASCADE
);
COMMENT ON TABLE phenix.deposits IS 'Table des details des depot d''une caisse';
COMMENT ON COLUMN phenix.deposits.dep_id IS 'Identifiant de la table';
COMMENT ON COLUMN phenix.deposits.dep_srth_id IS 'Indique le id de la transaction de depot';
COMMENT ON COLUMN phenix.deposits.dep_nb_of_100 IS 'Indique le nombre de billet de 100$';
COMMENT ON COLUMN phenix.deposits.dep_nb_of_50 IS 'Indique le nombre de billet de 50$';
COMMENT ON COLUMN phenix.deposits.dep_nb_of_20 IS 'Indique le nombre de billet de 20$';
COMMENT ON COLUMN phenix.deposits.dep_nb_of_10 IS 'Indique le nombre de billet de 10$';
COMMENT ON COLUMN phenix.deposits.dep_nb_of_5 IS 'Indique le nombre de billet de 5$';
COMMENT ON COLUMN phenix.deposits.dep_nb_of_2 IS 'Indique le nombre de billet de 2$';
COMMENT ON COLUMN phenix.deposits.dep_nb_of_1 IS 'Indique le nombre de billet de 1$';
COMMENT ON COLUMN phenix.deposits.dep_nb_of_025 IS 'Indique le nombre de billet de 25 c';
COMMENT ON COLUMN phenix.deposits.dep_nb_of_010 IS 'Indique le nombre de billet de 10 c';
COMMENT ON COLUMN phenix.deposits.dep_nb_of_005 IS 'Indique le nombre de billet de 5 c';