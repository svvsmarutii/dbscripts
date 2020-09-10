--liquibase formatted sql
--changeset llteam:TLL-000.2
CREATE schema reference_data
CREATE TABLE reference_data.data_load_def
(
    def_id character varying(255) COLLATE pg_catalog."default" NOT NULL,
    datafiletype character varying(255) COLLATE pg_catalog."default",
    datatype character varying(255) COLLATE pg_catalog."default",
    def_name character varying(255) COLLATE pg_catalog."default",
    filenamepattern character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT DATA_LOAD_DEF_pkey PRIMARY KEY (def_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE reference_data.data_load_def
    OWNER to postgres;


CREATE TABLE reference_data.data_payload_files
(
    asofdate character varying(255) COLLATE pg_catalog."default" NOT NULL,
    asset_file_type character varying(255) COLLATE pg_catalog."default" NOT NULL,
    asset_file_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    zip_file_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    asset_file_path character varying(255) COLLATE pg_catalog."default",
    loadstatus character varying(255) COLLATE pg_catalog."default",
    runid numeric(19,2),
    CONSTRAINT DATA_PAYLOAD_FILES_pkey PRIMARY KEY (asofdate, asset_file_type, asset_file_name, zip_file_name)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE reference_data.data_payload_files
    OWNER to postgres;
	

CREATE TABLE reference_data.data_process_run
(
    datastate character varying(255) COLLATE pg_catalog."default" NOT NULL,
    runid numeric(19,2) NOT NULL,
    errmessage character varying(255) COLLATE pg_catalog."default",
    fileid character varying(255) COLLATE pg_catalog."default",
    lastupdts timestamp without time zone,
    lastupdusr character varying(255) COLLATE pg_catalog."default",
    processid character varying(255) COLLATE pg_catalog."default",
    processstartts timestamp without time zone,
    processstatus character varying(255) COLLATE pg_catalog."default",
    runcounter integer,
    CONSTRAINT DATA_PROCESSING_RUN_pkey PRIMARY KEY (datastate, runid)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE reference_data.data_process_run
    OWNER to postgres;
	

CREATE TABLE reference_data.fund_asset_allocations
(
    assetid integer NOT NULL,
    allocationscheme character varying(255) COLLATE pg_catalog."default",
    allocationsdate timestamp without time zone,
    asofdate timestamp without time zone,
    assetfullname character varying(255) COLLATE pg_catalog."default",
    assetlegalname character varying(255) COLLATE pg_catalog."default",
    cash double precision,
    convertible double precision,
    equity double precision,
    fixedincome double precision,
    load_ts timestamp without time zone,
    load_usr_id character varying(255) COLLATE pg_catalog."default",
    other double precision,
    CONSTRAINT FUND_ASSET_ALLOCATIONS_pkey PRIMARY KEY (assetid)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE reference_data.fund_asset_allocations
    OWNER to postgres;

CREATE TABLE reference_data.fund_attributes
(
    id bigint NOT NULL,
    asofdate timestamp without time zone,
    assetfullname character varying(255) COLLATE pg_catalog."default",
    assetid integer NOT NULL,
    assetlegalname character varying(255) COLLATE pg_catalog."default",
    assettype character varying(255) COLLATE pg_catalog."default",
    assetuniverse character varying(255) COLLATE pg_catalog."default",
    fundtype_us character varying(255) COLLATE pg_catalog."default",
    fundamental character varying(255) COLLATE pg_catalog."default",
    load_ts timestamp without time zone,
    load_usr_id character varying(255) COLLATE pg_catalog."default",
    shareclassid integer,
    shareclassfullname character varying(255) COLLATE pg_catalog."default",
    shareclasslegalname character varying(255) COLLATE pg_catalog."default",
    us_fund_category character varying(255) COLLATE pg_catalog."default",
    usamutualfundsassettype character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT FUND_ATTRIBUTES_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE reference_data.fund_attributes
    OWNER to postgres;
	

CREATE TABLE reference_data.fund_characteristics
(
    assetid integer NOT NULL,
    asofdate timestamp without time zone,
    assetfullname character varying(255) COLLATE pg_catalog."default",
    assetlegalname character varying(255) COLLATE pg_catalog."default",
    averagepercentmarketcaplarge double precision,
    averagepercentmarketcapmid double precision,
    averagepercentmarketcapsmall double precision,
    characteristicsdate timestamp without time zone,
    latestpercentmarketcaplarge double precision,
    latestpercentmarketcapmid double precision,
    latestpercentmarketcapsmall double precision,
    load_ts timestamp without time zone,
    load_usr_id character varying(255) COLLATE pg_catalog."default",
    weightedpercentmarketcaplarge double precision,
    weightedpercentmarketcapmid double precision,
    weightedpercentmarketcapsmall double precision,
    CONSTRAINT FUND_CHARACTERISTICS_pkey PRIMARY KEY (assetid)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE reference_data.fund_characteristics
    OWNER to postgres;
	

CREATE TABLE reference_data.fund_charges
(
    id bigint NOT NULL,
    annualmax double precision,
    annualmin double precision,
    asofdate timestamp without time zone,
    assetfullname character varying(255) COLLATE pg_catalog."default",
    assetid integer NOT NULL,
    assetlegalname character varying(255) COLLATE pg_catalog."default",
    contingentdeferredsalesloadmax double precision,
    contingentdeferredsalesloadmin double precision,
    initialmax double precision,
    initialmin double precision,
    load_ts timestamp without time zone,
    load_usr_id character varying(255) COLLATE pg_catalog."default",
    reallowancemax double precision,
    reallowancemin double precision,
    redemptionmax double precision,
    redemptionmin double precision,
    shareclassid integer,
    shareclassfullname character varying(255) COLLATE pg_catalog."default",
    shareclasslegalname character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT FUND_CHARGES_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE reference_data.fund_charges
    OWNER to postgres;
	

CREATE TABLE reference_data.fund_detail_allocations
(
    id bigint NOT NULL,
    allocationitemid character varying(255) COLLATE pg_catalog."default",
    allocationitemname character varying(255) COLLATE pg_catalog."default",
    allocationscheme character varying(255) COLLATE pg_catalog."default",
    allocationsdate timestamp without time zone,
    asofdate timestamp without time zone,
    assetfullname character varying(255) COLLATE pg_catalog."default",
    assetid integer,
    assetlegalname character varying(255) COLLATE pg_catalog."default",
    load_ts timestamp without time zone,
    load_usr_id character varying(255) COLLATE pg_catalog."default",
    percentweight double precision,
    rank integer,
    CONSTRAINT FUND_DETAIL_ALLOCATIONS_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE reference_data.fund_detail_allocations
    OWNER to postgres;
	

CREATE TABLE reference_data.fund_fees_data
(
    id bigint NOT NULL,
    asofdate timestamp without time zone,
    assetfullname character varying(255) COLLATE pg_catalog."default",
    assetid integer NOT NULL,
    assetlegalname character varying(255) COLLATE pg_catalog."default",
    load_ts timestamp without time zone,
    load_usr_id character varying(255) COLLATE pg_catalog."default",
    prospectusgrossmanagementfeeratiopercent double precision,
    prospectusgrossmanagementfeeratiovalue double precision,
    prospectusgrossotherexpenseratiopercent double precision,
    prospectusgrossotherexpenseratiovalue double precision,
    prospectusnetexpenseratiopercent double precision,
    prospectusnetexpenseratiovalue double precision,
    prospectusnetotherexpenseratiopercent double precision,
    prospectusnetotherexpenseratiovalue double precision,
    shareclassid integer,
    shareclassfullname character varying(255) COLLATE pg_catalog."default",
    shareclasslegalname character varying(255) COLLATE pg_catalog."default",
    totalexpenseratiopercent double precision,
    totalexpenseratiovalue double precision,
    CONSTRAINT FUND_FEES_DATA_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE reference_data.fund_fees_data
    OWNER to postgres;

CREATE TABLE reference_data.fund_performancev2
(
    id bigint NOT NULL,
    asofdate timestamp without time zone,
    assetid integer,
    shareclassid integer,
    currency character varying(255) COLLATE pg_catalog."default",
    enddate timestamp without time zone,
    lastupd_ts timestamp without time zone,
    lastupd_usr character varying(255) COLLATE pg_catalog."default",
    load_ts timestamp without time zone,
    load_usr_id character varying(255) COLLATE pg_catalog."default",
    returnvalue double precision,
    rollingseries character varying(255) COLLATE pg_catalog."default",
    startdate timestamp without time zone,
    CONSTRAINT FUND_PERFORMANCEV2_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE reference_data.fund_performancev2
    OWNER to postgres;

CREATE INDEX idx_performancev2
    ON reference_data.fund_performancev2 USING btree
    (asofdate ASC NULLS LAST, assetid ASC NULLS LAST)
    TABLESPACE pg_default;

CREATE TABLE reference_data.fund_performance
(
    id bigint NOT NULL,
    asofdate timestamp without time zone,
    assetid integer,
    currency character varying(255) COLLATE pg_catalog."default",
    enddate timestamp without time zone,
    lastupd_ts timestamp without time zone,
    lastupd_usr character varying(255) COLLATE pg_catalog."default",
    load_ts timestamp without time zone,
    load_usr_id character varying(255) COLLATE pg_catalog."default",
    returnvalue double precision,
    rollingseries character varying(255) COLLATE pg_catalog."default",
    startdate timestamp without time zone,
    CONSTRAINT FUND_PERFORMANCE_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE reference_data.fund_performance
    OWNER to postgres;

CREATE INDEX idx_performance
    ON reference_data.fund_performance USING btree
    (asofdate ASC NULLS LAST, assetid ASC NULLS LAST)
    TABLESPACE pg_default;


CREATE TABLE reference_data.fund_prices
(
    id bigint NOT NULL,
    asofdate timestamp without time zone,
    assetfullname character varying(255) COLLATE pg_catalog."default",
    assetid integer NOT NULL,
    assetlegalname character varying(255) COLLATE pg_catalog."default",
    load_ts timestamp without time zone,
    load_usr_id character varying(255) COLLATE pg_catalog."default",
    midprice double precision,
    navprice double precision,
    offerprice double precision,
    pricedate timestamp without time zone,
    shareclassid integer,
    shareclassfullname character varying(255) COLLATE pg_catalog."default",
    shareclasslegalname character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT FUND_PRICES_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE reference_data.fund_prices
    OWNER to postgres;

CREATE TABLE reference_data.fund_region_allocations
(
    assetid integer NOT NULL,
    africaexnafrica double precision,
    allocationscheme character varying(255) COLLATE pg_catalog."default",
    allocationsdate timestamp without time zone,
    asiapacificexjapan double precision,
    asofdate timestamp without time zone,
    assetfullname character varying(255) COLLATE pg_catalog."default",
    assetlegalname character varying(255) COLLATE pg_catalog."default",
    emergingmarketsasia double precision,
    emergingmarketseurope double precision,
    europeexuk double precision,
    japan double precision,
    latam double precision,
    load_ts timestamp without time zone,
    load_usr_id character varying(255) COLLATE pg_catalog."default",
    mena double precision,
    northamericaexus double precision,
    supra double precision,
    unidentified double precision,
    unitedkingdom double precision,
    unitedstates double precision,
    CONSTRAINT FUND_REGION_ALLOCATIONS_pkey PRIMARY KEY (assetid)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE reference_data.fund_region_allocations
    OWNER to postgres;

CREATE TABLE reference_data.fund_xref_codes
(
    assetid integer NOT NULL,
    asofdate timestamp without time zone,
    assetfullname character varying(255) COLLATE pg_catalog."default",
    assetlegalname character varying(255) COLLATE pg_catalog."default",
    cusip character varying(255) COLLATE pg_catalog."default",
    etfticker character varying(255) COLLATE pg_catalog."default",
    isincode character varying(255) COLLATE pg_catalog."default",
    isincurrencyclass character varying(255) COLLATE pg_catalog."default",
    legalentityidentifier character varying(255) COLLATE pg_catalog."default",
    linkparent character varying(255) COLLATE pg_catalog."default",
    lippersymbol_lanacode character varying(255) COLLATE pg_catalog."default",
    load_ts timestamp without time zone,
    load_usr_id character varying(255) COLLATE pg_catalog."default",
    mfundfamilyid character varying(255) COLLATE pg_catalog."default",
    nasdaqticker character varying(255) COLLATE pg_catalog."default",
    primaryexchangeticker character varying(255) COLLATE pg_catalog."default",
    ric character varying(255) COLLATE pg_catalog."default",
    sedolcodetext character varying(255) COLLATE pg_catalog."default",
    usfundno character varying(255) COLLATE pg_catalog."default",
    usfundno2 character varying(255) COLLATE pg_catalog."default",
    usportfoliono character varying(255) COLLATE pg_catalog."default",
    ussecclassid character varying(255) COLLATE pg_catalog."default",
    ussecseriesid character varying(255) COLLATE pg_catalog."default",
    uscik character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT FUND_XREF_CODES_pkey PRIMARY KEY (assetid)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE reference_data.fund_xref_codes
    OWNER to postgres;
	

CREATE TABLE reference_data.shareclass_xref_codes
(
    id bigint NOT NULL,
    asofdate timestamp without time zone,
    assetfullname character varying(255) COLLATE pg_catalog."default",
    assetid integer NOT NULL,
    assetlegalname character varying(255) COLLATE pg_catalog."default",
    cusip character varying(255) COLLATE pg_catalog."default",
    etfticker character varying(255) COLLATE pg_catalog."default",
    isincode character varying(255) COLLATE pg_catalog."default",
    isincurrencyclass character varying(255) COLLATE pg_catalog."default",
    legalentityidentifier character varying(255) COLLATE pg_catalog."default",
    linkparent character varying(255) COLLATE pg_catalog."default",
    lippersymbol_lanacode character varying(255) COLLATE pg_catalog."default",
    load_ts timestamp without time zone,
    load_usr_id character varying(255) COLLATE pg_catalog."default",
    mfundfamilyid character varying(255) COLLATE pg_catalog."default",
    nasdaqticker character varying(255) COLLATE pg_catalog."default",
    primaryexchangeticker character varying(255) COLLATE pg_catalog."default",
    ric character varying(255) COLLATE pg_catalog."default",
    sedolcodetext character varying(255) COLLATE pg_catalog."default",
    shareclassid integer,
    shareclassfullname character varying(255) COLLATE pg_catalog."default",
    shareclasslegalname character varying(255) COLLATE pg_catalog."default",
    usfundno character varying(255) COLLATE pg_catalog."default",
    usfundno2 character varying(255) COLLATE pg_catalog."default",
    usmutualfundclassification character varying(255) COLLATE pg_catalog."default",
    usmutualfundobjective character varying(255) COLLATE pg_catalog."default",
    usportfoliono character varying(255) COLLATE pg_catalog."default",
    ussecclassid character varying(255) COLLATE pg_catalog."default",
    ussecseriesid character varying(255) COLLATE pg_catalog."default",
    uscik character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT SHARECLASS_XREF_CODES_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE reference_data.shareclass_xref_codes
    OWNER to postgres;
	
CREATE INDEX FUND_ASSET_ALLOCATIONS_INDEX
ON reference_data.FUND_ASSET_ALLOCATIONS (assetid, asofdate);

CREATE INDEX FUND_ATTRIBUTES_INDEX
ON reference_data.FUND_ATTRIBUTES (assetid, asofdate);

CREATE INDEX FUND_CHARACTERISTICS_INDEX
ON reference_data.FUND_CHARACTERISTICS (assetid, asofdate);

CREATE INDEX FUND_CHARGES_INDEX
ON reference_data.FUND_CHARGES (assetid, asofdate);

CREATE INDEX FUND_DETAIL_ALLOCATIONS_INDEX
ON reference_data.FUND_DETAIL_ALLOCATIONS (assetid, asofdate);

CREATE INDEX FUND_FEES_DATA_INDEX
ON reference_data.FUND_FEES_DATA (assetid, asofdate);

CREATE INDEX FUND_PERFORMANCE_INDEX
ON reference_data.FUND_PERFORMANCE (assetid, asofdate);

CREATE INDEX FUND_PRICES_INDEX
ON reference_data.FUND_PRICES (assetid, asofdate);

CREATE INDEX FUND_REGION_ALLOCATIONS_INDEX
ON reference_data.FUND_REGION_ALLOCATIONS (assetid, asofdate);

CREATE INDEX FUND_XREF_CODES_INDEX
ON reference_data.FUND_XREF_CODES (assetid, asofdate);

CREATE INDEX SHARECLASS_XREF_CODES_INDEX
ON reference_data.SHARECLASS_XREF_CODES (assetid, asofdate);

CREATE TABLE reference_data.cross_reference_codes
(
    cross_ref_type_id integer NOT NULL,
    create_timestamp timestamp without time zone,
    cross_ref_type_name character varying(255) COLLATE pg_catalog."default",
    definition text COLLATE pg_catalog."default",
    status boolean,
    update_timestamp timestamp without time zone,
    xpath character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT cross_reference_codes_pkey PRIMARY KEY (cross_ref_type_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE reference_data.cross_reference_codes
    OWNER to postgres;