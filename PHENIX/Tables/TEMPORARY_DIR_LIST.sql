CREATE GLOBAL TEMPORARY TABLE phenix.temporary_dir_list (
  filename VARCHAR2(255 BYTE)
)
ON COMMIT DELETE ROWS;