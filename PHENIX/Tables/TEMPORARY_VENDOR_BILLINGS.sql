CREATE TABLE phenix.temporary_vendor_billings (
  tvb_sid NUMBER,
  tvb_line_number NUMBER(10),
  tvb_vpd_code VARCHAR2(15 BYTE),
  tvb_prf_prd_code VARCHAR2(10 BYTE),
  tvb_prf_fmt_code VARCHAR2(7 BYTE),
  tvb_prd_ven_code NUMBER(5),
  tvb_prd_definition VARCHAR2(1 BYTE),
  tvb_vct_code VARCHAR2(2 BYTE),
  tvb_vct_pick_switch NUMBER(1),
  tvb_vct_damage_switch NUMBER(1),
  tvb_vct_price_source VARCHAR2(2 BYTE),
  tvb_vct_formats_allowed_switch NUMBER(1),
  tvb_mah_ap_invoice_number NUMBER(15),
  tvb_mad_line_number NUMBER(4),
  tvb_vbd_original_cost NUMBER(7,2),
  tvb_vbd_billed_retail NUMBER(7,2),
  tvb_vbd_requested_quantity NUMBER(7),
  tvb_vbd_requested_weight NUMBER(8,3),
  tvb_vbd_surcharge NUMBER(7,2),
  tvb_use_code NUMBER(5),
  tvb_creation_date DATE,
  tvb_prf_price NUMBER(7,2),
  tvb_prf_tobacco_tax NUMBER(11,6),
  tvb_vbh_id NUMBER(15),
  tvb_line_commited NUMBER(1),
  tvb_prf_whz_code VARCHAR2(2 BYTE),
  tvb_vbd_message VARCHAR2(100 BYTE),
  tvb_vbd_admin_amount NUMBER(7,2) DEFAULT 0 NOT NULL,
  tvb_whs_code VARCHAR2(2 BYTE),
  tvb_vbh_reference_number VARCHAR2(15 BYTE),
  tvb_vbh_message VARCHAR2(100 BYTE),
  tvb_vbh_order_date DATE,
  tvb_ven_payable_code NUMBER(5)
);
COMMENT ON COLUMN phenix.temporary_vendor_billings.tvb_sid IS 'Indique le no de session de l''utilisateur utilisant la table';
COMMENT ON COLUMN phenix.temporary_vendor_billings.tvb_line_number IS 'Indique le numéro de ligne';
COMMENT ON COLUMN phenix.temporary_vendor_billings.tvb_vpd_code IS 'Indique le code du produit fournisseur';
COMMENT ON COLUMN phenix.temporary_vendor_billings.tvb_prf_prd_code IS 'Indique le code de produit interne';
COMMENT ON COLUMN phenix.temporary_vendor_billings.tvb_prf_fmt_code IS 'Indique le format du produit choisi';
COMMENT ON COLUMN phenix.temporary_vendor_billings.tvb_prd_ven_code IS 'Indique le code du manufacturier du produit';
COMMENT ON COLUMN phenix.temporary_vendor_billings.tvb_prd_definition IS 'Indique le type du produit (S, B, D, F)';
COMMENT ON COLUMN phenix.temporary_vendor_billings.tvb_vct_code IS 'Indique le type de charge utilisé';
COMMENT ON COLUMN phenix.temporary_vendor_billings.tvb_vct_pick_switch IS 'Indique si la charge nécessite une cueillette';
COMMENT ON COLUMN phenix.temporary_vendor_billings.tvb_vct_damage_switch IS 'Indique si le type de charge concerne les marchandises endommagées';
COMMENT ON COLUMN phenix.temporary_vendor_billings.tvb_vct_price_source IS 'Indique la source du prix utilisé pour la charge';
COMMENT ON COLUMN phenix.temporary_vendor_billings.tvb_vct_formats_allowed_switch IS 'Indique si la charge permet d''utiliser différent format ou pas';
COMMENT ON COLUMN phenix.temporary_vendor_billings.tvb_mah_ap_invoice_number IS 'Indique si la charge est liée à une facture de commande d''achat';
COMMENT ON COLUMN phenix.temporary_vendor_billings.tvb_mad_line_number IS 'Indique la ligne de la facture de commande d''achat concernée (s''il y en a une)';
COMMENT ON COLUMN phenix.temporary_vendor_billings.tvb_vbd_original_cost IS 'Indique le coûtant original';
COMMENT ON COLUMN phenix.temporary_vendor_billings.tvb_vbd_billed_retail IS 'Indique le prix réclamé (montant de la charge)';
COMMENT ON COLUMN phenix.temporary_vendor_billings.tvb_vbd_requested_quantity IS 'Indique la quantité chargée au fournisseur';
COMMENT ON COLUMN phenix.temporary_vendor_billings.tvb_vbd_requested_weight IS 'Indique le poids chargé au fournisseur';
COMMENT ON COLUMN phenix.temporary_vendor_billings.tvb_vbd_surcharge IS 'Indique s''il y a une surcharge sur le format';
COMMENT ON COLUMN phenix.temporary_vendor_billings.tvb_use_code IS 'Indique le code de l''utilisateur ayant créé la charge';
COMMENT ON COLUMN phenix.temporary_vendor_billings.tvb_creation_date IS 'Indique la date de création de la charge dans la table temporaire';
COMMENT ON COLUMN phenix.temporary_vendor_billings.tvb_prf_price IS 'Indique le prix de vente du produit format sélectionné';
COMMENT ON COLUMN phenix.temporary_vendor_billings.tvb_prf_tobacco_tax IS 'Indique la taxe tabac du produit format sélectionné';
COMMENT ON COLUMN phenix.temporary_vendor_billings.tvb_vbh_id IS 'Indique le ID de la charge créée dans la vrai table du système';
COMMENT ON COLUMN phenix.temporary_vendor_billings.tvb_line_commited IS 'Indique si la ligne a été transférée en vrai charge et sauvegardée avec succès';
COMMENT ON COLUMN phenix.temporary_vendor_billings.tvb_prf_whz_code IS 'Code de la zone d''entreposage de ce produit format';
COMMENT ON COLUMN phenix.temporary_vendor_billings.tvb_vbd_message IS 'Indique le message du détail de la charge';
COMMENT ON COLUMN phenix.temporary_vendor_billings.tvb_vbd_admin_amount IS 'Indique le montant de frais d''administration sur les charges fournisseurs';
COMMENT ON COLUMN phenix.temporary_vendor_billings.tvb_whs_code IS 'Indique l''entrepôt de la charge fournisseur';
COMMENT ON COLUMN phenix.temporary_vendor_billings.tvb_vbh_reference_number IS 'Indique le numéro de référance de la charge fournisseur';
COMMENT ON COLUMN phenix.temporary_vendor_billings.tvb_vbh_message IS 'Indique le message reliée à la charge fournisseur';
COMMENT ON COLUMN phenix.temporary_vendor_billings.tvb_vbh_order_date IS 'Indique la date de la charge fournisseur';
COMMENT ON COLUMN phenix.temporary_vendor_billings.tvb_ven_payable_code IS 'Indique le code fournisseur à payer';