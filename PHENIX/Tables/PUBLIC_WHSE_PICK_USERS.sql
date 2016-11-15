CREATE TABLE phenix.public_whse_pick_users (
  pwpu_pwph_id NUMBER(15) NOT NULL,
  pwpu_use_code NUMBER(5) NOT NULL,
  CONSTRAINT pwpu_pk PRIMARY KEY (pwpu_pwph_id,pwpu_use_code),
  CONSTRAINT pwpu_pwph_fk FOREIGN KEY (pwpu_pwph_id) REFERENCES phenix.public_whse_pick_headers (pwph_id),
  CONSTRAINT pwpu_use_fk FOREIGN KEY (pwpu_use_code) REFERENCES phenix."USERS" (use_code)
);
COMMENT ON COLUMN phenix.public_whse_pick_users.pwpu_pwph_id IS 'Indique la clé primaire de l''en-tête des cueillettes';
COMMENT ON COLUMN phenix.public_whse_pick_users.pwpu_use_code IS 'Indique le code d''utilisateur';