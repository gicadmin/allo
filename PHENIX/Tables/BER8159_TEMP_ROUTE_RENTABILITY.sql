CREATE TABLE phenix.ber8159_temp_route_rentability (
  trr_rou_code NUMBER(5),
  trr_rou_description VARCHAR2(30 BYTE),
  trr_rou_date DATE,
  trr_rod_position NUMBER(7,2),
  trr_rod_trk_code VARCHAR2(8 BYTE),
  trr_cus_code NUMBER(10),
  trr_cus_name VARCHAR2(30 BYTE),
  trr_cus_address VARCHAR2(45 BYTE),
  trr_cus_city VARCHAR2(30 BYTE),
  trr_inh_id NUMBER(15),
  trr_inh_cost_price_total NUMBER,
  trr_inh_sale_price_total NUMBER,
  trr_inh_delivery_charge NUMBER,
  trr_nb_package NUMBER,
  trr_nb_cigaretes NUMBER,
  trr_profit_amount NUMBER(10,2),
  trr_profit_percent NUMBER(6,3),
  trr_profit_by_package NUMBER,
  trr_nb_of_arret NUMBER,
  trr_pgr_report_nb_caisses NUMBER,
  trr_pgr_report_sales NUMBER,
  trr_pgr_report_costs NUMBER,
  trr_cus_prv_code VARCHAR2(2 BYTE),
  trr_cus_ranking VARCHAR2(1 BYTE),
  trr_cus_use_telemark_code NUMBER(5),
  trr_nb_ven_for_vtt NUMBER,
  trr_vtt_invoiced_fuel_amount NUMBER(7,2),
  trr_transport_profit NUMBER(7,2)
);