CREATE GLOBAL TEMPORARY TABLE phenix.temp_nb_tobacco_stats (
  tnb_ven_code NUMBER(5),
  tnb_ven_name VARCHAR2(30 BYTE),
  tnb_ven_prv_code VARCHAR2(2 BYTE),
  tnb_ven_enterprise_ident VARCHAR2(10 BYTE),
  tnb_mah_reference_number VARCHAR2(22 BYTE),
  tnb_stc_code VARCHAR2(6 BYTE),
  tnb_quantity_weight NUMBER(11,3),
  tnb_tax_amount NUMBER(11,3)
)
ON COMMIT PRESERVE ROWS;
COMMENT ON TABLE phenix.temp_nb_tobacco_stats IS 'Table temporaire utilisée pour la création du rapport RAP_DECLARATION_TABAC_NB';
COMMENT ON COLUMN phenix.temp_nb_tobacco_stats.tnb_ven_code IS 'Indique le code fournisseur.';
COMMENT ON COLUMN phenix.temp_nb_tobacco_stats.tnb_ven_name IS 'Indique le nom du fournisseur.';
COMMENT ON COLUMN phenix.temp_nb_tobacco_stats.tnb_ven_prv_code IS 'Indique le code de la province du fournisseur.';
COMMENT ON COLUMN phenix.temp_nb_tobacco_stats.tnb_ven_enterprise_ident IS 'Indique le numéro d''idenrification du forunisseur.';
COMMENT ON COLUMN phenix.temp_nb_tobacco_stats.tnb_mah_reference_number IS 'Indique le numéro de la facture.';
COMMENT ON COLUMN phenix.temp_nb_tobacco_stats.tnb_stc_code IS 'Indique le code de la catégorie tabac.';
COMMENT ON COLUMN phenix.temp_nb_tobacco_stats.tnb_quantity_weight IS 'Indique la somme des quantités ou du poids reliée au produit de la catégorie.';
COMMENT ON COLUMN phenix.temp_nb_tobacco_stats.tnb_tax_amount IS 'Indique le montant de la taxe pour la catégorie.';