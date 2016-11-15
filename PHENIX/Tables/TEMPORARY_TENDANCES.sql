CREATE GLOBAL TEMPORARY TABLE phenix.temporary_tendances (
  ttd_fca_year NUMBER(4),
  ttd_fca_period NUMBER(2),
  ttd_cus_code NUMBER(10),
  ttd_use_code NUMBER(5),
  ttd_use_first_name VARCHAR2(30 BYTE),
  ttd_use_last_name VARCHAR2(30 BYTE),
  ttd_pgr_code NUMBER(5),
  ttd_pgr_description VARCHAR2(30 BYTE),
  ttd_inh_cash_and_carry_switch NUMBER(1),
  ttd_amount_cost NUMBER,
  ttd_amount_sales NUMBER,
  ttd_bursary_for_nb_days NUMBER,
  ttd_loan_interest_for_nb_days NUMBER,
  ttd_car_amount NUMBER,
  ttd_nb_of_deliveries NUMBER,
  ttd_sum_inh_delivery_charge NUMBER,
  ttd_cus_transport_contribution NUMBER(7,2),
  ttd_cus_vrg_code NUMBER(3),
  ttd_offinv_vol_reb_amount NUMBER,
  ttd_transport_amount NUMBER
)
ON COMMIT PRESERVE ROWS;
COMMENT ON COLUMN phenix.temporary_tendances.ttd_offinv_vol_reb_amount IS 'Indique le montant de rabais volume sur facture';
COMMENT ON COLUMN phenix.temporary_tendances.ttd_transport_amount IS 'Indique les revenus de transport';