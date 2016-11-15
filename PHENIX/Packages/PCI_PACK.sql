CREATE OR REPLACE PACKAGE phenix.PCI_PACK IS

-- Fonction qui valide si la date de livraison client respecte la prochaine date de livraison fournisseur
FUNCTION VALIDATE_DELIVERY_DATE_FUNC(
  p_prd_code                IN products.prd_code%TYPE,
  p_whs_code                IN warehouses.whs_code%TYPE,
  p_cus_whs_code            IN customers.cus_whs_code%TYPE,
  p_delivery_date           IN DATE,
  p_ven_next_delivery_date  IN OUT DATE,
  p_ven_next_delivery_code  IN NUMBER
) RETURN BOOLEAN;

-- Retourne l'entrepÃ´t de cueillette selon l'entrepÃ´t de livraison et le produit
FUNCTION FIND_PICK_WAREHOUSE_FUNC(
  p_wsp_prw_whs_delivery_code IN warehouse_sellable_products.wsp_prw_whs_delivery_code%TYPE,
  p_wsp_prw_prd_code          IN warehouse_sellable_products.wsp_prw_prd_code%TYPE
)
RETURN VARCHAR2;

-- Retourne les informations de l'heure de tombÃ©e pour un produit
FUNCTION GET_VWG_FUNC(
  p_vwg_vwh_ven_code    IN vendor_warehouse_groups.vwg_vwh_ven_code%TYPE,
  p_vwg_vwh_whs_code    IN vendor_warehouse_groups.vwg_vwh_whs_code%TYPE,
  p_prd_code            IN products.prd_code%TYPE,
  p_vwg_rec             OUT NOCOPY vendor_warehouse_groups%ROWTYPE
)
RETURN PLS_INTEGER;

-- DÃ©termine si la vÃ©rification de la ligne bleue peut Ãªtre effectuÃ©e
FUNCTION VALIDATE_QTY_DATE_FUNC(
  p_prd_code                   IN products.prd_code%TYPE,
  p_fmt_code                   IN formats.fmt_code%TYPE,
  p_whs_code                   IN warehouses.whs_code%TYPE,
  p_cus_whs_code               IN customers.cus_whs_code%TYPE,
  p_delivery_date              IN DATE,
  p_ven_next_delivery_date     IN OUT DATE,
  p_ven_next_delivery_code     IN NUMBER,
  p_infinite_inventory_switch  IN NUMBER DEFAULT NULL,
  p_prd_special_order_switch   IN NUMBER DEFAULT NULL
) RETURN BOOLEAN;

-- Retourne si l'inventaire du produit/format/entrepÃ´t est infini ou non
FUNCTION FIND_INFINITE_INVENTORY_FUNC(
  p_prd_code  IN VARCHAR2,
  p_fmt_code  IN VARCHAR2,
  p_whs_code  IN VARCHAR2
)
RETURN NUMBER;

-- Retourne les taux et montants des taxes
PROCEDURE FIND_SALES_TAX_PROC(p_prd_code           IN  products.prd_code%TYPE
                             ,p_whs_code           IN  warehouses.whs_code%TYPE
                             ,p_cus_code           IN  customers.cus_code%TYPE
                             ,p_sale_price         IN  NUMBER
                             ,p_prov_tax_amount    OUT NUMBER
                             ,p_fed_tax_amount     OUT NUMBER
                             ,p_prov_tax_rate      OUT NUMBER
                             ,p_fed_tax_rate       OUT NUMBER
                             ,p_tax_transport      IN  VARCHAR2 DEFAULT NULL);

FUNCTION GET_VTT_DOCUMENTS_FUNC(
    p_vtt_id    IN  vendor_transport_transactions.vtt_id%TYPE,
    p_doc_code  IN  VARCHAR2
)
RETURN BLOB;

FUNCTION CHECK_SPJ_NAME_CONTEXT_FUNC (
    p_spj_name       IN SYSTEM_PROJECTS.SPJ_NAME%TYPE,
    p_spj_context    IN SYSTEM_PROJECTS.SPJ_CONTEXT%TYPE
)
RETURN NUMBER;

