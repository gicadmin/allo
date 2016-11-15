CREATE OR REPLACE package phenix.SRW is
-- ==========================================================================
-- Title   :  event-based reporting API
-- Purpose :  This API enables the user to trigger reports from within the
--            database. It offers seven published functions
--            ADD_PARAMETER    ... Add a parameter to a parameter-list
--            REMOVE_PARAMETER ... remove a parameter from a list
--            CLEAR_PARAMETER  ... remove ALL entries from a parameter-list
--            BUILD_URL        ... build a syntactical correct URL
--            RUN_REPORT       ... for sending a requests to the server
--            REPORT_STATUS    ... for getting the status of a given job
--            CANCEL_REPORT    ... to cancel a job
-- --------------------------------------------------------------------------
-- Author  :  Philipp Weckerle
-- --------------------------------------------------------------------------
--
-- DEPENDENCIES
-- ------------
--   *) Oracle XDK (Parser and DOM)
--   *) User-defined types SRW_PARAMETER and SRW_PARAMLIST
--
-- Installation :
--   this script is invoked by the installation-script SRWAPIINS.SQL
--
-- HISTORY
-- Date     | Done by     | Task
-- ---------+-------------+--------------------------------------------------
-- 15-09-00 | PWECKERL.AT | First API-Version finalized
--          |             | Handover to SLIN on 14-09-00
-- 27-03-03 | PWECKERL.US | BUG 2873683 : Changed format of timing info in
--          |             | Status_Record to VarChar2(50); removed to_date
--          |             | from FillStatusRecord() for timing info.

--

-- Type declarations
-- ---------------------
type StringTable is Table of VarChar2(128) index by binary_integer;

type Job_Ident is RECORD
(
  GatewayURL VarChar2(255),      -- Gateway URL to the Server,
                                 -- where the report actuly run on
  ServerName VarChar2(255),      -- name of the server, the report was run on
  JobID      Number,             -- JobID of the Job
  AuthID     VarChar2(255)       -- AuthID used to query status
);


type Status_Record is RECORD
(
  JobIdent    Job_Ident,         -- containing the
                                 -- job-identification-information
  JobType     VarChar2(16),      -- represents the type of the job
  Queue       VarChar2(16),      -- where the job is queued i.e. Current, Done,
                                 -- Scheduled
  JobName     VarChar2(128),     -- name of the Job
  StatusCode  Number,            -- Statuscode
  StatusText  VarChar2(2000),    -- Additional Status Information
  JobOwner    VarChar2(64),      -- Owner of the Job
  OutputType  VarChar2(16),      -- OutputType (=DesType)
  OutputName  Varchar2(128),     -- OutputName (=Desname)
  QueuedAt    VarChar2(50),      -- with current/done :
                                 -- <Queued>, when scheduled : <LastRunAt>
  StartedAt   VarChar2(50),      -- with current/done :
                                 -- <Started>, when scheduled : N/A
  FinishedAt  VarChar2(50),      -- with current/done :
                                 -- <Finished>, when scheduled : N/A
  NextRunAt   VarChar2(50),      -- with current/done :
                                 -- N/A, when scheduled : NextRunAt
  ParentJob   Number,            -- ID of the job, that this one was
                                 -- instantiated from
  Files       StringTable	       -- files indexed by destination index.
);


-- Constant declarations
-- ---------------------

-- Message Constants
--
STARLN  CONSTANT VarChar2(80) := '****************************************';
WELCOME CONSTANT VarChar2(80) := '* WELCOME TO EVENT-BASED-REPORTING API *';
VERSION CONSTANT VarChar2(80) := '* API-Version : 9i                     *';
COPYRGT CONSTANT VarChar2(80) := '* (C) Oracle Corporation, 2000 - 2002  *';

-- defines the string that switches statusoutput to XML
REPSRV_STATUSFORMAT_STRING CONSTANT VarChar2(80) := 'statusformat=xml';
-- command fof getting status-info
REPSVR_GET_STATUS CONSTANT VarChar2(64) := 'showjobid';
-- command for killing a job
REPSVR_CANCEL_JOB CONSTANT VarChar2(64) := 'killjobid';
-- command for running a report
REPSVR_RUN_REPORT CONSTANT VarChar2(64) := 'RUN_REPORT';

-- Date-Format used to convert the timing-info in FillReturnRecord
-- obsolete due to fix for bug 2873683
DATE_FORMAT CONSTANT VarChar2(22) := 'DD/MM/YY HH:MI AM';

-- Constants for Status_Code (same as zrcct_jstype)
UNKNOWN           CONSTANT NUMBER(2) := 0; -- no such job
ENQUEUED          CONSTANT NUMBER(2) := 1; -- job is waiting in queue
OPENING           CONSTANT NUMBER(2) := 2; -- opening report
RUNNING           CONSTANT NUMBER(2) := 3; -- running report
FINISHED          CONSTANT NUMBER(2) := 4; -- job has finished
TERMINATED_W_ERR  CONSTANT NUMBER(2) := 5; -- job has terminated with error
CRASHED           CONSTANT NUMBER(2) := 6; -- engine has crashed when running
CANCELED          CONSTANT NUMBER(2) := 7; -- job is canceled upon user request
SERVER_SHUTDOWN   CONSTANT NUMBER(2) := 8; -- job is canceled as server is
                                           -- shut down
