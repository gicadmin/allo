CREATE TABLE phenix.fiscal_calendar_weeks (
  fcw_fca_year NUMBER(4) NOT NULL,
  fcw_fca_period NUMBER(2) NOT NULL,
  fcw_week NUMBER(2) NOT NULL,
  fcw_start_date DATE NOT NULL,
  fcw_end_date DATE NOT NULL,
  fcw_week_of_year NUMBER(2) NOT NULL,
  fcw_exception_week_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT fcw_exception_week_switch_ck CHECK (FCW_EXCEPTION_WEEK_SWITCH IN (0, 1)),
  CONSTRAINT fcw_pk PRIMARY KEY (fcw_fca_year,fcw_fca_period,fcw_week),
  CONSTRAINT fcw_fca_fk FOREIGN KEY (fcw_fca_year,fcw_fca_period) REFERENCES phenix.fiscal_calendars (fca_year,fca_period) ON DELETE CASCADE
);
COMMENT ON TABLE phenix.fiscal_calendar_weeks IS 'Table permettant de définir les semaines du calendrier fiscal';
COMMENT ON COLUMN phenix.fiscal_calendar_weeks.fcw_fca_year IS 'Indique l''année du calendrier fiscal';
COMMENT ON COLUMN phenix.fiscal_calendar_weeks.fcw_fca_period IS 'Indique la période du calendrier fiscal';
COMMENT ON COLUMN phenix.fiscal_calendar_weeks.fcw_week IS 'Indique la semaine du calendrier fiscal';
COMMENT ON COLUMN phenix.fiscal_calendar_weeks.fcw_start_date IS 'Indique la date de début de la semaine du calendrier fiscal';
COMMENT ON COLUMN phenix.fiscal_calendar_weeks.fcw_end_date IS 'Indique la date de fin de la semaine du calendrier fiscal';
COMMENT ON COLUMN phenix.fiscal_calendar_weeks.fcw_week_of_year IS 'Indique la semaine de l''année du calendrier fiscal';
COMMENT ON COLUMN phenix.fiscal_calendar_weeks.fcw_exception_week_switch IS 'Indique si la semaine est une semaine de plus ou de moins de 7 jours';