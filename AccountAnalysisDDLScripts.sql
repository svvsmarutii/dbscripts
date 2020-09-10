--liquibase formatted sql
--changeset llteam:TLL-001

create schema account_workflow;
CREATE SEQUENCE account_workflow.account_analysis_activity_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



CREATE SEQUENCE account_workflow.account_analysis_queue_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE account_workflow.account_analysis_queue_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE account_workflow.account_analysis_queue_status_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



CREATE SEQUENCE account_workflow.allocation_improvement_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE account_workflow.allocation_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


CREATE SEQUENCE account_workflow.analysis_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


CREATE SEQUENCE account_workflow.analysis_trigger_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



CREATE SEQUENCE account_workflow.diversification_improvement_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE account_workflow.fee_improvement_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


CREATE TABLE account_workflow.analysis_status
(
    id integer NOT NULL DEFAULT nextval('account_workflow.analysis_status_id_seq'::regclass),
    name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    isactive boolean NOT NULL,
    created_at timestamp without time zone NOT NULL,
    description character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT analysis_status_pkey PRIMARY KEY (id)
);

CREATE TABLE account_workflow.allocation_type
(
    id integer NOT NULL DEFAULT nextval('account_workflow.allocation_type_id_seq'::regclass),
    name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT allocation_type_pkey PRIMARY KEY (id)
);
--######################LOOKUP#############################

CREATE TABLE account_workflow.analysis_trigger
(
    id integer NOT NULL DEFAULT nextval('account_workflow.analysis_trigger_id_seq'::regclass),
    name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    isactive boolean NOT NULL,
    created_at timestamp without time zone NOT NULL,
    description character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT analysis_trigger_pkey PRIMARY KEY (id)
);
--########################LOOKUP#############################

CREATE TABLE account_workflow.ticker_code
(
    id integer NOT NULL,
    name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT ticker_code_pkey PRIMARY KEY (id)
);
--#########################################################

