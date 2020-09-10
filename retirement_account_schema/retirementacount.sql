--liquibase formatted sql
--changeset llteam:TLL-001.6
create schema retirement_account;
--
-- PostgreSQL database dump
--

-- Dumped from database version 11.6
-- Dumped by pg_dump version 11.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: accounts; Type: TABLE; Schema: retirement_account; Owner: postgres
--

CREATE TABLE retirement_account.accounts (
    ll_account_id bigint NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    ret_account_type character varying(50) NOT NULL,
    provider_website text NOT NULL,
    provider_id bigint NOT NULL,
    provider_name character varying(255) NOT NULL,
    provider_name_pretty character varying(255) NOT NULL,
    institution_image character varying(50) NOT NULL,
    includeinnetworth character varying(50) NOT NULL,
    ret_account_holder_name character varying(255) NOT NULL,
    ret_account_plan_sponsor_name character varying(255) NOT NULL,
    account_number_masked character varying(50) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    managed character varying(50) NOT NULL,
    ret_account_status character varying(50) NOT NULL,
    improvements_count integer NOT NULL,
    next_rebalance_due integer NOT NULL,
    refreshed_at timestamp without time zone NOT NULL,
    ret_account_balance_formatted character varying(50) NOT NULL,
    ret_account_balance_asofdate_formatted character varying(50) NOT NULL,
    ret_account_holding_balance character varying(50) NOT NULL,
    ret_account_holding_balance_formatted character varying(50) NOT NULL,
    last_refreshed_at_formatted character varying(50) NOT NULL,
    analyzed boolean NOT NULL,
    account_order integer NOT NULL,
    hidden boolean NOT NULL,
    managed_account boolean NOT NULL,
    currency character varying(3) NOT NULL
);


ALTER TABLE retirement_account.accounts OWNER TO postgres;

--
-- Name: analysis_summary; Type: TABLE; Schema: retirement_account; Owner: postgres
--

CREATE TABLE retirement_account.analysis_summary (
    analysis_id integer NOT NULL,
    ll_account_id bigint NOT NULL,
    provider_id bigint NOT NULL,
    text text NOT NULL,
    next_step_mesg text NOT NULL,
    analysis_run_at timestamp without time zone,
    improvements_count integer NOT NULL
);


ALTER TABLE retirement_account.analysis_summary OWNER TO postgres;

--
-- Name: analysis_summary_analysis_id_seq; Type: SEQUENCE; Schema: retirement_account; Owner: postgres
--

CREATE SEQUENCE retirement_account.analysis_summary_analysis_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE retirement_account.analysis_summary_analysis_id_seq OWNER TO postgres;

--
-- Name: analysis_summary_analysis_id_seq; Type: SEQUENCE OWNED BY; Schema: retirement_account; Owner: postgres
--

ALTER SEQUENCE retirement_account.analysis_summary_analysis_id_seq OWNED BY retirement_account.analysis_summary.analysis_id;


--
-- Name: improvement_detail_page; Type: TABLE; Schema: retirement_account; Owner: postgres
--

CREATE TABLE retirement_account.improvement_detail_page (
    improvement_detail_id integer NOT NULL,
    improvements_id bigint NOT NULL,
    header_mesg text NOT NULL,
    optimal_value integer NOT NULL,
    optimal_pct double precision NOT NULL,
    current_value integer NOT NULL,
    current_pct double precision NOT NULL,
    projected_fees_savings double precision NOT NULL,
    improvement_message character varying(150) NOT NULL,
    current_values jsonb NOT NULL,
    recommended_values jsonb NOT NULL,
    next_message text NOT NULL
);


ALTER TABLE retirement_account.improvement_detail_page OWNER TO postgres;

--
-- Name: improvement_detail_page_improvement_detail_id_seq; Type: SEQUENCE; Schema: retirement_account; Owner: postgres
--

CREATE SEQUENCE retirement_account.improvement_detail_page_improvement_detail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE retirement_account.improvement_detail_page_improvement_detail_id_seq OWNER TO postgres;

--
-- Name: improvement_detail_page_improvement_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: retirement_account; Owner: postgres
--

ALTER SEQUENCE retirement_account.improvement_detail_page_improvement_detail_id_seq OWNED BY retirement_account.improvement_detail_page.improvement_detail_id;


--
-- Name: improvements; Type: TABLE; Schema: retirement_account; Owner: postgres
--

CREATE TABLE retirement_account.improvements (
    improvements_id integer NOT NULL,
    analysis_id bigint NOT NULL,
    improvements_order integer NOT NULL,
    improvements_type character varying(50) NOT NULL,
    improvements_label character varying(255) NOT NULL,
    icon character varying(50) NOT NULL,
    text text NOT NULL
);


