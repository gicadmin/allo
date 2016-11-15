CREATE TABLE phenix.provinces (
  prv_code VARCHAR2(2 BYTE) NOT NULL,
  prv_alcohol_permit_switch NUMBER(1) NOT NULL CONSTRAINT prv_alcohol_permit_switch_ck CHECK (PRV_ALCOHOL_PERMIT_SWITCH IN (0, 1)),
  prv_compounded_tax_switch NUMBER(1) NOT NULL CONSTRAINT prv_compounded_tax_switch_ck CHECK (PRV_COMPOUNDED_TAX_SWITCH IN (0, 1)),
  prv_federal_tax NUMBER(6,3) NOT NULL,
  prv_harmonized_tax_switch NUMBER(1) NOT NULL CONSTRAINT prv_harmonized_tax_switch_ck CHECK (PRV_HARMONIZED_TAX_SWITCH IN (0, 1)),
  prv_name VARCHAR2(30 BYTE) NOT NULL,
  prv_provincial_tax NUMBER(6,3) NOT NULL,
  prv_tobacco_permit_switch NUMBER(1) NOT NULL CONSTRAINT prv_tobacco_permit_switch_ck CHECK (PRV_TOBACCO_PERMIT_SWITCH IN (0, 1)),
  prv_alt_name VARCHAR2(30 BYTE),
  prv_cun_code VARCHAR2(3 BYTE) NOT NULL,
  prv_tobacco_markup_rate NUMBER(6,3) DEFAULT 0 NOT NULL,
  prv_tobacco_tax_rate NUMBER(6,3) DEFAULT 0 NOT NULL,
  prv_ven_tobacco_tax_code NUMBER(5),
  prv_ven_cigar_tax_code NUMBER(5),
  prv_max_tobacco_no_licence NUMBER(3),
  prv_tobacco_tax_pay_method VARCHAR2(1 BYTE) DEFAULT 'P' NOT NULL CONSTRAINT prv_tobacco_tax_pay_method_ck CHECK (prv_tobacco_tax_pay_method IN ('P', 'S')),
  CONSTRAINT prv_pk PRIMARY KEY (prv_code),
  CONSTRAINT prv_cun_fk FOREIGN KEY (prv_cun_code) REFERENCES phenix.countries (cun_code),
  CONSTRAINT prv_ven_cigar_tax_code_fk FOREIGN KEY (prv_ven_cigar_tax_code) REFERENCES phenix.vendors (ven_code),
  CONSTRAINT prv_ven_tobacco_tax_code_fk FOREIGN KEY (prv_ven_tobacco_tax_code) REFERENCES phenix.vendors (ven_code)
);
COMMENT ON TABLE phenix.provinces IS 'Provinces ainsi que les taxes';
COMMENT ON COLUMN phenix.provinces.prv_code IS 'Numéro de province';
COMMENT ON COLUMN phenix.provinces.prv_alcohol_permit_switch IS 'Indique si un permis est necéssaire pour acheter de l''alcool dans cette province';
COMMENT ON COLUMN phenix.provinces.prv_compounded_tax_switch IS 'Indique si il y a  taxe consolidée';
COMMENT ON COLUMN phenix.provinces.prv_federal_tax IS 'Taux de la taxe fédéral';
COMMENT ON COLUMN phenix.provinces.prv_harmonized_tax_switch IS 'Indique si il y a  taxe harmonisée';
COMMENT ON COLUMN phenix.provinces.prv_name IS 'Nom de la province';
COMMENT ON COLUMN phenix.provinces.prv_provincial_tax IS 'Taux de la taxe provincial';
COMMENT ON COLUMN phenix.provinces.prv_tobacco_permit_switch IS 'Indique si un permis est necéssaire pour acheter du tabac dans cette province';
COMMENT ON COLUMN phenix.provinces.prv_alt_name IS 'Nom alternatif de la province';
COMMENT ON COLUMN phenix.provinces.prv_cun_code IS 'Code du pays';
COMMENT ON COLUMN phenix.provinces.prv_tobacco_markup_rate IS 'Indique le pourcentage de majoration utilisé sur les produits de type cigare';
COMMENT ON COLUMN phenix.provinces.prv_tobacco_tax_rate IS 'Indique le pourcentage utilisé pour le calcul de l''impôt applicable par cigare';
COMMENT ON COLUMN phenix.provinces.prv_tobacco_tax_pay_method IS 'Indique si la taxe tabac est payée à l''achat ou à la vente';