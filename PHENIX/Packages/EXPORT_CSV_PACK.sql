CREATE OR REPLACE package phenix.EXPORT_CSV_PACK IS

function EXPORT_FUNC(
    p_sql           IN  VARCHAR2,
    p_directory     IN  VARCHAR2,
    p_file_name     IN  VARCHAR2,
    p_open_mode     IN  VARCHAR2 DEFAULT 'W')
  RETURN NUMBER;    -- The number of rows exported (does not include headers)

procedure SET_DELIMITER_PROC(
    p_delimiter         IN  VARCHAR2);

procedure SET_FLOAT_DECIMAL_PROC(
    p_delimiter         IN  VARCHAR2);

--CSC7190
procedure SET_HEADER_PROC(
    p_header            IN  BOOLEAN);

PROCEDURE SET_COLUMN_APPEND_PROC(
    p_column_append     IN  VARCHAR2);

--CSC7379
PROCEDURE SET_END_LINE_DELIMITER_PROC(
    p_end_line_delimiter  IN  BOOLEAN);

end EXPORT_CSV_PACK;
/