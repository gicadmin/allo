CREATE OR REPLACE PACKAGE phenix.ames_operation_pack AS

  PROCEDURE external_message_proc(
    p_start_date              IN          application_messages.AMES_START_DATE%TYPE,
    p_end_date                IN          application_messages.AMES_END_DATE%TYPE,
    p_mess_text               IN          multi_lang_messages.MLM_MESSAGE%TYPE,
    p_mess_text_en            IN          multi_lang_messages.MLM_MESSAGE%TYPE
    );

  FUNCTION create_func(
    p_start_date              IN          application_messages.AMES_START_DATE%TYPE,
    p_end_date                IN          application_messages.AMES_END_DATE%TYPE,
    p_status                  IN          application_messages.AMES_STATUS%TYPE,
    p_type                    IN          application_messages.ames_type%TYPE,
    p_mess_text               IN          multi_lang_messages.MLM_MESSAGE%TYPE,
    p_mess_text_en            IN          multi_lang_messages.MLM_MESSAGE%TYPE
    ) return application_messages.AMES_ID%TYPE;

  PROCEDURE delete_proc(
    p_ames_id                 IN          application_messages.AMES_ID%TYPE);

  PROCEDURE change_status_proc(
    p_ames_id                 IN          application_messages.AMES_ID%TYPE,
    p_status                  IN          application_messages.AMES_STATUS%TYPE);

  FUNCTION copy_func(
    p_ames_id                 IN          application_messages.AMES_ID%TYPE
    ) return application_messages.AMES_ID%TYPE;

  PROCEDURE modify_proc(
    p_ames_id                 IN          application_messages.ames_id%TYPE,
    p_start_date              IN          application_messages.AMES_START_DATE%TYPE,
    p_end_date                IN          application_messages.AMES_END_DATE%TYPE,
    p_type                    IN          application_messages.ames_type%TYPE,
    p_mess_text               IN          multi_lang_messages.MLM_MESSAGE%TYPE,
    p_mess_text_en            IN          multi_lang_messages.MLM_MESSAGE%TYPE
    );


END;
/