CREATE TABLE phenix.temporary_pc_file (
  tpc_customer_code NUMBER(20),
  tpc_order_number NUMBER(15) NOT NULL,
  tpc_line_number NUMBER(4) NOT NULL,
  tpc_product_code VARCHAR2(10 BYTE),
  tpc_completion_code VARCHAR2(1 BYTE),
  tpc_customer_name VARCHAR2(16 BYTE),
  tpc_customer_po_number VARCHAR2(15 BYTE),
  tpc_date_shipped DATE,
  tpc_order_date DATE,
  tpc_ordered_quantity NUMBER(7),
  tpc_ordered_weight NUMBER(8,3),
  tpc_pack_size NUMBER(6),
  tpc_picked_quantity NUMBER(10,3),
  tpc_picked_weight NUMBER(8,3),
  tpc_required_date DATE,
  tpc_upc_code VARCHAR2(18 BYTE),
  tpc_transaction_type VARCHAR2(1 BYTE),
  tpc_trailer_number VARCHAR2(12 BYTE),
  tpc_palette_number VARCHAR2(12 BYTE),
  tpc_number_of_packages NUMBER(4),
  CONSTRAINT tpc_pk PRIMARY KEY (tpc_order_number,tpc_line_number)
);
COMMENT ON TABLE phenix.temporary_pc_file IS 'Table temporaire qui contient les confimations des documents de cueillette';
COMMENT ON COLUMN phenix.temporary_pc_file.tpc_customer_code IS 'Code client';
COMMENT ON COLUMN phenix.temporary_pc_file.tpc_order_number IS 'Numéro de commande';
COMMENT ON COLUMN phenix.temporary_pc_file.tpc_line_number IS 'Numéro de ligne';
COMMENT ON COLUMN phenix.temporary_pc_file.tpc_product_code IS 'Code produit';
COMMENT ON COLUMN phenix.temporary_pc_file.tpc_completion_code IS 'Code d''achèvement';
COMMENT ON COLUMN phenix.temporary_pc_file.tpc_customer_name IS 'Nom du client';
COMMENT ON COLUMN phenix.temporary_pc_file.tpc_customer_po_number IS 'Numéro de la commande d''achat du client';
COMMENT ON COLUMN phenix.temporary_pc_file.tpc_date_shipped IS 'Date envoyé';
COMMENT ON COLUMN phenix.temporary_pc_file.tpc_order_date IS 'Date de la commande';
COMMENT ON COLUMN phenix.temporary_pc_file.tpc_ordered_quantity IS 'Quantité commandée';
COMMENT ON COLUMN phenix.temporary_pc_file.tpc_ordered_weight IS 'Poids commandé';
COMMENT ON COLUMN phenix.temporary_pc_file.tpc_pack_size IS 'Dimension du paquet';
COMMENT ON COLUMN phenix.temporary_pc_file.tpc_picked_quantity IS 'Quantité cueillie';
COMMENT ON COLUMN phenix.temporary_pc_file.tpc_picked_weight IS 'Poids cueilli';
COMMENT ON COLUMN phenix.temporary_pc_file.tpc_required_date IS 'Date requis';
COMMENT ON COLUMN phenix.temporary_pc_file.tpc_upc_code IS 'Code universel de produit';
COMMENT ON COLUMN phenix.temporary_pc_file.tpc_transaction_type IS 'Type de transaction';
COMMENT ON COLUMN phenix.temporary_pc_file.tpc_trailer_number IS 'Numéro ASN';
COMMENT ON COLUMN phenix.temporary_pc_file.tpc_palette_number IS 'Numéro de palette de l''ASN';
COMMENT ON COLUMN phenix.temporary_pc_file.tpc_number_of_packages IS 'Nombre de colis';