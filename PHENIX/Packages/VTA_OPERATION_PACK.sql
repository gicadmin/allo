CREATE OR REPLACE PACKAGE phenix.VTA_OPERATION_PACK IS

--************************************
--  gcl8034     HOURIA    2013-12-13    CREATION PACKAGE
----------------------------------------------------------------------------------
--  Fonction qui permet de dÃ©terminer si la grille de surcharge de carburant reliÃ©e Ã  vendor_transport_agreements
FUNCTION IS_LINKEDTO_FSG_FUNC(
  p_fsg_code  IN  fuel_surcharge_grids.fsg_code%TYPE
)
RETURN NUMBER;

END VTA_OPERATION_PACK;
/