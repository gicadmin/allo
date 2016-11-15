CREATE OR REPLACE PACKAGE phenix.DTR_PACK AS


PROCEDURE INIT_RECORD_PROC(
  p_rec                OUT NOCOPY  debug_traces%ROWTYPE);


PROCEDURE INSERT_PROC(
  p_dtr_seq               IN         debug_traces.dtr_seq%TYPE,
  p_dtr_source            IN         debug_traces.dtr_source%TYPE,
  p_dtr_backtrace         IN         debug_traces.dtr_backtrace%TYPE,
  p_dtr_message           IN         debug_traces.dtr_message%TYPE,
  p_dtr_sid               IN         debug_traces.dtr_sid%TYPE,
  p_dtr_serial            IN         debug_traces.dtr_serial%TYPE,
  p_dtr_username          IN         debug_traces.dtr_username%TYPE,
  p_dtr_program           IN         debug_traces.dtr_program%TYPE,
  p_dtr_client_info       IN         debug_traces.dtr_client_info%TYPE,
  p_dtr_logon_time        IN         debug_traces.dtr_logon_time%TYPE,
  p_dtr_client_identifier IN         debug_traces.dtr_client_identifier%TYPE,
  p_dtr_created_date      IN         debug_traces.dtr_created_date%TYPE           DEFAULT NULL);


PROCEDURE INSERT_PROC(
  p_rec           IN OUT NOCOPY debug_traces%ROWTYPE);

END DTR_PACK;
/