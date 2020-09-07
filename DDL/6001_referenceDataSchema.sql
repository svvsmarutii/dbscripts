--
-- PostgreSQL database dump
--

-- Dumped from database version 11.8
-- Dumped by pg_dump version 12.3

-- Started on 2020-09-05 13:41:05

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
-- TOC entry 13 (class 2615 OID 20058)
-- Name: reference_data; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA reference_data;


ALTER SCHEMA reference_data OWNER TO postgres;

SET default_tablespace = '';

--
-- TOC entry 240 (class 1259 OID 20192)
-- Name: cross_reference_codes; Type: TABLE; Schema: reference_data; Owner: postgres
--

CREATE TABLE reference_data.cross_reference_codes (
    cross_ref_type_id integer NOT NULL,
    create_timestamp timestamp without time zone,
    cross_ref_type_name character varying(255),
    definition text,
    status boolean,
    update_timestamp timestamp without time zone,
    xpath character varying(255)
);


ALTER TABLE reference_data.cross_reference_codes OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 20059)
-- Name: data_load_def; Type: TABLE; Schema: reference_data; Owner: postgres
--

CREATE TABLE reference_data.data_load_def (
    def_id character varying(255) NOT NULL,
    datafiletype character varying(255),
    datatype character varying(255),
    def_name character varying(255),
    filenamepattern character varying(255)
);


ALTER TABLE reference_data.data_load_def OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 20067)
-- Name: data_payload_files; Type: TABLE; Schema: reference_data; Owner: postgres
--

CREATE TABLE reference_data.data_payload_files (
    asofdate character varying(255) NOT NULL,
    asset_file_type character varying(255) NOT NULL,
    asset_file_name character varying(255) NOT NULL,
    zip_file_name character varying(255) NOT NULL,
    asset_file_path character varying(255),
    loadstatus character varying(255),
    runid numeric(19,2)
);


ALTER TABLE reference_data.data_payload_files OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 20075)
-- Name: data_process_run; Type: TABLE; Schema: reference_data; Owner: postgres
--

CREATE TABLE reference_data.data_process_run (
    datastate character varying(255) NOT NULL,
    runid numeric(19,2) NOT NULL,
    errmessage character varying(255),
    fileid character varying(255),
    lastupdts timestamp without time zone,
    lastupdusr character varying(255),
    processid character varying(255),
    processstartts timestamp without time zone,
    processstatus character varying(255),
    runcounter integer
);


ALTER TABLE reference_data.data_process_run OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 20083)
-- Name: fund_asset_allocations; Type: TABLE; Schema: reference_data; Owner: postgres
--

CREATE TABLE reference_data.fund_asset_allocations (
    assetid integer NOT NULL,
    allocationscheme character varying(255),
    allocationsdate timestamp without time zone,
    asofdate timestamp without time zone,
    assetfullname character varying(255),
    assetlegalname character varying(255),
    cash double precision,
    convertible double precision,
    equity double precision,
    fixedincome double precision,
    load_ts timestamp without time zone,
    load_usr_id character varying(255),
    other double precision
);


ALTER TABLE reference_data.fund_asset_allocations OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 20091)
-- Name: fund_attributes; Type: TABLE; Schema: reference_data; Owner: postgres
--

CREATE TABLE reference_data.fund_attributes (
    id bigint NOT NULL,
    asofdate timestamp without time zone,
    assetfullname character varying(255),
    assetid integer NOT NULL,
    assetlegalname character varying(255),
    assettype character varying(255),
    assetuniverse character varying(255),
    fundtype_us character varying(255),
    fundamental character varying(255),
    load_ts timestamp without time zone,
    load_usr_id character varying(255),
    shareclassid integer,
    shareclassfullname character varying(255),
    shareclasslegalname character varying(255),
    us_fund_category character varying(255),
    usamutualfundsassettype character varying(255)
);


