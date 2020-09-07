create schema subscription;

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
-- Name: coupon_sequence; Type: SEQUENCE; Schema: subscription; Owner: postgres
--

CREATE SEQUENCE subscription.coupon_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 1000
    CACHE 1
    CYCLE;

ALTER TABLE subscription.coupon_sequence OWNER TO subscription_rw_app;

CREATE SEQUENCE subscription.customer_sequence
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE subscription.customer_sequence OWNER TO subscription_rw_app;
	
CREATE SEQUENCE subscription.subscription_sequence
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE subscription.subscription_sequence OWNER TO subscription_rw_app;


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: customers; Type: TABLE; Schema: subscription; Owner: postgres
--


CREATE TABLE subscription.customers (
	stripe_customer_id character varying(50) NOT NULL primary key,
    customer_id bigint NOT NULL,
    city character varying(50),
    coupon_id character varying(50),
    email_id character varying(50),
    address_line1 character varying(100),
    address_line2 character varying(100),
    name character varying(50),
    payment_id character varying(50),
    plan_id character varying(50),
    postal_code character varying(15),
    state character varying(50),
    user_id character varying(50),
    payment_plan character varying(50),
	unique (email_id)
);



ALTER TABLE subscription.customers OWNER TO postgres;


--
-- Name: tenant_coupons; Type: TABLE; Schema: subscription; Owner: postgres
--

CREATE TABLE subscription.tenant_coupons (
    coupon_id bigint NOT NULL,
    active boolean,
    duration date,
    duration_in_months integer,
    percent_off character varying(50),
    stripe_coupon_id character varying(50),
    tenant_id character varying(50)
);


ALTER TABLE subscription.tenant_coupons OWNER TO postgres;

--
-- Name: tenant_subscription_products; Type: TABLE; Schema: subscription; Owner: postgres
--

CREATE TABLE subscription.tenant_subscription_products (
    product_id bigint NOT NULL,
    display_order integer,
    name character varying(50),
    stripe_product_id character varying(50),
    tenant_id character varying(50)
);


ALTER TABLE subscription.tenant_subscription_products OWNER TO postgres;

--
-- Name: user_subscriptions; Type: TABLE; Schema: subscription; Owner: postgres
--

CREATE TABLE subscription.user_subscriptions (
    subscription_id character varying(50) NOT NULL,
    coupon_id character varying(50),
    stripe_customer_id character varying(50),
    stripe_payment_id character varying(50) NOT NULL,
    stripe_plan_id character varying(50),
    stripe_subscription_id character varying(50),
	foreign key(stripe_customer_id) references subscription.customers(stripe_customer_id)
);



ALTER TABLE subscription.user_subscriptions OWNER TO postgres;


ALTER TABLE ONLY subscription.tenant_coupons
    ADD CONSTRAINT tenant_coupons_pkey PRIMARY KEY (coupon_id);


--
-- Name: tenant_subscription_products tenant_subscription_products_pkey; Type: CONSTRAINT; Schema: subscription; Owner: postgres
--

ALTER TABLE ONLY subscription.tenant_subscription_products
    ADD CONSTRAINT tenant_subscription_products_pkey PRIMARY KEY (product_id);


--
-- Name: user_subscriptions user_subscriptions_pkey; Type: CONSTRAINT; Schema: subscription; Owner: postgres
--

ALTER TABLE ONLY subscription.user_subscriptions
    ADD CONSTRAINT user_subscriptions_pkey PRIMARY KEY (subscription_id);


--
-- Name: SCHEMA subscription; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA subscription FROM rdsadmin;
REVOKE ALL ON SCHEMA subscription FROM PUBLIC;
GRANT ALL ON SCHEMA subscription TO postgres;
GRANT ALL ON SCHEMA subscription TO PUBLIC;

ALTER TABLE subscription.tenant_coupons
    ALTER COLUMN duration TYPE character varying(20);

--
-- PostgreSQL database dump complete
--

