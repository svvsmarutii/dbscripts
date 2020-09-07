create schema users;
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

CREATE TABLE users.tenant (
    tenant_id character varying(50) NOT NULL PRIMARY KEY,
    cognito_userpool character varying(50),
    name character varying(50),
    created_date date,
    description character varying(100),
    active boolean    
);

--
-- Name: users; Type: TABLE; Schema: users; Owner: postgres
--

CREATE TABLE users.users (
    uuid character varying(50) NOT NULL unique,
    cognito_username character varying(50),
    tenant_id character varying(50),
	ll_account_id character varying(50) unique,
    primary_email character varying(50) unique,
    phone character varying(50),
    last_name character varying(50),
    first_name character varying(50),
    middle_name character varying(50),
	state character(50) COLLATE pg_catalog."default",	
    active boolean,
    secondary_email character varying(50),
    ref_broker character varying(50),
    date_of_birth character varying(25),
	user_preferences jsonb,
	additional_information jsonb,
    age integer,
    retirement_age integer,
    profile_image bytea,
	paymentplan character varying(50),    
	login_attempts int,
    login_date timestamp with time zone,
    logout_date timestamp with time zone,    
    create_date timestamp with time zone,
	updated_date timestamp with time zone,
	CONSTRAINT users_pkey PRIMARY KEY (cognito_username, tenant_id),
	CONSTRAINT users_tenant_id_fkey foreign key(tenant_id) references users.tenant(tenant_id)
);

--
-- Name: user_address; Type: TABLE; Schema: users; Owner: postgres
--

CREATE TABLE users.user_address (
	id serial primary key,    
	tenant_id character varying(50),
	user_id character varying(50),
    address1 character varying(100),
    address2 character varying(100),
    city character varying(50),
    state_name character varying(50),
    zip_code character varying(50),
    created_date date,
    updated_date date,
	CONSTRAINT user_address_fkey foreign key(user_id) references users.users(uuid)
);


ALTER TABLE users.user_address OWNER TO postgres;

--
-- Name: TABLE user_address; Type: COMMENT; Schema: users; Owner: postgres
--

COMMENT ON TABLE users.user_address IS 'Table which stores the user_address information of a users. Primary key will be coginto_username';

--ALTER TABLE users.asset_classification OWNER TO postgres;

--
-- Name: audit_log; Type: TABLE; Schema: users; Owner: postgres
--

CREATE TABLE users.audit_log (
    audit_id bigint NOT NULL primary key,
	user_id character varying,
    process_time time with time zone,
    process_info character varying(50),
    what character varying(500),
    who character varying(50),
    comments character varying(500),
    visible boolean,
	CONSTRAINT audit_log_fkey foreign key(user_id) references users.users(uuid) 
);


ALTER TABLE users.audit_log OWNER TO postgres;

--
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
-- Name: audit_log_audit_id_seq; Type: SEQUENCE OWNED BY; Schema: users; Owner: postgres
--

ALTER SEQUENCE users.audit_log_audit_id_seq OWNED BY users.audit_log.audit_id;

--
-- Name: email_verification; Type: TABLE; Schema: users; Owner: postgres
--

CREATE TABLE users.email_verification_status (
	user_id character varying(50) primary key,   
	tenant_id character varying(5),
    attempt_count integer,
	name character varying(255) COLLATE pg_catalog."default",
	email_address character varying(255) COLLATE pg_catalog."default",
	last_email_time time with time zone,
    created_date date,
	updated_date date,
    status character varying(50),
	CONSTRAINT email_verification_status_fkey foreign key(user_id) references users.users(uuid)
);

ALTER TABLE users.tenant OWNER TO postgres;

CREATE TABLE users.user_attempts (
    id integer NOT NULL,
	tenant_id character varying(5),
    user_name character varying(50),
    attempts integer,
    last_modified timestamp with time zone,
	todays_date timestamp with time zone
);

ALTER TABLE users.user_attempts OWNER TO postgres;

--
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

ALTER TABLE users.users OWNER TO postgres;

--
-- Name: COLUMN users.user_preferences; Type: COMMENT; Schema: users; Owner: postgres
--

COMMENT ON COLUMN users.users.user_preferences IS 'Column which stores users preferences json object';

--
-- Name: COLUMN users.additional_information; Type: COMMENT; Schema: users; Owner: postgres
--

COMMENT ON COLUMN users.users.additional_information IS 'A column which stores users addition information in jsonb format.';

--
-- Name: registration_states; Type: TABLE; Schema: users; Owner: postgres
--

CREATE TABLE users.registration_states (
    state character varying(20) NOT NULL primary key,  
    state_desc character varying(100)
);

-- Correction of column Types and added sequence
CREATE SEQUENCE users.accountsequence INCREMENT 1 START 1;
ALTER TABLE users.users ALTER COLUMN state type varchar(50);
ALTER TABLE users.audit_log DROP COLUMN process_time;
ALTER TABLE users.audit_log Add column process_time timestamp with time zone;
remove spaces in seed file  ---- states table (users)
	
ALTER TABLE users.email_verification_status DROP COLUMN last_email_time;
ALTER TABLE users.email_verification_status Add column last_email_time timestamp with time zone;

ALTER TABLE users.email_verification_status DROP COLUMN created_date;
ALTER TABLE users.email_verification_status Add column created_date timestamp with time zone;

ALTER TABLE users.email_verification_status DROP COLUMN updated_date;
ALTER TABLE users.email_verification_status Add column updated_date timestamp with time zone;

ALTER TABLE users.email_verification_status DROP COLUMN tenant_id;
ALTER TABLE users.email_verification_status Add column tenant_id varchar(50);

ALTER TABLE users.registration_states OWNER TO postgres;

--
-- Name: audit_log audit_id; Type: DEFAULT; Schema: users; Owner: postgres
--

ALTER TABLE ONLY users.audit_log ALTER COLUMN audit_id SET DEFAULT nextval('users.audit_log_audit_id_seq'::regclass);

--
-- Name: registration_states registration_states_pkey; Type: CONSTRAINT; Schema: users; Owner: postgres
--

ALTER TABLE ONLY users.registration_states
    ADD CONSTRAINT registration_states_pkey PRIMARY KEY (state);

--
-- Name: fki_users_tenantId_fkey; Type: INDEX; Schema: users; Owner: postgres
--

CREATE INDEX "fki_users_tenantId_fkey" ON users.users USING btree (tenant_id);

--
-- Name: users users_tenantId_fkey; Type: FK CONSTRAINT; Schema: users; Owner: postgres
--

ALTER TABLE ONLY users.users
    ADD CONSTRAINT "users_tenantId_fkey" FOREIGN KEY (tenant_id) REFERENCES users.tenant(tenant_id) NOT VALID;

--
-- Name: SCHEMA users; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA users FROM rdsadmin;
REVOKE ALL ON SCHEMA users FROM PUBLIC;
GRANT ALL ON SCHEMA users TO postgres;
GRANT ALL ON SCHEMA users TO PUBLIC;

--
-- PostgreSQL database dump complete
--