ALTER TABLE reference_data.fund_attributes OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 20099)
-- Name: fund_characteristics; Type: TABLE; Schema: reference_data; Owner: postgres
--

CREATE TABLE reference_data.fund_characteristics (
    assetid integer NOT NULL,
    asofdate timestamp without time zone,
    assetfullname character varying(255),
    assetlegalname character varying(255),
    averagepercentmarketcaplarge double precision,
    averagepercentmarketcapmid double precision,
    averagepercentmarketcapsmall double precision,
    characteristicsdate timestamp without time zone,
    latestpercentmarketcaplarge double precision,
    latestpercentmarketcapmid double precision,
    latestpercentmarketcapsmall double precision,
    load_ts timestamp without time zone,
    load_usr_id character varying(255),
    weightedpercentmarketcaplarge double precision,
    weightedpercentmarketcapmid double precision,
    weightedpercentmarketcapsmall double precision
);


ALTER TABLE reference_data.fund_characteristics OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 20107)
-- Name: fund_charges; Type: TABLE; Schema: reference_data; Owner: postgres
--

CREATE TABLE reference_data.fund_charges (
    id bigint NOT NULL,
    annualmax double precision,
    annualmin double precision,
    asofdate timestamp without time zone,
    assetfullname character varying(255),
    assetid integer NOT NULL,
    assetlegalname character varying(255),
    contingentdeferredsalesloadmax double precision,
    contingentdeferredsalesloadmin double precision,
    initialmax double precision,
    initialmin double precision,
    load_ts timestamp without time zone,
    load_usr_id character varying(255),
    reallowancemax double precision,
    reallowancemin double precision,
    redemptionmax double precision,
    redemptionmin double precision,
    shareclassid integer,
    shareclassfullname character varying(255),
    shareclasslegalname character varying(255)
);


ALTER TABLE reference_data.fund_charges OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 20115)
-- Name: fund_detail_allocations; Type: TABLE; Schema: reference_data; Owner: postgres
--

CREATE TABLE reference_data.fund_detail_allocations (
    id bigint NOT NULL,
    allocationitemid character varying(255),
    allocationitemname character varying(255),
    allocationscheme character varying(255),
    allocationsdate timestamp without time zone,
    asofdate timestamp without time zone,
    assetfullname character varying(255),
    assetid integer,
    assetlegalname character varying(255),
    load_ts timestamp without time zone,
    load_usr_id character varying(255),
    percentweight double precision,
    rank integer
);


ALTER TABLE reference_data.fund_detail_allocations OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 20123)
-- Name: fund_fees_data; Type: TABLE; Schema: reference_data; Owner: postgres
--

CREATE TABLE reference_data.fund_fees_data (
    id bigint NOT NULL,
    asofdate timestamp without time zone,
    assetfullname character varying(255),
    assetid integer NOT NULL,
    assetlegalname character varying(255),
    load_ts timestamp without time zone,
    load_usr_id character varying(255),
    prospectusgrossmanagementfeeratiopercent double precision,
    prospectusgrossmanagementfeeratiovalue double precision,
    prospectusgrossotherexpenseratiopercent double precision,
    prospectusgrossotherexpenseratiovalue double precision,
    prospectusnetexpenseratiopercent double precision,
    prospectusnetexpenseratiovalue double precision,
    prospectusnetotherexpenseratiopercent double precision,
    prospectusnetotherexpenseratiovalue double precision,
    shareclassid integer,
    shareclassfullname character varying(255),
    shareclasslegalname character varying(255),
    totalexpenseratiopercent double precision,
    totalexpenseratiovalue double precision
);


ALTER TABLE reference_data.fund_fees_data OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 20140)
-- Name: fund_performance; Type: TABLE; Schema: reference_data; Owner: postgres
--

