CREATE GLOBAL TEMPORARY TABLE phenix.temporary_extract_purchase (
  txp_pug_code NUMBER(5) NOT NULL,
  txp_prd_code VARCHAR2(10 BYTE) NOT NULL,
  txp_prd_description VARCHAR2(45 BYTE) NOT NULL,
  txp_brandname VARCHAR2(15 BYTE) NOT NULL,
  txp_purchase_format VARCHAR2(7 BYTE),
  txp_prf_description VARCHAR2(30 BYTE) NOT NULL,
  txp_prf_upc_code VARCHAR2(30 BYTE),
  txp_invoiced_format VARCHAR2(7 BYTE),
  txp_prf_purchase_weight NUMBER(8,3) NOT NULL,
  txp_prd_ven_code NUMBER(5) NOT NULL,
  txp_vpd_code VARCHAR2(15 BYTE),
  txp_prv_code VARCHAR2(2 BYTE) NOT NULL,
  txp_prx_effective_date DATE,
  txp_prx_cost NUMBER(7,2),
  txp_pgp_base_cost NUMBER(7,2),
  txp_pgp_effective_date DATE,
  txp_ven_name VARCHAR2(30 BYTE) NOT NULL
)
ON COMMIT PRESERVE ROWS;
COMMENT ON TABLE phenix.temporary_extract_purchase IS 'Table utilisée pour la génération d''un fichier .CSV pour l''extraction des données Purchasing groups.';
COMMENT ON COLUMN phenix.temporary_extract_purchase.txp_pug_code IS 'Indique le code du regroupement d''achat.';
COMMENT ON COLUMN phenix.temporary_extract_purchase.txp_prd_code IS 'Indique le code du fournisseur.';
COMMENT ON COLUMN phenix.temporary_extract_purchase.txp_prd_description IS 'Indique la description du produit.';
COMMENT ON COLUMN phenix.temporary_extract_purchase.txp_brandname IS 'Indique la marque déposée.';
COMMENT ON COLUMN phenix.temporary_extract_purchase.txp_purchase_format IS 'Indique le format d''achat.';
COMMENT ON COLUMN phenix.temporary_extract_purchase.txp_prf_description IS 'Indique l''empaquetage du produit';
COMMENT ON COLUMN phenix.temporary_extract_purchase.txp_prf_upc_code IS 'Indique le code UPC du produit.';
COMMENT ON COLUMN phenix.temporary_extract_purchase.txp_invoiced_format IS 'Indique le format facturé.';
COMMENT ON COLUMN phenix.temporary_extract_purchase.txp_prf_purchase_weight IS 'Indique le poids d''achat.';
COMMENT ON COLUMN phenix.temporary_extract_purchase.txp_prd_ven_code IS 'Indique le manufacturier du produit';
COMMENT ON COLUMN phenix.temporary_extract_purchase.txp_vpd_code IS 'Indique le numéro du produit fornisseur.';
COMMENT ON COLUMN phenix.temporary_extract_purchase.txp_prv_code IS 'Indique la province du fournisseur.';
COMMENT ON COLUMN phenix.temporary_extract_purchase.txp_prx_effective_date IS 'Indique la date du prochain changement de prix.';
COMMENT ON COLUMN phenix.temporary_extract_purchase.txp_prx_cost IS 'Indique le coutant du prochain changement de prix.';
COMMENT ON COLUMN phenix.temporary_extract_purchase.txp_pgp_base_cost IS 'Indique le coutant du regroupement d''achat.';
COMMENT ON COLUMN phenix.temporary_extract_purchase.txp_pgp_effective_date IS 'Indique la date  effective.';
COMMENT ON COLUMN phenix.temporary_extract_purchase.txp_ven_name IS 'Indique le nomn du  fournisseur.';