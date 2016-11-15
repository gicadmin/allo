CREATE OR REPLACE PACKAGE phenix.DYNAMIC_PACK AS

FUNCTION FORMAT_HEADER_FUNC(
  p_header IN VARCHAR2
)
RETURN VARCHAR2;

FUNCTION FORMAT_VALUE_FUNC(
  p_line  IN VARCHAR2,
  p_value IN VARCHAR2
)
RETURN VARCHAR2;

FUNCTION FORMAT_ERROR_FUNC(
  p_error     IN VARCHAR2,
  p_separator IN VARCHAR2
)
RETURN VARCHAR2;

FUNCTION GET_UNIQUE_HEADER_FUNC(
  p_table_name IN VARCHAR2,
  p_separator  IN VARCHAR2,
  p_alias      IN VARCHAR2 DEFAULT NULL
)
RETURN VARCHAR2;

FUNCTION GET_UNIQUE_HEADER_FUNC(
  p_constraint_name IN VARCHAR2,
  p_separator       IN VARCHAR2,
  p_alias           IN VARCHAR2 DEFAULT NULL
)
RETURN VARCHAR2;

FUNCTION GET_UNIQUE_NEW_HEADER_FUNC(
  p_constraint_name IN VARCHAR2,
  p_separator       IN VARCHAR2,
  p_alias           IN VARCHAR2 DEFAULT NULL
)
RETURN VARCHAR2;

FUNCTION GET_UNIQUE_OLD_HEADER_FUNC(
  p_constraint_name IN VARCHAR2,
  p_separator       IN VARCHAR2,
  p_alias           IN VARCHAR2 DEFAULT NULL
)
RETURN VARCHAR2;

FUNCTION GET_UNIQUE_VALUE_FUNC(
  p_table_name IN VARCHAR2,
  p_line       IN VARCHAR2,
  p_header     IN VARCHAR2,
  p_separator  IN VARCHAR2
)
RETURN VARCHAR2;

FUNCTION GET_UNIQUE_VALUE_FUNC(
  p_constraint_name IN VARCHAR2,
  p_line            IN VARCHAR2,
  p_header          IN VARCHAR2,
  p_separator       IN VARCHAR2
)
RETURN VARCHAR2;

FUNCTION GET_UNIQUE_NEW_VALUE_FUNC(
  p_constraint_name IN VARCHAR2,
  p_line            IN VARCHAR2,
  p_header          IN VARCHAR2,
  p_separator       IN VARCHAR2
)
RETURN VARCHAR2;

FUNCTION GET_UNIQUE_OLD_VALUE_FUNC(
  p_constraint_name IN VARCHAR2,
  p_line            IN VARCHAR2,
  p_header          IN VARCHAR2,
  p_separator       IN VARCHAR2
)
RETURN VARCHAR2;

FUNCTION GET_UNIQUE_CONSTRAINT_FUNC(
  p_table_name IN VARCHAR2
)
RETURN VARCHAR2;

FUNCTION GET_UNIQUE_COLUMNS_FUNC(
  p_table_name IN VARCHAR2,
  p_separator  IN VARCHAR2 DEFAULT ','
)
RETURN VARCHAR2;

FUNCTION GET_CONSTRAINT_COLUMNS_FUNC(
  p_constraint_name IN VARCHAR2,
  p_separator       IN VARCHAR2 DEFAULT ','
)
RETURN VARCHAR2;

FUNCTION GET_SET_COMMAND_FUNC(
  p_table_name      IN VARCHAR2,
  p_alias_to_check  IN VARCHAR2,
  p_line            IN VARCHAR2,
  p_header          IN VARCHAR2,
  p_separator       IN VARCHAR2
)
RETURN VARCHAR2;

FUNCTION GET_SET_COMMAND_FUNC(
  p_table_name      IN VARCHAR2,
  p_constraint_name IN VARCHAR2,
  p_alias_to_check  IN VARCHAR2,
  p_line            IN VARCHAR2,
  p_header          IN VARCHAR2,
  p_separator       IN VARCHAR2
)
RETURN VARCHAR2;

FUNCTION GET_SET_COMMAND_FUNC(
  p_constraint_name IN VARCHAR2,
  p_alias_to_check  IN VARCHAR2,
  p_line            IN VARCHAR2,
  p_header          IN VARCHAR2,
  p_separator       IN VARCHAR2
)
RETURN VARCHAR2;

FUNCTION GET_WHERE_COMMAND_FUNC(
  p_table_name      IN VARCHAR2,
  p_constraint_name IN VARCHAR2,
  p_alias_to_check  IN VARCHAR2,
  p_line            IN VARCHAR2,
  p_header          IN VARCHAR2,
  p_separator       IN VARCHAR2
)
RETURN VARCHAR2;

FUNCTION GET_WHERE_COMMAND_FUNC(
  p_table_name      IN VARCHAR2,
  p_alias_to_check  IN VARCHAR2,
  p_line            IN VARCHAR2,
  p_header          IN VARCHAR2,
  p_separator       IN VARCHAR2
)
RETURN VARCHAR2;

FUNCTION GET_WHERE_COMMAND_FUNC(
  p_constraint_name IN VARCHAR2,
  p_alias_to_check  IN VARCHAR2,
  p_line            IN VARCHAR2,
  p_header          IN VARCHAR2,
  p_separator       IN VARCHAR2
)
RETURN VARCHAR2;

FUNCTION GET_TABLE_NAME_FUNC(
  p_constraint_name IN VARCHAR2
)
RETURN VARCHAR2;

FUNCTION GET_ALIAS_TABLE_FUNC(
  p_table_name IN VARCHAR2
)
RETURN VARCHAR2;

FUNCTION GET_ALIAS_TABLE_FUNC(
  p_constraint_name IN VARCHAR2
)
RETURN VARCHAR2;

FUNCTION EXTRACT_CONSTRAINT_NAME(
  p_sqlerrm IN VARCHAR2
)
RETURN VARCHAR2;

END DYNAMIC_PACK;
/