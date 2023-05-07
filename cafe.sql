--------------------------------------------------------
--  File created - Ch? Nh?t-tháng 5-07-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Type ADR_HOME_T
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."ADR_HOME_T" FORCE AS OBJECT
(
  product_type          VARCHAR2(8),                        /* product type */
  product_id            VARCHAR2(30),                         /* product id */
  instance_id           VARCHAR2(30),                        /* instance id */
  precedence            INTEGER,       /* precedence level of this adr home */
  adr_id                INTEGER,              /* hash value of the adr home */


-- **********************************************************************
-- Construct an ADR home object representing ADR home at a location
-- described by application specific naming
-- **********************************************************************

  CONSTRUCTOR FUNCTION adr_home_t
  (
    SELF IN OUT NOCOPY  adr_home_t,
    product_type        VARCHAR2,
    product_id          VARCHAR2,
    instance_id         VARCHAR2,
    precedence          INTEGER
  )
  RETURN SELF AS RESULT
);
/
CREATE OR REPLACE NONEDITIONABLE TYPE BODY "SYS"."ADR_HOME_T" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
e
374 1da
P9zZCTAoS//oIklLqMdGlhwD0V0wg2Pxmgwdf3TGEBkP98baUC06bSlrUA0x4rj2gIO2uSbn
nrzjyvm1dTME9njMdcYNyIsFXbchP7RmVjurjzpDgjQQNJ1Ali9I4Xz09v4M9m6whyMMS/zw
0oOrLxjm9ngEetXFh6bLmJQRHWH+cNigBahekEn6p9gGZ6/GR66skdV9wvXelWApJW4PBPT6
vzCZbMWRFyVCce8tjIvpfRJl7424fkW8bUt7b1PbDd+3juBZLazlqevLWZoyKrizXAfJzQXm
aWrvVielYuyOyj8nvlKvstHK92M+vc18gxx4hswyUu11mmg9LkWsYFIZyShSohWB+dRrXBpT
7JBGUtr4tu+7+K52WLUkyk4dyACiz5jeCFb+KJV0KsbCISRYWQpZw1nTbWWY542yXJ4NAxNM
3oiRblLLxkW0DtjQhqbUHeJf2Rj4MXijjHJQ

/

  GRANT EXECUTE ON "SYS"."ADR_HOME_T" TO "DBA";
--------------------------------------------------------
--  DDL for Type ADR_INCIDENT_CORR_KEYS_T
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."ADR_INCIDENT_CORR_KEYS_T" FORCE AS
  VARRAY(10) OF adr_incident_corr_key_t;

/

  GRANT EXECUTE ON "SYS"."ADR_INCIDENT_CORR_KEYS_T" TO "DBA";
--------------------------------------------------------
--  DDL for Type ADR_INCIDENT_CORR_KEY_T
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."ADR_INCIDENT_CORR_KEY_T" FORCE AS OBJECT
(
  name                  VARCHAR2(64),                /* correlation key name */
  value                 VARCHAR2(512),               /* correlation key value*/
  flags                 INTEGER                     /* correlation key flags */
);

/
--------------------------------------------------------
--  DDL for Type ADR_INCIDENT_ERR_ARGS_T
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."ADR_INCIDENT_ERR_ARGS_T" FORCE AS
  VARRAY(12) OF VARCHAR2(64);

/
--------------------------------------------------------
--  DDL for Type ADR_INCIDENT_FILES_T
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."ADR_INCIDENT_FILES_T" FORCE AS
  VARRAY(10) OF adr_incident_file_t;

/

  GRANT EXECUTE ON "SYS"."ADR_INCIDENT_FILES_T" TO "DBA";
--------------------------------------------------------
--  DDL for Type ADR_INCIDENT_FILE_T
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."ADR_INCIDENT_FILE_T" FORCE AS OBJECT
(
  dirpath               VARCHAR2(512),         /* directory path of the file */
  filename              VARCHAR2(64)                            /* file name */
);

/
--------------------------------------------------------
--  DDL for Type ADR_INCIDENT_INFO_T
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."ADR_INCIDENT_INFO_T" FORCE AS OBJECT
(
  problem_key             VARCHAR2(64),       /* problem key of the incident */
  error_facility          VARCHAR2(10),                    /* error facility */
  error_number            INTEGER,                           /* error number */
  error_message           VARCHAR2(1024),                   /* error message */
  ecid                    VARCHAR2(64),              /* execution context id */
  signalling_component    VARCHAR2(64),              /* signalling component */
  signalling_subcomponent VARCHAR2(64),          /* signalling sub component */
  suspect_component       VARCHAR2(64),                 /* suspect component */
  suspect_subcomponent    VARCHAR2(64),             /* suspect sub component */
  error_args              adr_incident_err_args_t,        /* error arguments */
  correlation_keys        adr_incident_corr_keys_t,      /* correlation keys */
  files                   adr_incident_files_t  /* additional incident files */
);

/

  GRANT EXECUTE ON "SYS"."ADR_INCIDENT_INFO_T" TO "DBA";
--------------------------------------------------------
--  DDL for Type ADR_INCIDENT_T
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."ADR_INCIDENT_T" AS OBJECT
(
  home                   adr_home_t,           /* adr home for this incident */
  id                     INTEGER,                             /* incident id */
  staged                 VARCHAR2(1),                  /* is staged incident */
  in_update              VARCHAR2(1),         /* is in the process of update */
  pending                adr_incident_info_t,            /* for internal use */


  -- **********************************************************************
  -- Gets the id of this incident
  -- **********************************************************************

  MEMBER FUNCTION get_id RETURN INTEGER,


  -- **********************************************************************
  -- Gets the path to the directory where incident diagnostic files reside
  -- Value is <ADR_HOME>/incident/incdir_<ID>
  -- **********************************************************************

  MEMBER FUNCTION get_incident_location RETURN VARCHAR2,


  -- **********************************************************************
  -- Writes diagnostics to the default incident file
  -- **********************************************************************

  MEMBER PROCEDURE dump_incident
  (
    SELF     IN OUT NOCOPY adr_incident_t,
    data     IN VARCHAR2                    /* data to dump in incident file */
  ),


  -- **********************************************************************
  -- Writes RAW diagnostics to the default incident file
  -- **********************************************************************

  MEMBER PROCEDURE dump_incident_raw
  (
    SELF     IN OUT NOCOPY adr_incident_t,
    data     IN RAW                     /* RAW data to dump in incident file */
  ),


  -- **********************************************************************
  -- Writes diagnostics to a specified incident file in the incident
  -- directory
  -- **********************************************************************

  MEMBER PROCEDURE dump_incfile
  (
    SELF     IN OUT NOCOPY adr_incident_t,
    filename IN VARCHAR2,          /* additional incident file to be created */
    data     IN VARCHAR2                       /* data to dump in above file */
  ),


  -- **********************************************************************
  -- Writes raw diagnostic data to the specified incident file in the
  -- incident directory
  -- **********************************************************************

  MEMBER PROCEDURE dump_incfile_raw
  (
    SELF     IN OUT NOCOPY adr_incident_t,
    filename IN VARCHAR2,          /* additional incident file to be created */
    data     IN RAW                        /* RAW data to dump in above file */
  ),


  -- **********************************************************************
  -- Adds correlation key to this incident
  -- **********************************************************************

  MEMBER PROCEDURE add_correlation_key
  (
    SELF     IN OUT NOCOPY adr_incident_t,
    name     IN VARCHAR2,                            /* correlation key name */
    value    IN VARCHAR2,                           /* correlation key value */
    flags    IN INTEGER DEFAULT NULL                /* correlation key flags */
  ),


  -- **********************************************************************
  -- Registers a file with this incident.
  -- The file can be anywhere in ADR home.
  -- **********************************************************************

  MEMBER PROCEDURE register_file
  (
    SELF     IN OUT NOCOPY adr_incident_t,
    dirpath  IN VARCHAR2,                      /* directory path of the file */
    filename IN VARCHAR2                                        /* file name */
  ),


  -- **********************************************************************
  -- Registers a file in incident directory with this incident
  -- **********************************************************************

  MEMBER PROCEDURE register_file
  (
    SELF     IN OUT NOCOPY adr_incident_t,
    filename IN VARCHAR2                                        /* file name */
  ),


  -- **********************************************************************
  -- Marks the beginning of post-create updates to this incident
  --  This should be used to add correlation keys, adding additional
  --  incident files and other incident metadata changes after
  --  the incident has already been created
  -- **********************************************************************

  MEMBER PROCEDURE begin_update(SELF IN OUT NOCOPY adr_incident_t),


  -- **********************************************************************
  -- Marks the end of post-create updates to this incident
  --  begin_update and end_update must always be used together
  -- **********************************************************************

  MEMBER PROCEDURE end_update(SELF IN OUT NOCOPY adr_incident_t)
);
/
CREATE OR REPLACE NONEDITIONABLE TYPE BODY "SYS"."ADR_INCIDENT_T" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
e
1059 4ac
Z1AOX8Q1iflal7dHP4FVUb8DTcUwg83qea4GZy+8ZJvVGz9rFFpfwWwf9CynuazXjXkDVeXP
J1DTeRQRel+qtcmceQwp/fJHbJz2WgwXycF5TxeIXUcXfJt9dIsI9onYubcwLaOA9so1sB3I
EOh+e+Dh1KjEY4ZSdXyIrY42t2uPj7j6G1kOkLaPedsby8ZJkSN72+rUCPfaO06XeQdl0e+x
A/Snq0mxorTqom5jzHeVSGy2blNwGUwVSahYfEuC9ILTokepSug1ok24ZokEpEleOcYIVevZ
m7+H+GrgpGJPu8EeXUIyflYgdkJEYQcBGfLvm/TdQwQiS19RICG66t1oUvAELMuwyzx9veca
583FW5PWgtmzk+2IRVLOGnhWKdUFuZlyySGOdBFXgQPUjDc9MZcJQ72HFjcSYcFypkttOtFY
Gj73FA1Vg02HiNPe2C2GZW0H4gWxbRKt5mFSsXXiwAgmfj3m7Tq6Mbnqxuo3uXMqk5ZRV1gk
z2JdM+FMPEGyQexWg6lYgQM8XMk3HElUwFd7IMLFNsMOOueg7zVIy0D+1ICZwlwaJ/Wcvjrz
U6pFrHPKnV4FqqCq0820xiL1SkrL6b+ZU71j9829r3FzDIhz4IIWjO/tGBYm4fTRwBeh81ax
27KTjJW0bLdwxhVHW2cxdUbR6KnbTY9pxlD7YwtxtgIi30CvbPUXTMjqX7AOFUOEc5C++9mD
JggfR6zjve70N8rc3XeYkevwhXuttTpz0geDiKlIpc7kYV/uSPv+TkPA82oSwj9ZKxYwWiuz
BQx6D5bcbwq0zwLadp5BRQC2dV5ZwHUXaKFOM8wCfBUV9UEFQrDlbdng/qQiM2beSm2LEoja
XOqYsINlGFx0n1CUIYlcYVU7XogRsm+Yt2ccNP8FZ6Sibsv98NiDPWEfwDFePljY1YJemKl2
fSC4SjtFn2KyfSJuM5uENDIO0+cR25Djd7NSL2wm78+sW4Ad7iXrJhVRWcLWVzN4BDOWAwx5
TO9j3zmYlN7eWISVfEQfjV2zqwoRnOsa8UkjNven+wEkaoeyKoN1s9/6itqFw3ILAmnJtdm9
xHyTmIJWLfXsLj48t2ILgwLoo4a17np77M/fn9Sx8D3J4/2Riyf13SkYTbOE+LmU3WslR9Cp
ZwbdgG3C5ukmVJwaSJr5pj5mO64=

/

  GRANT EXECUTE ON "SYS"."ADR_INCIDENT_T" TO "DBA";
--------------------------------------------------------
--  DDL for Type ADR_LOG_MSG_ARGS_T
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."ADR_LOG_MSG_ARGS_T" FORCE AS VARRAY(32) OF adr_log_msg_arg_t;

/

  GRANT EXECUTE ON "SYS"."ADR_LOG_MSG_ARGS_T" TO "DBA";
--------------------------------------------------------
--  DDL for Type ADR_LOG_MSG_ARG_T
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."ADR_LOG_MSG_ARG_T" FORCE AS OBJECT
(
  name       VARCHAR2(64),                      /* log message argument name */
  value      VARCHAR2(128)                     /* log message argument value */
);

/

  GRANT EXECUTE ON "SYS"."ADR_LOG_MSG_ARG_T" TO "DBA";
--------------------------------------------------------
--  DDL for Type ADR_LOG_MSG_ECID_T
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."ADR_LOG_MSG_ECID_T" FORCE AS OBJECT
(
  id         VARCHAR2(100),                          /* execution context id */
  rid        VARCHAR2(100)                  /* execution context sequence id */
);

/

  GRANT EXECUTE ON "SYS"."ADR_LOG_MSG_ECID_T" TO "DBA";
--------------------------------------------------------
--  DDL for Type ADR_LOG_MSG_ERRID_T
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."ADR_LOG_MSG_ERRID_T" FORCE AS OBJECT
(
  id         VARCHAR2(100),                             /* error instance id */
  rid        VARCHAR2(100)                              /* error sequence id */
);

/

  GRANT EXECUTE ON "SYS"."ADR_LOG_MSG_ERRID_T" TO "DBA";
--------------------------------------------------------
--  DDL for Type ADR_LOG_MSG_SUPPL_ATTRS_T
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."ADR_LOG_MSG_SUPPL_ATTRS_T" FORCE AS
  VARRAY(32) OF adr_log_msg_suppl_attr_t;

/

  GRANT EXECUTE ON "SYS"."ADR_LOG_MSG_SUPPL_ATTRS_T" TO "DBA";
--------------------------------------------------------
--  DDL for Type ADR_LOG_MSG_SUPPL_ATTR_T
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."ADR_LOG_MSG_SUPPL_ATTR_T" FORCE AS OBJECT
(
  name       VARCHAR2(64),                                 /* attribute name */
  value      VARCHAR2(128)                                /* attribute value */
);

/

  GRANT EXECUTE ON "SYS"."ADR_LOG_MSG_SUPPL_ATTR_T" TO "DBA";
--------------------------------------------------------
--  DDL for Type ADR_LOG_MSG_T
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."ADR_LOG_MSG_T" AS OBJECT
(
  -- Header attributes
  timestamp_originating  TIMESTAMP WITH TIME ZONE,       /* time originating */
  timestamp_normalized   TIMESTAMP WITH TIME ZONE,        /* time normalized */
  org_id                 VARCHAR2(64),                    /* organization id */
  component_id           VARCHAR2(64),                       /* component id */
  instance_id            VARCHAR2(64),                        /* instance id */
  hosting_client_id      VARCHAR2(64),                  /* hosting client id */
  msg_id                 VARCHAR2(64),                         /* message id */
  msg_type               INTEGER,                            /* message type */
  msg_group              VARCHAR2(64),                      /* message group */
  msg_level              INTEGER,                           /* message level */
  host_id                VARCHAR2(64),                            /* host id */
  host_nwaddr            VARCHAR2(46),                       /* host address */
  module_id              VARCHAR2(64),                         /* module id  */
  process_id             VARCHAR2(32),                        /* process id  */
  thread_id              VARCHAR2(64),                         /* thread id  */
  user_id                VARCHAR2(128),                          /* user id  */
  suppl_attrs            adr_log_msg_suppl_attrs_t,
                                                  /* Supplemental attributes */

  -- Correlation data fields
  problem_key            VARCHAR2(64),                        /* problem key */
  upstream_comp_id       VARCHAR2(64),             /* upstream component id  */
  downstream_comp_id     VARCHAR2(64),           /* downstream component id  */
  ecid                   adr_log_msg_ecid_t,        /* execution context id  */
  error_instance_id      adr_log_msg_errid_t,          /* error instance id  */

  -- Payload
  msg_text               VARCHAR2(2048),                     /* message text */
  msg_args               adr_log_msg_args_t,            /* message arguments */
  detail_location        VARCHAR2(160),                /* detailed location  */
  suppl_detail           VARCHAR2(128),             /* supplemental details  */

  -- CDB fields
  con_uid                INTEGER,                     /* container unique ID */
  con_id                 INTEGER,                            /* container ID */
  con_name               VARCHAR2(30)                      /* container name */
);

/

  GRANT EXECUTE ON "SYS"."ADR_LOG_MSG_T" TO "DBA";
--------------------------------------------------------
--  DDL for Type ADR_MSG_TEMPLATE_T
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."ADR_MSG_TEMPLATE_T" AS OBJECT
(
  org_id                 VARCHAR2(64),                    /* organization id */
  component_id           VARCHAR2(64),                       /* component id */
  instance_id            VARCHAR2(64),                        /* instance id */
  hosting_client_id      VARCHAR2(64),                  /* hosting client id */
  msg_group              VARCHAR2(64),                      /* message group */
  host_id                VARCHAR2(64),                            /* host id */
  host_nwaddr            VARCHAR2(46),                       /* host address */
  module_id              VARCHAR2(64),                         /* module id  */
  process_id             VARCHAR2(32),                        /* process id  */
  thread_id              VARCHAR2(64),                         /* thread id  */
  user_id                VARCHAR2(128),                          /* user id  */
  upstream_comp_id       VARCHAR2(64),             /* upstream component id  */
  downstream_comp_id     VARCHAR2(64),           /* downstream component id  */
  ecid                   adr_log_msg_ecid_t,        /* execution context id  */
  error_instance_id      adr_log_msg_errid_t,          /* error instance id  */
  msg_args               adr_log_msg_args_t,           /* message arguments  */
  detail_location        VARCHAR2(160),                /* detailed location  */
  suppl_detail           VARCHAR2(128),             /* supplemental details  */
  -- CDB fields
  con_uid                INTEGER,                     /* container unique ID */
  con_id                 INTEGER,                            /* container ID */
  con_name               VARCHAR2(30)                      /* container name */
);

/
--------------------------------------------------------
--  DDL for Type ADVISOR_OBJECT
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."ADVISOR_OBJECT" authid current_user
  under generic_plan_object
(task_name       varchar2(128),
 execution_name  varchar2(128),
 sql_id          varchar2(13),
 plan_id         number,
 constructor function advisor_object(task_name       varchar2,
                                     execution_name  varchar2,
                                     sql_id          varchar2,
                                     plan_id         number default null)
   return self as result,
overriding member function get_plan_rows return sql_plan_table_type)
/
CREATE OR REPLACE NONEDITIONABLE TYPE BODY "SYS"."ADVISOR_OBJECT" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
e
896 46f
JVbZgXabqwG99kkbePCzCQNkT0Ewg41cmiDrfC+LvqqVoXrYjdgAqdsUGxwl2/03d4hKXmFJ
2S6ymRQupzDWCLHH/3Jho8Xj6P+/vPibVTqbk2hVaVRAGaRNzV6jH41W3yT14N3QyYK4hG+9
HJhmXbiUgurOqB3GuvjMhQFT5KJMfx/c0pNlF+lrEDzLvyR75LJYr5160qdFLZXNfPmCAJLT
Wpr9zbVZnb12YU9yBj3xwKV9jbZb4dfKVFQU3OlHiKIhU+FJ5oLCBbTvVCX2TzEvmL8Zj+k4
R0yeuyTdlUNLgmG9c9Z/uSz++4zLTAsR6oJgoArZarHEulWbwJHQDJdQNxzkmbGJx5pOMSrY
EV7SuN2xw4UbkAcPLRVrMM+Thm//ZQ4Jj12P6M37Ig/gl7saU5RqvUeavL4wvy0R53S+pdMY
Y/baeYQFn9+tgFME0rgzq9nbax2x9Ntosh32R0lKRT+FkVgmkNgYDyV6nCOH/QH14r9g6Lrh
mMZWExy2t4urhk7xZ2PHXHPYvY5j4omhbZBMg7WB9T/4iPpMLT0aeBgP2kyyPNxDhqeXCTLh
O+6DxoOjozlCksbhPKNc+u1ZGIp/gNypPS5mjeX8/Us9Y75JaW8yg2+Njg2vD1x566TTZXI2
33JgT+UlaB7yq4GQVHDrj1p+ugHLpOlC8cwfscjy9l5jE8ZKzDoWuives9HoKFnBY9gMjXAg
w/F9RacBY8TeUX5EpWLXdAlVxy625Z4FwUCppB3hKBPYWj8zSTx35Npyg/OjVmnzyev89SGK
bR+EZDBTrJK+IppIiYqNBFu0/yBz4NSx0IlefOVI3vs/5h5w+T+4yFIgf6//OBx9mnveIxCp
wH1sgMywpYqAnEgSbjxmkP7Dh05rSvRDc7YpEJawAmiE16MZ7kudIph+lAtQBu6Ha49kK3dO
pHHwCSUCzllGavMyvFfCGFd9gq3TOCWh0YiBMjBPDCB+aH67RgRG4XI+4eQBEgHSJ1vWZr/A
wWLq9zR5LVgObq2vrbDVjvYpNvBifU3XTkF6N4I0jaSLCbt+s+6kJp/BAOitBYZFn6x18jRv
pWEkynolVR0Zv9ynI2bHPI6qMDEOsd9dPQ/FERZw

/

  GRANT EXECUTE ON "SYS"."ADVISOR_OBJECT" TO PUBLIC;
  GRANT EXECUTE ON "SYS"."ADVISOR_OBJECT" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type AGGXMLIMP
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AGGXMLIMP" 
   authid current_user as object
(
  key RAW(8),

  static function ODCIAggregateInitialize(sctx OUT AggXMLImp, outopn IN RAW,
                                          inpopn IN RAW ) return pls_integer
    is language c
    name "AggInitialize"
    library XMLtype_lib
    with context
    parameters (
      context,
      sctx, sctx INDICATOR STRUCT, sctx DURATION OCIDuration,
      outopn OCIRaw,
      inpopn OCIRaw,
      return INT
    ),

  member function ODCIAggregateIterate(self IN OUT NOCOPY AggXMLImp,
                                       value IN sys.xmltype) return pls_integer
    is language c
    name "AggIterate"
    library xmltype_lib
    with context
    parameters (
      context,
      self, self INDICATOR STRUCT, self DURATION OCIDuration,
      value, value INDICATOR sb2,
      return INT
    ),

  member function ODCIAggregateTerminate(self IN OUT NOCOPY AggXMLImp,
                                         returnValue OUT sys.XMLType,
                                         flags IN number)
                  return pls_integer
    is language c
    name "AggTerminate"
    library xmltype_lib
    with context
    parameters (
      context,
      self, self INDICATOR STRUCT,
      returnValue, returnValue INDICATOR sb2, returnValue DURATION OCIDuration,
      flags, flags INDICATOR sb2,
      return INT
    ),

  member function ODCIAggregateMerge(self IN OUT NOCOPY AggXMLImp,
                                     valueB IN AggXMLImp) return pls_integer
    is language c
    name "AggMerge"
    library xmltype_lib
    with context
    parameters (
      context,
      self, self INDICATOR STRUCT, self DURATION OCIDuration,
      valueB, valueB INDICATOR STRUCT,
      return INT
    ),

  member function ODCIAggregateWrapContext(self IN OUT NOCOPY AggXMLImp)
                  return pls_integer
    is language c
    name "AggWrap"
    library xmltype_lib
    with context
    parameters (
      context,
      self, self INDICATOR STRUCT, self DURATION OCIDuration,
      return INT
    )
);

/
--------------------------------------------------------
--  DDL for Type AGGXQAVGIMP
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AGGXQAVGIMP" 
   authid current_user as object
(
  key RAW(8),

  static function ODCIAggregateInitialize(sctx OUT AggXQAvgImp, outopn IN RAW,
                                          inpopn IN RAW ) return pls_integer
    is language c
    name "XQAggAvgInitialize"
    library XMLtype_lib
    with context
    parameters(
      context,
      sctx, sctx INDICATOR STRUCT, sctx DURATION OCIDuration,
      outopn OCIRaw,
      inpopn OCIRaw,
      return INT
    ),

  member function ODCIAggregateIterate(self IN OUT NOCOPY AggXQAvgImp,
                                       value IN sys.xmltype) return pls_integer
    is language c
    name "XQAggAvgIterate"
    library xmltype_lib
    with context
    parameters (
      context,
      self, self INDICATOR STRUCT, self DURATION OCIDuration,
      value, value INDICATOR sb2,
      return INT
    ),

  member function ODCIAggregateTerminate(self IN OUT NOCOPY AggXQAvgImp,
                                         returnValue OUT sys.XMLType,
                                         flags IN number)
                  return pls_integer
    is language c
    name "XQAggAvgTerminate"
    library xmltype_lib
    with context
    parameters (
      context,
      self, self INDICATOR STRUCT,
      returnValue, returnValue INDICATOR sb2, returnValue DURATION OCIDuration,
      flags, flags INDICATOR sb2,
      return INT
    ),

  member function ODCIAggregateMerge(self IN OUT NOCOPY AggXQAvgImp,
                                     valueB IN AggXQAvgImp) return pls_integer
    is language c
    name "XQAggAvgMerge"
    library xmltype_lib
    with context
    parameters (
      context,
      self, self INDICATOR STRUCT, self DURATION OCIDuration,
      valueB, valueB INDICATOR STRUCT,
      return INT
    ),

  member function ODCIAggregateWrapContext(self IN OUT NOCOPY AggXQAvgImp)
                  return pls_integer
    is language c
    name "XQAggAvgWrap"
    library xmltype_lib
    with context
    parameters (
      context,
      self, self INDICATOR STRUCT, self DURATION OCIDuration,
      return INT
    )
);

/
--------------------------------------------------------
--  DDL for Type AGGXQIMP
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AGGXQIMP" 
   authid current_user as object
(
  key RAW(8),

  static function ODCIAggregateInitialize(sctx OUT AggXQImp, outopn IN RAW,
                                          inpopn IN RAW ) return pls_integer
    is language c
    name "XQAggInitialize"
    library XMLtype_lib
    with context
    parameters(
      context,
      sctx, sctx INDICATOR STRUCT, sctx DURATION OCIDuration,
      outopn OCIRaw,
      inpopn OCIRaw,
      return INT
    ),

  member function ODCIAggregateIterate(self IN OUT NOCOPY AggXQImp,
                                       value IN sys.xmltype) return pls_integer
    is language c
    name "XQAggIterate"
    library xmltype_lib
    with context
    parameters (
      context,
      self, self INDICATOR STRUCT, self DURATION OCIDuration,
      value, value INDICATOR sb2,
      return INT
    ),

  member function ODCIAggregateTerminate(self IN OUT NOCOPY AggXQImp,
                                         returnValue OUT sys.XMLType,
                                         flags IN number)
                  return pls_integer
    is language c
    name "XQAggTerminate"
    library xmltype_lib
    with context
    parameters (
      context,
      self, self INDICATOR STRUCT,
      returnValue, returnValue INDICATOR sb2, returnValue DURATION OCIDuration,
      flags, flags INDICATOR sb2,
      return INT
    ),

  member function ODCIAggregateMerge(self IN OUT NOCOPY AggXQImp,
                                     valueB IN AggXQImp) return pls_integer
    is language c
    name "XQAggMerge"
    library xmltype_lib
    with context
    parameters (
      context,
      self, self INDICATOR STRUCT, self DURATION OCIDuration,
      valueB, valueB INDICATOR STRUCT,
      return INT
    ),

  member function ODCIAggregateWrapContext(self IN OUT NOCOPY AggXQImp)
                  return pls_integer
    is language c
    name "XQAggWrap"
    library xmltype_lib
    with context
    parameters (
      context,
      self, self INDICATOR STRUCT, self DURATION OCIDuration,
      return INT
    )
);

/
--------------------------------------------------------
--  DDL for Type AGGXQSUMIMP
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AGGXQSUMIMP" 
   authid current_user as object
(
  key RAW(8),

  static function ODCIAggregateInitialize(sctx OUT AggXQSumImp, outopn IN RAW,
                                          inpopn IN RAW ) return pls_integer
    is language c
    name "XQAggSumInitialize"
    library XMLtype_lib
    with context
    parameters(
      context,
      sctx, sctx INDICATOR STRUCT, sctx DURATION OCIDuration,
      outopn OCIRaw,
      inpopn OCIRaw,
      return INT
    ),

  member function ODCIAggregateIterate(self IN OUT NOCOPY AggXQSumImp,
                                       value IN sys.xmltype) return pls_integer
    is language c
    name "XQAggSumIterate"
    library xmltype_lib
    with context
    parameters (
      context,
      self, self INDICATOR STRUCT, self DURATION OCIDuration,
      value, value INDICATOR sb2,
      return INT
    ),

  member function ODCIAggregateTerminate(self IN OUT NOCOPY AggXQSumImp,
                                         returnValue OUT sys.XMLType,
                                         flags IN number)
                  return pls_integer
    is language c
    name "XQAggSumTerminate"
    library xmltype_lib
    with context
    parameters (
      context,
      self, self INDICATOR STRUCT,
      returnValue, returnValue INDICATOR sb2, returnValue DURATION OCIDuration,
      flags, flags INDICATOR sb2,
      return INT
    ),

  member function ODCIAggregateMerge(self IN OUT NOCOPY AggXQSumImp,
                                     valueB IN AggXQSumImp) return pls_integer
    is language c
    name "XQAggSumMerge"
    library xmltype_lib
    with context
    parameters (
      context,
      self, self INDICATOR STRUCT, self DURATION OCIDuration,
      valueB, valueB INDICATOR STRUCT,
      return INT
    ),

  member function ODCIAggregateWrapContext(self IN OUT NOCOPY AggXQSumImp)
                  return pls_integer
    is language c
    name "XQAggSumWrap"
    library xmltype_lib
    with context
    parameters (
      context,
      self, self INDICATOR STRUCT, self DURATION OCIDuration,
      return INT
    )
);

/
--------------------------------------------------------
--  DDL for Type ALERT_TYPE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."ALERT_TYPE" AS OBJECT (
        timestamp_originating    timestamp with time zone,
        organization_id          varchar2(10),
        component_id             varchar2(3),
        message_id               number,
        hosting_client_id        varchar2(64),
        message_type             varchar2(12),
        message_group            varchar2(30),
        message_level            number,
        host_id                  varchar2(256),
        host_nw_addr             varchar2(256),
        module_id                varchar2(64),
        process_id               varchar2(128),
        user_id                  varchar2(30),
        upstream_component_id    varchar2(30),
        downstream_component_id  varchar2(4),
        execution_context_id     varchar2(128),
        error_instance_id        varchar2(142),
        reason_argument_count    number,
        reason_argument_1        varchar2(513),
        reason_argument_2        varchar2(513),
        reason_argument_3        varchar2(513),
        reason_argument_4        varchar2(513),
        reason_argument_5        varchar2(513),
        sequence_id              number,
        reason_id                number,
        object_owner             varchar2(30),
        object_name              varchar2(513),
        subobject_name           varchar2(30),
        object_type              varchar2(30),
        instance_name            varchar2(16),
        instance_number          number,
        scope                    varchar2(10),
        advisor_name             varchar2(30),
        metric_value             number,
        suggested_action_msg_id  number,
        action_argument_count    number,
        action_argument_1        varchar2(30),
        action_argument_2        varchar2(30),
        action_argument_3        varchar2(30),
        action_argument_4        varchar2(30),
        action_argument_5        varchar2(30),
        pdb_name                 varchar2(128)
)
 ALTER TYPE     "SYS"."ALERT_TYPE" MODIFY ATTRIBUTE object_owner VARCHAR2(128)
CASCADE