ALTER TABLE retirement_account.improvements OWNER TO postgres;

--
-- Name: improvements_improvements_id_seq; Type: SEQUENCE; Schema: retirement_account; Owner: postgres
--

CREATE SEQUENCE retirement_account.improvements_improvements_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE retirement_account.improvements_improvements_id_seq OWNER TO postgres;

--
-- Name: improvements_improvements_id_seq; Type: SEQUENCE OWNED BY; Schema: retirement_account; Owner: postgres
--

ALTER SEQUENCE retirement_account.improvements_improvements_id_seq OWNED BY retirement_account.improvements.improvements_id;


--
-- Name: ll_providers; Type: TABLE; Schema: retirement_account; Owner: postgres
--

CREATE TABLE retirement_account.ll_providers (
    ll_provider_id character varying(50) NOT NULL,
    ll_provider_name character varying(100),
    tenant_id character varying(100),
    yodlee_provider_id character varying(50),
    enabled boolean,
    date_created date,
    date_modified date
);


ALTER TABLE retirement_account.ll_providers OWNER TO postgres;

--
-- Name: projections_performance_comparison; Type: TABLE; Schema: retirement_account; Owner: postgres
--

CREATE TABLE retirement_account.projections_performance_comparison (
    performance_comparison_id integer NOT NULL,
    analysis_id bigint NOT NULL,
    age_axis character varying(255) NOT NULL,
    label1 text NOT NULL,
    data1 character varying(255) NOT NULL,
    label2 text NOT NULL,
    data2 character varying(255) NOT NULL,
    label3 text NOT NULL,
    data3 character varying(255) NOT NULL,
    type character varying(255) NOT NULL
);


ALTER TABLE retirement_account.projections_performance_comparison OWNER TO postgres;

--
-- Name: projections_performance_compariso_performance_comparison_id_seq; Type: SEQUENCE; Schema: retirement_account; Owner: postgres
--

CREATE SEQUENCE retirement_account.projections_performance_compariso_performance_comparison_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE retirement_account.projections_performance_compariso_performance_comparison_id_seq OWNER TO postgres;

--
-- Name: projections_performance_compariso_performance_comparison_id_seq; Type: SEQUENCE OWNED BY; Schema: retirement_account; Owner: postgres
--

ALTER SEQUENCE retirement_account.projections_performance_compariso_performance_comparison_id_seq OWNED BY retirement_account.projections_performance_comparison.performance_comparison_id;


--
-- Name: projections_summary_bar; Type: TABLE; Schema: retirement_account; Owner: postgres
--

CREATE TABLE retirement_account.projections_summary_bar (
    summary_bar_id integer NOT NULL,
    analysis_id bigint NOT NULL,
    age integer NOT NULL,
    current_balance double precision NOT NULL,
    risk_level integer NOT NULL,
    retirement_age integer NOT NULL,
    current_account_balance double precision NOT NULL,
    projected_ll_balance_value double precision NOT NULL,
    projected_ll_balance_pct_change double precision NOT NULL,
    projected_current_balance_value double precision NOT NULL,
    projected_current_balance_pct_change double precision NOT NULL
);


ALTER TABLE retirement_account.projections_summary_bar OWNER TO postgres;

--
-- Name: projections_summary_bar_summary_bar_id_seq; Type: SEQUENCE; Schema: retirement_account; Owner: postgres
--

CREATE SEQUENCE retirement_account.projections_summary_bar_summary_bar_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE retirement_account.projections_summary_bar_summary_bar_id_seq OWNER TO postgres;

--
-- Name: projections_summary_bar_summary_bar_id_seq; Type: SEQUENCE OWNED BY; Schema: retirement_account; Owner: postgres
--

ALTER SEQUENCE retirement_account.projections_summary_bar_summary_bar_id_seq OWNED BY retirement_account.projections_summary_bar.summary_bar_id;


--
-- Name: ticker_code; Type: TABLE; Schema: retirement_account; Owner: postgres
--

