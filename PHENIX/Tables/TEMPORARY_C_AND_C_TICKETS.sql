CREATE GLOBAL TEMPORARY TABLE phenix.temporary_c_and_c_tickets (
  tcct_prd_code VARCHAR2(10 BYTE) NOT NULL,
  tcct_prd_description VARCHAR2(45 BYTE) NOT NULL,
  tcct_sales_tax_labels VARCHAR2(2 BYTE),
  tcct_purchase_tax_labels VARCHAR2(2 BYTE),
  tcct_smallest_price NUMBER(7,2) NOT NULL,
  tcct_smallest_prf_description VARCHAR2(30 BYTE) NOT NULL,
  tcct_smallest_fmt_description VARCHAR2(30 BYTE) NOT NULL,
  tcct_largest_price NUMBER(7,2),
  tcct_largest_prf_description VARCHAR2(30 BYTE),
  tcct_largest_fmt_description VARCHAR2(30 BYTE),
  tcct_effective_date DATE,
  tcct_promo_from_date DATE,
  tcct_promo_to_date DATE,
  tcct_print_date DATE NOT NULL,
  tcct_brandname_or_manuf VARCHAR2(15 BYTE),
  tcct_loc_code VARCHAR2(12 BYTE),
  tcct_smallest_prf_fmt_code VARCHAR2(7 BYTE) NOT NULL,
  tcct_largest_prf_fmt_code VARCHAR2(7 BYTE),
  CONSTRAINT tcct_prd_code_pk PRIMARY KEY (tcct_prd_code)
)
ON COMMIT PRESERVE ROWS;
COMMENT ON COLUMN phenix.temporary_c_and_c_tickets.tcct_prd_code IS 'Indique le code de produit';
COMMENT ON COLUMN phenix.temporary_c_and_c_tickets.tcct_prd_description IS 'Indique la description du produit';
COMMENT ON COLUMN phenix.temporary_c_and_c_tickets.tcct_sales_tax_labels IS 'Indique les taxes à la vente';
COMMENT ON COLUMN phenix.temporary_c_and_c_tickets.tcct_purchase_tax_labels IS 'Indique les taxes à l''achat';
COMMENT ON COLUMN phenix.temporary_c_and_c_tickets.tcct_smallest_price IS 'Indique le prix du plus petit format';
COMMENT ON COLUMN phenix.temporary_c_and_c_tickets.tcct_smallest_prf_description IS 'Indique l''empaquetage du plus petit format';
COMMENT ON COLUMN phenix.temporary_c_and_c_tickets.tcct_smallest_fmt_description IS 'Indique la description du plus petit format';
COMMENT ON COLUMN phenix.temporary_c_and_c_tickets.tcct_largest_price IS 'Indique le prix du plus grand format';
COMMENT ON COLUMN phenix.temporary_c_and_c_tickets.tcct_largest_prf_description IS 'Indique l''empaquetage du plus grand format';
COMMENT ON COLUMN phenix.temporary_c_and_c_tickets.tcct_largest_fmt_description IS 'Indique la description du plus grand format';
COMMENT ON COLUMN phenix.temporary_c_and_c_tickets.tcct_effective_date IS 'Indique la date effective pour un changement de prix';
COMMENT ON COLUMN phenix.temporary_c_and_c_tickets.tcct_promo_from_date IS 'Indique la date début d''une promotion';
COMMENT ON COLUMN phenix.temporary_c_and_c_tickets.tcct_promo_to_date IS 'Indique la date de fin d''une promotion';
COMMENT ON COLUMN phenix.temporary_c_and_c_tickets.tcct_print_date IS 'Indique la date d''impression';