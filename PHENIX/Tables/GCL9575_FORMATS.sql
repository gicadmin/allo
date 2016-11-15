CREATE TABLE phenix.gcl9575_formats (
  fmt_code VARCHAR2(7 BYTE) NOT NULL,
  fmt_description VARCHAR2(30 BYTE) NOT NULL,
  fmt_surcharge NUMBER(7,2),
  fmt_weighted_format_switch NUMBER(1) NOT NULL,
  fmt_alt_description VARCHAR2(30 BYTE),
  fmt_short_code VARCHAR2(2 BYTE) NOT NULL,
  fmt_conversion_to_kilograms NUMBER(9,3),
  fmt_edi_short_code VARCHAR2(2 BYTE) NOT NULL,
  fmt_average_volume NUMBER(10,3) NOT NULL,
  fmt_shipping_case_switch NUMBER(1) NOT NULL,
  fmt_surcharge_percent NUMBER(6,3)
);