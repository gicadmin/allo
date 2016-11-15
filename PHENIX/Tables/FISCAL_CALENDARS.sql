CREATE TABLE phenix.fiscal_calendars (
  fca_year NUMBER(4) NOT NULL,
  fca_period NUMBER(2) NOT NULL CONSTRAINT fca_period_ck CHECK (FCA_PERIOD IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13)),
  fca_start_date DATE NOT NULL,
  fca_end_date DATE NOT NULL,
  fca_exception_period_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT fca_exception_period_switch_ck CHECK (FCA_EXCEPTION_PERIOD_SWITCH IN (0, 1)),
  CONSTRAINT fca_pk PRIMARY KEY (fca_year,fca_period)
);
COMMENT ON TABLE phenix.fiscal_calendars IS 'Calendrier fiscal';
COMMENT ON COLUMN phenix.fiscal_calendars.fca_year IS 'Année du calendrier fiscale';
COMMENT ON COLUMN phenix.fiscal_calendars.fca_period IS 'Période fiscal du calendrier';
COMMENT ON COLUMN phenix.fiscal_calendars.fca_start_date IS 'Date de début';
COMMENT ON COLUMN phenix.fiscal_calendars.fca_end_date IS 'Date de fin';
COMMENT ON COLUMN phenix.fiscal_calendars.fca_exception_period_switch IS 'Indique si la période est une période étendue ou raccourcie contenant plus ou moins que 28 jours';