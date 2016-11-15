CREATE OR REPLACE PACKAGE phenix.TSO_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  temporary_spec_order_releases%ROWTYPE);


PROCEDURE INSERT_PROC(
  p_tso_prd_code                  IN         temporary_spec_order_releases.tso_prd_code%TYPE                       DEFAULT NULL,
  p_tso_prd_description           IN         temporary_spec_order_releases.tso_prd_description%TYPE                DEFAULT NULL,
  p_tso_prd_definition            IN         temporary_spec_order_releases.tso_prd_definition%TYPE                 DEFAULT NULL,
  p_tso_prf_fmt_code              IN         temporary_spec_order_releases.tso_prf_fmt_code%TYPE                   DEFAULT NULL,
  p_tso_prd_fmt_solid_inv_code    IN         temporary_spec_order_releases.tso_prd_fmt_solid_inv_code%TYPE         DEFAULT NULL,
  p_tso_prd_pgr_code              IN         temporary_spec_order_releases.tso_prd_pgr_code%TYPE                   DEFAULT NULL,
  p_tso_prd_ven_code              IN         temporary_spec_order_releases.tso_prd_ven_code%TYPE                   DEFAULT NULL,
  p_tso_ven_short_name            IN         temporary_spec_order_releases.tso_ven_short_name%TYPE                 DEFAULT NULL,
  p_tso_prd_brn_code              IN         temporary_spec_order_releases.tso_prd_brn_code%TYPE                   DEFAULT NULL,
  p_tso_marque_manuf              IN         temporary_spec_order_releases.tso_marque_manuf%TYPE                   DEFAULT NULL,
  p_tso_prd_ctg_code              IN         temporary_spec_order_releases.tso_prd_ctg_code%TYPE                   DEFAULT NULL,
  p_tso_prd_catalog_sequence_cod  IN         temporary_spec_order_releases.tso_prd_catalog_sequence_code%TYPE      DEFAULT NULL,
  p_tso_fmt_short_code            IN         temporary_spec_order_releases.tso_fmt_short_code%TYPE                 DEFAULT NULL,
  p_tso_prf_description           IN         temporary_spec_order_releases.tso_prf_description%TYPE                DEFAULT NULL,
  p_tso_qty_wgt_available         IN         temporary_spec_order_releases.tso_qty_wgt_available%TYPE              DEFAULT NULL,
  p_tso_pgr_sales_format          IN         temporary_spec_order_releases.tso_pgr_sales_format%TYPE               DEFAULT NULL,
  p_tso_wsp_whs_picking_code      IN         temporary_spec_order_releases.tso_wsp_whs_picking_code%TYPE           DEFAULT NULL,
  p_tso_already_ordered_switch    IN         temporary_spec_order_releases.tso_already_ordered_switch%TYPE         DEFAULT NULL,
  p_tso_on_hand                   IN         temporary_spec_order_releases.tso_on_hand%TYPE                        DEFAULT NULL,
  p_tso_on_cod_order              IN         temporary_spec_order_releases.tso_on_cod_order%TYPE                   DEFAULT NULL,
  p_tso_being_received            IN         temporary_spec_order_releases.tso_being_received%TYPE                 DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY temporary_spec_order_releases%ROWTYPE);

END TSO_PACK;
/