CREATE TABLE reference_data.fund_performance (
    id bigint NOT NULL,
    asofdate timestamp without time zone,
    assetid integer,
    currency character varying(255),
    enddate timestamp without time zone,
    lastupd_ts timestamp without time zone,
    lastupd_usr character varying(255),
    load_ts timestamp without time zone,
    load_usr_id character varying(255),
    returnvalue double precision,
    rollingseries character varying(255),
    startdate timestamp without time zone
);


ALTER TABLE reference_data.fund_performance OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 20131)
-- Name: fund_performancev2; Type: TABLE; Schema: reference_data; Owner: postgres
--

CREATE TABLE reference_data.fund_performancev2 (
    id bigint NOT NULL,
    asofdate timestamp without time zone,
    assetid integer,
    shareclassid integer,
    currency character varying(255),
    enddate timestamp without time zone,
    lastupd_ts timestamp without time zone,
    lastupd_usr character varying(255),
    load_ts timestamp without time zone,
    load_usr_id character varying(255),
    returnvalue double precision,
    rollingseries character varying(255),
    startdate timestamp without time zone
);


ALTER TABLE reference_data.fund_performancev2 OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 20149)
-- Name: fund_prices; Type: TABLE; Schema: reference_data; Owner: postgres
--

CREATE TABLE reference_data.fund_prices (
    id bigint NOT NULL,
    asofdate timestamp without time zone,
    assetfullname character varying(255),
    assetid integer NOT NULL,
    assetlegalname character varying(255),
    load_ts timestamp without time zone,
    load_usr_id character varying(255),
    midprice double precision,
    navprice double precision,
    offerprice double precision,
    pricedate timestamp without time zone,
    shareclassid integer,
    shareclassfullname character varying(255),
    shareclasslegalname character varying(255)
);


ALTER TABLE reference_data.fund_prices OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 20157)
-- Name: fund_region_allocations; Type: TABLE; Schema: reference_data; Owner: postgres
--

CREATE TABLE reference_data.fund_region_allocations (
    assetid integer NOT NULL,
    africaexnafrica double precision,
    allocationscheme character varying(255),
    allocationsdate timestamp without time zone,
    asiapacificexjapan double precision,
    asofdate timestamp without time zone,
    assetfullname character varying(255),
    assetlegalname character varying(255),
    emergingmarketsasia double precision,
    emergingmarketseurope double precision,
    europeexuk double precision,
    japan double precision,
    latam double precision,
    load_ts timestamp without time zone,
    load_usr_id character varying(255),
    mena double precision,
    northamericaexus double precision,
    supra double precision,
    unidentified double precision,
    unitedkingdom double precision,
    unitedstates double precision
);


ALTER TABLE reference_data.fund_region_allocations OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 20165)
-- Name: fund_xref_codes; Type: TABLE; Schema: reference_data; Owner: postgres
--

CREATE TABLE reference_data.fund_xref_codes (
    assetid integer NOT NULL,
    asofdate timestamp without time zone,
    assetfullname character varying(255),
    assetlegalname character varying(255),
    cusip character varying(255),
    etfticker character varying(255),
    isincode character varying(255),
    isincurrencyclass character varying(255),
    legalentityidentifier character varying(255),
    linkparent character varying(255),
    lippersymbol_lanacode character varying(255),
    load_ts timestamp without time zone,
    load_usr_id character varying(255),
    mfundfamilyid character varying(255),
    nasdaqticker character varying(255),
    primaryexchangeticker character varying(255),
    ric character varying(255),
    sedolcodetext character varying(255),
    usfundno character varying(255),
    usfundno2 character varying(255),
    usportfoliono character varying(255),
    ussecclassid character varying(255),
    ussecseriesid character varying(255),
    uscik character varying(255)
);


ALTER TABLE reference_data.fund_xref_codes OWNER TO postgres;

--
-- TOC entry 276 (class 1259 OID 20462)
-- Name: plan_custodians; Type: TABLE; Schema: reference_data; Owner: postgres
--

CREATE TABLE reference_data.plan_custodians (
    id bigint NOT NULL,
    plan_id character varying NOT NULL,
    provider character varying,
    asofdate timestamp without time zone NOT NULL
);


