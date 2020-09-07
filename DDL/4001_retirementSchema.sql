--
-- PostgreSQL database dump
--

-- Dumped from database version 11.8
-- Dumped by pg_dump version 12.3

-- Started on 2020-09-05 13:41:33

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 12 (class 2615 OID 21574)
-- Name: retirement; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA retirement;


ALTER SCHEMA retirement OWNER TO postgres;

--
-- TOC entry 293 (class 1259 OID 21575)
-- Name: account_sequence; Type: SEQUENCE; Schema: retirement; Owner: postgres
--

CREATE SEQUENCE retirement.account_sequence
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE retirement.account_sequence OWNER TO postgres;

SET default_tablespace = '';

--
-- TOC entry 299 (class 1259 OID 21587)
-- Name: asset_classifications; Type: TABLE; Schema: retirement; Owner: postgres
--

CREATE TABLE retirement.asset_classifications (
    id bigint NOT NULL,
    classification_type character varying(255),
    classification_value character varying(255),
    allocation character varying(255)
);


ALTER TABLE retirement.asset_classifications OWNER TO postgres;

--
-- TOC entry 294 (class 1259 OID 21577)
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: retirement; Owner: postgres
--

CREATE SEQUENCE retirement.hibernate_sequence
    START WITH 2
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE retirement.hibernate_sequence OWNER TO postgres;

--
-- TOC entry 300 (class 1259 OID 21593)
-- Name: holdings_asset_classification; Type: TABLE; Schema: retirement; Owner: postgres
--

CREATE TABLE retirement.holdings_asset_classification (
    holdings_id bigint NOT NULL,
    asset_classification_id bigint NOT NULL
);


ALTER TABLE retirement.holdings_asset_classification OWNER TO postgres;

--
-- TOC entry 295 (class 1259 OID 21579)
-- Name: holdings_securities_sequence; Type: SEQUENCE; Schema: retirement; Owner: postgres
--

CREATE SEQUENCE retirement.holdings_securities_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE retirement.holdings_securities_sequence OWNER TO postgres;

--
-- TOC entry 296 (class 1259 OID 21581)
-- Name: holdings_sequence; Type: SEQUENCE; Schema: retirement; Owner: postgres
--

CREATE SEQUENCE retirement.holdings_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE retirement.holdings_sequence OWNER TO postgres;

--
-- TOC entry 301 (class 1259 OID 21596)
-- Name: provider_events; Type: TABLE; Schema: retirement; Owner: postgres
--

CREATE TABLE retirement.provider_events (
    id integer,
    event_type character varying(50),
    data jsonb,
    created_date timestamp without time zone,
    updated_date timestamp without time zone
);


ALTER TABLE retirement.provider_events OWNER TO postgres;

--
-- TOC entry 302 (class 1259 OID 21602)
-- Name: provider_retirement_profiles; Type: TABLE; Schema: retirement; Owner: postgres
--

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

--
-- TOC entry 303 (class 1259 OID 21605)
-- Name: provider_user_accounts; Type: TABLE; Schema: retirement; Owner: postgres
--

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

--
-- TOC entry 297 (class 1259 OID 21583)
-- Name: providers_user_sequence; Type: SEQUENCE; Schema: retirement; Owner: postgres
--

CREATE SEQUENCE retirement.providers_user_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE retirement.providers_user_sequence OWNER TO postgres;

--
-- TOC entry 298 (class 1259 OID 21585)
-- Name: user_accounts_sequence; Type: SEQUENCE; Schema: retirement; Owner: postgres
--

CREATE SEQUENCE retirement.user_accounts_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE retirement.user_accounts_sequence OWNER TO postgres;

--
-- TOC entry 304 (class 1259 OID 21611)
-- Name: user_holdings; Type: TABLE; Schema: retirement; Owner: postgres
--

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

--
-- TOC entry 305 (class 1259 OID 21617)
-- Name: user_holdings_securities; Type: TABLE; Schema: retirement; Owner: postgres
--

CREATE TABLE retirement.user_holdings_securities (
    id bigint NOT NULL,
    user_id character varying(50),
    holding_id bigint NOT NULL,
    created_date timestamp without time zone,
    updated_date timestamp without time zone,
    holdings_securities_data jsonb
);


ALTER TABLE retirement.user_holdings_securities OWNER TO postgres;

--
-- TOC entry 306 (class 1259 OID 21623)
-- Name: yodlee_log_table; Type: TABLE; Schema: retirement; Owner: postgres
--

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


ALTER TABLE retirement.yodlee_log_table OWNER TO "postgres";

--
-- TOC entry 307 (class 1259 OID 21629)
-- Name: yodlee_providers; Type: TABLE; Schema: retirement; Owner: postgres
--

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

--
-- TOC entry 4028 (class 2606 OID 21636)
-- Name: user_holdings_securities holdings_securities_pkey; Type: CONSTRAINT; Schema: retirement; Owner: postgres
--

ALTER TABLE ONLY retirement.user_holdings_securities
    ADD CONSTRAINT holdings_securities_pkey PRIMARY KEY (holding_id);


--
-- TOC entry 4024 (class 2606 OID 21638)
-- Name: holdings_asset_classification uk_29n1jrnmmgysp29co9cweyfql; Type: CONSTRAINT; Schema: retirement; Owner: postgres
--

ALTER TABLE ONLY retirement.holdings_asset_classification
    ADD CONSTRAINT uk_29n1jrnmmgysp29co9cweyfql UNIQUE (asset_classification_id);


--
-- TOC entry 4026 (class 2606 OID 21640)
-- Name: user_holdings user_holdings_pkey; Type: CONSTRAINT; Schema: retirement; Owner: postgres
--

ALTER TABLE ONLY retirement.user_holdings
    ADD CONSTRAINT user_holdings_pkey PRIMARY KEY (holdings_id);


--
-- TOC entry 4030 (class 2606 OID 21642)
-- Name: yodlee_log_table yodlee_log_table_pkey; Type: CONSTRAINT; Schema: retirement; Owner: postgres
--

ALTER TABLE ONLY retirement.yodlee_log_table
    ADD CONSTRAINT yodlee_log_table_pkey PRIMARY KEY (id);


--
-- TOC entry 4032 (class 2606 OID 21644)
-- Name: yodlee_providers yodlee_providers_pkey; Type: CONSTRAINT; Schema: retirement; Owner: postgres
--

ALTER TABLE ONLY retirement.yodlee_providers
    ADD CONSTRAINT yodlee_providers_pkey PRIMARY KEY (provider_id);


--
-- TOC entry 4033 (class 2606 OID 21645)
-- Name: holdings_asset_classification fkqh4f4ioir93mvcx3nxxi2v1v6; Type: FK CONSTRAINT; Schema: retirement; Owner: postgres
--

ALTER TABLE ONLY retirement.holdings_asset_classification
    ADD CONSTRAINT fkqh4f4ioir93mvcx3nxxi2v1v6 FOREIGN KEY (holdings_id) REFERENCES retirement.user_holdings(holdings_id);


-- Completed on 2020-09-05 13:42:06

--
-- PostgreSQL database dump complete
--