FUNCTION GET_CONF_BY_NAME_CONTEXT_FUNC (
    p_spj_name       IN SYSTEM_PROJECTS.SPJ_NAME%TYPE,
    p_spj_context    IN SYSTEM_PROJECTS.SPJ_CONTEXT%TYPE
)
RETURN SYS_REFCURSOR;

PROCEDURE TRANSFER_ORD_FILE_PROC (
  p_elements    IN INTEGER,
  p_files_clob  IN CLOB
);

FUNCTION GET_NEXT_DELIVERY_DATE_FUNC(
  p_cus_code           IN customers.cus_code%TYPE,
  p_start_date         IN DATE,
  p_delivery_type_flag IN customer_order_headers.coh_delivery_type_flag%TYPE
) RETURN DATE;

FUNCTION VALIDATE_DELIVERY_DATE_FUNC(
  p_cus_code              IN customers.cus_code%TYPE,
  p_entered_delivery_date IN DATE,
  p_delivery_type_flag    IN customer_order_headers.coh_delivery_type_flag%TYPE
) RETURN BOOLEAN;

FUNCTION DELETE_PUC_FUNC(
  p_puc_pus_id   IN pci_user_customers.puc_pus_id%TYPE,
  p_puc_cus_code IN pci_user_customers.puc_cus_code%TYPE
)
RETURN NUMBER;

FUNCTION DELETE_PUC_FUNC(
  p_puc_pus_id IN pci_user_customers.puc_pus_id%TYPE
)
RETURN NUMBER;

PROCEDURE INSERT_PUC_PROC(
  p_puc_pus_id   IN pci_user_customers.puc_pus_id%TYPE,
  p_puc_cus_code IN pci_user_customers.puc_cus_code%TYPE,
  p_puc_pcro_id  IN pci_user_customers.puc_pcro_id%TYPE
);

FUNCTION DELETE_PUS_FUNC(
  p_pus_id IN pci_users.pus_id%TYPE
)
RETURN NUMBER;


FUNCTION INSERT_PUS_FUNC(
  p_pus_first_name              IN pci_users.pus_first_name%TYPE,
  p_pus_last_connection_date    IN pci_users.pus_last_connection_date%TYPE,
  p_pus_active_switch           IN pci_users.pus_active_switch%TYPE,
  p_pus_first_connection_switch IN pci_users.pus_first_connection_switch%TYPE,
  p_pus_last_name               IN pci_users.pus_last_name%TYPE               DEFAULT NULL,
  p_pus_title                   IN pci_users.pus_title%TYPE                   DEFAULT NULL,
  p_pus_email                   IN pci_users.pus_email%TYPE                   DEFAULT NULL,
  p_pus_password                IN pci_users.pus_password%TYPE                DEFAULT NULL,
  p_pus_use_code                IN pci_users.pus_use_code%TYPE                DEFAULT NULL,
  p_pus_creation_date           IN pci_users.pus_creation_date%TYPE           DEFAULT SYSDATE,
  p_pus_modification_date       IN pci_users.pus_modification_date%TYPE       DEFAULT SYSDATE
)
RETURN NUMBER;

FUNCTION DELETE_PCRO_FUNC(
  p_pcro_id IN pci_roles.pcro_id%TYPE
)
RETURN NUMBER;


FUNCTION INSERT_PCRO_FUNC(
  p_pcro_name               IN pci_roles.pcro_name%TYPE,
  p_pcro_active_switch      IN pci_roles.pcro_active_switch%TYPE,
  p_pcro_master_role_switch IN pci_roles.pcro_master_role_switch%TYPE,
  p_pcro_owned_by_cus_code  IN pci_roles.pcro_owned_by_cus_code%TYPE,
  p_pcro_pcro_id            IN pci_roles.pcro_pcro_id%TYPE             DEFAULT NULL,
  p_pcro_alt_name           IN pci_roles.pcro_alt_name%TYPE            DEFAULT NULL,
  p_pcro_creation_date      IN pci_roles.pcro_creation_date%TYPE       DEFAULT SYSDATE ,
  p_pcro_modification_date  IN pci_roles.pcro_modification_date%TYPE   DEFAULT SYSDATE
)
RETURN NUMBER;

FUNCTION DELETE_PFE_FUNC(
  p_pfe_code IN pci_features.pfe_code%TYPE
)
RETURN NUMBER;

