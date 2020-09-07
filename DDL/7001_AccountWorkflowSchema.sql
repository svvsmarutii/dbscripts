--
-- PostgreSQL database dump
--

-- Dumped from database version 11.8
-- Dumped by pg_dump version 12.3

-- Started on 2020-09-05 13:39:12

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
-- TOC entry 8 (class 2615 OID 19899)
-- Name: account_workflow; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA account_workflow;


ALTER SCHEMA account_workflow OWNER TO postgres;

SET default_tablespace = '';

--
-- TOC entry 218 (class 1259 OID 19959)
-- Name: account_analysis_activity_log; Type: TABLE; Schema: account_workflow; Owner: postgres
--

CREATE TABLE account_workflow.account_analysis_activity_log (
    id integer NOT NULL,
    account_analysis_queue_id bigint NOT NULL,
    account_id bigint NOT NULL,
    provider_id bigint NOT NULL,
    activity_name character varying(50) NOT NULL,
    status character varying(50) NOT NULL,
    status_description character varying(100) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    start_at timestamp without time zone NOT NULL,
    end_at timestamp without time zone NOT NULL
);


ALTER TABLE account_workflow.account_analysis_activity_log OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 19900)
-- Name: account_analysis_activity_log_id_seq; Type: SEQUENCE; Schema: account_workflow; Owner: postgres
--

CREATE SEQUENCE account_workflow.account_analysis_activity_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE account_workflow.account_analysis_activity_log_id_seq OWNER TO postgres;

--
-- TOC entry 4196 (class 0 OID 0)
-- Dependencies: 203
-- Name: account_analysis_activity_log_id_seq; Type: SEQUENCE OWNED BY; Schema: account_workflow; Owner: postgres
--

ALTER SEQUENCE account_workflow.account_analysis_activity_log_id_seq OWNED BY account_workflow.account_analysis_activity_log.id;


--
-- TOC entry 217 (class 1259 OID 19943)
-- Name: account_analysis_queue; Type: TABLE; Schema: account_workflow; Owner: postgres
--

CREATE TABLE account_workflow.account_analysis_queue (
    id integer NOT NULL,
    account_id bigint NOT NULL,
    provider_id bigint NOT NULL,
    analysis_status_id bigint NOT NULL,
    trigger_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    last_updated timestamp without time zone NOT NULL
);


ALTER TABLE account_workflow.account_analysis_queue OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 19902)
-- Name: account_analysis_queue_id_seq; Type: SEQUENCE; Schema: account_workflow; Owner: postgres
--

CREATE SEQUENCE account_workflow.account_analysis_queue_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE account_workflow.account_analysis_queue_id_seq OWNER TO postgres;

--
-- TOC entry 4197 (class 0 OID 0)
-- Dependencies: 204
-- Name: account_analysis_queue_id_seq; Type: SEQUENCE OWNED BY; Schema: account_workflow; Owner: postgres
--

ALTER SEQUENCE account_workflow.account_analysis_queue_id_seq OWNED BY account_workflow.account_analysis_queue.id;


--
-- TOC entry 219 (class 1259 OID 19970)
-- Name: account_analysis_queue_log; Type: TABLE; Schema: account_workflow; Owner: postgres
--

CREATE TABLE account_workflow.account_analysis_queue_log (
    id integer NOT NULL,
    account_id bigint NOT NULL,
    provider_id bigint NOT NULL,
    analysis_status_id bigint NOT NULL,
    trigger_id bigint NOT NULL,
    analysis_version bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    last_updated timestamp without time zone NOT NULL
);


ALTER TABLE account_workflow.account_analysis_queue_log OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 19904)
-- Name: account_analysis_queue_log_id_seq; Type: SEQUENCE; Schema: account_workflow; Owner: postgres
--

CREATE SEQUENCE account_workflow.account_analysis_queue_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE account_workflow.account_analysis_queue_log_id_seq OWNER TO postgres;

