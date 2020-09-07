--
-- PostgreSQL database dump
--

-- Dumped from database version 11.8
-- Dumped by pg_dump version 12.3

-- Started on 2020-09-05 13:42:33

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
-- TOC entry 14 (class 2615 OID 20244)
-- Name: retirement_account; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA retirement_account;


ALTER SCHEMA retirement_account OWNER TO postgres;

SET default_tablespace = '';

--
-- TOC entry 248 (class 1259 OID 20245)
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
-- TOC entry 249 (class 1259 OID 20251)
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
-- TOC entry 250 (class 1259 OID 20257)
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
-- TOC entry 4184 (class 0 OID 0)
-- Dependencies: 250
-- Name: analysis_summary_analysis_id_seq; Type: SEQUENCE OWNED BY; Schema: retirement_account; Owner: postgres
--

ALTER SEQUENCE retirement_account.analysis_summary_analysis_id_seq OWNED BY retirement_account.analysis_summary.analysis_id;


--
-- TOC entry 251 (class 1259 OID 20259)
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
-- TOC entry 252 (class 1259 OID 20265)
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
-- TOC entry 4185 (class 0 OID 0)
-- Dependencies: 252
-- Name: improvement_detail_page_improvement_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: retirement_account; Owner: postgres
--

ALTER SEQUENCE retirement_account.improvement_detail_page_improvement_detail_id_seq OWNED BY retirement_account.improvement_detail_page.improvement_detail_id;


--
-- TOC entry 253 (class 1259 OID 20267)
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
-- TOC entry 254 (class 1259 OID 20273)
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
-- TOC entry 4186 (class 0 OID 0)
-- Dependencies: 254
-- Name: improvements_improvements_id_seq; Type: SEQUENCE OWNED BY; Schema: retirement_account; Owner: postgres
--

ALTER SEQUENCE retirement_account.improvements_improvements_id_seq OWNED BY retirement_account.improvements.improvements_id;


--
-- TOC entry 255 (class 1259 OID 20275)
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
-- TOC entry 256 (class 1259 OID 20278)
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
-- TOC entry 257 (class 1259 OID 20284)
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
-- TOC entry 4187 (class 0 OID 0)
-- Dependencies: 257
-- Name: projections_performance_compariso_performance_comparison_id_seq; Type: SEQUENCE OWNED BY; Schema: retirement_account; Owner: postgres
--

ALTER SEQUENCE retirement_account.projections_performance_compariso_performance_comparison_id_seq OWNED BY retirement_account.projections_performance_comparison.performance_comparison_id;


--
-- TOC entry 258 (class 1259 OID 20286)
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
-- TOC entry 259 (class 1259 OID 20289)
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
-- TOC entry 4188 (class 0 OID 0)
-- Dependencies: 259
-- Name: projections_summary_bar_summary_bar_id_seq; Type: SEQUENCE OWNED BY; Schema: retirement_account; Owner: postgres
--

ALTER SEQUENCE retirement_account.projections_summary_bar_summary_bar_id_seq OWNED BY retirement_account.projections_summary_bar.summary_bar_id;


--
-- TOC entry 261 (class 1259 OID 20294)
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
-- TOC entry 260 (class 1259 OID 20291)
-- Name: ticker_code; Type: TABLE; Schema: retirement_account; Owner: postgres
--

