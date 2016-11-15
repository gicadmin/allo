CREATE TABLE phenix.dual_weeks (
  duw_week NUMBER(2) NOT NULL,
  CONSTRAINT duw_pk PRIMARY KEY (duw_week)
);
COMMENT ON TABLE phenix.dual_weeks IS 'Pour CAPS à éliminer éventullement - tony';