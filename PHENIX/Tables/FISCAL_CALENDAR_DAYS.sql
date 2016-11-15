CREATE TABLE phenix.fiscal_calendar_days (
  fcd_date DATE NOT NULL,
  fcd_fcw_fca_year NUMBER(4) NOT NULL,
  fcd_fcw_fca_period NUMBER(2) NOT NULL,
  fcd_fcw_week NUMBER(2) NOT NULL,
  fcd_corresponding_vpc_pcy_day NUMBER(1) NOT NULL CONSTRAINT fcd_corresp_vpc_pcy_day_ck CHECK (FCD_CORRESPONDING_VPC_PCY_DAY IN (1,2,3,4,5,6,7)),
  fcd_corresponding_vpc_pcy_week NUMBER(1) NOT NULL CONSTRAINT fcd_corresp_vpc_pcy_week_ck CHECK (FCD_CORRESPONDING_VPC_PCY_WEEK IN (1,2,3,4)),
  fcd_holiday_switch NUMBER(1) DEFAULT 0,
  CONSTRAINT fcd_pk PRIMARY KEY (fcd_date),
  CONSTRAINT fcd_fcw_fk FOREIGN KEY (fcd_fcw_fca_year,fcd_fcw_fca_period,fcd_fcw_week) REFERENCES phenix.fiscal_calendar_weeks (fcw_fca_year,fcw_fca_period,fcw_week) ON DELETE CASCADE
);
COMMENT ON TABLE phenix.fiscal_calendar_days IS 'Table contenant tous les jours des années fiscales définies';
COMMENT ON COLUMN phenix.fiscal_calendar_days.fcd_date IS 'Indique la date de l''année';
COMMENT ON COLUMN phenix.fiscal_calendar_days.fcd_fcw_fca_year IS 'Indique l''année fiscale concernée';
COMMENT ON COLUMN phenix.fiscal_calendar_days.fcd_fcw_fca_period IS 'Indique la période de l''année fiscale concernée';
COMMENT ON COLUMN phenix.fiscal_calendar_days.fcd_fcw_week IS 'Indique la semaine de l''année fiscale concernée';
COMMENT ON COLUMN phenix.fiscal_calendar_days.fcd_corresponding_vpc_pcy_day IS 'Indique à quel jour du cycle d''achat des fournisseurs correspond la date en cours';
COMMENT ON COLUMN phenix.fiscal_calendar_days.fcd_corresponding_vpc_pcy_week IS 'Indique à quelle semaine du cycle d''achat des fournisseurs correspond la date en cours';
COMMENT ON COLUMN phenix.fiscal_calendar_days.fcd_holiday_switch IS 'Indique si la journée est fériée';