CREATE TABLE phenix.stat_customer_invoices (
  sci_fcw_fca_year NUMBER(4) NOT NULL,
  sci_fcw_fca_period NUMBER(2) NOT NULL,
  sci_fcw_week NUMBER(2) NOT NULL,
  sci_cus_code NUMBER(10) NOT NULL,
  sci_prd_code VARCHAR2(10 BYTE) NOT NULL,
  sci_inh_cash_and_carry_switch NUMBER(1) NOT NULL,
  sci_sum_amount_credit_only NUMBER NOT NULL,
  sci_sum_amount_sales NUMBER NOT NULL,
  sci_sum_average_list NUMBER NOT NULL,
  sci_sum_average_cost_1 NUMBER NOT NULL,
  sci_sum_average_cost_2 NUMBER NOT NULL,
  sci_sum_average_cost_3 NUMBER NOT NULL,
  sci_sum_average_cost_4 NUMBER NOT NULL,
  sci_sum_avg_real_list NUMBER NOT NULL,
  sci_sum_avg_real_cost_1 NUMBER NOT NULL,
  sci_sum_avg_real_cost_2 NUMBER NOT NULL,
  sci_sum_avg_real_cost_3 NUMBER NOT NULL,
  sci_sum_avg_real_cost_4 NUMBER NOT NULL,
  sci_count_lines NUMBER NOT NULL,
  sci_sum_ven_agreement_amount NUMBER NOT NULL,
  sci_sum_car_amount NUMBER NOT NULL,
  sci_sum_weight NUMBER,
  sci_sum_quantity NUMBER,
  sci_whs_delivery_code VARCHAR2(2 BYTE) NOT NULL,
  sci_sum_cost_price NUMBER NOT NULL,
  sci_last_invoice_date DATE NOT NULL,
  sci_sum_royalty_amount NUMBER DEFAULT 0 NOT NULL,
  sci_sum_base_selling_cost NUMBER DEFAULT 0 NOT NULL,
  sci_sum_inventory_quantity NUMBER,
  CONSTRAINT sci_pk PRIMARY KEY (sci_fcw_fca_year,sci_fcw_fca_period,sci_fcw_week,sci_cus_code,sci_prd_code,sci_inh_cash_and_carry_switch,sci_whs_delivery_code)
);
COMMENT ON COLUMN phenix.stat_customer_invoices.sci_sum_quantity IS 'Indique la somme des quantités vendues, peu importe leur format';
COMMENT ON COLUMN phenix.stat_customer_invoices.sci_whs_delivery_code IS 'Indique l''entrepôt de livraison';
COMMENT ON COLUMN phenix.stat_customer_invoices.sci_sum_cost_price IS 'Indique la somme des coûtants facturés';
COMMENT ON COLUMN phenix.stat_customer_invoices.sci_last_invoice_date IS 'Indique la dernière date de facture pour l¿année/période/semaine/produit/client.';
COMMENT ON COLUMN phenix.stat_customer_invoices.sci_sum_royalty_amount IS 'Indique la somme des royautés.';
COMMENT ON COLUMN phenix.stat_customer_invoices.sci_sum_base_selling_cost IS 'Indique la somme des coûtants ajustés';
COMMENT ON COLUMN phenix.stat_customer_invoices.sci_sum_inventory_quantity IS 'Indique la somme des quantités vendues converties au format d''inventaire';