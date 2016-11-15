CREATE OR REPLACE PACKAGE phenix.RNL_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  roadnet_locations%ROWTYPE);


PROCEDURE INSERT_PROC(
  p_rnl_location_id      IN         roadnet_locations.rnl_location_id%TYPE,
  p_rnl_location_type    IN         roadnet_locations.rnl_location_type%TYPE,
  p_rnl_location_name    IN         roadnet_locations.rnl_location_name%TYPE,
  p_rnl_address_1        IN         roadnet_locations.rnl_address_1%TYPE,
  p_rnl_city             IN         roadnet_locations.rnl_city%TYPE,
  p_rnl_state            IN         roadnet_locations.rnl_state%TYPE,
  p_rnl_country          IN         roadnet_locations.rnl_country%TYPE,
  p_rnl_postal_code      IN         roadnet_locations.rnl_postal_code%TYPE,
  p_rnl_address_2        IN         roadnet_locations.rnl_address_2%TYPE             DEFAULT NULL,
  p_rnl_county           IN         roadnet_locations.rnl_county%TYPE                DEFAULT NULL,
  p_rnl_ranking          IN         roadnet_locations.rnl_ranking%TYPE               DEFAULT NULL,
  p_rnl_creation_date    IN         roadnet_locations.rnl_creation_date%TYPE         DEFAULT SYSTIMESTAMP,
  p_rnl_whs_code         IN         roadnet_locations.rnl_whs_code%TYPE --BER8278
  );


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY roadnet_locations%ROWTYPE);

END RNL_PACK;
/