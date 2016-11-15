CREATE TABLE phenix.replenishment_details (
  red_id NUMBER(15) NOT NULL,
  red_rep_id NUMBER(15) NOT NULL,
  red_to_loc_code VARCHAR2(12 BYTE) NOT NULL,
  red_prf_prd_code VARCHAR2(10 BYTE) NOT NULL,
  red_prf_fmt_code VARCHAR2(7 BYTE) NOT NULL,
  red_status VARCHAR2(1 BYTE) NOT NULL CONSTRAINT red_status_ck CHECK (RED_STATUS IN ('O', 'L', 'C', 'A')),
  red_conversion_to_source NUMBER(10,6) NOT NULL,
  red_source_suggested_quantity NUMBER(7),
  red_source_suggested_weight NUMBER(10,3),
  red_source_required_quantity NUMBER(7),
  red_source_required_weight NUMBER(10,3),
  red_source_taken_quantity NUMBER(7),
  red_source_taken_weight NUMBER(10,3),
  red_result_suggested_quantity NUMBER(7),
  red_result_suggested_weight NUMBER(10,3),
  red_result_required_quantity NUMBER(7),
  red_result_required_weight NUMBER(10,3),
  red_result_unassigned_quantity NUMBER(7),
  red_result_unassigned_weight NUMBER(10,3),
  red_result_taken_quantity NUMBER(7),
  red_result_taken_weight NUMBER(10,3),
  red_validate_inventory_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT red_validate_inventory_swit_ck CHECK (RED_VALIDATE_INVENTORY_SWITCH IN (0, 1)),
  red_creation_date DATE DEFAULT SYSDATE NOT NULL,
  red_modification_date DATE DEFAULT SYSDATE NOT NULL,
  CONSTRAINT red_pk PRIMARY KEY (red_id),
  CONSTRAINT red_prf_fk FOREIGN KEY (red_prf_prd_code,red_prf_fmt_code) REFERENCES phenix.product_formats (prf_prd_code,prf_fmt_code),
  CONSTRAINT red_rep_fk FOREIGN KEY (red_rep_id) REFERENCES phenix.replenishments (rep_id) ON DELETE CASCADE,
  CONSTRAINT red_to_loc_fk FOREIGN KEY (red_to_loc_code) REFERENCES phenix.locations (loc_code)
);
COMMENT ON TABLE phenix.replenishment_details IS 'Table pour les destinations différentes d''un réapprovisionnement';
COMMENT ON COLUMN phenix.replenishment_details.red_id IS 'Indique l''identifiant unique';
COMMENT ON COLUMN phenix.replenishment_details.red_rep_id IS 'Indique l''identifiant du réapprovisionnement';
COMMENT ON COLUMN phenix.replenishment_details.red_to_loc_code IS 'Indique la localisation de destination';
COMMENT ON COLUMN phenix.replenishment_details.red_prf_prd_code IS 'Indique le produit gardé dans la localisation de destination';
COMMENT ON COLUMN phenix.replenishment_details.red_prf_fmt_code IS 'Indique le format d''inventaire gardé dans la localisation de destination';
COMMENT ON COLUMN phenix.replenishment_details.red_status IS 'Indique le statut de la ligne de réapprovisionnement';
COMMENT ON COLUMN phenix.replenishment_details.red_conversion_to_source IS 'Indique le facteur de conversion à partir du produit format source du réapprovisionnement (format source multiplié par la conversion donne la quantité du format destination)';
COMMENT ON COLUMN phenix.replenishment_details.red_source_suggested_quantity IS 'Indique la quantité suggérée à transférer dans le format de la localisation source';
COMMENT ON COLUMN phenix.replenishment_details.red_source_suggested_weight IS 'Indique le poids suggéré à transférer dans le format de la localisation source';
COMMENT ON COLUMN phenix.replenishment_details.red_source_required_quantity IS 'Indique la quantité requise dans le format de la localisation source';
COMMENT ON COLUMN phenix.replenishment_details.red_source_required_weight IS 'Indique le poids requis dans le format de la localisation source';
COMMENT ON COLUMN phenix.replenishment_details.red_source_taken_quantity IS 'Indique la quantité (au format source) mise dans la localisation de destination';
COMMENT ON COLUMN phenix.replenishment_details.red_source_taken_weight IS 'Indique le poids (au format source) mis dans la localisation de destination';
COMMENT ON COLUMN phenix.replenishment_details.red_result_suggested_quantity IS 'Indique la quantité suggérée à transférer dans le format de la localisation de destination';
COMMENT ON COLUMN phenix.replenishment_details.red_result_suggested_weight IS 'Indique le poids suggéré à transférer dans le format de la localisation de destination';
COMMENT ON COLUMN phenix.replenishment_details.red_result_required_quantity IS 'Indique la quantité requise dans le format de la localisation de destination';
COMMENT ON COLUMN phenix.replenishment_details.red_result_required_weight IS 'Indique le poids requis dans le format de la localisation de destination';
COMMENT ON COLUMN phenix.replenishment_details.red_result_unassigned_quantity IS 'Indique la quantité, au format de destination, qui est incluse dans la quantité requise mais qui n''appartient encore à personne (elle est requise seulement du à une conversion de format)';
COMMENT ON COLUMN phenix.replenishment_details.red_result_unassigned_weight IS 'Indique le poids, au format de destination, qui est inclus dans le poids requis mais qui n''appartient encore à personne (il est requise seulement du à une conversion de format)';
COMMENT ON COLUMN phenix.replenishment_details.red_result_taken_quantity IS 'Indique la quantité (au format de destination) mise dans la localisation de destination';
COMMENT ON COLUMN phenix.replenishment_details.red_result_taken_weight IS 'Indique le poids (au format de destination) mis dans la localisation de destination';
COMMENT ON COLUMN phenix.replenishment_details.red_validate_inventory_switch IS 'Indique si l''inventaire doit être validé en même temps que le réapprovisionnement sera fait';
COMMENT ON COLUMN phenix.replenishment_details.red_creation_date IS 'Indique la date de création de la ligne de détails de réapprovisionnement';
COMMENT ON COLUMN phenix.replenishment_details.red_modification_date IS 'Indique la date de la dernière modification apportée à la ligne de détails de réapprovisionnement';