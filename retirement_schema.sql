--liquibase formatted sql
--changeset llteam:TLL-001.3
CREATE SCHEMA retirement;
ALTER SCHEMA retirement OWNER TO postgres;
SET default_tablespace = '';

CREATE SEQUENCE retirement.account_sequence
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE retirement.account_sequence OWNER TO postgres;

CREATE SEQUENCE retirement.hibernate_sequence
    START WITH 2
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE retirement.hibernate_sequence OWNER TO postgres;

CREATE SEQUENCE retirement.holdings_securities_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE retirement.holdings_securities_sequence OWNER TO postgres;

CREATE SEQUENCE retirement.holdings_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE retirement.holdings_sequence OWNER TO postgres;

CREATE SEQUENCE retirement.providers_user_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE retirement.providers_user_sequence OWNER TO postgres;

CREATE SEQUENCE retirement.user_accounts_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE retirement.user_accounts_sequence OWNER TO postgres;


CREATE TABLE retirement.asset_classifications (
    id bigint NOT NULL,
    classification_type character varying(255),
    classification_value character varying(255),
    allocation character varying(255)
);
ALTER TABLE retirement.asset_classifications OWNER TO postgres;

CREATE TABLE retirement.holdings_asset_classification (
    holdings_id bigint NOT NULL,
    asset_classification_id bigint NOT NULL
);
ALTER TABLE retirement.holdings_asset_classification OWNER TO postgres;

CREATE TABLE retirement.provider_events (
    id integer,
    event_type character varying(50),
    data jsonb,
    created_date timestamp without time zone,
    updated_date timestamp without time zone
);
ALTER TABLE retirement.provider_events OWNER TO postgres;

CREATE TABLE retirement.provider_retirement_profiles (
    id bigint NOT NULL,
    created_date timestamp without time zone,
    password character varying(50),
    provider_id character varying(50),
    role_type character varying(50),
    status character varying(50),
    tenant_id character varying(50),
    updated_date timestamp without time zone,
    user_id character varying(50),
    provider_login_id character varying(50),
    provider_account_id character varying(50)
);
ALTER TABLE retirement.provider_retirement_profiles OWNER TO postgres;

CREATE TABLE retirement.provider_user_accounts (
    id bigint NOT NULL,
    tenant_id character varying(50),
    account_id bigint,
    account_name character varying(50),
    account_number character varying(50),
    account_status character varying(50),
    account_type character varying(50),
    aggregation_source character varying(50),
    balance numeric(19,2),
    cash numeric(19,2),
    classification character varying(50),
    container character varying(50),
    created_date timestamp without time zone,
    currency character varying(50),
    data_set_additional_status character varying(50),
    data_set_last_update_attempt character varying(50),
    data_set_last_updated character varying(50),
    data_set_name character varying(50),
    data_set_next_update_scheduled character varying(50),
    data_set_update_eligibility character varying(50),
    display_name character varying(50),
    include_in_networth boolean,
    is_asset boolean,
    is_manuel boolean,
    last_updated timestamp without time zone,
    provider_account_id bigint,
    provider_id bigint,
    provider_name character varying(50),
    user_id character varying(50)
);
ALTER TABLE retirement.provider_user_accounts OWNER TO postgres;

CREATE TABLE retirement.user_holdings (
    id bigint NOT NULL,
    account_id bigint,
    created_date timestamp without time zone,
    cusip_number character varying(20),
    description character varying(50),
    holding_type character varying(50),
    holdings_id bigint NOT NULL,
    is_short boolean,
    isin character varying(50),
    last_updated timestamp without time zone,
    match_status character varying(50),
    option_type character varying(50),
    price numeric(19,2),
    provider_account_id bigint,
    provider_id bigint,
    quantity numeric(19,2),
    security_type character varying(50),
    sedol character varying(50),
    stock_exchange_id bigint,
    sum_info_id bigint,
    symbol character varying(50),
    user_id character varying(50),
    value numeric(10,2)
);
ALTER TABLE retirement.user_holdings OWNER TO postgres;


CREATE TABLE retirement.user_holdings_securities (
    id bigint NOT NULL,
    user_id character varying(50),
    holding_id bigint NOT NULL,
    created_date timestamp without time zone,
    updated_date timestamp without time zone,
    holdings_securities_data jsonb
);
ALTER TABLE retirement.user_holdings_securities OWNER TO postgres;


CREATE TABLE retirement.yodlee_log_table (
    id bigint NOT NULL,
    user_id character varying(255),
    request_headers jsonb,
    response_headers jsonb,
    request_body jsonb,
    response_body jsonb,
    request_url character varying(255),
    request_type character varying(50),
    response_status character varying(50),
    created_date timestamp without time zone,
    updated_date timestamp without time zone
);
ALTER TABLE retirement.yodlee_log_table OWNER TO "arun.g@motivitylabs.com";


CREATE TABLE retirement.yodlee_providers (
    id character varying(50) NOT NULL,
    name character varying(100),
    loginurl character varying(350),
    baseurl character varying(350),
    favicon character varying(100),
    logo character varying(100),
    status character varying(50),
    isconsentrequired boolean,
    authtype character varying(50),
    languageisocode character varying(2),
    primarylanguageisocode character varying(2),
    lastmodified date,
    forgetpasswordurl character varying(350),
    isautorefreshenabled boolean,
    provider_id bigint NOT NULL
);
ALTER TABLE retirement.yodlee_providers OWNER TO postgres;

ALTER TABLE ONLY retirement.user_holdings_securities
    ADD CONSTRAINT holdings_securities_pkey PRIMARY KEY (holding_id);

ALTER TABLE ONLY retirement.holdings_asset_classification
    ADD CONSTRAINT uk_29n1jrnmmgysp29co9cweyfql UNIQUE (asset_classification_id);

ALTER TABLE ONLY retirement.user_holdings
    ADD CONSTRAINT user_holdings_pkey PRIMARY KEY (holdings_id);

ALTER TABLE ONLY retirement.yodlee_log_table
    ADD CONSTRAINT yodlee_log_table_pkey PRIMARY KEY (id);

ALTER TABLE ONLY retirement.yodlee_providers
    ADD CONSTRAINT yodlee_providers_pkey PRIMARY KEY (provider_id);

ALTER TABLE ONLY retirement.holdings_asset_classification
    ADD CONSTRAINT fkqh4f4ioir93mvcx3nxxi2v1v6 FOREIGN KEY (holdings_id) REFERENCES retirement.user_holdings(holdings_id);