CREATE TABLE retirement_account.ticker_code (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE retirement_account.ticker_code OWNER TO postgres;

--
-- TOC entry 262 (class 1259 OID 20300)
-- Name: yodlee_providers_sandbox; Type: TABLE; Schema: retirement_account; Owner: postgres
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
-- TOC entry 263 (class 1259 OID 20306)
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
-- TOC entry 264 (class 1259 OID 20312)
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
-- TOC entry 4189 (class 0 OID 0)
-- Dependencies: 264
-- Name: yodlee_supported_acctype_id_seq; Type: SEQUENCE OWNED BY; Schema: retirement_account; Owner: postgres
--

ALTER SEQUENCE retirement_account.yodlee_supported_acctype_id_seq OWNED BY retirement_account.yodlee_supported_acctype.id;


--
-- TOC entry 4025 (class 2604 OID 20314)
-- Name: analysis_summary analysis_id; Type: DEFAULT; Schema: retirement_account; Owner: postgres
--

ALTER TABLE ONLY retirement_account.analysis_summary ALTER COLUMN analysis_id SET DEFAULT nextval('retirement_account.analysis_summary_analysis_id_seq'::regclass);


--
-- TOC entry 4026 (class 2604 OID 20315)
-- Name: improvement_detail_page improvement_detail_id; Type: DEFAULT; Schema: retirement_account; Owner: postgres
--

ALTER TABLE ONLY retirement_account.improvement_detail_page ALTER COLUMN improvement_detail_id SET DEFAULT nextval('retirement_account.improvement_detail_page_improvement_detail_id_seq'::regclass);


--
-- TOC entry 4027 (class 2604 OID 20316)
-- Name: improvements improvements_id; Type: DEFAULT; Schema: retirement_account; Owner: postgres
--

ALTER TABLE ONLY retirement_account.improvements ALTER COLUMN improvements_id SET DEFAULT nextval('retirement_account.improvements_improvements_id_seq'::regclass);


--
-- TOC entry 4028 (class 2604 OID 20317)
-- Name: projections_performance_comparison performance_comparison_id; Type: DEFAULT; Schema: retirement_account; Owner: postgres
--

ALTER TABLE ONLY retirement_account.projections_performance_comparison ALTER COLUMN performance_comparison_id SET DEFAULT nextval('retirement_account.projections_performance_compariso_performance_comparison_id_seq'::regclass);


--
-- TOC entry 4029 (class 2604 OID 20318)
-- Name: projections_summary_bar summary_bar_id; Type: DEFAULT; Schema: retirement_account; Owner: postgres
--

ALTER TABLE ONLY retirement_account.projections_summary_bar ALTER COLUMN summary_bar_id SET DEFAULT nextval('retirement_account.projections_summary_bar_summary_bar_id_seq'::regclass);


--
-- TOC entry 4030 (class 2604 OID 20319)
-- Name: yodlee_supported_acctype id; Type: DEFAULT; Schema: retirement_account; Owner: postgres
--

ALTER TABLE ONLY retirement_account.yodlee_supported_acctype ALTER COLUMN id SET DEFAULT nextval('retirement_account.yodlee_supported_acctype_id_seq'::regclass);


--
-- TOC entry 4032 (class 2606 OID 20321)
-- Name: accounts accounts_pkey; Type: CONSTRAINT; Schema: retirement_account; Owner: postgres
--

ALTER TABLE ONLY retirement_account.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (ll_account_id, provider_id);


--
-- TOC entry 4034 (class 2606 OID 20323)
-- Name: analysis_summary analysis_summary_pkey; Type: CONSTRAINT; Schema: retirement_account; Owner: postgres
--

ALTER TABLE ONLY retirement_account.analysis_summary
    ADD CONSTRAINT analysis_summary_pkey PRIMARY KEY (analysis_id);


--
-- TOC entry 4036 (class 2606 OID 20325)
-- Name: improvement_detail_page improvement_detail_page_pkey; Type: CONSTRAINT; Schema: retirement_account; Owner: postgres
--

ALTER TABLE ONLY retirement_account.improvement_detail_page
    ADD CONSTRAINT improvement_detail_page_pkey PRIMARY KEY (improvement_detail_id);


--
-- TOC entry 4038 (class 2606 OID 20327)
-- Name: improvements improvements_pkey; Type: CONSTRAINT; Schema: retirement_account; Owner: postgres
--

ALTER TABLE ONLY retirement_account.improvements
    ADD CONSTRAINT improvements_pkey PRIMARY KEY (improvements_id);


--
-- TOC entry 4041 (class 2606 OID 20329)
-- Name: ll_providers ll_providers_pkey; Type: CONSTRAINT; Schema: retirement_account; Owner: postgres
--

ALTER TABLE ONLY retirement_account.ll_providers
    ADD CONSTRAINT ll_providers_pkey PRIMARY KEY (ll_provider_id);


--
-- TOC entry 4043 (class 2606 OID 20331)
-- Name: projections_performance_comparison projections_performance_comparison_pkey; Type: CONSTRAINT; Schema: retirement_account; Owner: postgres
--

ALTER TABLE ONLY retirement_account.projections_performance_comparison
    ADD CONSTRAINT projections_performance_comparison_pkey PRIMARY KEY (performance_comparison_id);


--
-- TOC entry 4045 (class 2606 OID 20333)
-- Name: projections_summary_bar projections_summary_bar_pkey; Type: CONSTRAINT; Schema: retirement_account; Owner: postgres
--

ALTER TABLE ONLY retirement_account.projections_summary_bar
    ADD CONSTRAINT projections_summary_bar_pkey PRIMARY KEY (summary_bar_id);


--
-- TOC entry 4049 (class 2606 OID 20337)
-- Name: retirement_providers retirement_providers_pkey; Type: CONSTRAINT; Schema: retirement_account; Owner: postgres
--

ALTER TABLE ONLY retirement_account.retirement_providers
    ADD CONSTRAINT retirement_providers_pkey PRIMARY KEY (provider_id);


--
-- TOC entry 4047 (class 2606 OID 20335)
-- Name: ticker_code ticker_code_pkey; Type: CONSTRAINT; Schema: retirement_account; Owner: postgres
--

ALTER TABLE ONLY retirement_account.ticker_code
    ADD CONSTRAINT ticker_code_pkey PRIMARY KEY (id);


--
-- TOC entry 4051 (class 2606 OID 20339)
-- Name: yodlee_providers_sandbox yodlee_providers_sandbox_pkey; Type: CONSTRAINT; Schema: retirement_account; Owner: postgres
--

ALTER TABLE ONLY retirement_account.yodlee_providers_sandbox
    ADD CONSTRAINT yodlee_providers_sandbox_pkey PRIMARY KEY (id);


--
-- TOC entry 4039 (class 1259 OID 20340)
-- Name: fki_yodlee_provider_id; Type: INDEX; Schema: retirement_account; Owner: postgres
--

CREATE INDEX fki_yodlee_provider_id ON retirement_account.ll_providers USING btree (yodlee_provider_id);


--
-- TOC entry 4052 (class 2606 OID 20341)
-- Name: analysis_summary analysis_summary_ll_account_id_fkey; Type: FK CONSTRAINT; Schema: retirement_account; Owner: postgres
--

ALTER TABLE ONLY retirement_account.analysis_summary
    ADD CONSTRAINT analysis_summary_ll_account_id_fkey FOREIGN KEY (ll_account_id, provider_id) REFERENCES retirement_account.accounts(ll_account_id, provider_id);


--
-- TOC entry 4053 (class 2606 OID 20346)
-- Name: improvement_detail_page improvement_detail_page_improvements_id_fkey; Type: FK CONSTRAINT; Schema: retirement_account; Owner: postgres
--

ALTER TABLE ONLY retirement_account.improvement_detail_page
    ADD CONSTRAINT improvement_detail_page_improvements_id_fkey FOREIGN KEY (improvements_id) REFERENCES retirement_account.improvements(improvements_id);


--
-- TOC entry 4054 (class 2606 OID 20351)
-- Name: improvements improvements_analysis_id_fkey; Type: FK CONSTRAINT; Schema: retirement_account; Owner: postgres
--

ALTER TABLE ONLY retirement_account.improvements
    ADD CONSTRAINT improvements_analysis_id_fkey FOREIGN KEY (analysis_id) REFERENCES retirement_account.analysis_summary(analysis_id);


--
-- TOC entry 4056 (class 2606 OID 20356)
-- Name: projections_performance_comparison projections_performance_comparison_analysis_id_fkey; Type: FK CONSTRAINT; Schema: retirement_account; Owner: postgres
--

ALTER TABLE ONLY retirement_account.projections_performance_comparison
    ADD CONSTRAINT projections_performance_comparison_analysis_id_fkey FOREIGN KEY (analysis_id) REFERENCES retirement_account.analysis_summary(analysis_id);


--
-- TOC entry 4057 (class 2606 OID 20361)
-- Name: projections_summary_bar projections_summary_bar_analysis_id_fkey; Type: FK CONSTRAINT; Schema: retirement_account; Owner: postgres
--

ALTER TABLE ONLY retirement_account.projections_summary_bar
    ADD CONSTRAINT projections_summary_bar_analysis_id_fkey FOREIGN KEY (analysis_id) REFERENCES retirement_account.analysis_summary(analysis_id);


--
-- TOC entry 4055 (class 2606 OID 20366)
-- Name: ll_providers yodlee_provider_id; Type: FK CONSTRAINT; Schema: retirement_account; Owner: postgres
--

ALTER TABLE ONLY retirement_account.ll_providers
    ADD CONSTRAINT yodlee_provider_id FOREIGN KEY (yodlee_provider_id) REFERENCES retirement_account.retirement_providers(provider_id) NOT VALID;


-- Completed on 2020-09-05 13:43:14

--
-- PostgreSQL database dump complete
--

