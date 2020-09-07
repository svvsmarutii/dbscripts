--
-- PostgreSQL database dump
--

-- Dumped from database version 11.8
-- Dumped by pg_dump version 12.3

-- Started on 2020-09-05 13:43:54

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
-- TOC entry 5 (class 2615 OID 20203)
-- Name: subscription; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA subscription;


ALTER SCHEMA subscription OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 20204)
-- Name: coupon_sequence; Type: SEQUENCE; Schema: subscription; Owner: postgres
--

CREATE SEQUENCE subscription.coupon_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 1000
    CACHE 1
    CYCLE;


ALTER TABLE subscription.coupon_sequence OWNER TO postgres;

--
-- TOC entry 309 (class 1259 OID 23251)
-- Name: customer_sequence; Type: SEQUENCE; Schema: subscription; Owner: postgres
--

CREATE SEQUENCE subscription.customer_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE subscription.customer_sequence OWNER TO postgres;

SET default_tablespace = '';

--
-- TOC entry 244 (class 1259 OID 20210)
-- Name: customers; Type: TABLE; Schema: subscription; Owner: postgres
--

CREATE TABLE subscription.customers (
    stripe_customer_id character varying(50) NOT NULL,
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
    payment_plan character varying(50)
);


ALTER TABLE subscription.customers OWNER TO postgres;

--
-- TOC entry 310 (class 1259 OID 23253)
-- Name: subscription_sequence; Type: SEQUENCE; Schema: subscription; Owner: postgres
--

CREATE SEQUENCE subscription.subscription_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE subscription.subscription_sequence OWNER TO postgres;


--
-- TOC entry 245 (class 1259 OID 20220)
-- Name: tenant_coupons; Type: TABLE; Schema: subscription; Owner: postgres
--

CREATE TABLE subscription.tenant_coupons (
    coupon_id bigint NOT NULL,
    active boolean,
    duration character varying(20),
    duration_in_months integer,
    percent_off character varying(50),
    stripe_coupon_id character varying(50),
    tenant_id character varying(50)
);


ALTER TABLE subscription.tenant_coupons OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 20223)
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
-- TOC entry 247 (class 1259 OID 20226)
-- Name: user_subscriptions; Type: TABLE; Schema: subscription; Owner: postgres
--

CREATE TABLE subscription.user_subscriptions (
    subscription_id character varying(50) NOT NULL,
    coupon_id character varying(50),
    stripe_customer_id character varying(50),
    stripe_payment_id character varying(50) NOT NULL,
    stripe_plan_id character varying(50),
    stripe_subscription_id character varying(50)
);


ALTER TABLE subscription.user_subscriptions OWNER TO postgres;

--
-- TOC entry 4019 (class 2606 OID 20219)
-- Name: customers customers_email_id_key; Type: CONSTRAINT; Schema: subscription; Owner: postgres
--

ALTER TABLE ONLY subscription.customers
    ADD CONSTRAINT customers_email_id_key UNIQUE (email_id);


--
-- TOC entry 4021 (class 2606 OID 20217)
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: subscription; Owner: postgres
--

ALTER TABLE ONLY subscription.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (stripe_customer_id);


--
-- TOC entry 4023 (class 2606 OID 20235)
-- Name: tenant_coupons tenant_coupons_pkey; Type: CONSTRAINT; Schema: subscription; Owner: postgres
--

ALTER TABLE ONLY subscription.tenant_coupons
    ADD CONSTRAINT tenant_coupons_pkey PRIMARY KEY (coupon_id);


--
-- TOC entry 4025 (class 2606 OID 20237)
-- Name: tenant_subscription_products tenant_subscription_products_pkey; Type: CONSTRAINT; Schema: subscription; Owner: postgres
--

ALTER TABLE ONLY subscription.tenant_subscription_products
    ADD CONSTRAINT tenant_subscription_products_pkey PRIMARY KEY (product_id);


--
-- TOC entry 4027 (class 2606 OID 20239)
-- Name: user_subscriptions user_subscriptions_pkey; Type: CONSTRAINT; Schema: subscription; Owner: postgres
--

ALTER TABLE ONLY subscription.user_subscriptions
    ADD CONSTRAINT user_subscriptions_pkey PRIMARY KEY (subscription_id);


--
-- TOC entry 4028 (class 2606 OID 20229)
-- Name: user_subscriptions user_subscriptions_stripe_customer_id_fkey; Type: FK CONSTRAINT; Schema: subscription; Owner: postgres
--

ALTER TABLE ONLY subscription.user_subscriptions
    ADD CONSTRAINT user_subscriptions_stripe_customer_id_fkey FOREIGN KEY (stripe_customer_id) REFERENCES subscription.customers(stripe_customer_id);


-- Completed on 2020-09-05 13:44:17

--
-- PostgreSQL database dump complete
--

