CREATE TABLE phenix.temporary_catalog_prints (
  tcp_sequence NUMBER(5),
  tcp_page NUMBER(4),
  tcp_description VARCHAR2(30 BYTE)
);
COMMENT ON TABLE phenix.temporary_catalog_prints IS 'Table temporarire servant à l''impression des index des bottins';
COMMENT ON COLUMN phenix.temporary_catalog_prints.tcp_sequence IS 'Numéro de séquence';
COMMENT ON COLUMN phenix.temporary_catalog_prints.tcp_page IS 'Numéro de page';
COMMENT ON COLUMN phenix.temporary_catalog_prints.tcp_description IS 'Description';