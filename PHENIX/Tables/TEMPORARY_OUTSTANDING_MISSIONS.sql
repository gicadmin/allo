CREATE TABLE phenix.temporary_outstanding_missions (
  tom_id NUMBER(15) NOT NULL,
  tom_cus_code NUMBER(10),
  tom_cus_ranking VARCHAR2(1 BYTE) NOT NULL,
  tom_plh_id NUMBER(15),
  tom_pmh_id NUMBER(15),
  tom_pmd_id NUMBER(15),
  tom_rou_code NUMBER(5),
  tom_route_position NUMBER(7,2),
  tom_route_date DATE,
  tom_whs_picking_code VARCHAR2(2 BYTE),
  tom_whs_delivery_code VARCHAR2(2 BYTE),
  tom_prf_prd_code VARCHAR2(10 BYTE),
  tom_prf_fmt_code VARCHAR2(7 BYTE),
  tom_original_quantity NUMBER(7),
  tom_original_weight NUMBER(10,3),
  tom_picked_quantity NUMBER(7),
  tom_picked_weight NUMBER(10,3),
  tom_available_quantity NUMBER(7),
  tom_available_weight NUMBER(10,3),
  tom_selected_switch NUMBER(1) NOT NULL CONSTRAINT tom_selected_switch_ck CHECK (TOM_SELECTED_SWITCH IN (0, 1)),
  CONSTRAINT tom_pk PRIMARY KEY (tom_id)
);
COMMENT ON TABLE phenix.temporary_outstanding_missions IS 'Table utilisée pour indiquer les missions qui pourrait nécessiter une deuxième vague de cueillette';
COMMENT ON COLUMN phenix.temporary_outstanding_missions.tom_id IS 'Indique l''identifiant unique de la table';
COMMENT ON COLUMN phenix.temporary_outstanding_missions.tom_cus_code IS 'Indique le code de client';
COMMENT ON COLUMN phenix.temporary_outstanding_missions.tom_cus_ranking IS 'Indique le code de classification du client (de A à E)';
COMMENT ON COLUMN phenix.temporary_outstanding_missions.tom_plh_id IS 'Indique le numéro de la demande de cueillette';
COMMENT ON COLUMN phenix.temporary_outstanding_missions.tom_pmh_id IS 'Indique le numéro de la mission originale';
COMMENT ON COLUMN phenix.temporary_outstanding_missions.tom_pmd_id IS 'Indique le numéro de la ligne de mission originale';
COMMENT ON COLUMN phenix.temporary_outstanding_missions.tom_rou_code IS 'Indique le code de la route';
COMMENT ON COLUMN phenix.temporary_outstanding_missions.tom_route_position IS 'Indique la position du client';
COMMENT ON COLUMN phenix.temporary_outstanding_missions.tom_route_date IS 'Indique la date de la route';
COMMENT ON COLUMN phenix.temporary_outstanding_missions.tom_whs_picking_code IS 'Indique le code de l''entrepôt de cueillette';
COMMENT ON COLUMN phenix.temporary_outstanding_missions.tom_whs_delivery_code IS 'Indique le code de l''entrepôt de livraison';
COMMENT ON COLUMN phenix.temporary_outstanding_missions.tom_prf_prd_code IS 'Indique le code de produit';
COMMENT ON COLUMN phenix.temporary_outstanding_missions.tom_prf_fmt_code IS 'Indique le code de format';
COMMENT ON COLUMN phenix.temporary_outstanding_missions.tom_original_quantity IS 'Indique la quantité originale';
COMMENT ON COLUMN phenix.temporary_outstanding_missions.tom_original_weight IS 'Indique le poids original';
COMMENT ON COLUMN phenix.temporary_outstanding_missions.tom_picked_quantity IS 'Indique la quantité cueillie';
COMMENT ON COLUMN phenix.temporary_outstanding_missions.tom_picked_weight IS 'Indique le poids cueilli';
COMMENT ON COLUMN phenix.temporary_outstanding_missions.tom_available_quantity IS 'Indique la quantité disponible en inventaire';
COMMENT ON COLUMN phenix.temporary_outstanding_missions.tom_available_weight IS 'Indique le poids disponible en inventaire';
COMMENT ON COLUMN phenix.temporary_outstanding_missions.tom_selected_switch IS 'Indique si la ligne a été sélectionnée';