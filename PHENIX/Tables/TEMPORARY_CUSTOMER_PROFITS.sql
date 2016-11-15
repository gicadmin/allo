CREATE GLOBAL TEMPORARY TABLE phenix.temporary_customer_profits (
  tcp_cus_code NUMBER(10),
  tcp_cus_name VARCHAR2(30 BYTE),
  tcp_cus_address VARCHAR2(45 BYTE),
  tcp_cus_city VARCHAR2(30 BYTE),
  tcp_cus_prv_resides_in_code VARCHAR2(2 BYTE),
  tcp_cus_postal_code VARCHAR2(10 BYTE),
  tcp_cus_bursary_amount NUMBER(7,2),
  tcp_cus_bursary_end_date DATE,
  tcp_cus_loan_interest_amount NUMBER(7,2),
  tcp_cus_loan_end_date DATE,
  tcp_use_code NUMBER(5),
  tcp_use_first_name VARCHAR2(30 BYTE),
  tcp_use_last_name VARCHAR2(30 BYTE),
  tcp_pgr_code NUMBER(5),
  tcp_pgr_description VARCHAR2(30 BYTE),
  tcp_vro_id NUMBER(15),
  tcp_amount_cost NUMBER,
  tcp_amount_cost_cumul NUMBER,
  tcp_amount_sales NUMBER,
  tcp_amount_sales_cumul NUMBER,
  tcp_amount_sales_for_year NUMBER,
  tcp_bursary_for_nb_days NUMBER,
  tcp_loan_interest_for_nb_days NUMBER,
  tcp_credit_amount_only NUMBER,
  tcp_vendor_agreement_amount NUMBER,
  tcp_volume_rebate_amount NUMBER,
  tcp_car_amount NUMBER,
  tcp_cus_minimum_profit_amount NUMBER(7,2),
  tcp_cus_minimum_profit_percent NUMBER(6,3),
  tcp_nb_of_deliveries NUMBER,
  tcp_sum_inh_delivery_charge NUMBER,
  tcp_cus_minimum_profit NUMBER,
  tcp_cus_transport_contribution NUMBER(7,2),
  tcp_sum_total_profit_percent NUMBER,
  tcp_offinv_vol_reb_amount NUMBER,
  tcp_transport_amount NUMBER,
  tcp_transport_fuel_amount NUMBER,
  tcp_visible_switch NUMBER(1) DEFAULT 1 NOT NULL,
  tcp_cus_str_code VARCHAR2(10 BYTE),
  tcp_nb_of_distinct_cus NUMBER(5),
  tcp_cus_ranking VARCHAR2(1 BYTE)
)
ON COMMIT PRESERVE ROWS;
COMMENT ON TABLE phenix.temporary_customer_profits IS 'Table temporaire permettant de noter les montants de ventes et coûtants par client';
COMMENT ON COLUMN phenix.temporary_customer_profits.tcp_cus_code IS 'Indique le code du client';
COMMENT ON COLUMN phenix.temporary_customer_profits.tcp_cus_name IS 'Indique le nom du client';
COMMENT ON COLUMN phenix.temporary_customer_profits.tcp_cus_address IS 'Indique l''adresse du client';
COMMENT ON COLUMN phenix.temporary_customer_profits.tcp_cus_city IS 'Indique la ville du client';
COMMENT ON COLUMN phenix.temporary_customer_profits.tcp_cus_prv_resides_in_code IS 'Indique la province du client';
COMMENT ON COLUMN phenix.temporary_customer_profits.tcp_cus_postal_code IS 'Indique le code postal du client';
COMMENT ON COLUMN phenix.temporary_customer_profits.tcp_cus_bursary_amount IS 'Indique le montant de subvention hebdomadaire à déduire des profits';
COMMENT ON COLUMN phenix.temporary_customer_profits.tcp_cus_bursary_end_date IS 'Indique la date de fin de la subvention';
COMMENT ON COLUMN phenix.temporary_customer_profits.tcp_cus_loan_interest_amount IS 'Indique le montant d''intérêt hebdomadaire du prêt';
COMMENT ON COLUMN phenix.temporary_customer_profits.tcp_cus_loan_end_date IS 'Indique la date de fin du prêt';
COMMENT ON COLUMN phenix.temporary_customer_profits.tcp_use_code IS 'Indique le code du télévendeur ou vendeur';
COMMENT ON COLUMN phenix.temporary_customer_profits.tcp_use_first_name IS 'Indique le prénom de l''utilisateur';
COMMENT ON COLUMN phenix.temporary_customer_profits.tcp_use_last_name IS 'Indique le nom de famille de l''utilisateur';
COMMENT ON COLUMN phenix.temporary_customer_profits.tcp_pgr_code IS 'Indique le code du groupe de produit';
COMMENT ON COLUMN phenix.temporary_customer_profits.tcp_pgr_description IS 'Indique la description du groupe de produit';
COMMENT ON COLUMN phenix.temporary_customer_profits.tcp_vro_id IS 'Indique le code de l''objectif atteint dans la grille de rabais volume';
COMMENT ON COLUMN phenix.temporary_customer_profits.tcp_amount_cost IS 'Indique le montant des coûtants du client';
COMMENT ON COLUMN phenix.temporary_customer_profits.tcp_amount_cost_cumul IS 'Indique le montant des coûtants du client transformé en année';
COMMENT ON COLUMN phenix.temporary_customer_profits.tcp_amount_sales IS 'Indique le montant de ventes du client';
COMMENT ON COLUMN phenix.temporary_customer_profits.tcp_amount_sales_cumul IS 'Indique le montant de ventes du client transformé en année';
COMMENT ON COLUMN phenix.temporary_customer_profits.tcp_amount_sales_for_year IS 'Indique le montant de ventes du client transformé en année';
COMMENT ON COLUMN phenix.temporary_customer_profits.tcp_bursary_for_nb_days IS 'Indique le montant de la subvention pour l''interval de jour donné';
COMMENT ON COLUMN phenix.temporary_customer_profits.tcp_loan_interest_for_nb_days IS 'Indique le montant du prêt pour l''interval de jour donné';
COMMENT ON COLUMN phenix.temporary_customer_profits.tcp_credit_amount_only IS 'Indique le montant de crédit seulement pour le client';
COMMENT ON COLUMN phenix.temporary_customer_profits.tcp_vendor_agreement_amount IS 'Indique le montant des ententes fournisseurs (ristournes) pour le client';
COMMENT ON COLUMN phenix.temporary_customer_profits.tcp_volume_rebate_amount IS 'Indique le montant des rabais volume (remises) pour le client';
COMMENT ON COLUMN phenix.temporary_customer_profits.tcp_car_amount IS 'Indique le montant des compteurs ("count and recount")';
COMMENT ON COLUMN phenix.temporary_customer_profits.tcp_cus_minimum_profit_amount IS 'Indique le montant minimum de profit voulu par livraison';
COMMENT ON COLUMN phenix.temporary_customer_profits.tcp_cus_minimum_profit_percent IS 'Indique le pourcentage minimum de profit voulu par livraison';
COMMENT ON COLUMN phenix.temporary_customer_profits.tcp_nb_of_deliveries IS 'Indique le nombre de livraisons effectués chez ce client';
COMMENT ON COLUMN phenix.temporary_customer_profits.tcp_sum_inh_delivery_charge IS 'Indique le total des frais de livraison chargés à ce client';
COMMENT ON COLUMN phenix.temporary_customer_profits.tcp_cus_minimum_profit IS 'Indique le profit minimum du client';
COMMENT ON COLUMN phenix.temporary_customer_profits.tcp_cus_transport_contribution IS 'Indique combien nous coute la livraison pour ce client (utilisé dans le rapport RAP_ANALYSE_PROFIT seulement)';
COMMENT ON COLUMN phenix.temporary_customer_profits.tcp_offinv_vol_reb_amount IS 'Indique le montant de rabais volume sur facture';
COMMENT ON COLUMN phenix.temporary_customer_profits.tcp_transport_amount IS 'Indique les revenus de transports générés pour livrer à ce client';
COMMENT ON COLUMN phenix.temporary_customer_profits.tcp_transport_fuel_amount IS 'Indique les frais de carburant facturés pour livrer à ce client';
COMMENT ON COLUMN phenix.temporary_customer_profits.tcp_visible_switch IS 'Indique si la ligne doit être visible dans le rapport';
COMMENT ON COLUMN phenix.temporary_customer_profits.tcp_cus_str_code IS 'Indique le code de regroupement tel qu''utilisé pour regrouper plusieurs clients en lien avec la profitabilité';
COMMENT ON COLUMN phenix.temporary_customer_profits.tcp_nb_of_distinct_cus IS 'Indique le nombre de client représentés par le client courant (même regroupement)';
COMMENT ON COLUMN phenix.temporary_customer_profits.tcp_cus_ranking IS 'Indique la classification du client';