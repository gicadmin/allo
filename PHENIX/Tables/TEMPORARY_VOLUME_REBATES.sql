CREATE GLOBAL TEMPORARY TABLE phenix.temporary_volume_rebates (
  tvr_pgr_code NUMBER(5),
  tvr_ven_code NUMBER(5),
  tvr_cus_code NUMBER(10),
  tvr_sales_amount NUMBER(10,2),
  tvr_quantity_weight NUMBER(10,3),
  tvr_vro_id NUMBER(15),
  tvr_vre_id NUMBER(15),
  tvr_royalty_amount NUMBER(10,2),
  tvr_prd_ven_code NUMBER(5)
)
ON COMMIT PRESERVE ROWS;
COMMENT ON TABLE phenix.temporary_volume_rebates IS 'Table utilisée pour le rapport des rabais volume ';
COMMENT ON COLUMN phenix.temporary_volume_rebates.tvr_pgr_code IS 'Indique le code du groupe de produit';
COMMENT ON COLUMN phenix.temporary_volume_rebates.tvr_ven_code IS 'Indique le code fournisseur';
COMMENT ON COLUMN phenix.temporary_volume_rebates.tvr_cus_code IS 'Indique le code du client';
COMMENT ON COLUMN phenix.temporary_volume_rebates.tvr_sales_amount IS 'Indique le montant des ventes total par groupe ';
COMMENT ON COLUMN phenix.temporary_volume_rebates.tvr_quantity_weight IS 'Indique la quantité totale par groupe ';
COMMENT ON COLUMN phenix.temporary_volume_rebates.tvr_vro_id IS 'Indique l''identifiant de l''échelle à atteindre pour avoir l''escompte';
COMMENT ON COLUMN phenix.temporary_volume_rebates.tvr_vre_id IS 'Indique l''identifiant du groupe de produit ou fournisseur spécifique';
COMMENT ON COLUMN phenix.temporary_volume_rebates.tvr_royalty_amount IS 'Indique le montant des royautés total par groupe';
COMMENT ON COLUMN phenix.temporary_volume_rebates.tvr_prd_ven_code IS 'Indique le code manufacturier du produit';