CREATE GLOBAL TEMPORARY TABLE phenix.temporary_tendance_profits (
  ttp_use_code NUMBER(10),
  ttp_use_name VARCHAR2(80 BYTE),
  ttp_periode NUMBER(2),
  ttp_year NUMBER(4),
  ttp_entrepot NUMBER,
  ttp_profit_dollar NUMBER,
  ttp_profit_percent NUMBER,
  ttp_coutant_livraison NUMBER,
  ttp_coutant_livraison_percent NUMBER,
  ttp_subvention NUMBER,
  ttp_prof_tot_entrepot_dollar NUMBER,
  ttp_prof_tot_entrepot_percent NUMBER,
  ttp_livraison_indirect NUMBER,
  ttp_profit_tot_percent NUMBER,
  ttp_pret NUMBER,
  ttp_vente_total NUMBER,
  ttp_profit_total_dollar NUMBER,
  ttp_profit_total_percent NUMBER,
  ttp_notdrop_coutantlivr NUMBER,
  ttp_sum_drop_amount_sales NUMBER,
  ttp_sum_drop_amount_cost NUMBER,
  ttp_offinv_vol_reb_amount NUMBER,
  ttp_transport_amount NUMBER,
  ttp_delivery_charge NUMBER
)
ON COMMIT PRESERVE ROWS;
COMMENT ON TABLE phenix.temporary_tendance_profits IS 'Table temporaire permettant de noter les montants de ventes et coûtants par période - vendeur';
COMMENT ON COLUMN phenix.temporary_tendance_profits.ttp_use_code IS 'Indique le code du télévendeur ou vendeur';
COMMENT ON COLUMN phenix.temporary_tendance_profits.ttp_use_name IS 'Indique le nom du télévendeur ou vendeur';
COMMENT ON COLUMN phenix.temporary_tendance_profits.ttp_periode IS 'Indique la période fiscale';
COMMENT ON COLUMN phenix.temporary_tendance_profits.ttp_year IS 'Indique l''année fiscale';
COMMENT ON COLUMN phenix.temporary_tendance_profits.ttp_entrepot IS 'Indique le montant de vente en dollar';
COMMENT ON COLUMN phenix.temporary_tendance_profits.ttp_profit_dollar IS 'Indique le profit de vente en dollar';
COMMENT ON COLUMN phenix.temporary_tendance_profits.ttp_profit_percent IS 'Indique le profit de vente en pourcentage';
COMMENT ON COLUMN phenix.temporary_tendance_profits.ttp_coutant_livraison IS 'Indique le coûtant de livraison en dollar';
COMMENT ON COLUMN phenix.temporary_tendance_profits.ttp_coutant_livraison_percent IS 'Indique le coûtant de livraison en pourcentage';
COMMENT ON COLUMN phenix.temporary_tendance_profits.ttp_subvention IS 'Indique le montant de subvention';
COMMENT ON COLUMN phenix.temporary_tendance_profits.ttp_prof_tot_entrepot_dollar IS 'Indique le montant du profit total d''entrepôt en dollar';
COMMENT ON COLUMN phenix.temporary_tendance_profits.ttp_prof_tot_entrepot_percent IS 'Indique le montant du profit total d''entrepôt en pourcentage';
COMMENT ON COLUMN phenix.temporary_tendance_profits.ttp_livraison_indirect IS 'Indique le montant qui correspond à la livraison indirecte';
COMMENT ON COLUMN phenix.temporary_tendance_profits.ttp_profit_tot_percent IS 'Indique le profit total';
COMMENT ON COLUMN phenix.temporary_tendance_profits.ttp_pret IS 'Indique le prêt en dollar';
COMMENT ON COLUMN phenix.temporary_tendance_profits.ttp_vente_total IS 'Indique le montant de vente total en dollar';
COMMENT ON COLUMN phenix.temporary_tendance_profits.ttp_profit_total_dollar IS 'Indique le profit total en dollar';
COMMENT ON COLUMN phenix.temporary_tendance_profits.ttp_profit_total_percent IS 'Indique le profit total en pourcentage';
COMMENT ON COLUMN phenix.temporary_tendance_profits.ttp_notdrop_coutantlivr IS 'Indique le coutant de livraison pour les commandes régulières (pas indirectes)';
COMMENT ON COLUMN phenix.temporary_tendance_profits.ttp_sum_drop_amount_sales IS 'Indique la somme des ventes pour les factures de la période de type indirectes';
COMMENT ON COLUMN phenix.temporary_tendance_profits.ttp_sum_drop_amount_cost IS 'Indique la somme des coûts pour les factures de la période de type drop ';
COMMENT ON COLUMN phenix.temporary_tendance_profits.ttp_offinv_vol_reb_amount IS 'Indique le montant de rabais volume sur facture';
COMMENT ON COLUMN phenix.temporary_tendance_profits.ttp_transport_amount IS 'Indique les revenus de transport';
COMMENT ON COLUMN phenix.temporary_tendance_profits.ttp_delivery_charge IS 'Indique le coûtant de livraison';