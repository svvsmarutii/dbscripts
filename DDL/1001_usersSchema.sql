--
-- PostgreSQL database dump
--

-- Dumped from database version 11.8
-- Dumped by pg_dump version 12.3

-- Started on 2020-09-05 13:44:21

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
-- TOC entry 10 (class 2615 OID 20647)
-- Name: users; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA users;


ALTER SCHEMA users OWNER TO postgres;

--
-- TOC entry 291 (class 1259 OID 20728)
-- Name: account_sequence; Type: SEQUENCE; Schema: users; Owner: postgres
--

CREATE SEQUENCE users.account_sequence
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users.account_sequence OWNER TO postgres;

--
-- TOC entry 292 (class 1259 OID 20802)
-- Name: accountsequence; Type: SEQUENCE; Schema: users; Owner: postgres
--

CREATE SEQUENCE users.accountsequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users.accountsequence OWNER TO postgres;

SET default_tablespace = '';

--
-- TOC entry 285 (class 1259 OID 20682)
-- Name: audit_log; Type: TABLE; Schema: users; Owner: postgres
--

CREATE TABLE users.audit_log (
    audit_id bigint NOT NULL,
    user_id character varying(50) NOT NULL,
    process_info character varying(50),
    what character varying(500),
    who character varying(50),
    comments character varying(500),
    visible boolean,
    process_time timestamp with time zone
);


ALTER TABLE users.audit_log OWNER TO postgres;

--
-- TOC entry 286 (class 1259 OID 20695)
-- Name: audit_log_audit_id_seq; Type: SEQUENCE; Schema: users; Owner: postgres
--

CREATE SEQUENCE users.audit_log_audit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users.audit_log_audit_id_seq OWNER TO postgres;

--
-- TOC entry 4175 (class 0 OID 0)
-- Dependencies: 286
-- Name: audit_log_audit_id_seq; Type: SEQUENCE OWNED BY; Schema: users; Owner: postgres
--

ALTER SEQUENCE users.audit_log_audit_id_seq OWNED BY users.audit_log.audit_id;


--
-- TOC entry 287 (class 1259 OID 20697)
-- Name: email_verification_status; Type: TABLE; Schema: users; Owner: postgres
--

CREATE TABLE users.email_verification_status (
    user_id character varying(50) NOT NULL,
    attempt_count integer,
    name character varying(255),
    email_address character varying(255),
    status character varying(50),
    last_email_time timestamp with time zone,
    created_date timestamp with time zone,
    updated_date timestamp with time zone,
    tenant_id character varying(50)
);


ALTER TABLE users.email_verification_status OWNER TO postgres;

--
-- TOC entry 290 (class 1259 OID 20715)
-- Name: registration_states; Type: TABLE; Schema: users; Owner: postgres
--

CREATE TABLE users.registration_states (
    state character varying(50) NOT NULL,
    state_desc character varying(100)
);


ALTER TABLE users.registration_states OWNER TO postgres;

--
-- TOC entry 282 (class 1259 OID 20648)
-- Name: tenant; Type: TABLE; Schema: users; Owner: postgres
--

CREATE TABLE users.tenant (
    tenant_id character varying(50) NOT NULL,
    cognito_userpool character varying(50),
    name character varying(50),
    created_date date,
    description character varying(100),
    active boolean
);


ALTER TABLE users.tenant OWNER TO postgres;

--
-- TOC entry 284 (class 1259 OID 20672)
-- Name: user_address; Type: TABLE; Schema: users; Owner: postgres
--

CREATE TABLE users.user_address (
    tenant_id character varying(50),
    user_id character varying(50),
    address1 character varying(100),
    address2 character varying(100),
    city character varying(50),
    state_name character varying(50),
    zip_code character varying(50),
    created_date date,
    updated_date date,
    id integer NOT NULL
);


ALTER TABLE users.user_address OWNER TO postgres;

--
-- TOC entry 4176 (class 0 OID 0)
-- Dependencies: 284
-- Name: TABLE user_address; Type: COMMENT; Schema: users; Owner: postgres
--

COMMENT ON TABLE users.user_address IS 'Table which stores the user_address information of a users. Primary key will be coginto_username';


--
-- TOC entry 308 (class 1259 OID 22004)
-- Name: user_address_id_seq; Type: SEQUENCE; Schema: users; Owner: postgres
--

