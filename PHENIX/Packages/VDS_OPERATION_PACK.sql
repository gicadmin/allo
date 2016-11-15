CREATE OR REPLACE PACKAGE phenix.VDS_OPERATION_PACK IS

PROCEDURE PURGE_PROC(
    p_vds_id                    IN  VENDOR_DROP_STATEMENTS.VDS_ID%TYPE
);
--CSC8351 Vérifie si la clé unique de VENDOR_DROP_STATEMENTS, qui est : VDS_REFERENCE_NUMBER, VDS_VEN _CODE
FUNCTION EXIST_VEN_REF_FUNC(
  p_vds_whs_code					IN VARCHAR2,
  p_vds_ven_code          IN NUMBER,
  p_vds_reference_number  IN VARCHAR2,
  p_vds_id                IN NUMBER,
  p_ven_ou_ap             IN VARCHAR2,
  p_status                IN VARCHAR2 DEFAULT 'INSERT'

  ) RETURN BOOLEAN;
  END VDS_OPERATION_PACK;
/