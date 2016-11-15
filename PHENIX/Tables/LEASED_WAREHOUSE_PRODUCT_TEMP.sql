CREATE TABLE phenix.leased_warehouse_product_temp (
  lwpt_client VARCHAR2(15 BYTE),
  lwpt_produit VARCHAR2(40 BYTE),
  lwpt_ref VARCHAR2(40 BYTE),
  lwpt_description VARCHAR2(100 BYTE),
  lwpt_groupe VARCHAR2(25 BYTE),
  lwpt_format VARCHAR2(40 BYTE),
  lwpt_unit VARCHAR2(25 BYTE),
  lwpt_reference_facture VARCHAR2(25 BYTE),
  lwpt_poids VARCHAR2(25 BYTE),
  lwpt_unite_mesure VARCHAR2(25 BYTE),
  lwpt_date_imported DATE
);
COMMENT ON TABLE phenix.leased_warehouse_product_temp IS 'Table temporaire contenant les produits d''un fournisseurs qui utilisent le service d''entreposage public';