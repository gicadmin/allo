CREATE TABLE phenix.temporary_location_tickets (
  tlt_loc_code VARCHAR2(12 BYTE) NOT NULL,
  tlt_direction_up_switch NUMBER(1),
  tlt_loc_validation_code VARCHAR2(2 BYTE),
  tlt_use_code NUMBER(5),
  tlt_synchro_switch NUMBER(1) CONSTRAINT tlt_synchro_switch_ck CHECK (TLT_SYNCHRO_SWITCH IN(0,1)),
  tlt_new_location_switch NUMBER(1) CONSTRAINT tlt_new_location_switch_ck CHECK (TLT_NEW_LOCATION_SWITCH IN (0,1)),
  tlt_rac_code VARCHAR2(1 BYTE),
  tlt_pof_code NUMBER(2),
  tlt_lty_code NUMBER(5) NOT NULL,
  CONSTRAINT tlt_pk PRIMARY KEY (tlt_loc_code)
);
COMMENT ON TABLE phenix.temporary_location_tickets IS 'Table temporaraire utilis¿e pour imprimer les ¿tiquettes de localisations';
COMMENT ON COLUMN phenix.temporary_location_tickets.tlt_loc_code IS 'Indique le code de localisation';
COMMENT ON COLUMN phenix.temporary_location_tickets.tlt_direction_up_switch IS 'Indique si la localisation est située au dessus de l''étiquette dans l''entrepôt';
COMMENT ON COLUMN phenix.temporary_location_tickets.tlt_loc_validation_code IS 'Indique le code de validation utilisé pour la reconnaissance vocale';
COMMENT ON COLUMN phenix.temporary_location_tickets.tlt_use_code IS 'Indique le code de l''utilisateur qui imprime les étiquettes';
COMMENT ON COLUMN phenix.temporary_location_tickets.tlt_synchro_switch IS 'Indique si le code est ajouté dans la table location';
COMMENT ON COLUMN phenix.temporary_location_tickets.tlt_new_location_switch IS 'Indique si la localisation vient d''être créée';
COMMENT ON COLUMN phenix.temporary_location_tickets.tlt_rac_code IS 'Indique le type de rayonnage';
COMMENT ON COLUMN phenix.temporary_location_tickets.tlt_pof_code IS 'Indique le code de la famille de positionnement';
COMMENT ON COLUMN phenix.temporary_location_tickets.tlt_lty_code IS 'Indique le type de la localisation';