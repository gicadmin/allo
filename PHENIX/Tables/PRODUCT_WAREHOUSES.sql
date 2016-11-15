CREATE TABLE phenix.product_warehouses (
  prw_prd_code VARCHAR2(10 BYTE) NOT NULL,
  prw_whs_code VARCHAR2(2 BYTE) NOT NULL,
  prw_items_per_pallet NUMBER(5) NOT NULL,
  prw_items_per_row NUMBER(3) NOT NULL,
  prw_replenish_coefficient NUMBER(6,3) DEFAULT 0 NOT NULL,
  prw_replenish_point NUMBER(8,3) DEFAULT 0 NOT NULL,
  prw_replenish_quantity NUMBER(8,3) DEFAULT 0 NOT NULL,
  prw_shr_code NUMBER(3) NOT NULL,
  prw_added_transp_amount NUMBER(11,6) DEFAULT 0 NOT NULL,
  prw_purchasable_switch NUMBER(1) NOT NULL CONSTRAINT prw_purchasable_switch_ck CHECK (prw_purchasable_switch IN (0,1)),
  prw_sellable_switch NUMBER(1) NOT NULL CONSTRAINT prw_sellable_switch_ck CHECK (prw_sellable_switch IN (0,1)),
  prw_pickable_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT prw_pickable_switch_ck CHECK (PRW_PICKABLE_SWITCH IN (0,1)),
  prw_whz_code VARCHAR2(2 BYTE) NOT NULL,
  prw_warehouse_product_code VARCHAR2(10 BYTE),
  prw_federal_display_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT prw_federal_display_switch_ck CHECK (PRW_FEDERAL_DISPLAY_SWITCH IN (0,1)),
  prw_federal_tax_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT prw_federal_tax_switch_ck CHECK (PRW_FEDERAL_TAX_SWITCH IN (0,1)),
  prw_provincial_display_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT prw_provincial_display_sw_ck CHECK (PRW_PROVINCIAL_DISPLAY_SWITCH IN (0,1)),
  prw_provincial_tax_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT prw_provincial_tax_switch_ck CHECK (PRW_PROVINCIAL_TAX_SWITCH IN (0,1)),
  prw_round_per_pallet_percent NUMBER(6,3),
  prw_round_per_row_percent NUMBER(6,3),
  prw_replenish_nb_of_week NUMBER(3,1),
  CONSTRAINT prw_pk PRIMARY KEY (prw_prd_code,prw_whs_code),
  CONSTRAINT prw_prd_fk FOREIGN KEY (prw_prd_code) REFERENCES phenix.products (prd_code),
  CONSTRAINT prw_shr_fk FOREIGN KEY (prw_shr_code) REFERENCES phenix.shorted_reasons (shr_code),
  CONSTRAINT prw_whs_fk FOREIGN KEY (prw_whs_code) REFERENCES phenix.warehouses (whs_code),
  CONSTRAINT prw_whz_fk FOREIGN KEY (prw_whz_code) REFERENCES phenix.warehouse_zones (whz_code)
);
COMMENT ON TABLE phenix.product_warehouses IS 'Table contenant le détail des produits spécifique à un entrepôt';
COMMENT ON COLUMN phenix.product_warehouses.prw_prd_code IS 'Indique le code de produit';
COMMENT ON COLUMN phenix.product_warehouses.prw_whs_code IS 'Indique le code de l''entrepôt';
COMMENT ON COLUMN phenix.product_warehouses.prw_items_per_pallet IS 'Indique le nombre d''items par palette';
COMMENT ON COLUMN phenix.product_warehouses.prw_items_per_row IS 'Indique le nombre d''items par rangée de palette';
COMMENT ON COLUMN phenix.product_warehouses.prw_replenish_coefficient IS 'Indique le nombre de cycle d''achat dont on tient compte lors du calcul de la quantité suggérée';
COMMENT ON COLUMN phenix.product_warehouses.prw_replenish_point IS 'Indique le seuil de réapprovisionnement';
COMMENT ON COLUMN phenix.product_warehouses.prw_replenish_quantity IS 'Indique la quantité commandée au seuil de réapprovisionnement';
COMMENT ON COLUMN phenix.product_warehouses.prw_shr_code IS 'Indique le code de la raison "à court"';
COMMENT ON COLUMN phenix.product_warehouses.prw_added_transp_amount IS 'Indique les frais de transport';
COMMENT ON COLUMN phenix.product_warehouses.prw_purchasable_switch IS 'Indique si le produit peut être acheté';
COMMENT ON COLUMN phenix.product_warehouses.prw_sellable_switch IS 'Indique si le produit peut être vendu';
COMMENT ON COLUMN phenix.product_warehouses.prw_pickable_switch IS 'Indique  si le produit est cueillable dans cet entrepôt';
COMMENT ON COLUMN phenix.product_warehouses.prw_whz_code IS 'Indique la zone où le produit sera entreposée';
COMMENT ON COLUMN phenix.product_warehouses.prw_warehouse_product_code IS 'Indique le code de produit specifique à l''entrepôt';
COMMENT ON COLUMN phenix.product_warehouses.prw_federal_display_switch IS 'Indique si la taxe fédérale est affiché sur le bottin';
COMMENT ON COLUMN phenix.product_warehouses.prw_federal_tax_switch IS 'Indique si le produit est taxé au fédéral';
COMMENT ON COLUMN phenix.product_warehouses.prw_provincial_display_switch IS 'Indique si la taxe provinciale est affiché sur le bottin';
COMMENT ON COLUMN phenix.product_warehouses.prw_provincial_tax_switch IS 'Indique si le produit est taxé au provincial';
COMMENT ON COLUMN phenix.product_warehouses.prw_round_per_pallet_percent IS 'Indique le pourcentage maximum pouvant être ajouté à la quantité suggérée s''il permet l''arrondissement à la palette suivante lors des commandes d''achat';
COMMENT ON COLUMN phenix.product_warehouses.prw_round_per_row_percent IS 'Indique le pourcentage maximum pouvant être ajouté à la quantité suggérée s''il permet l''arrondissement à la rangée suivante lors des commandes d''achat';
COMMENT ON COLUMN phenix.product_warehouses.prw_replenish_nb_of_week IS 'Indique le nombre de semaines d''inventaire nécessaire en entrepôt pour ne pas commander';