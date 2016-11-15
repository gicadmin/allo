CREATE GLOBAL TEMPORARY TABLE phenix.temporary_weekly_cus_profits (
  twp_cus_code NUMBER(10),
  twp_fcd_fcw_fca_year NUMBER(4),
  twp_fcd_fcw_fca_period NUMBER(2),
  twp_fcd_fcw_week NUMBER(2),
  twp_cus_name VARCHAR2(30 BYTE),
  twp_cus_city VARCHAR2(30 BYTE),
  twp_cus_str_code VARCHAR2(10 BYTE),
  twp_cus_transport_contribution NUMBER(7,2),
  twp_cus_minimum_profit_amount NUMBER(7,2),
  twp_cus_minimum_profit_percent NUMBER(6,3),
  twp_telemark_use_code NUMBER(5),
  twp_telemark_use_first_name VARCHAR2(30 BYTE),
  twp_telemark_use_last_name VARCHAR2(30 BYTE),
  twp_use_code NUMBER(5),
  twp_use_first_name VARCHAR2(30 BYTE),
  twp_use_last_name VARCHAR2(30 BYTE),
  twp_inh_delivery_charge NUMBER,
  twp_nb_of_deliveries NUMBER,
  twp_wkly_transp_contrib_amount NUMBER,
  twp_wkly_bursary_amount NUMBER,
  twp_wkly_loan_interest NUMBER,
  twp_transport NUMBER,
  twp_not_drop_offinv_vol_reb NUMBER,
  twp_not_drop_amount_cost NUMBER,
  twp_not_drop_amount_sales NUMBER,
  twp_not_drop_profit_dollar NUMBER,
  twp_drop_amount_cost NUMBER,
  twp_drop_amount_sales NUMBER,
  twp_drop_profit_dollar NUMBER,
  twp_wkly_profit_dollar NUMBER,
  twp_wkly_profit_percent NUMBER,
  twp_nb_of_distinct_cus NUMBER,
  twp_profit_reached_switch NUMBER(1) DEFAULT 0 NOT NULL,
  twp_cus_ranking VARCHAR2(1 BYTE)
)
ON COMMIT PRESERVE ROWS;
COMMENT ON TABLE phenix.temporary_weekly_cus_profits IS 'Table temporaire utilisé pour RAP_PROFIT_SIX_WEEKS';
COMMENT ON COLUMN phenix.temporary_weekly_cus_profits.twp_cus_code IS 'Indique le code du client';
COMMENT ON COLUMN phenix.temporary_weekly_cus_profits.twp_fcd_fcw_fca_year IS 'Indique l''année fiscale concernée';
COMMENT ON COLUMN phenix.temporary_weekly_cus_profits.twp_fcd_fcw_fca_period IS 'Indique la période fiscale concernée';
COMMENT ON COLUMN phenix.temporary_weekly_cus_profits.twp_fcd_fcw_week IS 'Indique la semaine fiscale concernée';
COMMENT ON COLUMN phenix.temporary_weekly_cus_profits.twp_cus_name IS 'Indique le nom du client';
COMMENT ON COLUMN phenix.temporary_weekly_cus_profits.twp_cus_city IS 'Indique la ville du client';
COMMENT ON COLUMN phenix.temporary_weekly_cus_profits.twp_cus_str_code IS 'Indique le code de regroupement du client';
COMMENT ON COLUMN phenix.temporary_weekly_cus_profits.twp_cus_transport_contribution IS 'Indique la contribution de transport du client';
COMMENT ON COLUMN phenix.temporary_weekly_cus_profits.twp_cus_minimum_profit_amount IS 'Indique le montant minimum de profit exigé par livraison pour ce client';
COMMENT ON COLUMN phenix.temporary_weekly_cus_profits.twp_cus_minimum_profit_percent IS 'Indique le pourcentage minimum de profit exigé pour livrer ce client';
COMMENT ON COLUMN phenix.temporary_weekly_cus_profits.twp_telemark_use_code IS 'Indique le code du télévendeur';
COMMENT ON COLUMN phenix.temporary_weekly_cus_profits.twp_telemark_use_first_name IS 'Indique le prénom du télévendeur';
COMMENT ON COLUMN phenix.temporary_weekly_cus_profits.twp_telemark_use_last_name IS 'Indique le nom du télévendeur';
COMMENT ON COLUMN phenix.temporary_weekly_cus_profits.twp_use_code IS 'Indique le code du vendeur';
COMMENT ON COLUMN phenix.temporary_weekly_cus_profits.twp_use_first_name IS 'Indique le prénom du vendeur';
COMMENT ON COLUMN phenix.temporary_weekly_cus_profits.twp_use_last_name IS 'Indique le nom du vendeur';
COMMENT ON COLUMN phenix.temporary_weekly_cus_profits.twp_inh_delivery_charge IS 'Indique les frais de livraison chargé au client durant la semaine fiscale concernée';
COMMENT ON COLUMN phenix.temporary_weekly_cus_profits.twp_nb_of_deliveries IS 'Indique le nombre de livraison faites durant la semaine fiscale concernée';
COMMENT ON COLUMN phenix.temporary_weekly_cus_profits.twp_wkly_transp_contrib_amount IS 'Indique le montant auquel la contribution de transport devrait s''élever pour la semaine fiscale concernée';
COMMENT ON COLUMN phenix.temporary_weekly_cus_profits.twp_wkly_bursary_amount IS 'Indique le montant de la subvention pour la semaine fiscale concernée';
COMMENT ON COLUMN phenix.temporary_weekly_cus_profits.twp_wkly_loan_interest IS 'Indique le montant de prêt pour la semaine fiscale concernée';
COMMENT ON COLUMN phenix.temporary_weekly_cus_profits.twp_transport IS 'Indique le montant de transport facturé pour la semaine fiscale concernée';
COMMENT ON COLUMN phenix.temporary_weekly_cus_profits.twp_not_drop_offinv_vol_reb IS 'Indique le montant de rabais volume sur facture pour la semaine fiscale concernée';
COMMENT ON COLUMN phenix.temporary_weekly_cus_profits.twp_not_drop_amount_cost IS 'Indique le total de coûtant pour les ventes entrepôt pour la semaine fiscale concernée';
COMMENT ON COLUMN phenix.temporary_weekly_cus_profits.twp_not_drop_amount_sales IS 'Indique le total des ventes entrepôt pour la semaine fiscale concernée';
COMMENT ON COLUMN phenix.temporary_weekly_cus_profits.twp_not_drop_profit_dollar IS 'Indique le profit total des ventes entrepôt pour la semaine fiscale concernée';
COMMENT ON COLUMN phenix.temporary_weekly_cus_profits.twp_drop_amount_cost IS 'Indique le total de coûtant pour les ventes indirectes pour la semaine fiscale concernée';
COMMENT ON COLUMN phenix.temporary_weekly_cus_profits.twp_drop_amount_sales IS 'Indique le total des ventes indirectes pour la semaine fiscale concernée';
COMMENT ON COLUMN phenix.temporary_weekly_cus_profits.twp_drop_profit_dollar IS 'Indique le profit total des ventes indirectes pour la semaine fiscale concernée';
COMMENT ON COLUMN phenix.temporary_weekly_cus_profits.twp_wkly_profit_dollar IS 'Indique le profit total en dollars pour la semaine fiscale concernée';
COMMENT ON COLUMN phenix.temporary_weekly_cus_profits.twp_wkly_profit_percent IS 'Indique le pourcentage de profit pour la semaine fiscale concernée';
COMMENT ON COLUMN phenix.temporary_weekly_cus_profits.twp_nb_of_distinct_cus IS 'Indique le nombre de client représenté par ce regroupement (s''il y en a un)';
COMMENT ON COLUMN phenix.temporary_weekly_cus_profits.twp_profit_reached_switch IS 'Indique si le profit minimum (ou seuil) a été atteint par le client pour la semaine en cours';
COMMENT ON COLUMN phenix.temporary_weekly_cus_profits.twp_cus_ranking IS 'Indique la classification du client';