ALTER TABLE reference_data.plan_custodians OWNER TO postgres;

--
-- TOC entry 277 (class 1259 OID 20470)
-- Name: plan_custodians_raw; Type: TABLE; Schema: reference_data; Owner: postgres
--

CREATE TABLE reference_data.plan_custodians_raw (
    as_of_date character varying(20),
    loadstatus character varying(10),
    runid bigint NOT NULL,
    id bigint NOT NULL,
    plan_id character varying NOT NULL,
    provider character varying NOT NULL
);


ALTER TABLE reference_data.plan_custodians_raw OWNER TO postgres;

--
-- TOC entry 278 (class 1259 OID 20478)
-- Name: plan_investment_options; Type: TABLE; Schema: reference_data; Owner: postgres
--

CREATE TABLE reference_data.plan_investment_options (
    id bigint NOT NULL,
    plan_id character varying NOT NULL,
    ticker character varying,
    type character varying,
    fund character varying,
    amount double precision,
    category character varying,
    issuer character varying,
    asset_class character varying,
    region character varying,
    style character varying,
    size character varying,
    proxy_ticker character varying,
    deleted_at timestamp without time zone,
    share_class_match character varying(255),
    asofdate timestamp without time zone NOT NULL,
    version integer
);


ALTER TABLE reference_data.plan_investment_options OWNER TO postgres;

--
-- TOC entry 279 (class 1259 OID 20486)
-- Name: plan_investment_options_raw; Type: TABLE; Schema: reference_data; Owner: postgres
--

CREATE TABLE reference_data.plan_investment_options_raw (
    as_of_date character varying(20),
    loadstatus character varying(10),
    runid bigint NOT NULL,
    id bigint NOT NULL,
    plan_id character varying NOT NULL,
    ticker character varying,
    type character varying,
    fund character varying,
    shareclass_match integer,
    amount double precision,
    category character varying,
    issuer character varying,
    asset_class character varying,
    region character varying,
    style character varying,
    size character varying,
    proxy_ticker character varying,
    deleted_at character varying
);


ALTER TABLE reference_data.plan_investment_options_raw OWNER TO postgres;

--
-- TOC entry 280 (class 1259 OID 20494)
-- Name: plan_pro; Type: TABLE; Schema: reference_data; Owner: postgres
--

CREATE TABLE reference_data.plan_pro (
    id bigint NOT NULL,
    plan_id character varying NOT NULL,
    plan character varying,
    company_name character varying,
    ein double precision,
    plan_type character varying,
    address character varying,
    city character varying,
    state character varying,
    zip character varying,
    year integer,
    total_participants integer,
    total_assets double precision,
    as_of timestamp without time zone,
    deleted_at timestamp without time zone,
    asofdate timestamp without time zone NOT NULL
);


ALTER TABLE reference_data.plan_pro OWNER TO postgres;

--
-- TOC entry 275 (class 1259 OID 20459)
-- Name: plan_pro_parser; Type: TABLE; Schema: reference_data; Owner: postgres
--

CREATE TABLE reference_data.plan_pro_parser (
    last_parse_timestamp character varying(30)
);


ALTER TABLE reference_data.plan_pro_parser OWNER TO postgres;

--
-- TOC entry 281 (class 1259 OID 20502)
-- Name: plan_pro_raw; Type: TABLE; Schema: reference_data; Owner: postgres
--

CREATE TABLE reference_data.plan_pro_raw (
    as_of_date character varying(20),
    loadstatus character varying(10),
    runid bigint NOT NULL,
    id bigint NOT NULL,
    plan_id character varying NOT NULL,
    plan character varying,
    company_name character varying,
    ein double precision,
    plan_type character varying,
    address character varying,
    city character varying,
    state character varying,
    zip character varying,
    year integer,
    total_participants integer,
    total_assets double precision,
    as_of character varying,
    deleted_at character varying
);


