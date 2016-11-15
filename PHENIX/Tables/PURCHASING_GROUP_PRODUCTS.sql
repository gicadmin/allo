CREATE TABLE phenix.purchasing_group_products (
  pgp_id NUMBER(15) NOT NULL,
  pgp_pug_code NUMBER(5) NOT NULL,
  pgp_prd_code VARCHAR2(10 BYTE) NOT NULL,
  pgp_effective_date DATE NOT NULL,
  pgp_base_cost NUMBER(7,2) NOT NULL,
  CONSTRAINT pgp_pk PRIMARY KEY (pgp_id),
  CONSTRAINT pgp_uk UNIQUE (pgp_pug_code,pgp_prd_code,pgp_effective_date) USING INDEX (CREATE UNIQUE INDEX phenix.pgp_uk_i ON phenix.purchasing_group_products(pgp_pug_code,pgp_prd_code,pgp_effective_date)    ),
  CONSTRAINT pgp_prd_fk FOREIGN KEY (pgp_prd_code) REFERENCES phenix.products (prd_code),
  CONSTRAINT pgp_pug_fk FOREIGN KEY (pgp_pug_code) REFERENCES phenix.purchasing_groups (pug_code)
);