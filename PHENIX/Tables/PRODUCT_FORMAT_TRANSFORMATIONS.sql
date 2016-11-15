CREATE TABLE phenix.product_format_transformations (
  pft_id NUMBER(15) NOT NULL,
  pft_source_prf_prd_code VARCHAR2(10 BYTE) NOT NULL,
  pft_source_prf_fmt_code VARCHAR2(7 BYTE) NOT NULL,
  pft_resulting_prf_prd_code VARCHAR2(10 BYTE) NOT NULL,
  pft_resulting_prf_fmt_code VARCHAR2(7 BYTE) NOT NULL,
  pft_conversion_factor NUMBER(10,6) NOT NULL,
  pft_tolerance_percent NUMBER(6,3) NOT NULL,
  pft_replenishment_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT pft_replenishment_switch_ck CHECK (PFT_REPLENISHMENT_SWITCH IN (0, 1)),
  CONSTRAINT pft_pk PRIMARY KEY (pft_id),
  CONSTRAINT pft_uk UNIQUE (pft_source_prf_prd_code,pft_source_prf_fmt_code,pft_resulting_prf_prd_code,pft_resulting_prf_fmt_code),
  CONSTRAINT pft_resulting_prf_fk FOREIGN KEY (pft_resulting_prf_prd_code,pft_resulting_prf_fmt_code) REFERENCES phenix.product_formats (prf_prd_code,prf_fmt_code),
  CONSTRAINT pft_source_prf_fk FOREIGN KEY (pft_source_prf_prd_code,pft_source_prf_fmt_code) REFERENCES phenix.product_formats (prf_prd_code,prf_fmt_code)
);
COMMENT ON TABLE phenix.product_format_transformations IS 'Table de transformation des produits';
COMMENT ON COLUMN phenix.product_format_transformations.pft_id IS 'Indique l''identifiant de la table';
COMMENT ON COLUMN phenix.product_format_transformations.pft_source_prf_prd_code IS 'Indique le code du produit source';
COMMENT ON COLUMN phenix.product_format_transformations.pft_source_prf_fmt_code IS 'Indique le format du produit source';
COMMENT ON COLUMN phenix.product_format_transformations.pft_resulting_prf_prd_code IS 'Indique le code de produit de destination';
COMMENT ON COLUMN phenix.product_format_transformations.pft_resulting_prf_fmt_code IS 'Indique le format du produit de destination';
COMMENT ON COLUMN phenix.product_format_transformations.pft_conversion_factor IS 'Indique le facteur de conversion';
COMMENT ON COLUMN phenix.product_format_transformations.pft_tolerance_percent IS 'Indique le pourcentage de tolérance';
COMMENT ON COLUMN phenix.product_format_transformations.pft_replenishment_switch IS 'Indique si cette transformation se fait automatiquement via des réapprovisionnements';