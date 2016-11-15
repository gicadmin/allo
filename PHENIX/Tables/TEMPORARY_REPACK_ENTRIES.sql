CREATE TABLE phenix.temporary_repack_entries (
  tre_id NUMBER(15),
  tre_sid_id NUMBER,
  tre_use_code NUMBER(5),
  tre_coh_id NUMBER(15),
  tre_cod_line_number NUMBER(4),
  tre_cus_code NUMBER(10),
  tre_route_code NUMBER(5),
  tre_route_position NUMBER(7,2),
  tre_prf_prd_code VARCHAR2(10 BYTE),
  tre_prf_fmt_code VARCHAR2(7 BYTE),
  tre_ordered_quantity NUMBER(7),
  tre_ordered_weight NUMBER(8,3),
  tre_prepared_quantity NUMBER(7),
  tre_prepared_weight NUMBER(8,3),
  tre_number_of_stickers NUMBER(5),
  tre_sticker_sequence_number NUMBER(5),
  tre_number_of_packages NUMBER(5)
);
COMMENT ON TABLE phenix.temporary_repack_entries IS 'Table utilisée pour l''impression d''étiquettes pour les produits nécessitant une préparation';
COMMENT ON COLUMN phenix.temporary_repack_entries.tre_id IS 'Indique l''identifiant unique de la table';
COMMENT ON COLUMN phenix.temporary_repack_entries.tre_sid_id IS 'Indique l''identifiant de la session de l''utilisateur';
COMMENT ON COLUMN phenix.temporary_repack_entries.tre_use_code IS 'Indique le code de l''utilisateur ayant effectué la preparation d''étiquettes';
COMMENT ON COLUMN phenix.temporary_repack_entries.tre_coh_id IS 'Indique le ID de la commande ';
COMMENT ON COLUMN phenix.temporary_repack_entries.tre_cod_line_number IS 'Indique le numéro de ligne de la commande ';
COMMENT ON COLUMN phenix.temporary_repack_entries.tre_cus_code IS 'Indique le code du client';
COMMENT ON COLUMN phenix.temporary_repack_entries.tre_route_code IS 'Indique le code de la route';
COMMENT ON COLUMN phenix.temporary_repack_entries.tre_route_position IS 'Indique la position dans la route';
COMMENT ON COLUMN phenix.temporary_repack_entries.tre_prf_prd_code IS 'Indique le code de produit interne';
COMMENT ON COLUMN phenix.temporary_repack_entries.tre_prf_fmt_code IS 'Indique le format du produit choisi';
COMMENT ON COLUMN phenix.temporary_repack_entries.tre_ordered_quantity IS 'Indique la quantité commandée';
COMMENT ON COLUMN phenix.temporary_repack_entries.tre_ordered_weight IS 'Indique le poids commandé';
COMMENT ON COLUMN phenix.temporary_repack_entries.tre_prepared_quantity IS 'Indique la quantité préparée';
COMMENT ON COLUMN phenix.temporary_repack_entries.tre_prepared_weight IS 'Indique le poids préparé';
COMMENT ON COLUMN phenix.temporary_repack_entries.tre_number_of_stickers IS 'Indique le nombre d''étiquettes à imprimer';
COMMENT ON COLUMN phenix.temporary_repack_entries.tre_sticker_sequence_number IS 'Indique la séquence du nombre total d''étiquettes à imprimer';
COMMENT ON COLUMN phenix.temporary_repack_entries.tre_number_of_packages IS 'Indique le nombre de colis';