ALTER TABLE reference_data.plan_pro_raw OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 20173)
-- Name: shareclass_xref_codes; Type: TABLE; Schema: reference_data; Owner: postgres
--

CREATE TABLE reference_data.shareclass_xref_codes (
    id bigint NOT NULL,
    asofdate timestamp without time zone,
    assetfullname character varying(255),
    assetid integer NOT NULL,
    assetlegalname character varying(255),
    cusip character varying(255),
    etfticker character varying(255),
    isincode character varying(255),
    isincurrencyclass character varying(255),
    legalentityidentifier character varying(255),
    linkparent character varying(255),
    lippersymbol_lanacode character varying(255),
    load_ts timestamp without time zone,
    load_usr_id character varying(255),
    mfundfamilyid character varying(255),
    nasdaqticker character varying(255),
    primaryexchangeticker character varying(255),
    ric character varying(255),
    sedolcodetext character varying(255),
    shareclassid integer,
    shareclassfullname character varying(255),
    shareclasslegalname character varying(255),
    usfundno character varying(255),
    usfundno2 character varying(255),
    usmutualfundclassification character varying(255),
    usmutualfundobjective character varying(255),
    usportfoliono character varying(255),
    ussecclassid character varying(255),
    ussecseriesid character varying(255),
    uscik character varying(255)
);


ALTER TABLE reference_data.shareclass_xref_codes OWNER TO postgres;

--
-- TOC entry 4081 (class 2606 OID 20199)
-- Name: cross_reference_codes cross_reference_codes_pkey; Type: CONSTRAINT; Schema: reference_data; Owner: postgres
--

ALTER TABLE ONLY reference_data.cross_reference_codes
    ADD CONSTRAINT cross_reference_codes_pkey PRIMARY KEY (cross_ref_type_id);


--
-- TOC entry 4038 (class 2606 OID 20066)
-- Name: data_load_def data_load_def_pkey; Type: CONSTRAINT; Schema: reference_data; Owner: postgres
--

ALTER TABLE ONLY reference_data.data_load_def
    ADD CONSTRAINT data_load_def_pkey PRIMARY KEY (def_id);


--
-- TOC entry 4040 (class 2606 OID 20074)
-- Name: data_payload_files data_payload_files_pkey; Type: CONSTRAINT; Schema: reference_data; Owner: postgres
--

ALTER TABLE ONLY reference_data.data_payload_files
    ADD CONSTRAINT data_payload_files_pkey PRIMARY KEY (asofdate, asset_file_type, asset_file_name, zip_file_name);


--
-- TOC entry 4042 (class 2606 OID 20082)
-- Name: data_process_run data_processing_run_pkey; Type: CONSTRAINT; Schema: reference_data; Owner: postgres
--

ALTER TABLE ONLY reference_data.data_process_run
    ADD CONSTRAINT data_processing_run_pkey PRIMARY KEY (datastate, runid);


--
-- TOC entry 4045 (class 2606 OID 20090)
-- Name: fund_asset_allocations fund_asset_allocations_pkey; Type: CONSTRAINT; Schema: reference_data; Owner: postgres
--

ALTER TABLE ONLY reference_data.fund_asset_allocations
    ADD CONSTRAINT fund_asset_allocations_pkey PRIMARY KEY (assetid);


--
-- TOC entry 4048 (class 2606 OID 20098)
-- Name: fund_attributes fund_attributes_pkey; Type: CONSTRAINT; Schema: reference_data; Owner: postgres
--

ALTER TABLE ONLY reference_data.fund_attributes
    ADD CONSTRAINT fund_attributes_pkey PRIMARY KEY (id);


--
-- TOC entry 4051 (class 2606 OID 20106)
-- Name: fund_characteristics fund_characteristics_pkey; Type: CONSTRAINT; Schema: reference_data; Owner: postgres
--

