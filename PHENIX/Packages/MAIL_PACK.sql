CREATE OR REPLACE PACKAGE phenix.MAIL_PACK AS

  --CSC7190 Création des types
  TYPE t_attach_file IS RECORD(
    directory_name  VARCHAR2(64),
    filename        VARCHAR2(256),
    mime_type_bin   VARCHAR2(1000),
    as_filename     VARCHAR2(256),
    size_file       NUMBER := 0
  );

  TYPE t_list_attach_file IS TABLE OF t_attach_file;

  TYPE t_attach_blob IS RECORD(
    filename       VARCHAR2(256),
    content        BLOB,
    mime_type_bin  VARCHAR2(1000),
    as_filename    VARCHAR2(256),
    size_blob      NUMBER := 0
  );

  TYPE t_list_attach_blob IS TABLE OF t_attach_blob;

  TYPE t_mail_information IS RECORD(
    from_email     VARCHAR2(10000),
    to_email       VARCHAR2(10000),
    cc_email       VARCHAR2(10000),
    bcc_email      VARCHAR2(10000),
    subject_email  VARCHAR2(10000),
    body_email     VARCHAR2(10000),
    size_attach    NUMBER := 0,
    attach_file    t_list_attach_file := t_list_attach_file(),
    attach_blob    t_list_attach_blob := t_list_attach_blob()
  );

--Procédure qui crée les emails
PROCEDURE CREATE_PROC(
  p_mail_information  IN OUT T_MAIL_INFORMATION,
  p_from_email        IN VARCHAR2,
  p_to_email          IN VARCHAR2,
  p_subject_email     IN VARCHAR2,
  p_body_email        IN VARCHAR2,
  p_cc_email          IN VARCHAR2 DEFAULT NULL,
  p_bcc_email         IN VARCHAR2 DEFAULT NULL
);

--Procédure qui attache les fichiers et les BLOB
PROCEDURE ATTACH_PROC(
  p_mail_information  IN OUT T_MAIL_INFORMATION,
  p_directory         IN VARCHAR2,
  p_file_name         IN VARCHAR2,
  p_mime_type_bin     IN VARCHAR2 DEFAULT 'application/pdf',
  p_as_file_name      IN VARCHAR2 DEFAULT NULL
);

PROCEDURE ATTACH_PROC(
  p_mail_information  IN OUT T_MAIL_INFORMATION,
  p_file_name         IN VARCHAR2,
  p_blob              IN BLOB,
  p_mime_type_bin     IN VARCHAR2 DEFAULT 'application/pdf',
  p_as_file_name      IN VARCHAR2 DEFAULT NULL
);

--Fonction qui envoie les emails
FUNCTION SENDMAIL_FUNC(
  p_mail_information  IN T_MAIL_INFORMATION
)
RETURN NUMBER;

PROCEDURE SENDMAIL_PROC(
  p_mail_information  IN T_MAIL_INFORMATION
);
PROCEDURE SEND_FILE_PROC(
  p_mail           IN OUT T_MAIL_INFORMATION,
  p_from_email     IN VARCHAR2,
  p_to_email       IN VARCHAR2,
  p_lang_code      IN VARCHAR2,
  p_directory_name IN VARCHAR2,
  p_file_name      IN VARCHAR2,
  p_as_file_name   IN VARCHAR2 DEFAULT NULL
);

PROCEDURE SEND_FILE_PROC(
  p_mail           IN OUT T_MAIL_INFORMATION,
  p_from_email     IN VARCHAR2,
  p_to_email       IN VARCHAR2,
  p_subject_email  IN VARCHAR2,
  p_body_email     IN VARCHAR2,
  p_directory_name IN VARCHAR2,
  p_file_name      IN VARCHAR2,
  p_mime_type_bin  IN VARCHAR2,
  p_as_file_name   IN VARCHAR2 DEFAULT NULL,
  p_cc_email       IN VARCHAR2 DEFAULT NULL,
  p_bcc_email      IN VARCHAR2 DEFAULT NULL
);

END MAIL_PACK;
/