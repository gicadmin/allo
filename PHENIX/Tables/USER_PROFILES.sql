CREATE TABLE phenix.user_profiles (
  upro_id NUMBER(15) NOT NULL,
  upro_cus_code NUMBER(10),
  upro_ven_code NUMBER(5),
  upro_ause_id NUMBER(15) NOT NULL,
  upro_creation_date DATE DEFAULT sysdate NOT NULL,
  upro_modification_date DATE DEFAULT sysdate NOT NULL,
  CONSTRAINT upro_check_combo_ck CHECK (upro_cus_code is null and upro_ven_code is null or
         upro_cus_code is not null and upro_ven_code is null or
         upro_cus_code is null and upro_ven_code is not null
        ),
  CONSTRAINT upro_pk PRIMARY KEY (upro_id),
  CONSTRAINT upro_uk_1 UNIQUE (upro_cus_code,upro_ven_code,upro_ause_id),
  CONSTRAINT upro_ause_fk FOREIGN KEY (upro_ause_id) REFERENCES phenix.application_users (ause_id),
  CONSTRAINT upro_cus_fk FOREIGN KEY (upro_cus_code) REFERENCES phenix.customers (cus_code) ON DELETE CASCADE,
  CONSTRAINT upro_ven_fk FOREIGN KEY (upro_ven_code) REFERENCES phenix.vendors (ven_code) ON DELETE CASCADE
);