WILL_RETRY        CONSTANT NUMBER(2) := 9; -- job has failed and is waiting
                                           -- for retrying
SENDING_OUTPUT    CONSTANT NUMBER(2) := 10;-- job is sending its output
TRANSFERED        CONSTANT NUMBER(2) := 11;-- the job has been transfered to
                                           -- another server in the cluster
VOID_FINISHED     CONSTANT NUMBER(2) := 12;-- finished job but voided
ERROR_FINISHED    CONSTANT NUMBER(2) := 13;-- finished but some distribution
                                           -- failed

-- Constants for Status-Code
-- general returncodes
API_SUCCESS                CONSTANT NUMBER(4) := 0; -- operation successfull
JOB_SUCCESSFULLY_SUBMITTED CONSTANT NUMBER(5) := 4; -- submission successfull

-- 12xx ..... parameter-list management - functioncodes
OVERWRITE_IF_EXISTS  CONSTANT NUMBER(4) := 121; -- overwrite parameter
CHECK_FOR_EXISTANCE  CONSTANT NUMBER(4) := 122; -- check if parameter exists

-- exceptions
-- specified functioncode is unknown
UNKNOWN_FUNCTIONCODE   exception;
  PRAGMA exception_INIT(UNKNOWN_FUNCTIONCODE, -20001);
-- no protocol specified with GatewayURL
SPECIFY_PROTOCOL       exception;
  PRAGMA exception_init(SPECIFY_PROTOCOL, -20002);
-- SERVER-parameter is missing
NO_SERVER_SPECIFIED     exception;
  PRAGMA exception_init(NO_SERVER_SPECIFIED, -20003);
-- DESTYPE= CACHE|PREVIEW|SCREEN not vaild for API
DESTYPE_NOT_VALID     exception;
  PRAGMA exception_init(DESTYPE_NOT_VALID, -20004);
-- Request failed; for error see Last_Status.StatusText
REPORTS_SERVER_ERROR    exception;
  PRAGMA exception_INIT(REPORTS_SERVER_ERROR, -20998);
-- Request failed; for error see Last_Status.StatusText
REQUEST_FAILED    exception;
  PRAGMA exception_INIT(REQUEST_FAILED, -20999);

-- 11xx ..... parameter-list management - returncodes
-- operation successfull
PARAMETER_ALREADY_EXISTS exception;
  PRAGMA exception_init (PARAMETER_ALREADY_EXISTS, -20111);

-- 21xx ..... HTTP-Request - returncodes
-- Initialization of util_http failed
HTTP_INIT_FAILED           exception;
  PRAGMA exception_init(HTTP_INIT_FAILED, -20211);
-- HTTP-Request failed
HTTP_REQUEST_FAILED        exception;
  PRAGMA exception_init(HTTP_REQUEST_FAILED, -20212);
-- Return-Stream of request is too long, do not overwrite it
HTTP_STREAM_TOO_LONG       exception;
  PRAGMA exception_init(HTTP_STREAM_TOO_LONG, -20213);

-- 31xx ..... XML-Processing - returncodes
-- Specified tag does not exist in stream
XML_TAG_DOES_NOT_EXIST        exception;
  PRAGMA exception_init(XML_TAG_DOES_NOT_EXIST, -20311);

-- Variable declarations
-- ---------------------
XML_Source         VarChar2(32767); -- get_XML; -- SET DEFAULT VALUE TO DUMMY-XML FOR TESTING
XML_Document       XMLDom.DOMdocument;  -- represents the parsed return-value
                                       -- of the http-request
User_Parameter     SRW_Parameter;        -- a singel user-parameter
EmptyParamList     SRW_ParamList;        -- as default for parameter lists
Debugging          Boolean;             -- Toggles debugging-messages
Proxy_to_use       VarChar2(255);       -- Proxy setting to use for http-request
Last_Status        Status_Record;    -- will hold full status information of run_report
ForcePortalSettings Boolean := TRUE;    -- always use Portal/WebDB-settings
                                       -- is set by Check_Installation at init of
                                       -- package. Can be changed by User.
-- Function and procedure declarations
-- -----------------------------------
function installed Return Varchar2;

procedure Start_Debugging; -- turn debugging-messages ON

procedure Stop_Debugging;  -- turn debugging-messages OFF

procedure add_parameter (
  p_paramList     in out SRW_ParamList,
  p_name          in VarChar2,
  p_value         in VarChar2,
  p_mode          in Number Default CHECK_FOR_EXISTANCE
);

function getParameterValue (
  p_paramList     in SRW_ParamList,
  p_parameterName in Varchar2
) return VarChar2;

procedure remove_parameter (
  p_paramList     in out SRW_ParamList,
  p_name          in VarChar2
);

procedure clear_parameter_list (
  p_paramList     in out SRW_ParamList
);

function run_report (
  p_paramList     in SRW_ParamList
) return Job_Ident;

function build_url (
  p_paramlist     in SRW_ParamList,
  p_command       in VarChar2 Default REPSVR_RUN_REPORT
) return VarChar2;

function report_status (
  p_job_details   in Job_Ident,
  p_paramList     in SRW_ParamList Default EmptyParamList
) return Status_Record;

procedure cancel_report (
  p_job_details   in Job_Ident,
  p_paramList     in SRW_ParamList Default EmptyParamList
);

procedure ValidateExecution;

end SRW;
/