CREATE TABLE phenix.assigned_promotion_types (
  apt_pty_source_code NUMBER(3) NOT NULL,
  apt_pty_destination_code NUMBER(3) NOT NULL,
  CONSTRAINT apt_pk PRIMARY KEY (apt_pty_source_code,apt_pty_destination_code),
  CONSTRAINT apt_pty_dest_fk FOREIGN KEY (apt_pty_destination_code) REFERENCES phenix.promotion_types (pty_code),
  CONSTRAINT apt_pty_source_fk FOREIGN KEY (apt_pty_source_code) REFERENCES phenix.promotion_types (pty_code)
);
COMMENT ON TABLE phenix.assigned_promotion_types IS 'Table utilisée pour transférer une promotion à l''achat vers plusieurs promotions à la vente';
COMMENT ON COLUMN phenix.assigned_promotion_types.apt_pty_source_code IS 'Indique le type de promotion source';
COMMENT ON COLUMN phenix.assigned_promotion_types.apt_pty_destination_code IS 'Indique le type de promotion destination';