--
-- PostgreSQL database dump
--

-- Dumped from database version 11.8
-- Dumped by pg_dump version 12.3

-- Started on 2020-09-05 14:35:08

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
-- TOC entry 6 (class 2615 OID 20372)
-- Name: risk; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA risk;


ALTER SCHEMA risk OWNER TO postgres;

--
-- TOC entry 265 (class 1259 OID 20373)
-- Name: customer_sequence; Type: SEQUENCE; Schema: risk; Owner: postgres
--

CREATE SEQUENCE risk.customer_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE risk.customer_sequence OWNER TO postgres;

--
-- TOC entry 266 (class 1259 OID 20375)
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: risk; Owner: postgres
--

CREATE SEQUENCE risk.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE risk.hibernate_sequence OWNER TO postgres;

SET default_tablespace = '';

--
-- TOC entry 267 (class 1259 OID 20377)
-- Name: risk_questions; Type: TABLE; Schema: risk; Owner: postgres
--

CREATE TABLE risk.risk_questions (
    id integer NOT NULL,
    active boolean NOT NULL,
    text character varying(200)
);


ALTER TABLE risk.risk_questions OWNER TO postgres;

--
-- TOC entry 271 (class 1259 OID 20395)
-- Name: subscription; Type: TABLE; Schema: risk; Owner: postgres
--

CREATE TABLE risk.subscription (
    subscription_id integer NOT NULL,
    coupon_id character varying(255),
    stripe_customer_id character varying(255),
    stripe_payment_id character varying(255),
    stripe_plan_id character varying(255),
    stripe_subscription_id character varying(255)
);


ALTER TABLE risk.subscription OWNER TO postgres;

--
-- TOC entry 272 (class 1259 OID 20401)
-- Name: subscription_sequence; Type: SEQUENCE; Schema: risk; Owner: postgres
--

CREATE SEQUENCE risk.subscription_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE risk.subscription_sequence OWNER TO postgres;

--
-- TOC entry 270 (class 1259 OID 20392)
-- Name: tenant_risk_questions; Type: TABLE; Schema: risk; Owner: postgres
--

CREATE TABLE risk.tenant_risk_questions (
    id bigint NOT NULL,
    tenant_id character varying(50),
    sequence integer,
    risk_question_id integer
);


ALTER TABLE risk.tenant_risk_questions OWNER TO postgres;

--
-- TOC entry 268 (class 1259 OID 20382)
-- Name: user_risk_answers; Type: TABLE; Schema: risk; Owner: postgres
--

CREATE TABLE risk.user_risk_answers (
    id bigint NOT NULL,
    risk_question_id bigint,
    risk_answer character varying(50),
    risk_question_text character varying(200),
    user_id character varying(50)
);


ALTER TABLE risk.user_risk_answers OWNER TO postgres;

--
-- TOC entry 269 (class 1259 OID 20390)
-- Name: user_risk_answers_id_seq; Type: SEQUENCE; Schema: risk; Owner: postgres
--

ALTER TABLE risk.user_risk_answers ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME risk.user_risk_answers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 273 (class 1259 OID 20403)
-- Name: user_risk_profile; Type: TABLE; Schema: risk; Owner: postgres
--

CREATE TABLE risk.user_risk_profile (
    id bigint NOT NULL,
    user_id character varying(50),
    tenant_id character varying(50),
    curr_riskscore numeric,
    percentagex numeric,
    percentagey numeric,
    amountx numeric,
    amounty numeric,
    score_date date,
    last_upd_time timestamp with time zone,
    last_upd_agent character varying(30),
    risk_selection_score numeric,
    finaloptions jsonb
);


ALTER TABLE risk.user_risk_profile OWNER TO postgres;

--
-- TOC entry 274 (class 1259 OID 20409)
-- Name: user_risk_profile_id_seq; Type: SEQUENCE; Schema: risk; Owner: postgres
--

ALTER TABLE risk.user_risk_profile ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME risk.user_risk_profile_id_seq
    START WITH 10
    INCREMENT BY 1
    MINVALUE 10
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 4028 (class 2606 OID 20412)
-- Name: user_risk_profile id; Type: CONSTRAINT; Schema: risk; Owner: postgres
--

ALTER TABLE ONLY risk.user_risk_profile
    ADD CONSTRAINT id PRIMARY KEY (id);


--
-- TOC entry 4020 (class 2606 OID 20381)
-- Name: risk_questions risk_questions_pkey; Type: CONSTRAINT; Schema: risk; Owner: postgres
--

ALTER TABLE ONLY risk.risk_questions
    ADD CONSTRAINT risk_questions_pkey PRIMARY KEY (id);


--
-- TOC entry 4026 (class 2606 OID 20418)
-- Name: subscription subscription_pkey; Type: CONSTRAINT; Schema: risk; Owner: postgres
--

ALTER TABLE ONLY risk.subscription
    ADD CONSTRAINT subscription_pkey PRIMARY KEY (subscription_id);


--
-- TOC entry 4024 (class 2606 OID 20416)
-- Name: tenant_risk_questions tenant_risk_questions_pkey; Type: CONSTRAINT; Schema: risk; Owner: postgres
--

ALTER TABLE ONLY risk.tenant_risk_questions
    ADD CONSTRAINT tenant_risk_questions_pkey PRIMARY KEY (id);


--
-- TOC entry 4022 (class 2606 OID 20414)
-- Name: user_risk_answers user_risk_answers_pkey; Type: CONSTRAINT; Schema: risk; Owner: postgres
--

ALTER TABLE ONLY risk.user_risk_answers
    ADD CONSTRAINT user_risk_answers_pkey PRIMARY KEY (id);


--
-- TOC entry 4030 (class 2606 OID 20419)
-- Name: tenant_risk_questions tenant_risk_questions_risk_question_id_fkey; Type: FK CONSTRAINT; Schema: risk; Owner: postgres
--

ALTER TABLE ONLY risk.tenant_risk_questions
    ADD CONSTRAINT tenant_risk_questions_risk_question_id_fkey FOREIGN KEY (risk_question_id) REFERENCES risk.risk_questions(id);

-- Removed by Arun Gotikala Two alter fkey statements - Start 

--
-- TOC entry 4031 (class 2606 OID 20424)
-- Name: tenant_risk_questions tenant_risk_questions_risk_question_id_fkey1; Type: FK CONSTRAINT; Schema: risk; Owner: postgres
--

--ALTER TABLE ONLY risk.tenant_risk_questions
--    ADD CONSTRAINT tenant_risk_questions_risk_question_id_fkey1 FOREIGN KEY (risk_question_id) REFERENCES risk.risk_questions(id);
-- Removed by Arun Gotikala Two alter fkey statements - End 

--
-- TOC entry 4029 (class 2606 OID 20385)
-- Name: user_risk_answers user_risk_answers_risk_question_id_fkey; Type: FK CONSTRAINT; Schema: risk; Owner: postgres
--

ALTER TABLE ONLY risk.user_risk_answers
    ADD CONSTRAINT user_risk_answers_risk_question_id_fkey FOREIGN KEY (risk_question_id) REFERENCES risk.risk_questions(id);


-- Completed on 2020-09-05 14:35:37

--
-- PostgreSQL database dump complete
--

