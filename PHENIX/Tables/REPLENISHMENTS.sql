CREATE TABLE phenix.replenishments (
  rep_id NUMBER(15) NOT NULL,
  rep_from_loc_code VARCHAR2(12 BYTE) NOT NULL,
  rep_prf_prd_code VARCHAR2(10 BYTE) NOT NULL,
  rep_prf_fmt_code VARCHAR2(7 BYTE) NOT NULL,
  rep_quantity NUMBER(7),
  rep_weight NUMBER(10,3),
  rep_priority NUMBER(2) NOT NULL,
  rep_planned_switch NUMBER(1) NOT NULL CONSTRAINT rep_planned_switch_ck CHECK (REP_PLANNED_SWITCH IN (0,1)),
  rep_status VARCHAR2(1 BYTE) NOT NULL CONSTRAINT rep_status_ck CHECK (REP_STATUS IN ('C', 'A', 'P', 'T')),
  rep_use_code NUMBER(5),
  rep_creation_date DATE,
  rep_selected_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT rep_selected_switch_ck CHECK (rep_selected_switch IN (0, 1)),
  rep_quantity_required NUMBER(7),
  rep_weight_required NUMBER(10,3),
  rep_whs_code VARCHAR2(2 BYTE) NOT NULL,
  rep_taken_quantity NUMBER(7),
  rep_taken_weight NUMBER(10,3),
  CONSTRAINT rep_pk PRIMARY KEY (rep_id),
  CONSTRAINT rep_from_loc_fk FOREIGN KEY (rep_from_loc_code) REFERENCES phenix.locations (loc_code),
  CONSTRAINT rep_prf_fk FOREIGN KEY (rep_prf_prd_code,rep_prf_fmt_code) REFERENCES phenix.product_formats (prf_prd_code,prf_fmt_code),
  CONSTRAINT rep_use_fk FOREIGN KEY (rep_use_code) REFERENCES phenix."USERS" (use_code),
  CONSTRAINT rep_whs_fk FOREIGN KEY (rep_whs_code) REFERENCES phenix.warehouses (whs_code)
);
COMMENT ON TABLE phenix.replenishments IS 'La table des réapprovisionnements est utilisée pour garder les réapprovisionnements à faire';
COMMENT ON COLUMN phenix.replenishments.rep_id IS 'Indique l''identifiant unique';
COMMENT ON COLUMN phenix.replenishments.rep_from_loc_code IS 'Indique la localisation d''origine';
COMMENT ON COLUMN phenix.replenishments.rep_prf_prd_code IS 'Indique le code de produit';
COMMENT ON COLUMN phenix.replenishments.rep_prf_fmt_code IS 'Indique le code de format';
COMMENT ON COLUMN phenix.replenishments.rep_quantity IS 'Indique la quantité à réapprovisionner';
COMMENT ON COLUMN phenix.replenishments.rep_weight IS 'Indique le poids à réapprovisionner';
COMMENT ON COLUMN phenix.replenishments.rep_priority IS 'Indique la priorité du réapprovisionnement. Peut contenir une valeur de 0 a 99';
COMMENT ON COLUMN phenix.replenishments.rep_planned_switch IS 'Indique si le réapprovisionnement est planifié';
COMMENT ON COLUMN phenix.replenishments.rep_status IS 'Indique le statut du réapprovisionnement';
COMMENT ON COLUMN phenix.replenishments.rep_use_code IS 'Indique l''usager qui traite le réapprovisionnement';
COMMENT ON COLUMN phenix.replenishments.rep_creation_date IS 'Indique la date de génération du réapprovisionnement';
COMMENT ON COLUMN phenix.replenishments.rep_selected_switch IS 'Indique si l''enregistrement est sélectionné lors du processus de génération';
COMMENT ON COLUMN phenix.replenishments.rep_quantity_required IS 'Indique la quantité requise dans le format de la localisation de destination';
COMMENT ON COLUMN phenix.replenishments.rep_weight_required IS 'Indique le poids requis dans le format de la localisation de destination';
COMMENT ON COLUMN phenix.replenishments.rep_whs_code IS 'Indique le code de l''entrepôt du réapprovisionnement';
COMMENT ON COLUMN phenix.replenishments.rep_taken_quantity IS 'Indique la quantité prise dans la localisation d''origine';
COMMENT ON COLUMN phenix.replenishments.rep_taken_weight IS 'Indique le poids pris dans la localisation d''origine';