--
-- TOC entry 4198 (class 0 OID 0)
-- Dependencies: 205
-- Name: account_analysis_queue_log_id_seq; Type: SEQUENCE OWNED BY; Schema: account_workflow; Owner: postgres
--

ALTER SEQUENCE account_workflow.account_analysis_queue_log_id_seq OWNED BY account_workflow.account_analysis_queue_log.id;


--
-- TOC entry 220 (class 1259 OID 19986)
-- Name: account_analysis_queue_status_history; Type: TABLE; Schema: account_workflow; Owner: postgres
--

CREATE TABLE account_workflow.account_analysis_queue_status_history (
    id integer NOT NULL,
    account_analysis_queue_id bigint NOT NULL,
    account_id bigint NOT NULL,
    provider_id bigint NOT NULL,
    analysis_status_id bigint NOT NULL,
    trigger_id bigint NOT NULL,
    analysis_version bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    last_updated timestamp without time zone NOT NULL,
    added_at timestamp without time zone NOT NULL
);


ALTER TABLE account_workflow.account_analysis_queue_status_history OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 19906)
-- Name: account_analysis_queue_status_history_id_seq; Type: SEQUENCE; Schema: account_workflow; Owner: postgres
--

CREATE SEQUENCE account_workflow.account_analysis_queue_status_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE account_workflow.account_analysis_queue_status_history_id_seq OWNER TO postgres;

--
-- TOC entry 4199 (class 0 OID 0)
-- Dependencies: 206
-- Name: account_analysis_queue_status_history_id_seq; Type: SEQUENCE OWNED BY; Schema: account_workflow; Owner: postgres
--

ALTER SEQUENCE account_workflow.account_analysis_queue_status_history_id_seq OWNED BY account_workflow.account_analysis_queue_status_history.id;


--
-- TOC entry 221 (class 1259 OID 20002)
-- Name: account_analysis_summary; Type: TABLE; Schema: account_workflow; Owner: postgres
--

CREATE TABLE account_workflow.account_analysis_summary (
    account_analysis_queue_id bigint NOT NULL,
    account_id bigint NOT NULL,
    provider_id bigint NOT NULL,
    allocation_json character varying NOT NULL,
    feejson character varying NOT NULL,
    diversificationjson character varying NOT NULL,
    retirement_account_json character varying NOT NULL,
    analysis_summary character varying NOT NULL,
    projection_summary character varying NOT NULL,
    analysis_version bigint NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE account_workflow.account_analysis_summary OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 20027)
-- Name: allocation_improvement; Type: TABLE; Schema: account_workflow; Owner: postgres
--

CREATE TABLE account_workflow.allocation_improvement (
    id integer NOT NULL,
    account_analysis_queue_id bigint NOT NULL,
    account_id bigint NOT NULL,
    provider_id bigint NOT NULL,
    allocation_type_id integer NOT NULL,
    currentpercent integer NOT NULL,
    recommendedpercent integer NOT NULL,
    datecreated timestamp without time zone NOT NULL
);


ALTER TABLE account_workflow.allocation_improvement OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 19908)
-- Name: allocation_improvement_id_seq; Type: SEQUENCE; Schema: account_workflow; Owner: postgres
--

CREATE SEQUENCE account_workflow.allocation_improvement_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE account_workflow.allocation_improvement_id_seq OWNER TO postgres;

--
-- TOC entry 4200 (class 0 OID 0)
-- Dependencies: 207
-- Name: allocation_improvement_id_seq; Type: SEQUENCE OWNED BY; Schema: account_workflow; Owner: postgres
--

ALTER SEQUENCE account_workflow.allocation_improvement_id_seq OWNED BY account_workflow.allocation_improvement.id;


--
-- TOC entry 214 (class 1259 OID 19926)
-- Name: allocation_type; Type: TABLE; Schema: account_workflow; Owner: postgres
--

