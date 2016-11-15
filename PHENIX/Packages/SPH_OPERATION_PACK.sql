CREATE OR REPLACE PACKAGE phenix.SPH_OPERATION_PACK IS

PROCEDURE PURGE_PROC(
  p_sph_prf_prd_code IN spiff_headers.sph_prf_prd_code%TYPE,
  p_sph_prf_fmt_code IN spiff_headers.sph_prf_fmt_code%TYPE
);

END SPH_OPERATION_PACK;
/