CREATE TABLE retirement_account.ticker_code (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE retirement_account.ticker_code OWNER TO postgres;

--
-- Name: retirement_providers; Type: TABLE; Schema: retirement_account; Owner: postgres
--

CREATE TABLE retirement_account.retirement_providers (
    provider_id character varying(50) NOT NULL,
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
    isautorefreshenabled boolean
);


ALTER TABLE retirement_account.retirement_providers OWNER TO postgres;

--
-- Name: retirement_providers_sandbox; Type: TABLE; Schema: retirement_account; Owner: postgres
--

CREATE TABLE retirement_account.yodlee_providers_sandbox (
    id character varying(50) NOT NULL,
    name character varying(100),
    loginurl character varying(50),
    baseurl character varying(50),
    favicon character varying(100),
    logo character varying(100),
    status character varying(50),
    isconsentrequired boolean,
    authtype character varying(50),
    languageisocode character varying(2),
    primarylanguageisocode character varying(2),
    lastmodified date,
    forgetpasswordurl character varying(50),
    isautorefreshenabled boolean,
    env character varying(50)
);


ALTER TABLE retirement_account.yodlee_providers_sandbox OWNER TO postgres;

--
-- Name: yodlee_supported_acctype; Type: TABLE; Schema: retirement_account; Owner: postgres
--

CREATE TABLE retirement_account.yodlee_supported_acctype (
    id integer NOT NULL,
    account_type character varying(10),
    friendlyname character varying(500),
    yodleename character varying(500)
);


ALTER TABLE retirement_account.yodlee_supported_acctype OWNER TO postgres;

--
-- Name: yodlee_supported_acctype_id_seq; Type: SEQUENCE; Schema: retirement_account; Owner: postgres
--

CREATE SEQUENCE retirement_account.yodlee_supported_acctype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE retirement_account.yodlee_supported_acctype_id_seq OWNER TO postgres;

--
-- Name: yodlee_supported_acctype_id_seq; Type: SEQUENCE OWNED BY; Schema: retirement_account; Owner: postgres
--

ALTER SEQUENCE retirement_account.yodlee_supported_acctype_id_seq OWNED BY retirement_account.yodlee_supported_acctype.id;


--
-- Name: analysis_summary analysis_id; Type: DEFAULT; Schema: retirement_account; Owner: postgres
--

ALTER TABLE ONLY retirement_account.analysis_summary ALTER COLUMN analysis_id SET DEFAULT nextval('retirement_account.analysis_summary_analysis_id_seq'::regclass);


--
-- Name: improvement_detail_page improvement_detail_id; Type: DEFAULT; Schema: retirement_account; Owner: postgres
--

ALTER TABLE ONLY retirement_account.improvement_detail_page ALTER COLUMN improvement_detail_id SET DEFAULT nextval('retirement_account.improvement_detail_page_improvement_detail_id_seq'::regclass);


--
-- Name: improvements improvements_id; Type: DEFAULT; Schema: retirement_account; Owner: postgres
--

ALTER TABLE ONLY retirement_account.improvements ALTER COLUMN improvements_id SET DEFAULT nextval('retirement_account.improvements_improvements_id_seq'::regclass);


--
-- Name: projections_performance_comparison performance_comparison_id; Type: DEFAULT; Schema: retirement_account; Owner: postgres
--

ALTER TABLE ONLY retirement_account.projections_performance_comparison ALTER COLUMN performance_comparison_id SET DEFAULT nextval('retirement_account.projections_performance_compariso_performance_comparison_id_seq'::regclass);


--
-- Name: projections_summary_bar summary_bar_id; Type: DEFAULT; Schema: retirement_account; Owner: postgres
--

ALTER TABLE ONLY retirement_account.projections_summary_bar ALTER COLUMN summary_bar_id SET DEFAULT nextval('retirement_account.projections_summary_bar_summary_bar_id_seq'::regclass);


--
-- Name: yodlee_supported_acctype id; Type: DEFAULT; Schema: retirement_account; Owner: postgres
--

ALTER TABLE ONLY retirement_account.yodlee_supported_acctype ALTER COLUMN id SET DEFAULT nextval('retirement_account.yodlee_supported_acctype_id_seq'::regclass);


--
-- Name: accounts accounts_pkey; Type: CONSTRAINT; Schema: retirement_account; Owner: postgres
--

ALTER TABLE ONLY retirement_account.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (ll_account_id, provider_id);


--
-- Name: analysis_summary analysis_summary_pkey; Type: CONSTRAINT; Schema: retirement_account; Owner: postgres
--

ALTER TABLE ONLY retirement_account.analysis_summary
    ADD CONSTRAINT analysis_summary_pkey PRIMARY KEY (analysis_id);


--
-- Name: improvement_detail_page improvement_detail_page_pkey; Type: CONSTRAINT; Schema: retirement_account; Owner: postgres
--

ALTER TABLE ONLY retirement_account.improvement_detail_page
    ADD CONSTRAINT improvement_detail_page_pkey PRIMARY KEY (improvement_detail_id);


--
-- Name: improvements improvements_pkey; Type: CONSTRAINT; Schema: retirement_account; Owner: postgres
--

ALTER TABLE ONLY retirement_account.improvements
    ADD CONSTRAINT improvements_pkey PRIMARY KEY (improvements_id);


--
-- Name: ll_providers ll_providers_pkey; Type: CONSTRAINT; Schema: retirement_account; Owner: postgres
--

ALTER TABLE ONLY retirement_account.ll_providers
    ADD CONSTRAINT ll_providers_pkey PRIMARY KEY (ll_provider_id);


--
-- Name: projections_performance_comparison projections_performance_comparison_pkey; Type: CONSTRAINT; Schema: retirement_account; Owner: postgres
--

ALTER TABLE ONLY retirement_account.projections_performance_comparison
    ADD CONSTRAINT projections_performance_comparison_pkey PRIMARY KEY (performance_comparison_id);


--
-- Name: projections_summary_bar projections_summary_bar_pkey; Type: CONSTRAINT; Schema: retirement_account; Owner: postgres
--

ALTER TABLE ONLY retirement_account.projections_summary_bar
    ADD CONSTRAINT projections_summary_bar_pkey PRIMARY KEY (summary_bar_id);


--
-- Name: ticker_code ticker_code_pkey; Type: CONSTRAINT; Schema: retirement_account; Owner: postgres
--

ALTER TABLE ONLY retirement_account.ticker_code
    ADD CONSTRAINT ticker_code_pkey PRIMARY KEY (id);


--
-- Name: retirement_providers retirement_providers_pkey; Type: CONSTRAINT; Schema: retirement_account; Owner: postgres
--

ALTER TABLE ONLY retirement_account.retirement_providers
    ADD CONSTRAINT retirement_providers_pkey PRIMARY KEY (provider_id);


--
-- Name: yodlee_providers_sandbox yodlee_providers_sandbox_pkey; Type: CONSTRAINT; Schema: retirement_account; Owner: postgres
--

ALTER TABLE ONLY retirement_account.yodlee_providers_sandbox
    ADD CONSTRAINT yodlee_providers_sandbox_pkey PRIMARY KEY (id);


--
-- Name: fki_yodlee_provider_id; Type: INDEX; Schema: retirement_account; Owner: postgres
--

CREATE INDEX fki_yodlee_provider_id ON retirement_account.ll_providers USING btree (yodlee_provider_id);


--
-- Name: analysis_summary analysis_summary_ll_account_id_fkey; Type: FK CONSTRAINT; Schema: retirement_account; Owner: postgres
--

ALTER TABLE ONLY retirement_account.analysis_summary
    ADD CONSTRAINT analysis_summary_ll_account_id_fkey FOREIGN KEY (ll_account_id, provider_id) REFERENCES retirement_account.accounts(ll_account_id, provider_id);


--
-- Name: improvement_detail_page improvement_detail_page_improvements_id_fkey; Type: FK CONSTRAINT; Schema: retirement_account; Owner: postgres
--

ALTER TABLE ONLY retirement_account.improvement_detail_page
    ADD CONSTRAINT improvement_detail_page_improvements_id_fkey FOREIGN KEY (improvements_id) REFERENCES retirement_account.improvements(improvements_id);


--
-- Name: improvements improvements_analysis_id_fkey; Type: FK CONSTRAINT; Schema: retirement_account; Owner: postgres
--

ALTER TABLE ONLY retirement_account.improvements
    ADD CONSTRAINT improvements_analysis_id_fkey FOREIGN KEY (analysis_id) REFERENCES retirement_account.analysis_summary(analysis_id);


--
-- Name: projections_performance_comparison projections_performance_comparison_analysis_id_fkey; Type: FK CONSTRAINT; Schema: retirement_account; Owner: postgres
--

ALTER TABLE ONLY retirement_account.projections_performance_comparison
    ADD CONSTRAINT projections_performance_comparison_analysis_id_fkey FOREIGN KEY (analysis_id) REFERENCES retirement_account.analysis_summary(analysis_id);


--
-- Name: projections_summary_bar projections_summary_bar_analysis_id_fkey; Type: FK CONSTRAINT; Schema: retirement_account; Owner: postgres
--

ALTER TABLE ONLY retirement_account.projections_summary_bar
    ADD CONSTRAINT projections_summary_bar_analysis_id_fkey FOREIGN KEY (analysis_id) REFERENCES retirement_account.analysis_summary(analysis_id);


--
-- Name: ll_providers yodlee_provider_id; Type: FK CONSTRAINT; Schema: retirement_account; Owner: postgres
--

ALTER TABLE ONLY retirement_account.ll_providers
    ADD CONSTRAINT yodlee_provider_id FOREIGN KEY (yodlee_provider_id) REFERENCES retirement_account.retirement_providers(provider_id) NOT VALID;


--
-- Name: SCHEMA retirement_account; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA retirement_account FROM rdsadmin;
REVOKE ALL ON SCHEMA retirement_account FROM PUBLIC;
GRANT ALL ON SCHEMA retirement_account TO postgres;
GRANT ALL ON SCHEMA retirement_account TO PUBLIC;


--
-- PostgreSQL database dump complete
--