CREATE TABLE account_workflow.allocation_type (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE account_workflow.allocation_type OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 19910)
-- Name: allocation_type_id_seq; Type: SEQUENCE; Schema: account_workflow; Owner: postgres
--

CREATE SEQUENCE account_workflow.allocation_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE account_workflow.allocation_type_id_seq OWNER TO postgres;

--
-- TOC entry 4201 (class 0 OID 0)
-- Dependencies: 208
-- Name: allocation_type_id_seq; Type: SEQUENCE OWNED BY; Schema: account_workflow; Owner: postgres
--

ALTER SEQUENCE account_workflow.allocation_type_id_seq OWNED BY account_workflow.allocation_type.id;


--
-- TOC entry 213 (class 1259 OID 19920)
-- Name: analysis_status; Type: TABLE; Schema: account_workflow; Owner: postgres
--

CREATE TABLE account_workflow.analysis_status (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    isactive boolean NOT NULL,
    created_at timestamp without time zone NOT NULL,
    description character varying(100) NOT NULL
);


ALTER TABLE account_workflow.analysis_status OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 19912)
-- Name: analysis_status_id_seq; Type: SEQUENCE; Schema: account_workflow; Owner: postgres
--

CREATE SEQUENCE account_workflow.analysis_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE account_workflow.analysis_status_id_seq OWNER TO postgres;

--
-- TOC entry 4202 (class 0 OID 0)
-- Dependencies: 209
-- Name: analysis_status_id_seq; Type: SEQUENCE OWNED BY; Schema: account_workflow; Owner: postgres
--

ALTER SEQUENCE account_workflow.analysis_status_id_seq OWNED BY account_workflow.analysis_status.id;


--
-- TOC entry 215 (class 1259 OID 19932)
-- Name: analysis_trigger; Type: TABLE; Schema: account_workflow; Owner: postgres
--

CREATE TABLE account_workflow.analysis_trigger (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    isactive boolean NOT NULL,
    created_at timestamp without time zone NOT NULL,
    description character varying(100) NOT NULL
);


ALTER TABLE account_workflow.analysis_trigger OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 19914)
-- Name: analysis_trigger_id_seq; Type: SEQUENCE; Schema: account_workflow; Owner: postgres
--

CREATE SEQUENCE account_workflow.analysis_trigger_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE account_workflow.analysis_trigger_id_seq OWNER TO postgres;

--
-- TOC entry 4203 (class 0 OID 0)
-- Dependencies: 210
-- Name: analysis_trigger_id_seq; Type: SEQUENCE OWNED BY; Schema: account_workflow; Owner: postgres
--

ALTER SEQUENCE account_workflow.analysis_trigger_id_seq OWNED BY account_workflow.analysis_trigger.id;


--
-- TOC entry 224 (class 1259 OID 20043)
-- Name: diversification_improvement; Type: TABLE; Schema: account_workflow; Owner: postgres
--

CREATE TABLE account_workflow.diversification_improvement (
    id integer NOT NULL,
    account_analysis_queue_id bigint NOT NULL,
    account_id bigint NOT NULL,
    provider_id bigint NOT NULL,
    tickercode character varying(20) NOT NULL,
    currentvalue numeric NOT NULL,
    recommendedvalue numeric NOT NULL,
    datecreated timestamp without time zone NOT NULL
);


ALTER TABLE account_workflow.diversification_improvement OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 19916)
-- Name: diversification_improvement_id_seq; Type: SEQUENCE; Schema: account_workflow; Owner: postgres
--

CREATE SEQUENCE account_workflow.diversification_improvement_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE account_workflow.diversification_improvement_id_seq OWNER TO postgres;

--
-- TOC entry 4204 (class 0 OID 0)
-- Dependencies: 211
-- Name: diversification_improvement_id_seq; Type: SEQUENCE OWNED BY; Schema: account_workflow; Owner: postgres
--

