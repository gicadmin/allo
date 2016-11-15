CREATE TABLE phenix.customer_remittances (
  cur_id NUMBER(15) NOT NULL,
  cur_fca_year NUMBER(4) NOT NULL,
  cur_fca_period NUMBER(2) NOT NULL,
  cur_cus_code NUMBER(10) NOT NULL,
  cur_prd_code VARCHAR2(10 BYTE),
  cur_whs_delivery_code VARCHAR2(2 BYTE) NOT NULL,
  cur_dvn_code NUMBER(3) NOT NULL,
  cur_prog_distr_amount NUMBER(8,2) NOT NULL,
  cur_prog_distr_vol_amount NUMBER(8,2) NOT NULL,
  cur_quart_drop_amount NUMBER(8,2) NOT NULL,
  cur_quart_drop_vol_amount NUMBER(8,2) NOT NULL,
  cur_term_drop_amount NUMBER(8,2) NOT NULL,
  cur_term_drop_vol_amount NUMBER(8,2) NOT NULL,
  cur_quart_whouse_amount NUMBER(8,2) NOT NULL,
  cur_quart_whouse_vol_amount NUMBER(8,2) NOT NULL,
  cur_transport_amount NUMBER(8,2) NOT NULL,
  cur_transport_vol_amount NUMBER(8,2) NOT NULL,
  cur_prog_collected_amount NUMBER(8,2) NOT NULL,
  cur_growth_amount NUMBER(8,2) NOT NULL,
  cur_additional_amount NUMBER(8,2) NOT NULL,
  cur_internal_admin_cost NUMBER(8,2) NOT NULL,
  cur_inh_id NUMBER(15),
  cur_to_accpac_date DATE,
  cur_quart_inh_id NUMBER(15),
  CONSTRAINT cur_pk PRIMARY KEY (cur_id) USING INDEX (CREATE UNIQUE INDEX phenix.cur_pk_i ON phenix.customer_remittances(cur_id)    ),
  CONSTRAINT cur_uk UNIQUE (cur_fca_year,cur_fca_period,cur_cus_code,cur_prd_code,cur_whs_delivery_code,cur_dvn_code) USING INDEX (CREATE UNIQUE INDEX phenix.cur_uk_i ON phenix.customer_remittances(cur_fca_year,cur_fca_period,cur_cus_code,cur_prd_code,cur_whs_delivery_code,cur_dvn_code)    ),
  CONSTRAINT cur_cus_fk FOREIGN KEY (cur_cus_code) REFERENCES phenix.customers (cus_code),
  CONSTRAINT cur_dvn_fk FOREIGN KEY (cur_dvn_code) REFERENCES phenix.division_names (dvn_code),
  CONSTRAINT cur_fca_fk FOREIGN KEY (cur_fca_year,cur_fca_period) REFERENCES phenix.fiscal_calendars (fca_year,fca_period),
  CONSTRAINT cur_inh_fk FOREIGN KEY (cur_inh_id) REFERENCES phenix.invoice_headers (inh_id),
  CONSTRAINT cur_prd_fk FOREIGN KEY (cur_prd_code) REFERENCES phenix.products (prd_code),
  CONSTRAINT cur_quart_inh_fk FOREIGN KEY (cur_quart_inh_id) REFERENCES phenix.invoice_headers (inh_id),
  CONSTRAINT cur_whs_delivery_fk FOREIGN KEY (cur_whs_delivery_code) REFERENCES phenix.warehouses (whs_code)
);