CREATE GLOBAL TEMPORARY TABLE phenix.temporary_shorted_cods (
  tsc_coh_cus_code NUMBER(10),
  tsc_coh_id NUMBER(15),
  tsc_cod_line_number NUMBER(4),
  tsc_cod_prf_prd_code VARCHAR2(10 BYTE),
  tsc_cod_prf_fmt_code VARCHAR2(7 BYTE),
  tsc_cod_selling_retail NUMBER(10,2),
  tsc_cod_pty_code NUMBER(3),
  tsc_cod_order_quantity NUMBER(10),
  tsc_cod_order_weight NUMBER(10,3),
  tsc_cod_shr_code NUMBER(3),
  tsc_prd_definition VARCHAR2(1 BYTE),
  tsc_prd_ven_code NUMBER(5),
  tsc_ven_name VARCHAR2(30 BYTE),
  tsc_ven_short_name VARCHAR2(15 BYTE),
  tsc_ven_use_code NUMBER(5),
  tsc_prd_brn_code NUMBER(5),
  tsc_prd_description VARCHAR2(45 BYTE),
  tsc_prf_description VARCHAR2(30 BYTE),
  tsc_prf_conversion_to_base NUMBER(8),
  tsc_cot_shorted_quantity NUMBER(10),
  tsc_cot_shorted_weight NUMBER(9,3),
  tsc_cot_invoice_quantity NUMBER(10),
  tsc_cot_invoice_weight NUMBER(9,3),
  tsc_prd_available NUMBER(10,3),
  tsc_pod_already_ordered NUMBER(10,3),
  tsc_pod_receipt_date DATE,
  tsc_inner_weight_in_inv_fmt NUMBER(8,3),
  tsc_prd_special_order_switch NUMBER(1),
  tsc_whs_code VARCHAR2(2 BYTE),
  tsc_pod_is_late_switch NUMBER(1),
  tsc_substitute_prd_code VARCHAR2(10 BYTE),
  tsc_substitute_prd_description VARCHAR2(45 BYTE),
  tsc_substitute_prf_description VARCHAR2(30 BYTE),
  tsc_substitute_brand_name VARCHAR2(30 BYTE),
  tsc_substitute_quantity NUMBER(7),
  tsc_substitute_weight NUMBER(8,3),
  tsc_order_quantity NUMBER(7),
  tsc_order_weight NUMBER(8,3)
)
ON COMMIT PRESERVE ROWS;
COMMENT ON TABLE phenix.temporary_shorted_cods IS 'Table temporaire utilisée par le rapport RAP_A_COURT_ACHETEUR';
COMMENT ON COLUMN phenix.temporary_shorted_cods.tsc_coh_cus_code IS 'Indique le code du client sur la commande';
COMMENT ON COLUMN phenix.temporary_shorted_cods.tsc_coh_id IS 'Indique le numéro (ID) de la commande';
COMMENT ON COLUMN phenix.temporary_shorted_cods.tsc_cod_line_number IS 'Indique le numéro de ligne de la commande';
COMMENT ON COLUMN phenix.temporary_shorted_cods.tsc_cod_prf_prd_code IS 'Indique le code produit de la commande';
COMMENT ON COLUMN phenix.temporary_shorted_cods.tsc_cod_prf_fmt_code IS 'Indique le format du produit de la commande';
COMMENT ON COLUMN phenix.temporary_shorted_cods.tsc_cod_selling_retail IS 'Indique le prix de vente';
COMMENT ON COLUMN phenix.temporary_shorted_cods.tsc_cod_pty_code IS 'Indique le type de promotion utilisée sur la commande';
COMMENT ON COLUMN phenix.temporary_shorted_cods.tsc_cod_order_quantity IS 'Indique la quantité commandée';
COMMENT ON COLUMN phenix.temporary_shorted_cods.tsc_cod_order_weight IS 'Indique le poids commandé';
COMMENT ON COLUMN phenix.temporary_shorted_cods.tsc_cod_shr_code IS 'Indique le code de raison du "à court"';
COMMENT ON COLUMN phenix.temporary_shorted_cods.tsc_prd_definition IS 'Indique la définition du produit (D = Dinde, S = Solide, F = Vrac, B = Bacon)';
COMMENT ON COLUMN phenix.temporary_shorted_cods.tsc_prd_ven_code IS 'Indique le code de manufacturier du produit';
COMMENT ON COLUMN phenix.temporary_shorted_cods.tsc_ven_name IS 'Indique le nom du fournisseur manufacturier du produit';
COMMENT ON COLUMN phenix.temporary_shorted_cods.tsc_ven_short_name IS 'Indique le nom court du fournisseur manufacturier du produit';
COMMENT ON COLUMN phenix.temporary_shorted_cods.tsc_ven_use_code IS 'Indique le code du réapprovisionneur du manufacturier du produit';
COMMENT ON COLUMN phenix.temporary_shorted_cods.tsc_prd_brn_code IS 'Indique le code de marque déposée du produit';
COMMENT ON COLUMN phenix.temporary_shorted_cods.tsc_prd_description IS 'Indique la description du produit';
COMMENT ON COLUMN phenix.temporary_shorted_cods.tsc_prf_description IS 'Indique l''empaquetage du produit format';
COMMENT ON COLUMN phenix.temporary_shorted_cods.tsc_prf_conversion_to_base IS 'Indique la conversion du produit format';
COMMENT ON COLUMN phenix.temporary_shorted_cods.tsc_cot_shorted_quantity IS 'Indique la quantité à court de la commande';
COMMENT ON COLUMN phenix.temporary_shorted_cods.tsc_cot_shorted_weight IS 'Indique le poids à court de la commande';
COMMENT ON COLUMN phenix.temporary_shorted_cods.tsc_cot_invoice_quantity IS 'Indique la quantité facturée de la commande';
COMMENT ON COLUMN phenix.temporary_shorted_cods.tsc_cot_invoice_weight IS 'Indique le poids facturé de la commande';
COMMENT ON COLUMN phenix.temporary_shorted_cods.tsc_prd_available IS 'Indique la quantité/poids disponible en entrepôt au moment du rapport';
COMMENT ON COLUMN phenix.temporary_shorted_cods.tsc_pod_already_ordered IS 'Indique la quantité/poids déjà commandé et en attente de réception chez des fournisseurs pour le produit en cours';
COMMENT ON COLUMN phenix.temporary_shorted_cods.tsc_pod_receipt_date IS 'Indique la date supposée de réception future (si TSC_POD_ALREADY_ORDERED est rempli) ou la date de la dernière réception (si TSC_POD_ALREADY_ORDERED est nul)';
COMMENT ON COLUMN phenix.temporary_shorted_cods.tsc_inner_weight_in_inv_fmt IS 'Indique le poids moyen du produit format (si Dinde ou Bacon seulement) déjà transformé selon le format d''inventaire pesé';
COMMENT ON COLUMN phenix.temporary_shorted_cods.tsc_prd_special_order_switch IS 'Indique si le produit est en commande spéciale';
COMMENT ON COLUMN phenix.temporary_shorted_cods.tsc_whs_code IS 'Indique le code de l''entrepôt';
COMMENT ON COLUMN phenix.temporary_shorted_cods.tsc_pod_is_late_switch IS 'Indique si une commande d''achat est en retard pour ce produit';
COMMENT ON COLUMN phenix.temporary_shorted_cods.tsc_substitute_prd_code IS 'Indique le code de produit de substitution';
COMMENT ON COLUMN phenix.temporary_shorted_cods.tsc_substitute_prd_description IS 'Indique la description du produit de substitution';
COMMENT ON COLUMN phenix.temporary_shorted_cods.tsc_substitute_prf_description IS 'Indique l''empaquetage du produit de substitution';
COMMENT ON COLUMN phenix.temporary_shorted_cods.tsc_substitute_brand_name IS 'Indique la marque de commerce du produit de sustitution';
COMMENT ON COLUMN phenix.temporary_shorted_cods.tsc_substitute_quantity IS 'Indique la quantité substituée';
COMMENT ON COLUMN phenix.temporary_shorted_cods.tsc_substitute_weight IS 'Indique le poids substitué';
COMMENT ON COLUMN phenix.temporary_shorted_cods.tsc_order_quantity IS 'Indique la quantité commandée';
COMMENT ON COLUMN phenix.temporary_shorted_cods.tsc_order_weight IS 'Indique le poids commandé';