ALTER TABLE ONLY reference_data.fund_characteristics
    ADD CONSTRAINT fund_characteristics_pkey PRIMARY KEY (assetid);


--
-- TOC entry 4054 (class 2606 OID 20114)
-- Name: fund_charges fund_charges_pkey; Type: CONSTRAINT; Schema: reference_data; Owner: postgres
--

ALTER TABLE ONLY reference_data.fund_charges
    ADD CONSTRAINT fund_charges_pkey PRIMARY KEY (id);


--
-- TOC entry 4057 (class 2606 OID 20122)
-- Name: fund_detail_allocations fund_detail_allocations_pkey; Type: CONSTRAINT; Schema: reference_data; Owner: postgres
--

ALTER TABLE ONLY reference_data.fund_detail_allocations
    ADD CONSTRAINT fund_detail_allocations_pkey PRIMARY KEY (id);


--
-- TOC entry 4060 (class 2606 OID 20130)
-- Name: fund_fees_data fund_fees_data_pkey; Type: CONSTRAINT; Schema: reference_data; Owner: postgres
--

ALTER TABLE ONLY reference_data.fund_fees_data
    ADD CONSTRAINT fund_fees_data_pkey PRIMARY KEY (id);


--
-- TOC entry 4066 (class 2606 OID 20147)
-- Name: fund_performance fund_performance_pkey; Type: CONSTRAINT; Schema: reference_data; Owner: postgres
--

ALTER TABLE ONLY reference_data.fund_performance
    ADD CONSTRAINT fund_performance_pkey PRIMARY KEY (id);


--
-- TOC entry 4062 (class 2606 OID 20138)
-- Name: fund_performancev2 fund_performancev2_pkey; Type: CONSTRAINT; Schema: reference_data; Owner: postgres
--

ALTER TABLE ONLY reference_data.fund_performancev2
    ADD CONSTRAINT fund_performancev2_pkey PRIMARY KEY (id);


--
-- TOC entry 4070 (class 2606 OID 20156)
-- Name: fund_prices fund_prices_pkey; Type: CONSTRAINT; Schema: reference_data; Owner: postgres
--

ALTER TABLE ONLY reference_data.fund_prices
    ADD CONSTRAINT fund_prices_pkey PRIMARY KEY (id);


--
-- TOC entry 4073 (class 2606 OID 20164)
-- Name: fund_region_allocations fund_region_allocations_pkey; Type: CONSTRAINT; Schema: reference_data; Owner: postgres
--

ALTER TABLE ONLY reference_data.fund_region_allocations
    ADD CONSTRAINT fund_region_allocations_pkey PRIMARY KEY (assetid);


--
-- TOC entry 4076 (class 2606 OID 20172)
-- Name: fund_xref_codes fund_xref_codes_pkey; Type: CONSTRAINT; Schema: reference_data; Owner: postgres
--

ALTER TABLE ONLY reference_data.fund_xref_codes
    ADD CONSTRAINT fund_xref_codes_pkey PRIMARY KEY (assetid);


--
-- TOC entry 4084 (class 2606 OID 20469)
-- Name: plan_custodians plan_custodians_pkey; Type: CONSTRAINT; Schema: reference_data; Owner: postgres
--

ALTER TABLE ONLY reference_data.plan_custodians
    ADD CONSTRAINT plan_custodians_pkey PRIMARY KEY (id, asofdate, plan_id);


--
-- TOC entry 4087 (class 2606 OID 20477)
-- Name: plan_custodians_raw plan_custodians_raw_pkey; Type: CONSTRAINT; Schema: reference_data; Owner: postgres
--

ALTER TABLE ONLY reference_data.plan_custodians_raw
    ADD CONSTRAINT plan_custodians_raw_pkey PRIMARY KEY (runid, id);


--
-- TOC entry 4092 (class 2606 OID 20485)
-- Name: plan_investment_options plan_investment_options_pkey; Type: CONSTRAINT; Schema: reference_data; Owner: postgres
--

