CREATE TABLE phenix.territories (
  trt_code NUMBER(2) NOT NULL,
  trt_description VARCHAR2(30 BYTE) NOT NULL,
  trt_alt_description VARCHAR2(30 BYTE),
  trt_ar_sales VARCHAR2(40 BYTE) NOT NULL,
  trt_ar_credits VARCHAR2(40 BYTE) NOT NULL,
  trt_ar_drops VARCHAR2(40 BYTE) NOT NULL,
  trt_sales_cogs VARCHAR2(40 BYTE) NOT NULL,
  trt_credits_cogs VARCHAR2(40 BYTE) NOT NULL,
  trt_drops_cogs VARCHAR2(40 BYTE) NOT NULL,
  trt_ticket_charge_account VARCHAR2(40 BYTE) NOT NULL,
  trt_transport_account VARCHAR2(40 BYTE) NOT NULL,
  trt_base_fuel_price NUMBER(5,3) DEFAULT 0 NOT NULL,
  trt_current_fuel_price NUMBER(5,3) DEFAULT 0 NOT NULL,
  trt_fuel_weight_percent NUMBER(5,3) DEFAULT 0 NOT NULL,
  trt_ar_drop_surcharges VARCHAR2(40 BYTE) NOT NULL,
  CONSTRAINT trt_pk PRIMARY KEY (trt_code)
);
COMMENT ON TABLE phenix.territories IS 'Idenfie les différents territoire des clients';
COMMENT ON COLUMN phenix.territories.trt_code IS 'Numéro de territoire';
COMMENT ON COLUMN phenix.territories.trt_description IS 'Description';
COMMENT ON COLUMN phenix.territories.trt_alt_description IS 'Description alternative';
COMMENT ON COLUMN phenix.territories.trt_ar_sales IS 'Indique le compte GL utilisé par défaut pour les ventes dans cette région';
COMMENT ON COLUMN phenix.territories.trt_ar_credits IS 'Indique le compte GL utilisé par défaut pour les crédits dans cette région';
COMMENT ON COLUMN phenix.territories.trt_ar_drops IS 'Indique le compte GL utilisé par défaut pour les livraisons indirectes dans cette région';
COMMENT ON COLUMN phenix.territories.trt_sales_cogs IS 'Indique le compte GL utilisé par défaut des coûtants de marchandises pour les ventes dans cette région';
COMMENT ON COLUMN phenix.territories.trt_credits_cogs IS 'Indique le compte GL utilisé par défaut des coûtants de marchandises pour les crédits dans cette région';
COMMENT ON COLUMN phenix.territories.trt_drops_cogs IS 'Indique le compte GL utilisé par défaut des coûtants de marchandises pour les livraisons indirectes dans cette région';
COMMENT ON COLUMN phenix.territories.trt_ticket_charge_account IS 'Indique le compte GL utilisé par défaut des charges des étiquettes pour les crédits dans cette région';
COMMENT ON COLUMN phenix.territories.trt_transport_account IS 'Indique le compte GL utilisé par défaut des charges de transport dans cette région';
COMMENT ON COLUMN phenix.territories.trt_base_fuel_price IS 'Indique le prix de base du carburant (utilisé pour le calcul de la surcharge)';
COMMENT ON COLUMN phenix.territories.trt_current_fuel_price IS 'Indique le prix courant du carburant';
COMMENT ON COLUMN phenix.territories.trt_fuel_weight_percent IS 'Indique le facteur de poids à appliquer dans le calcul de surcharge pour le carburant';
COMMENT ON COLUMN phenix.territories.trt_ar_drop_surcharges IS 'Indique le compte GL utilisé par défaut pour les surcharges des livraisons indirectes dans cette région ';