/

  GRANT EXECUTE ON "SYS"."ALERT_TYPE" TO PUBLIC;
  GRANT EXECUTE ON "SYS"."ALERT_TYPE" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type ANYDATA
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."ANYDATA" 
as OPAQUE VARYING (*)
USING library DBMS_ANYDATA_LIB
(
  /* CONSTRUCTION */
  /* There are 2 ways to construct an AnyData. The Convert*() calls
     enable construction of the AnyData in its entirity with a single call.
     They serve as explicit CAST functions from any type in the Oracle ORDBMS
     to SYS.AnyData.
  */
  STATIC FUNCTION ConvertNumber(num IN NUMBER) return AnyData,
  STATIC FUNCTION ConvertDate(dat IN DATE) return AnyData,
  STATIC FUNCTION ConvertChar(c IN CHAR) return AnyData,
  STATIC FUNCTION ConvertVarchar(c IN VARCHAR) return AnyData,
  STATIC FUNCTION ConvertVarchar2(c IN VARCHAR2) return AnyData,
  STATIC FUNCTION ConvertRaw(r IN RAW) return AnyData,
  STATIC FUNCTION ConvertBlob(b IN BLOB) return AnyData,
  STATIC FUNCTION ConvertClob(c IN CLOB) return AnyData,
  STATIC FUNCTION ConvertBfile(b IN BFILE) return AnyData,
  STATIC FUNCTION ConvertObject(obj IN "<ADT_1>") return AnyData,
  STATIC FUNCTION ConvertObject(obj IN "<OPAQUE_1>") return AnyData,
  STATIC FUNCTION ConvertRef(rf IN REF "<ADT_1>") return AnyData,
  STATIC FUNCTION ConvertCollection(col IN "<COLLECTION_1>") return AnyData,

  /* The 2nd way to construct an AnyData is a piece by piece approach. The
     BeginCreate() call begins the construction process and
     EndCreate() call finishes the construction process..
     In between these 2 calls, the individual attributes of an Object Type or
     the elements of a Collection can be set using Set*()calls.
     For piece by piece access of the attributes of Objects and elements of
     Collections, the PieceWise() call should be invoked prior to
     Get*() calls.
     Note: The AnyData has to be constructed or accessed sequentially starting
     from its first attribute(or collection element).
     The BeginCreate() call automatically begins the construction in a
     piece-wise mode. There is no need to call PieceWise() immediately
     after BeginCreate().
     EndCreate should be called to finish the construction
     process (before which no access calls can be made).
  */

  /* NAME
         BeginCreate
     DESCRIPTION
         Begins creation process on a new AnyData.
     PARAMETERS
         dtype - The Type of the AnyData. (should correspond to
                                           OCI_TYPECODE_OBJECT or
                                           a Collection typecode.)
         adata - AnyData being constructed.
     EXCEPTIONS
         - DBMS_TYPES.invalid_parameters
           dtype is invalid (not fully constructed etc.).
     NOTE
         There is NO NEED to call PieceWise() immediately after this
     call. Automatically the construction process begins in a piece-wise
     manner.
  */
  STATIC PROCEDURE BeginCreate(dtype IN OUT NOCOPY AnyType,
                               adata OUT NOCOPY AnyData),

  /* NAME
         PieceWise.
     DESCRIPTION
         This call sets the MODE of access of the current data value to
         be an attribute at a time (if the data value is of TYPECODE_OBJECT).
         It sets the MODE of access of the data value to be a
         collection element at a time (if the data value is of
         collection TYPE). Once this call has been made, subsequent
         Set*'s and Get*'s will sequentially obtain
         individual attributes or collection elements.
     EXCEPTIONS
         - DBMS_TYPES.invalid_parameters
         - DBMS_TYPES.incorrect_usage
           On incorrect usage.
     NOTE
         The current data value must be of an OBJECT or COLLECTION type before
         this call can be made.
         Piece-wise construction and access of nested attributes that are of
         object or collection types is not supported.
  */
  MEMBER PROCEDURE PieceWise(self IN OUT NOCOPY AnyData),

  /* NAME
         SetNumber, SetDate etc.
     DESCRIPTION
         Sets the current data value.
         This is a list of procedures that should be called depending on the
         type of the current data value.
         The type of the data value should be the type of the attribute at the
         current position during the piece-wise construction process.
         NOTE - When BeginCreate() is called, construction has already
                begun in a piece-wise fashion. Subsequent calls to
                Set*() will set the successive attribute values.
                If the AnyData is a standalone collection, the
                Set*() call will set the successive collection
                elements.
     PARAMETERS
         num - The Number that needs to be set. etc.

         last_elem - This parameter is relevant only if AnyData represents a
                     a collection.
                     Set to TRUE if it is the last element of the collection,
                     FALSE otherwise.
     EXCEPTIONS
         - DBMS_TYPES.invalid_parameters
           Invalid Parameters (if it is not appropriate to add a number
                               at this point in the creation process).
         - DBMS_TYPES.incorrect_usage
           Incorrect usage
         - DBMS_TYPES.type_mismatch
           When the expected type is different from the passed in type.
     NOTE
         Sets the current data value.
  */
  MEMBER PROCEDURE SetNumber(self IN OUT NOCOPY AnyData, num IN NUMBER,
                    last_elem IN boolean DEFAULT FALSE),
  MEMBER PROCEDURE SetDate(self IN OUT NOCOPY AnyData, dat IN DATE,
                    last_elem IN boolean DEFAULT FALSE),
  MEMBER PROCEDURE SetChar(self IN OUT NOCOPY AnyData, c IN CHAR,
                    last_elem IN boolean DEFAULT FALSE),
  MEMBER PROCEDURE SetVarchar(self IN OUT NOCOPY AnyData, c IN VARCHAR,
                    last_elem IN boolean DEFAULT FALSE),
  MEMBER PROCEDURE SetVarchar2(self IN OUT NOCOPY AnyData,
                    c IN VARCHAR2, last_elem IN boolean DEFAULT FALSE),
  MEMBER PROCEDURE SetRaw(self IN OUT NOCOPY AnyData, r IN RAW,
                    last_elem IN boolean DEFAULT FALSE),
  MEMBER PROCEDURE SetBlob(self IN OUT NOCOPY AnyData, b IN BLOB,
                    last_elem IN boolean DEFAULT FALSE),
  MEMBER PROCEDURE SetClob(self IN OUT NOCOPY AnyData, c IN CLOB,
                    last_elem IN boolean DEFAULT FALSE),
  MEMBER PROCEDURE SetBfile(self IN OUT NOCOPY AnyData, b IN BFILE,
                    last_elem IN boolean DEFAULT FALSE),
  MEMBER PROCEDURE SetObject(self IN OUT NOCOPY AnyData,
                    obj IN "<ADT_1>", last_elem IN boolean DEFAULT FALSE),
  MEMBER PROCEDURE SetObject(self IN OUT NOCOPY AnyData,
                    obj IN "<OPAQUE_1>", last_elem IN boolean DEFAULT FALSE),
  MEMBER PROCEDURE SetRef(self IN OUT NOCOPY AnyData,
                    rf IN REF "<ADT_1>", last_elem IN boolean DEFAULT FALSE),
  MEMBER PROCEDURE SetCollection(self IN OUT NOCOPY AnyData,
                    col IN "<COLLECTION_1>", last_elem IN boolean DEFAULT FALSE),

  /*
     NAME
          EndCreate
     DESCRIPTION
          Ends Creation of a AnyData. Other creation functions cannot be
          called after this call.
  */
  MEMBER PROCEDURE EndCreate(self IN OUT NOCOPY AnyData),


  /* ----------------------------------------------------------------------- */
  /* ACCESSORS */
  /* ----------------------------------------------------------------------- */
  /*
     NAME
          GetTypeName
     DESCRIPTION
          Get the fully qualified Type Name for the AnyData.
          If the AnyData is based on a builtin, this function will return
          NUMBER etc.
          If it is based on a user defined type, this function will return
          <schema_name>.<type_name>. e.g. SCOTT.FOO.
          If it is based on a transient anonymous type, this function will
          return NULL.
     RETURNS
          Type name of the AnyData.
  */
  MEMBER FUNCTION GetTypeName(self IN AnyData) return VARCHAR2
    DETERMINISTIC,

  /* NAME
         GetType
     DESCRIPTION
         Gets the Type of the AnyData.
     PARAMETERS
         typ (OUT) - The AnyType corresponding to the AnyData. May be NULL
                     if it does not represent a user-defined type.
     RETURNS
         The typecode corresponding to the type of the AnyData.

     EXCEPTIONS
  */
  MEMBER FUNCTION GetType(self IN AnyData, typ OUT NOCOPY AnyType)
      return PLS_INTEGER,

  /* NAME
         Get*()
     DESCRIPTION
         Gets the current data value (which should be of appropriate type)
         The type of the current data value depends on the MODE with which
         we are accessing (Depending on whether we have invoked the
         PieceWise() call).
         If PieceWise() has NOT been called, we are accessing the
         AnyData in its entirety and the type of the data value should match
         the type of the AnyData.
         If PieceWise() has been called, we are accessing the
         AnyData piece wise. The type of the data value should match the type
         of the attribute (or collection element) at the current position.
     PARAMETERS
         num - The Number that needs to be got. etc.
     RETURNS
         DBMS_TYPES.SUCCESS or DBMS_TYPES.NO_DATA
         The return value is relevant only if PieceWise
         has been already called (for a collection). In such a case,
         DBMS_TYPES.NO_DATA signifies the end of the collection when all
         elements have been accessed.
     EXCEPTIONS
         - DBMS_TYPES.type_mismatch
           When the expected type is different from the passed in type.
         - DBMS_TYPES.invalid_parameters
           Invalid Parameters (if it is not appropriate to add a number
                               at this point in the creation process).
         - DBMS_TYPES.incorrect_usage
           Incorrect usage.
  */
  MEMBER FUNCTION GetNumber(self IN AnyData, num OUT NOCOPY NUMBER)
              return PLS_INTEGER,
  MEMBER FUNCTION GetDate(self IN AnyData, dat OUT NOCOPY DATE)
              return PLS_INTEGER,
  MEMBER FUNCTION GetChar(self IN AnyData, c OUT NOCOPY CHAR)
              return PLS_INTEGER,
  MEMBER FUNCTION GetVarchar(self IN AnyData, c OUT NOCOPY VARCHAR)
              return PLS_INTEGER,
  MEMBER FUNCTION GetVarchar2(self IN AnyData, c OUT NOCOPY VARCHAR2)
              return PLS_INTEGER,
  MEMBER FUNCTION GetRaw(self IN AnyData, r OUT NOCOPY RAW)
              return PLS_INTEGER,
  MEMBER FUNCTION GetBlob(self IN AnyData, b OUT NOCOPY BLOB)
              return PLS_INTEGER,
  MEMBER FUNCTION GetClob(self IN AnyData, c OUT NOCOPY CLOB)
              return PLS_INTEGER,
  MEMBER FUNCTION GetBfile(self IN AnyData, b OUT NOCOPY BFILE)
              return PLS_INTEGER,
  MEMBER FUNCTION GetObject(self IN AnyData, obj OUT NOCOPY "<ADT_1>")
              return PLS_INTEGER,
  MEMBER FUNCTION GetObject(self IN AnyData, obj OUT NOCOPY "<OPAQUE_1>")
              return PLS_INTEGER,
  MEMBER FUNCTION GetRef(self IN AnyData, rf OUT NOCOPY REF "<ADT_1>")
              return PLS_INTEGER,
  MEMBER FUNCTION GetCollection(self IN AnyData,
                                col OUT NOCOPY "<COLLECTION_1>")
                                return PLS_INTEGER,
  /***************************************************************************/
  /* NEWLY ADDED FUNCTIONS IN 9iR2 */
  /***************************************************************************/
  /* Convert calls for Datetime and Nchar types. */
  STATIC FUNCTION ConvertTimestamp(ts IN TIMESTAMP_UNCONSTRAINED) return AnyData,
  STATIC FUNCTION ConvertTimestampTZ(ts IN TIMESTAMP_TZ_UNCONSTRAINED)
        return AnyData,
  STATIC FUNCTION ConvertTimestampLTZ(ts IN TIMESTAMP_LTZ_UNCONSTRAINED)
        return AnyData,
  STATIC FUNCTION ConvertIntervalYM(inv IN YMINTERVAL_UNCONSTRAINED)
        return AnyData,
  STATIC FUNCTION ConvertIntervalDS(inv IN DSINTERVAL_UNCONSTRAINED)
        return AnyData,
  STATIC FUNCTION ConvertNchar(nc IN NCHAR) return AnyData,
  STATIC FUNCTION ConvertNVarchar2(nc IN NVARCHAR2) return AnyData,
  STATIC FUNCTION ConvertNClob(nc IN NCLOB) return AnyData,
  /* Set calls for Datetime and Nchar types. */
  MEMBER PROCEDURE SetTimestamp(self IN OUT NOCOPY AnyData, ts IN TIMESTAMP_UNCONSTRAINED,
                    last_elem IN boolean DEFAULT FALSE),
  MEMBER PROCEDURE SetTimestampTZ(self IN OUT NOCOPY AnyData,
                    ts IN TIMESTAMP_TZ_UNCONSTRAINED,
                    last_elem IN boolean DEFAULT FALSE),
  MEMBER PROCEDURE SetTimestampLTZ(self IN OUT NOCOPY AnyData,
                    ts IN TIMESTAMP_LTZ_UNCONSTRAINED,
                    last_elem IN boolean DEFAULT FALSE),
  MEMBER PROCEDURE SetIntervalYM(self IN OUT NOCOPY AnyData,
                    inv IN YMINTERVAL_UNCONSTRAINED,
                    last_elem IN boolean DEFAULT FALSE),
  MEMBER PROCEDURE SetIntervalDS(self IN OUT NOCOPY AnyData,
                    inv IN DSINTERVAL_UNCONSTRAINED,
                    last_elem IN boolean DEFAULT FALSE),
  MEMBER PROCEDURE SetNchar(self IN OUT NOCOPY AnyData,
                    nc IN NCHAR, last_elem IN boolean DEFAULT FALSE),
  MEMBER PROCEDURE SetNVarchar2(self IN OUT NOCOPY AnyData,
                    nc IN NVarchar2, last_elem IN boolean DEFAULT FALSE),
  MEMBER PROCEDURE SetNClob(self IN OUT NOCOPY AnyData,
                    nc IN NClob, last_elem IN boolean DEFAULT FALSE),
  /* Get calls for Datetime and Nchar types. */
  MEMBER FUNCTION GetTimestamp(self IN AnyData, ts OUT NOCOPY TIMESTAMP_UNCONSTRAINED)
       return PLS_INTEGER,
  MEMBER FUNCTION GetTimestampTZ(self IN AnyData,
       ts OUT NOCOPY TIMESTAMP_TZ_UNCONSTRAINED) return PLS_INTEGER,
  MEMBER FUNCTION GetTimestampLTZ(self IN AnyData,
       ts OUT NOCOPY TIMESTAMP_LTZ_UNCONSTRAINED) return PLS_INTEGER,
  MEMBER FUNCTION GetIntervalYM(self IN AnyData,
       inv IN OUT NOCOPY YMINTERVAL_UNCONSTRAINED) return PLS_INTEGER,
  MEMBER FUNCTION GetIntervalDS(self IN AnyData,
       inv IN OUT NOCOPY DSINTERVAL_UNCONSTRAINED) return PLS_INTEGER,
  MEMBER FUNCTION GetNchar(self IN AnyData, nc OUT NOCOPY NCHAR)
       return PLS_INTEGER,
  MEMBER FUNCTION GetNVarchar2(self IN AnyData, nc OUT NOCOPY NVARCHAR2)
       return PLS_INTEGER,
  MEMBER FUNCTION GetNClob(self IN AnyData, nc OUT NOCOPY NCLOB)
       return PLS_INTEGER,
  /*
     NAME
         AccessNumber, AccessDate etc.
     DESCRIPTION
         Access functions for AnyData based on Built-ins are provided for
         SQL queriability.
         These functions do not throw exceptions on type-mismatch.
         Instead, they return NULL if the type of the AnyData does not
         correspond to the type of Access so that it is SQL friendly.
         If users want only those AnyData's of the appropriate Types returned
         in a Query, they should use a WHERE clause which uses
         GetTypeName() and choose the type they are interested in
         (say "SYS.NUMBER" etc.)
  */
  MEMBER FUNCTION AccessNumber(self IN AnyData) return NUMBER DETERMINISTIC,
  MEMBER FUNCTION AccessDate(self IN AnyData) return DATE DETERMINISTIC,
  MEMBER FUNCTION AccessChar(self IN AnyData) return CHAR DETERMINISTIC,
  MEMBER FUNCTION AccessVarchar(self IN AnyData) return VARCHAR DETERMINISTIC,
  MEMBER FUNCTION AccessVarchar2(self IN AnyData) return VARCHAR2
                          DETERMINISTIC,
  MEMBER FUNCTION AccessRaw(self IN AnyData) return RAW DETERMINISTIC,
  MEMBER FUNCTION AccessBlob(self IN AnyData) return BLOB DETERMINISTIC,
  MEMBER FUNCTION AccessClob(self IN AnyData) return CLOB DETERMINISTIC,
  MEMBER FUNCTION AccessBfile(self IN AnyData) return BFILE DETERMINISTIC,
  MEMBER FUNCTION AccessTimestamp(self IN AnyData) return TIMESTAMP_UNCONSTRAINED
                           DETERMINISTIC,
  MEMBER FUNCTION AccessTimestampTZ(self IN AnyData)
         REturn TIMESTAMP_TZ_UNCONSTRAINED DETERMINISTIC,
  MEMBER FUNCTION AccessTimestampLTZ(self IN AnyData)
         return TIMESTAMP_LTZ_UNCONSTRAINED DETERMINISTIC,
  MEMBER FUNCTION AccessIntervalYM(self IN AnyData)
         return YMINTERVAL_UNCONSTRAINED DETERMINISTIC,
  MEMBER FUNCTION AccessIntervalDS(self IN AnyData)
         return DSINTERVAL_UNCONSTRAINED DETERMINISTIC,
  MEMBER FUNCTION AccessNchar(self IN AnyData) return NCHAR DETERMINISTIC,
  MEMBER FUNCTION AccessNVarchar2(self IN AnyData) return NVARCHAR2
                                  DETERMINISTIC,
  MEMBER fuNCTION AccessNClob(self IN AnyData) return NCLOB DETERMINISTIC,
  /***************************************************************************/
  /* NEWLY ADDED FUNCTIONS IN 10iR1 */
  /***************************************************************************/
  /* Convert calls for BFloat, BDouble, URowid */
  STATIC FUNCTION ConvertBFloat(fl IN BINARY_FLOAT) return AnyData,
  STATIC FUNCTION ConvertBDouble(dbl IN BINARY_DOUBLE) return AnyData,
  STATIC FUNCTION ConvertURowid(rid IN UROWID) return AnyData,
  /* Set calls for Float, Double */
  MEMBER PROCEDURE SetBFloat(self IN OUT NOCOPY AnyData, fl IN BINARY_FLOAT,
                            last_elem IN boolean DEFAULT FALSE),
  MEMBER PROCEDURE SetBDouble(self IN OUT NOCOPY AnyData, dbl IN BINARY_DOUBLE,
                             last_elem IN boolean DEFAULT FALSE),
  /* Get calls for Float, Double */
  MEMBER FUNCTION GetBFloat(self IN AnyData, fl OUT NOCOPY BINARY_FLOAT)
      return PLS_INTEGER,
  MEMBER FUNCTION GetBDouble(self IN AnyData, dbl OUT NOCOPY BINARY_DOUBLE)
      return PLS_INTEGER,
  /* Access calls for Float, Double, Rowid */
  MEMBER FUNCTION AccessBFloat(self IN AnyData) return BINARY_FLOAT
          DETERMINISTIC,
  MEMBER FUNCTION AccessBDouble(self IN AnyData) return BINARY_DOUBLE
          DETERMINISTIC,
  MEMBER FUNCTION AccessURowid(self IN AnyData) return UROWID DETERMINISTIC
);
/
CREATE OR REPLACE NONEDITIONABLE TYPE BODY "SYS"."ANYDATA" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
e
6d35 b78
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
jGmeDrX5BbXP1uEz

/

  GRANT EXECUTE ON "SYS"."ANYDATA" TO PUBLIC WITH GRANT OPTION;
--------------------------------------------------------
--  DDL for Type ANYDATASET
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."ANYDATASET" 
as OPAQUE VARYING (*)
USING library DBMS_ANYDATASET_LIB
(
/* CONSTRUCTION */

  /* NOTE - The AnyDataSet needs to be contructed value by value sequentially.
            For each data instance (of the type of the AnyDataSet),
            the AddInstance() function need to be invoked.
            This adds a new data instance to the AnyDataSet.
            Subsequently, Set*() can be called to set each value
            in its entirety.

            The MODE of construction/access can be changed to attribute/
            collection element wise by making calls to PieceWise()
             - If the type of the AnyDataSet is TYPECODE_OBJECT,
               individual attributes will be set with subsequent
               Set*() calls. Likewise on access.
             - If the type of the current data value is a collection type
               individual collection elements will be set with subsequent
               Set*() calls. Likewise on access.
            This call is very similar to AnyData.PieceWise() call defined for
            the type SYS.AnyData.
            NOTE - There is no support for piecewise construction and access
                   of nested (not top level) attributes that are of object
                   types or collection types.

            EndCreate should be called to finish the construction
            process (before which no access calls can be made).
  */

  /* NAME
         BeginCreate
     DESCRIPTION
         Creates a new AnyDataSet which can be used to create a Set of data
         values of the given ANYTYPE.
     PARAMETERS
         typecode - the typecode for the type of the AnyDataSet
         dtype - The Type of the data values. This parameter is a must for
                 user-defined types like TYPECODE_OBJECT, Collection typecodes
                 etc.
         aset - The AnyDataSet being constructed.
     EXCEPTIONS
         - DBMS_TYPES.invalid_parameters
           dtype is invalid (not fully constructed etc.).
  */
  STATIC PROCEDURE BeginCreate(typecode IN PLS_INTEGER,
           rtype IN OUT NOCOPY AnyType, aset OUT NOCOPY AnyDataSet),

  /* NAME
         AddInstance.
     DESCRIPTION
         Add a new data instance to a AnyDataSet.
     EXCEPTIONS
         - DBMS_TYPES.invalid_parameters
         - DBMS_TYPES.incorrect_usage
           On incorrect usage.
     NOTE
         The data instances have to be added sequentially. The previous data
         instance must be fully constructed (or set to null) before a new one
         can be added.
         This call DOES NOT automatically set the mode of construction to be
         piece-wise. The user has to explicitly call PieceWise() if a
         piece-wise construction of the instance is intended.
  */
  MEMBER PROCEDURE AddInstance(self IN OUT NOCOPY AnyDataSet),

  /* NAME
         PieceWise.
     DESCRIPTION
         This call sets the MODE of construction, access of the data value to
         be an attribute at a time (if the data value is of TYPECODE_OBJECT).
         It sets the MODE of construction, access of the data value to be a
         collection element at a time (if the data value is of
         collection TYPE). Once this call has been made, subsequent
         Set*'s and Get* will sequentially obtain
         individual attributes or collection elements.
    EXCEPTIONS
         - DBMS_TYPES.invalid_parameters
         - DBMS_TYPES.incorrect_usage
           On incorrect usage.
    NOTE
         The current data value must be of an OBJECT or COLLECTION type before
         this call can be made. There is no support for piece-wise
         construction or access of embedded object type attributes (or nested
         collections).
  */
  MEMBER PROCEDURE PieceWise(self IN OUT NOCOPY AnyDataSet),

  /* NAME
         Set*.
     DESCRIPTION
         Sets the current data value.
         The type of the current data value depends on the MODE with which
         we are constructing (Depending on how we have invoked the
         PieceWise() call).
         The type of the current data should be the type of the
         AnyDataSet if PieceWise() has NOT been called. The type
         should be the type of the attribute at the current position if
         PieceWise() has been called.
     PARAMETERS
         num - The Number that needs to be set. etc.

         last_elem - This parameter is relevant only if PieceWise()
                     has been already called (for a collection).
                     Set to TRUE if it is the last element of the collection,
                     FALSE otherwise.
     EXCEPTIONS
         - DBMS_TYPES.invalid_parameters
           Invalid Parameters (if it is not appropriate to add a number
                               at this point in the creation process).
         - DBMS_TYPES.incorrect_usage
           Incorrect usage.
         - DBMS_TYPES.type_mismatch
           When the expected type is different from the passed in type.
     NOTE
         Sets the current data value.
  */
  MEMBER PROCEDURE SetNumber(self IN OUT NOCOPY AnyDataSet,
             num IN NUMBER, last_elem boolean DEFAULT FALSE),
  MEMBER PROCEDURE SetDate(self IN OUT NOCOPY AnyDataSet,
             dat IN DATE, last_elem boolean DEFAULT FALSE),
  MEMBER PROCEDURE SetChar(self IN OUT NOCOPY AnyDataSet, c IN CHAR,
             last_elem boolean DEFAULT FALSE),
  MEMBER PROCEDURE SetVarchar(self IN OUT NOCOPY AnyDataSet,
             c IN VARCHAR, last_elem boolean DEFAULT FALSE),
  MEMBER PROCEDURE SetVarchar2(self IN OUT NOCOPY AnyDataSet,
             c IN VARCHAR2, last_elem boolean DEFAULT FALSE),
  MEMBER PROCEDURE SetRaw(self IN OUT NOCOPY AnyDataSet, r IN RAW,
             last_elem boolean DEFAULT FALSE),
  MEMBER PROCEDURE SetBlob(self IN OUT NOCOPY AnyDataSet, b IN BLOB,
             last_elem boolean DEFAULT FALSE),
  MEMBER PROCEDURE SetClob(self IN OUT NOCOPY AnyDataSet, c IN CLOB,
             last_elem boolean DEFAULT FALSE),
  MEMBER PROCEDURE SetBfile(self IN OUT NOCOPY AnyDataSet,
             b IN BFILE, last_elem boolean DEFAULT FALSE),
  MEMBER PROCEDURE SetObject(self IN OUT NOCOPY AnyDataSet,
             obj IN "<ADT_1>", last_elem boolean DEFAULT FALSE),
  MEMBER PROCEDURE SetObject(self IN OUT NOCOPY AnyDataSet,
             obj IN "<OPAQUE_1>", last_elem boolean DEFAULT FALSE),
  MEMBER PROCEDURE SetRef(self IN OUT NOCOPY AnyDataSet,
             rf IN REF "<ADT_1>", last_elem boolean DEFAULT FALSE),
  MEMBER PROCEDURE SetCollection(self IN OUT NOCOPY AnyDataSet,
             col IN "<COLLECTION_1>", last_elem boolean DEFAULT FALSE),

  /*
     NAME
          EndCreate
     DESCRIPTION
          Ends Creation of a AnyDataSet. Other creation functions cannot be
          called after this call.
  */
  MEMBER PROCEDURE EndCreate(self IN OUT NOCOPY AnyDataSet),

  /* ----------------------------------------------------------------------- */
  /* ACCESSORS */
  /* ----------------------------------------------------------------------- */

  /*
     NAME
          GetTypeName
     DESCRIPTION
          Get the fully qualified Type Name for the AnyDataSet.
          If the AnyDataSet is based on a builtin, this function will return
          NUMBER etc.
          If it is based on a user defined type, this function will return
          <schema_name>.<type_name>. e.g. SCOTT.FOO.
          If it is based on a transient anonymous type, this function will
          return NULL.
     RETURNS
          Type name of the AnyDataSet.
  */
  MEMBER FUNCTION GetTypeName(self IN AnyDataSet) return VARCHAR2
    DETERMINISTIC,
  /* NAME
         GetType
     DESCRIPTION
         Gets the AnyType describing the type of the data instances in an
         AnyDataSet.
     PARAMETER
         typ (OUT) - The AnyType corresponding to the AnyData. May be NULL
                     if it does not represent a user-defined type.
     RETURNS
         The typecode corresponding to the type of the AnyData.
     EXCEPTIONS
  */
  MEMBER FUNCTION GetType(self IN AnyDataSet, typ OUT NOCOPY AnyType)
           return PLS_INTEGER,

  /* NAME
         GetInstance
     DESCRIPTION
         Get's the next instance in an AnyDataSet. Only sequential access to
         the instances in an AnyDataSet is allowed. After this function has
         been called, the Get*() functions can be invoked on the
         AnyDataSet to access the current instance. If PieceWise() is called
         before doing the Get*() calls, the individual attributes
         (or collection elements) can be accessed. It is an error to invoke
          this function before the AnyDataSet is fully created.
     PARAMETERS
         self (IN OUT )   - The AnyDataSet being accessed.
         return          - DBMS_TYPES.SUCCESS or DBMS_TYPES.NO_DATA.
                           DBMS_TYPES.NO_DATA signifies the end of the
                           AnyDataSet when all instances have been accessed.
     NOTE
         This function should be called even before accessing the 1st
         instance.
  */
  MEMBER FUNCTION GetInstance(self IN OUT NOCOPY AnyDataSet)
            return PLS_INTEGER,

  /* NAME
         Get*.
     DESCRIPTION
         Gets the current data value (which should be of appropriate type)
         The type of the current data value depends on the MODE with which
         we are accessing (Depending on how we have invoked the
         PieceWise() call).
         If PieceWise() has NOT been called, we are accessing the
         instance in its entirety and the type of the data value should match
         the type of the AnyDataSet.
         If PieceWise() has been called, we are accessing the
         instance piece wise. The type of the data value should match the type
         of the attribute (or collection element) at the current position.

     PARAMETERS
         num - The Number that needs to be got. etc.
     RETURNS
         DBMS_TYPES.SUCCESS or DBMS_TYPES.NO_DATA
         The return value is relevant only if PieceWise
         has been already called (for a collection). In such a case,
         DBMS_TYPES.NO_DATA signifies the end of the collection when all
         elements have been accessed.
     EXCEPTIONS
         - DBMS_TYPES.invalid_parameters
           Invalid Parameters (if it is not appropriate to add a number
                               at this point in the creation process).
         - DBMS_TYPES.incorrect_usage
           Incorrect usage.
         - DBMS_TYPES.type_mismatch
           When the expected type is different from the passed in type.
  */
  MEMBER FUNCTION GetNumber(self IN AnyDataSet, num OUT NOCOPY NUMBER)
              return PLS_INTEGER,
  MEMBER FUNCTION GetDate(self IN AnyDataSet, dat OUT NOCOPY DATE)
              return PLS_INTEGER,
  MEMBER FUNCTION GetChar(self IN AnyDataSet, c OUT NOCOPY CHAR)
              return PLS_INTEGER,
  MEMBER FUNCTION GetVarchar(self IN AnyDataSet, c OUT NOCOPY VARCHAR)
              return PLS_INTEGER,
  MEMBER FUNCTION GetVarchar2(self IN AnyDataSet, c OUT NOCOPY VARCHAR2)
              return PLS_INTEGER,
  MEMBER FUNCTION GetRaw(self IN AnyDataSet, r OUT NOCOPY RAW)
              return PLS_INTEGER,
  MEMBER FUNCTION GetBlob(self IN AnyDataSet, b OUT NOCOPY BLOB)
              return PLS_INTEGER,
  MEMBER FUNCTION GetClob(self IN AnyDataSet, c OUT NOCOPY CLOB)
              return PLS_INTEGER,
  MEMBER FUNCTION GetBfile(self IN AnyDataSet, b OUT NOCOPY BFILE)
              return PLS_INTEGER,
  MEMBER FUNCTION GetObject(self IN AnyDataSet, obj OUT NOCOPY "<ADT_1>")
              return PLS_INTEGER,
  MEMBER FUNCTION GetObject(self IN AnyDataSet, obj OUT NOCOPY "<OPAQUE_1>")
              return PLS_INTEGER,
  MEMBER FUNCTION GetRef(self IN AnyDataSet, rf OUT NOCOPY REF "<ADT_1>")
              return PLS_INTEGER,
  MEMBER FUNCTION GetCollection(self IN AnyDataSet,
              col OUT NOCOPY "<COLLECTION_1>") return PLS_INTEGER,

  /* NAME
         GetCount
     DESCRIPTION
         Gets the number of data instances in a AnyDataSet.
     PARAMETERS
     EXCEPTIONS
         None.
  */
  MEMBER FUNCTION GetCount(self IN AnyDataSet) return PLS_INTEGER,
  /***************************************************************************/
  /* NEWLY ADDED FUNCTIONS IN 9iR2 */
  /***************************************************************************/
  /* Set Functions for Datetime and NCHAR types. */
  MEMBER PROCEDURE SetTimestamp(self IN OUT NOCOPY AnyDataSet, ts IN TIMESTAMP_UNCONSTRAINED,
                    last_elem IN boolean DEFAULT FALSE),
  MEMBER PROCEDURE SetTimestampTZ(self IN OUT NOCOPY AnyDataSet,
                    ts IN TIMESTAMP_TZ_UNCONSTRAINED,
                    last_elem IN boolean DEFAULT FALSE),
  MEMBER PROCEDURE SetTimestampLTZ(self IN OUT NOCOPY AnyDataSet,
                    ts IN TIMESTAMP_LTZ_UNCONSTRAINED,
                    last_elem IN boolean DEFAULT FALSE),
  MEMBER PROCEDURE SetIntervalYM(self IN OUT NOCOPY AnyDataSet,
                    inv IN YMINTERVAL_UNCONSTRAINED,
                    last_elem IN boolean DEFAULT FALSE),
  MEMBER PROCEDURE SetIntervalDS(self IN OUT NOCOPY AnyDataSet,
                    inv IN DSINTERVAL_UNCONSTRAINED,
                    last_elem IN boolean DEFAULT FALSE),
  MEMBER PROCEDURE SetNchar(self IN OUT NOCOPY AnyDataSet,
                    nc IN NCHAR, last_elem IN boolean DEFAULT FALSE),
  MEMBER PROCEDURE SetNVarchar2(self IN OUT NOCOPY AnyDataSet,
                    nc IN NVarchar2, last_elem IN boolean DEFAULT FALSE),
  MEMBER PROCEDURE SetNClob(self IN OUT NOCOPY AnyDataSet,
                    nc IN NClob, last_elem IN boolean DEFAULT FALSE),
  /* Get Functions for Datetime and NCHAR types. */
  MEMBER FUNCTION GetTimestamp(self IN AnyDataSet, ts OUT NOCOPY TIMESTAMP_UNCONSTRAINED)
       return PLS_INTEGER,
  MEMBER FUNCTION GetTimestampTZ(self IN AnyDataSet,
       ts OUT NOCOPY TIMESTAMP_TZ_UNCONSTRAINED) return PLS_INTEGER,
  MEMBER FUNCTION GetTimestampLTZ(self IN AnyDataSet,
       ts OUT NOCOPY TIMESTAMP_LTZ_UNCONSTRAINED) return PLS_INTEGER,
  MEMBER FUNCTION GetIntervalYM(self IN AnyDataSet,
       inv IN OUT NOCOPY YMINTERVAL_UNCONSTRAINED) return PLS_INTEGER,
  MEMBER FUNCTION GetIntervalDS(self IN AnyDataSet,
       inv IN OUT NOCOPY DSINTERVAL_UNCONSTRAINED) return PLS_INTEGER,
  MEMBER FUNCTION GetNchar(self IN AnyDataSet, nc OUT NOCOPY NCHAR)
       return PLS_INTEGER,
  MEMBER FUNCTION GetNVarchar2(self IN AnyDataSet, nc OUT NOCOPY NVARCHAR2)
       return PLS_INTEGER,
  MEMBER FUNCTION GetNClob(self IN AnyDataSet, nc OUT NOCOPY NCLOB)
       return PLS_INTEGER,
  /***************************************************************************/
  /* NEWLY ADDED FUNCTIONS IN 10iR1 */
  /***************************************************************************/
  /* Set functions for BFloat, BDouble and UROWID. */
  MEMBER PROCEDURE SetBFloat(self IN OUT NOCOPY AnyDataSet, fl IN BINARY_FLOAT,
                    last_elem IN boolean DEFAULT FALSE),
  MEMBER PROCEDURE SetBDouble(self IN OUT NOCOPY AnyDataSet,
                    dbl IN BINARY_DOUBLE, last_elem IN boolean DEFAULT FALSE),
  MEMBER PROCEDURE SetURowid(self IN OUT NOCOPY AnyDataSet, rid IN UROWID,
                    last_elem IN boolean DEFAULT FALSE),
  /* Get functions for Float, Double and UROWID. */
  MEMBER FUNCTION GetBFloat(self IN AnyDataSet, fl OUT NOCOPY BINARY_FLOAT)
       return PLS_INTEGER,
  MEMBER FUNCTION GetBDouble(self IN AnyDataSet, dbl OUT NOCOPY BINARY_DOUBLE)
       return PLS_INTEGER,
  MEMBER FUNCTION GetURowid(self IN AnyDataSet, rid OUT NOCOPY UROWID)
       return PLS_INTEGER
);
/
CREATE OR REPLACE NONEDITIONABLE TYPE BODY "SYS"."ANYDATASET" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
e
46c2 830
+ytiqHLNxbo1w59Fv8CZACagWmEwg0MTNccK3y/GEv+wUF2JR7jjeYrbTnuQ88rBJtYC1aLT
nW1JB4cSKZjSBb8CS2I4fMrW5t4bt1Lbnp+q1a/80FYz2qysFIPv5LEks8FyctJyT+ewv7/n
Y+GZq1GkrubTAXZHhdUBqElUyFv7cxUUZuNloG3rHQGsNNO5NZ3rKJxgJcr6NuChdYqPxX6W
ugBTOfNjHfNvwoHz/zVeoiI27nTG4+5iNf5PqnK5zFkdSjoc6a/fAG4Sdg6k7V4IpAK9zgio
j3TaR2ssbmYQFqsA9cB7mYuDqonpIdtm7hYCnwCsZjm7jhhIVCHhq4+JZ4moAD/RkBTQDXet
IAqKEywj5BteS2wFqbhiRFcYFtbbS8h6GhQZcSV5qVediFE02JL2QMOGCErxyDTrdyWaAvaq
7kdWt3mxc2IBBEVaXj3rhH/clTfbkZle1fS9yRZm/W6V4Xm4bvFFcHOvrIFQY518i0r5xf6y
+Mfn3o+cUQAs9qEh8cRf0XprXOyXPzwhnP8R8iBDdP/tXOKxmsxZS1WTQJpS67Sia3obsvZk
VfRdl4j6acBZRLCKXOl/dsZ4R7oOVphbQOmAHlI6ejjsx/Zux/ZBll5d+ggS6xTBmwS0gYLG
sf8WwKHMkpCAfHYVytysG0A3ehuy+DdXEsBgf8iOrwhX+i7DFh0iMqPdw66Q+XD/aNx+pItL
t9q0UFO6ABrUJorJEBNu17B737ePv9MY3HprbSHttZSABnz4zRlB/BWIXKUx1XYkk71BAuYN
GBaI87GRB7WFhS4RHw9tK6Oyao23LklNesRGhxBf6r/2Wcsr5BU5o5JJqxtSdISNG9i6c1jb
J6BB+Jo5sVXxtnoznrWy1TF3gg8VUebSAwm4ydV40/8bC0I5s9XzCXW3sSRC2L69tqGR5DS5
qXcVPWGJNQGuakXKOXGgkF5cMCtBf+VcO9riQHHzSNHHK+dL0EBpCuIOKVMyBIdxcKa1iQVs
L8ImNXnt8nyYZeDy7E/LfLGX/6aNQ4ytr3vKcdCAXZgKnmvJ0kQ/YtqEVev6Q0W0WG6gA4vf
qquwbhcu1y9PRwGJ1FmjMYITEPAh4bV5CIBZXYlOE29ePKbZ4YdiahVQHIbkqqlSGeyGaBxd
4JfKMvr/dykhQHCR0HK14fDLIvyKznyKdDv/jn0hMCWXQRnA2JIHc+8aSuw65770gyfYZm5z
VIJ3xJKvG9eKvgCuSKCNXcqkbnehIfVJWBUcmtkwASpJpnKSWCpqAiQJc0f5vQq9F9S2nwt6
4DJrRz824sYWiTEkxdGUwqOTVh/3X7MR/AvQpNSP61qULf1nyVlx642jZ1LEVvZQhJt8CoZ+
vtfYhHdOzOnwaQi67z6ZRWxncJj2Ix6T7NoCRo2XHLDHdqZ+4Wet6F+ihwEfTInNzlHbTAGZ
UpSX41/XXlIzpcmWrpU9IeMs7RTm5ARXHwq1z9HsZfN46FFcGwavXgh6PcOF/WKqagg/9rfn
lxmR0HMzMOw364/iiZz3NRxKUkLpTWpJZvIgWqKJe/LbI0X0cJDEwBya910Tp1RChBfqYbyY
e5yIJRv9n7DTA4Ox3sI7g48xWLt+Uc+6igqYe0hDSJi6U/+kxz0y5fkxq5bblp4whjsw5evi
PneuBjUe6UqdBPbXOO2PO+XdCpe5e1FDZWRq8bP+sAyC4tQxooK8RMHAwFfVxe6edelrY/s7
1T+YUHHwxG5FWLArUGEGk+pqn+46ejVB2J8H4YIZs38L1uYSyZYP6m8pIAIxZ2T8tD3XvWxG
HwW2gwtxrnYLzW0GmxZ3D5TE1MTPqyDzMUoxk57ic9Rgbo/oO6URtyBJyxYd0wc0gJr2zmOY
Mi82twemsW/S8I6zss5jdRb6rEoPbcwFgeGkmHvZYvZRY5gq9/VMrc9R2FGIy8fUt7+rKj/E
yGCbTWW5EC+YuhQ1dsZwkjWjxGPbUwCJub2S6NPNGXBSjIGk//nUvSCd+7Ah6/BiajWUlj2v
4bQlQ8NIQTQ8hfIDYXpcKuCXJeE9J3G3wrLFFVEgneSZxhTqFA==