CREATE TABLE account_workflow.account_analysis_queue
(
    id integer NOT NULL DEFAULT nextval('account_workflow.account_analysis_queue_id_seq'::regclass),
    account_id bigint NOT NULL,
    provider_id bigint NOT NULL,
    analysis_status_id bigint NOT NULL,
    trigger_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    last_updated timestamp without time zone NOT NULL,
    CONSTRAINT account_analysis_queue_pkey PRIMARY KEY (id),
    CONSTRAINT account_analysis_queue_analysis_status_id_fkey FOREIGN KEY (analysis_status_id)
        REFERENCES account_workflow.analysis_status (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT account_analysis_queue_trigger_id_fkey FOREIGN KEY (trigger_id)
        REFERENCES account_workflow.analysis_trigger (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);
--##########################################

CREATE TABLE account_workflow.account_analysis_activity_log
(
    id integer NOT NULL DEFAULT nextval('account_workflow.account_analysis_activity_log_id_seq'::regclass),
    account_analysis_queue_id bigint NOT NULL,
    account_id bigint NOT NULL,
    provider_id bigint NOT NULL,
    activity_name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    status character varying(50) COLLATE pg_catalog."default" NOT NULL,
    status_description character varying(100) COLLATE pg_catalog."default" NOT NULL,
    created_at timestamp without time zone NOT NULL,
    start_at timestamp without time zone NOT NULL,
    end_at timestamp without time zone NOT NULL,
    CONSTRAINT account_analysis_activity_log_pkey PRIMARY KEY (id),
    CONSTRAINT account_analysis_activity_log_account_analysis_queue_id_fkey FOREIGN KEY (account_analysis_queue_id)
        REFERENCES account_workflow.account_analysis_queue (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);
--#################################

CREATE TABLE account_workflow.account_analysis_queue_log
(
    id integer NOT NULL DEFAULT nextval('account_workflow.account_analysis_queue_log_id_seq'::regclass),
    account_id bigint NOT NULL,
    provider_id bigint NOT NULL,
    analysis_status_id bigint NOT NULL,
    trigger_id bigint NOT NULL,
    analysis_version bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    last_updated timestamp without time zone NOT NULL,
    CONSTRAINT account_analysis_queue_log_pkey PRIMARY KEY (id),
    CONSTRAINT account_analysis_queue_log_analysis_status_id_fkey FOREIGN KEY (analysis_status_id)
        REFERENCES account_workflow.analysis_status (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT account_analysis_queue_log_trigger_id_fkey FOREIGN KEY (trigger_id)
        REFERENCES account_workflow.analysis_trigger (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);	
--###############################################
CREATE TABLE account_workflow.account_analysis_queue_status_history
(
    id integer NOT NULL DEFAULT nextval('account_workflow.account_analysis_queue_status_history_id_seq'::regclass),
    account_analysis_queue_id bigint NOT NULL,
    account_id bigint NOT NULL,
    provider_id bigint NOT NULL,
    analysis_status_id bigint NOT NULL,
    trigger_id bigint NOT NULL,
    analysis_version bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    last_updated timestamp without time zone NOT NULL,
    added_at timestamp without time zone NOT NULL,
    CONSTRAINT account_analysis_queue_status_history_pkey PRIMARY KEY (id),
    CONSTRAINT account_analysis_queue_status_history_analysis_status_id_fkey FOREIGN KEY (analysis_status_id)
        REFERENCES account_workflow.analysis_status (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT account_analysis_queue_status_history_trigger_id_fkey FOREIGN KEY (trigger_id)
        REFERENCES account_workflow.analysis_trigger (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);	
--#########################################################

CREATE TABLE account_workflow.account_analysis_summary
(
    account_analysis_queue_id bigint NOT NULL,
    account_id bigint NOT NULL,
    provider_id bigint NOT NULL,
    allocation_json character varying COLLATE pg_catalog."default" NOT NULL,
    feejson character varying COLLATE pg_catalog."default" NOT NULL,
    diversificationjson character varying COLLATE pg_catalog."default" NOT NULL,
    retirement_account_json character varying COLLATE pg_catalog."default" NOT NULL,
    analysis_summary character varying COLLATE pg_catalog."default" NOT NULL,
    projection_summary character varying COLLATE pg_catalog."default" NOT NULL,
    analysis_version bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    CONSTRAINT account_analysis_summary_account_analysis_queue_id_fkey FOREIGN KEY (account_analysis_queue_id)
        REFERENCES account_workflow.account_analysis_queue (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);
--#########################################################

CREATE TABLE account_workflow.fee_improvement
(
    id integer NOT NULL DEFAULT nextval('account_workflow.fee_improvement_id_seq'::regclass),
    account_analysis_queue_id bigint NOT NULL,
    account_id bigint NOT NULL,
    provider_id bigint NOT NULL,
    optimalvalue numeric NOT NULL,
    optimalpercent numeric NOT NULL,
    currentvalue numeric NOT NULL,
    currentpercent numeric NOT NULL,
    datecreated timestamp without time zone NOT NULL,
    CONSTRAINT fee_improvement_pkey PRIMARY KEY (id),
    CONSTRAINT fee_improvement_account_analysis_queue_id_fkey FOREIGN KEY (account_analysis_queue_id)
        REFERENCES account_workflow.account_analysis_queue (id) MATCH SIMPLE
		ON UPDATE NO ACTION
        ON DELETE NO ACTION
);
--#########################################################

CREATE TABLE account_workflow.allocation_improvement
(
    id integer NOT NULL DEFAULT nextval('account_workflow.allocation_improvement_id_seq'::regclass),
    account_analysis_queue_id bigint NOT NULL,
    account_id bigint NOT NULL,
    provider_id bigint NOT NULL,
    allocation_type_id integer NOT NULL,
    currentpercent integer NOT NULL,
    recommendedpercent integer NOT NULL,
    datecreated timestamp without time zone NOT NULL,
    CONSTRAINT allocation_improvement_pkey PRIMARY KEY (id),
    CONSTRAINT allocation_improvement_account_analysis_queue_id_fkey FOREIGN KEY (account_analysis_queue_id)
        REFERENCES account_workflow.account_analysis_queue (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT allocation_improvement_allocation_type_id_fkey FOREIGN KEY (allocation_type_id)
        REFERENCES account_workflow.allocation_type (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);
--####################################################
CREATE TABLE account_workflow.diversification_improvement
(
    id integer NOT NULL DEFAULT nextval('account_workflow.diversification_improvement_id_seq'::regclass),
    account_analysis_queue_id bigint NOT NULL,
    account_id bigint NOT NULL,
    provider_id bigint NOT NULL,
    tickercode character varying(20) COLLATE pg_catalog."default" NOT NULL,
    currentvalue numeric NOT NULL,
    recommendedvalue numeric NOT NULL,
    datecreated timestamp without time zone NOT NULL,
    CONSTRAINT diversification_improvement_pkey PRIMARY KEY (id),
    CONSTRAINT diversification_improvement_account_analysis_queue_id_fkey FOREIGN KEY (account_analysis_queue_id)
        REFERENCES account_workflow.account_analysis_queue (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);



ALTER SEQUENCE account_workflow.account_analysis_activity_log_id_seq OWNED BY account_workflow.account_analysis_activity_log.id;
ALTER SEQUENCE account_workflow.account_analysis_queue_log_id_seq OWNED BY account_workflow.account_analysis_queue_log.id;
ALTER SEQUENCE account_workflow.account_analysis_queue_id_seq OWNED BY account_workflow.account_analysis_queue.id;
ALTER SEQUENCE account_workflow.fee_improvement_id_seq OWNED BY account_workflow.fee_improvement.id;
ALTER SEQUENCE account_workflow.diversification_improvement_id_seq OWNED BY account_workflow.diversification_improvement.id;
ALTER SEQUENCE account_workflow.analysis_status_id_seq OWNED BY account_workflow.analysis_status.id;
ALTER SEQUENCE account_workflow.analysis_trigger_id_seq OWNED BY account_workflow.analysis_trigger.id;
ALTER SEQUENCE account_workflow.allocation_improvement_id_seq OWNED BY account_workflow.allocation_improvement.id;
ALTER SEQUENCE account_workflow.account_analysis_queue_status_history_id_seq OWNED BY account_workflow.account_analysis_queue_status_history.id;
ALTER SEQUENCE account_workflow.allocation_type_id_seq OWNED BY account_workflow.allocation_type.id;

