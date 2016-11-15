CREATE TABLE phenix.outstanding_missions (
  osm_id NUMBER(15) NOT NULL,
  osm_cus_code NUMBER(10),
  osm_rou_code NUMBER(5),
  osm_route_position NUMBER(7,2),
  osm_route_date DATE,
  osm_prf_prd_code VARCHAR2(10 BYTE) NOT NULL,
  osm_prf_fmt_code VARCHAR2(7 BYTE) NOT NULL,
  osm_original_quantity NUMBER(7),
  osm_original_weight NUMBER(10,3),
  osm_leftover_quantity NUMBER(7),
  osm_leftover_weight NUMBER(10,3),
  osm_status VARCHAR2(3 BYTE) DEFAULT 'OPN' NOT NULL CONSTRAINT osm_status_ck CHECK (osm_status IN ('OPN','IPR', 'IRE')),
  osm_ven_code NUMBER(5),
  osm_type VARCHAR2(1 BYTE) NOT NULL CONSTRAINT osm_type_ck CHECK (OSM_TYPE IN ('C','V')),
  osm_counter_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT osm_counter_switch_ck CHECK (osm_counter_switch IN (0,1)),
  osm_to_be_shorted_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT osm_to_be_shorted_switch_ck CHECK (OSM_TO_BE_SHORTED_SWITCH IN (1,0)),
  osm_whs_picking_code VARCHAR2(2 BYTE) NOT NULL,
  osm_whs_delivery_code VARCHAR2(2 BYTE) NOT NULL,
  osm_liquidation_switch NUMBER(1) DEFAULT 0 NOT NULL,
  CONSTRAINT osm_cus_ven_ck CHECK ( ((OSM_TYPE = 'C' and OSM_CUS_CODE is not null and OSM_VEN_CODE IS NULL)
 or (OSM_TYPE = 'V' and OSM_CUS_CODE is null and OSM_VEN_CODE IS not NULL)  )),
  CONSTRAINT osm_pk PRIMARY KEY (osm_id),
  CONSTRAINT osm_cus_fk FOREIGN KEY (osm_cus_code) REFERENCES phenix.customers (cus_code),
  CONSTRAINT osm_prf_fk FOREIGN KEY (osm_prf_prd_code,osm_prf_fmt_code) REFERENCES phenix.product_formats (prf_prd_code,prf_fmt_code),
  CONSTRAINT osm_rou_fk FOREIGN KEY (osm_rou_code) REFERENCES phenix.routes (rou_code),
  CONSTRAINT osm_ven_code_fk FOREIGN KEY (osm_ven_code) REFERENCES phenix.vendors (ven_code),
  CONSTRAINT osm_whs_delivery_fk FOREIGN KEY (osm_whs_delivery_code) REFERENCES phenix.warehouses (whs_code),
  CONSTRAINT osm_whs_picking_fk FOREIGN KEY (osm_whs_picking_code) REFERENCES phenix.warehouses (whs_code)
);
COMMENT ON TABLE phenix.outstanding_missions IS 'Missions de cueillette à faire';
COMMENT ON COLUMN phenix.outstanding_missions.osm_id IS 'Identifiant';
COMMENT ON COLUMN phenix.outstanding_missions.osm_cus_code IS 'Numéro de client';
COMMENT ON COLUMN phenix.outstanding_missions.osm_rou_code IS 'Code de route';
COMMENT ON COLUMN phenix.outstanding_missions.osm_route_position IS 'Position du client';
COMMENT ON COLUMN phenix.outstanding_missions.osm_route_date IS 'Date de la route';
COMMENT ON COLUMN phenix.outstanding_missions.osm_prf_prd_code IS 'Numéro de produit';
COMMENT ON COLUMN phenix.outstanding_missions.osm_prf_fmt_code IS 'Numéro de format';
COMMENT ON COLUMN phenix.outstanding_missions.osm_original_quantity IS 'Quantité originale';
COMMENT ON COLUMN phenix.outstanding_missions.osm_original_weight IS 'Poids original';
COMMENT ON COLUMN phenix.outstanding_missions.osm_leftover_quantity IS 'Quantité restante';
COMMENT ON COLUMN phenix.outstanding_missions.osm_leftover_weight IS 'Poids restant';
COMMENT ON COLUMN phenix.outstanding_missions.osm_status IS 'Statut de la mission de cueillette';
COMMENT ON COLUMN phenix.outstanding_missions.osm_ven_code IS 'Indique le code du fournisseur';
COMMENT ON COLUMN phenix.outstanding_missions.osm_type IS 'Indique si la mission de cueillette est une cueillette ou un retour fournisseur';
COMMENT ON COLUMN phenix.outstanding_missions.osm_counter_switch IS 'Indique si c''est une mission pour une commande comptoir';
COMMENT ON COLUMN phenix.outstanding_missions.osm_to_be_shorted_switch IS 'Indique si la ligne a été "flaggée" pour être fermée en tant que "à court"';
COMMENT ON COLUMN phenix.outstanding_missions.osm_whs_picking_code IS 'Indique le code de l''entrepôt de cueillette';
COMMENT ON COLUMN phenix.outstanding_missions.osm_whs_delivery_code IS 'Indique le code de l''entrepôt de livraison';
COMMENT ON COLUMN phenix.outstanding_missions.osm_liquidation_switch IS 'Indique si cette ligne de transaction est cueillie dans des localisations de liquidation';