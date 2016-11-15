CREATE TABLE phenix.vendor_histories (
  venh_ven_code NUMBER(10) NOT NULL,
  venh_start_date DATE NOT NULL,
  venh_end_date DATE NOT NULL,
  venh_ven_ven_association_code NUMBER(5),
  venh_ven_drop_terms_percent NUMBER(6,3) NOT NULL,
  venh_ven_drop_warehouse_flag VARCHAR2(1 BYTE) DEFAULT 'W' NOT NULL CONSTRAINT venh_ven_drop_warehouse_fla_ck CHECK (VENH_VEN_DROP_WAREHOUSE_FLAG IN ('B','D','W')),
  venh_ven_quart_drop_avr_perc NUMBER(6,3) NOT NULL,
  venh_ven_collected_avr_percent NUMBER(6,3) NOT NULL,
  venh_ven_distributed_avr_perc NUMBER(6,3) NOT NULL,
  venh_ven_dvn_code NUMBER(3) NOT NULL,
  CONSTRAINT venh_pk PRIMARY KEY (venh_ven_code,venh_start_date,venh_end_date),
  CONSTRAINT venh_ven_fk FOREIGN KEY (venh_ven_code) REFERENCES phenix.vendors (ven_code) ON DELETE CASCADE
);
COMMENT ON TABLE phenix.vendor_histories IS 'Table des historiques';
COMMENT ON COLUMN phenix.vendor_histories.venh_ven_code IS 'Indique le code du fournisseur';
COMMENT ON COLUMN phenix.vendor_histories.venh_start_date IS 'Indique la date debut';
COMMENT ON COLUMN phenix.vendor_histories.venh_end_date IS 'Indique la date fin';
COMMENT ON COLUMN phenix.vendor_histories.venh_ven_ven_association_code IS 'identifie le programme d''association';
COMMENT ON COLUMN phenix.vendor_histories.venh_ven_drop_terms_percent IS 'indique le pourcentage de rabais volume trimestriel sur les drops';
COMMENT ON COLUMN phenix.vendor_histories.venh_ven_drop_warehouse_flag IS 'indique si le fournisseur fait des livraisons directe ou indirecte ou les deux';
COMMENT ON COLUMN phenix.vendor_histories.venh_ven_quart_drop_avr_perc IS 'indique le pourcentage de rabais volume trimestriel sur les drops';
COMMENT ON COLUMN phenix.vendor_histories.venh_ven_collected_avr_percent IS 'indique le pourcentage de rabais volume réclamé par le fournisseur';
COMMENT ON COLUMN phenix.vendor_histories.venh_ven_distributed_avr_perc IS 'indique le pourcentage de rabais volume réclamé au fournisseur';
COMMENT ON COLUMN phenix.vendor_histories.venh_ven_dvn_code IS 'indique le code de la division';