CREATE GLOBAL TEMPORARY TABLE phenix.temporary_sales_group (
  tsg_prd_code VARCHAR2(10 BYTE),
  tsg_prd_description VARCHAR2(45 BYTE),
  tsg_prd_pgr_code NUMBER(5),
  tsg_prd_pgr_desc VARCHAR2(30 BYTE),
  tsg_prd_pgr_sup NUMBER(5),
  tsg_prd_pgr_sup_desc VARCHAR2(30 BYTE),
  tsg_prd_pgr_maj NUMBER(5),
  tsg_prd_pgr_maj_desc VARCHAR2(30 BYTE),
  tsg_vend_telem_code NUMBER(5),
  tsg_vend_telem_name VARCHAR2(70 BYTE),
  tsg_cus_code NUMBER(10),
  tsg_sum_sale_price NUMBER(15,3),
  tsg_sum_cost_price NUMBER(15,3),
  tsg_count_cust NUMBER(10)
)
ON COMMIT PRESERVE ROWS;
COMMENT ON TABLE phenix.temporary_sales_group IS 'Table utilisée pour le rapport RAP_VENTE_GROUPE_MAJEUR_TELEVENDEUR';
COMMENT ON COLUMN phenix.temporary_sales_group.tsg_prd_code IS 'Indique le code du produit';
COMMENT ON COLUMN phenix.temporary_sales_group.tsg_prd_description IS 'Indique la descritpion du produit';
COMMENT ON COLUMN phenix.temporary_sales_group.tsg_prd_pgr_code IS 'Indique le code du groupe du produit';
COMMENT ON COLUMN phenix.temporary_sales_group.tsg_prd_pgr_desc IS 'Indique la description du groupe du produit';
COMMENT ON COLUMN phenix.temporary_sales_group.tsg_prd_pgr_sup IS 'Indique le code du groupe supérieur du produit';
COMMENT ON COLUMN phenix.temporary_sales_group.tsg_prd_pgr_sup_desc IS 'Indique la description du groupe supérieur du produit';
COMMENT ON COLUMN phenix.temporary_sales_group.tsg_prd_pgr_maj IS 'Indique le code du groupe majeur du produit';
COMMENT ON COLUMN phenix.temporary_sales_group.tsg_prd_pgr_maj_desc IS 'Indique la description du groupe majeur du produit';
COMMENT ON COLUMN phenix.temporary_sales_group.tsg_vend_telem_code IS 'Indique le code du vendeur ou télévendeur';
COMMENT ON COLUMN phenix.temporary_sales_group.tsg_vend_telem_name IS 'Indique le nom du vendeur ou télévendeur';
COMMENT ON COLUMN phenix.temporary_sales_group.tsg_cus_code IS 'Indique le code du client';
COMMENT ON COLUMN phenix.temporary_sales_group.tsg_sum_sale_price IS 'Indique la somme des ventes';
COMMENT ON COLUMN phenix.temporary_sales_group.tsg_sum_cost_price IS 'Indique la somme des coûtant';
COMMENT ON COLUMN phenix.temporary_sales_group.tsg_count_cust IS 'Indique le nombre de clients';