CREATE GLOBAL TEMPORARY TABLE phenix.temporary_pick_missions (
  tpm_pmh_id NUMBER(15),
  tpm_pmh_rou_code NUMBER(5),
  tpm_pmh_route_position NUMBER(7,2),
  tpm_pmd_sequence_number NUMBER(4),
  tpm_sequence_bar_code VARCHAR2(6 BYTE),
  tpm_prd_code VARCHAR2(10 BYTE),
  tpm_prd_description VARCHAR2(45 BYTE),
  tpm_brn_or_ven_name VARCHAR2(15 BYTE),
  tpm_prf_description VARCHAR2(30 BYTE),
  tpm_quantity NUMBER(7),
  tpm_pmd_loc_code VARCHAR2(18 BYTE),
  tpm_fmt_short_code VARCHAR2(2 BYTE),
  tpm_fmt_edi_short_code VARCHAR2(2 BYTE),
  tpm_vpd_manufacturer_code VARCHAR2(15 BYTE),
  tpm_cus_code NUMBER(10),
  tpm_cus_name VARCHAR2(30 BYTE),
  tpm_cus_deliver_to_city VARCHAR2(30 BYTE),
  tpm_prv_code VARCHAR2(2 BYTE),
  tpm_psr_price NUMBER(7,2),
  tpm_prf_one_pick_wght_switch NUMBER(1),
  tpm_prd_definition VARCHAR2(1 BYTE),
  tpm_pmd_prf_fmt_code VARCHAR2(7 BYTE),
  tpm_weight NUMBER(10,3),
  tpm_user_picker_code NUMBER(5),
  tpm_vpd_code VARCHAR2(15 BYTE),
  tpm_quantity_weight NUMBER(7,3)
)
ON COMMIT PRESERVE ROWS;
COMMENT ON COLUMN phenix.temporary_pick_missions.tpm_pmh_id IS 'Indique le numéro de la mission (ID)';
COMMENT ON COLUMN phenix.temporary_pick_missions.tpm_pmh_rou_code IS 'Indique le code de route de la mission';
COMMENT ON COLUMN phenix.temporary_pick_missions.tpm_pmh_route_position IS 'Indique la position du client sur la route';
COMMENT ON COLUMN phenix.temporary_pick_missions.tpm_pmd_sequence_number IS 'Indique la séquence dans la mission de cueillette';
COMMENT ON COLUMN phenix.temporary_pick_missions.tpm_sequence_bar_code IS 'Indique la séquence dans la mission au format de code à barres';
COMMENT ON COLUMN phenix.temporary_pick_missions.tpm_prd_code IS 'Indique le numéro de produit de la ligne de cueillette';
COMMENT ON COLUMN phenix.temporary_pick_missions.tpm_prd_description IS 'Indique la description du produit de la ligne de cueillette';
COMMENT ON COLUMN phenix.temporary_pick_missions.tpm_brn_or_ven_name IS 'Indique la description de la marque ou le nom du vendeur';
COMMENT ON COLUMN phenix.temporary_pick_missions.tpm_prf_description IS 'Indique la description du format du produit';
COMMENT ON COLUMN phenix.temporary_pick_missions.tpm_quantity IS 'Indique la quantité de produits pour cet étiquette de la mission';
COMMENT ON COLUMN phenix.temporary_pick_missions.tpm_pmd_loc_code IS 'Indique le code de la localisation de la ligne de cueillette';
COMMENT ON COLUMN phenix.temporary_pick_missions.tpm_fmt_short_code IS 'Indique le code court de format utilisé pour la vente';
COMMENT ON COLUMN phenix.temporary_pick_missions.tpm_fmt_edi_short_code IS 'Indique le code de format EDI';
COMMENT ON COLUMN phenix.temporary_pick_missions.tpm_vpd_manufacturer_code IS 'Indique le numéro de manufacturier';
COMMENT ON COLUMN phenix.temporary_pick_missions.tpm_cus_code IS 'Indique le numéro de client';
COMMENT ON COLUMN phenix.temporary_pick_missions.tpm_cus_name IS 'Indique le nom du client';
COMMENT ON COLUMN phenix.temporary_pick_missions.tpm_cus_deliver_to_city IS 'Indique la ville de livraison';
COMMENT ON COLUMN phenix.temporary_pick_missions.tpm_prv_code IS 'Indique la province de livraison';
COMMENT ON COLUMN phenix.temporary_pick_missions.tpm_psr_price IS 'Indique le prix de détail suggéré';
COMMENT ON COLUMN phenix.temporary_pick_missions.tpm_pmd_prf_fmt_code IS 'Indique le code du format';
COMMENT ON COLUMN phenix.temporary_pick_missions.tpm_weight IS 'Indique le poids de produits pour cet étiquette de la mission';
COMMENT ON COLUMN phenix.temporary_pick_missions.tpm_user_picker_code IS 'Indique le code du cueilleur de la mission.';
COMMENT ON COLUMN phenix.temporary_pick_missions.tpm_vpd_code IS 'Indique le code manufacturier du produit.';
COMMENT ON COLUMN phenix.temporary_pick_missions.tpm_quantity_weight IS 'Indique le poids ou la quantité du produit dépendemment si c''est un produit vrac ou pas.';