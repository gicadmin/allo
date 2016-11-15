CREATE TABLE phenix.spiff_headers (
  sph_id NUMBER(7) NOT NULL,
  sph_prf_prd_code VARCHAR2(10 BYTE) NOT NULL,
  sph_prf_fmt_code VARCHAR2(7 BYTE) NOT NULL,
  sph_from_date DATE NOT NULL,
  sph_to_date DATE NOT NULL,
  sph_spiff_amount NUMBER(6,2) NOT NULL,
  CONSTRAINT sph_pk PRIMARY KEY (sph_id),
  CONSTRAINT sph_prf_fk FOREIGN KEY (sph_prf_prd_code,sph_prf_fmt_code) REFERENCES phenix.product_formats (prf_prd_code,prf_fmt_code)
);
COMMENT ON TABLE phenix.spiff_headers IS 'Entête des primes (Spiff)';
COMMENT ON COLUMN phenix.spiff_headers.sph_id IS 'Numéro de prime (Spiff)';
COMMENT ON COLUMN phenix.spiff_headers.sph_prf_prd_code IS 'Numéro de produit';
COMMENT ON COLUMN phenix.spiff_headers.sph_prf_fmt_code IS 'Numéro de format';
COMMENT ON COLUMN phenix.spiff_headers.sph_from_date IS 'Date de début de la prime (Spiff)';
COMMENT ON COLUMN phenix.spiff_headers.sph_to_date IS 'Date de fin de la prime (Spiff)';
COMMENT ON COLUMN phenix.spiff_headers.sph_spiff_amount IS 'Montant de prime (Spiff)';