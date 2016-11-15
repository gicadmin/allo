CREATE OR REPLACE PACKAGE phenix.IMPORT_FILE_PACK IS

/*-----------------------------------------------------------------------
  Using the callback procedure :
    To process the data from the external table you MUST provide the name of
    your callback procedure. For each row processed from the external table your
    procedure will be call. In that procedure you can the call the getter fonction
    provided below to obtain the columns values from the current record.

    For example :
        PACKAGE FOO
        ...
        PROCEDURE PROCESS_ROW_PROC IS
        BEGIN
            -- I can now get the data from the external table. Either by column name :
            dbms_output.put_line(IMPORT_FILE_PACK.PROCESS_PROC.GET_COLUMN_VARCHAR('column_name'));
            -- Or by column number
            dbms_output.put_line(IMPORT_FILE_PACK.PROCESS_PROC.GET_COLUMN_VARCHAR(1));
        END PROCESS_ROW_PROC;

        PROCEDURE MY_PROCESSING...
        BEGIN
          IMPORT_FILE_PACK.PROCESS_PROC(
            p_directory => 'NEWIN',
            p_file_name => 'mydata.csv',
            p_context => 'MYDATA',
            p_callback => 'FOO.PROCESS_ROW_PROC');
        END MY_PROCESSING;
        END;
-----------------------------------------------------------------------*/

PROCEDURE SET_ERROR_TABLE_PROC(
  p_err_table         IN  VARCHAR2,
  p_err_column        IN  VARCHAR2);

PROCEDURE PROCESS_PROC(
  p_directory         IN  VARCHAR2,
  p_file_name         IN  VARCHAR2,
  p_context           IN  SYSTEM_PROJECTS.SPJ_CONTEXT%TYPE,
  p_callback          IN  VARCHAR2);

FUNCTION EXPORT_ERRORS_PROC(
  p_directory         IN  VARCHAR2,
  p_file_name         IN  VARCHAR2,
  p_drop_table        IN  BOOLEAN DEFAULT TRUE)
  RETURN NUMBER;

/*-----------------------------------------------------------------------
  You can only use these function from within your callback procedure
  passed to the PROCESS_PROC.
-----------------------------------------------------------------------*/
PROCEDURE REJECT_PROC(
    p_error_msg         IN  VARCHAR2);

FUNCTION GET_COLUMN_VARCHAR2(
  p_column_name               IN  VARCHAR2)
  RETURN VARCHAR2;

FUNCTION GET_COLUMN_VARCHAR2(
  p_column_index              IN  INTEGER)
  RETURN VARCHAR2;

FUNCTION GET_COLUMN_NUMBER(
  p_column_name               IN  VARCHAR2)
  RETURN NUMBER;

FUNCTION GET_COLUMN_NUMBER(
  p_column_index              IN  INTEGER)
  RETURN NUMBER;

FUNCTION GET_COLUMN_DATE(
  p_column_name               IN  VARCHAR2)
  RETURN DATE;

FUNCTION GET_COLUMN_DATE(
  p_column_index              IN  INTEGER)
  RETURN DATE;

PROCEDURE SET_COLUMN_VARCHAR2(
    p_column_name               IN            VARCHAR2,
    p_value                     IN            VARCHAR2);

PROCEDURE SET_COLUMN_VARCHAR2(
    p_column_index              IN            INTEGER,
    p_value                     IN            VARCHAR2);

PROCEDURE SET_COLUMN_NUMBER(
    p_column_name               IN            VARCHAR2,
    p_value                     IN            NUMBER);

PROCEDURE SET_COLUMN_NUMBER(
    p_column_index              IN            INTEGER,
    p_value                     IN            NUMBER);

PROCEDURE SET_COLUMN_DATE(
    p_column_name               IN            VARCHAR2,
    p_value                     IN            DATE);

PROCEDURE SET_COLUMN_DATE(
    p_column_index              IN            INTEGER,
    p_value                     IN            DATE);

END IMPORT_FILE_PACK;
/