ALTER SEQUENCE account_workflow.diversification_improvement_id_seq OWNED BY account_workflow.diversification_improvement.id;


--
-- TOC entry 222 (class 1259 OID 20013)
-- Name: fee_improvement; Type: TABLE; Schema: account_workflow; Owner: postgres
--

CREATE TABLE account_workflow.fee_improvement (
    id integer NOT NULL,
    account_analysis_queue_id bigint NOT NULL,
    account_id bigint NOT NULL,
    provider_id bigint NOT NULL,
    optimalvalue numeric NOT NULL,
    optimalpercent numeric NOT NULL,
    currentvalue numeric NOT NULL,
    currentpercent numeric NOT NULL,
    datecreated timestamp without time zone NOT NULL
);


ALTER TABLE account_workflow.fee_improvement OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 19918)
-- Name: fee_improvement_id_seq; Type: SEQUENCE; Schema: account_workflow; Owner: postgres
--

CREATE SEQUENCE account_workflow.fee_improvement_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE account_workflow.fee_improvement_id_seq OWNER TO postgres;

--
-- TOC entry 4205 (class 0 OID 0)
-- Dependencies: 212
-- Name: fee_improvement_id_seq; Type: SEQUENCE OWNED BY; Schema: account_workflow; Owner: postgres
--

ALTER SEQUENCE account_workflow.fee_improvement_id_seq OWNED BY account_workflow.fee_improvement.id;


--
-- TOC entry 216 (class 1259 OID 19938)
-- Name: ticker_code; Type: TABLE; Schema: account_workflow; Owner: postgres
--

