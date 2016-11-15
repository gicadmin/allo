CREATE TABLE phenix.promotion_types (
  pty_code NUMBER(3) NOT NULL,
  pty_broker_switch NUMBER(1) NOT NULL CONSTRAINT pty_broker_switch_ck CHECK (PTY_BROKER_SWITCH IN (0, 1)),
  pty_cost_plus_switch NUMBER(1) NOT NULL CONSTRAINT pty_cost_plus_switch_ck CHECK (PTY_COST_PLUS_SWITCH IN (0, 1)),
  pty_customer_vendor_flag VARCHAR2(1 BYTE) NOT NULL CONSTRAINT pty_customer_vendor_flag_ck CHECK (PTY_CUSTOMER_VENDOR_FLAG IN ('B', 'V', 'C')),
  pty_description VARCHAR2(30 BYTE) NOT NULL,
  pty_telemark_only_switch NUMBER(1) NOT NULL CONSTRAINT pty_telemark_only_switch_ck CHECK (PTY_TELEMARK_ONLY_SWITCH IN (0, 1)),
  pty_alt_description VARCHAR2(30 BYTE),
  pty_retain_margin NUMBER(7,3),
  pty_exceptional_sales_switch NUMBER(1) NOT NULL CONSTRAINT pty_exceptional_sales_switc_ck CHECK (PTY_EXCEPTIONAL_SALES_SWITCH IN (0, 1)),
  pty_guaranteed_price_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT pty_guaranteed_price_switch_ck CHECK (PTY_GUARANTEED_PRICE_SWITCH IN (0, 1)),
  pty_cus_promo_start_lead_days NUMBER(2),
  pty_cus_promo_end_lead_days NUMBER(2),
  pty_allow_spec_order_switch NUMBER(1) DEFAULT 0 NOT NULL,
  pty_prebook_reservation_days NUMBER(4),
  pty_show_switch NUMBER(1) DEFAULT 0 NOT NULL,
  pty_cumulative_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT pty_cumulative_switch_ck CHECK (PTY_CUMULATIVE_SWITCH IN (0, 1)),
  pty_pgs_create_manuf_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT pty_pgs_create_manuf_ck CHECK (PTY_PGS_CREATE_MANUF_SWITCH IN (0, 1)),
  pty_incl_royalty_on_inv_switch NUMBER(1) DEFAULT 1 NOT NULL CONSTRAINT pty_incl_royalty_on_inv_swi_ck CHECK (pty_incl_royalty_on_inv_switch IN (0, 1)),
  pty_guaranteed_alloc_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT pty_guaranteed_alloc_switch_ck CHECK (PTY_GUARANTEED_ALLOC_SWITCH IN (0, 1)),
  pty_retain_margin_ven NUMBER(6,3),
  pty_prebook_dc_percentage NUMBER(6,3),
  pty_nb_of_week_bef_expiration NUMBER(2),
  pty_exclude_cumulative_switch NUMBER(1) DEFAULT 0 NOT NULL CONSTRAINT pty_exclude_cumulative_swi_ck CHECK (PTY_EXCLUDE_CUMULATIVE_SWITCH IN (0, 1)),
  CONSTRAINT pty_vendor_cost_plus_ck CHECK ((PTY_CUSTOMER_VENDOR_FLAG = 'V' and
 PTY_COST_PLUS_SWITCH = 0) or
(PTY_CUSTOMER_VENDOR_FLAG = 'C' and
 PTY_COST_PLUS_SWITCH = 0) or
(PTY_CUSTOMER_VENDOR_FLAG = 'B' and
 PTY_COST_PLUS_SWITCH = 0) or
(PTY_CUSTOMER_VENDOR_FLAG = 'C' and
 PTY_COST_PLUS_SWITCH = 1) or
(PTY_CUSTOMER_VENDOR_FLAG = 'B' and
 PTY_COST_PLUS_SWITCH = 1)),
  CONSTRAINT pty_pk PRIMARY KEY (pty_code)
);
COMMENT ON TABLE phenix.promotion_types IS 'Type des promotion ainsi que les fonctionalité de celle-ci';
COMMENT ON COLUMN phenix.promotion_types.pty_code IS 'Numéro de type de promotion';
COMMENT ON COLUMN phenix.promotion_types.pty_broker_switch IS 'Indique si la promotion provient u courtier principal';
COMMENT ON COLUMN phenix.promotion_types.pty_cost_plus_switch IS 'Indique si la promotion est retiré du prix de vente opu un ajout sur le coûtant';
COMMENT ON COLUMN phenix.promotion_types.pty_customer_vendor_flag IS 'Indique si la promotion est pour un client, un fournisseur ou les deux';
COMMENT ON COLUMN phenix.promotion_types.pty_description IS 'Description';
COMMENT ON COLUMN phenix.promotion_types.pty_telemark_only_switch IS 'Indique si le type est alloué aux "telemarketer" seulement';
COMMENT ON COLUMN phenix.promotion_types.pty_alt_description IS 'Description alternative';
COMMENT ON COLUMN phenix.promotion_types.pty_retain_margin IS 'Indique le pourcentage du montant de la promotion qui n''est pas tranféré au client.';
COMMENT ON COLUMN phenix.promotion_types.pty_exceptional_sales_switch IS 'Indique que le type est exceptionnel';
COMMENT ON COLUMN phenix.promotion_types.pty_guaranteed_price_switch IS 'Indique si la promotion peut être modifié';
COMMENT ON COLUMN phenix.promotion_types.pty_cus_promo_start_lead_days IS 'Indique, en avance, le nombre de jours qu''une promotion client sera activée via l''interface courtier';
COMMENT ON COLUMN phenix.promotion_types.pty_cus_promo_end_lead_days IS 'Indique, en avance, le nombre de jours qu''une promotion sera terminée via l''interface courtier';
COMMENT ON COLUMN phenix.promotion_types.pty_allow_spec_order_switch IS 'Indique si ce type de promotion permet d''entrer des produits en commande spéciale';
COMMENT ON COLUMN phenix.promotion_types.pty_prebook_reservation_days IS 'Indique le nombre de jours à l''avance où on essait de réserver les quantités/poids pour les commandes bulletins garanties (date fixe)';
COMMENT ON COLUMN phenix.promotion_types.pty_show_switch IS 'Indique si le type de promotion est relié à un salon.';
COMMENT ON COLUMN phenix.promotion_types.pty_cumulative_switch IS 'Indique si la promotion est cumulative ou non.';
COMMENT ON COLUMN phenix.promotion_types.pty_pgs_create_manuf_switch IS 'Indique si les promotions venant du PGS (courtier) crée aussi une copie de la promotion pour le fournisseur définie comme manufacturier du produit.';
COMMENT ON COLUMN phenix.promotion_types.pty_incl_royalty_on_inv_switch IS 'Indique si les factures pour les clients reliés à ce type de promotion inclut les royautés dans les prix de vente';
COMMENT ON COLUMN phenix.promotion_types.pty_guaranteed_alloc_switch IS 'Indique si l''allocation est garantie pour les bulletins du salon';
COMMENT ON COLUMN phenix.promotion_types.pty_retain_margin_ven IS 'Indique le pourcentage retenu pour l''allocation fournisseur';
COMMENT ON COLUMN phenix.promotion_types.pty_prebook_dc_percentage IS 'Indique le pourcentage de la réservation pige, par rapport à la quantité restante, qui sera inclus dans le calcul de quantité suggérée dans CAPS pour les commandes ayant un nombre de semaine de livraison défini';
COMMENT ON COLUMN phenix.promotion_types.pty_nb_of_week_bef_expiration IS 'Indique à combien de semaine(s) de la fin de la livraison la quantité restante sera incluse au complet dans le calcul de quantité suggérée dans CAPS pour les commandes ayant un nombre de semaine de livraison défini';
COMMENT ON COLUMN phenix.promotion_types.pty_exclude_cumulative_switch IS 'Indique si ce type de promotion ne laisse pas empiler des promotions cumulative';