/

  GRANT EXECUTE ON "SYS"."ANYDATASET" TO PUBLIC WITH GRANT OPTION;
--------------------------------------------------------
--  DDL for Type ANYTYPE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."ANYTYPE" 
AS OPAQUE VARYING (*)
USING library DBMS_ANYTYPE_LIB
(

  /* NAME
         BeginCreate()
     DESCRIPTION
         Creates a new instance of ANYTYPE which can be used to create a
         transient type Description.
     PARAMETERS
         typecode - Use a constant from DBMS_TYPES package.
                    Typecodes for  user-defined type:
                     can be  DBMS_TYPES.TYPECODE_OBJECT
                             DBMS_TYPES.TYPECODE_VARRAY or
                             DBMS_TYPES.TYPECODE_TABLE
                    Typecodes for builtin types:
                             DBMS_TYPES.TYPECODE_NUMBER etc.
         atype - AnyType for a transient-type.

     EXCEPTIONS
  */
  STATIC PROCEDURE BeginCreate(typecode IN PLS_INTEGER,
                               atype OUT NOCOPY AnyType),

  /*
     NAME
         SetInfo
     DESCRIPTION
          This procedure sets any additional information required for
          constructing a COLLECTION or builtin type.
          NOTE: It is an error to call this function on an ANYTYPE that
                represents a persistent user defined type.
     PARAMETERS
          self     - The transient ANYTYPE that is being constructed.

          prec, scale (OPTIONAL) - REQUIRED IF TYPECODE REPRESENTS A NUMBER.
                                   Give precision and scale. ignored otherwise.

          len (OPTIONAL) - REQUIRED IF TYPECODE REPRESENTS A RAW, CHAR,
                           VARCHAR, VARCHAR2 types. Gives length.

          csid, csfrm (OPTIONAL) -  REQUIRED IF TYPECODE REPRESENTS Types
                                    requiring character info. For eg: CHAR,
                                    VARCHAR, VARCHAR2, CFILE.

          atype (OPTIONAL)     - REQUIRED IF collection element TYPECODE IS
                                 a user-defined type like TYPECODE_OBJECT
                                 etc. It is also required for a built-in type
                                 that needs user-defined type information
                                 such as TYPECODE_REF. This parameter is not
                                 needed otherwise.

          The following parameters are required for Collection types:

          elem_tc (OPTIONAL)   - Must be of the collection element's typecode
                                 (from DBMS_TYPES package).
          elem_count (OPTIONAL) - Pass 0 for elem_count if the self represents
                                  a nested table (TYPECODE_TABLE). Otherwise
                                  pass the collection count if self represents
                                  a VARRAY.
     EXCEPTIONS
          - DBMS_TYPES.invalid_parameters
            Invalid Parameters (typecode, typeinfo)
          - DBMS_TYPES.incorrect_usage
            incorrect usage (cannot call after calling EndCreate()
                             etc.)
  */
  MEMBER PROCEDURE SetInfo(self IN OUT NOCOPY AnyType,
           prec IN PLS_INTEGER, scale IN PLS_INTEGER,
           len IN PLS_INTEGER,
           csid IN PLS_INTEGER, csfrm IN PLS_INTEGER,
           atype IN ANYTYPE DEFAULT NULL,
           elem_tc IN PLS_INTEGER DEFAULT NULL,
           elem_count IN PLS_INTEGER DEFAULT 0),

  /*
     NAME
          AddAttr
     DESCRIPTION
          This procedure Adds an attribute to an AnyType (of typecode
          DBMS_TYPES.TYPECODE_OBJECT)
     PARAMETERS
          self     - The transient ANYTYPE that is being constructed.
                     Must be of Type DBMS_TYPES.TYPECODE_OBJECT.

          aname (OPTIONAL) - Attribute's name. Could be null.

          typecode - Attribute's typecode. Can be builtin or user-defined.
                     typecode (from DBMS_TYPES package).

          prec, scale (OPTIONAL) - REQUIRED IF TYPECODE REPRESENTS A NUMBER.
                                   Give precision and scale. ignored otherwise.

          len (OPTIONAL) - REQUIRED IF TYPECODE REPRESENTS A RAW, CHAR,
                           VARCHAR, VARCHAR2 types. Gives length.

          csid, csfrm (OPTIONAL) -  REQUIRED IF TYPECODE REPRESENTS Types
                                    requiring character info. For eg: CHAR,
                                    VARCHAR, VARCHAR2, CFILE.

          attr_type (OPTIONAL) - AnyType corresponding to a User defined Type.
                                 This parameter is required if the attribute is
                                 a user defined type.
       EXCEPTIONS
          - DBMS_TYPES.invalid_parameters
            Invalid Parameters (typecode, typeinfo)
          - DBMS_TYPES.incorrect_usage
            incorrect usage (cannot call after calling EndCreate()
                             etc.)
  */
  MEMBER PROCEDURE AddAttr(self IN OUT NOCOPY AnyType,
           aname IN VARCHAR2,
           typecode IN PLS_INTEGER,
           prec IN PLS_INTEGER, scale IN PLS_INTEGER,
           len IN PLS_INTEGER,
           csid IN PLS_INTEGER, csfrm IN PLS_INTEGER,
           attr_type IN ANYTYPE DEFAULT NULL),


  /*
     NAME
          EndCreate
     DESCRIPTION
          Ends Creation of a transient AnyType. Other creation functions cannot
          be called after this call.
  */
  MEMBER PROCEDURE EndCreate(self IN OUT NOCOPY AnyType),

  /* NAME
         GetPersistent()
     DESCRIPTION
        This function is desupported. Use GetANYTypeFromPersistent().
  */
  STATIC FUNCTION GetPersistent(schema_name IN VARCHAR2,
                      type_name IN VARCHAR2,
                      version IN varchar2 DEFAULT NULL) return AnyType,

/* ANYTYPE ACCESSOR FUNCTIONS */

  /*
     NAME
          GetInfo
     DESCRIPTION
          Get the Type Information for the ANYTYPE

     PARAMETERS
          prec, scale  - IF TYPECODE REPRESENTS A NUMBER.
                         Give precision and scale. ignored otherwise.

          len  - IF TYPECODE REPRESENTS A RAW, CHAR,
                 VARCHAR, VARCHAR2 types. Gives length.

          csid, csfrm -  IF TYPECODE REPRESENTS Types
                         requiring character info. For eg: CHAR,
                         VARCHAR, VARCHAR2, CFILE.
          schema_name, type_name, version - Type's schema (if persistent),
                                            typename and version.

          numelems - if self is a VARRAY, this gives the varray count.
                  if self is of TYPECODE_OBJECT, this gives the number of
                  attributes.

     RETURNS
          The typecode of self.

     EXCEPTIONS
          - DBMS_TYPES.invalid_parameters
            Invalid Parameters (position is beyond bounds or
                                the AnyType is not properly Constructed).)
  */
  MEMBER FUNCTION GetInfo (self IN AnyType,
       prec OUT PLS_INTEGER, scale OUT PLS_INTEGER,
       len OUT PLS_INTEGER, csid OUT PLS_INTEGER,
       csfrm OUT PLS_INTEGER,
       schema_name OUT VARCHAR2, type_name OUT VARCHAR2, version OUT varchar2,
       numelems OUT PLS_INTEGER)
                 return PLS_INTEGER,


  /*
     NAME
          GetAttrElemInfo
     DESCRIPTION
          Gets the Type Information for an attribute of the
          type (if it is of TYPECODE_OBJECT)
          Gets the Type Information for a collection's element type if the
          self parameter is of a collection type.
     PARAMETERS
          position  - If self is of TYPECODE_OBJECT, this gives the attribute
                      position (starting at 1). It is ignored otherwise.

          prec, scale  - IF attribute/collection element TYPECODE
                         REPRESENTS A NUMBER. gives precision and scale.
                         ignored otherwise.

          len  - IF attribute/collection element TYPECODE REPRESENTS A RAW,
                 CHAR, VARCHAR, VARCHAR2 types. Gives length.

          csid, csfrm -  IF attribute/collection element TYPECODE REPRESENTS
                         Types requiring character info. For eg: CHAR,
                         VARCHAR, VARCHAR2, CFILE, gives charset id etc.

          attr_elt_type - IF attribute/collection element TYPECODE REPRESENTS
                         a user-defined type, this returns the ANYTYPE
                         corresponding to it. User can subsequently describe
                         the attr_elt_type.
          aname  - Attribute name (if it is an attribute of an object type.
                   NULL otherwise.

     RETURNS
          The typecode of the attribute or collection element.

     EXCEPTIONS
          - DBMS_TYPES.invalid_parameters
            Invalid Parameters (position is beyond bounds or
                                the AnyType is not properly Constructed).)
  */
  MEMBER FUNCTION GetAttrElemInfo (self IN AnyType, pos IN PLS_INTEGER,
       prec OUT PLS_INTEGER, scale OUT PLS_INTEGER,
       len OUT PLS_INTEGER, csid OUT PLS_INTEGER, csfrm OUT PLS_INTEGER,
       attr_elt_type OUT ANYTYPE, aname OUT VARCHAR2) return PLS_INTEGER

);
/
CREATE OR REPLACE NONEDITIONABLE TYPE BODY "SYS"."ANYTYPE" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
e
10c4 3fe
lUg7qCXCfHtNkyPVt2nBvumx8Wwwgz2cr8AFyi9AEjNeil1dR31QGt4Shb1rDddfNqtn3s8l
0lD2sAeHmzNEFJHIRCslyfGSyC2cVUQzmijjImHnY01KZz8iKbAPJKlN1zlHgN5RiAIrnhhc
SfAfuYiw0/TUO984w8PnX4S6CkFS8BKJAm1HP+OyRLPej6wYPEfZ0Dz1zeZY4c93Fq0mN7c5
7vz4uxPVTZM+9HrmXN/lLB0jC0YgWSypnoL4jJ+9o2YudfoOYYy+qd4tTEK63clSNV/qX9Ni
FBYeIQTXYS6yNls1WLUiSkyaKFwnSz7MOVwJTYia9DsVIxcKx7zrTVo7onuWZhby/H7e9l2+
OOVUMqeJ5ZB+wMy8Lz+Qae5K9Q2TP+qx90k8tNIjvLmZ+cP1cbDmIuhDnXO6OjvTapq+l/9h
FptYokxCXjAtBnbc1QEH7X7uznEN4jTVYDpRIdzCSJKn3GWFfaeGlPDTkD6jVp/O8W5Ikrdh
k/41LgMTFOca5eM8wGLn2yl55BzjGltmhq2xbni7nmxi+HbcKZ+10jzNIudroJHPD1nCovQG
HTIGCzVfv/CXGgkJmN1V0q3dwLDvZNT2f1Ue3q+7K55Ihk9iRbDHNEe/pLDc5AD8PBRw8u+x
uukotMgiDI901D3/KJ+rr4SxdTbITdqtOPHY68GqCbBwsLyVhlWw7D4ZU9CyDPdt0lylUrDl
XVHUl0eDn6DRJNxANbHYUphAJQVbnlnXeyTwpEVh1h/LJb5CtqUjbwalWel0ouhghC7YcncB
NZULmGQRkYEpMLG0ugzXwRPslkts/aXZHpBHtR7zq0XRDpTsq5t96qDLU3Z+NcJc5+ilmU5x
YMD8ZsEkc5d63cKmv7CGQr0JEigxvZtL5tV3MfhdMr28qeKYJC08c9LQQQ9OznXnvS7hU1qP
scEvznE2lQ72og5poQmcpV9ShfGeIPQnFMx/Xn4BtNkc8ai4XeGg9o9/rmT4KKqmFJK9vQ==


/

  GRANT EXECUTE ON "SYS"."ANYTYPE" TO PUBLIC WITH GRANT OPTION;
--------------------------------------------------------
--  DDL for Type AQ$_AGENT
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AQ$_AGENT" 
                                                                      
AS OBJECT
( name          varchar2(30), -- M_IDEN, name of a message producer or consumer
  address       varchar2(1024),           -- address where message must be sent
  protocol      number)                -- protocol for communication, must be 0
 alter type     "SYS"."AQ$_AGENT" modify attribute
           (name varchar2(512)) CASCADE

/

  GRANT EXECUTE ON "SYS"."AQ$_AGENT" TO PUBLIC WITH GRANT OPTION;
  GRANT EXECUTE ON "SYS"."AQ$_AGENT" TO PUBLIC WITH GRANT OPTION;
--------------------------------------------------------
--  DDL for Type AQ$_BND
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AQ$_BND" FORCE AS OBJECT (
   dtype        PLS_INTEGER,        /* data type of bind variable
                                       0 - VARCHAR2
                                       1 - NUMBER
                                       2 - RAW
                                       3 - TIMESTAMP WITH TIMEZONE
                                       4 - UROWID
                                                                  */
   bmode         PLS_INTEGER,               /* bind mode (IN|OUT)
                                               0 - IN, 1 - OUT    */

   sz            PLS_INTEGER,       /* Maximum size of data buffer
                                      in case of OUT bind         */

   /* Depending the datatype set in dtype, only one of the following
    * fields is used at any given point.
    */
   str_val      VARCHAR2(32767),
   num_val      NUMBER,
   raw_val      RAW(2000),
   tm_val       TIMESTAMP WITH TIME ZONE,
   urowid_val   UROWID,
   lraw_val     LONG RAW(32767),

   /* Constructors overloaded for different data types
    *
    * PARAMETERS  TO CONSTRUCTOR METHODS:
    *
    *   xxx_val   - Data value of the bind variable
    *   bmode     - Bind mode (IN|OUT)
    *                 0 - IN, 1 - OUT
    *   size      - Maximum size of data buffer in case of out bind
    *               Used oly for constructor methods of VARCHAR2, RAW, LONG RAW types
    */

   CONSTRUCTOR FUNCTION aq$_bnd(str_val VARCHAR2, bmode PLS_INTEGER DEFAULT 0, sz PLS_INTEGER DEFAULT 0) RETURN SELF AS RESULT,
   CONSTRUCTOR FUNCTION aq$_bnd(num_val NUMBER, bmode PLS_INTEGER DEFAULT 0) RETURN SELF AS RESULT,
   CONSTRUCTOR FUNCTION aq$_bnd(raw_val RAW, bmode PLS_INTEGER DEFAULT 0, sz PLS_INTEGER DEFAULT 0) RETURN SELF AS RESULT,
   CONSTRUCTOR FUNCTION aq$_bnd(tm_val TIMESTAMP WITH TIME ZONE, bmode PLS_INTEGER DEFAULT 0) RETURN SELF AS RESULT,
   CONSTRUCTOR FUNCTION aq$_bnd(urowid_val UROWID, bmode PLS_INTEGER DEFAULT 0) RETURN SELF AS RESULT,
   CONSTRUCTOR FUNCTION aq$_bnd(lraw_val LONG RAW, bmode PLS_INTEGER DEFAULT 0, sz PLS_INTEGER DEFAULT 0) RETURN SELF AS RESULT

) NOT PERSISTABLE;
/
CREATE OR REPLACE NONEDITIONABLE TYPE BODY "SYS"."AQ$_BND" AS

CONSTRUCTOR FUNCTION aq$_bnd(str_val VARCHAR2, bmode PLS_INTEGER DEFAULT 0,
                             sz PLS_INTEGER DEFAULT 0)
                     RETURN SELF AS RESULT IS
BEGIN
  SELF.dtype := 0;
  SELF.bmode := bmode;
  SELF.sz := sz;
  SELF.str_val := str_val;
  RETURN;
END;

CONSTRUCTOR FUNCTION aq$_bnd(num_val NUMBER, bmode PLS_INTEGER DEFAULT 0)
                     RETURN SELF AS RESULT IS
BEGIN
  SELF.dtype := 1;
  SELF.bmode := bmode;
  SELF.sz := 0;
  SELF.num_val := num_val;
  RETURN;
END;

CONSTRUCTOR FUNCTION aq$_bnd(raw_val RAW, bmode PLS_INTEGER DEFAULT 0,
                             sz PLS_INTEGER DEFAULT 0)
                     RETURN SELF AS RESULT IS
BEGIN
  SELF.dtype := 2;
  SELF.bmode := bmode;
  SELF.sz := sz;
  SELF.raw_val := raw_val;
  RETURN;
END;

CONSTRUCTOR FUNCTION aq$_bnd(tm_val TIMESTAMP WITH TIME ZONE,
                             bmode PLS_INTEGER DEFAULT 0)
                     RETURN SELF AS RESULT IS
BEGIN
  SELF.dtype := 3;
  SELF.bmode := bmode;
  SELF.sz := 0;
  SELF.tm_val := tm_val;
  RETURN;
END;

CONSTRUCTOR FUNCTION aq$_bnd(urowid_val UROWID, bmode PLS_INTEGER DEFAULT 0)
                     RETURN SELF AS RESULT IS
BEGIN
  SELF.dtype := 4;
  SELF.bmode := bmode;
  SELF.sz := 0;
  SELF.urowid_val := urowid_val;
  RETURN;
END;

CONSTRUCTOR FUNCTION aq$_bnd(lraw_val LONG RAW, bmode PLS_INTEGER DEFAULT 0,
                             sz PLS_INTEGER DEFAULT 0)
                     RETURN SELF AS RESULT IS
BEGIN
  SELF.dtype := 5;
  SELF.bmode := bmode;
  SELF.sz := sz;
  SELF.lraw_val := lraw_val;
  RETURN;
END;

END;

/
--------------------------------------------------------
--  DDL for Type AQ$_BND_ARRAY
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AQ$_BND_ARRAY" FORCE IS VARRAY(64) OF (aq$_bnd) NOT PERSISTABLE;

/
--------------------------------------------------------
--  DDL for Type AQ$_CACHE_MSGBM
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AQ$_CACHE_MSGBM" FORCE
AS OBJECT (
  msgid         RAW(16),
  bitmap        RAW(256),
  lck_bitmap    RAW(256),
  correlation   VARCHAR2(128),
  priority      NUMBER,
  state         NUMBER,
  enq_time      TIMESTAMP(6),
  delivery_time TIMESTAMP(6),
  expiration    TIMESTAMP(6)
 ) NOT PERSISTABLE;

/

  GRANT EXECUTE ON "SYS"."AQ$_CACHE_MSGBM" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type AQ$_DEQUEUE_HISTORY
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AQ$_DEQUEUE_HISTORY" 
                                                                      
AS OBJECT
( consumer              varchar2(30),                    -- identifies dequeuer
  transaction_id        varchar2(22),     -- M_LTID, transaction id of dequeuer
  deq_time              date,                                -- time of dequeue
  deq_user              number,         -- user id of client performing dequeue
  remote_apps           varchar2(4000),        -- string repn. of remote agents
  agent_naming          number,            -- how was the message sent to agent
  propagated_msgid      raw(16))                  -- message id in remote queue
 alter type     "SYS"."AQ$_DEQUEUE_HISTORY" modify attribute
           (consumer varchar2(512)) CASCADE

/

  GRANT EXECUTE ON "SYS"."AQ$_DEQUEUE_HISTORY" TO PUBLIC WITH GRANT OPTION;
  GRANT EXECUTE ON "SYS"."AQ$_DEQUEUE_HISTORY" TO PUBLIC WITH GRANT OPTION;
--------------------------------------------------------
--  DDL for Type AQ$_DESCRIPTOR
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AQ$_DESCRIPTOR" AS OBJECT (
        queue_name       VARCHAR2(65),                -- name of the queue
        consumer_name    VARCHAR2(30),                -- name of the consumer
        msg_id           RAW(16),                     -- message identifier
        msg_prop         msg_prop_t,                  -- message properties
        gen_desc         sys.aq$_ntfn_descriptor,     -- generic descriptor
        msgid_array      sys.aq$_ntfn_msgid_array,    -- grp ntfn msgid list
        ntfnsRecdInGrp   NUMBER)                      -- ntfns recd in grp
 alter type     "SYS"."AQ$_DESCRIPTOR" modify attribute
           (queue_name varchar2(261),
            consumer_name varchar2(512)) CASCADE

/

  GRANT EXECUTE ON "SYS"."AQ$_DESCRIPTOR" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type AQ$_EVENT_MESSAGE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AQ$_EVENT_MESSAGE" 
AS OBJECT (
       sub_name            VARCHAR2(128),        -- name of the subscription
       sub_namespace       NUMBER,              -- namespace of the subscription
       payloadt            NUMBER,              -- payload type
       payload             RAW(2000),           -- message payload
       queue_name          VARCHAR2(65),        -- name of the queue
       msg_id              RAW(16),             -- message identifier
       consumer_name       VARCHAR2(30),        -- name of the consumer
       priority            NUMBER,              -- priority
       delay               NUMBER,              -- delay
       expiration          NUMBER,              -- expiration
       attempts            NUMBER,              -- number of attempts
       enqueue_time        DATE,                -- time of enqueue
       state               NUMBER,              -- state
       exception_queue     VARCHAR2(51),        -- exception queue
       correlation         VARCHAR2(128),       -- correlation
       original_msgid      RAW(16),             -- original message id
       agent_name          VARCHAR2(30),        -- sender name
       agent_address       VARCHAR2(1024),      -- sender address
       agent_protocol      NUMBER,              -- sender protocol
       recipient_list      SYS.AQ$_RECIPIENTS,  -- recipient list
       xmlpayload          VARCHAR2(4000),      -- payload in xml, if reqd.
       pblob               BLOB,                -- blob for storing raw payload
       pdb                 NUMBER)
                                                -- for 11.0 compatible
 alter type     "SYS"."AQ$_EVENT_MESSAGE" modify attribute
           (sub_name varchar2(512),
            queue_name varchar2(261),
            consumer_name varchar2(512),
            exception_queue varchar2(128),
            agent_name varchar2(512))
            CASCADE

/
--------------------------------------------------------
--  DDL for Type AQ$_HISTORY
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AQ$_HISTORY" 
                                                                      
AS VARRAY(1024) OF sys.aq$_dequeue_history

/

  GRANT EXECUTE ON "SYS"."AQ$_HISTORY" TO PUBLIC WITH GRANT OPTION;
  GRANT EXECUTE ON "SYS"."AQ$_HISTORY" TO PUBLIC WITH GRANT OPTION;
--------------------------------------------------------
--  DDL for Type AQ$_JMS_ARRAY_ERROR_INFO
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AQ$_JMS_ARRAY_ERROR_INFO" 
                                                                      
as object
(
   error_position    int,
   error_no          int,
   error_msg         varchar2(4000)
);

/

  GRANT EXECUTE ON "SYS"."AQ$_JMS_ARRAY_ERROR_INFO" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type AQ$_JMS_ARRAY_ERRORS
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AQ$_JMS_ARRAY_ERRORS" 
                                                                      
as varray(2147483647) of aq$_jms_array_error_info;

/

  GRANT EXECUTE ON "SYS"."AQ$_JMS_ARRAY_ERRORS" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type AQ$_JMS_ARRAY_MSGID_INFO
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AQ$_JMS_ARRAY_MSGID_INFO" 
                                                                      
as object
(
   msgid    raw(16)
);

/

  GRANT EXECUTE ON "SYS"."AQ$_JMS_ARRAY_MSGID_INFO" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type AQ$_JMS_ARRAY_MSGIDS
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AQ$_JMS_ARRAY_MSGIDS" 
                                                                      
as varray(2147483647) of raw(16);

/

  GRANT EXECUTE ON "SYS"."AQ$_JMS_ARRAY_MSGIDS" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type AQ$_JMS_BYTES_MESSAGE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AQ$_JMS_BYTES_MESSAGE" 
                                      
