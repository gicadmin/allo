CREATE OR REPLACE PACKAGE phenix.VTL_OPERATION_PACK IS
PROCEDURE VALID_BOUNDARY_PROC (
                p_vtl_vtr_id  IN vendor_transport_levels.vtl_vtr_id%TYPE,
                p_vtl_id      IN vendor_transport_levels.vtl_id%TYPE,
                p_vtl_lower   IN vendor_transport_levels.vtl_lower_boundary%TYPE,
                p_vtl_upper   IN vendor_transport_levels.vtl_upper_boundary%TYPE);

END VTL_OPERATION_PACK;
/