ALTER TABLE ONLY reference_data.plan_investment_options
    ADD CONSTRAINT plan_investment_options_pkey PRIMARY KEY (id, asofdate, plan_id);


--
-- TOC entry 4095 (class 2606 OID 20493)
-- Name: plan_investment_options_raw plan_investment_options_raw_pkey; Type: CONSTRAINT; Schema: reference_data; Owner: postgres
--

ALTER TABLE ONLY reference_data.plan_investment_options_raw
    ADD CONSTRAINT plan_investment_options_raw_pkey PRIMARY KEY (runid, id);


--
-- TOC entry 4098 (class 2606 OID 20501)
-- Name: plan_pro plan_pro_pkey; Type: CONSTRAINT; Schema: reference_data; Owner: postgres
--

ALTER TABLE ONLY reference_data.plan_pro
    ADD CONSTRAINT plan_pro_pkey PRIMARY KEY (id, asofdate, plan_id);


--
-- TOC entry 4101 (class 2606 OID 20509)
-- Name: plan_pro_raw plan_pro_raw_pkey; Type: CONSTRAINT; Schema: reference_data; Owner: postgres
--

ALTER TABLE ONLY reference_data.plan_pro_raw
    ADD CONSTRAINT plan_pro_raw_pkey PRIMARY KEY (runid, id);


--
-- TOC entry 4079 (class 2606 OID 20180)
-- Name: shareclass_xref_codes shareclass_xref_codes_pkey; Type: CONSTRAINT; Schema: reference_data; Owner: postgres
--

ALTER TABLE ONLY reference_data.shareclass_xref_codes
    ADD CONSTRAINT shareclass_xref_codes_pkey PRIMARY KEY (id);


--
-- TOC entry 4043 (class 1259 OID 20181)
-- Name: fund_asset_allocations_index; Type: INDEX; Schema: reference_data; Owner: postgres
--

CREATE INDEX fund_asset_allocations_index ON reference_data.fund_asset_allocations USING btree (assetid, asofdate);


--
-- TOC entry 4046 (class 1259 OID 20182)
-- Name: fund_attributes_index; Type: INDEX; Schema: reference_data; Owner: postgres
--

CREATE INDEX fund_attributes_index ON reference_data.fund_attributes USING btree (assetid, asofdate);


--
-- TOC entry 4049 (class 1259 OID 20183)
-- Name: fund_characteristics_index; Type: INDEX; Schema: reference_data; Owner: postgres
--

CREATE INDEX fund_characteristics_index ON reference_data.fund_characteristics USING btree (assetid, asofdate);


--
-- TOC entry 4052 (class 1259 OID 20184)
-- Name: fund_charges_index; Type: INDEX; Schema: reference_data; Owner: postgres
--

CREATE INDEX fund_charges_index ON reference_data.fund_charges USING btree (assetid, asofdate);


--
-- TOC entry 4055 (class 1259 OID 20185)
-- Name: fund_detail_allocations_index; Type: INDEX; Schema: reference_data; Owner: postgres
--

CREATE INDEX fund_detail_allocations_index ON reference_data.fund_detail_allocations USING btree (assetid, asofdate);


--
-- TOC entry 4058 (class 1259 OID 20186)
-- Name: fund_fees_data_index; Type: INDEX; Schema: reference_data; Owner: postgres
--

CREATE INDEX fund_fees_data_index ON reference_data.fund_fees_data USING btree (assetid, asofdate);


--
-- TOC entry 4064 (class 1259 OID 20187)
-- Name: fund_performance_index; Type: INDEX; Schema: reference_data; Owner: postgres
--

CREATE INDEX fund_performance_index ON reference_data.fund_performance USING btree (assetid, asofdate);


--
-- TOC entry 4068 (class 1259 OID 20188)
-- Name: fund_prices_index; Type: INDEX; Schema: reference_data; Owner: postgres
--