as object
(
  header     aq$_jms_header,
  bytes_len  int,
  bytes_raw  raw(2000),
  bytes_lob  blob,
  STATIC FUNCTION construct RETURN aq$_jms_bytes_message,

  --
  -- set_bytes sets payload in RAW into bytes_raw if the length of
  -- payload is <= 2000, otherwise into bytes_lob.
  --
  -- @param payload (IN)
  --
  MEMBER PROCEDURE set_bytes ( payload IN RAW ),

  --
  -- set_bytes sets payload in blob in bytes_lob.
  --
  -- @param payload (IN)
  --
  MEMBER PROCEDURE set_bytes ( payload IN BLOB ),

  --
  -- get_bytes puts bytes_raw into payload if it is not null,
  -- or transfers bytes_lob in blob into payload in RAW if the
  -- length of bytes_lob is =< 32767 (2**16 -1).
  -- Maximum length of raw in PL/SQL is 32767.
  --
  -- @param payload (OUT)
  --
  -- @throws -24190 if bytes_raw is null and
  -- the length of bytes_lob is > 32767.
  --
  MEMBER PROCEDURE get_bytes ( payload OUT RAW ),

  --
  -- get_bytes puts bytes_lob into payload if it is not null,
  -- or transfers bytes_raw in RAW into payload in blob.
  --
  -- @param payload (OUT)
  --
  MEMBER PROCEDURE get_bytes ( payload OUT NOCOPY BLOB ),
 -- *******************************************
  -- The following are common procedures of aq$_jms_stream_message,
  -- aq$_jms_bytes_message and aq$_jms_map_message types to synchronize
  -- the data between JAVA stored procedure and PL/SQL.
  -- *******************************************

  --============================================
  -- Get the JAVA exception thrown during the previous failure.
  -- Only one JAVA exception is recorded for a session. If the
  -- exception is not fetched in time, it might be overwritten
  -- by the exception thrown in next failure.

  STATIC FUNCTION get_exception
  RETURN AQ$_JMS_EXCEPTION,


  --============================================
  -- Clean all the messages in the JVM session memory.
  --

  STATIC PROCEDURE clean_all,


  --============================================
  -- Populate the data at JAVA stored procedure with the data at PL/SQL side.
  --
  -- Underlying, it takes the RAW/BLOB stored in PL/SQL aq$_jms_bytes_message
  -- to construct a JAVA object (for aq$_jms_bytes_message is DataInputStream)
  -- which is stored in ORACLE JVM session memeory.
  --
  -- Parameter "id" is called operation id that is used to identify the slot
  -- where the JAVA object is stored in the ORACLE JVM session memeory.
  -- If "id" is NULL, a new slot is created for this PL/SQL object.
  -- Later JMS operations on the payload need to provide this operation id.
  --
  -- Parameters:
  --  id  - the operation id for this ADT instance.
  --        if id is negative, the system will create a new operation id.
  --
  -- Returns:
  --  the operation id.
  --
  -- The prepare procedure for aq$_jms_bytes_message sets the message access mode
  -- to MESSAGE_ACCESS_READONLY. Later calls of write_XXX procedure raise ORA-24196 error.
  -- User can call clear_body procedure to set the message access mode to
  -- MESSAGE_ACCESS_WRITEONLY.
  --
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.
  -- Raise ORA-24199: JAVA store procedure message store overflow.

  MEMBER FUNCTION prepare (id IN PLS_INTEGER)
 RETURN PLS_INTEGER,


  --============================================
  -- Set the data at JAVA stored procedure as empty payload.
  --
  -- Underlying, it initializes a new DataOutputStream object and set it to
  -- the static varaible in ORACLE JVM session memeory.
  --
  -- Parameter "id" is called operation id that is used to identify the slot
  -- where the JAVA object is stored in the ORACLE JVM session memeory.
  -- If "id" is NULL, a new slot is created for this PL/SQL object.
  -- Later JMS operations on the payload need to provide this operation id.
  --
  -- Parameters:
  --  id  - the operation id for this ADT instance.
  --        if id is negative, the system will create a new operation id.
  --
  -- Returns:
  --  the operation id.
  --
  -- The clear_body procedure for aq$_jms_bytes_message sets the message access mode
  -- to MESSAGE_ACCESS_WRITEONLY. Later calls of read_XXX procedure raise ORA-24196 error.
  -- User can call reset procedure or prepare procedure to set the message access mode
  -- to MESSAGE_ACCESS_READONLY. Note the difference between prepare procedure and
  -- reset procedure.
  --
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.
  -- Raise ORA-24199: JAVA store procedure message store overflow.

  MEMBER FUNCTION clear_body (id IN PLS_INTEGER)
  RETURN PLS_INTEGER,


  --============================================
  -- Get the current message access mode of this message
  -- The result will be either dbms_aqjms.MESSAGE_ACCESS_WRITEONLY or
  -- dbms_aqjms.MESSAGE_ACCESS_READONLY.
  --
  -- Parameters:
  --  id  - the operation id for this ADT instance.
  --
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER FUNCTION get_mode (id IN PLS_INTEGER)
  RETURN PLS_INTEGER,
--============================================
  -- Reset reposition the bytes to the begining for reading.
  --
  -- Parameters:
  --  id  - the operation id for this ADT instance.
  --
  -- The reset procedure for aq$_jms_bytes_message sets the message access mode
  -- to MESSAGE_ACCESS_READONLY. Later calls of write_XXX procedure raise ORA-24196 error.
  -- User can call clear_body procedure to set the message access mode to
  -- MESSAGE_ACCESS_WRITEONLY.
  --
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER PROCEDURE reset (id IN PLS_INTEGER),


  --============================================
  -- Flush the data at JAVA stored procedure side to PL/SQL side.
  --
  -- Underlying, it update the data at PL/SQL side to the payload stored at
  -- the JAVA stored procedure side.
  --
  -- The flush procedure for aq$_jms_bytes_message does not affect current message access
  -- mode. User can continue to call procedures appropriate to the current mode.
  --
  -- Parameters:
  --  id  - the operation id for this ADT instance.
  --
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER PROCEDURE flush (id IN PLS_INTEGER),


  --============================================
  -- clean the data at JAVA stored procedure side to PL/SQL side.
  --
  -- Underlying, it close and clean upthe DataInputStream or DataOutputStream
  -- at the JAVA stored procedure side corresponding to the operation id.
  -- It is very import to call this procedure to avoid memeory leak!
  --
  -- Parameters:
  --  id  - the operation id for this ADT instance.
  --
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER PROCEDURE clean (id IN PLS_INTEGER),
--*******************************************
  -- JMS operations member functions and procedures
  --*******************************************

  --============================================
  -- Read a boolean value from the bytes message.
  --
  -- The function returns NULL if the end of the message stream has been reached.
  --
  -- Parameters:
  --  id  - the operation id for this ADT instance.
  --
  -- Raise ORA-24196: The bytes message is in write-only mode.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER FUNCTION read_boolean (id IN PLS_INTEGER)
  RETURN BOOLEAN,


  --============================================
  -- Read a byte from the bytes message.
  --
  -- The function guarantees that the returned value is in the JAVA byte value range.
  -- This also means if this value is issued with a write_byte function,
  -- there wont be an out of range error raised.
  --
  -- The function returns NULL if the end of the message stream has been reached.
  --
  -- Parameters:
  --  id  - the operation id for this ADT instance.
  --
  -- Raise ORA-24196: The bytes message is in write-only mode.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER FUNCTION read_byte (id IN PLS_INTEGER)
  RETURN PLS_INTEGER,


  --============================================
  -- Read a byte array from the bytes message.
  --
  -- The function read length of the bytes from bytes message stream into value.
  -- It returns the total number of bytes read or -1 when there is no more data
  -- to be read from the bytes stream.
  --
  -- Parameters:
  --  id     - the operation id for this ADT instance.
  --  value  - the bytes read.
  --  length - the length of bytes to read.
-- Raise ORA-24196: The bytes message is in write-only mode.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER FUNCTION read_bytes (id IN PLS_INTEGER, value OUT NOCOPY BLOB, length IN PLS_INTEGER)
  RETURN PLS_INTEGER,


  --============================================
  -- Read a char from the bytes message.
  --
  -- The function returns NULL if the end of the message stream has been reached.
  --
  -- Parameters:
  --  id  - the operation id for this ADT instance.
  --
  -- Raise ORA-24196: The bytes message is in write-only mode.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER FUNCTION read_char (id IN PLS_INTEGER)
  RETURN CHAR,


  --============================================
  -- Read a double from the bytes message.
  --
  -- The function returns NULL if the end of the message stream has been reached.
  --
  -- Parameters:
  --  id  - the operation id for this ADT instance.
  --
  -- Raise ORA-24196: The bytes message is in write-only mode.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER FUNCTION read_double (id IN PLS_INTEGER)
  RETURN DOUBLE PRECISION,

  --============================================
  -- Read a float from the bytes message.
  --
  -- The function returns NULL if the end of the message stream has been reached.
  --
  -- Parameters:
  --  id  - the operation id for this ADT instance.
  --
  -- Raise ORA-24196: The bytes message is in write-only mode.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER FUNCTION read_float (id IN PLS_INTEGER)
RETURN FLOAT,


  --============================================
  -- Read a int from the bytes message.
  --
  -- The function guarantees that the returned value is in the JAVA int value range.
  -- This also means if this value is issued with a write_int function,
  -- there wont be an out of range error raised.
  --
  -- The function returns NULL if the end of the message stream has been reached.
  --
  -- Parameters:
  --  id  - the operation id for this ADT instance.
  --
  -- Raise ORA-24196: The bytes message is in write-only mode.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER FUNCTION read_int (id IN PLS_INTEGER)
  RETURN PLS_INTEGER,


  --============================================
  -- Read a long from the bytes message.
  --
  -- The function guarantees that the returned value is in the JAVA long value range.
  -- This also means if this value is issued with a write_long function,
  -- there wont be an out of range error raised.
  --
  -- The function returns NULL if the end of the message stream has been reached.
  --
  -- Parameters:
  --  id  - the operation id for this ADT instance.
  --
  -- Raise ORA-24196: The bytes message is in write-only mode.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER FUNCTION read_long (id IN PLS_INTEGER)
  RETURN NUMBER,


  --============================================
  -- Read a short from the bytes message.
  --
  -- The function guarantees that the returned value is in the JAVA short value range.
  -- This also means if this value is issued with a write_short function,
  -- there wont be an out of range error raised.
  --
  -- The function returns NULL if the end of the message stream has been reached.
  --
  -- Parameters:
--  id  - the operation id for this ADT instance.
  --
  -- Raise ORA-24196: The bytes message is in write-only mode.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER FUNCTION read_short (id IN PLS_INTEGER)
  RETURN PLS_INTEGER,


  --============================================
  -- Read a unsigned byte from the bytes message.
  --
  -- The function returns NULL if the end of the message stream has been reached.
  --
  -- Parameters:
  --  id  - the operation id for this ADT instance.
  --
  -- Raise ORA-24196: The bytes message is in write-only mode.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER FUNCTION read_unsigned_byte (id IN PLS_INTEGER)
  RETURN PLS_INTEGER,


  --============================================
  -- Read a unsigned short from the bytes message.
  --
  -- The function returns NULL if the end of the message stream has been reached.
  --
  -- Parameters:
  --  id  - the operation id for this ADT instance.
  --
  -- Raise ORA-24196: The bytes message is in write-only mode.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER FUNCTION read_unsigned_short (id IN PLS_INTEGER)
  RETURN PLS_INTEGER,


  --============================================
  -- Read a String from the bytes message.
  --
 -- The function reads a string that has been encoded using UTF-8 fromat within the bytes messaeg.
  -- It returns NULL if the end of the message stream has been reached.
  --
  -- Parameters:
  --  id    - the operation id for this ADT instance.
  --  value - the UTF string that is read.
  --
  -- Raise ORA-24196: The bytes message is in write-only mode.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER PROCEDURE read_utf (id IN PLS_INTEGER, value OUT NOCOPY CLOB),


  --============================================
  -- Write a boolean to the bytes message.
  --
  -- Parameters:
  --  id     - the operation id for this ADT instance.
  --  value  - the boolean value to be written. The value is copied into the bytes message.
  --
  -- Raise ORA-24196: The bytes message is in read-only mode.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER PROCEDURE write_boolean (id IN PLS_INTEGER, value IN BOOLEAN),


  --============================================
  -- Write a byte to the bytes message.
  --
  -- Parameters:
  --  id     - the operation id for this ADT instance.
  --  value  - the byte value to be written. The value is copied into the bytes message.
  --
  -- Raise ORA-24196: The bytes message is in read-only mode.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER PROCEDURE write_byte (id IN PLS_INTEGER, value IN PLS_INTEGER),


  --============================================
  -- Write a byte array to the bytes message.
  --
  -- This procedure takes a RAW type.
  --
  -- Parameters:
  --  id     - the operation id for this ADT instance.
  --  value  - the byte array value to be written. The value is copied into the bytes message.
  --
  -- Raise ORA-24196: The bytes message is in read-only mode.
 -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER PROCEDURE write_bytes (id IN PLS_INTEGER, value IN RAW),


  --============================================
  -- Write a byte array to the bytes message.
  --
  -- This procedure takes a BLOB type.
  --
  -- Parameters:
  --  id     - the operation id for this ADT instance.
  --  value  - the byte array value to be written. The value is copied into the bytes message.
  --
  -- Raise ORA-24196: The bytes message is in read-only mode.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER PROCEDURE write_bytes (id IN PLS_INTEGER, value IN BLOB),


  --============================================
  -- Write a portion of byte array to the bytes message.
  --
  -- This procedure takes a RAW type.
  -- If the range [offset, offset+length] exceeds the boundary of the byte array value,
  -- a JAVA IndexOutOfBoundsException is thrown at the JAVA stored procedure and ORA-24197
  -- ora error is raised at the PL/SQL side. The index starts from 0.
  --
  -- Parameters:
  --  id     - the operation id for this ADT instance.
  --  value  - the byte array value to be written. The value is copied into the bytes message.
  --  offset - the initial offset within the byte array.
  --  length - the number of bytes to use
  --
  -- Raise ORA-24196: The bytes message is in read-only mode.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER PROCEDURE write_bytes (
         id        IN      PLS_INTEGER,
         value     IN      RAW,
         offset    IN      PLS_INTEGER,
         length    IN      PLS_INTEGER
  ),


  --============================================
  -- Write a portion of byte array to the bytes message.
  --
-- This procedure takes a BLOB type.
  -- If the range [offset, offset+length] exceeds the boundary of the byte array value,
  -- a JAVA IndexOutOfBoundsException is thrown at the JAVA stored procedure and ORA-24197
  -- ora error is raised at the PL/SQL side. The index starts from 0.
  --
  -- Parameters:
  --  id     - the operation id for this ADT instance.
  --  value  - the byte array value to be written. The value is copied into the bytes message.
  --  offset - the initial offset within the byte array.
  --  length - the number of bytes to use
  --
  -- Raise ORA-24196: The bytes message is in read-only mode.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER PROCEDURE write_bytes (
         id        IN      PLS_INTEGER,
         value     IN      BLOB,
         offset    IN      PLS_INTEGER,
         length    IN      PLS_INTEGER
  ),

  --============================================
  -- Write a char to the bytes message.
  --
  -- Parameters:
  --  id     - the operation id for this ADT instance.
  --  value  - the char value to be written. The value is copied into the bytes message.
  --
  -- Raise ORA-24196: The bytes message is in read-only mode.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER PROCEDURE write_char (id IN PLS_INTEGER, value IN CHAR),


  --============================================
  -- Write a double to the bytes message.
  --
  -- Parameters:
  --  id     - the operation id for this ADT instance.
  --  value  - the double value to be written. The value is copied into the bytes message.
  --
  -- Raise ORA-24196: The bytes message is in read-only mode.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER PROCEDURE write_double (id IN PLS_INTEGER, value IN DOUBLE PRECISION),


  --============================================
  -- Write a float to the bytes message.
  --
 -- Parameters:
  --  id     - the operation id for this ADT instance.
  --  value  - the float value to be written. The value is copied into the bytes message.
  --
  -- Raise ORA-24196: The bytes message is in read-only mode.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER PROCEDURE write_float (id IN PLS_INTEGER, value IN FLOAT),


  --============================================
  -- Write a int to the bytes message.
  --
  -- Parameters:
  --  id     - the operation id for this ADT instance.
  --  value  - the int value to be written. The value is copied into the bytes message.
  --
  -- Raise ORA-24196: The bytes message is in read-only mode.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER PROCEDURE write_int (id IN PLS_INTEGER, value IN PLS_INTEGER),


  --============================================
  -- Write a long to the bytes message.
  --
  -- Parameters:
  --  id     - the operation id for this ADT instance.
  --  value  - the long value to be written. The value is copied into the bytes message.
  --
  -- Raise ORA-24196: The bytes message is in read-only mode.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER PROCEDURE write_long (id IN PLS_INTEGER, value IN NUMBER),


  --============================================
  -- Write a short to the bytes message.
  --
  -- Parameters:
  --  id     - the operation id for this ADT instance.
  --  value  - the short value to be written. The value is copied into the bytes message.
  --
  -- Raise ORA-24196: The bytes message is in read-only mode.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.
MEMBER PROCEDURE write_short (id IN PLS_INTEGER, value IN PLS_INTEGER),


  --============================================
  -- Write a String to the bytes message.
  --
  -- This procedure writes a VARCHAR2 to the bytes message using UTF-8 encoding.
  --
  -- Parameters:
  --  id     - the operation id for this ADT instance.
  --  value  - the string value to be written. The value is copied into the bytes message.
  --
  -- Raise ORA-24196: The bytes message is in read-only mode.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER PROCEDURE write_utf (id IN PLS_INTEGER, value IN VARCHAR2),


  --============================================
  -- Write a String to the bytes message.
  --
  -- This procedure writes a CLOB to the bytes message using UTF-8 encoding.
  --
  -- Parameters:
  --  id     - the operation id for this ADT instance.
  --  value  - the string value to be written. The value is copied into the bytes message.
  --
  -- Raise ORA-24196: The bytes message is in read-only mode.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER PROCEDURE write_utf (id IN PLS_INTEGER, value IN CLOB),


  --*******************************************
  -- The following are JMS header related procedures
  --*******************************************

  MEMBER PROCEDURE set_replyto (replyto IN      sys.aq$_agent),

  MEMBER PROCEDURE set_type (type       IN      VARCHAR ),

  MEMBER PROCEDURE set_userid (userid   IN      VARCHAR ),

  MEMBER PROCEDURE set_appid (appid     IN      VARCHAR ),

  MEMBER PROCEDURE set_groupid (groupid IN      VARCHAR ),

  MEMBER PROCEDURE set_groupseq (groupseq       IN      int ),
MEMBER PROCEDURE clear_properties ,

  MEMBER PROCEDURE set_boolean_property (
                property_name   IN      VARCHAR,
                property_value  IN      BOOLEAN ),

  MEMBER PROCEDURE set_byte_property (
                property_name   IN      VARCHAR,
                property_value  IN      int ),

  MEMBER PROCEDURE set_short_property (
                property_name   IN      VARCHAR,
                property_value  IN      int ),

  MEMBER PROCEDURE set_int_property (
                property_name   IN      VARCHAR,
                property_value  IN      int ),

  MEMBER PROCEDURE set_long_property (
                property_name   IN      VARCHAR,
                property_value  IN      NUMBER ),

  MEMBER PROCEDURE set_float_property (
                property_name   IN      VARCHAR,
                property_value  IN      FLOAT ),

  MEMBER PROCEDURE set_double_property (
                property_name   IN      VARCHAR,
                property_value  IN      DOUBLE PRECISION ),

  MEMBER PROCEDURE set_string_property (
                property_name   IN      VARCHAR,
                property_value  IN      VARCHAR ),

  MEMBER FUNCTION get_replyto RETURN sys.aq$_agent,

  MEMBER FUNCTION get_type RETURN VARCHAR,

  MEMBER FUNCTION get_userid RETURN VARCHAR,

  MEMBER FUNCTION get_appid RETURN VARCHAR,

  MEMBER FUNCTION get_groupid RETURN VARCHAR,

  MEMBER FUNCTION get_groupseq RETURN int,

  MEMBER FUNCTION get_boolean_property ( property_name   IN      VARCHAR)
  RETURN   BOOLEAN,

  MEMBER FUNCTION get_byte_property ( property_name   IN      VARCHAR)
  RETURN   int,
  MEMBER FUNCTION get_short_property ( property_name   IN      VARCHAR)
  RETURN   int,

  MEMBER FUNCTION get_int_property ( property_name   IN      VARCHAR)
  RETURN   int,

  MEMBER FUNCTION get_long_property ( property_name   IN      VARCHAR)
  RETURN   NUMBER,

  MEMBER FUNCTION get_float_property ( property_name   IN      VARCHAR)
  RETURN   FLOAT,

  MEMBER FUNCTION get_double_property ( property_name   IN      VARCHAR)
  RETURN   DOUBLE PRECISION,

  MEMBER FUNCTION get_string_property ( property_name   IN      VARCHAR)
  RETURN   VARCHAR

);
/
CREATE OR REPLACE NONEDITIONABLE TYPE BODY "SYS"."AQ$_JMS_BYTES_MESSAGE" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
e
5f12 be5
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

/

  GRANT EXECUTE ON "SYS"."AQ$_JMS_BYTES_MESSAGE" TO PUBLIC;
  GRANT EXECUTE ON "SYS"."AQ$_JMS_BYTES_MESSAGE" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type AQ$_JMS_BYTES_MESSAGES
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AQ$_JMS_BYTES_MESSAGES" 
                                                                      
as varray(2147483647) of aq$_jms_bytes_message;

/

  GRANT EXECUTE ON "SYS"."AQ$_JMS_BYTES_MESSAGES" TO PUBLIC;
  GRANT EXECUTE ON "SYS"."AQ$_JMS_BYTES_MESSAGES" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type AQ$_JMS_EXCEPTION
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AQ$_JMS_EXCEPTION" 
                                      
as object
(
  id          number, -- reserved for later use
  exp_name    varchar(200),
  err_msg     varchar(500),
  stack       varchar(4000)
);

/

  GRANT EXECUTE ON "SYS"."AQ$_JMS_EXCEPTION" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type AQ$_JMS_HEADER
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AQ$_JMS_HEADER" 
                                      
as object
(
  replyto     sys.aq$_agent,
  type        varchar(100),
  userid      varchar(100),
  appid       varchar(100),
  groupid     varchar(100),
  groupseq    int,
  properties  aq$_jms_userproparray,
   --
  -- lookup_property_name checks whether new_property_name has existed
  -- in the properties.
  --
  -- @param new_property_name (IN)
  --
  -- @throws -24191 if the property name  has existed
  -- @throws -24192 if the property name  is null
  --
  MEMBER PROCEDURE lookup_property_name (new_property_name IN VARCHAR ),

  --
  -- set_replyto sets replyto which corresponds to JMSReplyTo
  --
  -- @param replyto (IN)
  --
  MEMBER PROCEDURE set_replyto (replyto IN      sys.aq$_agent),

  --
  -- set_type sets JMS type which can be any text, which
  -- corresponds to JMSType
  --
  -- @param type (IN)
  --
  MEMBER PROCEDURE set_type (type       IN      VARCHAR ),

  --
  -- set_userid sets userid which corresponds to JMSXUserID
  --
  -- @param userid (IN)
  --
MEMBER PROCEDURE set_userid (userid   IN      VARCHAR ),

  --
  -- set_appid sets appid which corresponds to JMSXAppID
  --
  -- @param appid (IN)
  --
  MEMBER PROCEDURE set_appid (appid     IN      VARCHAR ),

  --
  -- set_groupid sets groupid which corresponds to JMSXGroupID
  --
  -- @param groupid (IN)
  --
  MEMBER PROCEDURE set_groupid (groupid IN      VARCHAR ),

  --
  -- set_groupseq sets groupseq which corresponds to JMSXGroupSeq
  --
  -- @param groupseq (IN)
  --
  MEMBER PROCEDURE set_groupseq (groupseq       IN      int ),

  --
  -- clear_properties nukes properties.
  --
  MEMBER PROCEDURE clear_properties ,

  --
  -- set_boolean_property checks whether property_name is null or
  -- has existed. If not, it translates property_value into
  -- the NUMBER type since Oracle RDBMS doesnt know BOOLEAN.
  --
  -- @param property_name (IN), property_value (IN)
--
  MEMBER PROCEDURE set_boolean_property (
                property_name   IN      VARCHAR,
                property_value  IN      BOOLEAN ),

  --
  -- set_byte_property checks whether property_name is null or
  -- has existed. If not, it checks whether property_value
  -- is within -128 to 127 (8-bits) because both PL/SQL and Oracle
  -- RDBMS dont have the type byte.
  --
  -- @param property_name (IN), property_value (IN)
  --
  -- @throws -24193 if the property value excceeds the valid range
  --
  MEMBER PROCEDURE set_byte_property (
                property_name   IN      VARCHAR,
                property_value  IN      int ),

  --
  -- set_short_property checks whether property_name is null or
  -- has existed. If not, it checks whether property_value
  -- is within -32768 to 32767 (16-bits) because both PL/SQL
  -- and Oracle RDBMS dont have the type short.
  --
  -- @param property_name (IN), property_value (IN)
  --
  -- @throws -24193 if the property value excceeds the valid range
  --
  MEMBER PROCEDURE set_short_property (
                property_name   IN      VARCHAR,
                property_value  IN      int ),

  --
  -- set_int_property checks whether property_name is null or
  -- has existed. If not, it checks whether property_value
  -- is within -2147483648 to 2147483647 (32-bits) because in
  -- both PL/SQL and Oracle RDBMS the type int (or INTEGER) is
  -- 38 bit.
  --
  -- @param property_name (IN), property_value (IN)
  --
  -- @throws -24193 if the property value excceeds the valid range
  --
  MEMBER PROCEDURE set_int_property (
                property_name   IN      VARCHAR,
                property_value  IN      int ),
--
  -- set_long_property checks whether property_name is null or
  -- has existed. If not, it stores the property_value.
  -- In Java the type long is 64-bit long. In
  -- both PL/SQL and Oracle RDBMS the type NUMBER is
  -- 38 bit. So there is no need to check the range.
  --
  -- @param property_name (IN), property_value (IN)
  --
  MEMBER PROCEDURE set_long_property (
                property_name   IN      VARCHAR,
                property_value  IN      NUMBER ),

  --
  -- set_float_property checks whether property_name is null or
  -- has existed. If not, it stores the property_value.
  --
  -- @param property_name (IN), property_value (IN)
  --
  MEMBER PROCEDURE set_float_property (
                property_name   IN      VARCHAR,
                property_value  IN      FLOAT ),

  --
  -- set_double_property checks whether property_name is null or
  -- has existed. If not, it stores the property_value.
  --
  -- @param property_name (IN), property_value (IN)
  --
  MEMBER PROCEDURE set_double_property (
                property_name   IN      VARCHAR,
                property_value  IN      DOUBLE PRECISION ),

  --
  -- set_string_property checks whether property_name is null or
  -- has existed. If not, it stores the property_value.
  --
  -- @param property_name (IN), property_value (IN)
  --
  MEMBER PROCEDURE set_string_property (
                property_name   IN      VARCHAR,
                property_value  IN      VARCHAR ),

  --
  -- get_replyto returns replyto which corresponds to JMSReplyTo.
  --
  -- @return sys.aq$_agent
  --
  MEMBER FUNCTION get_replyto RETURN sys.aq$_agent,
 --
  -- get_type returns type which corresponds to JMSType.
  --
  -- @return VARCHAR
  --
  MEMBER FUNCTION get_type RETURN VARCHAR,

  --
  -- get_userid returns userid which corresponds to JMSXUserID.
  --
  -- @return VARCHAR
  --
  MEMBER FUNCTION get_userid RETURN VARCHAR,

  --
  -- get_appid returns appid which corresponds to JMSXAppID.
  --
  -- @return VARCHAR
  --
  MEMBER FUNCTION get_appid RETURN VARCHAR,

  --
  -- get_groupid returns groupid which corresponds to JMSXGroupID.
  --
  -- @return VARCHAR
  --
  MEMBER FUNCTION get_groupid RETURN VARCHAR,

  --
  -- get_groupseq returns groupseq which corresponds to JMSXGroupSeq.
  --
  -- @return int
  --
  MEMBER FUNCTION get_groupseq RETURN int,

  --
  -- get_boolean_property returns a BOOLEAN value if it can find
  -- property_name and its java_type is BOOLEAN, and returns a NULL
  -- if it cannot find.
  --
  -- @param property_name (IN)
  --
  -- @return BOOLEAN
  --
  MEMBER FUNCTION get_boolean_property ( property_name   IN      VARCHAR)
  RETURN   BOOLEAN,
 --
  -- get_boolean_property_as_int returns 1 (for TRUE) and 0 (for FALSE)
  -- value if it can find property_name and its java_type is BOOLEAN,
  -- and returns a NULL otherwise.
  --
  -- @param property_name (IN)
  --
  -- @return int
  --
  MEMBER FUNCTION get_boolean_property_as_int ( property_name   IN   VARCHAR)
  RETURN   int,

  --
  -- get_byte_property returns a "byte" value if it can find
  -- property_name and its java_type is byte, and returns a NULL
  -- if it cannot find.
  --
  -- @param property_name (IN)
  --
  -- @return int
  --
  MEMBER FUNCTION get_byte_property ( property_name   IN      VARCHAR)
  RETURN   int,

  --
  -- get_short_property returns a "short" value if it can find
  -- property_name and its java_type is short, and returns a NULL
  -- if it cannot find.
  --
  -- @param property_name (IN)
  --
  -- @return int
  --
  MEMBER FUNCTION get_short_property ( property_name   IN      VARCHAR)
  RETURN   int,

  --
  -- get_int_property returns a int value if it can find
  -- property_name and its java_type is int, and returns a NULL
  -- if it cannot find.
  --
  -- @param property_name (IN)
  --
  -- @return int
  --
  MEMBER FUNCTION get_int_property ( property_name   IN      VARCHAR)
  RETURN   int,

  --
  -- get_long_property returns a int value if it can find
  -- property_name and its java_type is long, and returns a NULL
  -- if it cannot find.
 --
  -- @param property_name (IN)
  --
  -- @return NUMBER
  --
  MEMBER FUNCTION get_long_property ( property_name   IN      VARCHAR)
  RETURN   NUMBER,

  --
  -- get_float_property returns a FLOAT value if it can find
  -- property_name and its java_type is float, and returns a NULL
  -- if it cannot find.
  --
  -- @param property_name (IN)
  --
  -- @return FLOAT
  --
  MEMBER FUNCTION get_float_property ( property_name   IN      VARCHAR)
  RETURN   FLOAT,

  --
  -- get_double_property returns a DOUBLE PRECISION value if it can find
  -- property_name and its java_type is double, and returns a NULL
  -- if it cannot find.
  --
  -- @param property_name (IN)
  --
  -- @return DOUBLE PRECISION
  --
  MEMBER FUNCTION get_double_property ( property_name   IN      VARCHAR)
  RETURN   DOUBLE PRECISION,

  --
  -- get_string_property returns a varchar value if it can find
  -- property_name and its java_type is string, and returns a NULL
  -- if it cannot find.
  --
  -- @param property_name (IN)
  --
  -- @return VARCHAR
  --
  MEMBER FUNCTION get_string_property ( property_name   IN      VARCHAR)
  RETURN   VARCHAR

);
/
CREATE OR REPLACE NONEDITIONABLE TYPE BODY "SYS"."AQ$_JMS_HEADER" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
e
2d85 682
QW3HHSY/cLu59DLyTxreLnU5Fmgwg82TutAG3465gp0VKNV5yFSi4R0FJSaR3Xwxsr0L2utD
PqMm1VyN5eWctWSDSi4GDDm3vUd0A+fzSbzPxvkiLLfHfT8H3Wa6za+xnZqUquQ6IAj4xGSd
EPhbplojAKZhEZhnBIq4YaIKdu/IkTHBz+pLW9pGKbxa7m83yumdq9AGjnpnNDTWBNIxV384
JJmg9F6fAcT2L6aASeEleqFnLFDaw2GRTz3gDJ7CSUQVV2qEdAuszgDpBZvMpajsRiRgc759
NyWU/aoZtngedNZ1/e834KJAHgS2e3Y8QRTIaSIDkKxWYtijNlKqFlY0DTs88ADPejvLW0rz
wT0RJ9/lRzuRxx70mL63ZqwRN7PRMet0NuXdp2fPdUSEMLXiqf2JCVuCNmwea/zS62LIlUKy
S+R7OD6cXso/Q2XytICgyi/pHznGZEFUrTVXhzdnh3MtkVtAGwxBqbjEhjBDQ4n6jQAEQRYw
UXm4p5l6XKXpXs2IQcVB4aFQ7dtdbJCVV2PQapvRnpycAKmcvaxTTWHsAM9cxsZvyxXH5m1W
C4ywB1VE4fYT/MuFBvVQaO77G63le1pWxxAjW78JE0Cbx0WGTYNNrzE/3YrgOh956VaZOjP5
224o6nggvX9A+Gd55COyB56glASpESGr5x45yl2/ENf9bNsBQ6sbXTpHdr5HonI4oTr2q15O
j+je4ushEXqZJ0lvkuYC+U8UQYP7eHHJrdooij3eYhPLw8cb+GDoENDVi02UrvPyA9zlqn8i
Skius+k0boY2fSq9pR8vYILIOE46co+EBBD1tfabcwUhHKn+4Im1+QYWu/hKMk6BmJI6JViC
UBfX5RWXYm7ZmTAKYRM6oLbVvtl8EDcnpIAD3taHQlwfGGLGOOyUVFUmM8+A7JUj9QHFSqPl
dd4eRCdXnkkD+sYI9SXKXYQQHyfistQUTDWd8kzQZFmxhqdF3ML1x/M4sL5nILW80nHyWHFY
CRtijcLcZTCILBbIh2sJSOJZPnhijcKXm+nAWB+J0xhcjAFZBlYQAuVYh1gn6HmathZKlvVv
KtvDEj8JrbBp5rxLi/GXpa9ZvWPRt16iJVbzrjf1gpkAIOsO8DJB0T6aUBPF7cw7KmAhxiZB
VUvv+sKN8iDOOAiJRkT1yFnv44URzqiJ3ueZhgQVLYoCQKgJKEmEiViZJDZYfleIhhHxFWCo
fRms9CyocTKb1ksDOYDkWZ0XtGaAS80IekJdfDSLS+/w6iaCkd/w2BtZ6i75XjP4NixwWJuY
AVupc+YmLlymQ7opQjo0gvzs+LPixHB3pbnlPC42p8HJ7ZQGPZKlVL5V6Zn63yiGBtkAqaRd
jb1Mxmc726NnFYS2SNffKQ1hv4lLtmwGvj5wh8bHz8a/8p0J1R+ku1TBVfJuCmABixWN6pwz
QIFcYb33O2Cj1ZC9x3iIdCPYmBxS/jMvPfsG9VTqisrmE64Nb7K67UO8CGtyXzWqwbsWqsxO
PzR6qiPSgdoSgDH9eLm8XvoeqQDv1LSsvGUwzugEbjQUOde0D5melS8gGK8TnNsOlLf2NWuI
fhJeftzaCwPWnYLJTdhEWPC7KepH7ke3hGG8bwd+nw/gkqIJOrsotR3Vcrjj

/

  GRANT EXECUTE ON "SYS"."AQ$_JMS_HEADER" TO PUBLIC;
  GRANT EXECUTE ON "SYS"."AQ$_JMS_HEADER" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type AQ$_JMS_MAP_MESSAGE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AQ$_JMS_MAP_MESSAGE" 
                                       authid current_user
