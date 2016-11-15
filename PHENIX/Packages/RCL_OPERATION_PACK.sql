CREATE OR REPLACE PACKAGE phenix.RCL_OPERATION_PACK IS



PROCEDURE INSERT_WITH_ID_PROC(
  p_rcl_id                    IN         retail_clients.rcl_id%TYPE,
  p_rcl_name                  IN         retail_clients.rcl_name%TYPE,
  p_rcl_address               IN         retail_clients.rcl_address%TYPE,
  p_rcl_city                  IN         retail_clients.rcl_city%TYPE,
  p_rcl_prv_code              IN         retail_clients.rcl_prv_code%TYPE,
  p_rcl_postal_code           IN         retail_clients.rcl_postal_code%TYPE,
  p_rcl_telephone             IN         retail_clients.rcl_telephone%TYPE,
  p_rcl_contact_name          IN         retail_clients.rcl_contact_name%TYPE,
  p_rcl_email                 IN         retail_clients.rcl_email%TYPE                      DEFAULT NULL,
  p_rcl_fax_number            IN         retail_clients.rcl_fax_number%TYPE                 DEFAULT NULL,
  p_rcl_message               IN         retail_clients.rcl_message%TYPE                    DEFAULT NULL,
  p_rcl_qty_code              IN         retail_clients.rcl_qty_code%TYPE                   DEFAULT NULL,
  p_rcl_deletion_date         IN         retail_clients.rcl_deletion_date%TYPE              DEFAULT NULL,
  p_rcl_rlt_code              IN         retail_clients.rcl_rlt_code%TYPE                   DEFAULT NULL,
  p_rcl_rcm_code              IN         retail_clients.rcl_rcm_code%TYPE                   DEFAULT NULL,
  p_rcl_terms                 IN         retail_clients.rcl_terms%TYPE                      DEFAULT NULL,
  p_rcl_open_quotation_switch IN         retail_clients.rcl_open_quotation_switch%TYPE      DEFAULT 1 ,
  p_rcl_creation_date         IN         retail_clients.rcl_creation_date%TYPE              DEFAULT sysdate ,
  p_rcl_modification_date     IN         retail_clients.rcl_modification_date%TYPE          DEFAULT sysdate ,
  p_rcl_owner_type            IN         retail_clients.rcl_owner_type%TYPE                 DEFAULT 'I'
);

PROCEDURE UPDATE_PROC(
  p_rcl_id                    IN         retail_clients.rcl_id%TYPE,
  p_rcl_name                  IN         retail_clients.rcl_name%TYPE,
  p_rcl_address               IN         retail_clients.rcl_address%TYPE,
  p_rcl_city                  IN         retail_clients.rcl_city%TYPE,
  p_rcl_prv_code              IN         retail_clients.rcl_prv_code%TYPE,
  p_rcl_postal_code           IN         retail_clients.rcl_postal_code%TYPE,
  p_rcl_telephone             IN         retail_clients.rcl_telephone%TYPE,
  p_rcl_fax_number            IN         retail_clients.rcl_fax_number%TYPE,
  p_rcl_naz_nac_code          IN         retail_clients.rcl_naz_nac_code%TYPE,
  p_rcl_naz_zone_code         IN         retail_clients.rcl_naz_zone_code%TYPE ,
  p_rcl_qty_code              IN         retail_clients.rcl_qty_code%TYPE,
  p_rcl_terms                 IN         retail_clients.rcl_terms%TYPE,
  p_rcl_open_quotation_switch IN         retail_clients.rcl_open_quotation_switch%TYPE,
  p_rcl_deletion_date         IN         retail_clients.rcl_deletion_date%TYPE
);

--BEA53 fonction qui retourne le code de client à utiliser (différent lorsque le client et le code détaillant sont identiques..)
FUNCTION FIND_CUS_CODE_TO_USE_FUNC(
  p_rcl_id    IN NUMBER,
  p_cus_code  IN NUMBER,
  p_whs_code  IN VARCHAR2
)
RETURN NUMBER;

--bea53 valider que le ID sorti de la séquence n'est pas encore utilisé
FUNCTION FIND_ID_NOT_USED_FUNC
RETURN NUMBER;

END RCL_OPERATION_PACK;
/