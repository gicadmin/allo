CREATE OR REPLACE PACKAGE phenix.DYNAMIC_LOAD_PACK AS

tempCustomersRecord            customers%ROWTYPE;
tempContactsRecord             contacts%ROWTYPE;
tempVendorsRecord              vendors%ROWTYPE;
tempVendorAddressesRecord      vendor_addresses%ROWTYPE;
tempCustomerProfilesRecord     customer_profiles%ROWTYPE;
tempCustomerProfileWeeksRecord customer_profile_weeks%ROWTYPE;
tempVendorProductsRecord       vendor_products%ROWTYPE;

PROCEDURE LOAD_CUSTOMER_PROC(
  p_add_contacts BOOLEAN  DEFAULT TRUE,
  p_separator    VARCHAR2 DEFAULT ';'
);

PROCEDURE LOAD_HEAD_OFFICE_PROC;
PROCEDURE LOAD_VENDOR_PROC;
PROCEDURE LOAD_VENDOR_ADDRESSE_PROC;

PROCEDURE LOAD_DYNAMIC_PROC(
  p_table_name    IN VARCHAR2,
  p_table_alias   IN VARCHAR2 DEFAULT NULL,
  p_file_name     IN VARCHAR2 DEFAULT NULL,
  p_file_name_out IN VARCHAR2 DEFAULT NULL,
  p_format_date   IN VARCHAR2 DEFAULT 'YYYY-MM-DD',
  p_separator     IN VARCHAR2 DEFAULT ';'
);

END DYNAMIC_LOAD_PACK;
/