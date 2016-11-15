CREATE TABLE phenix.temp_counter_special_orders (
  tcs_id NUMBER(15) NOT NULL,
  tcs_coh_id NUMBER(15),
  tcs_special_cod_coh_id NUMBER(15),
  tcs_special_cod_line_number NUMBER(4),
  tcs_cod_prf_prd_code VARCHAR2(10 BYTE),
  tcs_cod_prf_fmt_code VARCHAR2(7 BYTE),
  tcs_cod_leftover_quantity NUMBER(7),
  tcs_cod_leftover_weight NUMBER(10,3),
  tcs_selected_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT tcs_selected_switch_ck CHECK (TCS_SELECTED_SWITCH IN (0,1)),
  CONSTRAINT tcs_pk PRIMARY KEY (tcs_id),
  CONSTRAINT tcs_cod_fk FOREIGN KEY (tcs_special_cod_coh_id,tcs_special_cod_line_number) REFERENCES phenix.customer_order_details (cod_coh_id,cod_line_number),
  CONSTRAINT tcs_coh_fk FOREIGN KEY (tcs_coh_id) REFERENCES phenix.customer_order_headers (coh_id),
  CONSTRAINT tcs_prf_fk FOREIGN KEY (tcs_cod_prf_prd_code,tcs_cod_prf_fmt_code) REFERENCES phenix.product_formats (prf_prd_code,prf_fmt_code)
);
COMMENT ON TABLE phenix.temp_counter_special_orders IS 'Table utilisée pour selectionner les commandes spéciales à fusionner à la commande comptoir ou quai à quai ';
COMMENT ON COLUMN phenix.temp_counter_special_orders.tcs_id IS 'Indique l''identifiant unique de la table';
COMMENT ON COLUMN phenix.temp_counter_special_orders.tcs_coh_id IS 'Indique le numéro de la commande client courante';
COMMENT ON COLUMN phenix.temp_counter_special_orders.tcs_special_cod_coh_id IS 'Indique le numéro de la commande spéciale';
COMMENT ON COLUMN phenix.temp_counter_special_orders.tcs_special_cod_line_number IS 'Indique la ligne de la commande spéciale';
COMMENT ON COLUMN phenix.temp_counter_special_orders.tcs_cod_prf_prd_code IS 'Indique le code de produit';
COMMENT ON COLUMN phenix.temp_counter_special_orders.tcs_cod_prf_fmt_code IS 'Indique le code de format du produit';
COMMENT ON COLUMN phenix.temp_counter_special_orders.tcs_cod_leftover_quantity IS 'Indique la quantité commandée';
COMMENT ON COLUMN phenix.temp_counter_special_orders.tcs_cod_leftover_weight IS 'Indique le poids commandé';
COMMENT ON COLUMN phenix.temp_counter_special_orders.tcs_selected_switch IS 'Indique si la ligne de la commande est choisie pour être fusionnée à la commande comptoir';