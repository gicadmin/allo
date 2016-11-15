CREATE OR REPLACE PACKAGE phenix.ACCPAC_CIGAR_AND_VBD_TOB_PACK IS

--USG323 changement de facon de calculer la taxe par le gouvernement fédérale
PROCEDURE AP_VEND_CIGAR_PROC (
	p_inh_id IN NUMBER
);

--USG323 procédure pour poster les taxes des cigarettes qui sont renvoyés au fournisseur
PROCEDURE AP_TOBACCO_VENDOR_BILLING_PROC (
	p_inh_id IN NUMBER
);

END ACCPAC_CIGAR_AND_VBD_TOB_PACK;
/