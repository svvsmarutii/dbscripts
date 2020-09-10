--liquibase formatted sql
--changeset llteam:TLL-002
CREATE TABLE reference_data.plan_pro_parser
(
    last_parse_timestamp character varying(30) COLLATE pg_catalog."default"
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE reference_data.plan_pro_parser
    OWNER to postgres;
	
CREATE TABLE reference_data.plan_custodians
(
    id bigint NOT NULL,
    plan_id character varying COLLATE pg_catalog."default" NOT NULL,
    provider character varying COLLATE pg_catalog."default",
    asofdate timestamp without time zone NOT NULL,
    CONSTRAINT plan_custodians_pkey PRIMARY KEY (id, asofdate, plan_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE reference_data.plan_custodians
    OWNER to postgres;

CREATE TABLE reference_data.plan_custodians_raw
(
    as_of_date character varying(20) COLLATE pg_catalog."default",
    loadstatus character varying(10) COLLATE pg_catalog."default",
    runid bigint NOT NULL,
    id bigint NOT NULL,
    plan_id character varying COLLATE pg_catalog."default" NOT NULL,
    provider character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT plan_custodians_raw_pkey PRIMARY KEY (runid, id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE reference_data.plan_custodians_raw
    OWNER to postgres;

CREATE TABLE reference_data.plan_investment_options
(
    id bigint NOT NULL,
    plan_id character varying COLLATE pg_catalog."default" NOT NULL,
    ticker character varying COLLATE pg_catalog."default",
    type character varying COLLATE pg_catalog."default",
    fund character varying COLLATE pg_catalog."default",
    amount double precision,
    category character varying COLLATE pg_catalog."default",
    issuer character varying COLLATE pg_catalog."default",
    asset_class character varying COLLATE pg_catalog."default",
    region character varying COLLATE pg_catalog."default",
    style character varying COLLATE pg_catalog."default",
    size character varying COLLATE pg_catalog."default",
    proxy_ticker character varying COLLATE pg_catalog."default",
    deleted_at timestamp without time zone,
    share_class_match character varying(255) COLLATE pg_catalog."default",
    asofdate timestamp without time zone NOT NULL,
    version integer,
    CONSTRAINT plan_investment_options_pkey PRIMARY KEY (id, asofdate, plan_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE reference_data.plan_investment_options
    OWNER to postgres;

CREATE TABLE reference_data.plan_investment_options_raw
(
    as_of_date character varying(20) COLLATE pg_catalog."default",
    loadstatus character varying(10) COLLATE pg_catalog."default",
    runid bigint NOT NULL,
    id bigint NOT NULL,
    plan_id character varying COLLATE pg_catalog."default" NOT NULL,
    ticker character varying COLLATE pg_catalog."default",
    type character varying COLLATE pg_catalog."default",
    fund character varying COLLATE pg_catalog."default",
    shareclass_match integer,
    amount double precision,
    category character varying COLLATE pg_catalog."default",
    issuer character varying COLLATE pg_catalog."default",
    asset_class character varying COLLATE pg_catalog."default",
    region character varying COLLATE pg_catalog."default",
    style character varying COLLATE pg_catalog."default",
    size character varying COLLATE pg_catalog."default",
    proxy_ticker character varying COLLATE pg_catalog."default",
    deleted_at character varying COLLATE pg_catalog."default",
    CONSTRAINT plan_investment_options_raw_pkey PRIMARY KEY (runid, id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE reference_data.plan_investment_options_raw
    OWNER to postgres;


CREATE TABLE reference_data.plan_pro
(
    id bigint NOT NULL,
    plan_id character varying COLLATE pg_catalog."default" NOT NULL,
    plan character varying COLLATE pg_catalog."default",
    company_name character varying COLLATE pg_catalog."default",
    ein double precision,
    plan_type character varying COLLATE pg_catalog."default",
    address character varying COLLATE pg_catalog."default",
    city character varying COLLATE pg_catalog."default",
    state character varying COLLATE pg_catalog."default",
    zip character varying COLLATE pg_catalog."default",
    year integer,
    total_participants integer,
    total_assets double precision,
    as_of timestamp without time zone,
    deleted_at timestamp without time zone,
    asofdate timestamp without time zone NOT NULL,
    CONSTRAINT plan_pro_pkey PRIMARY KEY (id, asofdate, plan_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE reference_data.plan_pro
    OWNER to postgres;
	
CREATE TABLE reference_data.plan_pro_raw
(
    as_of_date character varying(20) COLLATE pg_catalog."default",
    loadstatus character varying(10) COLLATE pg_catalog."default",
    runid bigint NOT NULL,
    id bigint NOT NULL,
    plan_id character varying COLLATE pg_catalog."default" NOT NULL,
    plan character varying COLLATE pg_catalog."default",
    company_name character varying COLLATE pg_catalog."default",
    ein double precision,
    plan_type character varying COLLATE pg_catalog."default",
    address character varying COLLATE pg_catalog."default",
    city character varying COLLATE pg_catalog."default",
    state character varying COLLATE pg_catalog."default",
    zip character varying COLLATE pg_catalog."default",
    year integer,
    total_participants integer,
    total_assets double precision,
    as_of character varying COLLATE pg_catalog."default",
    deleted_at character varying COLLATE pg_catalog."default",
    CONSTRAINT plan_pro_raw_pkey PRIMARY KEY (runid, id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE reference_data.plan_pro_raw
    OWNER to postgres;
	
	
CREATE INDEX plan_pro_index1
ON reference_data.plan_pro (plan_id, ein);

CREATE INDEX plan_pro_raw_index1
ON reference_data.plan_pro_raw (loadstatus);

CREATE INDEX plan_investment_options_raw_index1
ON reference_data.plan_investment_options_raw (loadstatus);

CREATE INDEX plan_investment_options_index3
ON reference_data.plan_investment_options (version);

CREATE INDEX plan_investment_options_index2
ON reference_data.plan_investment_options (plan_id, version);

CREATE INDEX plan_investment_options_index1
ON reference_data.plan_investment_options (plan_id);

CREATE INDEX plan_custodians_raw_index1
ON reference_data.plan_custodians_raw (loadstatus);

CREATE INDEX plan_custodians_index1
ON reference_data.plan_custodians (plan_id);