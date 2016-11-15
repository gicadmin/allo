CREATE TABLE phenix.formats (
  fmt_code VARCHAR2(7 BYTE) NOT NULL,
  fmt_description VARCHAR2(30 BYTE) NOT NULL,
  fmt_surcharge NUMBER(7,2),
  fmt_weighted_format_switch NUMBER(1) NOT NULL CONSTRAINT fmt_weighted_format_switch_ck CHECK (FMT_WEIGHTED_FORMAT_SWITCH IN (0, 1)),
  fmt_alt_description VARCHAR2(30 BYTE),
  fmt_short_code VARCHAR2(2 BYTE) NOT NULL,
  fmt_conversion_to_kilograms NUMBER(9,4),
  fmt_edi_short_code VARCHAR2(2 BYTE) NOT NULL CONSTRAINT fmt_edi_short_code_ck CHECK (FMT_EDI_SHORT_CODE
IN ('BA', 'BG', 'BO', 'BR', 'BX', 'CA', 'CT', 'DS', 'DZ', 'EA',
'FT', 'GA', 'LB', 'KG', 'KT', 'OZ', 'PC', 'PL', 'PK', 'PT', 'QT', 'ZZ','UN')),
  fmt_average_volume NUMBER(10,3) DEFAULT 0 NOT NULL,
  fmt_shipping_case_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT fmt_shipping_case_switch_ck CHECK (fmt_shipping_case_switch in (0, 1)  ),
  fmt_surcharge_percent NUMBER(6,3),
  CONSTRAINT fmt_surcharge_ck CHECK ( (FMT_SURCHARGE IS NULL AND FMT_SURCHARGE_PERCENT IS NULL) OR
          (FMT_SURCHARGE IS NOT NULL AND FMT_SURCHARGE_PERCENT IS NULL) OR
          (FMT_SURCHARGE IS NULL AND FMT_SURCHARGE_PERCENT IS NOT NULL) ),
  CONSTRAINT fmt_weight_conversion_ck CHECK ((FMT_WEIGHTED_FORMAT_SWITCH = 0
and FMT_CONVERSION_TO_KILOGRAMS is NULL) or
(FMT_WEIGHTED_FORMAT_SWITCH = 1
and FMT_CONVERSION_TO_KILOGRAMS is not NULL)),
  CONSTRAINT fmt_pk PRIMARY KEY (fmt_code),
  CONSTRAINT fmt_short_code_uk UNIQUE (fmt_short_code)
);
COMMENT ON TABLE phenix.formats IS 'Description d''un unité solide ou de mesure dans lequel le produit peut se vendre ou s''acheter';
COMMENT ON COLUMN phenix.formats.fmt_code IS 'Numéro de format';
COMMENT ON COLUMN phenix.formats.fmt_description IS 'Description';
COMMENT ON COLUMN phenix.formats.fmt_surcharge IS 'Montant de surchage de format';
COMMENT ON COLUMN phenix.formats.fmt_weighted_format_switch IS 'Indique si le format est un unité de mesure de poids';
COMMENT ON COLUMN phenix.formats.fmt_alt_description IS 'Description alternative';
COMMENT ON COLUMN phenix.formats.fmt_short_code IS 'Code court utilisé pour la vente';
COMMENT ON COLUMN phenix.formats.fmt_conversion_to_kilograms IS 'Facteur de conversion au kilogramme';
COMMENT ON COLUMN phenix.formats.fmt_edi_short_code IS 'Code de format EDI';
COMMENT ON COLUMN phenix.formats.fmt_average_volume IS 'Volume par défaut du format.';
COMMENT ON COLUMN phenix.formats.fmt_shipping_case_switch IS 'Indique si ce format est utilisé pour comptabilisé le nombre d''éléments dans la génération des routes et les factures.';
COMMENT ON COLUMN phenix.formats.fmt_surcharge_percent IS 'Indique le pourcentage de surchage pour le format';