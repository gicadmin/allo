CREATE OR REPLACE FORCE VIEW phenix.gpu_utilisateur (login,nom,prenom,motpasse,superviseur,motpasseasaisir,idutilisateur,photo,"TÉLÉPHONE") AS
SELECT CAST (use_login AS NVARCHAR2 (255)) LOGIN,
          use_last_name NOM,
          use_first_name PRENOM,
          GENERIC_PACK.DECRYPT_FUNCT (use_password) MOTPASSE,
          DECODE (use_sgr_code, 'ADMIN', 1, 0) SUPERVISEUR,
          0 MOTPASSEASAISIR,
          use_code IDUTILISATEUR,
          to_blob (NULL) PHOTO,
          use_telephone "TÉLÉPHONE"
     FROM users
    WHERE use_login IS NOT NULL;