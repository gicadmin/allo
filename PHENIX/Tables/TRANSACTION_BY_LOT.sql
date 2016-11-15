CREATE TABLE phenix.transaction_by_lot (
  tbl_id NUMBER(15) NOT NULL,
  tbl_type VARCHAR2(21 BYTE) NOT NULL CONSTRAINT tbl_type_ck CHECK (TBL_TYPE IN ('R', 'C', 'P', 'A', 'T', 'E')),
  tbl_bar_code VARCHAR2(200 BYTE) NOT NULL,
  tbl_prd_code VARCHAR2(10 BYTE) NOT NULL,
  tbl_weight NUMBER(10,3) NOT NULL,
  tbl_date DATE NOT NULL,
  tbl_type_date VARCHAR2(1 BYTE) NOT NULL CONSTRAINT tbl_type_date_ck CHECK (TBL_TYPE_DATE IN ('P', 'E')),
  tbl_upc_code VARCHAR2(18 BYTE),
  tbl_num_serial VARCHAR2(30 BYTE),
  tbl_order_code NUMBER(15),
  tbl_pick_code NUMBER(15),
  tbl_creation_date DATE DEFAULT SYSDATE NOT NULL,
  tbl_temperature NUMBER(6,2),
  tbl_establishment VARCHAR2(7 BYTE),
  tbl_use_code NUMBER(5) DEFAULT 99999 NOT NULL,
  tbl_modification_date DATE DEFAULT SYSDATE NOT NULL,
  tbl_pallet_number VARCHAR2(200 BYTE),
  tbl_id_origin NUMBER(15),
  tbl_recipe_number VARCHAR2(10 BYTE),
  tbl_customer_order_number NUMBER(7),
  tbl_loc_code VARCHAR2(12 BYTE),
  CONSTRAINT tbl_pk PRIMARY KEY (tbl_id)
);
COMMENT ON TABLE phenix.transaction_by_lot IS 'Table des transactions par lot';
COMMENT ON COLUMN phenix.transaction_by_lot.tbl_id IS 'Indique l''identifiant unique';
COMMENT ON COLUMN phenix.transaction_by_lot.tbl_type IS 'Indique le type de transaction';
COMMENT ON COLUMN phenix.transaction_by_lot.tbl_bar_code IS 'Indique le code à barre scanné au complet';
COMMENT ON COLUMN phenix.transaction_by_lot.tbl_prd_code IS 'Indique le code produit ';
COMMENT ON COLUMN phenix.transaction_by_lot.tbl_weight IS 'Indique le poids du lot';
COMMENT ON COLUMN phenix.transaction_by_lot.tbl_date IS 'Indique la date du lot';
COMMENT ON COLUMN phenix.transaction_by_lot.tbl_type_date IS 'Indique le type de date du lot';
COMMENT ON COLUMN phenix.transaction_by_lot.tbl_upc_code IS 'Indique le code UPC du lot';
COMMENT ON COLUMN phenix.transaction_by_lot.tbl_num_serial IS 'Indique le numero de série du produit ';
COMMENT ON COLUMN phenix.transaction_by_lot.tbl_order_code IS 'Indique le Numero du bon de commande';
COMMENT ON COLUMN phenix.transaction_by_lot.tbl_pick_code IS 'Indique le Numero de cueillette';
COMMENT ON COLUMN phenix.transaction_by_lot.tbl_creation_date IS 'Indique la date de creation de la transaction';
COMMENT ON COLUMN phenix.transaction_by_lot.tbl_temperature IS 'Indique la température lors de la transaction';
COMMENT ON COLUMN phenix.transaction_by_lot.tbl_establishment IS 'Indique la date de la dernière modification de la transaction';
COMMENT ON COLUMN phenix.transaction_by_lot.tbl_pallet_number IS 'Indique le numéro de la palette';
COMMENT ON COLUMN phenix.transaction_by_lot.tbl_id_origin IS 'Indique l''identifiant de la transaction d''origine';
COMMENT ON COLUMN phenix.transaction_by_lot.tbl_recipe_number IS 'Indique le numéro de la recette';
COMMENT ON COLUMN phenix.transaction_by_lot.tbl_customer_order_number IS 'Indique le numéro de la commande client';
COMMENT ON COLUMN phenix.transaction_by_lot.tbl_loc_code IS 'Indique le code de la localisation';