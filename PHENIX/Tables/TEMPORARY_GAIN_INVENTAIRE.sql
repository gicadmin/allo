CREATE GLOBAL TEMPORARY TABLE phenix.temporary_gain_inventaire (
  tgi_prd_ven_code NUMBER(10),
  tgi_ven_name VARCHAR2(30 BYTE),
  tgi_ven_alt_name VARCHAR2(30 BYTE),
  tgi_ven_use_code NUMBER(5),
  tgi_prd_code VARCHAR2(10 BYTE),
  tgi_prd_special_order_switch NUMBER(1),
  tgi_prd_description VARCHAR2(45 BYTE),
  tgi_prd_alt_description VARCHAR2(45 BYTE),
  tgi_prf_description VARCHAR2(30 BYTE),
  tgi_prw_shr_code NUMBER(3),
  tgi_vpd_prf_fmt_code VARCHAR2(7 BYTE),
  tgi_fmt_inventory VARCHAR2(7 BYTE),
  tgi_ancien_prix NUMBER(11,6),
  tgi_nouveau_prix NUMBER(11,6),
  tgi_prd_invoiced_by_weight NUMBER(1),
  tgi_conversion NUMBER(4,2),
  tgi_ecart_doll NUMBER(15,2),
  tgi_ecart_perc NUMBER(11,3),
  tgi_qty_inventory NUMBER(10,3),
  tgi_qty_commande NUMBER(10,3),
  tgi_qty_cus_order NUMBER(10,3),
  tgi_qty_prebook_cus NUMBER(10,3),
  tgi_qty_ven_prebook NUMBER(10,3),
  tgi_gain_inv NUMBER(15,3),
  tgi_gain_po NUMBER(15,3),
  tgi_gain_vend_prebook NUMBER(15,3),
  tgi_gain_cus_order NUMBER(15,3),
  tgi_gain_cus_preb_order NUMBER(15,3),
  tgi_gain_inv_total NUMBER(15,3)
)
ON COMMIT PRESERVE ROWS;
COMMENT ON COLUMN phenix.temporary_gain_inventaire.tgi_prd_ven_code IS 'Indique le code du fournisseur ';
COMMENT ON COLUMN phenix.temporary_gain_inventaire.tgi_ven_name IS 'Indique le nom du fournisseur ';
COMMENT ON COLUMN phenix.temporary_gain_inventaire.tgi_ven_alt_name IS 'Indique le nom alternatif du fournisseur ';
COMMENT ON COLUMN phenix.temporary_gain_inventaire.tgi_ven_use_code IS 'Indique le code del''acheteur';
COMMENT ON COLUMN phenix.temporary_gain_inventaire.tgi_prd_code IS 'Indique le code du produit ';
COMMENT ON COLUMN phenix.temporary_gain_inventaire.tgi_prd_special_order_switch IS 'Indique si le produit est en commande sp¿cial ';
COMMENT ON COLUMN phenix.temporary_gain_inventaire.tgi_prd_description IS 'Indique la description du produit ';
COMMENT ON COLUMN phenix.temporary_gain_inventaire.tgi_prd_alt_description IS 'Indique la description alternative du produit ';
COMMENT ON COLUMN phenix.temporary_gain_inventaire.tgi_prf_description IS 'Indique l''empaquetage ';
COMMENT ON COLUMN phenix.temporary_gain_inventaire.tgi_prw_shr_code IS 'Indique le code de la raison "à court" ';
COMMENT ON COLUMN phenix.temporary_gain_inventaire.tgi_vpd_prf_fmt_code IS 'Indique le format d'' achat du manufacturier ';
COMMENT ON COLUMN phenix.temporary_gain_inventaire.tgi_fmt_inventory IS 'Indique le format d''inventaire ';
COMMENT ON COLUMN phenix.temporary_gain_inventaire.tgi_ancien_prix IS 'Indique l''ancien prix ';
COMMENT ON COLUMN phenix.temporary_gain_inventaire.tgi_nouveau_prix IS 'Indique le nouveau prix ';
COMMENT ON COLUMN phenix.temporary_gain_inventaire.tgi_prd_invoiced_by_weight IS 'Indique si le produit est facturé au poids ';
COMMENT ON COLUMN phenix.temporary_gain_inventaire.tgi_conversion IS 'Indique le facteur de conversion du format d''inventaire au format d''achat du manufacturier ';
COMMENT ON COLUMN phenix.temporary_gain_inventaire.tgi_ecart_doll IS 'Indique l''écart entre le nouveau prix et l''ancien prix (en dollars) ';
COMMENT ON COLUMN phenix.temporary_gain_inventaire.tgi_ecart_perc IS 'Indique l''écart entre le nouveau prix et l''ancien prix (en pourcentage) ';
COMMENT ON COLUMN phenix.temporary_gain_inventaire.tgi_qty_inventory IS 'Indique la quantité en inventaire(disponible) ';
COMMENT ON COLUMN phenix.temporary_gain_inventaire.tgi_qty_commande IS 'Indique la quantité en commande d''achat ';
COMMENT ON COLUMN phenix.temporary_gain_inventaire.tgi_qty_cus_order IS 'Indique la quantité en commande client ';
COMMENT ON COLUMN phenix.temporary_gain_inventaire.tgi_qty_prebook_cus IS 'Indique la quantité en commande bulletin client  ';
COMMENT ON COLUMN phenix.temporary_gain_inventaire.tgi_qty_ven_prebook IS 'Indique la quantité en commande bulletin fournisseur  ';
COMMENT ON COLUMN phenix.temporary_gain_inventaire.tgi_gain_inv IS 'Indique le gain de l''inventaire  ';
COMMENT ON COLUMN phenix.temporary_gain_inventaire.tgi_gain_po IS 'Indique le gain des commandes d''achat   ';
COMMENT ON COLUMN phenix.temporary_gain_inventaire.tgi_gain_vend_prebook IS 'Indique le gain des commande bulletin fournisseur  ';
COMMENT ON COLUMN phenix.temporary_gain_inventaire.tgi_gain_cus_order IS 'Indique le gain des ommande client  ';
COMMENT ON COLUMN phenix.temporary_gain_inventaire.tgi_gain_cus_preb_order IS 'Indique le gain des commandes  bulletin client  ';
COMMENT ON COLUMN phenix.temporary_gain_inventaire.tgi_gain_inv_total IS 'Indique le gain total  ';