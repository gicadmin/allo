CREATE OR REPLACE package phenix.DYN_SQL_PACK IS

  TYPE t_select_desc IS RECORD(
        column_position         INTEGER,
        column_name             VARCHAR2(256),
        table_index             BINARY_INTEGER,
        table_code              VARCHAR2(15));

  TYPE t_tab_select_desc IS TABLE OF t_select_desc
       INDEX BY BINARY_INTEGER;

  TYPE t_tab_string IS TABLE OF varchar2(4096)
       INDEX BY BINARY_INTEGER;
  TYPE t_tab_number IS TABLE OF number
       INDEX BY BINARY_INTEGER;
  TYPE t_tab_date IS TABLE OF date
       INDEX BY BINARY_INTEGER;

  TYPE t_selector IS RECORD(
       iterator                 INTEGER,
       row_processed            INTEGER,
       descriptor               t_tab_select_desc,
       return_string            t_tab_string,
       return_number            t_tab_number,
       return_date              t_tab_date
       );

procedure RESET_PROC(
    p_selector                  IN OUT NOCOPY t_selector);

FUNCTION OPEN_FUNC(
    p_select_stmt               IN  VARCHAR2)
    RETURN t_selector;

FUNCTION FETCH_NEXT_PROC(
    p_selector                  IN OUT NOCOPY t_selector)
    RETURN INTEGER;

PROCEDURE CLOSE_PROC(
    p_selector                  IN OUT NOCOPY t_selector);

FUNCTION GET_COLUMN_VARCHAR2(
    p_selector                  IN            t_selector,
    p_column_name               IN  VARCHAR2)
    RETURN VARCHAR2;

FUNCTION GET_COLUMN_VARCHAR2(
    p_selector                  IN            t_selector,
    p_column_index              IN  INTEGER)
    RETURN VARCHAR2;

FUNCTION GET_COLUMN_NUMBER(
    p_selector                  IN            t_selector,
    p_column_name               IN  VARCHAR2)
    RETURN NUMBER;

FUNCTION GET_COLUMN_NUMBER(
    p_selector                  IN            t_selector,
    p_column_index              IN  INTEGER)
    RETURN NUMBER;

FUNCTION GET_COLUMN_DATE(
    p_selector                  IN            t_selector,
    p_column_name               IN  VARCHAR2)
    RETURN DATE;

FUNCTION GET_COLUMN_DATE(
    p_selector                  IN            t_selector,
    p_column_index              IN  INTEGER)
    RETURN DATE;

PROCEDURE SET_COLUMN_VARCHAR2(
    p_selector                  IN OUT NOCOPY t_selector,
    p_column_name               IN            VARCHAR2,
    p_value                     IN            VARCHAR2);

PROCEDURE SET_COLUMN_VARCHAR2(
    p_selector                  IN OUT NOCOPY t_selector,
    p_column_index              IN            INTEGER,
    p_value                     IN            VARCHAR2);

PROCEDURE SET_COLUMN_NUMBER(
    p_selector                  IN OUT NOCOPY t_selector,
    p_column_name               IN            VARCHAR2,
    p_value                     IN            NUMBER);

PROCEDURE SET_COLUMN_NUMBER(
    p_selector                  IN OUT NOCOPY t_selector,
    p_column_index              IN            INTEGER,
    p_value                     IN            NUMBER);

PROCEDURE SET_COLUMN_DATE(
    p_selector                  IN OUT NOCOPY t_selector,
    p_column_name               IN            VARCHAR2,
    p_value                     IN            DATE);

PROCEDURE SET_COLUMN_DATE(
    p_selector                  IN OUT NOCOPY t_selector,
    p_column_index              IN            INTEGER,
    p_value                     IN            DATE);

end DYN_SQL_PACK;
/