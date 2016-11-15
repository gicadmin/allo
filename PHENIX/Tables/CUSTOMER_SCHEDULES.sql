CREATE TABLE phenix.customer_schedules (
  csd_id NUMBER(15) NOT NULL,
  csd_cus_code NUMBER(10) NOT NULL,
  csd_ordered_switch NUMBER(1) NOT NULL CONSTRAINT csd_ordered_switch_ck CHECK (CSD_ORDERED_SWITCH IN (0, 1)),
  csd_processed_switch NUMBER(1) NOT NULL CONSTRAINT csd_processed_switch_ck CHECK (CSD_PROCESSED_SWITCH IN (0, 1)),
  csd_hour NUMBER(2) CONSTRAINT csd_hour_ck CHECK (CSD_HOUR
IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18,
19, 20, 21, 22, 23, 0)),
  csd_minute NUMBER(2) CONSTRAINT csd_minute_ck CHECK (CSD_MINUTE
IN (0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18,
19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35,
36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52,
53, 54, 55, 56, 57, 58, 59)),
  csd_position NUMBER(3),
  csd_outgoing_call_switch NUMBER(1) NOT NULL CONSTRAINT csd_outgoing_call_switch_ck CHECK (CSD_OUTGOING_CALL_SWITCH IN (0, 1)),
  csd_sch_code NUMBER(6) NOT NULL,
  csd_notes VARCHAR2(100 BYTE),
  CONSTRAINT csd_pk PRIMARY KEY (csd_id),
  CONSTRAINT csd_cus_fk FOREIGN KEY (csd_cus_code) REFERENCES phenix.customers (cus_code) ON DELETE CASCADE,
  CONSTRAINT csd_sch_fk FOREIGN KEY (csd_sch_code) REFERENCES phenix.schedules (sch_code) ON DELETE CASCADE
);
COMMENT ON TABLE phenix.customer_schedules IS 'Indique les visites des vendeurs ou de télémarketing';
COMMENT ON COLUMN phenix.customer_schedules.csd_id IS 'Numéro d''identifiant de la route';
COMMENT ON COLUMN phenix.customer_schedules.csd_cus_code IS 'Numéro de client';
COMMENT ON COLUMN phenix.customer_schedules.csd_ordered_switch IS 'Indique si le client a commandé';
COMMENT ON COLUMN phenix.customer_schedules.csd_processed_switch IS 'Indique si la visite ou l''appel a été effectué';
COMMENT ON COLUMN phenix.customer_schedules.csd_hour IS 'Heure de visite ou d''appel';
COMMENT ON COLUMN phenix.customer_schedules.csd_minute IS 'Minute de visite ou d''appel';
COMMENT ON COLUMN phenix.customer_schedules.csd_position IS 'Position de visite ou d''appel';
COMMENT ON COLUMN phenix.customer_schedules.csd_outgoing_call_switch IS 'Indique si l''appel est reçu ou envoyer';
COMMENT ON COLUMN phenix.customer_schedules.csd_sch_code IS 'Numéro de la cédule';
COMMENT ON COLUMN phenix.customer_schedules.csd_notes IS 'Indique le message de l''horaire du client';