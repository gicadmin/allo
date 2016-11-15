CREATE TABLE phenix.report_images (
  rpi_id NUMBER(15) NOT NULL,
  rpi_name VARCHAR2(30 BYTE) NOT NULL,
  rpi_description VARCHAR2(100 BYTE) NOT NULL,
  rpi_alt_description VARCHAR2(100 BYTE),
  rpi_image BLOB,
  CONSTRAINT rpi_pk PRIMARY KEY (rpi_id)
);
COMMENT ON TABLE phenix.report_images IS 'Table qui contient les images affichées dans les rapports';
COMMENT ON COLUMN phenix.report_images.rpi_id IS 'Indique l''identifiant';
COMMENT ON COLUMN phenix.report_images.rpi_name IS 'Indique le nom de l''image';
COMMENT ON COLUMN phenix.report_images.rpi_description IS 'Indique la description de l''image';
COMMENT ON COLUMN phenix.report_images.rpi_alt_description IS 'Indique la description alternative de l''image';
COMMENT ON COLUMN phenix.report_images.rpi_image IS 'Indique l''image';