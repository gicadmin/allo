CREATE GLOBAL TEMPORARY TABLE phenix.temporary_customer_remittances (
  tcr_year NUMBER(4) NOT NULL,
  tcr_period NUMBER(2) NOT NULL,
  tcr_cus_code NUMBER(10) NOT NULL,
  tcr_cus_name VARCHAR2(30 BYTE),
  tcr_inh_id NUMBER(15),
  tcr_inh_invoice_date DATE,
  tcr_inh_type VARCHAR2(2 BYTE),
  tcr_cus_transport_alloc_perc NUMBER(6,3),
  tcr_cus_whs_vol_alloc_percent NUMBER(6,3),
  tcr_cus_drop_vol_alloc_percent NUMBER(6,3),
  tcr_cus_internal_admin_percent NUMBER(6,3),
  tcr_cus_addition_alloc_percent NUMBER(6,3),
  tcr_prd_code VARCHAR2(10 BYTE),
  tcr_prd_description VARCHAR2(45 BYTE),
  tcr_prd_ven_code NUMBER(5),
  tcr_ven_name VARCHAR2(30 BYTE),
  tcr_vcg_category_code VARCHAR2(2 BYTE),
  tcr_vcg_qualifier VARCHAR2(2 BYTE),
  tcr_vcg_quart_whs_avr_percent NUMBER(6,3),
  tcr_vcg_quart_whs_avr_amount NUMBER(7,2),
  tcr_sales_amount NUMBER(10,2),
  tcr_nb_items NUMBER(7),
  tcr_nb_killograms NUMBER(8,3),
  tcr_nb_livres NUMBER(8,3),
  tcr_nb_litters NUMBER(8,3),
  tcr_rem_transport NUMBER(7,2),
  tcr_ret_transport NUMBER(7,2),
  tcr_cm_inh_id NUMBER(15),
  tcr_rem_quart NUMBER(7,2),
  tcr_ret_quart NUMBER(7,2),
  tcr_quart_admin_cost NUMBER(7,2),
  tcr_rem_quart_drop NUMBER(7,2),
  tcr_ret_quart_drop NUMBER(7,2),
  tcr_rem_quart_terme_drop NUMBER(7,2),
  tcr_ret_quart_terme_drop NUMBER(7,2),
  tcr_admin_quart_drop_and_term NUMBER(7,2),
  tcr_cds_reference_number VARCHAR2(15 BYTE),
  tcr_vds_reference_number VARCHAR2(16 BYTE),
  tcr_ven_drop_terms NUMBER(6,3),
  tcr_ven_quart_drop_ship_avr NUMBER(6,3)
)
ON COMMIT PRESERVE ROWS;