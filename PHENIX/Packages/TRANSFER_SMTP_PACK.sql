CREATE OR REPLACE PACKAGE phenix.TRANSFER_SMTP_PACK IS

---
--- Permet l'envoie d'un courriel avec PDF en pièce jointe
--- Module  basé sur DEMOMAIL obtenu sur Metalink Doc ID 357385.1 en Janvier 2007
--- NOTE: Le code a été laissé tel quel sauf le paramètres smtp du PACKAGE SPECIFICATION
---

/* GIMAT		   DATE		  PROGRAMMEUR		DESCRIPTION
*  GIC1530	2007-02-23	C.Huard       Création du module
*  USG488	  2009-10-07  Thierry   	 Utilisation d'un serveur SMTP avec authentification.
*/

PROCEDURE ATTACH_TEXT_BASE64_PROC(
  p_conn       IN OUT NOCOPY utl_smtp.connection,
  p_boundary   IN VARCHAR2,
  p_data       IN VARCHAR2,
  p_mime_type  IN VARCHAR2,
  p_charset    IN VARCHAR2,
  p_last       IN BOOLEAN DEFAULT FALSE
);

PROCEDURE ATTACH_BODY_PROC(
  p_conn IN OUT NOCOPY UTL_SMTP.CONNECTION,
  p_text IN VARCHAR2
);

PROCEDURE ATTACHMENT_FROM_FILE_PROC(
  p_conn        IN OUT NOCOPY UTL_SMTP.CONNECTION,
  p_directory   IN VARCHAR2,
  p_filename    IN VARCHAR2,
  p_mime_type   IN VARCHAR2,
  p_as_filename IN VARCHAR2,
  p_last        IN BOOLEAN DEFAULT FALSE
);

PROCEDURE ATTACHMENT_FROM_BLOB_PROC(
  p_conn        IN OUT NOCOPY UTL_SMTP.CONNECTION,
  p_content     IN BLOB,
  p_mime_type   IN VARCHAR2,
  p_as_filename IN VARCHAR2,
  p_last        IN BOOLEAN DEFAULT FALSE
);

FUNCTION BEGIN_MAIL_PROC(
  p_sender          IN  VARCHAR2,
  p_recipients      IN  VARCHAR2,
  p_subject         IN  VARCHAR2,
  p_cc_recipients   IN  VARCHAR2     DEFAULT NULL,
  p_bcc_recipients  IN  VARCHAR2     DEFAULT NULL,
  p_priority        IN  PLS_INTEGER  DEFAULT NULL
)
RETURN UTL_SMTP.connection;

PROCEDURE END_MAIL_PROC(
  p_conn IN OUT NOCOPY utl_smtp.connection
);

PROCEDURE LOG_MAIL_SOURCE_PROC;

END TRANSFER_SMTP_PACK;
/