as object
(
  header     aq$_jms_header,
  bytes_len  int,
  bytes_raw  raw(2000),
  bytes_lob  blob,
  STATIC FUNCTION construct RETURN aq$_jms_map_message,


  -- *******************************************
  -- The following are common procedures of aq$_jms_stream_message,
  -- aq$_jms_bytes_message and aq$_jms_map_message types to synchronize
  -- the data between JAVA stored procedure and PL/SQL.
  -- *******************************************

  --============================================
  -- Get the JAVA exception thrown during the previous failure.
  -- Only one JAVA exception is recorded for a session. If the
  -- exception is not fetched in time, it might be overwritten
  -- by the exception thrown in next failure.

  STATIC FUNCTION get_exception
  RETURN AQ$_JMS_EXCEPTION,


  --============================================
  -- Clean all the messages in the JVM session memory.
  --

  STATIC PROCEDURE clean_all,


  --============================================
  -- Populate the data at JAVA stored procedure with the data at PL/SQL side.
  --
  -- Underlying, it takes the RAW/BLOB stored in PL/SQL aq$_jms_map_message
  -- to construct a JAVA object (for aq$_jms_map_message is Hashtable)
  -- which is stored in ORACLE JVM session memeory.
  --
  -- Parameter "id" is called operation id that is used to identify the slot
  -- where the JAVA object is stored in the ORACLE JVM session memeory.
  -- If "id" is NULL, a new slot is created for this PL/SQL object.
  -- Later JMS operations on the payload need to provide this operation id.
  --
  -- Parameters:
  --  id  - the operation id for this ADT instance.
  --        if id is negative, the system will create a new operation id.
  --
  -- Returns:
  --  the operation id.
  --
  -- There is no message access mode concept in aq$_jms_map_message.
  -- The map message can be both written and read at any time and change is reflect immediately.
  --
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.
  -- Raise ORA-24199: JAVA store procedure message store overflow.
 MEMBER FUNCTION prepare (id IN PLS_INTEGER)
  RETURN PLS_INTEGER,


  --============================================
  -- Set the data at JAVA stored procedure as empty payload.
  --
  -- Underlying, it initialize an new Hashtable object and set it to
  -- the static varaible in ORACLE JVM session memeory.
  --
  -- Parameter "id" is called operation id that is used to identify the slot
  -- where the JAVA object is stored in the ORACLE JVM session memeory.
  -- If "id" is NULL, a new slot is created for this PL/SQL object.
  -- Later JMS operations on the payload need to provide this operation id.
  --
  -- Parameters:
  --  id  - the operation id for this ADT instance.
  --        if id is negative, the system will create a new operation id.
  --
  -- Returns:
  --  the operation id.
  --
  -- There is no message access mode concept in aq$_jms_map_message.
  -- The map message can be both written and read at any time and change is reflect immediately.
  --
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.
  -- Raise ORA-24199: JAVA store procedure message store overflow.

  MEMBER FUNCTION clear_body (id IN PLS_INTEGER)
  RETURN PLS_INTEGER,

  --============================================
  -- Flush the data at JAVA stored procedure side to PL/SQL side.
  --
  -- Underlying, it update the data at PL/SQL side to the payload stored at
  -- the JAVA stored procedure side.
  --
  -- Parameters:
  --  id  - the operation id for this ADT instance.
  --
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER PROCEDURE flush (id IN PLS_INTEGER),

--============================================
  -- clean the data at JAVA stored procedure side to PL/SQL side.
  --
  -- Underlying, it set the static variable of Hashtable to null
  -- at the JAVA stored procedure side corresponding to the operation id.
  -- It is very import to call this procedure to avoid memeory leak!
  --
  -- Parameters:
  --  id  - the operation id for this ADT instance.
  --
  -- Raise ORA-24198: Invalid operation id.

  MEMBER PROCEDURE clean (id IN PLS_INTEGER),


  --*******************************************
  -- JMS operations member functions and procedures
  --*******************************************

  --============================================
  -- Retrieve the size of the map message.
  --
  -- Parameters:
  --  id   - the operation id for this ADT instance.
  --
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER FUNCTION get_size (id IN PLS_INTEGER)
  RETURN PLS_INTEGER,


  --============================================
  -- Retrieve all the names within the map message.
  -- Since aq$_jms_namearray has a size of 1024 and each element a varchar(200),
  -- this function raise error if either of sizes limit is exceeded.
  --
  -- Parameters:
  --  id   - the operation id for this ADT instance.
  --
  -- Raise ORA-24195: size of the name array or the size of a name eceed the limit.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER FUNCTION get_names (id IN PLS_INTEGER)
  RETURN AQ$_JMS_NAMEARRAY,

--============================================
  -- Retrieve a portion of the names within the map message.
  -- Since aq$_jms_namearray has a size of 1024 and each element a varchar(200),
  -- this function raise error if either of sizes limit is exceeded.
  -- The index of map message starts from 0.
  --
  -- The function returns the number of names that has been retrieved.
  -- The names retrieved is the intersection of the interval [offset, offset+length-1]
  -- and interval [0, size-1] where size is the size of this map message.
  -- If the intersection is empty set, names will be NULL and the function returns 0
  -- as the number of names retrieved. These can be used as a test that there is
  -- no more name to read from the map message.
  --
  -- Parameters:
  --  id      - the operation id for this ADT instance.
  --  names   - the names that has been retrieved.
  --  offset  - the offset from which to start retrieving.
  --  length  - the length of the names to be retrieved.
  --
  -- Raise ORA-24195: size of the name array or the size of a name eceed the limit.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER FUNCTION get_names (
         id       IN        PLS_INTEGER,
         names    OUT       AQ$_JMS_NAMEARRAY,
         offset   IN        PLS_INTEGER,
         length   IN        PLS_INTEGER )
  RETURN PLS_INTEGER,


  --============================================
  -- Test whether an item exists in the map message.
  -- Return TRUE if the item exists.
  --
  -- Parameters:
  --  id   - the operation id for this ADT instance.
  --  name - the specified name.
  --
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER FUNCTION item_exists (id IN PLS_INTEGER, name IN VARCHAR2)
  RETURN BOOLEAN,


  --============================================
  -- Read a object value from the map message.
  --
  -- The function returns a general value ADT AQ$_JMS_VALUE. User can use the
  -- "type" attribute of this ADT to interpret the data.
-- The following is a map among type attribute, JAVA type and value attributes
  --
  -- -----------------------------------------------------------------
  --               type                 | JAVA type | value attributes
  -- -----------------------------------------------------------------
  -- DBMS_JMS_PLSQL.DATA_TYPE_BYTE      |  byte     |    num_val
  -- -----------------------------------------------------------------
  -- DBMS_JMS_PLSQL.DATA_TYPE_SHORT     |  short    |    num_val
  -- -----------------------------------------------------------------
  -- DBMS_JMS_PLSQL.DATA_TYPE_INTEGER   |  int      |    num_val
  -- -----------------------------------------------------------------
  -- DBMS_JMS_PLSQL.DATA_TYPE_LONG      |  long     |    num_val
  -- -----------------------------------------------------------------
  -- DBMS_JMS_PLSQL.DATA_TYPE_FLOAT     |  float    |    num_val
  -- -----------------------------------------------------------------
  -- DBMS_JMS_PLSQL.DATA_TYPE_DOUBLE    |  double   |    num_val
  -- -----------------------------------------------------------------
  -- DBMS_JMS_PLSQL.DATA_TYPE_BOOLEAN   |  boolean  |    num_val
  -- -----------------------------------------------------------------
  -- DBMS_JMS_PLSQL.DATA_TYPE_CHARACTER |  char     |    char_val
  -- -----------------------------------------------------------------
  -- DBMS_JMS_PLSQL.DATA_TYPE_STRING    |  String   |    text_val
  -- -----------------------------------------------------------------
  -- DBMS_JMS_PLSQL.DATA_TYPE_BYTES     |  byte[]   |    bytes_val
  -- -----------------------------------------------------------------
  --
  -- The function returns NULL if there is no such item with the specified name.
  --
  -- Also note that this memeber procedure might bring additional overhead
  -- comparing to other "read" memeber procedures. It is used only if the user
  -- does not know the data type before hand, otherwise it is always a good idea
  -- to use a specific read member procedure.
  --
  -- Parameters:
  --  id    - the operation id for this ADT instance.
  --  name  - the specified name.
  --  value - the object that is read.
  --
  -- Raise ORA-24194: The type conversion between the type of real value and the expected type is invalid.
  --                  In this particular case, an object with unsupported type is read from the stream.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER PROCEDURE get_object (id IN PLS_INTEGER, name IN VARCHAR2, value OUT NOCOPY AQ$_JMS_VALUE),
 --============================================
  -- Get a boolean value from the map message with the specified name.
  --
  -- The function returns NULL if there is no such item with the specified name.
  --
  -- Parameters:
  --  id   - the operation id for this ADT instance.
  --  name - the specified name.
  --
  -- Raise ORA-24194: The type conversion between the type of real value and the expected type is invalid.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER FUNCTION get_boolean (id IN PLS_INTEGER, name IN VARCHAR2)
  RETURN BOOLEAN,


  --============================================
  -- Get a byte from the map message with the specified name.
  --
  -- The function guarantees that the returned value is in the JAVA byte value range.
  -- This also means if this value is issued with a set_byte function,
  -- there wont be an out of range error raised.
  --
  -- The function returns NULL if there is no such item with the specified name.
  --
  -- Parameters:
  --  id   - the operation id for this ADT instance.
  --  name - the specified name.
  --
  -- Raise ORA-24194: The type conversion between the type of real value and the expected type is invalid.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER FUNCTION get_byte (id IN PLS_INTEGER, name IN VARCHAR2)
  RETURN PLS_INTEGER,


  --============================================
  -- Get a byte array from the map message with the specified name.
  --
  -- The function returns NULL if there is no such item with the specified name.
  --
  -- Parameters:
  --  id    - the operation id for this ADT instance.
  --  name  - the specified name.
  --  value - the bytes that is read.
  --
  -- Raise ORA-24194: The type conversion between the type of real value and the expected type is invalid.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
-- Raise ORA-24198: Invalid operation id.

  MEMBER PROCEDURE get_bytes (id IN PLS_INTEGER, name IN VARCHAR2, value OUT NOCOPY BLOB),

  --============================================
  -- Get a char from the map message with the specified name.
  --
  -- The function returns NULL if there is no such item with the specified name.
  --
  -- Parameters:
  --  id   - the operation id for this ADT instance.
  --  name - the specified name.
  --
  -- Raise ORA-24194: The type conversion between the type of real value and the expected type is invalid.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER FUNCTION get_char (id IN PLS_INTEGER, name IN VARCHAR2)
  RETURN CHAR,


  --============================================
  -- Get a double from the map message with the specified name.
  --
  -- The function returns NULL if there is no such item with the specified name.
  --
  -- Parameters:
  --  id   - the operation id for this ADT instance.
  --  name - the specified name.
  --
  -- Raise ORA-24194: The type conversion between the type of real value and the expected type is invalid.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER FUNCTION get_double (id IN PLS_INTEGER, name IN VARCHAR2)
  RETURN DOUBLE PRECISION,

  --============================================
  -- Get a float from the map message with the specified name.
  --
  -- The function returns NULL if there is no such item with the specified name.
  --
  -- Parameters:
  --  id   - the operation id for this ADT instance.
  --  name - the specified name.
  --
  -- Raise ORA-24194: The type conversion between the type of real value and the expected type is invalid.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.
MEMBER FUNCTION get_float (id IN PLS_INTEGER, name IN VARCHAR2)
  RETURN FLOAT,


  --============================================
  -- Get a int from the map message with the specified name.
  --
  -- The function guarantees that the returned value is in the JAVA int value range.
  -- This also means if this value is issued with a set_int function,
  -- there wont be an out of range error raised.
  --
  -- The function returns NULL if there is no such item with the specified name.
  --
  -- Parameters:
  --  id   - the operation id for this ADT instance.
  --  name - the specified name.
  --
  -- Raise ORA-24194: The type conversion between the type of real value and the expected type is invalid.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER FUNCTION get_int (id IN PLS_INTEGER, name IN VARCHAR2)
  RETURN PLS_INTEGER,


  --============================================
  -- Get a long from the map message with the specified name.
  --
  -- The function guarantees that the returned value is in the JAVA long value range.
  -- This also means if this value is issued with a set_long function,
  -- there wont be an out of range error raised.
  --
  -- The function returns NULL if there is no such item with the specified name.
  --
  -- Parameters:
  --  id   - the operation id for this ADT instance.
  --  name - the specified name.
  --
  -- Raise ORA-24194: The type conversion between the type of real value and the expected type is invalid.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER FUNCTION get_long (id IN PLS_INTEGER, name IN VARCHAR2)
  RETURN NUMBER,


  --============================================
  -- Get a short from the map message with the specified name.
  --
  -- The function guarantees that the returned value is in the JAVA short value range.
  -- This also means if this value is issued with a set_short function,
  -- there wont be an out of range error raised.
  --
  -- The function returns NULL if there is no such item with the specified name.
  --
  -- Parameters:
  --  id   - the operation id for this ADT instance.
  --  name - the specified name.
  --
  -- Raise ORA-24194: The type conversion between the type of real value and the expected type is invalid.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER FUNCTION get_short (id IN PLS_INTEGER, name IN VARCHAR2)
  RETURN PLS_INTEGER,

  --============================================
  -- Get a String from the map message with the specified name.
  --
  -- The function returns NULL if there is no such item with the specified name.
  --
  -- Parameters:
  --  id    - the operation id for this ADT instance.
  --  name  - the specified name.
  --  value - the string that is read.
  --
  -- Raise ORA-24194: The type conversion between the type of real value and the expected type is invalid.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER PROCEDURE get_string (id IN PLS_INTEGER, name IN VARCHAR2, value OUT NOCOPY CLOB),


  --============================================
  -- Set a boolean to the map message with the specified name.
  --
  -- Parameters:
  --  id     - the operation id for this ADT instance.
  --  name   - the specified name.
  --  value  - the boolean value to be written. The value is copied into the map message.
  --
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER PROCEDURE set_boolean (id IN PLS_INTEGER, name IN VARCHAR2, value IN BOOLEAN),


  --============================================
  -- Set a byte to the map message with the specified name.
  --
  -- Parameters:
  --  id     - the operation id for this ADT instance.
--  name   - the specified name.
  --  value  - the byte value to be written. The value is copied into the map message.
  --
  -- Raise ORA-24193: The parameter value exceeds the valid JAVA type range.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER PROCEDURE set_byte (id IN PLS_INTEGER, name IN VARCHAR2, value IN PLS_INTEGER),


  --============================================
  -- Set a byte array to the map message with the specified name.
  --
  -- This procedure takes a RAW type.
  --
  -- Parameters:
  --  id     - the operation id for this ADT instance.
  --  name   - the specified name.
  --  value  - the byte array value to be written. The value is copied into the map message.
  --
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER PROCEDURE set_bytes (id IN PLS_INTEGER, name IN VARCHAR2, value IN RAW),


  --============================================
  -- Set a byte array to the map message with the specified name.
  --
  -- This procedure takes a BLOB type.
  --
  -- Parameters:
  --  id     - the operation id for this ADT instance.
  --  name   - the specified name.
  --  value  - the byte array value to be written. The value is copied into the map message.
  --
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER PROCEDURE set_bytes (id IN PLS_INTEGER, name IN VARCHAR2, value IN BLOB),


  --============================================
  -- Set a portion of byte array to the map message with the specified name.
  --
  -- This procedure takes a RAW type.
  -- If the range [offset, offset+length] exceeds the boundary of the byte array value,
  -- a JAVA IndexOutOfBoundsException is thrown at the JAVA stored procedure and ORA-24197
  -- ora error is raised at the PL/SQL side. The index starts from 0.
  --
  -- Parameters:
  --  id     - the operation id for this ADT instance.
 --  name   - the specified name.
  --  value  - the byte array value to be written. The value is copied into the map message.
  --  offset - the initial offset within the byte array.
  --  length - the number of bytes to use
  --
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER PROCEDURE set_bytes (
         id        IN      PLS_INTEGER,
         name      IN      VARCHAR2,
         value     IN      RAW,
         offset    IN      PLS_INTEGER,
         length    IN      PLS_INTEGER
  ),


  --============================================
  -- Set a portion of byte array to the map message with the specified name.
  --
  -- This procedure takes a BLOB type.
  -- If the range [offset, offset+length] exceeds the boundary of the byte array value,
  -- a JAVA IndexOutOfBoundsException is thrown at the JAVA stored procedure and ORA-24197
  -- ora error is raised at the PL/SQL side. The index starts from 0.
  --
  -- Parameters:
  --  id     - the operation id for this ADT instance.
  --  name   - the specified name.
  --  value  - the byte array value to be written. The value is copied into the map message.
  --  offset - the initial offset within the byte array.
  --  length - the number of bytes to use
  --
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER PROCEDURE set_bytes (
         id        IN      PLS_INTEGER,
         name      IN      VARCHAR2,
         value     IN      BLOB,
         offset    IN      PLS_INTEGER,
         length    IN      PLS_INTEGER
  ),

  --============================================
  -- Set a char to the map message with the specified name.
  --
  -- Parameters:
  --  id     - the operation id for this ADT instance.
  --  name   - the specified name.
  --  value  - the char value to be written. The value is copied into the map message.
  --
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.
  MEMBER PROCEDURE set_char (id IN PLS_INTEGER, name IN VARCHAR2, value IN CHAR),


  --============================================
  -- Set a double to the map message with the specified name.
  --
  -- Parameters:
  --  id     - the operation id for this ADT instance.
  --  name   - the specified name.
  --  value  - the double value to be written. The value is copied into the map message.
  --
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER PROCEDURE set_double (id IN PLS_INTEGER, name IN VARCHAR2, value IN DOUBLE PRECISION),


  --============================================
  -- Set a float to the map message with the specified name.
  --
  -- Parameters:
  --  id     - the operation id for this ADT instance.
  --  name   - the specified name.
  --  value  - the float value to be written. The value is copied into the map message.
  --
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER PROCEDURE set_float (id IN PLS_INTEGER, name IN VARCHAR2, value IN FLOAT),


  --============================================
  -- Set a int to the map message with the specified name.
  --
  -- Parameters:
  --  id     - the operation id for this ADT instance.
  --  name   - the specified name.
  --  value  - the int value to be written. The value is copied into the map message.
  --
  -- Raise ORA-24193: The parameter value exceeds the valid JAVA type range.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER PROCEDURE set_int (id IN PLS_INTEGER, name IN VARCHAR2, value IN PLS_INTEGER),


  --============================================
  -- Set a long to the map message with the specified name.
  --
  -- Parameters:
  --  id     - the operation id for this ADT instance.
  --  name   - the specified name.
 --  value  - the long value to be written. The value is copied into the map message.
  --
  -- Raise ORA-24193: The parameter value exceeds the valid JAVA type range.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER PROCEDURE set_long (id IN PLS_INTEGER, name IN VARCHAR2, value IN NUMBER),


  --============================================
  -- Set a short to the map message with the specified name.
  --
  -- Parameters:
  --  id     - the operation id for this ADT instance.
  --  name   - the specified name.
  --  value  - the short value to be written. The value is copied into the map message.
  --
  -- Raise ORA-24193: The parameter value exceeds the valid JAVA type range.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER PROCEDURE set_short (id IN PLS_INTEGER, name IN VARCHAR2, value IN PLS_INTEGER),


  --============================================
  -- Set a String to the map message with the specified name.
  --
  -- This procedure takes VARCHAR2 type.
  --
  -- Parameters:
  --  id     - the operation id for this ADT instance.
  --  name   - the specified name.
  --  value  - the string value to be written. The value is copied into the map message.
  --
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER PROCEDURE set_string (id IN PLS_INTEGER, name IN VARCHAR2, value IN VARCHAR2),


  --============================================
  -- Set a String to the map message with the specified name.
  --
  -- This procedure takes CLOB type.
  --
  -- Parameters:
  --  id     - the operation id for this ADT instance.
  --  name   - the specified name.
  --  value  - the string value to be written. The value is copied into the map message.
  --
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.
MEMBER PROCEDURE set_string (id IN PLS_INTEGER, name IN VARCHAR2, value IN CLOB),


  --*******************************************
  -- The following are JMS header related procedures
  --*******************************************

  MEMBER PROCEDURE set_replyto (replyto IN      sys.aq$_agent),

  MEMBER PROCEDURE set_type (type       IN      VARCHAR ),

  MEMBER PROCEDURE set_userid (userid   IN      VARCHAR ),

  MEMBER PROCEDURE set_appid (appid     IN      VARCHAR ),

  MEMBER PROCEDURE set_groupid (groupid IN      VARCHAR ),

  MEMBER PROCEDURE set_groupseq (groupseq       IN      int ),

  MEMBER PROCEDURE clear_properties ,

  MEMBER PROCEDURE set_boolean_property (
                property_name   IN      VARCHAR,
                property_value  IN      BOOLEAN ),

  MEMBER PROCEDURE set_byte_property (
                property_name   IN      VARCHAR,
                property_value  IN      int ),

  MEMBER PROCEDURE set_short_property (
                property_name   IN      VARCHAR,
                property_value  IN      int ),

  MEMBER PROCEDURE set_int_property (
                property_name   IN      VARCHAR,
                property_value  IN      int ),

  MEMBER PROCEDURE set_long_property (
                property_name   IN      VARCHAR,
                property_value  IN      NUMBER ),

  MEMBER PROCEDURE set_float_property (
                property_name   IN      VARCHAR,
                property_value  IN      FLOAT ),

  MEMBER PROCEDURE set_double_property (
                property_name   IN      VARCHAR,
                property_value  IN      DOUBLE PRECISION ),

  MEMBER PROCEDURE set_string_property (
                property_name   IN      VARCHAR,
                property_value  IN      VARCHAR ),
MEMBER FUNCTION get_replyto RETURN sys.aq$_agent,

  MEMBER FUNCTION get_type RETURN VARCHAR,

  MEMBER FUNCTION get_userid RETURN VARCHAR,

  MEMBER FUNCTION get_appid RETURN VARCHAR,

  MEMBER FUNCTION get_groupid RETURN VARCHAR,

  MEMBER FUNCTION get_groupseq RETURN int,

  MEMBER FUNCTION get_boolean_property ( property_name   IN      VARCHAR)
  RETURN   BOOLEAN,

  MEMBER FUNCTION get_byte_property ( property_name   IN      VARCHAR)
  RETURN   int,

  MEMBER FUNCTION get_short_property ( property_name   IN      VARCHAR)
  RETURN   int,

  MEMBER FUNCTION get_int_property ( property_name   IN      VARCHAR)
  RETURN   int,

  MEMBER FUNCTION get_long_property ( property_name   IN      VARCHAR)
  RETURN   NUMBER,

  MEMBER FUNCTION get_float_property ( property_name   IN      VARCHAR)
  RETURN   FLOAT,

  MEMBER FUNCTION get_double_property ( property_name   IN      VARCHAR)
  RETURN   DOUBLE PRECISION,

  MEMBER FUNCTION get_string_property ( property_name   IN      VARCHAR)
  RETURN   VARCHAR


);
/
CREATE OR REPLACE NONEDITIONABLE TYPE BODY "SYS"."AQ$_JMS_MAP_MESSAGE" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
e
5b41 aa1
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
SyKtk6XDb0+dc1u8tD7E

/

  GRANT EXECUTE ON "SYS"."AQ$_JMS_MAP_MESSAGE" TO PUBLIC;
  GRANT EXECUTE ON "SYS"."AQ$_JMS_MAP_MESSAGE" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type AQ$_JMS_MAP_MESSAGES
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AQ$_JMS_MAP_MESSAGES" 
                                                                      
as varray(2147483647) of aq$_jms_map_message;

/

  GRANT EXECUTE ON "SYS"."AQ$_JMS_MAP_MESSAGES" TO PUBLIC;
  GRANT EXECUTE ON "SYS"."AQ$_JMS_MAP_MESSAGES" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type AQ$_JMS_MESSAGE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AQ$_JMS_MESSAGE" 
                                      
as object
(
  header        aq$_jms_header,
  senderid      varchar2(100),
  message_type  int,
  text_len      int,
  bytes_len     int,
  text_vc       varchar2(4000),
  bytes_raw     raw(2000),
  text_lob      clob,
  bytes_lob     blob,
  STATIC FUNCTION construct ( mtype IN int ) RETURN aq$_jms_message,

  --*******************************************
  -- Pseudo upcast to aq$_jms_messaeg
  --*******************************************

  STATIC FUNCTION construct( text_msg IN  aq$_jms_text_message)
  RETURN aq$_jms_message,

  STATIC FUNCTION construct( bytes_msg IN  aq$_jms_bytes_message)
  RETURN aq$_jms_message,

  STATIC FUNCTION construct( stream_msg IN  aq$_jms_stream_message)
  RETURN aq$_jms_message,

  STATIC FUNCTION construct( map_msg IN  aq$_jms_map_message)
  RETURN aq$_jms_message,

  STATIC FUNCTION construct( object_msg IN  aq$_jms_object_message)
  RETURN aq$_jms_message,

  -- cast an aq$_jms_message to an aq$_jms_text_message
  --
  -- Return aq$_jms_text_message or NULL if message_type attribute of the aq$_jms_message
  -- is not DBMS_AQ.JMS_TEXT_MESSAGE.

  MEMBER FUNCTION cast_to_text_msg RETURN aq$_jms_text_message,

  --
  -- cast an aq$_jms_message to an aq$_jms_bytes_message
  --
  -- Return aq$_jms_bytes_message or NULL if message_type attribute of the aq$_jms_message
  -- is not DBMS_AQ.JMS_BYTES_MESSAGE.

  MEMBER FUNCTION cast_to_bytes_msg RETURN aq$_jms_bytes_message,
--
  -- cast an aq$_jms_message to an aq$_jms_stream_message
  --
  -- Return aq$_jms_stream_message or NULL if message_type attribute of the aq$_jms_message
  -- is not DBMS_AQ.JMS_STREAM_MESSAGE.

  MEMBER FUNCTION cast_to_stream_msg RETURN aq$_jms_stream_message,

  --
  -- cast an aq$_jms_message to an aq$_jms_map_message
  --
  -- Return aq$_jms_map_message or NULL if message_type attribute of the aq$_jms_message
  -- is not DBMS_AQ.JMS_MAP_MESSAGE.
MEMBER FUNCTION cast_to_map_msg RETURN aq$_jms_map_message,

  --
  -- cast an aq$_jms_message to an aq$_jms_object_message
  --
  -- Return aq$_jms_object_message or NULL if message_type attribute of the aq$_jms_message
  -- is not DBMS_AQ.JMS_OBJECT_MESSAGE.

  MEMBER FUNCTION cast_to_object_msg RETURN aq$_jms_object_message,


  --
  -- set_text sets payload in varchar2 into text_vc if the length of
  -- payload is <= 4000, into text_lob if otherwise.
  --
  -- @param payload (IN)
  --
  MEMBER PROCEDURE set_text ( payload IN VARCHAR2 ),

  --
  -- set_text sets payload in clob in text_lob.
  --
  -- @param payload (IN)
  --
  MEMBER PROCEDURE set_text ( payload IN CLOB ),

  --
  -- get_text puts text_vc into payload if text_vc is not null,
  -- or transfers text_lob in clob into payload in varchar2 if the
  -- length of text_lob is =< 32767 (2**16 -1).
  -- Maximum length of varchar2 in PL/SQL is 32767.
  --
  -- @param payload (OUT)
  --
  -- @throws -24190 if the length of text_lob is > 32767.
  --
  MEMBER PROCEDURE get_text ( payload OUT VARCHAR2 ),

  --
  -- get_text puts text_lob into payload if text_lob is not null,
  -- or transfers text_vc in varchar2 into payload in clob.
--
  -- @param payload (OUT)
  --
  MEMBER PROCEDURE get_text ( payload OUT NOCOPY CLOB ),

  --
  -- set_bytes sets payload in RAW into bytes_raw if the length of
  -- payload is <= 2000, otherwise into bytes_lob.
  --
  -- @param payload (IN)
-- @param payload (IN)
  --
  MEMBER PROCEDURE set_bytes ( payload IN RAW ),

  --
  -- set_bytes sets payload in blob in bytes_lob.
  --
  -- @param payload (IN)
  --
  MEMBER PROCEDURE set_bytes ( payload IN BLOB ),

  --
  -- get_bytes puts bytes_raw into payload if it is not null,
  -- or transfers bytes_lob in blob into payload in RAW if the
  -- length of bytes_lob is =< 32767 (2**16 -1).
  -- Maximum length of raw in PL/SQL is 32767.
  --
  -- @param payload (OUT)
  --
  -- @throws -24190 if bytes_raw is null and
  -- the length of bytes_lob is > 32767.
  --
  MEMBER PROCEDURE get_bytes ( payload OUT RAW ),

  --
  -- get_bytes puts bytes_lob into payload if it is not null,
  -- or transfers bytes_raw in RAW into payload in blob.
  --
  -- @param payload (OUT)
  --
  MEMBER PROCEDURE get_bytes ( payload OUT NOCOPY BLOB ),


  MEMBER PROCEDURE set_replyto (replyto IN      sys.aq$_agent),

  MEMBER PROCEDURE set_type (type       IN      VARCHAR ),

  MEMBER PROCEDURE set_userid (userid   IN      VARCHAR ),

  MEMBER PROCEDURE set_appid (appid     IN      VARCHAR ),

  MEMBER PROCEDURE set_groupid (groupid IN      VARCHAR ),

  MEMBER PROCEDURE set_groupseq (groupseq       IN      int ),
  MEMBER PROCEDURE clear_properties ,

  MEMBER PROCEDURE set_boolean_property (
                property_name   IN      VARCHAR,
                property_value  IN      BOOLEAN ),
MEMBER PROCEDURE set_byte_property (
                property_name   IN      VARCHAR,
                property_value  IN      int ),

  MEMBER PROCEDURE set_short_property (
                property_name   IN      VARCHAR,
                property_value  IN      int ),

  MEMBER PROCEDURE set_int_property (
                property_name   IN      VARCHAR,
                property_value  IN      int ),

  MEMBER PROCEDURE set_long_property (
                property_name   IN      VARCHAR,
                property_value  IN      NUMBER ),

  MEMBER PROCEDURE set_float_property (
                property_name   IN      VARCHAR,
                property_value  IN      FLOAT ),

  MEMBER PROCEDURE set_double_property (
                property_name   IN      VARCHAR,
                property_value  IN      DOUBLE PRECISION ),

  MEMBER PROCEDURE set_string_property (
                property_name   IN      VARCHAR,
                property_value  IN      VARCHAR ),

  MEMBER FUNCTION get_replyto RETURN sys.aq$_agent,

  MEMBER FUNCTION get_type RETURN VARCHAR,

  MEMBER FUNCTION get_userid RETURN VARCHAR,

  MEMBER FUNCTION get_appid RETURN VARCHAR,

  MEMBER FUNCTION get_groupid RETURN VARCHAR,

  MEMBER FUNCTION get_groupseq RETURN int,

  MEMBER FUNCTION get_boolean_property ( property_name   IN      VARCHAR)
  RETURN   BOOLEAN,

  MEMBER FUNCTION get_byte_property ( property_name   IN      VARCHAR)
  RETURN   int,

  MEMBER FUNCTION get_short_property ( property_name   IN      VARCHAR)
RETURN   int,

  MEMBER FUNCTION get_int_property ( property_name   IN      VARCHAR)
  RETURN   int,
MEMBER FUNCTION get_long_property ( property_name   IN      VARCHAR)
  RETURN   NUMBER,

  MEMBER FUNCTION get_float_property ( property_name   IN      VARCHAR)
  RETURN   FLOAT,

  MEMBER FUNCTION get_double_property ( property_name   IN      VARCHAR)
  RETURN   DOUBLE PRECISION,

  MEMBER FUNCTION get_string_property ( property_name   IN      VARCHAR)
  RETURN   VARCHAR

);
/
CREATE OR REPLACE NONEDITIONABLE TYPE BODY "SYS"."AQ$_JMS_MESSAGE" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
e
3d93 9ca
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
iu8VRcRUUMrrck/5HWZCHNc=

/

  GRANT EXECUTE ON "SYS"."AQ$_JMS_MESSAGE" TO PUBLIC;
  GRANT EXECUTE ON "SYS"."AQ$_JMS_MESSAGE" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type AQ$_JMS_MESSAGE_PROPERTIES
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AQ$_JMS_MESSAGE_PROPERTIES" 
                                                                      
as varray(2147483647) of aq$_jms_message_property;

/

  GRANT EXECUTE ON "SYS"."AQ$_JMS_MESSAGE_PROPERTIES" TO PUBLIC;
  GRANT EXECUTE ON "SYS"."AQ$_JMS_MESSAGE_PROPERTIES" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type AQ$_JMS_MESSAGE_PROPERTY
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AQ$_JMS_MESSAGE_PROPERTY" 
                                                                      
as object
(
   priority          int,
   delay             int,
   expiration        int,
   correlation       varchar2(128),
   attempts          int,
   recipient_list    sys.aq$_recipients,
   exception_queue   varchar2(128),
   enqueue_time      date,
   state             int,
   sender_id         sys.aq$_agent,
   original_msgid    raw(16),
   signature         sys.aq$_sig_prop,
   transaction_group varchar2(30)
);

/

  GRANT EXECUTE ON "SYS"."AQ$_JMS_MESSAGE_PROPERTY" TO PUBLIC;
  GRANT EXECUTE ON "SYS"."AQ$_JMS_MESSAGE_PROPERTY" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type AQ$_JMS_MESSAGES
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AQ$_JMS_MESSAGES" 
                                                                      
as varray(2147483647) of aq$_jms_message;

/

  GRANT EXECUTE ON "SYS"."AQ$_JMS_MESSAGES" TO PUBLIC;
  GRANT EXECUTE ON "SYS"."AQ$_JMS_MESSAGES" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type AQ$_JMS_NAMEARRAY
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AQ$_JMS_NAMEARRAY" 
                                      
as varray(1024) of varchar(200);

/

  GRANT EXECUTE ON "SYS"."AQ$_JMS_NAMEARRAY" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type AQ$_JMS_OBJECT_MESSAGE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AQ$_JMS_OBJECT_MESSAGE" 
                                      
as object
(
  header     aq$_jms_header,
  bytes_len  int,
  bytes_raw  raw(2000),
  bytes_lob  blob
);

/

  GRANT EXECUTE ON "SYS"."AQ$_JMS_OBJECT_MESSAGE" TO PUBLIC;
  GRANT EXECUTE ON "SYS"."AQ$_JMS_OBJECT_MESSAGE" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type AQ$_JMS_OBJECT_MESSAGES
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AQ$_JMS_OBJECT_MESSAGES" 
                                                                      
as varray(2147483647) of aq$_jms_object_message;

/

  GRANT EXECUTE ON "SYS"."AQ$_JMS_OBJECT_MESSAGES" TO PUBLIC;
  GRANT EXECUTE ON "SYS"."AQ$_JMS_OBJECT_MESSAGES" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type AQ$_JMS_STREAM_MESSAGE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AQ$_JMS_STREAM_MESSAGE" 
                                       authid current_user
