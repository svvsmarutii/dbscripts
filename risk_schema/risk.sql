--liquibase formatted sql
--changeset llteam:TLL-001.7
create schema risk;
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

--
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

SET default_with_oids = false;


CREATE TABLE risk.risk_questions (
    id integer NOT NULL primary key,
    active boolean NOT NULL,
    text character varying(200)
);

--
-- Name: user_risk_answers; Type: TABLE; Schema: risk; Owner: postgres
--

CREATE TABLE risk.user_risk_answers (
    id bigint NOT NULL,
    risk_question_id bigint,
    user_id character varying(50),
    --risk_question_text character varying(200),
    risk_answer character varying(50),
	risk_question_text character varying(200) COLLATE pg_catalog."default",
	foreign key(risk_question_id) references risk.risk_questions(id)
);


ALTER TABLE risk.user_risk_answers OWNER TO postgres;

--
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
-- Name: risk_questions; Type: TABLE; Schema: risk; Owner: postgres
--


ALTER TABLE risk.risk_questions OWNER TO postgres;

--
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
-- Name: user_risk_profile id; Type: CONSTRAINT; Schema: risk; Owner: postgres
--

ALTER TABLE ONLY risk.user_risk_profile
    ADD CONSTRAINT id PRIMARY KEY (id);


--
-- Name: user_risk_answers user_risk_answers_pkey; Type: CONSTRAINT; Schema: risk; Owner: postgres
--

ALTER TABLE ONLY risk.user_risk_answers
    ADD CONSTRAINT user_risk_answers_pkey PRIMARY KEY (id);


--

-- Name: tenant_risk_questions tenant_risk_questions_pkey; Type: CONSTRAINT; Schema: risk; Owner: postgres

ALTER TABLE ONLY risk.tenant_risk_questions
    ADD CONSTRAINT tenant_risk_questions_pkey PRIMARY KEY (id);


--
-- Name: subscription subscription_pkey; Type: CONSTRAINT; Schema: risk; Owner: postgres
--

ALTER TABLE ONLY risk.subscription
    ADD CONSTRAINT subscription_pkey PRIMARY KEY (subscription_id);


--
-- Name: tenant_risk_questions tenant_risk_questions_risk_question_id_fkey; Type: FK CONSTRAINT; Schema: risk; Owner: postgres
--

ALTER TABLE ONLY risk.tenant_risk_questions
    ADD CONSTRAINT tenant_risk_questions_risk_question_id_fkey FOREIGN KEY (risk_question_id) REFERENCES risk.risk_questions(id);


--
-- Name: tenant_risk_questions tenant_risk_questions_risk_question_id_fkey1; Type: FK CONSTRAINT; Schema: risk; Owner: postgres
--

ALTER TABLE ONLY risk.tenant_risk_questions
    ADD CONSTRAINT tenant_risk_questions_risk_question_id_fkey1 FOREIGN KEY (risk_question_id) REFERENCES risk.risk_questions(id);


--
-- Name: SCHEMA risk; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA risk FROM rdsadmin;
REVOKE ALL ON SCHEMA risk FROM PUBLIC;
GRANT ALL ON SCHEMA risk TO postgres;
GRANT ALL ON SCHEMA risk TO PUBLIC;


--
-- PostgreSQL database dump complete
--

