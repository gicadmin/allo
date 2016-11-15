CREATE GLOBAL TEMPORARY TABLE phenix.temporary_tendance_groups (
  ttg_ligne NUMBER,
  ttg_use_code NUMBER(10),
  ttg_use_name VARCHAR2(80 BYTE),
  ttg_periode NUMBER(2),
  ttg_annee NUMBER(4),
  ttg_pgr_code NUMBER,
  ttg_pgr_description VARCHAR2(80 BYTE),
  ttg_vente_percent NUMBER,
  ttg_vente_dollar NUMBER,
  ttg_coutant_dollar NUMBER,
  ttg_profit_percent NUMBER,
  ttg_profit_dollar NUMBER
)
ON COMMIT PRESERVE ROWS;
COMMENT ON TABLE phenix.temporary_tendance_groups IS 'Table temporaire permettant de noter les montants de ventes et coutants par  vendeur';
COMMENT ON COLUMN phenix.temporary_tendance_groups.ttg_ligne IS 'Indique le type de la ligne (0 groupe produit , 1 : sous total , 2 : payer et emporter)';
COMMENT ON COLUMN phenix.temporary_tendance_groups.ttg_use_code IS 'Indique le code du vendeur';
COMMENT ON COLUMN phenix.temporary_tendance_groups.ttg_use_name IS 'Indique le nom du télévendeur ou vendeur';
COMMENT ON COLUMN phenix.temporary_tendance_groups.ttg_periode IS 'Indique la periode fiscale';
COMMENT ON COLUMN phenix.temporary_tendance_groups.ttg_annee IS 'Indique l''année fiscale';
COMMENT ON COLUMN phenix.temporary_tendance_groups.ttg_pgr_code IS 'Indique le code  du groupe de produit';
COMMENT ON COLUMN phenix.temporary_tendance_groups.ttg_pgr_description IS 'Indique la description  du groupe de produit';
COMMENT ON COLUMN phenix.temporary_tendance_groups.ttg_vente_percent IS 'Indique le pourcentage de vente d''un groupe de produit ';
COMMENT ON COLUMN phenix.temporary_tendance_groups.ttg_vente_dollar IS 'Indique le montant du vente d''un groupe de produit ';
COMMENT ON COLUMN phenix.temporary_tendance_groups.ttg_coutant_dollar IS 'Indique le coutant du vente d ''un groupe de produit ';
COMMENT ON COLUMN phenix.temporary_tendance_groups.ttg_profit_percent IS 'Indique le pourcentage de profit du vente d''un groupe de produit ';
COMMENT ON COLUMN phenix.temporary_tendance_groups.ttg_profit_dollar IS 'Indique le profit du vente d''un groupe de produit ';