as object
(
  header     aq$_jms_header,
  bytes_len  int,
  bytes_raw  raw(2000),
  bytes_lob  blob,
  --============================================
  STATIC FUNCTION construct RETURN aq$_jms_stream_message,


  -- *******************************************
  -- The following are common procedures of aq$_jms_stream_message,
  -- aq$_jms_bytes_message and aq$_jms_map_message types to synchronize
  -- the data between JAVA stored procedure and PL/SQL.
  -- *******************************************

  --============================================
  -- Get the JAVA exception thrown during the previous failure.
  -- Only one JAVA exception is recorded for a session. If the
  -- exception is not fetched in time, it might be overwritten
  -- by the exception thrown in next failure.

  STATIC FUNCTION get_exception
  RETURN AQ$_JMS_EXCEPTION,


  --============================================
  -- Clean all the messages in the JVM session memory.
  --

  STATIC PROCEDURE clean_all,


  --============================================
  -- Populate the data at JAVA stored procedure with the data at PL/SQL side.
  --
  -- Underlying, it takes the RAW/BLOB stored in PL/SQL aq$_jms_stream_message
  -- to construct a JAVA object (for aq$_jms_stream_message is ObjectInputStream)
  -- which is stored in ORACLE JVM session memeory.
  --
  -- Parameter "id" is called operation id that is used to identify the slot
  -- where the JAVA object is stored in the ORACLE JVM session memeory.
  -- If "id" is NULL, a new slot is created for this PL/SQL object.
  -- Later JMS operations on the payload need to provide this operation id.
  --
  -- Parameters:
  --  id  - the operation id for this ADT instance.
  --        if id is negative, the system will create a new operation id.
  --
  -- Returns:
  --  the operation id.
  --
  -- The prepare procedure for aq$_jms_stream_message sets the message access mode
  -- to MESSAGE_ACCESS_READONLY. Later calls of write_XXX procedure raise ORA-24196 error.
  -- User can call clear_body procedure to set the message access mode to
  -- MESSAGE_ACCESS_WRITEONLY.
  --
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.
-- Raise ORA-24199: JAVA store procedure message store overflow.

  MEMBER FUNCTION prepare (id IN PLS_INTEGER)
  RETURN PLS_INTEGER,


  --============================================
  -- Set the data at JAVA stored procedure as empty payload.
  --
  -- Underlying, it initialize an new ObjectOutputStream object and set it to
  -- the static varaible in ORACLE JVM session memeory.
  --
  -- Parameter "id" is called operation id that is used to identify the slot
  -- where the JAVA object is stored in the ORACLE JVM session memeory.
  -- If "id" is NULL, a new slot is created for this PL/SQL object.
  -- Later JMS operations on the payload need to provide this operation id.
  --
  -- Parameters:
  --  id  - the operation id for this ADT instance.
  --        if id is negative, the system will create a new operation id.
  --
  -- Returns:
  --  the operation id.
  --
  -- The clear_body procedure for aq$_jms_stream_message sets the message access mode
  -- to MESSAGE_ACCESS_WRITEONLY. Later calls of read_XXX procedure raise ORA-24196 error.
  -- User can call reset procedure or prepare procedure to set the message access mode
  -- to MESSAGE_ACCESS_READONLY. Note the difference between prepare procedure and
  -- reset procedure.
  --
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.
  -- Raise ORA-24199: JAVA store procedure message store overflow.

  MEMBER FUNCTION clear_body (id IN PLS_INTEGER)
  RETURN PLS_INTEGER,


  --============================================
  -- Get the current message access mode of this message
  -- The result will be either dbms_aqjms.MESSAGE_ACCESS_WRITEONLY or
  -- dbms_aqjms.MESSAGE_ACCESS_READONLY.
  --
  -- Parameters:
  --  id  - the operation id for this ADT instance.
  --
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER FUNCTION get_mode (id IN PLS_INTEGER)
  RETURN PLS_INTEGER,

  --============================================
  -- Reset reposition the stream to the begining for reading.
  --
  -- Parameters:
  --  id  - the operation id for this ADT instance.
  --
  -- The reset procedure for aq$_jms_stream_message sets the message access mode
  -- to MESSAGE_ACCESS_READONLY. Later calls of write_XXX procedure raise ORA-24196 error.
  -- User can call clear_body procedure to set the message access mode to
  -- MESSAGE_ACCESS_WRITEONLY.
  --
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER PROCEDURE reset (id IN PLS_INTEGER),


  --============================================
  -- Flush the data at JAVA stored procedure side to PL/SQL side.
  --
  -- Underlying, it update the data at PL/SQL side to the payload stored at
  -- the JAVA stored procedure side.
  --
  -- The flush procedure for aq$_jms_stream_message does not affect current message access
  -- mode. User can continue to call procedures appropriate to the current mode.
  --
  -- Parameters:
  --  id  - the operation id for this ADT instance.
  --
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER PROCEDURE flush (id IN PLS_INTEGER),


  --============================================
  -- clean the data at JAVA stored procedure side to PL/SQL side.
  --
  -- Underlying, it close and clean upthe ObjectInputStream or ObjectOutputStream
  -- at the JAVA stored procedure side corresponding to the operation id.
  -- It is very import to call this procedure to avoid memeory leak!
  --
  -- Parameters:
  --  id  - the operation id for this ADT instance.
  --
  -- Raise ORA-24198: Invalid operation id.

  MEMBER PROCEDURE clean (id IN PLS_INTEGER),


  --*******************************************
 -- JMS operations member functions and procedures
  --*******************************************

  --============================================
  -- Read a object value from the stream message.
  --
  -- The function returns a general value ADT AQ$_JMS_VALUE. User can use the
  -- "type" attribute of this ADT to interpret the data.
  -- The following is a map among type attribute, JAVA type and value attributes
  --
  -- -----------------------------------------------------------------
  --               type                 | JAVA type | value attributes
  -- -----------------------------------------------------------------
  -- DBMS_JMS_PLSQL.DATA_TYPE_BYTE      |  byte     |    num_val
  -- -----------------------------------------------------------------
  -- DBMS_JMS_PLSQL.DATA_TYPE_SHORT     |  short    |    num_val
  -- -----------------------------------------------------------------
  -- DBMS_JMS_PLSQL.DATA_TYPE_INTEGER   |  int      |    num_val
  -- -----------------------------------------------------------------
  -- DBMS_JMS_PLSQL.DATA_TYPE_LONG      |  long     |    num_val
  -- -----------------------------------------------------------------
  -- DBMS_JMS_PLSQL.DATA_TYPE_FLOAT     |  float    |    num_val
  -- -----------------------------------------------------------------
  -- DBMS_JMS_PLSQL.DATA_TYPE_DOUBLE    |  double   |    num_val
  -- -----------------------------------------------------------------
  -- DBMS_JMS_PLSQL.DATA_TYPE_BOOLEAN   |  boolean  |    num_val
  -- -----------------------------------------------------------------
  -- DBMS_JMS_PLSQL.DATA_TYPE_CHARACTER |  char     |    char_val
  -- -----------------------------------------------------------------
  -- DBMS_JMS_PLSQL.DATA_TYPE_STRING    |  String   |    text_val
  -- -----------------------------------------------------------------
  -- DBMS_JMS_PLSQL.DATA_TYPE_BYTES     |  byte[]   |    bytes_val
  -- -----------------------------------------------------------------
  --
  -- The function returns NULL if the end of the message stream has been reached.
  --
  -- Also note that this memeber procedure might bring additional overhead
  -- comparing to other "read" memeber procedures. It is used only if the user
  -- does not know the data type before hand, otherwise it is always a good idea
  -- to use a specific read member procedure.
  --
  -- Parameters:
  --  id    - the operation id for this ADT instance.
  --  value - the object that is read.
  --
  -- Raise ORA-24194: The type conversion between the type of real value and the expected type is invalid.
  --                  In this particular case, an object with unsupported type is read from the stream.
  -- Raise ORA-24196: The stream message is in write-only mode.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
-- Raise ORA-24198: Invalid operation id.

  MEMBER PROCEDURE read_object (id IN PLS_INTEGER, value OUT NOCOPY AQ$_JMS_VALUE),


  --============================================
  -- Read a boolean value from the stream message.
  --
  -- The function returns NULL if the end of the message stream has been reached.
  --
  -- Parameters:
  --  id  - the operation id for this ADT instance.
  --
  -- Raise ORA-24194: The type conversion between the type of real value and the expected type is invalid.
  -- Raise ORA-24196: The stream message is in write-only mode.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER FUNCTION read_boolean (id IN PLS_INTEGER)
  RETURN BOOLEAN,


  --============================================
  -- Read a byte from the stream message.
  --
  -- The function guarantees that the returned value is in the JAVA byte value range.
  -- This also means if this value is issued with a write_byte function,
  -- there wont be an out of range error raised.
  --
  -- The function returns NULL if the end of the message stream has been reached.
  --
  -- Parameters:
  --  id  - the operation id for this ADT instance.
  --
  -- Raise ORA-24194: The type conversion between the type of real value and the expected type is invalid.
  -- Raise ORA-24196: The stream message is in write-only mode.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER FUNCTION read_byte (id IN PLS_INTEGER)
  RETURN PLS_INTEGER,


  --============================================
  -- Read a byte array from the stream message.
  --
  -- The function returns NULL if the end of the message stream has been reached.
  --
  -- Parameters:
 --  id    - the operation id for this ADT instance.
  --  value - the bytes that is read.
  --
  -- Raise ORA-24194: The type conversion between the type of real value and the expected type is invalid.
  -- Raise ORA-24196: The stream message is in write-only mode.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER PROCEDURE read_bytes (id IN PLS_INTEGER, value OUT NOCOPY BLOB),


  --============================================
  -- Read a char from the stream message.
  --
  -- The function returns NULL if the end of the message stream has been reached.
  --
  -- Parameters:
  --  id  - the operation id for this ADT instance.
  --
  -- Raise ORA-24194: The type conversion between the type of real value and the expected type is invalid.
  -- Raise ORA-24196: The stream message is in write-only mode.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER FUNCTION read_char (id IN PLS_INTEGER)
  RETURN CHAR,


  --============================================
  -- Read a double from the stream message.
  --
  -- The function returns NULL if the end of the message stream has been reached.
  --
  -- Parameters:
  --  id  - the operation id for this ADT instance.
  --
  -- Raise ORA-24194: The type conversion between the type of real value and the expected type is invalid.
  -- Raise ORA-24196: The stream message is in write-only mode.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER FUNCTION read_double (id IN PLS_INTEGER)
  RETURN DOUBLE PRECISION,

  --============================================
  -- Read a float from the stream message.
  --
  -- The function returns NULL if the end of the message stream has been reached.
--
  -- Parameters:
  --  id  - the operation id for this ADT instance.
  --
  -- Raise ORA-24194: The type conversion between the type of real value and the expected type is invalid.
  -- Raise ORA-24196: The stream message is in write-only mode.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER FUNCTION read_float (id IN PLS_INTEGER)
  RETURN FLOAT,


  --============================================
  -- Read a int from the stream message.
  --
  -- The function guarantees that the returned value is in the JAVA int value range.
  -- This also means if this value is issued with a write_int function,
  -- there wont be an out of range error raised.
  --
  -- The function returns NULL if the end of the message stream has been reached.
  --
  -- Parameters:
  --  id  - the operation id for this ADT instance.
  --
  -- Raise ORA-24194: The type conversion between the type of real value and the expected type is invalid.
  -- Raise ORA-24196: The stream message is in write-only mode.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER FUNCTION read_int (id IN PLS_INTEGER)
  RETURN PLS_INTEGER,


  --============================================
  -- Read a long from the stream message.
  --
  -- The function guarantees that the returned value is in the JAVA long value range.
  -- This also means if this value is issued with a write_long function,
  -- there wont be an out of range error raised.
  --
  -- The function returns NULL if the end of the message stream has been reached.
  --
  -- Parameters:
  --  id  - the operation id for this ADT instance.
  --
  -- Raise ORA-24194: The type conversion between the type of real value and the expected type is invalid.
  -- Raise ORA-24196: The stream message is in write-only mode.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
-- Raise ORA-24198: Invalid operation id.

  MEMBER FUNCTION read_long (id IN PLS_INTEGER)
  RETURN NUMBER,


  --============================================
  -- Read a short from the stream message.
  --
  -- The function guarantees that the returned value is in the JAVA short value range.
  -- This also means if this value is issued with a write_short function,
  -- there wont be an out of range error raised.
  --
  -- The function returns NULL if the end of the message stream has been reached.
  --
  -- Parameters:
  --  id  - the operation id for this ADT instance.
  --
  -- Raise ORA-24194: The type conversion between the type of real value and the expected type is invalid.
  -- Raise ORA-24196: The stream message is in write-only mode.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER FUNCTION read_short (id IN PLS_INTEGER)
  RETURN PLS_INTEGER,

  --============================================
  -- Read a String from the stream message.
  --
  -- The function returns NULL if the end of the message stream has been reached.
  --
  -- Parameters:
  --  id    - the operation id for this ADT instance.
  --  value - the string that is read.
  --
  -- Raise ORA-24194: The type conversion between the type of real value and the expected type is invalid.
  -- Raise ORA-24196: The stream message is in write-only mode.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER PROCEDURE read_string (id IN PLS_INTEGER, value OUT NOCOPY CLOB),


  --============================================
  -- Write a boolean to the stream message.
  --
  -- Parameters:
  --  id     - the operation id for this ADT instance.
  --  value  - the boolean value to be written. The value is copied into the stream message.
--
  -- Raise ORA-24196: The stream message is in read-only mode.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER PROCEDURE write_boolean (id IN PLS_INTEGER, value IN BOOLEAN),


  --============================================
  -- Write a byte to the stream message.
  --
  -- Parameters:
  --  id     - the operation id for this ADT instance.
  --  value  - the byte value to be written. The value is copied into the stream message.
  --
  -- Raise ORA-24193: The parameter value exceeds the valid JAVA type range.
  -- Raise ORA-24196: The stream message is in read-only mode.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER PROCEDURE write_byte (id IN PLS_INTEGER, value IN PLS_INTEGER),


  --============================================
  -- Write a byte array to the stream message.
  --
  -- This procedure takes a RAW type.
  -- Note that two consecutively written byte arrays are read as two distinct fields.
  --
  -- Parameters:
  --  id     - the operation id for this ADT instance.
  --  value  - the byte array value to be written. The value is copied into the stream message.
  --
  -- Raise ORA-24196: The stream message is in read-only mode.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER PROCEDURE write_bytes (id IN PLS_INTEGER, value IN RAW),


  --============================================
  -- Write a byte array to the stream message.
  --
  -- This procedure takes a BLOB type.
  -- Note that two consecutively written byte arrays are read as two distinct fields.
  --
  -- Parameters:
  --  id     - the operation id for this ADT instance.
 --  value  - the byte array value to be written. The value is copied into the stream message.
  --
  -- Raise ORA-24196: The stream message is in read-only mode.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER PROCEDURE write_bytes (id IN PLS_INTEGER, value IN BLOB),


  --============================================
  -- Write a portion of byte array to the stream message.
  --
  -- This procedure takes a RAW type.
  -- Note that two consecutively written byte arrays are read as two distinct fields.
  -- If the range [offset, offset+length] exceeds the boundary of the byte array value,
  -- a JAVA IndexOutOfBoundsException is thrown at the JAVA stored procedure and ORA-24197
  -- ora error is raised at the PL/SQL side. The index starts from 0.
  --
  -- Parameters:
  --  id     - the operation id for this ADT instance.
  --  value  - the byte array value to be written. The value is copied into the stream message.
  --  offset - the initial offset within the byte array.
  --  length - the number of bytes to use
  --
  -- Raise ORA-24196: The stream message is in read-only mode.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER PROCEDURE write_bytes (
         id        IN      PLS_INTEGER,
         value     IN      RAW,
         offset    IN      PLS_INTEGER,
         length    IN      PLS_INTEGER
  ),


  --============================================
  -- Write a portion of byte array to the stream message.
  --
  -- This procedure takes a BLOB type.
  -- Note that two consecutively written byte arrays are read as two distinct fields.
  -- If the range [offset, offset+length] exceeds the boundary of the byte array value,
  -- a JAVA IndexOutOfBoundsException is thrown at the JAVA stored procedure and ORA-24197
  -- ora error is raised at the PL/SQL side. The index starts from 0.
  --
  -- Parameters:
  --  id     - the operation id for this ADT instance.
  --  value  - the byte array value to be written. The value is copied into the stream message.
  --  offset - the initial offset within the byte array.
  --  length - the number of bytes to use
--
  -- Raise ORA-24196: The stream message is in read-only mode.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER PROCEDURE write_bytes (
         id        IN      PLS_INTEGER,
         value     IN      BLOB,
         offset    IN      PLS_INTEGER,
         length    IN      PLS_INTEGER
  ),

  --============================================
  -- Write a char to the stream message.
  --
  -- Parameters:
  --  id     - the operation id for this ADT instance.
  --  value  - the char value to be written. The value is copied into the stream message.
  --
  -- Raise ORA-24196: The stream message is in read-only mode.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER PROCEDURE write_char (id IN PLS_INTEGER, value IN CHAR),


  --============================================
  -- Write a double to the stream message.
  --
  -- Parameters:
  --  id     - the operation id for this ADT instance.
  --  value  - the double value to be written. The value is copied into the stream message.
  --
  -- Raise ORA-24196: The stream message is in read-only mode.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER PROCEDURE write_double (id IN PLS_INTEGER, value IN DOUBLE PRECISION),


  --============================================
  -- Write a float to the stream message.
  --
  -- Parameters:
  --  id     - the operation id for this ADT instance.
  --  value  - the float value to be written. The value is copied into the stream message.
  --
  -- Raise ORA-24196: The stream message is in read-only mode.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.
MEMBER PROCEDURE write_float (id IN PLS_INTEGER, value IN FLOAT),


  --============================================
  -- Write a int to the stream message.
  --
  -- Parameters:
  --  id     - the operation id for this ADT instance.
  --  value  - the int value to be written. The value is copied into the stream message.
  --
  -- Raise ORA-24193: The parameter value exceeds the valid JAVA type range.
  -- Raise ORA-24196: The stream message is in read-only mode.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER PROCEDURE write_int (id IN PLS_INTEGER, value IN PLS_INTEGER),


  --============================================
  -- Write a long to the stream message.
  --
  -- Parameters:
  --  id     - the operation id for this ADT instance.
  --  value  - the long value to be written. The value is copied into the stream message.
  --
  -- Raise ORA-24193: The parameter value exceeds the valid JAVA type range.
  -- Raise ORA-24196: The stream message is in read-only mode.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER PROCEDURE write_long (id IN PLS_INTEGER, value IN NUMBER),


  --============================================
  -- Write a short to the stream message.
  --
  -- Parameters:
  --  id     - the operation id for this ADT instance.
  --  value  - the short value to be written. The value is copied into the stream message.
  --
  -- Raise ORA-24193: The parameter value exceeds the valid JAVA type range.
  -- Raise ORA-24196: The stream message is in read-only mode.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER PROCEDURE write_short (id IN PLS_INTEGER, value IN PLS_INTEGER),


  --============================================
  -- Write a String to the stream message.
  --
  -- This procedure takes VARCHAR2 type.
--
  -- Parameters:
  --  id     - the operation id for this ADT instance.
  --  value  - the string value to be written. The value is copied into the stream message.
  --
  -- Raise ORA-24196: The stream message is in read-only mode.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER PROCEDURE write_string (id IN PLS_INTEGER, value IN VARCHAR2),


  --============================================
  -- Write a String to the stream message.
  --
  -- This procedure takes CLOB type.
  --
  -- Parameters:
  --  id     - the operation id for this ADT instance.
  --  value  - the string value to be written. The value is copied into the stream message.
  --
  -- Raise ORA-24196: The stream message is in read-only mode.
  -- Raise ORA-24197: JAVA stored procedure throws Exception during execution.
  -- Raise ORA-24198: Invalid operation id.

  MEMBER PROCEDURE write_string (id IN PLS_INTEGER, value IN CLOB),


  --*******************************************
  -- The following are JMS header related procedures
  --*******************************************

  MEMBER PROCEDURE set_replyto (replyto IN      sys.aq$_agent),

  MEMBER PROCEDURE set_type (type       IN      VARCHAR ),

  MEMBER PROCEDURE set_userid (userid   IN      VARCHAR ),

  MEMBER PROCEDURE set_appid (appid     IN      VARCHAR ),

  MEMBER PROCEDURE set_groupid (groupid IN      VARCHAR ),

  MEMBER PROCEDURE set_groupseq (groupseq       IN      int ),

  MEMBER PROCEDURE clear_properties ,

  MEMBER PROCEDURE set_boolean_property (
                property_name   IN      VARCHAR,
                property_value  IN      BOOLEAN ),

  MEMBER PROCEDURE set_byte_property (
                property_name   IN      VARCHAR,
                property_value  IN      int ),
  MEMBER PROCEDURE set_short_property (
                property_name   IN      VARCHAR,
                property_value  IN      int ),

  MEMBER PROCEDURE set_int_property (
                property_name   IN      VARCHAR,
                property_value  IN      int ),

  MEMBER PROCEDURE set_long_property (
                property_name   IN      VARCHAR,
                property_value  IN      NUMBER ),

  MEMBER PROCEDURE set_float_property (
                property_name   IN      VARCHAR,
                property_value  IN      FLOAT ),

  MEMBER PROCEDURE set_double_property (
                property_name   IN      VARCHAR,
                property_value  IN      DOUBLE PRECISION ),

  MEMBER PROCEDURE set_string_property (
                property_name   IN      VARCHAR,
                property_value  IN      VARCHAR ),

  MEMBER FUNCTION get_replyto RETURN sys.aq$_agent,

  MEMBER FUNCTION get_type RETURN VARCHAR,

  MEMBER FUNCTION get_userid RETURN VARCHAR,

  MEMBER FUNCTION get_appid RETURN VARCHAR,

  MEMBER FUNCTION get_groupid RETURN VARCHAR,

  MEMBER FUNCTION get_groupseq RETURN int,

  MEMBER FUNCTION get_boolean_property ( property_name   IN      VARCHAR)
  RETURN   BOOLEAN,

  MEMBER FUNCTION get_byte_property ( property_name   IN      VARCHAR)
  RETURN   int,

  MEMBER FUNCTION get_short_property ( property_name   IN      VARCHAR)
  RETURN   int,

  MEMBER FUNCTION get_int_property ( property_name   IN      VARCHAR)
  RETURN   int,

  MEMBER FUNCTION get_long_property ( property_name   IN      VARCHAR)
  RETURN   NUMBER,

  MEMBER FUNCTION get_float_property ( property_name   IN      VARCHAR)
RETURN   FLOAT,

  MEMBER FUNCTION get_double_property ( property_name   IN      VARCHAR)
  RETURN   DOUBLE PRECISION,

  MEMBER FUNCTION get_string_property ( property_name   IN      VARCHAR)
  RETURN   VARCHAR

);
/
CREATE OR REPLACE NONEDITIONABLE TYPE BODY "SYS"."AQ$_JMS_STREAM_MESSAGE" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
e
53ae 9d2
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
PFk4/90/FWG5WW9WheROnKr7ioUXPw==

/

  GRANT EXECUTE ON "SYS"."AQ$_JMS_STREAM_MESSAGE" TO PUBLIC;
  GRANT EXECUTE ON "SYS"."AQ$_JMS_STREAM_MESSAGE" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type AQ$_JMS_STREAM_MESSAGES
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AQ$_JMS_STREAM_MESSAGES" 
                                                                      
as varray(2147483647) of aq$_jms_stream_message;

/

  GRANT EXECUTE ON "SYS"."AQ$_JMS_STREAM_MESSAGES" TO PUBLIC;
  GRANT EXECUTE ON "SYS"."AQ$_JMS_STREAM_MESSAGES" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type AQ$_JMS_TEXT_MESSAGE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AQ$_JMS_TEXT_MESSAGE" 
                                      
as object
(
  header    aq$_jms_header,
  text_len  int,
  text_vc   varchar2(4000),
  text_lob  clob,
  STATIC FUNCTION construct RETURN aq$_jms_text_message,

  --
  -- set_text sets payload in varchar2 into text_vc if the length of
  -- payload is <= 4000, into text_lob if otherwise.
  --
  -- @param payload (IN)
  --
  MEMBER PROCEDURE set_text ( payload IN VARCHAR2 ),

  --
  -- set_text sets payload in clob in text_lob.
  --
  -- @param payload (IN)
  --
  MEMBER PROCEDURE set_text ( payload IN CLOB ),

  --
  -- get_text puts text_vc into payload if text_vc is not null,
  -- or transfers text_lob in clob into payload in varchar2 if the
  -- length of text_lob is =< 32767 (2**16 -1).
  -- Maximum length of varchar2 in PL/SQL is 32767.
  --
  -- @param payload (OUT)
  --
  -- @throws -24190 if the length of text_lob is > 32767.
  --
  MEMBER PROCEDURE get_text ( payload OUT VARCHAR2 ),

  --
  -- get_text puts text_lob into payload if text_lob is not null,
  -- or transfers text_vc in varchar2 into payload in clob.
  --
  -- @param payload (OUT)
  --
  MEMBER PROCEDURE get_text ( payload OUT NOCOPY CLOB ),

  MEMBER PROCEDURE set_replyto (replyto IN      sys.aq$_agent),

  MEMBER PROCEDURE set_type (type       IN      VARCHAR ),

  MEMBER PROCEDURE set_userid (userid   IN      VARCHAR ),

  MEMBER PROCEDURE set_appid (appid     IN      VARCHAR ),

  MEMBER PROCEDURE set_groupid (groupid IN      VARCHAR ),

  MEMBER PROCEDURE set_groupseq (groupseq       IN      int ),

  MEMBER PROCEDURE clear_properties ,

  MEMBER PROCEDURE set_boolean_property (
               property_name   IN      VARCHAR,
                property_value  IN      BOOLEAN ),

  MEMBER PROCEDURE set_byte_property (
                property_name   IN      VARCHAR,
                property_value  IN      int ),

  MEMBER PROCEDURE set_short_property (
                property_name   IN      VARCHAR,
                property_value  IN      int ),

  MEMBER PROCEDURE set_int_property (
                property_name   IN      VARCHAR,
                property_value  IN      int ),

  MEMBER PROCEDURE set_long_property (
                property_name   IN      VARCHAR,
                property_value  IN      NUMBER ),

  MEMBER PROCEDURE set_float_property (
                property_name   IN      VARCHAR,
                property_value  IN      FLOAT ),

  MEMBER PROCEDURE set_double_property (
                property_name   IN      VARCHAR,
                property_value  IN      DOUBLE PRECISION ),

  MEMBER PROCEDURE set_string_property (
                property_name   IN      VARCHAR,
                property_value  IN      VARCHAR ),

  MEMBER FUNCTION get_replyto RETURN sys.aq$_agent,

  MEMBER FUNCTION get_type RETURN VARCHAR,

  MEMBER FUNCTION get_userid RETURN VARCHAR,

  MEMBER FUNCTION get_appid RETURN VARCHAR,

  MEMBER FUNCTION get_groupid RETURN VARCHAR,

  MEMBER FUNCTION get_groupseq RETURN int,

  MEMBER FUNCTION get_boolean_property ( property_name   IN      VARCHAR)
  RETURN   BOOLEAN,

  MEMBER FUNCTION get_byte_property ( property_name   IN      VARCHAR)
  RETURN   int,

  MEMBER FUNCTION get_short_property ( property_name   IN      VARCHAR)
  RETURN   int,
MEMBER FUNCTION get_int_property ( property_name   IN      VARCHAR)
  RETURN   int,

  MEMBER FUNCTION get_long_property ( property_name   IN      VARCHAR)
  RETURN   NUMBER,

  MEMBER FUNCTION get_float_property ( property_name   IN      VARCHAR)
  RETURN   FLOAT,

  MEMBER FUNCTION get_double_property ( property_name   IN      VARCHAR)
  RETURN   DOUBLE PRECISION,

  MEMBER FUNCTION get_string_property ( property_name   IN      VARCHAR)
  RETURN   VARCHAR

);
/
CREATE OR REPLACE NONEDITIONABLE TYPE BODY "SYS"."AQ$_JMS_TEXT_MESSAGE" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
e
2391 66e
ai+73RkJduOub9kfq2ofHoAM7pcwg0OTzCAF3y8ZA6pELJ6i4TTd+hiUuqfh8c9hXIUaDAne
c5HSqBZ8DiiEkktPnbbpCdM+PqAGMNEnNqfvHLu8uzC/evLAnR3xwkNBzzrB1+67IK4Hu9C1
PyTPEs8jkpuB9xTg3++ihaKLiJONIbetjBQLw1qHyfG4yGywFDrOi6U41cvTItlqb0ZaPKlO
wDcPPtjHGOplG3Y+NzPGWnnKk+HQEZOOx5vkv3r+IWJ7hr9Xy/VC6gjltWFLLje3pBeIVgzL
oqnDj2bCDDNEDKcUsF2o7jEb7sQUM/RD1dOTzGuKyHWFslBvBOnEpvL5NElt2iCpYz1nKj39
EoWSQCcgPL8OL3xwnpb2vn+l4GKu832eEHDu9r53nvGdufoFleDuL4g2BeblXM5QQLRWXnER
wyOQUloUWrS5BK7OIhUSMCTv/rs77q368X4d/G+WqDONzwa+RhjMcpGWV35TeZOhAe+Z9VSn
OysEZo2K10tpo+IrBFwWIY+S3jh1XLzEqOPJM9N3CcHDFasweRqbDuz2Fd+SzTNVu7uORu8V
YbbCXUjfHOEdCtovsHlVnyk8yu0wPZuUVNpb7lc6PXxgEOrqLlFUWw3ry1L10ilULOvefxhl
lQYXpv8TMKh4Up2Tt6MrD2gV+3LKeRWV6OWZExQWkRf+wc0RWN47bpW0mVIaHA09E+FnklpG
Sd2jSabeZamNwmTTnNV4W0XMSFLqOP+RDwLfb4koJzj9A2Jk7684pDmAqlr9RC6JFu3J0+IT
8gmqwUtFS3vRoSEt4t7aZMM8NFrMDpWHdqnH1GRC8ZlN+camCiDpnRm87TodeMHV6fjlY1qA
WuoX9jd+fe1XpxbZtEhk5eUDZHJ76Rch9eZhlrrRG4qHybm1LULeMwizvo+LtvL4sjcD6BqY
6TnNyHaflYdl01gsU6HlKNSDMj2i4L+hAarrK/6npNN5noGlMtkYf9P4w6DRkeB0xEXqAHlT
Mj0AxfRJMGcrYs8avDKTsxxQAvF6DLxPzqacCBzPyFrGkJRUAlegpJZEpXb2T7z553b2TatS
FnKRxAoRPJwsC2KUPKtSFtkqF2MG3j9xIgzwd8oiGCap0OwngQoTjLTCccW6NvbMB6XXnlrO
+7Wa+5yt4x+Jceo9RuV1ZUDyTczCSfnvOYL1Dvpv5HETKK4wWhjT7L2DPETRGh4CTWpCGWyO
q3f8TVLLnYfJwPV9T9tr4GpT5PQAg0Oq05xms0+0a3kzSVIXr32SVvkaY8I/QtHNMI8UIkzu
s8F6NeVWTA6umBxX9F6c2FltTorcDT52QFYfPfb32cdLhvDrfivxwRfFOZwSdrhufLMtMwKD
RULbfMeHpfVPC3S8w+u0oxhadTH8jrkxoOIoLbBBekaICihqQb7vXylbpjiLd2vSbDz8xzB1
fxBlz/Stx3YiFcpB13ptQlRudTo4POROd4LeHHJ2VKOE56AICwxw5q3GiXBTLtM2e8BdZy/n
PQCmNBw8LSvaL37EDT8ATWoufsppsN6QqaC5YITdSqAHNxFVn7jhcWNmNs1UhpTnsfagG48y
2k0vfYxiLhFFvmJHNoqAiYGzyWtEvpL5QyQP7HzT

/

  GRANT EXECUTE ON "SYS"."AQ$_JMS_TEXT_MESSAGE" TO PUBLIC;
  GRANT EXECUTE ON "SYS"."AQ$_JMS_TEXT_MESSAGE" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type AQ$_JMS_TEXT_MESSAGES
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AQ$_JMS_TEXT_MESSAGES" 
                                                                      
as varray(2147483647) of aq$_jms_text_message;

/

  GRANT EXECUTE ON "SYS"."AQ$_JMS_TEXT_MESSAGES" TO PUBLIC;
  GRANT EXECUTE ON "SYS"."AQ$_JMS_TEXT_MESSAGES" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type AQ$_JMS_USERPROPARRAY
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AQ$_JMS_USERPROPARRAY" 
                                      
as varray(100) of aq$_jms_userproperty;

/

  GRANT EXECUTE ON "SYS"."AQ$_JMS_USERPROPARRAY" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type AQ$_JMS_USERPROPERTY
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AQ$_JMS_USERPROPERTY" 
                                      
as object
(
  name        varchar(100),
  type        int,
  str_value   varchar(2000),
  num_value   NUMBER,
  java_type   int
);

/

  GRANT EXECUTE ON "SYS"."AQ$_JMS_USERPROPERTY" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type AQ$_JMS_VALUE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AQ$_JMS_VALUE" 
                                      
as object
(
  type        number(2),
  num_val     number,
  char_val    char(1),
  text_val    clob,
  bytes_val   blob
);

/

  GRANT EXECUTE ON "SYS"."AQ$_JMS_VALUE" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type AQ$_MIDARRAY
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AQ$_MIDARRAY" as varray(1024) of VARCHAR2(32);

/

  GRANT EXECUTE ON "SYS"."AQ$_MIDARRAY" TO PUBLIC WITH GRANT OPTION;
--------------------------------------------------------
--  DDL for Type AQ$_NOTIFY_MSG
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AQ$_NOTIFY_MSG" AS OBJECT (
        opcode INTEGER, qid RAW(16), dest VARCHAR2(128))

/

  GRANT EXECUTE ON "SYS"."AQ$_NOTIFY_MSG" TO PUBLIC WITH GRANT OPTION;
--------------------------------------------------------
--  DDL for Type AQ$_NTFN_DESCRIPTOR
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AQ$_NTFN_DESCRIPTOR" FORCE AS OBJECT (
        ntfn_flags         number)                     -- flags

/

  GRANT EXECUTE ON "SYS"."AQ$_NTFN_DESCRIPTOR" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type AQ$_NTFN_MSGID_ARRAY
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AQ$_NTFN_MSGID_ARRAY" 
AS VARRAY(1073741824) OF raw(16);

/

  GRANT EXECUTE ON "SYS"."AQ$_NTFN_MSGID_ARRAY" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type AQ$_POST_INFO
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AQ$_POST_INFO" AS OBJECT (
        name             VARCHAR2(128),       -- name of the subscription
        namespace        NUMBER,              -- namespace of the subscription
        payload          RAW(32767))          -- payload
 alter type     "SYS"."AQ$_POST_INFO" modify attribute
           (name varchar2(512)) CASCADE

/

  GRANT EXECUTE ON "SYS"."AQ$_POST_INFO" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type AQ$_POST_INFO_LIST
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AQ$_POST_INFO_LIST" 
AS VARRAY(1024) OF sys.aq$_post_info

/

  GRANT EXECUTE ON "SYS"."AQ$_POST_INFO_LIST" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type AQ$_QPAT_INFO
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AQ$_QPAT_INFO" force  AS OBJECT (
  schema          varchar2(128),
  queue_name      varchar2(128),
  queue_id        number,
  subscriber_name varchar2(128),
  subscriber_id   number,
  session_id      number,
  group_leader    number,
  partition_id    number,
  flags           number,
  version#        number,
  inst_id         number,
  audit_sid       number,
  create_time     TIMESTAMP WITH TIME ZONE,
  CONSTRUCTOR FUNCTION aq$_qpat_info(
    schema varchar2,
    queue_name varchar2,
    subscriber_name varchar2,
    group_leader number,
    partitionid number,
    version# number,
    inst_id number)
  return self as result,
  CONSTRUCTOR FUNCTION aq$_qpat_info(
    schema varchar2,
    queue_name varchar2,
    queue_id number,
    subscriber_name varchar2,
    subscriber_id number,
    group_leader number,
    partition_id number,
    version# number,
    inst_id number,
    session_id number,
    audit_sid  number,
    create_time TIMESTAMP WITH TIME ZONE)
  return self as result
 )NOT PERSISTABLE;
/
CREATE OR REPLACE NONEDITIONABLE TYPE BODY "SYS"."AQ$_QPAT_INFO" AS

  CONSTRUCTOR FUNCTION aq$_qpat_info(
    schema varchar2,
    queue_name varchar2,
    subscriber_name varchar2,
    group_leader number,
    partitionid number,
    version# number,
    inst_id number)
  return self as result IS
  BEGIN
   SELF.schema := schema;
   SELF.queue_name:= queue_name;
   SELF.queue_id := -1;
   SELF.subscriber_name := subscriber_name;
   SELF.subscriber_id := -1;
   SELF.group_leader := group_leader;
   SELF.partition_id := partitionid;
   SELF.version# :=version#;
   SELF.inst_id := inst_id;
   SELF.session_id:= 0;
   RETURN;
  END;

   CONSTRUCTOR FUNCTION aq$_qpat_info(
    schema varchar2,
    queue_name varchar2,
    queue_id number,
    subscriber_name varchar2,
    subscriber_id number,
    group_leader number,
    partition_id number,
    version# number,
    inst_id number,
    session_id number,
    audit_sid  number,
    create_time TIMESTAMP WITH TIME ZONE) return self as result is
  BEGIN
   SELF.schema := schema;
   SELF.queue_name:= queue_name;
   SELF.queue_id := queue_id;
   SELF.subscriber_name := subscriber_name;
   SELF.subscriber_id := subscriber_id;
   SELF.group_leader := group_leader;
   SELF.partition_id := partition_id;
   SELF.version# := version#;
   SELF.inst_id := inst_id;
   SELF.session_id:= session_id;
   SELF.audit_sid  := audit_sid;
   SELF.create_time := create_time;
   RETURN;
  END;
END;

/

  GRANT EXECUTE ON "SYS"."AQ$_QPAT_INFO" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type AQ$_QPAT_INFO_LIST
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AQ$_QPAT_INFO_LIST" 
 AS VARRAY(1024) OF (sys.aq$_qpat_info)
 NOT PERSISTABLE