CREATE SEQUENCE users.user_address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users.user_address_id_seq OWNER TO postgres;

--
-- TOC entry 4177 (class 0 OID 0)
-- Dependencies: 308
-- Name: user_address_id_seq; Type: SEQUENCE OWNED BY; Schema: users; Owner: postgres
--

ALTER SEQUENCE users.user_address_id_seq OWNED BY users.user_address.id;


--
-- TOC entry 288 (class 1259 OID 20710)
-- Name: user_attempts; Type: TABLE; Schema: users; Owner: postgres
--

CREATE TABLE users.user_attempts (
    id integer NOT NULL,
    tenant_id character varying(50),
    user_name character varying(50),
    attempts integer,
    last_modified timestamp with time zone,
    todays_date timestamp with time zone
);


ALTER TABLE users.user_attempts OWNER TO postgres;

--
-- TOC entry 289 (class 1259 OID 20713)
-- Name: user_attempts_id_seq; Type: SEQUENCE; Schema: users; Owner: postgres
--

ALTER TABLE users.user_attempts ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME users.user_attempts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 283 (class 1259 OID 20653)
-- Name: users; Type: TABLE; Schema: users; Owner: postgres
--

CREATE TABLE users.users (
    uuid character varying(50) NOT NULL,
    cognito_username character varying(50) NOT NULL,
    tenant_id character varying(50) NOT NULL,
    ll_account_id character varying(50),
    primary_email character varying(50),
    phone character varying(50),
    last_name character varying(50),
    first_name character varying(50),
    middle_name character varying(50),
    active boolean,
    secondary_email character varying(50),
    ref_broker character varying(50),
    date_of_birth character varying(25),
    user_preferences jsonb,
    additional_information jsonb,
    age integer,
    retirement_age integer,
    profile_image bytea,
    login_attempts integer,
    login_date timestamp with time zone,
    logout_date timestamp with time zone,
    create_date timestamp with time zone,
    updated_date timestamp with time zone,
    state character varying(50),
    paymentplan character varying(50)
);


ALTER TABLE users.users OWNER TO postgres;

--
-- TOC entry 4178 (class 0 OID 0)
-- Dependencies: 283
-- Name: COLUMN users.user_preferences; Type: COMMENT; Schema: users; Owner: postgres
--

COMMENT ON COLUMN users.users.user_preferences IS 'Column which stores users preferences json object';


--
-- TOC entry 4179 (class 0 OID 0)
-- Dependencies: 283
-- Name: COLUMN users.additional_information; Type: COMMENT; Schema: users; Owner: postgres
--

COMMENT ON COLUMN users.users.additional_information IS 'A column which stores users addition information in jsonb format.';


--
-- TOC entry 4022 (class 2604 OID 20718)
-- Name: audit_log audit_id; Type: DEFAULT; Schema: users; Owner: postgres
--

ALTER TABLE ONLY users.audit_log ALTER COLUMN audit_id SET DEFAULT nextval('users.audit_log_audit_id_seq'::regclass);


--
-- TOC entry 4021 (class 2604 OID 22006)
-- Name: user_address id; Type: DEFAULT; Schema: users; Owner: postgres
--

ALTER TABLE ONLY users.user_address ALTER COLUMN id SET DEFAULT nextval('users.user_address_id_seq'::regclass);


--
-- TOC entry 4038 (class 2606 OID 20689)
-- Name: audit_log audit_log_pkey; Type: CONSTRAINT; Schema: users; Owner: postgres
--

ALTER TABLE ONLY users.audit_log
    ADD CONSTRAINT audit_log_pkey PRIMARY KEY (audit_id);


--
-- TOC entry 4040 (class 2606 OID 20704)
-- Name: email_verification_status email_verification_status_pkey; Type: CONSTRAINT; Schema: users; Owner: postgres
--

ALTER TABLE ONLY users.email_verification_status
    ADD CONSTRAINT email_verification_status_pkey PRIMARY KEY (user_id);


--
-- TOC entry 4042 (class 2606 OID 20720)
-- Name: registration_states registration_states_pkey; Type: CONSTRAINT; Schema: users; Owner: postgres
--

ALTER TABLE ONLY users.registration_states
    ADD CONSTRAINT registration_states_pkey PRIMARY KEY (state);


--
-- TOC entry 4024 (class 2606 OID 20652)
-- Name: tenant tenant_pkey; Type: CONSTRAINT; Schema: users; Owner: postgres
--

