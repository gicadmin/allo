CREATE OR REPLACE PACKAGE phenix.WMS_IDENTIFIER_UPDATE_PACK IS

/*--------------------------------------------------------------------------------*/

FUNCTION MOVE_IDENT_DEPLACEMENT_FUNC(
  p_ident                 IN      NUMBER,
  p_new_ident             IN      NUMBER,
  p_inv_quantity_on_hand  IN      NUMBER,
  p_inv_weight_on_hand    IN      NUMBER,
  p_inv_loc_code          IN      VARCHAR2,
  p_new_loc_code          OUT     VARCHAR2,
  p_use_code              IN      NUMBER   	DEFAULT NULL,
  p_planned_switch        IN      NUMBER   	DEFAULT NULL,
  p_inm_trans_type        IN      VARCHAR2 	DEFAULT NULL,
  p_dmr_code			 				IN			NUMBER		DEFAULT NULL	--CSC3441
)
RETURN PLS_INTEGER;

/*--------------------------------------------------------------------------------*/

FUNCTION CREATE_IDENT_FUNC(
  p_ident                 IN  VARCHAR2,
  p_inv_prf_prd_code      IN  VARCHAR2,
  p_inv_prf_fmt_code      IN  VARCHAR2,
  p_inv_fifo_date         IN  DATE,     -- GIC3396
  p_inv_expiry_date       IN  DATE,
  p_inv_quantity_on_hand  IN  NUMBER,
  p_inv_loc_code          IN  VARCHAR2,
  p_dest_loc_code         IN  VARCHAR2,
  p_inv_weight_on_hand    IN  NUMBER,
  p_flag_inv              IN  VARCHAR2 DEFAULT 'Y',
  p_inv_trans_type				IN	VARCHAR2 DEFAULT NULL --CSC3548 	--RPO = Réception PO, RMA = Réception RMA
)
RETURN PLS_INTEGER;

/*--------------------------------------------------------------------------------*/

--ATTENTION!!! CETTE FONCTION NEST PAS COMPATIBLE AVEC LES VRAC EN CE MOMENT!! COLABOR NE GERE PAS LES VRAC.... a date...
FUNCTION MOVE_IDENT_REPLENISH_FUNC(
  p_ident                 IN      NUMBER,
  p_inv_quantity_on_hand  IN      NUMBER,
  p_inv_weight_on_hand    IN      NUMBER,
  p_quantity_suggested    IN      NUMBER,   --BER3820 doit indiqué la quantité suggéré d'une destination de réappro (lorsqu'on met dans une loc de cueillette
  p_inv_loc_code          IN      VARCHAR2,
  p_picking_loc_code      IN      VARCHAR2,
  p_deplacement_type      IN      NUMBER,   --ber3820  0=de la réserve vers la loc user  1=1ere destination de cueillette     2=2eme destination (ou plus)
  p_new_loc_code          OUT     VARCHAR2,
  p_use_code              IN      NUMBER   DEFAULT NULL,
  p_planned_switch        IN      NUMBER   DEFAULT NULL,
  p_inm_trans_type        IN      VARCHAR2 DEFAULT NULL
)
RETURN PLS_INTEGER ;

/*--------------------------------------------------------------------------------*/

FUNCTION DELETE_IDENT_FUNC(
  p_ident           IN  NUMBER,
  p_flag_inv        IN  VARCHAR2 DEFAULT 'Y'
)
RETURN PLS_INTEGER;

/*--------------------------------------------------------------------------------*/

FUNCTION UPDATE_IDENT_QTE_IN_FUNC(
  p_ident                 IN  NUMBER,
  p_old_dest              IN  VARCHAR2, -- code localisation
  p_new_dest              IN  VARCHAR2, -- code localisation
  p_inv_quantity_on_hand  IN  NUMBER,
  p_inv_in_out_flag       IN  CHAR
)
RETURN PLS_INTEGER;

/*--------------------------------------------------------------------------------*/

FUNCTION CREATE_RTD_IDENT_FUNC(
  p_ident                   IN  NUMBER,
  p_use_code                IN  NUMBER,
  p_receipt_type            IN  VARCHAR2,
  p_rtd_number_of_stickers  IN  NUMBER,
  p_rth_id                  IN  NUMBER,
  p_loc_code                IN  VARCHAR2   --  CSC3610
)
RETURN PLS_INTEGER;

/*--------------------------------------------------------------------------------*/

FUNCTION CREATE_MVT_FUNC(
  p_ident           IN  NUMBER,
  p_use_code        IN  NUMBER,
  p_planned_switch  IN  NUMBER,
  p_type_code       IN  VARCHAR2
)
RETURN PLS_INTEGER;

/*--------------------------------------------------------------------------------*/

FUNCTION MOVE_PRD_IN_IDENTIFIER_FUNC(
  p_prd_code       					IN      VARCHAR2,
  p_fmt_code       					IN      VARCHAR2,
  p_quantity       					IN      NUMBER,
  p_weight         					IN      NUMBER,
  p_from_loc_code  					IN      VARCHAR2,
  p_to_loc_code    					IN      VARCHAR2,
  p_ide_id         					IN      NUMBER,
  p_use_code       					IN      NUMBER,
  p_language_flag  					IN      VARCHAR2,   -- "F" pour Français ou "E" pour English
  p_vocal_switch   					IN      NUMBER,
  p_ccr_code       					OUT     NUMBER,
  p_ccr_message    					OUT     VARCHAR2,
  p_dmr_code			 					IN			NUMBER	DEFAULT NULL,	--CSC3441
  p_use_urgency_loc_switch  IN			NUMBER 	DEFAULT 0 		--CSC4607
)
RETURN PLS_INTEGER;

/*--------------------------------------------------------------------------------*/

END WMS_IDENTIFIER_UPDATE_PACK;
/