/

  GRANT EXECUTE ON "SYS"."AQ$_QPAT_INFO_LIST" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type AQ$_QPIM_INFO
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AQ$_QPIM_INFO" AS object (
  owner varchar2(128),
  queue_name varchar2(128),
  partition_id number,
  owner_instance number,

  CONSTRUCTOR function aq$_qpim_info(
   owner varchar2,
   queue_name varchar2,
   partition_id number,
   owner_instance number
  ) return self as result
 )NOT PERSISTABLE ;
/
CREATE OR REPLACE NONEDITIONABLE TYPE BODY "SYS"."AQ$_QPIM_INFO" as
  CONSTRUCTOR function aq$_qpim_info(
   owner varchar2,
   queue_name varchar2,
   partition_id number,
   owner_instance number
  ) return self as result IS
  BEGIN
   self.owner := owner;
   self.queue_name := queue_name;
   self.partition_id := partition_id;
   self.owner_instance := owner_instance;
   RETURN;
  END;
 END;

/

  GRANT EXECUTE ON "SYS"."AQ$_QPIM_INFO" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type AQ$_QPIM_INFO_LIST
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AQ$_QPIM_INFO_LIST" 
 AS VARRAY(1024) OF (sys.aq$_qpim_info)
 NOT PERSISTABLE

/

  GRANT EXECUTE ON "SYS"."AQ$_QPIM_INFO_LIST" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type AQ$_RECIPIENTS
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AQ$_RECIPIENTS" 
                                                                      
AS VARRAY(1024) OF sys.aq$_agent

/

  GRANT EXECUTE ON "SYS"."AQ$_RECIPIENTS" TO PUBLIC WITH GRANT OPTION;
  GRANT EXECUTE ON "SYS"."AQ$_RECIPIENTS" TO PUBLIC WITH GRANT OPTION;
--------------------------------------------------------
--  DDL for Type AQ$_REG_INFO
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AQ$_REG_INFO" AS OBJECT (
        name                  VARCHAR2(128),  -- name of the subscription
        namespace             NUMBER,         -- namespace of the subscription
        callback              VARCHAR2(4000), -- callback function
        context               RAW(2000),      -- context for the callback func.
        anyctx                SYS.ANYDATA,    -- anydata ctx for callback func
        ctxtype               NUMBER,         -- raw/anydata context
        qosflags              NUMBER,         -- QOS flags
        payloadcbk            VARCHAR2(4000), -- payload callback
        timeout               NUMBER,         -- registration expiration
        ntfn_grouping_class        NUMBER,    -- ntfn grouping class
        ntfn_grouping_value        NUMBER,    -- ntfn grouping value
        ntfn_grouping_type         NUMBER,    -- ntfn grouping type
        ntfn_grouping_start_time   TIMESTAMP WITH TIME ZONE, -- grp start time
        ntfn_grouping_repeat_count NUMBER,    -- ntfn grp repeat count
        CONSTRUCTOR FUNCTION aq$_reg_info(
          name             VARCHAR2,
          namespace        NUMBER,
          callback         VARCHAR2,
          context          RAW)
        RETURN SELF AS RESULT,
        CONSTRUCTOR FUNCTION aq$_reg_info(
          name             VARCHAR2,
          namespace        NUMBER,
          callback         VARCHAR2,
          context          RAW,
          anyctx           SYS.ANYDATA,
          ctxtype          NUMBER)
        RETURN SELF AS RESULT,
        CONSTRUCTOR FUNCTION aq$_reg_info(
          name             VARCHAR2,
          namespace        NUMBER,
          callback         VARCHAR2,
          context          RAW,
          qosflags         NUMBER,
          timeout          NUMBER)
        RETURN SELF AS RESULT,
        CONSTRUCTOR FUNCTION aq$_reg_info(
          name             VARCHAR2,
          namespace        NUMBER,
          callback         VARCHAR2,
          context          RAW,
          anyctx           SYS.ANYDATA,
          ctxtype          NUMBER,
          qosflags         NUMBER,
          payloadcbk       VARCHAR2,
          timeout          NUMBER)
        RETURN SELF AS RESULT,
        CONSTRUCTOR FUNCTION aq$_reg_info(
          name                       VARCHAR2,
          namespace                  NUMBER,
          callback                   VARCHAR2,
          context                    RAW,
          qosflags                   NUMBER,
          timeout                    NUMBER,
          ntfn_grouping_class        NUMBER,
          ntfn_grouping_value        NUMBER,
          ntfn_grouping_type         NUMBER,
          ntfn_grouping_start_time   TIMESTAMP WITH TIME ZONE,
          ntfn_grouping_repeat_count NUMBER)
        RETURN SELF AS RESULT
        )
 alter type     "SYS"."AQ$_REG_INFO" modify attribute
           (name varchar2(512)) CASCADE
/
CREATE OR REPLACE NONEDITIONABLE TYPE BODY "SYS"."AQ$_REG_INFO" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
e
176e 30a
xt75MaqDm1tk2xkdxOyLlSmviMkwg80rr0hufC/NrQ/uhBoUJRvy60FF/Dh8QOl/3y0HkfqV
/Gs7I949+bVr3//CMDfwCvVj320oqXMZX8ZB7t5LJgShkYPIriSu12RyD9fEuw8/L1BJRmk+
IeXsUcMUCkSV5p7hv7BgLWiOZrfBp6LjqfH3+VNb6eoOSG+k2NUOpIB3ARWJWz64QabtkEsN
88q6hjwNrAdtb8x09mzjyXoDr4Mm4q2jGrJ6OEKoo6P3OqWeecRDbi9xf9C09xtj30WzQD5s
PY2s5oJ4gCuSY07ZE/6xuxnRhVjHwJ8tfmJYWjuaQ9Sqv0acuS1SoAPQ+H7Budjq1tkZSigs
BQPRhMC4gR3AbTNWOTrnVt8RmnB4hGs3gBLPL7KVgZHkM/mS/1Lw4iLG+rEAi5B3iAdxJHLY
Du7TCexoYDap6fqR8PP750dG+o3YCuZdQMBQexhCKDTJzEePGzNlKqzmhuAsAMNaK9jgqUCX
ow6/BZRutcZuY2KVQ/okCucciMOnc9lxvmOpS31v7bdVRZv7dhPCdm3lMCGj6kFQk0zLUdG1
a8J0JZr+e1oGUif6aGM0UwwxDgf3t0n1b43q6+Ki4+sOPxV9yc3s+A6dsVtzLT95s5OVyw7g
syPf0VYSGIGI8G3ea1pxgircBbdO3qPIpd6jyM3eo8gn/sKZAekcnnENXpsWRP2CdCUi/hjH
ZM6eI5XzIaO/gFARbBxRCCV6N2DZgSF74oa5Oot4LVWISg==

/

  GRANT EXECUTE ON "SYS"."AQ$_REG_INFO" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type AQ$_REG_INFO_LIST
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AQ$_REG_INFO_LIST" 
AS VARRAY(1024) OF sys.aq$_reg_info

/

  GRANT EXECUTE ON "SYS"."AQ$_REG_INFO_LIST" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type AQ$_SIG_PROP
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AQ$_SIG_PROP" 
                                                                      
 AS OBJECT
  (signature         RAW(2000),
   canalgo           varchar2(2000),
   digalgo           varchar2(2000),
   sigalgo           varchar2(2000),
   certificate       varchar2(2000),
   digval            RAW(2000))

/

  GRANT EXECUTE ON "SYS"."AQ$_SIG_PROP" TO PUBLIC WITH GRANT OPTION;
--------------------------------------------------------
--  DDL for Type AQ$_SRVNTFN_MESSAGE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AQ$_SRVNTFN_MESSAGE" AS OBJECT (
       queue_name        VARCHAR2(65),        -- name of the queue
       consumer_name     VARCHAR2(30),        -- name of the consumer
       msg_id            RAW(16),             -- message identifier
       priority          number,
       delay             number,
       expiration        number,
       correlation       varchar2(128),
       attempts          number,
       exception_queue   varchar2(51),
       enqueue_time      date,
       state             number,
       agent_name        varchar2(30),
       agent_address     varchar2(1024),
       agent_protocol    number,
       original_msgid    raw(16),
       sub_name          VARCHAR2(128),       -- name of the subscription
       sub_namespace     NUMBER,              -- namespace of the subscription
       sub_callback      VARCHAR2(4000),      -- callback function
       sub_context       RAW(2000),           -- context for the callback func.
       user_id           number,              -- user identifier
       payload           RAW(2000),
       payloadl          number,
       xmlpayload        VARCHAR2(4000),      -- payload in xml, if reqd.
       payloadt          number,              -- payload type, xml/default
       anysub_context    SYS.ANYDATA,         -- anydata context
       context_type      number,              -- RAW or ANYDATA context
       delivery_mode     number,              -- delivery mode
       ntfn_flags        number,              -- generic ntfn flags
       msgid_array       sys.aq$_ntfn_msgid_array,-- grp ntfn msg id array
       ntfnsRecdInGrp    number,                  -- ntfns recd in grp
       pblob             BLOB, -- for storing raw payload in 11 compatible mode
       reg_id            number,              -- registration id
       pdb               number)
 alter type "SYS"."AQ$_SRVNTFN_MESSAGE" modify attribute
          (queue_name varchar2(261),
           consumer_name varchar2(512),
           exception_queue varchar2(128),
           agent_name varchar2(512),
           sub_name varchar2(512)) CASCADE

/
--------------------------------------------------------
--  DDL for Type AQ$_SUBSCRIBER
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AQ$_SUBSCRIBER" 
AS OBJECT (
  name          VARCHAR2(30), -- M_IDEN, name of a message producer or consumer
  address       VARCHAR2(1024),           -- address where message must be sent
  protocol      NUMBER,                -- protocol for communication, must be 0
  trans_name    VARCHAR2(61),                             -- tranformation name
  sub_type      NUMBER,                                      -- subscriber type
  rule_name     VARCHAR2(30),                                       --rule name
  subscriber_id NUMBER,                                        -- subscriber id
  pos_bitmap    NUMBER          -- subscriber position in bitmap for 12c queues
 )
 alter type     "SYS"."AQ$_SUBSCRIBER" modify attribute
           (name varchar2(512),
            trans_name varchar2(261),
            rule_name varchar2(128)) CASCADE

/

  GRANT EXECUTE ON "SYS"."AQ$_SUBSCRIBER" TO PUBLIC;
  GRANT EXECUTE ON "SYS"."AQ$_SUBSCRIBER" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type AQ$_SUBSCRIBERS
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AQ$_SUBSCRIBERS" 
                                                                      
AS VARRAY(1024) OF sys.aq$_agent

/

  GRANT EXECUTE ON "SYS"."AQ$_SUBSCRIBERS" TO PUBLIC WITH GRANT OPTION;
  GRANT EXECUTE ON "SYS"."AQ$_SUBSCRIBERS" TO PUBLIC WITH GRANT OPTION;
--------------------------------------------------------
--  DDL for Type AUD_PDB_LIST
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AUD_PDB_LIST" IS VARRAY(4098) OF VARCHAR2(128);

/

  GRANT EXECUTE ON "SYS"."AUD_PDB_LIST" TO "AUDSYS";
--------------------------------------------------------
--  DDL for Type AVTUNE_LOG_LISTAGGCLOBTYPE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AVTUNE_LOG_LISTAGGCLOBTYPE" AS OBJECT (
  val CLOB,

  static function ODCIAggregateInitialize(
    actx IN OUT avtune_log_listaggclobtype) return number,

  member function ODCIAggregateIterate(
    self IN OUT avtune_log_listaggclobtype,
    nxtval CLOB) return number,

  member function ODCIAggregateMerge(
    self IN OUT avtune_log_listaggclobtype,
    ctx2 IN avtune_log_listaggclobtype) return number,

  member function ODCIAggregateTerminate(
    self IN avtune_log_listaggclobtype,
    ReturnValue OUT CLOB,
    flags IN number) return number
);
/
CREATE OR REPLACE NONEDITIONABLE TYPE BODY "SYS"."AVTUNE_LOG_LISTAGGCLOBTYPE" IS

  static function ODCIAggregateInitialize(
    actx IN OUT avtune_log_listaggclobtype) return number is
  begin
    actx := avtune_log_listaggclobtype('');
    return ODCIConst.Success;
  end;

  member function ODCIAggregateIterate(
    self IN OUT avtune_log_listaggclobtype,
    nxtval CLOB) return number is
  begin
    if self.val is null then
      self.val := nxtval;
    else
      self.val := self.val || nxtval;
    end if;
    return ODCIConst.Success;
  end;

  member function ODCIAggregateMerge(
    self IN OUT avtune_log_listaggclobtype,
    ctx2 IN avtune_log_listaggclobtype) return number is
  begin
    if self.val is null then
      self.val := ctx2.val;
    else
      self.val := self.val || ctx2.val;
    end if;
    return ODCIConst.Success;
  end;

  member function ODCIAggregateTerminate(
    self IN avtune_log_listaggclobtype,
    ReturnValue OUT CLOB,
    flags IN number) return number is
  begin
    ReturnValue := self.val;
    return ODCIConst.Success;
  end;

END;

/
--------------------------------------------------------
--  DDL for Type AWRBL_DETAILS_TYPE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AWRBL_DETAILS_TYPE" 
  as object (dbid                number
            ,baseline_id         number
            ,instance_number     number
            ,start_snap_id       number
            ,start_snap_time     timestamp(3)
            ,end_snap_id         number
            ,end_snap_time       timestamp(3)
            ,shutdown            varchar2(3)
            ,error_count         number
            ,pct_total_time      number)

/

  GRANT EXECUTE ON "SYS"."AWRBL_DETAILS_TYPE" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type AWRBL_DETAILS_TYPE_TABLE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AWRBL_DETAILS_TYPE_TABLE" 
  as table of AWRBL_DETAILS_TYPE

/

  GRANT EXECUTE ON "SYS"."AWRBL_DETAILS_TYPE_TABLE" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type AWRBL_METRIC_TYPE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AWRBL_METRIC_TYPE" force
  as object (baseline_name       varchar2(128)
            ,dbid                number
            ,instance_number     number
            ,beg_time            timestamp(3)
            ,end_time            timestamp(3)
            ,metric_name         varchar2(64)
            ,metric_unit         varchar2(64)
            ,num_interval        number
            ,interval_size       number
            ,average             number
            ,minimum             number
            ,maximum             number)

/

  GRANT EXECUTE ON "SYS"."AWRBL_METRIC_TYPE" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type AWRBL_METRIC_TYPE_TABLE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AWRBL_METRIC_TYPE_TABLE" 
  as table of AWRBL_METRIC_TYPE

/

  GRANT EXECUTE ON "SYS"."AWRBL_METRIC_TYPE_TABLE" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type AWRDRPT_TEXT_TYPE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AWRDRPT_TEXT_TYPE" 
  as object (output varchar2(320 CHAR))

/

  GRANT EXECUTE ON "SYS"."AWRDRPT_TEXT_TYPE" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type AWRDRPT_TEXT_TYPE_TABLE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AWRDRPT_TEXT_TYPE_TABLE" 
  as table of AWRDRPT_TEXT_TYPE

/

  GRANT EXECUTE ON "SYS"."AWRDRPT_TEXT_TYPE_TABLE" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type AWR_EXPORT_DUMP_ID_TYPE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AWR_EXPORT_DUMP_ID_TYPE" 
  AS
    OBJECT (
      src_name        VARCHAR2(30)
    , src_dbid        NUMBER
    , begin_snap      NUMBER
    , end_snap        NUMBER
    , db_name         VARCHAR2(30)
    , db_version      VARCHAR2(17)
    , wr_version      NUMBER
   )

/

  GRANT EXECUTE ON "SYS"."AWR_EXPORT_DUMP_ID_TYPE" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type AWR_OBJECT
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AWR_OBJECT" authid current_user
  under generic_plan_object
(sql_id          varchar2(13),
 dbid            number,
 con_dbid        number,
 plan_hash_value number,
 constructor function awr_object(sql_id varchar2,
                                 dbid number default null,
                                 con_dbid number default null,
                                 plan_hash_value number default null)
   return self as result,
overriding member function get_plan_rows return sql_plan_table_type)
/
CREATE OR REPLACE NONEDITIONABLE TYPE BODY "SYS"."AWR_OBJECT" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
e
8a3 477
gF9tC0rw5UlHp3NZl3bEEOtFrBEwg2NcuiATfI4Zxz8CYyIU99gioCXFKoMd+7A4ZlCrt9+u
px1+OAJnN9jZP3NK12KhhN/eK6KKx4baH6pLPe81XsZUqAhBTvVz79IMkUXW+yWkBQF361iE
s0cDMsl73yVBPr/oD/T/YLm3lS4dYirlcioj1lt9INl1rO3NYuhGZtZHIXLguKDYqrhEfOQk
aCxi14vH15BOY8lCXXGJLV/mvU5N8HHg18iLFbONJxZb7PFb66cbCb87Br5KgDKsuZ0OBaEK
JgrhFSex3o7PyNm13IMbOezJJK0/cvtIfHvzLnu0S2zfV9Y2P//xaSer6HOpb6IBBd8IN3zi
FWnBiAn2Aznd8kegJulX1vqmY1kcPLeAfRgDH+j8MSEQ9RLH/jpI2Geg+Vz6cqK3pQEm1cet
8sXHDfxKz0sRHsfUUfz0ZQCv52AgatUWqHTFJSqc8PXG8QfMctiOIH9y4C1DQpL/2RBvSmGY
V9RaABLBCl/xSxbp8TiJB/SFD5lfJVZH6Yhjur6NtemdqjJVzt+y5mh2Jf55dcSwO1p7jePv
UqijAlNhja3D5/F9xHRURmb+eGiuhkzhdWmO0oCXohxIDMsbFucDwNbMp2/MjYlPb2x66Ryi
uqbDuX+ju9mlCadDG0dCPrwLiFPDUleJYpbQRN6f88x5sGfp6ViAHkzwFgUInlyJKxP5QAKh
1G1Zzmn97vg4zKVWKNaFH2Ud0mIYDKkjyvxbibDC/56pdh1fGTxS/J3fpF6ttfL886vQN9wj
4JC+FoYD6IL8VmktluLWDY/9Fvsg6DPYOk5uaVE52p4vcexjKkVk3FOnShIv3mE3rDLBbP5U
odFCzlBuhGSLX7rXbCAyOt9RtKVPZhkCLsh+TrZP/P8HUk37inxMr3APskmU1aAasm00L1UL
NlhtRH9Zsp+kTHcb6NduYaQNR8ds1itxSpS/hqewCIBlSA/ot4D6DdbWSLSFOFC2H6/rIoVr
7zRAvPYiguiZnJ1Nv6Yh5nnXReiR+0f/KgyQiCnjz3fKxhFNiAzXPPR/drEI3Ba8p0EVdnZw
XL1SzkDdwbXnuFv+yqVrS3g9mUEdjeQInL0awspP+abH60k3

/

  GRANT EXECUTE ON "SYS"."AWR_OBJECT" TO PUBLIC;
  GRANT EXECUTE ON "SYS"."AWR_OBJECT" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type AWR_OBJECT_INFO_TABLE_TYPE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AWR_OBJECT_INFO_TABLE_TYPE" as table of AWR_OBJECT_INFO_TYPE

/
--------------------------------------------------------
--  DDL for Type AWR_OBJECT_INFO_TYPE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AWR_OBJECT_INFO_TYPE" 
 as object (
             owner_name        VARCHAR2(128)
           , object_name       VARCHAR2(256)
           , subobject_name    VARCHAR2(256)
           , tablespace_name   VARCHAR2(64)
           , object_type       VARCHAR2(64)
           , partition_type    VARCHAR2(64)
           , index_type        VARCHAR2(64)
           , base_object_name  VARCHAR2(128)
           , base_object_owner VARCHAR2(128)
           , base_object_id    NUMBER
)

/
--------------------------------------------------------
--  DDL for Type AWRRPT_CLB_ARY
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AWRRPT_CLB_ARY" IS VARRAY(30) OF CLOB

/

  GRANT EXECUTE ON "SYS"."AWRRPT_CLB_ARY" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type AWRRPT_HTML_TYPE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AWRRPT_HTML_TYPE" 
  as object (output varchar2(8000 CHAR))

/

  GRANT EXECUTE ON "SYS"."AWRRPT_HTML_TYPE" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type AWRRPT_HTML_TYPE_TABLE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AWRRPT_HTML_TYPE_TABLE" 
  as table of AWRRPT_HTML_TYPE

/

  GRANT EXECUTE ON "SYS"."AWRRPT_HTML_TYPE_TABLE" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type AWRRPT_INSTANCE_LIST_TYPE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AWRRPT_INSTANCE_LIST_TYPE" FORCE as TABLE OF NUMBER

/

  GRANT EXECUTE ON "SYS"."AWRRPT_INSTANCE_LIST_TYPE" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type AWRRPT_NUM_ARY
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AWRRPT_NUM_ARY" IS VARRAY(30) of NUMBER

/

  GRANT EXECUTE ON "SYS"."AWRRPT_NUM_ARY" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type AWRRPT_NUMBER_LIST_TYPE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AWRRPT_NUMBER_LIST_TYPE" FORCE as TABLE OF NUMBER

/

  GRANT EXECUTE ON "SYS"."AWRRPT_NUMBER_LIST_TYPE" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type AWRRPT_ROW_TYPE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AWRRPT_ROW_TYPE" 
  as object ( num_dfn AWRRPT_NUM_ARY,
              vch_dfn AWRRPT_VCH_ARY,
              clb_dfn AWRRPT_CLB_ARY)

/

  GRANT EXECUTE ON "SYS"."AWRRPT_ROW_TYPE" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type AWRRPT_TEXT_TYPE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AWRRPT_TEXT_TYPE" 
  as object (output varchar2(80 CHAR))

/

  GRANT EXECUTE ON "SYS"."AWRRPT_TEXT_TYPE" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type AWRRPT_TEXT_TYPE_TABLE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AWRRPT_TEXT_TYPE_TABLE" 
  as table of AWRRPT_TEXT_TYPE

/

  GRANT EXECUTE ON "SYS"."AWRRPT_TEXT_TYPE_TABLE" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type AWRRPT_VARCHAR256_LIST_TYPE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AWRRPT_VARCHAR256_LIST_TYPE" as TABLE OF VARCHAR2(256)

/

  GRANT EXECUTE ON "SYS"."AWRRPT_VARCHAR256_LIST_TYPE" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type AWRRPT_VCH_ARY
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AWRRPT_VCH_ARY" IS VARRAY(30) OF VARCHAR2(80 CHAR)

/

  GRANT EXECUTE ON "SYS"."AWRRPT_VCH_ARY" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type AWRSQRPT_TEXT_TYPE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AWRSQRPT_TEXT_TYPE" 
  as object (output varchar2(120 CHAR))

/

  GRANT EXECUTE ON "SYS"."AWRSQRPT_TEXT_TYPE" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type AWRSQRPT_TEXT_TYPE_TABLE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."AWRSQRPT_TEXT_TYPE_TABLE" 
  as table of AWRSQRPT_TEXT_TYPE

/

  GRANT EXECUTE ON "SYS"."AWRSQRPT_TEXT_TYPE_TABLE" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type BC_DDL_ARRAY_T
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."BC_DDL_ARRAY_T" AS VARRAY(1) OF BC_DDL_T

/
--------------------------------------------------------
--  DDL for Type BC_DDL_T
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."BC_DDL_T" AS OBJECT
(
  SQL_TEXT              VARCHAR2(2000),
  TRANSACTION_ID	RAW(16),
  PROMOTION_TS		TIMESTAMP,
  CHAIN#        	NUMBER,
  BC_USER               VARCHAR2(128),
  BC_GUID		RAW(16),
  PEER_COUNT            NUMBER,
  CHAIN_GUIDS           RAW(2000),
  ATTRIBUTE             VARCHAR2(128),
  ATTRIBUTE_VALUE       VARCHAR2(128),
  PEER_NAME             VARCHAR2(128),
  NEW_CHAIN_GUID        RAW(16),
  DDL_TYPE              RAW(1),
  DEPENDENT_EPOCH#	NUMBER,
  SPARE1		NUMBER,
  SPARE2		RAW(2000)
)

/
--------------------------------------------------------
--  DDL for Type BC_DEPENDENCY_WATERMARK_ARRAY_T
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."BC_DEPENDENCY_WATERMARK_ARRAY_T" AS VARRAY(65536) OF SYS.BC_DEPENDENCY_WATERMARK_T

