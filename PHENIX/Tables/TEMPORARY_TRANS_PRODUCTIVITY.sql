CREATE GLOBAL TEMPORARY TABLE phenix.temporary_trans_productivity (
  ttp_use_code NUMBER(5),
  ttp_use_name VARCHAR2(80 BYTE),
  ttp_whz_code VARCHAR2(2 BYTE),
  ttp_whz_name VARCHAR2(30 BYTE),
  ttp_nbr_trans NUMBER,
  ttp_tot_volume NUMBER,
  ttp_tot_weight NUMBER,
  ttp_elem_count NUMBER,
  ttp_nbr_heures NUMBER(15,10),
  ttp_prf_prd_code VARCHAR2(15 BYTE),
  ttp_rth_id NUMBER,
  ttp_prf_fmt_code VARCHAR2(7 BYTE)
)
ON COMMIT PRESERVE ROWS;
COMMENT ON TABLE phenix.temporary_trans_productivity IS 'Table utilisée pour les rapports productivité :Réception,Cueillette,Déplacement,Réapprovisionnement';
COMMENT ON COLUMN phenix.temporary_trans_productivity.ttp_use_code IS 'Indique le code de l''usager qui a fait la transaction';
COMMENT ON COLUMN phenix.temporary_trans_productivity.ttp_use_name IS 'Indique le nom de l''usager qui a fait la transaction';
COMMENT ON COLUMN phenix.temporary_trans_productivity.ttp_whz_code IS 'Indique le code de la zone d''entreposage où a lieu la transaction';
COMMENT ON COLUMN phenix.temporary_trans_productivity.ttp_whz_name IS 'Indique le nom de la zone d''entreposage où a lieu la transaction';
COMMENT ON COLUMN phenix.temporary_trans_productivity.ttp_nbr_trans IS 'Indique le total du nombre de transactions';
COMMENT ON COLUMN phenix.temporary_trans_productivity.ttp_tot_volume IS 'Indique le total du volume de la transaction';
COMMENT ON COLUMN phenix.temporary_trans_productivity.ttp_tot_weight IS 'Indique le total du poids de la transaction';
COMMENT ON COLUMN phenix.temporary_trans_productivity.ttp_elem_count IS 'Indique le total elements de la transaction';
COMMENT ON COLUMN phenix.temporary_trans_productivity.ttp_nbr_heures IS 'Indique la durée totale de la transaction';
COMMENT ON COLUMN phenix.temporary_trans_productivity.ttp_prf_prd_code IS 'Indique le produit du PO q''un utilisateur a influencé(réception)';
COMMENT ON COLUMN phenix.temporary_trans_productivity.ttp_rth_id IS 'Indique l''entete de la réception(réception)';
COMMENT ON COLUMN phenix.temporary_trans_productivity.ttp_prf_fmt_code IS 'Indique le format du produit du PO q''un utilisateur a influencé(réception)';