CREATE TABLE account_workflow.ticker_code (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE account_workflow.ticker_code OWNER TO postgres;

--
-- TOC entry 4030 (class 2604 OID 19962)
-- Name: account_analysis_activity_log id; Type: DEFAULT; Schema: account_workflow; Owner: postgres
--

ALTER TABLE ONLY account_workflow.account_analysis_activity_log ALTER COLUMN id SET DEFAULT nextval('account_workflow.account_analysis_activity_log_id_seq'::regclass);


--
-- TOC entry 4029 (class 2604 OID 19946)
-- Name: account_analysis_queue id; Type: DEFAULT; Schema: account_workflow; Owner: postgres
--

ALTER TABLE ONLY account_workflow.account_analysis_queue ALTER COLUMN id SET DEFAULT nextval('account_workflow.account_analysis_queue_id_seq'::regclass);


--
-- TOC entry 4031 (class 2604 OID 19973)
-- Name: account_analysis_queue_log id; Type: DEFAULT; Schema: account_workflow; Owner: postgres
--

ALTER TABLE ONLY account_workflow.account_analysis_queue_log ALTER COLUMN id SET DEFAULT nextval('account_workflow.account_analysis_queue_log_id_seq'::regclass);


--
-- TOC entry 4032 (class 2604 OID 19989)
-- Name: account_analysis_queue_status_history id; Type: DEFAULT; Schema: account_workflow; Owner: postgres
--

ALTER TABLE ONLY account_workflow.account_analysis_queue_status_history ALTER COLUMN id SET DEFAULT nextval('account_workflow.account_analysis_queue_status_history_id_seq'::regclass);


--
-- TOC entry 4034 (class 2604 OID 20030)
-- Name: allocation_improvement id; Type: DEFAULT; Schema: account_workflow; Owner: postgres
--

ALTER TABLE ONLY account_workflow.allocation_improvement ALTER COLUMN id SET DEFAULT nextval('account_workflow.allocation_improvement_id_seq'::regclass);


--
-- TOC entry 4027 (class 2604 OID 19929)
-- Name: allocation_type id; Type: DEFAULT; Schema: account_workflow; Owner: postgres
--

ALTER TABLE ONLY account_workflow.allocation_type ALTER COLUMN id SET DEFAULT nextval('account_workflow.allocation_type_id_seq'::regclass);


--
-- TOC entry 4026 (class 2604 OID 19923)
-- Name: analysis_status id; Type: DEFAULT; Schema: account_workflow; Owner: postgres
--

ALTER TABLE ONLY account_workflow.analysis_status ALTER COLUMN id SET DEFAULT nextval('account_workflow.analysis_status_id_seq'::regclass);


--
-- TOC entry 4028 (class 2604 OID 19935)
-- Name: analysis_trigger id; Type: DEFAULT; Schema: account_workflow; Owner: postgres
--

ALTER TABLE ONLY account_workflow.analysis_trigger ALTER COLUMN id SET DEFAULT nextval('account_workflow.analysis_trigger_id_seq'::regclass);


--
-- TOC entry 4035 (class 2604 OID 20046)
-- Name: diversification_improvement id; Type: DEFAULT; Schema: account_workflow; Owner: postgres
--

ALTER TABLE ONLY account_workflow.diversification_improvement ALTER COLUMN id SET DEFAULT nextval('account_workflow.diversification_improvement_id_seq'::regclass);


--
-- TOC entry 4033 (class 2604 OID 20016)
-- Name: fee_improvement id; Type: DEFAULT; Schema: account_workflow; Owner: postgres
--

ALTER TABLE ONLY account_workflow.fee_improvement ALTER COLUMN id SET DEFAULT nextval('account_workflow.fee_improvement_id_seq'::regclass);


--
-- TOC entry 4047 (class 2606 OID 19964)
-- Name: account_analysis_activity_log account_analysis_activity_log_pkey; Type: CONSTRAINT; Schema: account_workflow; Owner: postgres
--

ALTER TABLE ONLY account_workflow.account_analysis_activity_log
    ADD CONSTRAINT account_analysis_activity_log_pkey PRIMARY KEY (id);


--
-- TOC entry 4049 (class 2606 OID 19975)
-- Name: account_analysis_queue_log account_analysis_queue_log_pkey; Type: CONSTRAINT; Schema: account_workflow; Owner: postgres
--

ALTER TABLE ONLY account_workflow.account_analysis_queue_log
    ADD CONSTRAINT account_analysis_queue_log_pkey PRIMARY KEY (id);


--
-- TOC entry 4045 (class 2606 OID 19948)
-- Name: account_analysis_queue account_analysis_queue_pkey; Type: CONSTRAINT; Schema: account_workflow; Owner: postgres
--

ALTER TABLE ONLY account_workflow.account_analysis_queue
    ADD CONSTRAINT account_analysis_queue_pkey PRIMARY KEY (id);


--
-- TOC entry 4051 (class 2606 OID 19991)
-- Name: account_analysis_queue_status_history account_analysis_queue_status_history_pkey; Type: CONSTRAINT; Schema: account_workflow; Owner: postgres
--

ALTER TABLE ONLY account_workflow.account_analysis_queue_status_history
    ADD CONSTRAINT account_analysis_queue_status_history_pkey PRIMARY KEY (id);


--
-- TOC entry 4055 (class 2606 OID 20032)
-- Name: allocation_improvement allocation_improvement_pkey; Type: CONSTRAINT; Schema: account_workflow; Owner: postgres
--

ALTER TABLE ONLY account_workflow.allocation_improvement
    ADD CONSTRAINT allocation_improvement_pkey PRIMARY KEY (id);


--
-- TOC entry 4039 (class 2606 OID 19931)
-- Name: allocation_type allocation_type_pkey; Type: CONSTRAINT; Schema: account_workflow; Owner: postgres
--

ALTER TABLE ONLY account_workflow.allocation_type
    ADD CONSTRAINT allocation_type_pkey PRIMARY KEY (id);


--
-- TOC entry 4037 (class 2606 OID 19925)
-- Name: analysis_status analysis_status_pkey; Type: CONSTRAINT; Schema: account_workflow; Owner: postgres
--

ALTER TABLE ONLY account_workflow.analysis_status
    ADD CONSTRAINT analysis_status_pkey PRIMARY KEY (id);


--
-- TOC entry 4041 (class 2606 OID 19937)
-- Name: analysis_trigger analysis_trigger_pkey; Type: CONSTRAINT; Schema: account_workflow; Owner: postgres
--

ALTER TABLE ONLY account_workflow.analysis_trigger
    ADD CONSTRAINT analysis_trigger_pkey PRIMARY KEY (id);


--
-- TOC entry 4057 (class 2606 OID 20051)
-- Name: diversification_improvement diversification_improvement_pkey; Type: CONSTRAINT; Schema: account_workflow; Owner: postgres
--

ALTER TABLE ONLY account_workflow.diversification_improvement
    ADD CONSTRAINT diversification_improvement_pkey PRIMARY KEY (id);


--
-- TOC entry 4053 (class 2606 OID 20021)
-- Name: fee_improvement fee_improvement_pkey; Type: CONSTRAINT; Schema: account_workflow; Owner: postgres
--

ALTER TABLE ONLY account_workflow.fee_improvement
    ADD CONSTRAINT fee_improvement_pkey PRIMARY KEY (id);


--
-- TOC entry 4043 (class 2606 OID 19942)
-- Name: ticker_code ticker_code_pkey; Type: CONSTRAINT; Schema: account_workflow; Owner: postgres
--

ALTER TABLE ONLY account_workflow.ticker_code
    ADD CONSTRAINT ticker_code_pkey PRIMARY KEY (id);


--
-- TOC entry 4060 (class 2606 OID 19965)
-- Name: account_analysis_activity_log account_analysis_activity_log_account_analysis_queue_id_fkey; Type: FK CONSTRAINT; Schema: account_workflow; Owner: postgres
--

ALTER TABLE ONLY account_workflow.account_analysis_activity_log
    ADD CONSTRAINT account_analysis_activity_log_account_analysis_queue_id_fkey FOREIGN KEY (account_analysis_queue_id) REFERENCES account_workflow.account_analysis_queue(id);


--
-- TOC entry 4058 (class 2606 OID 19949)
-- Name: account_analysis_queue account_analysis_queue_analysis_status_id_fkey; Type: FK CONSTRAINT; Schema: account_workflow; Owner: postgres
--

ALTER TABLE ONLY account_workflow.account_analysis_queue
    ADD CONSTRAINT account_analysis_queue_analysis_status_id_fkey FOREIGN KEY (analysis_status_id) REFERENCES account_workflow.analysis_status(id);


--
-- TOC entry 4061 (class 2606 OID 19976)
-- Name: account_analysis_queue_log account_analysis_queue_log_analysis_status_id_fkey; Type: FK CONSTRAINT; Schema: account_workflow; Owner: postgres
--

ALTER TABLE ONLY account_workflow.account_analysis_queue_log
    ADD CONSTRAINT account_analysis_queue_log_analysis_status_id_fkey FOREIGN KEY (analysis_status_id) REFERENCES account_workflow.analysis_status(id);


--
-- TOC entry 4062 (class 2606 OID 19981)
-- Name: account_analysis_queue_log account_analysis_queue_log_trigger_id_fkey; Type: FK CONSTRAINT; Schema: account_workflow; Owner: postgres
--

ALTER TABLE ONLY account_workflow.account_analysis_queue_log
    ADD CONSTRAINT account_analysis_queue_log_trigger_id_fkey FOREIGN KEY (trigger_id) REFERENCES account_workflow.analysis_trigger(id);


--
-- TOC entry 4063 (class 2606 OID 19992)
-- Name: account_analysis_queue_status_history account_analysis_queue_status_history_analysis_status_id_fkey; Type: FK CONSTRAINT; Schema: account_workflow; Owner: postgres
--

ALTER TABLE ONLY account_workflow.account_analysis_queue_status_history
    ADD CONSTRAINT account_analysis_queue_status_history_analysis_status_id_fkey FOREIGN KEY (analysis_status_id) REFERENCES account_workflow.analysis_status(id);


--
-- TOC entry 4064 (class 2606 OID 19997)
-- Name: account_analysis_queue_status_history account_analysis_queue_status_history_trigger_id_fkey; Type: FK CONSTRAINT; Schema: account_workflow; Owner: postgres
--

ALTER TABLE ONLY account_workflow.account_analysis_queue_status_history
    ADD CONSTRAINT account_analysis_queue_status_history_trigger_id_fkey FOREIGN KEY (trigger_id) REFERENCES account_workflow.analysis_trigger(id);


--
-- TOC entry 4059 (class 2606 OID 19954)
-- Name: account_analysis_queue account_analysis_queue_trigger_id_fkey; Type: FK CONSTRAINT; Schema: account_workflow; Owner: postgres
--

ALTER TABLE ONLY account_workflow.account_analysis_queue
    ADD CONSTRAINT account_analysis_queue_trigger_id_fkey FOREIGN KEY (trigger_id) REFERENCES account_workflow.analysis_trigger(id);


--
-- TOC entry 4065 (class 2606 OID 20008)
-- Name: account_analysis_summary account_analysis_summary_account_analysis_queue_id_fkey; Type: FK CONSTRAINT; Schema: account_workflow; Owner: postgres
--

ALTER TABLE ONLY account_workflow.account_analysis_summary
    ADD CONSTRAINT account_analysis_summary_account_analysis_queue_id_fkey FOREIGN KEY (account_analysis_queue_id) REFERENCES account_workflow.account_analysis_queue(id);


--
-- TOC entry 4067 (class 2606 OID 20033)
-- Name: allocation_improvement allocation_improvement_account_analysis_queue_id_fkey; Type: FK CONSTRAINT; Schema: account_workflow; Owner: postgres
--

ALTER TABLE ONLY account_workflow.allocation_improvement
    ADD CONSTRAINT allocation_improvement_account_analysis_queue_id_fkey FOREIGN KEY (account_analysis_queue_id) REFERENCES account_workflow.account_analysis_queue(id);


--
-- TOC entry 4068 (class 2606 OID 20038)
-- Name: allocation_improvement allocation_improvement_allocation_type_id_fkey; Type: FK CONSTRAINT; Schema: account_workflow; Owner: postgres
--

ALTER TABLE ONLY account_workflow.allocation_improvement
    ADD CONSTRAINT allocation_improvement_allocation_type_id_fkey FOREIGN KEY (allocation_type_id) REFERENCES account_workflow.allocation_type(id);


--
-- TOC entry 4069 (class 2606 OID 20052)
-- Name: diversification_improvement diversification_improvement_account_analysis_queue_id_fkey; Type: FK CONSTRAINT; Schema: account_workflow; Owner: postgres
--

ALTER TABLE ONLY account_workflow.diversification_improvement
    ADD CONSTRAINT diversification_improvement_account_analysis_queue_id_fkey FOREIGN KEY (account_analysis_queue_id) REFERENCES account_workflow.account_analysis_queue(id);


--
-- TOC entry 4066 (class 2606 OID 20022)
-- Name: fee_improvement fee_improvement_account_analysis_queue_id_fkey; Type: FK CONSTRAINT; Schema: account_workflow; Owner: postgres
--

ALTER TABLE ONLY account_workflow.fee_improvement
    ADD CONSTRAINT fee_improvement_account_analysis_queue_id_fkey FOREIGN KEY (account_analysis_queue_id) REFERENCES account_workflow.account_analysis_queue(id);


-- Completed on 2020-09-05 13:40:01

--
-- PostgreSQL database dump complete
--

