CREATE OR REPLACE PACKAGE phenix.CGR_OPERATION_PACK IS

-------- verifie si c'est un groupe majeur qui veut dire : c'est un custome_group sans groupe majeur
FUNCTION IS_MAJOR_GROUP_FUNC(
  p_cgr_code IN customer_groups.cgr_code%TYPE
)
RETURN BOOLEAN;

---------verifie si c'est un groupe majeur d'un autre groupe qui veut dire : c'est un custome_group et c'est un groupe majeur d'un autre customer_groupe
FUNCTION IS_MAJOR_GROUP_OF_GROUP_FUNC(
  p_cgr_code IN customer_groups.cgr_code%TYPE
)
RETURN BOOLEAN;

PROCEDURE CHECK_MAJOR_GROUP_PROC(
  p_cgr_code IN customer_groups.cgr_code%TYPE
);

PROCEDURE CHECK_MAJOR_GROUP_OF_GRP_PROC(
  p_cgr_code IN customer_groups.cgr_code%TYPE
);

FUNCTION GET_FIRST_CUS_FUNC(
  p_cgr_code IN customer_groups.cgr_code%TYPE
)
RETURN NUMBER;

END CGR_OPERATION_PACK;
/