ALTER TABLE ONLY users.tenant
    ADD CONSTRAINT tenant_pkey PRIMARY KEY (tenant_id);


--
-- TOC entry 4036 (class 2606 OID 22008)
-- Name: user_address user_address_pkey; Type: CONSTRAINT; Schema: users; Owner: postgres
--

ALTER TABLE ONLY users.user_address
    ADD CONSTRAINT user_address_pkey PRIMARY KEY (id);


--
-- TOC entry 4028 (class 2606 OID 20664)
-- Name: users users_ll_account_id_key; Type: CONSTRAINT; Schema: users; Owner: postgres
--

ALTER TABLE ONLY users.users
    ADD CONSTRAINT users_ll_account_id_key UNIQUE (ll_account_id);


--
-- TOC entry 4030 (class 2606 OID 20660)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: users; Owner: postgres
--

ALTER TABLE ONLY users.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (cognito_username, tenant_id);


--
-- TOC entry 4032 (class 2606 OID 20666)
-- Name: users users_primary_email_key; Type: CONSTRAINT; Schema: users; Owner: postgres
--

ALTER TABLE ONLY users.users
    ADD CONSTRAINT users_primary_email_key UNIQUE (primary_email);


--
-- TOC entry 4034 (class 2606 OID 20662)
-- Name: users users_uuid_key; Type: CONSTRAINT; Schema: users; Owner: postgres
--

ALTER TABLE ONLY users.users
    ADD CONSTRAINT users_uuid_key UNIQUE (uuid);


--
-- TOC entry 4025 (class 1259 OID 20809)
-- Name: fki_state; Type: INDEX; Schema: users; Owner: postgres
--

CREATE INDEX fki_state ON users.users USING btree (state);


--
-- TOC entry 4026 (class 1259 OID 20721)
-- Name: fki_users_tenantId_fkey; Type: INDEX; Schema: users; Owner: postgres
--

CREATE INDEX "fki_users_tenantId_fkey" ON users.users USING btree (tenant_id);


--
-- TOC entry 4047 (class 2606 OID 20690)
-- Name: audit_log audit_log_fkey; Type: FK CONSTRAINT; Schema: users; Owner: postgres
--

ALTER TABLE ONLY users.audit_log
    ADD CONSTRAINT audit_log_fkey FOREIGN KEY (user_id) REFERENCES users.users(uuid);


--
-- TOC entry 4048 (class 2606 OID 20705)
-- Name: email_verification_status email_verification_status_fkey; Type: FK CONSTRAINT; Schema: users; Owner: postgres
--

ALTER TABLE ONLY users.email_verification_status
    ADD CONSTRAINT email_verification_status_fkey FOREIGN KEY (user_id) REFERENCES users.users(uuid);


--
-- TOC entry 4045 (class 2606 OID 20804)
-- Name: users state; Type: FK CONSTRAINT; Schema: users; Owner: postgres
--

ALTER TABLE ONLY users.users
    ADD CONSTRAINT state FOREIGN KEY (state) REFERENCES users.registration_states(state) NOT VALID;


--
-- TOC entry 4046 (class 2606 OID 20677)
-- Name: user_address user_address_fkey; Type: FK CONSTRAINT; Schema: users; Owner: postgres
--

ALTER TABLE ONLY users.user_address
    ADD CONSTRAINT user_address_fkey FOREIGN KEY (user_id) REFERENCES users.users(uuid);


--
-- TOC entry 4044 (class 2606 OID 20722)
-- Name: users users_tenantId_fkey; Type: FK CONSTRAINT; Schema: users; Owner: postgres
--

ALTER TABLE ONLY users.users
    ADD CONSTRAINT "users_tenantId_fkey" FOREIGN KEY (tenant_id) REFERENCES users.tenant(tenant_id) NOT VALID;


--
-- TOC entry 4043 (class 2606 OID 20667)
-- Name: users users_tenant_id_fkey; Type: FK CONSTRAINT; Schema: users; Owner: postgres
--

ALTER TABLE ONLY users.users
    ADD CONSTRAINT users_tenant_id_fkey FOREIGN KEY (tenant_id) REFERENCES users.tenant(tenant_id);


-- Completed on 2020-09-05 13:44:54

--
-- PostgreSQL database dump complete
--

