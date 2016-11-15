CREATE TABLE phenix.temporary_containers_to_load (
  tcl_lsc_container_id NUMBER(12),
  tcl_cus_code NUMBER(10),
  tcl_number_of_pallets NUMBER(2),
  tcl_number_lines NUMBER(7),
  tcl_number_pieces NUMBER(7),
  tcl_volume NUMBER(12,3),
  tcl_weight NUMBER(9,3),
  tcl_sale_dollars NUMBER(12,2),
  tcl_number_of_cases NUMBER(7),
  tcl_lsc_loc_code VARCHAR2(12 BYTE),
  tcl_pmh_route_date DATE,
  tcl_pmh_whz_code VARCHAR2(2 BYTE),
  tcl_selected_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT tcl_selected_switch_ck CHECK (TCL_SELECTED_SWITCH IN (0, 1)),
  tcl_whc_code VARCHAR2(2 BYTE)
);
COMMENT ON TABLE phenix.temporary_containers_to_load IS 'Table utilisée pour calculer l''espace etc des palettes déjà facturées lors des générations de cueillette';
COMMENT ON COLUMN phenix.temporary_containers_to_load.tcl_lsc_container_id IS 'Indique le numéro de conteneur (no de palette)';
COMMENT ON COLUMN phenix.temporary_containers_to_load.tcl_cus_code IS 'Indique le code du client';
COMMENT ON COLUMN phenix.temporary_containers_to_load.tcl_number_of_pallets IS 'Indique le nombre de palettes du conteneur';
COMMENT ON COLUMN phenix.temporary_containers_to_load.tcl_number_lines IS 'Indique le nombre de lignes';
COMMENT ON COLUMN phenix.temporary_containers_to_load.tcl_number_pieces IS 'Indique le nombre de pièces';
COMMENT ON COLUMN phenix.temporary_containers_to_load.tcl_volume IS 'Indique le volume du conteneur';
COMMENT ON COLUMN phenix.temporary_containers_to_load.tcl_weight IS 'Indique le poids du conteneur';
COMMENT ON COLUMN phenix.temporary_containers_to_load.tcl_sale_dollars IS 'Indique le montant de la vente du conteneur';
COMMENT ON COLUMN phenix.temporary_containers_to_load.tcl_number_of_cases IS 'Indique le nombre de format manufacturier inclus dans le conteneur';
COMMENT ON COLUMN phenix.temporary_containers_to_load.tcl_lsc_loc_code IS 'Indique la localisation courante du conteneur';
COMMENT ON COLUMN phenix.temporary_containers_to_load.tcl_pmh_route_date IS 'Indique la date de route initiale du conteneur';
COMMENT ON COLUMN phenix.temporary_containers_to_load.tcl_pmh_whz_code IS 'Indique le code de la zone d''entreposage de la mission initiale';
COMMENT ON COLUMN phenix.temporary_containers_to_load.tcl_selected_switch IS 'Indique si le conteneur a été sélectionné pour le chargement (selon les zones d''entreposage choisies) ';
COMMENT ON COLUMN phenix.temporary_containers_to_load.tcl_whc_code IS 'Indique le code de condition de la zone d''entreposage ';