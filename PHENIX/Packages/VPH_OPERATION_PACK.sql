CREATE OR REPLACE PACKAGE phenix.VPH_OPERATION_PACK IS

PROCEDURE PURGE_PROC(
  p_vph_id  IN vendor_pick_headers.vph_id%TYPE
);

END VPH_OPERATION_PACK;
/