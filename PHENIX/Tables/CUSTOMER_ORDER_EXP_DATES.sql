CREATE TABLE phenix.customer_order_exp_dates (
  coe_id NUMBER(15) NOT NULL,
  coe_cot_cod_coh_id NUMBER(15) NOT NULL,
  coe_cot_cod_line_number NUMBER(4) NOT NULL,
  coe_cot_line_number NUMBER(7) NOT NULL,
  coe_expiration_date DATE NOT NULL,
  coe_quantity NUMBER(7) NOT NULL,
  CONSTRAINT coe_pk PRIMARY KEY (coe_id),
  CONSTRAINT coe_cot_fk FOREIGN KEY (coe_cot_cod_coh_id,coe_cot_cod_line_number,coe_cot_line_number) REFERENCES phenix.customer_order_transactions (cot_cod_coh_id,cot_cod_line_number,cot_line_number) ON DELETE CASCADE
);
COMMENT ON COLUMN phenix.customer_order_exp_dates.coe_id IS 'Indique l''indentifiant unique de la clé primaire';
COMMENT ON COLUMN phenix.customer_order_exp_dates.coe_cot_cod_coh_id IS 'Indique le numéro de la commande';
COMMENT ON COLUMN phenix.customer_order_exp_dates.coe_cot_cod_line_number IS 'Indique le numéro de ligne de la commande';
COMMENT ON COLUMN phenix.customer_order_exp_dates.coe_cot_line_number IS 'Indique le numéro de ligne de la transaction';
COMMENT ON COLUMN phenix.customer_order_exp_dates.coe_expiration_date IS 'Indique la date d''expiration';
COMMENT ON COLUMN phenix.customer_order_exp_dates.coe_quantity IS 'Indique le nombre d''items avec la date d''expiration';