PROCEDURE INSERT_PFE_PROC(
  p_pfe_code                 IN pci_features.pfe_code%TYPE,
  p_pfe_name                 IN pci_features.pfe_name%TYPE,
  p_pfe_description          IN pci_features.pfe_description%TYPE,
  p_pfe_active_switch        IN pci_features.pfe_active_switch%TYPE,
  p_pfe_default_value_switch IN pci_features.pfe_default_value_switch%TYPE,
  p_pfe_alt_name             IN pci_features.pfe_alt_name%TYPE              DEFAULT NULL,
  p_pfe_alt_description      IN pci_features.pfe_alt_description%TYPE       DEFAULT NULL,
  p_pfe_creation_date        IN pci_features.pfe_creation_date%TYPE         DEFAULT SYSDATE ,
  p_pfe_modification_date    IN pci_features.pfe_modification_date%TYPE     DEFAULT SYSDATE
);

FUNCTION DELETE_PAU_FUNC(
  p_pau_id IN pci_audits.pau_id%TYPE
)
RETURN NUMBER;


FUNCTION INSERT_PAU_FUNC(
  p_pau_pus_id         IN pci_audits.pau_pus_id%TYPE,
  p_pau_ip             IN pci_audits.pau_ip%TYPE,
  p_pau_operation      IN pci_audits.pau_operation%TYPE,
  p_pau_messages       IN pci_audits.pau_messages%TYPE,
  p_pau_creation_date  IN pci_audits.pau_creation_date%TYPE DEFAULT SYSDATE
)
RETURN NUMBER;

FUNCTION DELETE_PCRF_FUNC(
  p_pcrf_pfe_code IN pci_role_features.pcrf_pfe_code%TYPE,
  p_pcrf_pcro_id  IN pci_role_features.pcrf_pcro_id%TYPE
)
RETURN NUMBER;

FUNCTION DELETE_PCRF_FUNC(
  p_pcrf_pcro_id IN pci_role_features.pcrf_pcro_id%TYPE
)
RETURN NUMBER;

PROCEDURE INSERT_PCRF_PROC(
  p_pcrf_pfe_code IN pci_role_features.pcrf_pfe_code%TYPE,
  p_pcrf_pcro_id  IN pci_role_features.pcrf_pcro_id%TYPE
);

PROCEDURE UPDATE_PCRO_PROC(
  p_pcro_id                 IN pci_roles.pcro_id%TYPE,
  p_pcro_name               IN pci_roles.pcro_name%TYPE,
  p_pcro_alt_name           IN pci_roles.pcro_alt_name%TYPE,
  p_pcro_active_switch      IN pci_roles.pcro_active_switch%TYPE,
  p_pcro_owned_by_cus_code  IN pci_roles.pcro_owned_by_cus_code%TYPE,
  p_pcro_pcro_id            IN pci_roles.pcro_pcro_id%TYPE,
  p_pcro_modification_date  IN pci_roles.pcro_modification_date%TYPE DEFAULT SYSDATE
);

PROCEDURE UPDATE_PUS_PROC(
  p_pus_id                 IN pci_users.pus_id%TYPE,
  p_pus_use_code           IN pci_users.pus_use_code%TYPE,
  p_pus_first_name         IN pci_users.pus_first_name%TYPE,
  p_pus_last_name          IN pci_users.pus_last_name%TYPE,
  p_pus_active_switch      IN pci_users.pus_active_switch%TYPE,
  p_pus_title              IN pci_users.pus_title%TYPE,
  p_pus_email              IN pci_users.pus_email%TYPE,
  p_pus_password           IN pci_users.pus_password%TYPE,
  p_pus_modification_date  IN pci_users.pus_modification_date%TYPE DEFAULT SYSDATE
);

PROCEDURE UPDATE_PFE_PROC(
  p_pfe_code                 IN pci_features.pfe_code%TYPE,
  p_pfe_name                 IN pci_features.pfe_name%TYPE,
  p_pfe_alt_name             IN pci_features.pfe_alt_name%TYPE,
  p_pfe_description          IN pci_features.pfe_description%TYPE,
  p_pfe_alt_description      IN pci_features.pfe_alt_description%TYPE,
  p_pfe_active_switch        IN pci_features.pfe_active_switch%TYPE,
  p_pfe_default_value_switch IN pci_features.pfe_default_value_switch%TYPE,
  p_pfe_modification_date    IN pci_features.pfe_modification_date%TYPE DEFAULT SYSDATE
);

