CREATE OR REPLACE PACKAGE phenix.RNR_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  roadnet_routes%ROWTYPE);


PROCEDURE INSERT_PROC(
  p_rnr_route            IN         roadnet_routes.rnr_route%TYPE,
  p_rnr_location_id      IN         roadnet_routes.rnr_location_id%TYPE,
  p_rnr_location_type    IN         roadnet_routes.rnr_location_type%TYPE,
  p_rnr_priority         IN         roadnet_routes.rnr_priority%TYPE              DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY roadnet_routes%ROWTYPE);

END RNR_PACK;
/