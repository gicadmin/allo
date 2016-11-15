CREATE TABLE phenix.user_login_attemps (
  ula_id NUMBER(15) NOT NULL,
  ula_use_code NUMBER(5),
  ula_station VARCHAR2(255 BYTE),
  ula_host_name VARCHAR2(255 BYTE) NOT NULL,
  ula_user_name VARCHAR2(255 BYTE) NOT NULL,
  ula_ip_address VARCHAR2(45 BYTE) NOT NULL,
  ula_login VARCHAR2(30 BYTE),
  ula_creation_date DATE DEFAULT SYSDATE NOT NULL,
  ula_confirmed VARCHAR2(1 BYTE) DEFAULT 'N' NOT NULL CONSTRAINT ula_confirmed_ck CHECK (ULA_CONFIRMED IN ('Y', 'N')),
  CONSTRAINT ula_use_station_ck CHECK ((ULA_USE_CODE IS NOT NULL AND ULA_STATION IS NULL) OR (ULA_USE_CODE IS NULL AND ULA_STATION IS NOT NULL)),
  CONSTRAINT ula_pk PRIMARY KEY (ula_id),
  CONSTRAINT ula_use_fk FOREIGN KEY (ula_use_code) REFERENCES phenix."USERS" (use_code)
);
COMMENT ON TABLE phenix.user_login_attemps IS 'Table des tentatives d''accès à l''application';
COMMENT ON COLUMN phenix.user_login_attemps.ula_id IS 'Indique l''identifiant de la table';
COMMENT ON COLUMN phenix.user_login_attemps.ula_use_code IS 'Indique si la tentative d''accès est sur un utilisateur dans Phenix';
COMMENT ON COLUMN phenix.user_login_attemps.ula_station IS 'Indique si la tentative d''accès est sur une station client';
COMMENT ON COLUMN phenix.user_login_attemps.ula_host_name IS 'Indique la machine ayant accès à l''application';
COMMENT ON COLUMN phenix.user_login_attemps.ula_user_name IS 'Indique le nom de l''utilisateur de la machine ayant accès à l''application';
COMMENT ON COLUMN phenix.user_login_attemps.ula_ip_address IS 'Indique l''adresse IP de la machine';
COMMENT ON COLUMN phenix.user_login_attemps.ula_login IS 'Indique le nom de l''utilisateur utilisé durant la tentative d''accès';
COMMENT ON COLUMN phenix.user_login_attemps.ula_creation_date IS 'Indique la date de création de la tentative d''accès';
COMMENT ON COLUMN phenix.user_login_attemps.ula_confirmed IS 'Indique si les tentatives d''accès ont été confirmées (limite atteint)';