/
--------------------------------------------------------
--  DDL for Type BC_DEPENDENCY_WATERMARK_T
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."BC_DEPENDENCY_WATERMARK_T" AS OBJECT(
  CHAIN#      NUMBER,
  CHAIN_GUID  RAW(16),
  BLOCK#      NUMBER,
  ENTRY#      NUMBER);

/
--------------------------------------------------------
--  DDL for Type BC_EXEC_CONTEXT_OPN_ARRAY_T
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."BC_EXEC_CONTEXT_OPN_ARRAY_T" AS VARRAY(4096) OF SYS.BC_EXEC_CONTEXT_OPN_T

/
--------------------------------------------------------
--  DDL for Type BC_EXEC_CONTEXT_OPN_T
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."BC_EXEC_CONTEXT_OPN_T" AS OBJECT
(
  OPERATION_TYPE    NUMBER,
  OPERATION_DEPTH   NUMBER,
  SCHEMA_NAME       VARCHAR2(128),
  PACKAGE_NAME      VARCHAR2(128),
  NAME              VARCHAR2(128),
  SHORT_SQL         VARCHAR2(4000),
  LONG_SQL_OFFSET   NUMBER,
  LONG_SQL_LENGTH   NUMBER,
  SMALL_MISC        RAW(2000),
  LARGE_MISC_OFFSET NUMBER,
  LARGE_MISC_LENGTH NUMBER)

/
--------------------------------------------------------
--  DDL for Type BC_EXEC_CONTEXT_TXN_ARRAY_T
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."BC_EXEC_CONTEXT_TXN_ARRAY_T" AS VARRAY(4096) OF SYS.BC_EXEC_CONTEXT_TXN_T

/
--------------------------------------------------------
--  DDL for Type BC_EXEC_CONTEXT_TXN_T
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."BC_EXEC_CONTEXT_TXN_T" AS OBJECT
(
  TRANSACTION_ID               RAW(16),
  CHAIN#                       NUMBER,
  CHAIN_GUID                   RAW(16),
  PROMOTION_TS                 TIMESTAMP,
  BLOCK#                       NUMBER,
  START_OPERATIONS_INDEX       NUMBER,
  END_OPERATIONS_INDEX         NUMBER,
  START_DEPENDENT_TRAN_INDEX   NUMBER,
  END_DEPENDENT_TRAN_INDEX     NUMBER
)

/
--------------------------------------------------------
--  DDL for Type BC_GLOBAL_TRAN_ARRAY_T
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."BC_GLOBAL_TRAN_ARRAY_T" AS VARRAY(65536) OF SYS.BC_GLOBAL_TRAN_T

/
--------------------------------------------------------
--  DDL for Type BC_GLOBAL_TRAN_T
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."BC_GLOBAL_TRAN_T" AS OBJECT(
  CHAIN#       NUMBER,
  PROMOTION_TS TIMESTAMP);

/
--------------------------------------------------------
--  DDL for Type BC_MARKER_ARRAY_T
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."BC_MARKER_ARRAY_T" AS VARRAY(1) OF BC_MARKER_T

/
--------------------------------------------------------
--  DDL for Type BC_MARKER_T
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."BC_MARKER_T" AS OBJECT
(
  EPOCH#                NUMBER,
  PEER_ID               NUMBER,
  MARKER_TYPE           RAW(1),
  SPARE1                NUMBER,
  SPARE2                RAW(2000)
)

/
--------------------------------------------------------
--  DDL for Type BC_VOTE_ARRAY_T
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."BC_VOTE_ARRAY_T" AS VARRAY(256) OF BC_VOTE_T

/
--------------------------------------------------------
--  DDL for Type BC_VOTE_T
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."BC_VOTE_T" AS OBJECT
(
  TRANSACTION_ID       RAW(16),
  CHAIN#               NUMBER,
  CHAIN_GUID           RAW(16),
  PROMOTION_TS         TIMESTAMP,
  ERROR#               NUMBER,
  ERROR_MESSAGE        VARCHAR2(4000)
)

/
--------------------------------------------------------
--  DDL for Type BITMAPAGGIMP
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."BITMAPAGGIMP" 
  authid current_user as object
(
  key RAW(8),

  static function ODCIAggregateInitialize(sctx OUT BitmapAggImp,
                                          outopn IN RAW,
                                          inpopn IN RAW)
    return pls_integer
    is language c
    name "BitmapAggInitialize"
    library kci_ctxagg_lib
    with context
    parameters (
      context,
      sctx,
      sctx INDICATOR STRUCT,
      sctx DURATION OCIDuration,
      outopn OCIRaw,
      inpopn OCIRaw,
      return INT
    ),

  member function ODCIAggregateIterate(self IN OUT NOCOPY BitmapAggImp,
                                       value IN AnyData)
    return pls_integer
    is language c
    name "BitmapAggIterate"
    library kci_ctxagg_lib
    with context
    parameters (
      context,
      self,
      self INDICATOR STRUCT,
      self DURATION OCIDuration,
      value,
      value INDICATOR sb2,
      return INT
    ),

  member function ODCIAggregateTerminate(self IN OUT NOCOPY BitmapAggimp,
                                         returnValue OUT BLOB,
                                         flags IN number)
    return pls_integer
    is language c
    name "BitmapAggTerminate"
    library kci_ctxagg_lib
    with context
    parameters (
      context,
      self,
      self INDICATOR STRUCT,
      returnValue,
      returnValue INDICATOR sb2,
      returnValue DURATION OCIDuration,
      flags,
      flags INDICATOR sb2,
      return INT
    ),

  member function ODCIAggregateMerge(self IN OUT NOCOPY BitmapAggImp,
                                     valueB IN BitmapAggimp)
    return pls_integer
    is language c
    name "BitmapAggMerge"
    library kci_ctxagg_lib
    with context
    parameters (
      context,
      self,
      self INDICATOR STRUCT,
      self DURATION OCIDuration,
      valueB,
      valueB INDICATOR STRUCT,
      return INT
    ),

  member function ODCIAggregateWrapContext(self IN OUT NOCOPY BitmapAggImp)
    return pls_integer
    is language c
    name "KciCtxAggWrap"
    library kci_ctxagg_lib
    with context
    parameters (
      context,
      self,
      self INDICATOR STRUCT,
      self DURATION OCIDuration,
      return INT
    )
);

/
--------------------------------------------------------
--  DDL for Type CANSYNCREFARRAYTYPE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."CANSYNCREFARRAYTYPE" AS VARRAY(256) OF
Sys.CanSyncRefMessage;

/

  GRANT EXECUTE ON "SYS"."CANSYNCREFARRAYTYPE" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type CANSYNCREFMESSAGE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."CANSYNCREFMESSAGE" FORCE IS OBJECT (
          schema_name        VARCHAR2(128),
          table_name         VARCHAR2(128),
          mv_schema_name     VARCHAR2(128),
          mv_name            VARCHAR2(128),
          eligible           VARCHAR2(1),
          seq_num            NUMBER,
          msg_number         NUMBER,
          message            VARCHAR2(4000));

/

  GRANT EXECUTE ON "SYS"."CANSYNCREFMESSAGE" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type CATRSIAGGIMP
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."CATRSIAGGIMP" 
  authid current_user as object
(
  key RAW(8),

  static function ODCIAggregateInitialize(sctx                 OUT CATRSIAggImp,
                                          outopn                IN RAW,
                                          inpopn                IN RAW,
                                          index_name            IN VARCHAR2,
                                          query                 IN VARCHAR2,
                                          result_set_descriptor IN CLOB,
                                          part_name             IN VARCHAR2,
                                          format                IN NUMBER,
                                          parallel_degree       IN NUMBER
                                          )
    return pls_integer
    is language c
    name "CATRSIAggInitialize"
    library kci_ctxagg_lib
    with context
    parameters (
      context,
      sctx,
      sctx                  INDICATOR STRUCT,
      sctx                  DURATION  OCIDuration,
      outopn                          OCIRaw,
      inpopn                          OCIRaw,
      index_name                      OCIString,
      index_name            INDICATOR sb4,
      query                           OCIString,
      query                 INDICATOR sb4,
      result_set_descriptor           OCILobLocator,
      result_set_descriptor INDICATOR sb4,
      part_name                       OCIString,
      part_name             INDICATOR sb4,
      format                          OCINumber,
      format                INDICATOR sb4,
      parallel_degree                 OCINumber,
      parallel_degree       INDICATOR sb4,
      return                          INT
    ),

  member function ODCIAggregateIterate(self  IN OUT NOCOPY CATRSIAggImp,
                                       value IN            CLOB)
    return pls_integer
    is language c
    name "CATRSIAggIterate"
    library kci_ctxagg_lib
    with context
    parameters (
      context,
      self,
      self  INDICATOR STRUCT,
      self  DURATION  OCIDuration,
      value,
      value INDICATOR sb2,
      return          INT
    ),

  member function ODCIAggregateTerminate(self        IN OUT NOCOPY CATRSIAggimp,
                                         returnValue OUT           CLOB,
                                         flags       IN            number)
    return pls_integer
    is language c
    name "CATRSIAggTerminate"
    library kci_ctxagg_lib
    with context
    parameters (
      context,
      self,
      self        INDICATOR STRUCT,
      returnValue,
      returnValue INDICATOR sb2,
      returnValue DURATION  OCIDuration,
      flags,
      flags       INDICATOR sb2,
      return                INT
    ),

  member function ODCIAggregateMerge(self   IN OUT NOCOPY CATRSIAggImp,
                                     valueB IN            CATRSIAggimp)
    return pls_integer
    is language c
    name "CATRSIAggMerge"
    library kci_ctxagg_lib
    with context
    parameters (
      context,
      self,
      self   INDICATOR STRUCT,
      self   DURATION  OCIDuration,
      valueB,
      valueB INDICATOR STRUCT,
      return INT
    ),

  member function ODCIAggregateWrapContext(self IN OUT NOCOPY CATRSIAggImp)
    return pls_integer
    is language c
    name "CATRSIAggWrap"
    library kci_ctxagg_lib
    with context
    parameters (
      context,
      self,
      self   INDICATOR STRUCT,
      self   DURATION  OCIDuration,
      return INT
    )
);

/
--------------------------------------------------------
--  DDL for Type CHNF$_DESC
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."CHNF$_DESC" as object(
   registration_id number,
   transaction_id  raw(8),
   dbname          varchar2(30),
   event_type      number,
   numtables       number,
   table_desc_array   chnf$_tdesc_array,
   query_desc_array   chnf$_qdesc_array)

/

  GRANT EXECUTE ON "SYS"."CHNF$_DESC" TO PUBLIC;
  GRANT EXECUTE ON "SYS"."CHNF$_DESC" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type CHNF$_QDESC
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."CHNF$_QDESC" as object(
    queryid number,
    queryop number,
    table_desc_array chnf$_tdesc_array)

/

  GRANT EXECUTE ON "SYS"."CHNF$_QDESC" TO PUBLIC;
  GRANT EXECUTE ON "SYS"."CHNF$_QDESC" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type CHNF$_QDESC_ARRAY
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."CHNF$_QDESC_ARRAY" as VARRAY(1073741824) of chnf$_qdesc

/

  GRANT EXECUTE ON "SYS"."CHNF$_QDESC_ARRAY" TO PUBLIC;
  GRANT EXECUTE ON "SYS"."CHNF$_QDESC_ARRAY" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type CHNF$_RDESC
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."CHNF$_RDESC" as object(
   opflags number,
   row_id varchar2(2000))

/

  GRANT EXECUTE ON "SYS"."CHNF$_RDESC" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type CHNF$_RDESC_ARRAY
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."CHNF$_RDESC_ARRAY" as VARRAY(1073741824) of chnf$_rdesc

/

  GRANT EXECUTE ON "SYS"."CHNF$_RDESC_ARRAY" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type CHNF$_REG_INFO
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."CHNF$_REG_INFO" as object (
       callback varchar2(64),
       qosflags number,
       timeout number,
       operations_filter number,
       transaction_lag number,
       ntfn_grouping_class        NUMBER,    -- ntfn grouping class
       ntfn_grouping_value        NUMBER,    -- ntfn grouping value
       ntfn_grouping_type         NUMBER,    -- ntfn grouping type
       ntfn_grouping_start_time   TIMESTAMP WITH TIME ZONE, -- grp start time
       ntfn_grouping_repeat_count NUMBER,    -- ntfn grp repeat count
       CONSTRUCTOR FUNCTION chnf$_reg_info(
         callback varchar2,
         qosflags number,
         timeout number)
       RETURN SELF AS RESULT ,   -- basic type without any frills
       CONSTRUCTOR FUNCTION chnf$_reg_info(
         callback varchar2,
         qosflags number,
         timeout number,
         operations_filter number,
         transaction_lag number)  -- 10gR2 type for backward compat
       RETURN SELF AS RESULT,
       CONSTRUCTOR FUNCTION chnf$_reg_info(
         callback varchar2,
         qosflags number,
         timeout number,
         operations_filter number,
         ntfn_grouping_class        NUMBER,
         ntfn_grouping_value        NUMBER,
         ntfn_grouping_type         NUMBER,
         ntfn_grouping_start_time   TIMESTAMP WITH TIME ZONE,
         ntfn_grouping_repeat_count NUMBER)
         RETURN SELF AS RESULT
         )                    -- depracating the transaction_lag param
 alter type     "SYS"."CHNF$_REG_INFO" modify attribute callback varchar2(257)
  cascade
/
CREATE OR REPLACE NONEDITIONABLE TYPE BODY "SYS"."CHNF$_REG_INFO" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
e
97c 21b
aVwiwup1rYFuv5/hDPcx3GaEMIAwg81cLdxqfC8BuepoUPsURi/v469SzXcVAFv4ccNvKOPh
DPfOtTdToZ7cJU0mNpmRWl0SuzFJmhKeO577WFg7jykyA0FA0MGcpWGTnR3HtqaPOaSTcvpU
yBytPtbdwRawrxh6FomLIZtmjd6Qfz9bS5Gncljte2T3EoYayb4d0m1ZtOhZJ6hfsEUjOS8e
K8jE59wRk2Fp0ZCxjjflT1ldnvYQXXHPkINC4iC/AFXPnIqDKY0hEWbeo82cdxFRfAJLVhmn
mQne09/MceiYukBKebvfiYDEn66+WtOESPCWjos39otoN2hs64d2hWN9GB2+SnVjL7sOBlGx
I6lI6agEREh6CQ0yFDzkJ5LMYrhvJJ0er+iDpIcMPau0/6+qhRWk9UZjun1PIc487lxzVLe1
TcZbi3yiWUB8olkbfKJZ4iQ/lxVRqVvpTs3THLIYP95lGHsaEraetfMAm2Tr1krj3ih7ZlNM
9Vnx/g7vJe0spONzkdOaSU/koHyv

/

  GRANT EXECUTE ON "SYS"."CHNF$_REG_INFO" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type CHNF$_REG_INFO_OC4J
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."CHNF$_REG_INFO_OC4J" as object (
       network_ip_address varchar2(128),
       network_port number,
       qosflags number,
       timeout number,
       operations_filter number,
       transaction_lag number)

/

  GRANT EXECUTE ON "SYS"."CHNF$_REG_INFO_OC4J" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type CHNF$_TDESC
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."CHNF$_TDESC" as object(
   opflags number,
   table_name varchar2(64),
   numrows number,
   row_desc_array chnf$_rdesc_array)
 alter type "SYS"."CHNF$_TDESC" modify attribute table_name varchar2(257)
  cascade

/

  GRANT EXECUTE ON "SYS"."CHNF$_TDESC" TO PUBLIC;
  GRANT EXECUTE ON "SYS"."CHNF$_TDESC" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type CHNF$_TDESC_ARRAY
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."CHNF$_TDESC_ARRAY" as VARRAY(1073741824) of chnf$_tdesc

/

  GRANT EXECUTE ON "SYS"."CHNF$_TDESC_ARRAY" TO PUBLIC;
  GRANT EXECUTE ON "SYS"."CHNF$_TDESC_ARRAY" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type COAD_ADVICE_REC
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."COAD_ADVICE_REC" force as OBJECT (
     owner       dbms_id,
     apiObject   dbms_id,
     sqlObjOwn   dbms_id,
     sqlObject   varchar2(261),
     adviceType  number(38,0),
     disposition clob,
     sqlText     clob,
     dropText    clob )

/
--------------------------------------------------------
--  DDL for Type COAD_ADVICE_T
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."COAD_ADVICE_T" force is table of coad_advice_rec

/
--------------------------------------------------------
--  DDL for Type COLDICTREC
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."COLDICTREC" FORCE AS OBJECT(
  col_name   dbms_id,  -- bug # 19366477 - changed from VARCHAR2(30) to dbms_id
  col_type   number,
  col_def    varchar2(32767),
  col_null   number,
  col_flag   number,
  col_prop   number,
  col_unum   number,
  col_inum   number,
  col_obj    number,
  col_scale  number,
  h_bcnt     number,
  h_pfreq    number,
  col_len    number,
  cu_time    date,
  cu_ep      number,
  cu_ejp     number,
  cu_rp      number,
  cu_lp      number,
  cu_nejp    number,
  cu_np      number
);

/
--------------------------------------------------------
--  DDL for Type COLDICTTAB
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."COLDICTTAB" AS TABLE OF COLDICTREC;

/
--------------------------------------------------------
--  DDL for Type COLHISTREC
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."COLHISTREC" FORCE AS OBJECT(
    cind    integer,                    -- index into CRec structure
    bval    integer,                    -- bucket value
    edval   varchar2(240),              -- endpoint dump value
    enval   number,                     -- endpoint normalized value
    eaval   raw(64),                    -- endpoint actual value
    maxrep  number                      -- used to build freq hisotgrams
);

/
--------------------------------------------------------
--  DDL for Type COLHISTTAB
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."COLHISTTAB" AS TABLE OF COLHISTREC;

/
--------------------------------------------------------
--  DDL for Type CREATE_TABLE_COST_COLINFO
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."CREATE_TABLE_COST_COLINFO" is object
  (
                         col_type varchar(200),
                         col_size number
  )

/

  GRANT EXECUTE ON "SYS"."CREATE_TABLE_COST_COLINFO" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type CREATE_TABLE_COST_COLUMNS
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."CREATE_TABLE_COST_COLUMNS" is varray(50000) of create_table_cost_colinfo

/

  GRANT EXECUTE ON "SYS"."CREATE_TABLE_COST_COLUMNS" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type CREC
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."CREC" FORCE AS OBJECT(
    name    dbms_id,                    -- bug # 19366477 - changed from
    type    number,                     -- c.type#
    sel     dbms_quoted_id,             -- select list item
    def     varchar2(32767),            -- c.default$
    alias   varchar2(30),               -- alias (null if unnecessary)
    nlable  number,                     -- c.null$
    unq     number,                     -- unique if not null
    ucol    number,                     -- c.col#
    icol    number,                     -- c.intcol#
    fixlen  number,                     -- fixed column length
    maxlen  number,                     -- max column length
    hind    integer,                    -- index into first ColHistTab entry
    pfreq   number,                     -- avg frequency based on previously
    gather  integer,                    -- flags indicating basic stats
    hgath   integer,                    -- flags indicating histograms
    bktnum  integer,                    -- # buckets for this histogram
    hreq    integer,                    -- histogram collection required
    freq    integer,                    -- frequency histogram if true
    aclonly integer,                    -- 3620168: only get avg col len
    snnv    number,                     -- sample number of non-null values
    sndv    number,                     -- sample number of distinct values
    snnvdv  number,                     -- sample non-null for dv
    slsv    number,                     -- linearly scalable values in sample
    nnv     number,                     -- number of non-null values
    nv      number,                     -- number of null values
    ndv     number,                     -- number of distinct values
    acl     number,                      -- average column length
    ccnt    number,                     -- > 0 if have histograms
    dens    number,                     -- density
    minval  raw(64),                    -- minimum
    maxval  raw(64),                    -- maximum
    nmin    number,                     -- normalized minimum
    nmax    number,                     -- normalized maximum
    dmin    varchar2(240),              -- 'dump'ed minimum
    dmax    varchar2(240)               -- 'dump'ed maximum
  );

/
--------------------------------------------------------
--  DDL for Type CSVLIST
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."CSVLIST" as table of varchar2(300)

/
--------------------------------------------------------
--  DDL for Type CTAB
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."CTAB" AS TABLE OF CREC;

/
--------------------------------------------------------
--  DDL for Type CTXAGGIMP
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."CTXAGGIMP" 
   authid current_user as object
(
  key RAW(8),

  static function ODCIAggregateInitialize(sctx OUT CtxAggimp, outopn IN RAW,
                                          inpopn IN RAW ) return pls_integer
    is language c
    name "KciCtxAggInitialize"
    library kci_ctxagg_lib
    with context
    parameters (
      context,
      sctx, sctx INDICATOR STRUCT, sctx DURATION OCIDuration,
      outopn OCIRaw,
      inpopn OCIRaw,
      return INT
    ),

  member function ODCIAggregateIterate(self IN OUT NOCOPY CtxAggimp,
                                       value IN AnyData) return pls_integer
    is language c
    name "KciCtxAggIterate"
    library kci_ctxagg_lib
    with context
    parameters (
      context,
      self, self INDICATOR STRUCT, self DURATION OCIDuration,
      value, value INDICATOR sb2,
      return INT
    ),

  member function ODCIAggregateTerminate(self IN OUT NOCOPY CtxAggimp,
                                         returnValue OUT BLOB,
                                         flags IN number)
                  return pls_integer
    is language c
    name "KciCtxAggTerminate"
    library kci_ctxagg_lib
    with context
    parameters (
      context,
      self, self INDICATOR STRUCT,
      returnValue, returnValue INDICATOR sb2, returnValue DURATION OCIDuration,
      flags, flags INDICATOR sb2,
      return INT
    ),

  member function ODCIAggregateMerge(self IN OUT NOCOPY CtxAggimp,
                                     valueB IN CtxAggimp) return pls_integer
    is language c
    name "KciCtxAggMerge"
    library kci_ctxagg_lib
    with context
    parameters (
      context,
      self, self INDICATOR STRUCT, self DURATION OCIDuration,
      valueB, valueB INDICATOR STRUCT,
      return INT
    ),

  member function ODCIAggregateWrapContext(self IN OUT NOCOPY CtxAggimp)
                  return pls_integer
    is language c
    name "KciCtxAggWrap"
    library kci_ctxagg_lib
    with context
    parameters (
      context,
      self, self INDICATOR STRUCT, self DURATION OCIDuration,
      return INT
    )
);

/
--------------------------------------------------------
--  DDL for Type CURSOR_CACHE_OBJECT
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."CURSOR_CACHE_OBJECT" authid current_user
  under generic_plan_object
(sql_id       varchar2(13),
 child_number number,
 constructor function cursor_cache_object(sql_id varchar2,
                                          child_number number default null)
   return self as result,
 overriding member function get_plan_rows return sql_plan_table_type)
/
CREATE OR REPLACE NONEDITIONABLE TYPE BODY "SYS"."CURSOR_CACHE_OBJECT" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
e
6ec 3d1
fefEGqlMMZm8x2x97cMydrmaCRAwg2NcVSATfC+ax7UYt5IvZukQfRpcJ6Bb4G5A9Gf2WYN6
k0Ywsv0PRIB5M7G7dEYaTIUbsum0F5pzub8scc6bQRXbA6cvednFlumOYP0+mz0oiD5Lc22Z
pga+Ihf77hzW3o/TSBLRyKk6HLbbFILFNPp48lPuJFcVYXA4ZWWCMYHnebU6qIIFLUb9R0mJ
NZhU9Sc5y4CzUkAqBIx6cNHOd1isKYx9HhIavXxrv2G61SkFChLG9QK7RF9pU3OesYZqXAy2
rhNVsz3ab024VtDQBH0AMrPT6uRCmZd1eTG5pEfeeQVDKUrAzMc4GYzovtCmALHGaG5Xw7hW
HYc8N6Z6NoliRKoGTMXwcrF4D0hAYus8b9xrETx7D4bRbA3XW3HDI4hx4IVU38rocrIGraN8
Iycr7RRRWhVZiToKaZjmqzHfoWBpnRIe2AbDK8VZbSvzm+anaxhOWSCBo4H9eAAWws9igBKo
qteRMaGTdRziFRTLcg4N+f1MpGdqyvCq3t3yQAGg88xBfl5dNghFLCbnDFg+N8VLpwKDXw6F
ClO9xZfVArtLccaI0wmY89if8kFtCXmRPsPOX3x15Qk99odugWQnv7ICUwkBNOawlSshuYY0
MdKc6egCTRh8FRRGzBQK8o5joku7UlHILmLS+JbHkNt7h0yP8zTY8XqSvpaApFC6g9/GuOMs
Jyg89DOkQcOQZSDLDfEth2ONMOs7MIFWjRGwb58BAWj8GwDqvp0kxLMb3Dy0x7UdZXw7AinT
J7JAsGoIdQLv4MLb35h2XxMo0ny8uMJ6zNO4njPP3GIF21Xu2XlcfpwSTPmDA92xHU1Y3owo
jAqEG9KHcmNKsYZfRY8IiAEijwUAZjQs7wfM/sbOJ64kFYd2OJZZSQ7hwe/5EjTHuKkk4SIi
imOf1MJY2buw0UH8piJzOYZVZHo=

/

  GRANT EXECUTE ON "SYS"."CURSOR_CACHE_OBJECT" TO PUBLIC;
  GRANT EXECUTE ON "SYS"."CURSOR_CACHE_OBJECT" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type DBMS_AW$_COLUMNLIST_T
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."DBMS_AW$_COLUMNLIST_T" AS TABLE OF VARCHAR2(300)

/

  GRANT EXECUTE ON "SYS"."DBMS_AW$_COLUMNLIST_T" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type DBMS_AW$_DIMENSION_SOURCES_T
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."DBMS_AW$_DIMENSION_SOURCES_T" 
   AS TABLE OF dbms_aw$_dimension_source_t

/

  GRANT EXECUTE ON "SYS"."DBMS_AW$_DIMENSION_SOURCES_T" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type DBMS_AW$_DIMENSION_SOURCE_T
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."DBMS_AW$_DIMENSION_SOURCE_T" AS OBJECT
   (dimname     VARCHAR2(300),
    columnname  VARCHAR2(300),
    sourcevalue VARCHAR2(32767),
    dimtype     NUMBER(3,0),
    hiercols    dbms_aw$_columnlist_t,
    partby      NUMBER(10,0))

/

  GRANT EXECUTE ON "SYS"."DBMS_AW$_DIMENSION_SOURCE_T" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type DBMS_CLRPARAMTABLE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."DBMS_CLRPARAMTABLE" AS TABLE OF DBMS_CLRType;

/
--------------------------------------------------------
--  DDL for Type DBMS_CLRTYPE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."DBMS_CLRTYPE" FORCE AS OBJECT (
  paramType             NUMBER(2),
  paramNull             NUMBER(2),
  paramDirection        NUMBER(2),
  typemapping           NUMBER(4),
  intParam              INTEGER,
  floatParam            BINARY_FLOAT,
  doubleParam           BINARY_DOUBLE,
  numberParam           NUMBER,
  dateParam             DATE,
  timestampParam        TIMESTAMP,
  timestampTZParam      TIMESTAMP WITH TIME ZONE,
  timestampLTZParam     TIMESTAMP WITH LOCAL TIME ZONE,
  intervalDSParam       INTERVAL DAY TO SECOND,
  intervalYMParam       INTERVAL YEAR TO MONTH,
  charParam             VARCHAR2(32767),
  varcharParam          VARCHAR2(32767),
  longParam             VARCHAR2(32760),
  ncharParam            NVARCHAR2(32767),
  nvarcharParam         NVARCHAR2(32767),
  rawParam              RAW(32767),
  longRawParam          RAW(32760),
  clobParam             CLOB,
  nclobParam            NCLOB,
  bfileParam            BFILE,
  blobParam             BLOB,
  rowidParam            VARCHAR2(18),
  xmltypeParam          XMLType,
  CONSTRUCTOR FUNCTION DBMS_CLRType(paramType IN BINARY_INTEGER,
    paramDirection IN BINARY_INTEGER, typemapping IN BINARY_INTEGER)
    RETURN SELF AS RESULT
);
/
CREATE OR REPLACE NONEDITIONABLE TYPE BODY "SYS"."DBMS_CLRTYPE" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
e
41f 199
m6WGBxMZmszs729iboPhfjA4VcUwgwK3AK5qfC9AWPjVSDa9qC0Jf87VryU6dpByeWol9JCN
qq5u498nLQOiYU/BAE+2gNSvN0qfNgqEe/2ROjr54U+fphsJ0/9gZoSc+uPQ9T3oj4YOVAJl
4a4OAD4cckHbgUpPsOGmA3AAmGzPIDWhWyp0QZIS5CEfOElYvfFqy8Ps6D6MVmInsRLsY+YP
4nM07WoBwp3zFu9v7oFvcf1zbQ8rK/xFhvq6Luol9am+Z3+XP9V3OMNcEQs8fSeJwFBKCpNs
PRrOj/FNfH6em74mcFU+LEoonnmDZdRpgkcH5UEIDlMCfwkPEEI7ynmOyTJ+zTHdOYzixHep
RU6BEw79NUqAIPaljktotKqlmxONLe+Ymo3GapbiOkT1

/
--------------------------------------------------------
--  DDL for Type DBMS_CUBE_UTIL_DFLT_MSR_R
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."DBMS_CUBE_UTIL_DFLT_MSR_R" force
  as object (owner             dbms_id,
             cube_name         dbms_id,
             default_measure   dbms_id )

/

  GRANT EXECUTE ON "SYS"."DBMS_CUBE_UTIL_DFLT_MSR_R" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type DBMS_CUBE_UTIL_DFLT_MSR_T
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."DBMS_CUBE_UTIL_DFLT_MSR_T" force
  as table of dbms_cube_util_dflt_msr_r

/

  GRANT EXECUTE ON "SYS"."DBMS_CUBE_UTIL_DFLT_MSR_T" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type DBMS_CUBE_UTIL_EXT_MD_R
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."DBMS_CUBE_UTIL_EXT_MD_R" force
  as object (owner             dbms_id,
             dimension_name    dbms_id,
             hierarchy_name    dbms_id,
             default_member    varchar2(4000),
             depth_count       number,
             depth             number,
             depth_cardinality number)

/

  GRANT EXECUTE ON "SYS"."DBMS_CUBE_UTIL_EXT_MD_R" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type DBMS_CUBE_UTIL_EXT_MD_T
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."DBMS_CUBE_UTIL_EXT_MD_T" force
  as table of dbms_cube_util_ext_md_r

/

  GRANT EXECUTE ON "SYS"."DBMS_CUBE_UTIL_EXT_MD_T" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type DBMS_DBFS_CONTENT_CONTEXT_T
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."DBMS_DBFS_CONTENT_CONTEXT_T" 
    authid definer
as object (
    principal   varchar2(32),
    acl         varchar2(1024),
    owner       varchar2(32),
    asof        timestamp,
    read_only   integer
);

/

  GRANT EXECUTE ON "SYS"."DBMS_DBFS_CONTENT_CONTEXT_T" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type DBMS_DBFS_CONTENT_LIST_ITEMS_T
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."DBMS_DBFS_CONTENT_LIST_ITEMS_T" 
    as table of dbms_dbfs_content_list_item_t;

/

  GRANT EXECUTE ON "SYS"."DBMS_DBFS_CONTENT_LIST_ITEMS_T" TO "DBFS_ROLE";
  GRANT EXECUTE ON "SYS"."DBMS_DBFS_CONTENT_LIST_ITEMS_T" TO "XDB";
--------------------------------------------------------
--  DDL for Type DBMS_DBFS_CONTENT_LIST_ITEM_T
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."DBMS_DBFS_CONTENT_LIST_ITEM_T" 
    authid definer
as object (
    path        varchar2(1024),
    item_name   varchar2(256),
    item_type   integer
);

/

  GRANT EXECUTE ON "SYS"."DBMS_DBFS_CONTENT_LIST_ITEM_T" TO "DBFS_ROLE";
  GRANT EXECUTE ON "SYS"."DBMS_DBFS_CONTENT_LIST_ITEM_T" TO "XDB";
--------------------------------------------------------
--  DDL for Type DBMS_DBFS_CONTENT_PROPERTIES_T
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."DBMS_DBFS_CONTENT_PROPERTIES_T" as
    table of dbms_dbfs_content_property_t;

/

  GRANT EXECUTE ON "SYS"."DBMS_DBFS_CONTENT_PROPERTIES_T" TO PUBLIC;
  GRANT EXECUTE ON "SYS"."DBMS_DBFS_CONTENT_PROPERTIES_T" TO "XDB";
--------------------------------------------------------
--  DDL for Type DBMS_DBFS_CONTENT_PROPERTY_T
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."DBMS_DBFS_CONTENT_PROPERTY_T" 
    authid definer
as object (
    propname    varchar2(32),
    propvalue   varchar2(1024),
    typecode    integer
);

/

  GRANT EXECUTE ON "SYS"."DBMS_DBFS_CONTENT_PROPERTY_T" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type DBMS_DBFS_CONTENT_RAW_T
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."DBMS_DBFS_CONTENT_RAW_T" 
    as table of raw(32767);

/

  GRANT EXECUTE ON "SYS"."DBMS_DBFS_CONTENT_RAW_T" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type DBMS_DBFS_HS_ITEM_T
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."DBMS_DBFS_HS_ITEM_T" 
    authid definer
as object (
    storename  varchar2(ORA_MAX_NAME_LEN),
    storeowner varchar2(ORA_MAX_NAME_LEN),
    path        varchar2(1024),
    contentfilename   varchar2(1024)
);

/
--------------------------------------------------------
--  DDL for Type DBMS_DBFS_HS_LITEMS_T
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."DBMS_DBFS_HS_LITEMS_T" 
    as table of dbms_dbfs_hs_item_t;

/
--------------------------------------------------------
--  DDL for Type DBMS_DEBUG_VC2COLL
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."DBMS_DEBUG_VC2COLL" is table of varchar2(1000)

/

  GRANT EXECUTE ON "SYS"."DBMS_DEBUG_VC2COLL" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type DBMS_LOBUTIL_DEDUPSET_T
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."DBMS_LOBUTIL_DEDUPSET_T" AS OBJECT
(
    ismem   VARCHAR(1),     -- is this lob a member of a dedup set? (Y/N)
    setid   RAW(10),        -- deduplication setid
    lobid   RAW(10),        -- this lobid
    nmem    NUMBER,         -- number of members in set
    fhash   RAW(80),        -- full hash of set
    phash   RAW(80)         -- prefix hash of set
);

/

  GRANT EXECUTE ON "SYS"."DBMS_LOBUTIL_DEDUPSET_T" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type DBMS_LOBUTIL_INODE_T
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."DBMS_LOBUTIL_INODE_T" AS OBJECT
(
    lobid   RAW(10),    -- lobid
    flags   NUMBER,     -- inode flags
    length  NUMBER,     -- lob length
    version NUMBER,     -- lob version
    extents NUMBER,     -- #extents in inode
    lhb     NUMBER      -- lhb dba
);

/

  GRANT EXECUTE ON "SYS"."DBMS_LOBUTIL_INODE_T" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type DBMS_LOBUTIL_LOBEXTENTS_T
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."DBMS_LOBUTIL_LOBEXTENTS_T" 
    AS
    TABLE OF dbms_lobutil_lobextent_t;

/

  GRANT EXECUTE ON "SYS"."DBMS_LOBUTIL_LOBEXTENTS_T" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type DBMS_LOBUTIL_LOBEXTENT_T
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."DBMS_LOBUTIL_LOBEXTENT_T" FORCE AS OBJECT
(
    rid     VARCHAR(32),    -- rowid proxy
    row#    NUMBER,         -- rownum proxy
    lobid   RAW(10),        -- lobid
    extent# NUMBER,         -- extent# [0 .. ] for a lobmap
    hole    VARCHAR(1),     -- is the extent a hole? (y/n)
    cont    VARCHAR(1),     -- is the extent a superchunk continuation? (y/n)
    over    VARCHAR(1),     -- is the chunk an overallocation? (y/n)
    rdba    NUMBER,         -- rdba of extent start
    nblks   NUMBER,         -- #blocks in extent
    offset  NUMBER,         -- logical offset of extent start
    length  NUMBER          -- logical length of extent
);

/

  GRANT EXECUTE ON "SYS"."DBMS_LOBUTIL_LOBEXTENT_T" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type DBMS_LOBUTIL_LOBMAP_T
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."DBMS_LOBUTIL_LOBMAP_T" AS OBJECT
(
    lobid   RAW(10),    -- lobid
    eflag   NUMBER,     -- extent flags
    rdba    NUMBER,     -- extent header rdba
    nblks   NUMBER,     -- #blocks in extent
    offset  NUMBER,     -- offset of extent header
    length  NUMBER      -- logical length of extent
);

/

  GRANT EXECUTE ON "SYS"."DBMS_LOBUTIL_LOBMAP_T" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type DBMS_MAX_STRING_SIZE_REC
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."DBMS_MAX_STRING_SIZE_REC" force as object
( type         varchar2(128),
  object_owner dbms_id,
  object_name  dbms_id,
  column_name  dbms_id,
  reason       varchar2(4000)
) not persistable;

/
--------------------------------------------------------
--  DDL for Type DBMS_MAX_STRING_SIZE_TBL
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."DBMS_MAX_STRING_SIZE_TBL" force
 as table of (dbms_max_string_size_rec)
 not persistable;

/
--------------------------------------------------------
--  DDL for Type DBMS_MDX_ODBO_FUNCTION_R
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."DBMS_MDX_ODBO_FUNCTION_R" FORCE AS OBJECT(
    FUNCTION_NAME VARCHAR2(128),
    CAPTION VARCHAR2(128),
    DESCRIPTION VARCHAR2(1000),
    PARAM_LIST VARCHAR2(1000),
    INTERFACE_NAME VARCHAR2(128),
    object VARCHAR2(128))

/

  GRANT EXECUTE ON "SYS"."DBMS_MDX_ODBO_FUNCTION_R" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type DBMS_MDX_ODBO_FUNCTION_T
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."DBMS_MDX_ODBO_FUNCTION_T" AS TABLE OF
    DBMS_MDX_ODBO_FUNCTION_R

/

  GRANT EXECUTE ON "SYS"."DBMS_MDX_ODBO_FUNCTION_T" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type DBMS_MDX_ODBO_KEYWORD_R
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."DBMS_MDX_ODBO_KEYWORD_R" FORCE AS OBJECT(
    KEYWORD_NAME VARCHAR2(128))

/

  GRANT EXECUTE ON "SYS"."DBMS_MDX_ODBO_KEYWORD_R" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type DBMS_MDX_ODBO_KEYWORD_T
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."DBMS_MDX_ODBO_KEYWORD_T" AS TABLE OF
    DBMS_MDX_ODBO_KEYWORD_R

/

  GRANT EXECUTE ON "SYS"."DBMS_MDX_ODBO_KEYWORD_T" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type DBMS_MDX_ODBO_PROPVAL_R
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."DBMS_MDX_ODBO_PROPVAL_R" FORCE AS OBJECT(
    PROPERTY_VALUE NUMBER)

/

  GRANT EXECUTE ON "SYS"."DBMS_MDX_ODBO_PROPVAL_R" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type DBMS_MDX_ODBO_PROPVAL_T
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."DBMS_MDX_ODBO_PROPVAL_T" AS TABLE OF
    DBMS_MDX_ODBO_PROPVAL_R

/

  GRANT EXECUTE ON "SYS"."DBMS_MDX_ODBO_PROPVAL_T" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type DBMS_OBJECTS_UTILS_TINFO
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."DBMS_OBJECTS_UTILS_TINFO" as object (
name       dbms_id,
objid      number,
toid       raw(16),
hashcode   raw(17),
version    number,
stime      date
);

/
--------------------------------------------------------
--  DDL for Type DBMS_OBJECTS_UTILS_TNAME
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."DBMS_OBJECTS_UTILS_TNAME" force as object (
schema  varchar2(128),
typname varchar2(128)
);

/
--------------------------------------------------------
--  DDL for Type DBMS_OBJECTS_UTILS_TNAMEARR
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."DBMS_OBJECTS_UTILS_TNAMEARR" as table of
dbms_objects_utils_tname;

/
--------------------------------------------------------
--  DDL for Type DBMS_OBJECTS_UTILS_TSELEM
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."DBMS_OBJECTS_UTILS_TSELEM" force as object (
objid     number,
source    varchar2(4000)
);

/
--------------------------------------------------------
--  DDL for Type DBMS_OBJECTS_UTILS_TSOURCE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."DBMS_OBJECTS_UTILS_TSOURCE" as varray(100) of
dbms_objects_utils_tselem;

/
--------------------------------------------------------
--  DDL for Type DBMS_OPTIM_BUGVALOBTYPE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."DBMS_OPTIM_BUGVALOBTYPE"   FORCE as object(fix number, val number) NOT PERSISTABLE;

/
--------------------------------------------------------
--  DDL for Type DBMS_OPTIM_FCTABTYPE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."DBMS_OPTIM_FCTABTYPE"   as table of (dbms_optim_bugValObType) NOT PERSISTABLE;

/
--------------------------------------------------------
--  DDL for Type DBMSOUTPUT_LINESARRAY
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."DBMSOUTPUT_LINESARRAY" IS
  VARRAY(2147483647) OF VARCHAR2(32767);

/

  GRANT EXECUTE ON "SYS"."DBMSOUTPUT_LINESARRAY" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type DBMS_RESULT_CACHE_NSP
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."DBMS_RESULT_CACHE_NSP" is VARRAY(100) OF VARCHAR2(100);

/
--------------------------------------------------------
--  DDL for Type DBMS_RESULT_CACHE_SUM
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."DBMS_RESULT_CACHE_SUM" is VARRAY(100) OF NUMBER;

/
--------------------------------------------------------
--  DDL for Type DBMSSTATNUMTAB
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."DBMSSTATNUMTAB" AS TABLE OF Number;

/
--------------------------------------------------------
--  DDL for Type DBMS_UADV_ARR
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."DBMS_UADV_ARR" as VARRAY(100) of NUMBER;

/

  GRANT EXECUTE ON "SYS"."DBMS_UADV_ARR" TO "DBA";
--------------------------------------------------------
--  DDL for Type DBMS_XA_XID
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."DBMS_XA_XID" FORCE as OBJECT (
  FORMATID NUMBER,
  GTRID RAW(64),
  BQUAL RAW(64),
  constructor function DBMS_XA_XID(GTRID in NUMBER)
    return self as result,
  constructor function DBMS_XA_XID(GTRID in RAW, BQUAL in RAW)
    return self as result,
  constructor function DBMS_XA_XID(
      FORMATID in NUMBER,
      GTRID in RAW,
      BQUAL in RAW default HEXTORAW('00000000000000000000000000000001'))
    return self as result
)
/
CREATE OR REPLACE NONEDITIONABLE TYPE BODY "SYS"."DBMS_XA_XID" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
e
355 171
gDqnF0l1hQJlIb9MQFAyHZO6yDcwgzsJr9wdqC+BiupHO3klIblchvtvVKGfNQeoVQD3TXO1
D32mDeIuCycry3wdTosIHFDS5TUjKjfxhFqMWoxcyhUAZx5Myl9iQja2TAw8mEI9Re9dox9b
JlJqpqZ3jrM1UO3uHG5AtLa0aC78/0UJia6/1IbK4+7Qci8mrhYzmCs28l23oNyPidjvVd5x
ZBwi7GrBEuvY366assU6bIMOLNEIY8DLjSDM0oiSUYBvSTNZCPhXXuo3rTzcCMCYLjz7gnlr
8bF+9N6ZTNWvKq7yuFyKYqOZy4/PzDyTtcYz9ZtqX+sZaNNpg+PYtZYgA9vGZM5PWZfrVfPr
wP9R

/

  GRANT EXECUTE ON "SYS"."DBMS_XA_XID" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type DBMS_XA_XID_ARRAY
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."DBMS_XA_XID_ARRAY" as TABLE of DBMS_XA_XID

/

  GRANT EXECUTE ON "SYS"."DBMS_XA_XID_ARRAY" TO PUBLIC;
--------------------------------------------------------
--  DDL for Type DBMS_XPLAN_TYPE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYS"."DBMS_XPLAN_TYPE" FORCE
  as object (plan_table_output varchar2(4000));

/

  GRANT EXECUTE ON "SYS"."DBMS_XPLAN_TYPE" TO PUBLIC;
