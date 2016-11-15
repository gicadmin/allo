CREATE TABLE phenix.customer_profile_weeks (
  cpw_cpf_cus_code NUMBER(10) NOT NULL,
  cpw_cpf_prf_prd_code VARCHAR2(10 BYTE) NOT NULL,
  cpw_cpf_prf_fmt_code VARCHAR2(7 BYTE) NOT NULL,
  cpw_fcw_fca_year NUMBER(4) NOT NULL,
  cpw_fcw_fca_period NUMBER(2) NOT NULL,
  cpw_fcw_week NUMBER(2) NOT NULL,
  cpw_quantity NUMBER(10,3) NOT NULL,
  CONSTRAINT cpw_pk PRIMARY KEY (cpw_cpf_cus_code,cpw_cpf_prf_prd_code,cpw_cpf_prf_fmt_code,cpw_fcw_fca_year,cpw_fcw_fca_period,cpw_fcw_week),
  CONSTRAINT cpw_cpf_fk FOREIGN KEY (cpw_cpf_cus_code,cpw_cpf_prf_prd_code,cpw_cpf_prf_fmt_code) REFERENCES phenix.customer_profiles (cpf_cus_code,cpf_prf_prd_code,cpf_prf_fmt_code) ON DELETE CASCADE,
  CONSTRAINT cpw_fcw_fk FOREIGN KEY (cpw_fcw_fca_year,cpw_fcw_fca_period,cpw_fcw_week) REFERENCES phenix.fiscal_calendar_weeks (fcw_fca_year,fcw_fca_period,fcw_week)
);
COMMENT ON TABLE phenix.customer_profile_weeks IS 'Table pour les statistiques de ventes des produits format pour les profils client';
COMMENT ON COLUMN phenix.customer_profile_weeks.cpw_cpf_cus_code IS 'Indique le code du client';
COMMENT ON COLUMN phenix.customer_profile_weeks.cpw_cpf_prf_prd_code IS 'Indique le code du produit';
COMMENT ON COLUMN phenix.customer_profile_weeks.cpw_cpf_prf_fmt_code IS 'Indique le code du format';
COMMENT ON COLUMN phenix.customer_profile_weeks.cpw_fcw_fca_year IS 'Indique l''année fiscale';
COMMENT ON COLUMN phenix.customer_profile_weeks.cpw_fcw_fca_period IS 'Indique la période fiscale';
COMMENT ON COLUMN phenix.customer_profile_weeks.cpw_fcw_week IS 'Indique la semaine fiscale';
COMMENT ON COLUMN phenix.customer_profile_weeks.cpw_quantity IS 'Indique la quantité/le poids des ventes';