CREATE TABLE phenix.product_format_qty_timeline (
  pfq_whs_code VARCHAR2(2 BYTE) NOT NULL,
  pfq_prf_prd_code VARCHAR2(10 BYTE) NOT NULL,
  pfq_prf_fmt_code VARCHAR2(7 BYTE) NOT NULL,
  pfq_date DATE NOT NULL,
  pfq_type VARCHAR2(3 BYTE) NOT NULL CONSTRAINT pfq_type_ck CHECK (PFQ_TYPE IN ('CMD','PO','TRF')),
  pfq_quantity NUMBER(7) NOT NULL,
  pfq_weight NUMBER(10,3) NOT NULL,
  pfq_sales_type VARCHAR2(3 BYTE) DEFAULT 'REG' NOT NULL,
  CONSTRAINT pfq_pk PRIMARY KEY (pfq_whs_code,pfq_prf_prd_code,pfq_prf_fmt_code,pfq_type,pfq_sales_type,pfq_date),
  CONSTRAINT pfq_prf_fk FOREIGN KEY (pfq_prf_prd_code,pfq_prf_fmt_code) REFERENCES phenix.product_formats (prf_prd_code,prf_fmt_code),
  CONSTRAINT pfq_whs_fk FOREIGN KEY (pfq_whs_code) REFERENCES phenix.warehouses (whs_code)
);
COMMENT ON TABLE phenix.product_format_qty_timeline IS 'Table des projections futurs d''inventaire';
COMMENT ON COLUMN phenix.product_format_qty_timeline.pfq_whs_code IS 'Indique l''entrepôt où la transaction a eu lieu';
COMMENT ON COLUMN phenix.product_format_qty_timeline.pfq_prf_prd_code IS 'Indique le code du produit';
COMMENT ON COLUMN phenix.product_format_qty_timeline.pfq_prf_fmt_code IS 'Indique le format du produit';
COMMENT ON COLUMN phenix.product_format_qty_timeline.pfq_date IS 'Date de la projection';
COMMENT ON COLUMN phenix.product_format_qty_timeline.pfq_type IS 'Source ou type de la projection';
COMMENT ON COLUMN phenix.product_format_qty_timeline.pfq_quantity IS 'Quantité projecté';
COMMENT ON COLUMN phenix.product_format_qty_timeline.pfq_weight IS 'Poids projecté';
COMMENT ON COLUMN phenix.product_format_qty_timeline.pfq_sales_type IS 'Indique le type de vente, ''REG'' régulier ou ''LIQ'' Liquidation';