FUNCTION DELETE_PUV_FUNC(
  p_puv_pus_id   IN pci_user_vendors.puv_pus_id%TYPE,
  p_puv_ven_code IN pci_user_vendors.puv_ven_code%TYPE
)
RETURN NUMBER;

PROCEDURE INSERT_PUV_PROC(
  p_puv_pus_id   IN pci_user_vendors.puv_pus_id%TYPE,
  p_puv_ven_code IN pci_user_vendors.puv_ven_code%TYPE,
  p_puv_pcro_id  IN pci_user_vendors.puv_pcro_id%TYPE
);

FUNCTION CRYPT_FUNC(
  p_use_password IN VARCHAR2
)
RETURN VARCHAR2;

PROCEDURE ACTIVE_PUS_PROC(
  p_pus_id            IN pci_users.pus_id%TYPE,
  p_pus_active_switch IN pci_users.pus_active_switch%TYPE
);

PROCEDURE SET_PUS_LAST_CONNECTION_PROC(
  p_pus_id                   IN pci_users.pus_id%TYPE,
  p_pus_last_connection_date IN pci_users.pus_last_connection_date%TYPE
);

PROCEDURE SET_PUS_PASSWORD_PROC(
  p_pus_id                      IN pci_users.pus_id%TYPE,
  p_pus_password                IN pci_users.pus_password%TYPE,
  p_pus_first_connection_switch IN pci_users.pus_first_connection_switch%TYPE
);

FUNCTION DELETE_PCDL_FUNC(
  p_pcdl_id IN pci_customer_display_lists.pcdl_id%TYPE
)
RETURN NUMBER;

FUNCTION INSERT_PCDL_FUNC(
  p_pcdl_description     IN pci_customer_display_lists.pcdl_description%TYPE,
  p_pcdl_cus_code        IN pci_customer_display_lists.pcdl_cus_code%TYPE,
  p_pcdl_alt_description IN pci_customer_display_lists.pcdl_alt_description%TYPE DEFAULT NULL
)
RETURN NUMBER;

PROCEDURE UPDATE_PCDL_PROC(
  p_pcdl_id              IN pci_customer_display_lists.pcdl_id%TYPE,
  p_pcdl_description     IN pci_customer_display_lists.pcdl_description%TYPE,
  p_pcdl_alt_description IN pci_customer_display_lists.pcdl_alt_description%TYPE DEFAULT NULL
);

FUNCTION DELETE_PCDS_FUNC(
  p_pcds_id IN pci_customer_display_sequences.pcds_id%TYPE
)
RETURN NUMBER;

FUNCTION INSERT_PCDS_FUNC(
  p_pcds_pcdl_id      IN pci_customer_display_sequences.pcds_pcdl_id%TYPE,
  p_pcds_prf_prd_code IN pci_customer_display_sequences.pcds_prf_prd_code%TYPE,
  p_pcds_prf_fmt_code IN pci_customer_display_sequences.pcds_prf_fmt_code%TYPE,
  p_pcds_sequence     IN pci_customer_display_sequences.pcds_sequence%TYPE
)
RETURN NUMBER;

PROCEDURE UPDATE_PCDS_PROC(
  p_pcds_id       IN pci_customer_display_sequences.pcds_id%TYPE,
  p_pcds_sequence IN pci_customer_display_sequences.pcds_sequence%TYPE
);

FUNCTION GET_PRD_CODE_FUNC(
  p_cus_code IN customers.cus_code%TYPE,
  p_pxc_code IN product_xref_codes.pxc_code%TYPE
) RETURN VARCHAR2;

FUNCTION GET_PXC_CODE_FUNC(
  p_cus_code     IN customers.cus_code%TYPE,
  p_pxc_prd_code IN product_xref_codes.pxc_prd_code%TYPE,
  p_pxc_fmt_code IN product_xref_codes.pxc_fmt_code%TYPE
)
RETURN VARCHAR2;

FUNCTION DELETE_PUV_FUNC(
  p_puv_pus_id IN pci_user_vendors.puv_pus_id%TYPE
)
RETURN NUMBER;

END PCI_PACK;
/