CREATE INDEX fund_prices_index ON reference_data.fund_prices USING btree (assetid, asofdate);


--
-- TOC entry 4071 (class 1259 OID 20189)
-- Name: fund_region_allocations_index; Type: INDEX; Schema: reference_data; Owner: postgres
--

CREATE INDEX fund_region_allocations_index ON reference_data.fund_region_allocations USING btree (assetid, asofdate);


--
-- TOC entry 4074 (class 1259 OID 20190)
-- Name: fund_xref_codes_index; Type: INDEX; Schema: reference_data; Owner: postgres
--

CREATE INDEX fund_xref_codes_index ON reference_data.fund_xref_codes USING btree (assetid, asofdate);


--
-- TOC entry 4067 (class 1259 OID 20148)
-- Name: idx_performance; Type: INDEX; Schema: reference_data; Owner: postgres
--

CREATE INDEX idx_performance ON reference_data.fund_performance USING btree (asofdate, assetid);


--
-- TOC entry 4063 (class 1259 OID 20139)
-- Name: idx_performancev2; Type: INDEX; Schema: reference_data; Owner: postgres
--

CREATE INDEX idx_performancev2 ON reference_data.fund_performancev2 USING btree (asofdate, assetid);


--
-- TOC entry 4082 (class 1259 OID 20517)
-- Name: plan_custodians_index1; Type: INDEX; Schema: reference_data; Owner: postgres
--

CREATE INDEX plan_custodians_index1 ON reference_data.plan_custodians USING btree (plan_id);


--
-- TOC entry 4085 (class 1259 OID 20516)
-- Name: plan_custodians_raw_index1; Type: INDEX; Schema: reference_data; Owner: postgres
--

CREATE INDEX plan_custodians_raw_index1 ON reference_data.plan_custodians_raw USING btree (loadstatus);


--
-- TOC entry 4088 (class 1259 OID 20515)
-- Name: plan_investment_options_index1; Type: INDEX; Schema: reference_data; Owner: postgres
--

CREATE INDEX plan_investment_options_index1 ON reference_data.plan_investment_options USING btree (plan_id);


--
-- TOC entry 4089 (class 1259 OID 20514)
-- Name: plan_investment_options_index2; Type: INDEX; Schema: reference_data; Owner: postgres
--

CREATE INDEX plan_investment_options_index2 ON reference_data.plan_investment_options USING btree (plan_id, version);


--
-- TOC entry 4090 (class 1259 OID 20513)
-- Name: plan_investment_options_index3; Type: INDEX; Schema: reference_data; Owner: postgres
--

CREATE INDEX plan_investment_options_index3 ON reference_data.plan_investment_options USING btree (version);


--
-- TOC entry 4093 (class 1259 OID 20512)
-- Name: plan_investment_options_raw_index1; Type: INDEX; Schema: reference_data; Owner: postgres
--

CREATE INDEX plan_investment_options_raw_index1 ON reference_data.plan_investment_options_raw USING btree (loadstatus);


--
-- TOC entry 4096 (class 1259 OID 20510)
-- Name: plan_pro_index1; Type: INDEX; Schema: reference_data; Owner: postgres
--

CREATE INDEX plan_pro_index1 ON reference_data.plan_pro USING btree (plan_id, ein);


--
-- TOC entry 4099 (class 1259 OID 20511)
-- Name: plan_pro_raw_index1; Type: INDEX; Schema: reference_data; Owner: postgres
--

CREATE INDEX plan_pro_raw_index1 ON reference_data.plan_pro_raw USING btree (loadstatus);


--
-- TOC entry 4077 (class 1259 OID 20191)
-- Name: shareclass_xref_codes_index; Type: INDEX; Schema: reference_data; Owner: postgres
--

CREATE INDEX shareclass_xref_codes_index ON reference_data.shareclass_xref_codes USING btree (assetid, asofdate);


-- Completed on 2020-09-05 13:41:54

--
-- PostgreSQL database dump complete
--

