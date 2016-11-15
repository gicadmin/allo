CREATE GLOBAL TEMPORARY TABLE phenix.temporary_customer_price_lists (
  tcp_prf_prd_code VARCHAR2(15 BYTE) NOT NULL,
  tcp_prf_fmt_code VARCHAR2(7 BYTE) NOT NULL,
  tcp_selling_retail NUMBER(7,2) NOT NULL,
  tcp_promotion_amount NUMBER(7,2) NOT NULL,
  tcp_discount_amount NUMBER(7,2) NOT NULL,
  tcp_pricing_source VARCHAR2(2 BYTE) NOT NULL,
  tcp_cpr_pty_code NUMBER(3),
  tcp_cpr_from_date DATE,
  tcp_cpr_to_date DATE,
  tcp_prf_description VARCHAR2(30 BYTE),
  tcp_prd_description VARCHAR2(45 BYTE),
  tcp_brn_description VARCHAR2(15 BYTE),
  tcp_prf_upc_code VARCHAR2(18 BYTE),
  tcp_prd_ven_name VARCHAR2(30 BYTE),
  tcp_prd_ctg_code VARCHAR2(5 BYTE),
  tcp_ctg_description VARCHAR2(30 BYTE),
  tcp_profil_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT tcp_profil_switch_ck CHECK (TCP_PROFIL_SWITCH IN (0,1))
)
ON COMMIT DELETE ROWS;
COMMENT ON TABLE phenix.temporary_customer_price_lists IS 'Table Fiche des produits (pour extraction future)';
COMMENT ON COLUMN phenix.temporary_customer_price_lists.tcp_prf_prd_code IS 'Indique le code du produit';
COMMENT ON COLUMN phenix.temporary_customer_price_lists.tcp_prf_fmt_code IS 'Indique le code de format du produit';
COMMENT ON COLUMN phenix.temporary_customer_price_lists.tcp_selling_retail IS 'Indique le prix de vente';
COMMENT ON COLUMN phenix.temporary_customer_price_lists.tcp_promotion_amount IS 'Indique le montant de la promotion';
COMMENT ON COLUMN phenix.temporary_customer_price_lists.tcp_discount_amount IS 'Indique le montant de l''escompte';
COMMENT ON COLUMN phenix.temporary_customer_price_lists.tcp_pricing_source IS 'Indique la source du prix selon la routine du prix';
COMMENT ON COLUMN phenix.temporary_customer_price_lists.tcp_cpr_pty_code IS 'Indique le code de promotion du client';
COMMENT ON COLUMN phenix.temporary_customer_price_lists.tcp_cpr_from_date IS 'Indique la date de début de la promotion';
COMMENT ON COLUMN phenix.temporary_customer_price_lists.tcp_cpr_to_date IS 'Indique la date de fin de la promotion';
COMMENT ON COLUMN phenix.temporary_customer_price_lists.tcp_prf_description IS 'Indique l''empaquetage';
COMMENT ON COLUMN phenix.temporary_customer_price_lists.tcp_prd_description IS 'Indique la description du produit';
COMMENT ON COLUMN phenix.temporary_customer_price_lists.tcp_brn_description IS 'Indique le nom de la marque';
COMMENT ON COLUMN phenix.temporary_customer_price_lists.tcp_prf_upc_code IS 'Indique le code à barre';
COMMENT ON COLUMN phenix.temporary_customer_price_lists.tcp_prd_ven_name IS 'Indique le nom du manufacturier';
COMMENT ON COLUMN phenix.temporary_customer_price_lists.tcp_prd_ctg_code IS 'Indique le code du séquence catalogue';
COMMENT ON COLUMN phenix.temporary_customer_price_lists.tcp_ctg_description IS 'Indique le nom du séquence catalogue';
COMMENT ON COLUMN phenix.temporary_customer_price_lists.tcp_profil_switch IS 'Indique si l enregistrement provient du profil ';