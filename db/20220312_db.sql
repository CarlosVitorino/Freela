--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

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
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: client; Type: TABLE; Schema: public; Owner: bodylanguage
--

CREATE TABLE public.client (
    id integer NOT NULL,
    uid uuid DEFAULT public.uuid_generate_v4(),
    user_id integer DEFAULT 0,
    group_id integer DEFAULT 0,
    lastchange_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    lastchange_user_id integer DEFAULT 0,
    active boolean DEFAULT true,
    lock boolean DEFAULT false,
    "user" integer DEFAULT 0,
    email character varying(250) DEFAULT ''::character varying,
    name character varying(250) DEFAULT ''::character varying,
    recovery_key character varying(250) DEFAULT ''::character varying,
    recovery_limit timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    photo character varying(250) DEFAULT ''::character varying,
    default_price numeric DEFAULT 0.0,
    session_duration integer DEFAULT 0,
    phone_number character varying(250) DEFAULT ''::character varying,
    start_date date DEFAULT CURRENT_DATE,
    sessions_per_month integer DEFAULT 0,
    default_session_type_id integer DEFAULT 0,
    default_session_sub_type_id integer DEFAULT 0,
    client_user_id integer DEFAULT 0,
    is_company boolean DEFAULT false,
    vat character varying(250) DEFAULT ''::character varying,
    website character varying(250) DEFAULT ''::character varying,
    legal_name character varying(250) DEFAULT ''::character varying
);


ALTER TABLE public.client OWNER TO bodylanguage;

--
-- Name: client_id; Type: SEQUENCE; Schema: public; Owner: bodylanguage
--

CREATE SEQUENCE public.client_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.client_id OWNER TO bodylanguage;

--
-- Name: client_user; Type: TABLE; Schema: public; Owner: bodylanguage
--

CREATE TABLE public.client_user (
    id integer NOT NULL,
    uid uuid DEFAULT public.uuid_generate_v4(),
    user_id integer DEFAULT 0,
    group_id integer DEFAULT 0,
    lastchange_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    lastchange_user_id integer DEFAULT 0,
    active boolean DEFAULT true,
    lock boolean DEFAULT false,
    recovery_key character varying(250) DEFAULT ''::character varying,
    recovery_limit timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    client_user_id integer DEFAULT 0,
    name character varying(250) DEFAULT ''::character varying,
    email character varying(250) DEFAULT ''::character varying,
    "user" integer DEFAULT 0
);


ALTER TABLE public.client_user OWNER TO bodylanguage;

--
-- Name: client_user_id; Type: SEQUENCE; Schema: public; Owner: bodylanguage
--

CREATE SEQUENCE public.client_user_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.client_user_id OWNER TO bodylanguage;

--
-- Name: document_session; Type: TABLE; Schema: public; Owner: bodylanguage
--

CREATE TABLE public.document_session (
    id integer NOT NULL,
    uid uuid DEFAULT public.uuid_generate_v4(),
    user_id integer DEFAULT 0,
    group_id integer DEFAULT 0,
    lastchange_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    lastchange_user_id integer DEFAULT 0,
    active boolean DEFAULT true,
    lock boolean DEFAULT false,
    client_user_id integer DEFAULT 0
);


ALTER TABLE public.document_session OWNER TO bodylanguage;

--
-- Name: document_session_id; Type: SEQUENCE; Schema: public; Owner: bodylanguage
--

CREATE SEQUENCE public.document_session_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.document_session_id OWNER TO bodylanguage;

--
-- Name: finance; Type: TABLE; Schema: public; Owner: bodylanguage
--

CREATE TABLE public.finance (
    id integer NOT NULL,
    uid uuid DEFAULT public.uuid_generate_v4(),
    user_id integer DEFAULT 0,
    group_id integer DEFAULT 0,
    lastchange_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    lastchange_user_id integer DEFAULT 0,
    active boolean DEFAULT true,
    lock boolean DEFAULT false,
    client_id integer DEFAULT 0,
    pay_day date DEFAULT CURRENT_DATE,
    sessions text DEFAULT ''::text,
    total_amount numeric DEFAULT 0.0,
    billing_period character varying(250) DEFAULT ''::character varying,
    created_at date DEFAULT CURRENT_DATE,
    status_id integer DEFAULT 0,
    description character varying(250) DEFAULT ''::character varying,
    provider_id integer DEFAULT 0,
    paid_at date DEFAULT CURRENT_DATE,
    company_id integer DEFAULT 0,
    client_user_id integer DEFAULT 0
);


ALTER TABLE public.finance OWNER TO bodylanguage;

--
-- Name: finance_id; Type: SEQUENCE; Schema: public; Owner: bodylanguage
--

CREATE SEQUENCE public.finance_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.finance_id OWNER TO bodylanguage;

--
-- Name: fitness_data; Type: TABLE; Schema: public; Owner: bodylanguage
--

CREATE TABLE public.fitness_data (
    id integer NOT NULL,
    uid uuid DEFAULT public.uuid_generate_v4(),
    user_id integer DEFAULT 0,
    group_id integer DEFAULT 0,
    lastchange_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    lastchange_user_id integer DEFAULT 0,
    active boolean DEFAULT true,
    lock boolean DEFAULT false,
    gender character varying(250) DEFAULT ''::character varying,
    weight numeric DEFAULT 0.0,
    height numeric DEFAULT 0.0,
    goals text DEFAULT ''::text,
    likes text DEFAULT ''::text,
    dislikes text DEFAULT ''::text,
    injuries_conditions text DEFAULT ''::text,
    age integer DEFAULT 0,
    client_id integer DEFAULT 0,
    client_user_id integer DEFAULT 0
);


ALTER TABLE public.fitness_data OWNER TO bodylanguage;

--
-- Name: fitness_data_id; Type: SEQUENCE; Schema: public; Owner: bodylanguage
--

CREATE SEQUENCE public.fitness_data_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fitness_data_id OWNER TO bodylanguage;

--
-- Name: language_data; Type: TABLE; Schema: public; Owner: bodylanguage
--

CREATE TABLE public.language_data (
    id integer NOT NULL,
    uid uuid DEFAULT public.uuid_generate_v4(),
    user_id integer DEFAULT 0,
    group_id integer DEFAULT 0,
    lastchange_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    lastchange_user_id integer DEFAULT 0,
    active boolean DEFAULT true,
    lock boolean DEFAULT false,
    client_user_id integer DEFAULT 0
);


ALTER TABLE public.language_data OWNER TO bodylanguage;

--
-- Name: language_data_id; Type: SEQUENCE; Schema: public; Owner: bodylanguage
--

CREATE SEQUENCE public.language_data_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.language_data_id OWNER TO bodylanguage;

--
-- Name: netuno_app; Type: TABLE; Schema: public; Owner: bodylanguage
--

CREATE TABLE public.netuno_app (
    id integer NOT NULL,
    uid uuid DEFAULT public.uuid_generate_v4(),
    name character varying(250) DEFAULT ''::character varying,
    config text DEFAULT ''::text,
    extra text DEFAULT ''::text
);


ALTER TABLE public.netuno_app OWNER TO bodylanguage;

--
-- Name: netuno_app_id; Type: SEQUENCE; Schema: public; Owner: bodylanguage
--

CREATE SEQUENCE public.netuno_app_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.netuno_app_id OWNER TO bodylanguage;

--
-- Name: netuno_app_meta; Type: TABLE; Schema: public; Owner: bodylanguage
--

CREATE TABLE public.netuno_app_meta (
    id integer NOT NULL,
    uid uuid DEFAULT public.uuid_generate_v4(),
    key character varying(250) DEFAULT ''::character varying,
    value text DEFAULT ''::text
);


ALTER TABLE public.netuno_app_meta OWNER TO bodylanguage;

--
-- Name: netuno_app_meta_id; Type: SEQUENCE; Schema: public; Owner: bodylanguage
--

CREATE SEQUENCE public.netuno_app_meta_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.netuno_app_meta_id OWNER TO bodylanguage;

--
-- Name: netuno_app_table; Type: TABLE; Schema: public; Owner: bodylanguage
--

CREATE TABLE public.netuno_app_table (
    id integer NOT NULL,
    uid uuid DEFAULT public.uuid_generate_v4(),
    app_id integer DEFAULT 0,
    table_id integer DEFAULT 0
);


ALTER TABLE public.netuno_app_table OWNER TO bodylanguage;

--
-- Name: netuno_app_table_id; Type: SEQUENCE; Schema: public; Owner: bodylanguage
--

CREATE SEQUENCE public.netuno_app_table_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.netuno_app_table_id OWNER TO bodylanguage;

--
-- Name: netuno_auth_jwt_token; Type: TABLE; Schema: public; Owner: bodylanguage
--

CREATE TABLE public.netuno_auth_jwt_token (
    id integer NOT NULL,
    uid uuid DEFAULT public.uuid_generate_v4(),
    user_id integer DEFAULT 0,
    access_token text DEFAULT ''::text,
    refresh_token text DEFAULT ''::text,
    created timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    access_expires timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    refresh_expires timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    active boolean DEFAULT true
);


ALTER TABLE public.netuno_auth_jwt_token OWNER TO bodylanguage;

--
-- Name: netuno_auth_jwt_token_id; Type: SEQUENCE; Schema: public; Owner: bodylanguage
--

CREATE SEQUENCE public.netuno_auth_jwt_token_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.netuno_auth_jwt_token_id OWNER TO bodylanguage;

--
-- Name: netuno_client; Type: TABLE; Schema: public; Owner: bodylanguage
--

CREATE TABLE public.netuno_client (
    id integer NOT NULL,
    uid uuid DEFAULT public.uuid_generate_v4(),
    name character varying(250) DEFAULT ''::character varying,
    token character varying(250) DEFAULT ''::character varying,
    secret character varying(250) DEFAULT ''::character varying,
    active boolean DEFAULT true
);


ALTER TABLE public.netuno_client OWNER TO bodylanguage;

--
-- Name: netuno_client_hit; Type: TABLE; Schema: public; Owner: bodylanguage
--

CREATE TABLE public.netuno_client_hit (
    id integer NOT NULL,
    uid uuid DEFAULT public.uuid_generate_v4(),
    client_id integer DEFAULT 0,
    user_id integer DEFAULT 0,
    moment timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.netuno_client_hit OWNER TO bodylanguage;

--
-- Name: netuno_client_hit_id; Type: SEQUENCE; Schema: public; Owner: bodylanguage
--

CREATE SEQUENCE public.netuno_client_hit_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.netuno_client_hit_id OWNER TO bodylanguage;

--
-- Name: netuno_client_id; Type: SEQUENCE; Schema: public; Owner: bodylanguage
--

CREATE SEQUENCE public.netuno_client_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.netuno_client_id OWNER TO bodylanguage;

--
-- Name: netuno_design; Type: TABLE; Schema: public; Owner: bodylanguage
--

CREATE TABLE public.netuno_design (
    id integer NOT NULL,
    uid uuid DEFAULT public.uuid_generate_v4(),
    table_id integer DEFAULT 0,
    name character varying(250) DEFAULT ''::character varying,
    displayname character varying(250) DEFAULT ''::character varying,
    description text,
    x integer DEFAULT 0,
    y integer DEFAULT 0,
    type character varying(50) DEFAULT ''::character varying,
    width integer DEFAULT 0,
    height integer DEFAULT 0,
    max integer DEFAULT 0,
    min integer DEFAULT 0,
    colspan integer DEFAULT 0,
    rowspan integer DEFAULT 0,
    tdwidth integer DEFAULT 0,
    tdheight integer DEFAULT 0,
    "notnull" boolean DEFAULT false,
    primarykey boolean DEFAULT false,
    whenresult boolean DEFAULT true,
    whenfilter boolean DEFAULT true,
    whenedit boolean DEFAULT true,
    whenview boolean DEFAULT true,
    whennew boolean DEFAULT true,
    whenexport boolean DEFAULT true,
    user_id integer DEFAULT 0,
    group_id integer DEFAULT 0,
    view_user_id integer DEFAULT 0,
    view_group_id integer DEFAULT 0,
    edit_user_id integer DEFAULT 0,
    edit_group_id integer DEFAULT 0,
    properties text DEFAULT ''::text,
    firebase character varying(250) DEFAULT ''::character varying
);


ALTER TABLE public.netuno_design OWNER TO bodylanguage;

--
-- Name: netuno_design_id; Type: SEQUENCE; Schema: public; Owner: bodylanguage
--

CREATE SEQUENCE public.netuno_design_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.netuno_design_id OWNER TO bodylanguage;

--
-- Name: netuno_group; Type: TABLE; Schema: public; Owner: bodylanguage
--

CREATE TABLE public.netuno_group (
    id integer NOT NULL,
    uid uuid DEFAULT public.uuid_generate_v4(),
    name character varying(250) DEFAULT ''::character varying,
    netuno_group integer DEFAULT 0,
    active boolean DEFAULT true,
    report text DEFAULT ''::text,
    code character varying(250) DEFAULT ''::character varying,
    mail character varying(250) DEFAULT ''::character varying,
    config text DEFAULT ''::text,
    extra text DEFAULT ''::text
);


ALTER TABLE public.netuno_group OWNER TO bodylanguage;

--
-- Name: netuno_group_id; Type: SEQUENCE; Schema: public; Owner: bodylanguage
--

CREATE SEQUENCE public.netuno_group_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.netuno_group_id OWNER TO bodylanguage;

--
-- Name: netuno_group_rule; Type: TABLE; Schema: public; Owner: bodylanguage
--

CREATE TABLE public.netuno_group_rule (
    id integer NOT NULL,
    uid uuid DEFAULT public.uuid_generate_v4(),
    group_id integer DEFAULT 0,
    table_id integer DEFAULT 0,
    active boolean DEFAULT true,
    rule_read integer DEFAULT 0,
    rule_write integer DEFAULT 0,
    rule_delete integer DEFAULT 0
);


ALTER TABLE public.netuno_group_rule OWNER TO bodylanguage;

--
-- Name: netuno_group_rule_id; Type: SEQUENCE; Schema: public; Owner: bodylanguage
--

CREATE SEQUENCE public.netuno_group_rule_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.netuno_group_rule_id OWNER TO bodylanguage;

--
-- Name: netuno_log; Type: TABLE; Schema: public; Owner: bodylanguage
--

CREATE TABLE public.netuno_log (
    id integer NOT NULL,
    uid uuid DEFAULT public.uuid_generate_v4(),
    user_id integer DEFAULT 0,
    group_id integer DEFAULT 0,
    moment timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    action integer DEFAULT 0,
    table_id integer DEFAULT 0,
    item_id integer DEFAULT 0,
    data text DEFAULT ''::text
);


ALTER TABLE public.netuno_log OWNER TO bodylanguage;

--
-- Name: netuno_log_id; Type: SEQUENCE; Schema: public; Owner: bodylanguage
--

CREATE SEQUENCE public.netuno_log_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.netuno_log_id OWNER TO bodylanguage;

--
-- Name: netuno_statistic_average; Type: TABLE; Schema: public; Owner: bodylanguage
--

CREATE TABLE public.netuno_statistic_average (
    id integer NOT NULL,
    uid uuid DEFAULT public.uuid_generate_v4(),
    type_id integer DEFAULT 0,
    average_type_id integer DEFAULT 0,
    moment timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    average integer DEFAULT 0
);


ALTER TABLE public.netuno_statistic_average OWNER TO bodylanguage;

--
-- Name: netuno_statistic_average_id; Type: SEQUENCE; Schema: public; Owner: bodylanguage
--

CREATE SEQUENCE public.netuno_statistic_average_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.netuno_statistic_average_id OWNER TO bodylanguage;

--
-- Name: netuno_statistic_average_type; Type: TABLE; Schema: public; Owner: bodylanguage
--

CREATE TABLE public.netuno_statistic_average_type (
    id integer NOT NULL,
    uid uuid DEFAULT public.uuid_generate_v4(),
    code character varying(250) DEFAULT ''::character varying
);


ALTER TABLE public.netuno_statistic_average_type OWNER TO bodylanguage;

--
-- Name: netuno_statistic_average_type_id; Type: SEQUENCE; Schema: public; Owner: bodylanguage
--

CREATE SEQUENCE public.netuno_statistic_average_type_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.netuno_statistic_average_type_id OWNER TO bodylanguage;

--
-- Name: netuno_statistic_moment; Type: TABLE; Schema: public; Owner: bodylanguage
--

CREATE TABLE public.netuno_statistic_moment (
    id integer NOT NULL,
    uid uuid DEFAULT public.uuid_generate_v4(),
    type_id integer DEFAULT 0,
    moment timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    count integer DEFAULT 0
);


ALTER TABLE public.netuno_statistic_moment OWNER TO bodylanguage;

--
-- Name: netuno_statistic_moment_id; Type: SEQUENCE; Schema: public; Owner: bodylanguage
--

CREATE SEQUENCE public.netuno_statistic_moment_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.netuno_statistic_moment_id OWNER TO bodylanguage;

--
-- Name: netuno_statistic_type; Type: TABLE; Schema: public; Owner: bodylanguage
--

CREATE TABLE public.netuno_statistic_type (
    id integer NOT NULL,
    uid uuid DEFAULT public.uuid_generate_v4(),
    code character varying(250) DEFAULT ''::character varying
);


ALTER TABLE public.netuno_statistic_type OWNER TO bodylanguage;

--
-- Name: netuno_statistic_type_id; Type: SEQUENCE; Schema: public; Owner: bodylanguage
--

CREATE SEQUENCE public.netuno_statistic_type_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.netuno_statistic_type_id OWNER TO bodylanguage;

--
-- Name: netuno_table; Type: TABLE; Schema: public; Owner: bodylanguage
--

CREATE TABLE public.netuno_table (
    id integer NOT NULL,
    uid uuid DEFAULT public.uuid_generate_v4(),
    name character varying(250) DEFAULT ''::character varying,
    displayname character varying(250) DEFAULT ''::character varying,
    description text,
    user_id integer DEFAULT 0,
    group_id integer DEFAULT 0,
    js text,
    report boolean DEFAULT false,
    show_id boolean DEFAULT true,
    control_active boolean DEFAULT true,
    control_user boolean DEFAULT false,
    control_group boolean DEFAULT false,
    export_xls boolean DEFAULT true,
    export_xml boolean DEFAULT true,
    export_json boolean DEFAULT true,
    export_id boolean DEFAULT true,
    export_uid boolean DEFAULT true,
    export_lastchange boolean DEFAULT true,
    big boolean DEFAULT false,
    parent_id integer DEFAULT 0,
    reorder integer DEFAULT 0,
    firebase character varying(250) DEFAULT ''::character varying
);


ALTER TABLE public.netuno_table OWNER TO bodylanguage;

--
-- Name: netuno_table_id; Type: SEQUENCE; Schema: public; Owner: bodylanguage
--

CREATE SEQUENCE public.netuno_table_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.netuno_table_id OWNER TO bodylanguage;

--
-- Name: netuno_user; Type: TABLE; Schema: public; Owner: bodylanguage
--

CREATE TABLE public.netuno_user (
    id integer NOT NULL,
    uid uuid DEFAULT public.uuid_generate_v4(),
    name character varying(250) DEFAULT ''::character varying,
    group_id integer DEFAULT 0,
    "user" character varying(250) DEFAULT ''::character varying,
    pass character varying(250) DEFAULT ''::character varying,
    active boolean DEFAULT true,
    report text DEFAULT ''::text,
    code character varying(250) DEFAULT ''::character varying,
    mail character varying(250) DEFAULT ''::character varying,
    config text DEFAULT ''::text,
    extra text DEFAULT ''::text
);


ALTER TABLE public.netuno_user OWNER TO bodylanguage;

--
-- Name: netuno_user_id; Type: SEQUENCE; Schema: public; Owner: bodylanguage
--

CREATE SEQUENCE public.netuno_user_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.netuno_user_id OWNER TO bodylanguage;

--
-- Name: netuno_user_rule; Type: TABLE; Schema: public; Owner: bodylanguage
--

CREATE TABLE public.netuno_user_rule (
    id integer NOT NULL,
    uid uuid DEFAULT public.uuid_generate_v4(),
    user_id integer DEFAULT 0,
    table_id integer DEFAULT 0,
    active boolean DEFAULT true,
    rule_read integer DEFAULT 0,
    rule_write integer DEFAULT 0,
    rule_delete integer DEFAULT 0
);


ALTER TABLE public.netuno_user_rule OWNER TO bodylanguage;

--
-- Name: netuno_user_rule_id; Type: SEQUENCE; Schema: public; Owner: bodylanguage
--

CREATE SEQUENCE public.netuno_user_rule_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.netuno_user_rule_id OWNER TO bodylanguage;

--
-- Name: payment_status; Type: TABLE; Schema: public; Owner: bodylanguage
--

CREATE TABLE public.payment_status (
    id integer NOT NULL,
    uid uuid DEFAULT public.uuid_generate_v4(),
    user_id integer DEFAULT 0,
    group_id integer DEFAULT 0,
    lastchange_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    lastchange_user_id integer DEFAULT 0,
    active boolean DEFAULT true,
    lock boolean DEFAULT false,
    name character varying(250) DEFAULT ''::character varying,
    code character varying(250) DEFAULT ''::character varying
);


ALTER TABLE public.payment_status OWNER TO bodylanguage;

--
-- Name: payment_status_id; Type: SEQUENCE; Schema: public; Owner: bodylanguage
--

CREATE SEQUENCE public.payment_status_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_status_id OWNER TO bodylanguage;

--
-- Name: provider; Type: TABLE; Schema: public; Owner: bodylanguage
--

CREATE TABLE public.provider (
    id integer NOT NULL,
    uid uuid DEFAULT public.uuid_generate_v4(),
    user_id integer DEFAULT 0,
    group_id integer DEFAULT 0,
    lastchange_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    lastchange_user_id integer DEFAULT 0,
    active boolean DEFAULT true,
    lock boolean DEFAULT false,
    label character varying(250) DEFAULT ''::character varying,
    value character varying(250) DEFAULT ''::character varying,
    client_user_id integer DEFAULT 0
);


ALTER TABLE public.provider OWNER TO bodylanguage;

--
-- Name: provider_id; Type: SEQUENCE; Schema: public; Owner: bodylanguage
--

CREATE SEQUENCE public.provider_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.provider_id OWNER TO bodylanguage;

--
-- Name: session; Type: TABLE; Schema: public; Owner: bodylanguage
--

CREATE TABLE public.session (
    id integer NOT NULL,
    uid uuid DEFAULT public.uuid_generate_v4(),
    user_id integer DEFAULT 0,
    group_id integer DEFAULT 0,
    lastchange_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    lastchange_user_id integer DEFAULT 0,
    active boolean DEFAULT true,
    lock boolean DEFAULT false,
    client_id integer DEFAULT 0,
    duration integer DEFAULT 0,
    price numeric DEFAULT 0.0,
    type_id integer DEFAULT 0,
    date date DEFAULT CURRENT_DATE,
    sub_type_id integer DEFAULT 0,
    client_user_id integer DEFAULT 0
);


ALTER TABLE public.session OWNER TO bodylanguage;

--
-- Name: session_id; Type: SEQUENCE; Schema: public; Owner: bodylanguage
--

CREATE SEQUENCE public.session_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.session_id OWNER TO bodylanguage;

--
-- Name: session_payment; Type: TABLE; Schema: public; Owner: bodylanguage
--

CREATE TABLE public.session_payment (
    id integer NOT NULL,
    uid uuid DEFAULT public.uuid_generate_v4(),
    user_id integer DEFAULT 0,
    group_id integer DEFAULT 0,
    lastchange_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    lastchange_user_id integer DEFAULT 0,
    active boolean DEFAULT true,
    lock boolean DEFAULT false,
    client_user_id integer DEFAULT 0
);


ALTER TABLE public.session_payment OWNER TO bodylanguage;

--
-- Name: session_payment_id; Type: SEQUENCE; Schema: public; Owner: bodylanguage
--

CREATE SEQUENCE public.session_payment_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.session_payment_id OWNER TO bodylanguage;

--
-- Name: session_sub_type; Type: TABLE; Schema: public; Owner: bodylanguage
--

CREATE TABLE public.session_sub_type (
    id integer NOT NULL,
    uid uuid DEFAULT public.uuid_generate_v4(),
    user_id integer DEFAULT 0,
    group_id integer DEFAULT 0,
    lastchange_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    lastchange_user_id integer DEFAULT 0,
    active boolean DEFAULT true,
    lock boolean DEFAULT false,
    label character varying(250) DEFAULT ''::character varying,
    value character varying(250) DEFAULT ''::character varying,
    type_id integer DEFAULT 0,
    client_user_id integer DEFAULT 0,
    description text DEFAULT ''::text
);


ALTER TABLE public.session_sub_type OWNER TO bodylanguage;

--
-- Name: session_sub_type_id; Type: SEQUENCE; Schema: public; Owner: bodylanguage
--

CREATE SEQUENCE public.session_sub_type_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.session_sub_type_id OWNER TO bodylanguage;

--
-- Name: session_type; Type: TABLE; Schema: public; Owner: bodylanguage
--

CREATE TABLE public.session_type (
    id integer NOT NULL,
    uid uuid DEFAULT public.uuid_generate_v4(),
    user_id integer DEFAULT 0,
    group_id integer DEFAULT 0,
    lastchange_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    lastchange_user_id integer DEFAULT 0,
    active boolean DEFAULT true,
    lock boolean DEFAULT false,
    value character varying(250) DEFAULT ''::character varying,
    label character varying(250) DEFAULT ''::character varying,
    client_user_id integer DEFAULT 0,
    description text DEFAULT ''::text
);


ALTER TABLE public.session_type OWNER TO bodylanguage;

--
-- Name: session_type_id; Type: SEQUENCE; Schema: public; Owner: bodylanguage
--

CREATE SEQUENCE public.session_type_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.session_type_id OWNER TO bodylanguage;

--
-- Name: supplier; Type: TABLE; Schema: public; Owner: bodylanguage
--

CREATE TABLE public.supplier (
    id integer NOT NULL,
    uid uuid DEFAULT public.uuid_generate_v4(),
    user_id integer DEFAULT 0,
    group_id integer DEFAULT 0,
    lastchange_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    lastchange_user_id integer DEFAULT 0,
    active boolean DEFAULT true,
    lock boolean DEFAULT false,
    name character varying(250) DEFAULT ''::character varying,
    legal_name character varying(250) DEFAULT ''::character varying,
    vat character varying(250) DEFAULT ''::character varying,
    website character varying(250) DEFAULT ''::character varying,
    email character varying(250) DEFAULT ''::character varying,
    phone character varying(250) DEFAULT ''::character varying,
    client_user_id integer DEFAULT 0
);


ALTER TABLE public.supplier OWNER TO bodylanguage;

--
-- Name: supplier_id; Type: SEQUENCE; Schema: public; Owner: bodylanguage
--

CREATE SEQUENCE public.supplier_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.supplier_id OWNER TO bodylanguage;

--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: bodylanguage
--

COPY public.client (id, uid, user_id, group_id, lastchange_time, lastchange_user_id, active, lock, "user", email, name, recovery_key, recovery_limit, photo, default_price, session_duration, phone_number, start_date, sessions_per_month, default_session_type_id, default_session_sub_type_id, client_user_id, is_company, vat, website, legal_name) FROM stdin;
16	fdacaf7b-6dfd-4dc7-80a4-42aa9d5f1638	1	1	2022-03-05 16:58:19.748758	1	t	f	0	maria@gmail.com	Maria		\N		30.0	45	964324322	2022-03-05	3	1	6	0	f			
12	738d43b1-ee64-447c-a96d-e16afdf2c08e	3	3	2022-03-05 18:23:51.446988	1	t	f	0	tiina.rinatamaeki@gmail.com	Tiina R.		\N		30.0	59	9543545454	2022-02-26	0	1	7	0	f			
14	280cb2ab-19b3-4b93-801a-555db4163fd2	3	3	2022-03-05 18:24:18.773916	1	t	f	0	carlos.vitorino@sitana.pt	Carlos Vitorino		\N		30.0	45	966466572	2022-03-01	4	2	3	0	f			
17	3c2f307b-1b26-407d-bcfa-be0018b035b4	5	3	2022-03-09 20:13:51.710467	5	t	f	0	maria.atleta@tester.pt	Maria atleta		\N		25.0	50	99494949	2022-03-01	4	1	5	5	f			
18	29ec95c4-5238-44bd-8ede-9a0004db6315	5	3	2022-03-09 20:34:52.997349	5	t	f	0	zemanel@email.pt	Zé Emanuel da Silva		\N		20.0	40	32131231	2022-01-01	2	3	1	5	f			
20	cc68c098-bd3d-4906-83b5-59c8894a2529	6	3	2022-03-10 14:54:49.731577	6	t	f	0	carlos.duartv@gmail.com	Carlos VItorino		\N		50.0	30	966466572	2022-01-01	4	0	0	6	f			
21	99bb313f-f416-4797-a5ef-42112f79acee	0	0	2022-03-12 11:51:52.498324	0	t	f	0	contacto@solinca.pt	Solinca		\N		12.5	30	930 574 174	\N	4	0	0	0	t	505200597	https://www.solinca.pt/	Solinca Classic, S.A
22	0d770d6a-8576-49b6-896a-21fb8f0cc2b5	5	3	2022-03-12 12:32:36.077445	5	t	f	0	info@solinca.pt	Solinca		\N		0	0	966454454	\N	0	0	0	5	t	1231232131		Solinca
\.


--
-- Data for Name: client_user; Type: TABLE DATA; Schema: public; Owner: bodylanguage
--

COPY public.client_user (id, uid, user_id, group_id, lastchange_time, lastchange_user_id, active, lock, recovery_key, recovery_limit, client_user_id, name, email, "user") FROM stdin;
3	f9d7f8c5-ec2f-4af2-9d57-66e66a5d58db	5	3	2022-03-09 20:52:42.033802	5	t	f		\N	6			0
4	f0a4b5a8-2106-45e8-9bac-01392449c136	6	3	2022-03-10 23:05:51.50587	6	t	f		\N	7			0
5	e191fc92-4a6f-437b-873a-5fd1bda3b2ea	1	1	2022-03-12 11:57:17.29161	1	t	f		\N	8	Mario Gonçalves	mario.goncalves@mail.com	0
2	b009d54b-626d-4196-9590-2aba1bff137a	1	1	2022-03-12 11:59:00.918063	1	t	f		\N	5	Carlos Vitorino	carlos.duartv@gmail.com	5
\.


--
-- Data for Name: document_session; Type: TABLE DATA; Schema: public; Owner: bodylanguage
--

COPY public.document_session (id, uid, user_id, group_id, lastchange_time, lastchange_user_id, active, lock, client_user_id) FROM stdin;
\.


--
-- Data for Name: finance; Type: TABLE DATA; Schema: public; Owner: bodylanguage
--

COPY public.finance (id, uid, user_id, group_id, lastchange_time, lastchange_user_id, active, lock, client_id, pay_day, sessions, total_amount, billing_period, created_at, status_id, description, provider_id, paid_at, company_id, client_user_id) FROM stdin;
48	41146591-42ea-4660-8258-cc0d0b20720e	3	3	2022-03-09 16:22:16.054271	3	t	f	0	\N		-500.0		2022-03-05	2	compras	0	2022-03-09	1	0
59	c0a2e0ff-f693-4cd8-9953-15d1c49018ea	5	3	2022-03-09 20:50:24.662463	5	t	f	17	2022-03-01	[89]	25.0	2022-02-01 - 2022-03-01	2022-03-09	1		0	\N	0	5
33	20d856c8-3805-4695-86c5-a95a2ae22181	1	1	2022-03-04 18:33:07.227041	1	t	f	14	2022-03-31	[65,61,62,63,64]	62.5	2022-02-01 - 2022-02-28	2022-03-04	2		0	2022-03-04	0	0
60	942d60bb-aa11-4437-ae8b-2a77ad01a61b	5	3	2022-03-09 20:50:43.933034	5	t	f	18	2022-03-01	[88]	20.0	2022-03-01 - 2022-03-05	2022-03-09	1		0	\N	0	5
61	0a30f24e-8390-4411-940f-1f1803782c42	5	3	2022-03-09 20:51:48.004891	5	t	f	0	\N		-100.0		2022-03-09	2	Renda	0	2022-03-01	2	5
62	5d106b84-fa50-4cd7-93c4-1142f6914d2c	6	3	2022-03-10 18:45:59.418093	6	t	f	20	2022-03-31	[90,91]	100.0	2022-03-01 - 2022-03-10	2022-03-10	1		0	\N	0	6
63	70fd54ee-431c-49e9-a778-c19b07f22e2e	5	3	2022-03-11 20:19:14.858381	5	t	f	0	\N		-58.0		2022-03-11	2	blabla	0	2022-03-11	0	5
64	4288d79e-5955-427c-b20a-e253a51c45ec	5	3	2022-03-12 12:31:00.661341	5	t	f	17	2022-03-01	[95,92]	50.0	2022-03-01 - 2022-03-31	2022-03-12	1		0	\N	0	5
45	342bbc33-2f45-4d7c-86dc-e45e3a44f402	1	1	2022-03-05 18:25:55.196532	1	t	f	16	2022-03-31	[74,79,78,77,76,73,75]	61.6	2022-03-01 - 2022-03-31	2022-03-05	2		0	2022-03-05	0	0
43	e890aff2-cbe8-47ae-8488-fae5bea129be	1	1	2022-03-05 21:29:09.223843	1	t	f	0	2022-03-05		50.0		2022-03-05	2		2	2022-02-01	3	0
49	f8fdc7af-2d60-4c0c-bed5-26ebc3f710a4	3	3	2022-03-05 21:31:38.924665	3	t	f	0	\N		-400.0		2022-03-05	2	renda	0	2022-03-01	2	0
50	2810933d-d0c1-4bba-967c-730afdb1bd74	3	3	2022-03-05 21:31:51.861903	3	t	f	0	\N		-400.0		2022-03-05	2	renda	0	2022-02-01	2	0
51	feefc7bc-89e9-4854-a612-93ccff317c3b	3	3	2022-03-05 21:32:14.703375	3	t	f	0	\N		-400.0		2022-03-05	2	renda	0	2022-01-01	2	0
52	86591af8-c2cc-49a4-bebd-2ec6f896d36a	3	3	2022-03-05 21:48:19.512564	3	t	f	0	2022-03-31	[68,77,78,79,73,74,75,76]	240.1	2022-03-01 - 2022-03-05	2022-03-05	2		0	\N	2	0
53	66e39d45-e59b-4df2-afab-c99ca99fa340	3	3	2022-03-05 21:49:55.526422	3	t	f	14	2022-03-06	[85]	40.0	2022-03-02 - 2022-03-03	2022-03-05	1		0	\N	0	0
55	f55be37d-4a7c-40db-8252-6f124e03d752	3	3	2022-03-05 21:51:42.019188	3	t	f	0	2022-03-14	[68,77,78,79,73,74,75,76]	240.1	2022-03-30 - 2022-03-31	2022-03-05	2		0	\N	3	0
56	f915b295-fdcc-4854-8302-af8bb48d2f4e	3	3	2022-03-05 21:53:15.47098	3	t	f	0	2022-03-01	[81,68]	60.0	2022-03-01 - 2022-03-05	2022-03-05	1		0	\N	3	0
54	9a2f816c-4874-48d8-b229-045447a03826	3	3	2022-03-05 21:53:39.864494	3	t	f	14	2022-03-13	[85,71,82,84]	130.0	2022-03-01 - 2022-03-31	2022-03-05	2		0	2022-03-05	0	0
\.


--
-- Data for Name: fitness_data; Type: TABLE DATA; Schema: public; Owner: bodylanguage
--

COPY public.fitness_data (id, uid, user_id, group_id, lastchange_time, lastchange_user_id, active, lock, gender, weight, height, goals, likes, dislikes, injuries_conditions, age, client_id, client_user_id) FROM stdin;
7	4e3b2121-4568-4f7b-a4ed-6f50d598c543	1	1	2022-03-05 16:58:19.793921	1	t	f	male	0	0					0	16	0
4	e13e7d82-8182-4469-89ed-9187e68bd5f6	3	3	2022-03-05 18:23:51.502567	1	t	f	female	-0.01	-0.01	2313231	dasdadas	dsadsada	dsadsa	30	12	0
5	14569334-418f-4fbc-b9d3-97624dd381d0	3	3	2022-03-05 18:24:18.810158	1	t	f	male	0.0	0.0	Get fit				0	14	0
3	d8688651-bce9-45ef-9ddf-9a4b303842ec	3	3	2022-03-05 18:25:14.938301	1	t	f	male	-0.01	-0.01	wqeweqw	ewqewqeqw	wewqeqw	asdf	35	8	0
8	d40d7ef4-480f-4d43-a1cd-4283e619c31a	5	3	2022-03-09 20:13:51.792732	5	t	f	female	0	0	tewrewr	rwrew	rewrew	rewrew	24	17	5
9	13eb7169-e31e-43d4-8831-c01d44bfa94b	5	3	2022-03-09 20:34:53.062173	5	t	f	other	0	0					40	18	5
10	c2b8a307-7d30-413a-b752-25af11219491	5	3	2022-03-09 20:40:51.400353	5	t	f		0	0					0	19	5
11	373f35fa-3531-4aef-9585-c8cfbb2ebca2	6	3	2022-03-10 14:54:49.783502	6	t	f		0	0					0	20	6
12	fa914db1-97ae-4121-b4e4-ae0d9d54eaf3	0	0	2022-03-12 11:51:52.54179	0	t	f		0.0	0.0					0	21	0
13	df18bf14-9aa4-434b-9b2c-42646f5fe25d	5	3	2022-03-12 12:32:36.107297	5	t	f		0	0					0	22	5
\.


--
-- Data for Name: language_data; Type: TABLE DATA; Schema: public; Owner: bodylanguage
--

COPY public.language_data (id, uid, user_id, group_id, lastchange_time, lastchange_user_id, active, lock, client_user_id) FROM stdin;
\.


--
-- Data for Name: netuno_app; Type: TABLE DATA; Schema: public; Owner: bodylanguage
--

COPY public.netuno_app (id, uid, name, config, extra) FROM stdin;
1	d9a5ea5d-5545-4659-b453-473124c4ca93	bodylanguage		
2	fdf1e352-117c-4f46-936d-bc08107a13e3	bodylanguageapp		
\.


--
-- Data for Name: netuno_app_meta; Type: TABLE DATA; Schema: public; Owner: bodylanguage
--

COPY public.netuno_app_meta (id, uid, key, value) FROM stdin;
\.


--
-- Data for Name: netuno_app_table; Type: TABLE DATA; Schema: public; Owner: bodylanguage
--

COPY public.netuno_app_table (id, uid, app_id, table_id) FROM stdin;
\.


--
-- Data for Name: netuno_auth_jwt_token; Type: TABLE DATA; Schema: public; Owner: bodylanguage
--

COPY public.netuno_auth_jwt_token (id, uid, user_id, access_token, refresh_token, created, access_expires, refresh_expires, active) FROM stdin;
1	6a120582-e83b-45f6-a3cd-112f9559ae35	3	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNmExMjA1ODItZTgzYi00NWY2LWEzY2QtMTEyZjk1NTlhZTM1IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.cK3ne_pity1tA4QIR137A7JVQNCAb9qlCbStlw-npVTVglFPwjm4mqt2_qNoMB4dvOp5qIQbzxaB2rcy3n3KeA	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiZWY0YmY0ZDItYWJkZS00NDU5LTk1YTMtYjZlZDVhZWU2M2E4IiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjZhMTIwNTgyLWU4M2ItNDVmNi1hM2NkLTExMmY5NTU5YWUzNSJ9.mtDHMfZmYPDOaYv1aFrfcQ5oM4JnlBEk608F6lfqZFTm0yvTGC_926E7Vidvnz46wikayjeLDdvq2rBhKCCezQ	2022-02-25 22:48:23.511286	2022-02-25 23:48:23.511649	2022-02-26 22:48:23.51932	t
6	7093eabd-c82d-4610-8888-eab1236a991a	5	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNzA5M2VhYmQtYzgyZC00NjEwLTg4ODgtZWFiMTIzNmE5OTFhIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.A1KM_PA18hEWN58F6XKdFNvpFBWUJby_X8uzGVArTq2jjhJBIjFd5911LZgKOQ9Ie3ZTiowbiyuz9h75wD7WYw	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiZWMzMmU3MWEtNDNhMS00NDVkLWE5NjUtMmY4OWU1NzAxMjVlIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjcwOTNlYWJkLWM4MmQtNDYxMC04ODg4LWVhYjEyMzZhOTkxYSJ9.T2r6Q5gvOrACFNQXY4TwGexiYAktkeD0vJ4oGbMYY8tjEFAIwMAMQL6TkBbbn_laAtt3xbnqxgLReMwv2NGUWg	2022-02-26 08:51:07.303679	2022-02-26 09:51:07.303743	2022-02-27 08:51:07.305868	f
2	ea1e9a31-153c-417e-a61a-4444875b39af	3	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiZWExZTlhMzEtMTUzYy00MTdlLWE2MWEtNDQ0NDg3NWIzOWFmIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.cjIuVHmwP2w38N4QoH79O3Bxu1C1Adc5zyHJvgcMZrAzcx6dDIt_EVy0alNWd1mzCtfi_PurQKrHyBsCgufpaw	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiOTAwMTY4YmItZGViZi00ZTdhLTlkMTItYjBhMGRhYWQ5YmM0IiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImVhMWU5YTMxLTE1M2MtNDE3ZS1hNjFhLTQ0NDQ4NzViMzlhZiJ9.0uhUCy6V9tgEpSHH3GMYxKWc-sHWCrmXQMHkak61y-4bdL2xR7o0vVF7-o2VR3LqSusXAglyo6w9wwjGy08pBw	2022-02-26 01:58:32.976216	2022-02-26 02:58:32.976387	2022-02-27 01:58:32.989137	f
5	4c55507a-d8c3-4a01-ba26-91a03a6ec33a	4	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNGM1NTUwN2EtZDhjMy00YTAxLWJhMjYtOTFhMDNhNmVjMzNhIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.8fWLnaUwpj6KBdKS3DniH8F36xT9V_gCjcJDbXl2lKgGMKdVgGdkhV1fk0Otg79TSc2rB2vON3TtRRQIlR2Cag	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNTE1MGRjY2ItNTk1Zi00YTExLWE1YWEtNGJkZDA0ZTRkMGNlIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjRjNTU1MDdhLWQ4YzMtNGEwMS1iYTI2LTkxYTAzYTZlYzMzYSJ9.xBwd0OmOiiH0_WfIqpqpQSDoWpMYPP-a2NfAvSAtUPADRaMC0wCKxG5zYvq71z8gHcShPRdNJg3QB6U9GU4wVQ	2022-02-26 07:10:27.238826	2022-02-26 08:10:27.23888	2022-02-27 07:10:27.241136	f
3	ede13f75-9be2-4cd3-9628-a6fbfecf8308	2	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiZWRlMTNmNzUtOWJlMi00Y2QzLTk2MjgtYTZmYmZlY2Y4MzA4IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.hD4WSt2OW-In7WQrGR8wGowqVzxOVrB_TfRoYkEWANNRU_dWO0vfaNgB0h-Fbv1HFKw1_-iIfiUpbs631biQRQ	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiM2JiYjNjZWItOWM5Ni00ZDRjLWFiN2QtNmU3NDE4MmI0OWE2IiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImVkZTEzZjc1LTliZTItNGNkMy05NjI4LWE2ZmJmZWNmODMwOCJ9.9eBDg5wsCw1J8BTdOgHoQa6MjZtbf5Vz5TIdSb_vIfE4lhmtQ8oRl4yy2wa-0324WNhPD-CXlSVuilBl2zmKdw	2022-02-26 03:23:06.258725	2022-02-26 04:23:06.25879	2022-02-27 03:23:06.263664	f
4	e6c3bad0-84fb-432d-8d19-34b8ce1d75d8	3	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiZTZjM2JhZDAtODRmYi00MzJkLThkMTktMzRiOGNlMWQ3NWQ4IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.UmsD4wvF6XZWNmFaoZzfncBkiq1NcQX-WzSIoCQ_CNqxXMEynkDWwtuZb2tDhBRbWoJyZvvAgg0LS1_WIQSmSA	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNzBlNmU5N2MtYmUwNC00NGQyLWE3MGItNDQ5MTk0YjAwYjM3IiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImU2YzNiYWQwLTg0ZmItNDMyZC04ZDE5LTM0YjhjZTFkNzVkOCJ9.8nnJR18oZpBtio6IhhVjOYeMFscZWkwGKdC8-zIuW8cCf2JZIK1bMVwD4An45uVauyhaUL0bfLrAXEO66EvKpw	2022-02-26 05:17:33.135788	2022-02-26 06:17:33.135827	2022-02-27 05:17:33.137773	f
8	1d485e8f-7468-4798-b492-dd11c28218ed	7	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMWQ0ODVlOGYtNzQ2OC00Nzk4LWI0OTItZGQxMWMyODIxOGVkIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.uFNQjEx5z_Yvp_Pr5ytVarc8A9obraLGgxyj7UB8WS2UNketFRsw936ZhfpPh5FvZ3N2505wm3x6kNly9GJ24w	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNWVhZmVhZWQtNzUxZS00N2NhLTk4MGMtNzhiNTRmMjQ2NjFkIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjFkNDg1ZThmLTc0NjgtNDc5OC1iNDkyLWRkMTFjMjgyMThlZCJ9.A8E7gXq1WUHHTsRGrS2vh_VH6eV557kI_mGXQ9BSpQRzE6zFnVGWFztqSeRRECt2FNtmpzrLBWjzZO-ccEPkRQ	2022-02-26 11:57:13.759901	2022-02-26 12:57:13.760096	2022-02-27 11:57:13.768362	f
7	3df5b026-f64b-4a8d-8c43-b85c8f75a82d	6	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiM2RmNWIwMjYtZjY0Yi00YThkLThjNDMtYjg1YzhmNzVhODJkIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.m5wTyRoRFN94NVp-zArJk3Jvq98Yyv3YvCWbnYwkZt_OSY8IkbUYH3Hunzfydt2Ppy8zPPClOIzjYmwCjYV6mQ	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYWI3ODQ2ZTktYzZiZi00MTdlLTliZmUtYWU1YjljZDgxODRjIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjNkZjViMDI2LWY2NGItNGE4ZC04YzQzLWI4NWM4Zjc1YTgyZCJ9.kkENrsmh1vXGv6ijEAtstPpa9HiVyWejscLYzeOiKLzCB6v0hUwjExED1TYpEL_DCHpI0lyFgdFuMCnI1-1TEg	2022-02-26 10:39:26.573369	2022-02-26 11:39:26.573408	2022-02-27 10:39:26.575114	f
9	5c4dd802-57e9-4efc-bee1-eba391ea1408	8	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNWM0ZGQ4MDItNTdlOS00ZWZjLWJlZTEtZWJhMzkxZWExNDA4IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.n90TAAF1ILy2jPRCqzK2R5vHih4VCmHz_QiqZ728U2AhbKJzlzr847INNNogXzl4cMasEthPaeRIxszyQzr34g	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiOWYyY2ZhZTYtZTA0Zi00MzMzLTlmZTctNWUyNzMwZWJiYzM2IiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjVjNGRkODAyLTU3ZTktNGVmYy1iZWUxLWViYTM5MWVhMTQwOCJ9.0wX7QTVvUdflIahPs4gk21wTTRr2PtTb2quw5WQDxpWdA0gCjp3mFEomLzzE08m3Hk24MxNxzXfRJyUwGpVhiQ	2022-02-26 13:44:13.037578	2022-02-26 14:44:13.037616	2022-02-27 13:44:13.039174	t
10	20dd406f-6c42-47ad-88b5-e792f255dc8e	3	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMjBkZDQwNmYtNmM0Mi00N2FkLTg4YjUtZTc5MmYyNTVkYzhlIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.sXm-fqdtG7vcnjNKO5pFV0dLOlQnx8ApeqfZgDbCsYtj43ccrab7gxnEysBVlFUNDvsg5-dBeBOJZwt_DwykAA	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNTFmYzFhZjktMTQ5Yy00OWEzLWE0ZTItMjdjY2U4NmIyMTgwIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjIwZGQ0MDZmLTZjNDItNDdhZC04OGI1LWU3OTJmMjU1ZGM4ZSJ9._XfoYy2sNI6Zwv-umuw2boycqOudswtN9tEYaQvv3ojw-UP8Br9DhYwMCmhGWiQJ_s9hw6hs9hzpTugn7uSH5A	2022-02-26 14:45:19.883427	2022-02-26 15:45:19.883481	2022-02-27 14:45:19.886385	t
11	14966e97-8156-4963-af51-327803a203a9	3	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMTQ5NjZlOTctODE1Ni00OTYzLWFmNTEtMzI3ODAzYTIwM2E5IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.A2N8NsF4hEVmkuc_hGZbI8yFYOibbNnN5j8VKY_OEH4CwjiSZ9WqP5cxA_mt3jydauzLW3-0ppG1VL13ADlDtw	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYmUzNDdkMTMtZDk0Ni00ZWFjLThiMzQtMWZjYWNkZWIwM2JjIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjE0OTY2ZTk3LTgxNTYtNDk2My1hZjUxLTMyNzgwM2EyMDNhOSJ9.NLvoETye9ZjFAdoAtS6rnL26t8S4AwRJ4ytBMcRufwnWLbK_CoNmgBWpmEw13av8bhfciJLokT_z_3Lf9bzXtw	2022-02-26 14:45:39.591788	2022-02-26 15:45:39.591829	2022-02-27 14:45:39.597423	t
12	f19fc442-04ba-4014-ab56-5fbe41c6d19e	3	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiZjE5ZmM0NDItMDRiYS00MDE0LWFiNTYtNWZiZTQxYzZkMTllIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.zrXiuI1vIBh_TM21GwNE-s5FwNpkyR51dhsB1OWD_gE3XOlFofNo62hWhX8bkdTSAHG77ko5Ou1YjuMdfwwu3Q	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMTc0NzQ2ZmUtYjVhYy00NWZlLWI5ZGUtYTAxNmU3ZjAwNDE0IiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImYxOWZjNDQyLTA0YmEtNDAxNC1hYjU2LTVmYmU0MWM2ZDE5ZSJ9.ui4Ju7Hd-C_6gja0gdhYjNqrPCur1bA9aYuX5ZLrjooIja08RjX8IuPow1dWl44c5NqvgdilMMZiTRTUuf7pGQ	2022-02-26 15:49:26.717896	2022-02-26 16:49:26.718115	2022-02-27 15:49:26.748709	t
15	702e9422-ab2d-4e16-9586-a0d8b9002ebf	14	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNzAyZTk0MjItYWIyZC00ZTE2LTk1ODYtYTBkOGI5MDAyZWJmIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.8Ipn798ZrQy4LxaVCRyPPX9DShmiajTB8BQD2oOQ0p3tKN3ED7ggza63W8SFKw9OPqQ9Aln1n2rj8VQaMKIh6A	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYzI2OTM4ZmMtODM1Mi00OWVlLTg0NjUtYmY4NTI5MjE3ZWQ2IiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjcwMmU5NDIyLWFiMmQtNGUxNi05NTg2LWEwZDhiOTAwMmViZiJ9.TvQqsGP6POb8dxK2q13FoixMt9zUQmYCCAkctKFWfZjaK6RB1OEDLOl7K1lZaXXdMnirYB3Tf2G35S98VxqQRQ	2022-02-26 20:43:44.598279	2022-02-26 21:43:44.598317	2022-02-27 20:43:44.601175	f
13	ddaf7dc7-4ecf-4c2b-ae16-f37bcc6f72a0	3	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiZGRhZjdkYzctNGVjZi00YzJiLWFlMTYtZjM3YmNjNmY3MmEwIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.b-aDK2ZEQMDVNIYviBhgbPY73XSz3xSD4b4yNF22YbQ-CEjydkZjC3eD9okbXtxWwMqFCka5BPonO_r16Zso9A	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiZjk4NjAwN2EtZGUyNy00ZmI3LTk2ZDAtYzZjMmI4NTcwYzUyIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImRkYWY3ZGM3LTRlY2YtNGMyYi1hZTE2LWYzN2JjYzZmNzJhMCJ9.yJu4sHq5F739KiHPQYrCiQYRduaHFkMUafl0A7OxRo9p0ukepyWUHda9XkoSX439ocpukp3sUl7CMFenmWFXFg	2022-02-26 16:14:44.794631	2022-02-26 17:14:44.794694	2022-02-27 16:14:44.799745	f
14	6802d2aa-ac4c-4ced-956c-4883966290b4	13	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNjgwMmQyYWEtYWM0Yy00Y2VkLTk1NmMtNDg4Mzk2NjI5MGI0IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.tPQbwnk-zIUfyhogreWbCNWRzdCTvr3NRAn5D--8Qd9jXiKKszDWdgldr5VJDvQiI3VltCljyF2b5lq1S4xS6A	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNDUxNmU3NTgtOGQ0ZS00NTYwLWI2ZTYtYjNmMmQ2NWU2ODg4IiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjY4MDJkMmFhLWFjNGMtNGNlZC05NTZjLTQ4ODM5NjYyOTBiNCJ9.yEcK_IinikxDJRRHLEf6Ty51PA5LbkCp1hu1KzDoNO2DWTPK1D0jYv18oS5yaYuiFqBHlOnoaTAkOz6fTKnXfw	2022-02-26 19:31:01.819785	2022-02-26 20:31:01.819862	2022-02-27 19:31:01.834218	f
20	1549b4f2-d3bc-4cde-98d3-ac1d9f95cd5a	19	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMTU0OWI0ZjItZDNiYy00Y2RlLTk4ZDMtYWMxZDlmOTVjZDVhIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.JFRZWUJYQLUd1mv4jc3b7xRLtZ38D-q8qaQr4ReXTrMZPMK9fmetZxuHbvy7pcrA27nBiskqeGi3E_stuzOYmA	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiZTkyNzc1ZTQtNDg1MS00OGFjLWFlNTktZjZjMDlmZWRkODNiIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjE1NDliNGYyLWQzYmMtNGNkZS05OGQzLWFjMWQ5Zjk1Y2Q1YSJ9.e9U31wS795twTwmlFtpun6Qq8UO3G-RJznkL51YNi3YTEhv_xRJU8nPmk9zWf2_SEMjHG_2pcB2B6SmDsFnQqw	2022-02-27 15:41:03.26813	2022-02-27 16:41:03.26818	2022-02-28 15:41:03.282433	f
18	48a5dcbf-216a-4459-b432-70ababd85e78	17	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNDhhNWRjYmYtMjE2YS00NDU5LWI0MzItNzBhYmFiZDg1ZTc4IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.jHX_WEYZcZ11UNSpP_H6FgIroJfcA965svUXJqsVA365E0NZ771kso3IeKLdBBO38a4OHQDZl5t-TqeXrh6ouA	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYjI1YWU5MjYtMmE3Ny00ZDEyLTg3NDktMmZjODlhZjQ2ZDlhIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjQ4YTVkY2JmLTIxNmEtNDQ1OS1iNDMyLTcwYWJhYmQ4NWU3OCJ9.r6TanPevTCZOzojfGvT-V9EugzXTVWxLYQXgFp9Dway9cWEw3WTaHw-jDb1ybIa5Chivq8IlJDZOr2ILo-BdVg	2022-02-27 06:50:54.622729	2022-02-27 07:50:54.622807	2022-02-28 06:50:54.624661	f
16	cef245b7-1755-4f28-854b-22e26fafbbe9	15	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiY2VmMjQ1YjctMTc1NS00ZjI4LTg1NGItMjJlMjZmYWZiYmU5IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.T89KvQTTQNE9oC3mxhg-dFz1ypuANtOk11rmMcgUAHt2czy5dUtOv65iutBtcD6JPe9aonGzeChDXkPXh09C8A	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiODgwMjNkMzItNDVjMC00MDFhLWE5YjItZGI3MjE0NmJiYjgxIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImNlZjI0NWI3LTE3NTUtNGYyOC04NTRiLTIyZTI2ZmFmYmJlOSJ9.KtbQYli2iNS6XJ8H9sIMU1WYXtZ1GGr2G4vYTX_6Iv2xw0vreoS4UhKM04Q2K3bL1dcId-9jR4rqfAR59gMoOQ	2022-02-26 22:13:18.87937	2022-02-26 23:13:18.879421	2022-02-27 22:13:18.880838	f
19	4dfaeea8-bc14-4ae8-9b8f-8783f9fcc8ab	18	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNGRmYWVlYTgtYmMxNC00YWU4LTliOGYtODc4M2Y5ZmNjOGFiIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.k6M9tgXoPD7J8yQze8YHMJMBhghXc6UFVYEIAQbu9e2CCdaD14sDaO_Xk8YY8yrdzvb8GKc5AiCYqtLhQIezHQ	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMzQwYzJiOGYtZWNhMC00ZGEwLTliN2QtZWFiZWMxNzgzMzQ5IiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjRkZmFlZWE4LWJjMTQtNGFlOC05YjhmLTg3ODNmOWZjYzhhYiJ9.EYxmhkHSUGkQZHSj2HDyXW_t9eVWncgl0taY9t0k_kKtz-luHNaocoeyL_Xm7orLw6rgg1ZjVXUzzFG-e3bH9A	2022-02-27 12:59:34.744654	2022-02-27 13:59:34.744794	2022-02-28 12:59:34.749457	f
17	e1f2ca57-8b01-4d74-84c1-5973600f359f	16	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiZTFmMmNhNTctOGIwMS00ZDc0LTg0YzEtNTk3MzYwMGYzNTlmIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.xRKObcxRYU5SUg2AAPs8YyXA5Aw0iHIrH8zfzwa6dKfXEEwOaATH3OdzmRd5sibfmG_bOeyIzujLus-MsqeG6Q	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMTE1N2I3YmItZjE3MC00NTkxLWE3MmItMWFhNGRmNjczMjEyIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImUxZjJjYTU3LThiMDEtNGQ3NC04NGMxLTU5NzM2MDBmMzU5ZiJ9.Nmo_BuznKuNPkKSVd03mGS1lK5XNX7LiiODsC1YorWHPMtX45S_HoecOcs5P5r19NLlYDmk04CtWtXEmDBp20A	2022-02-27 00:00:42.67877	2022-02-27 01:00:42.678821	2022-02-28 00:00:42.680192	f
22	39feb5af-c0dd-4bc5-9320-ebf10f090feb	21	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMzlmZWI1YWYtYzBkZC00YmM1LTkzMjAtZWJmMTBmMDkwZmViIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.Pbw3J9jT_UafGj8y4uhuBZYdwEXAopR8Z7z9XUO8AGVODkGqy-JvAY_9azJKP3Fdh_C0qkUWzWxQIYZNrOlntA	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiOTVhYTBiZGUtZjQ2Yy00M2Q3LTlmYTctZjFkNjZhMGFlYWMzIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjM5ZmViNWFmLWMwZGQtNGJjNS05MzIwLWViZjEwZjA5MGZlYiJ9.WKfvizC_b8QqBpcY4zDCT_0qq4VXnQTp7-3wwRIhmQFAU-Uz96NWv2HdvkQXjuXHaD-xjFbk61whMn55ObDugg	2022-02-27 18:08:35.465127	2022-02-27 19:08:35.465288	2022-02-28 18:08:35.468487	f
21	ae32825a-77b4-4319-bc39-f834c93f4c23	20	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYWUzMjgyNWEtNzdiNC00MzE5LWJjMzktZjgzNGM5M2Y0YzIzIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.GgnwhSGkxk91l2CKlpUP2m1Hp7CKM765S1b3zM1SrRHGOq5FtrM2rFGO_V-nfAi0DNKxGMRux4sj6Dk4rJ9y4w	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMjk4ZTZhOWUtMGEwZi00ODIzLWIxMzUtODAzMDIwY2IxYWY5IiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImFlMzI4MjVhLTc3YjQtNDMxOS1iYzM5LWY4MzRjOTNmNGMyMyJ9.uiayyKKo_0o5pmTJr7JhPWNVGCPi2LC_35vp1Mzylep5RdlcayUjRSVNLrZDJ6fMqjqk2_oyhmJ3p1w_JoRspQ	2022-02-27 17:07:18.823018	2022-02-27 18:07:18.823086	2022-02-28 17:07:18.827127	f
27	a667532d-2cdd-45e9-a760-c6972a567676	26	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYTY2NzUzMmQtMmNkZC00NWU5LWE3NjAtYzY5NzJhNTY3Njc2IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.xx26cPRND3OiT20UG4KpqXJ48nHnlawFyLJpQzB3pzSriRaHBkQT59c1rl5xNTNQfB5qkMHAWswSsVZaVsec-g	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNzEyYzA5OTItMzMzZi00NzUyLWJlM2UtMjE2ZTA3OTE2ZDlkIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImE2Njc1MzJkLTJjZGQtNDVlOS1hNzYwLWM2OTcyYTU2NzY3NiJ9.a_gBcIhxxkpqQAOfgrAJSSiNnmZCjtrJSqc-B7A3OvOyxunvvzSaXRzdEtxZ_xDPC08pCPNHIKgn9ibfr7WsQw	2022-02-28 03:14:49.620439	2022-02-28 04:14:49.620488	2022-03-01 03:14:49.622193	f
25	a32ca16c-dafe-4cce-ac9a-081d0b6fd101	24	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYTMyY2ExNmMtZGFmZS00Y2NlLWFjOWEtMDgxZDBiNmZkMTAxIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.A6fo94b4jv5Yy_0__uCGmSJUwUXEoJUZJaoeIlqqTcRp5mEJWBt7jq0a3MGS_Xry1MpKIBdLtLn4gqAkDIZ7lg	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiY2E1MzFiYmMtNjA4Mi00NDQ1LTkyNjEtNWM1YmYzOGVlNDkzIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImEzMmNhMTZjLWRhZmUtNGNjZS1hYzlhLTA4MWQwYjZmZDEwMSJ9.tzPIDyxPGzIfgf4ZtSYm4k6D6w7wLoMKEQ56NFkcQMFCTIN-0mRYFMntBwQ500ZhGjpkBho2GeVCY579s55S7Q	2022-02-27 23:37:25.119797	2022-02-28 00:37:25.120025	2022-02-28 23:37:25.132816	f
23	eb603bf2-ccd6-4fae-b7e5-92827a312cb4	22	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiZWI2MDNiZjItY2NkNi00ZmFlLWI3ZTUtOTI4MjdhMzEyY2I0IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.nHNCHGCWo4_bTkx2SaYNJMwXK1XOYMVbW5uAj32Ji0pB2nIMKPKXgHvu_9PPT4DewYKCV01F492pSanqUX5T3w	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNWJjNTdiMDEtNDA2ZS00YTRkLTkyYmMtOTMwYTI2YmM1ZmVmIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImViNjAzYmYyLWNjZDYtNGZhZS1iN2U1LTkyODI3YTMxMmNiNCJ9.zjll38ZK8zdikmBmkOfZHlKc0m0HV75c3iszXYj3Q6eTnEG-qdyT4RN3fvY1NL597cUaYsmOwIsgobcUosWquA	2022-02-27 19:59:57.234595	2022-02-27 20:59:57.23463	2022-02-28 19:59:57.236126	f
26	17da2d76-7ae2-4f9b-bafb-97bbe09dd7bf	25	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMTdkYTJkNzYtN2FlMi00ZjliLWJhZmItOTdiYmUwOWRkN2JmIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.9s1251xvi3wHd-M9KjLXDTk6M2HLzh9XDREkBoHq_oMzgaWNQuxdXw0Mm0x1uggp2bftqW5vUahWWNsUJfwlNQ	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYzVkZWQxODgtMGIxNC00ZDNjLWE5YjctODg1M2ZhMmFhN2FkIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjE3ZGEyZDc2LTdhZTItNGY5Yi1iYWZiLTk3YmJlMDlkZDdiZiJ9.2bjJl5JZa5dqJKvFg0t42omsa3ra-5cHs_QVZ0PUi_OgEIqdDhUzMfh3k6955-2B3e4PcTU8BrNKhdFFUq1-rw	2022-02-28 01:25:47.128368	2022-02-28 02:25:47.128419	2022-03-01 01:25:47.130293	f
24	2180da6d-7148-4084-b6ae-9388583d4e93	23	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMjE4MGRhNmQtNzE0OC00MDg0LWI2YWUtOTM4ODU4M2Q0ZTkzIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.4ZAQw4UiHuT_qZd6ydcql3P8obQVpJNpLE3inFN561PjKOjgUKZJBs6LVn9AHx_XuzNJukHLI6CCuTnd74cEtg	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNzZmNjE1YzMtMTgxOC00Y2U4LWI0ZDktYWYzY2I3ODRjZGJkIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjIxODBkYTZkLTcxNDgtNDA4NC1iNmFlLTkzODg1ODNkNGU5MyJ9.mfuqtetDhm2TbYI42bY4J4AtD38fAIpo9cr2EtkoUDl-UZlfhIJA9B7CUHD1Dv_lW8vQn7V6cZT5qP-NyCT2IA	2022-02-27 21:48:14.099195	2022-02-27 22:48:14.09923	2022-02-28 21:48:14.100863	f
29	30a36c13-0359-4d15-aa09-fbfcc262b640	28	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMzBhMzZjMTMtMDM1OS00ZDE1LWFhMDktZmJmY2MyNjJiNjQwIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.MWpjrRMYfHZARXJXE9g6eyci5fgqEcPwtWfWnWIUODnvTwVfOCP6_h8XC6BgRld78IGyQ6BrL4xxtcVtYfWijQ	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNmQ2NmNjMWEtNDE5Yi00MTFkLTlkMzktMDM5YjNlOGY1NjQzIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjMwYTM2YzEzLTAzNTktNGQxNS1hYTA5LWZiZmNjMjYyYjY0MCJ9.ghIutIWXm2grEzgHmAF-KkvJgs9-o-Y2ZCRUvMDv44fYETmF9oNYgCC3Ib1psqKp6MCVoLfQWchbIad1tVcwbw	2022-02-28 07:44:47.338068	2022-02-28 08:44:47.338325	2022-03-01 07:44:47.35612	f
28	1e3f0f0f-9051-47e2-bbc6-b2a27c83fe3e	27	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMWUzZjBmMGYtOTA1MS00N2UyLWJiYzYtYjJhMjdjODNmZTNlIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.UHrh2fxEVjUNYx4DosBtSrqETpZ5avoN-UzsJ1eEhy26McFzhnlip6GpA0KQOCUpqGpLDb7__mIC5uFUZIpgGQ	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNjk2N2NmYTMtZTdhYi00OTdkLWFhNzUtOTk3MTE5NzVlNDM0IiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjFlM2YwZjBmLTkwNTEtNDdlMi1iYmM2LWIyYTI3YzgzZmUzZSJ9.0G7fD1VLsRHuMqYDu7Oj4ZOp8TymkApKybo35uQjCdkFgnuDOEgIgbA6yDmdU8EKpxXDUaqXMKP-mDGf4MHV3w	2022-02-28 05:56:21.231773	2022-02-28 06:56:21.231807	2022-03-01 05:56:21.240079	f
33	1e2ae774-988f-4af1-a5d7-58b02386bb34	32	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMWUyYWU3NzQtOTg4Zi00YWYxLWE1ZDctNThiMDIzODZiYjM0IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.UKyj-4HXh2JlZwUqjMjKViMBSOt2Il0vm8liSGFUgG8Dp4YTjRqu8VYKCmf_9OJjLZGNL79e3CGakRpYxYsjMQ	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMzk2ZmVkY2YtMDEwYy00OWViLWFiZmUtYzFjOGNiMzdiYTdmIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjFlMmFlNzc0LTk4OGYtNGFmMS1hNWQ3LTU4YjAyMzg2YmIzNCJ9.kqvodYTkeQ2ODtGhoXSIYCX-zMTW-sdwmCtWoD8s1OsfKqitig-6HqH2pnGo-AShn6tiqz3SbqqJ3mWS-2PiRg	2022-02-28 14:33:38.160622	2022-02-28 15:33:38.160673	2022-03-01 14:33:38.173895	t
32	f3a7c633-51f5-457d-b01b-cb894c76434f	31	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiZjNhN2M2MzMtNTFmNS00NTdkLWIwMWItY2I4OTRjNzY0MzRmIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.5lrVSZbTyqPWSYHOxX_yAexQfkhwokeYnCauxNd5d6BjpZgOzb7zLjTgXSexkUKywrXHOStHxOgE-d5cCeudFQ	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMTE0YWRkMGMtODg4Yy00ZWQ3LWFkMjMtMzZjNDBjYjIxZTAyIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImYzYTdjNjMzLTUxZjUtNDU3ZC1iMDFiLWNiODk0Yzc2NDM0ZiJ9.9IXuvbslKrUbT2a2jYClgI6qRHET5gj3sFxUlBMO9mCdKoT4UyzJZMNvwkpT7mU3cGca-GuOT85HW6mCuaYjHg	2022-02-28 12:40:27.09964	2022-02-28 13:40:27.103753	2022-03-01 12:40:27.297998	f
30	b30886b9-3aad-48b9-bc80-fcdfecb47a71	29	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYjMwODg2YjktM2FhZC00OGI5LWJjODAtZmNkZmVjYjQ3YTcxIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.CBOTy4YeczwaDeMwvLbaDesI81mvB-WzXw5hwMRFdzgPmSi3Qg24rfY_b1JE_RG8uwoKWDr-sed--rJdWIWQig	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiZmM0MjM3ZjEtMjVkNC00ZDRlLWE3MDQtMDY0NWI3MGY0Y2M4IiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImIzMDg4NmI5LTNhYWQtNDhiOS1iYzgwLWZjZGZlY2I0N2E3MSJ9.YqS-aPQDMfIC_ZxethC0Uon2px8cEsqFL2EYDoC16V3fALTQweDEFUVKi5Pj4vGH9BZJ4632HyoVeBn8n1X2ng	2022-02-28 08:55:57.518956	2022-02-28 09:55:57.525697	2022-03-01 08:55:57.594753	f
31	e7d964d2-c2b3-470e-aa8a-e3f212c7108f	30	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiZTdkOTY0ZDItYzJiMy00NzBlLWFhOGEtZTNmMjEyYzcxMDhmIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.y6y7F5rCPqDsGb1Ae5B__9h8kwUJ2VRRrAnNXGDIDAv3ftg5x7Vvhl2WLBlPSwicnPPUd2OTIOa-qkcRw-kh8Q	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMTE2MjdlZWItM2NiYS00ZjY5LWI2NDgtOGYzYTNiMWU1OTM3IiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImU3ZDk2NGQyLWMyYjMtNDcwZS1hYThhLWUzZjIxMmM3MTA4ZiJ9.DHpEnWX_AGZhJk2MPh3Jc8UOX5og0Cnf1-nS1YpUMKEqrnqatoWSZGFCXcLN-Srd1OFi1IMen_3j9TcEBWDTQg	2022-02-28 10:26:02.478948	2022-02-28 11:26:02.481592	2022-03-01 10:26:02.514001	f
34	0b07f227-3403-4d56-b56b-987eedfaa3a0	3	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMGIwN2YyMjctMzQwMy00ZDU2LWI1NmItOTg3ZWVkZmFhM2EwIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.a149eOqOMWxUfsz8wTafyExhUnkCuuT2Btndr2d8XvG27cEc67XCE9cXOoMKwpjlvywf90vUtvELzaUgPb-qYw	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiZTdmY2Q2MjgtZGQ0Ni00ZDE5LTllODYtODUyMjY5NGRiMDg0IiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjBiMDdmMjI3LTM0MDMtNGQ1Ni1iNTZiLTk4N2VlZGZhYTNhMCJ9.j6rAaGm2oGcNLshIKWA3g5w74nUj2g2HPIH3yHhTVA4jDVaMOJ4rZGsyqBILXyEnhSXzzdYDsrliWckBy9mWvw	2022-02-28 15:38:21.50938	2022-02-28 16:38:21.509515	2022-03-01 15:38:21.526098	t
35	121a23f0-19ea-4b5e-81eb-237c422a4e1a	3	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMTIxYTIzZjAtMTllYS00YjVlLTgxZWItMjM3YzQyMmE0ZTFhIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.b_mpfP_8Gg_88m6dKyl3eho6HbWEI9sEC00LVvLTNRUzj06iyu1EI0p1UIKTi7_zyYwP5nYgrFbjNmrtx-91EQ	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMzNhNzhkMjUtNDA1Yy00NzQ4LTlkYmEtYzg4MDZlMDgzM2I2IiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjEyMWEyM2YwLTE5ZWEtNGI1ZS04MWViLTIzN2M0MjJhNGUxYSJ9.LUQOZpIpohviIh2XLmBUc0TM5q7h4QZxm2zkfJI0aCfipZG-QySk9p2hUX41TzRnbtjjkgjb6Y_AwRFga6Jpuw	2022-02-28 17:59:38.989961	2022-02-28 18:59:38.990046	2022-03-01 17:59:39.012507	t
36	47f0f558-71f8-4a5c-9837-2221dac4c49c	3	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNDdmMGY1NTgtNzFmOC00YTVjLTk4MzctMjIyMWRhYzRjNDljIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.CEOJMIdtTSpEA-gAMSkKj5NZudL2-hrsrlyofvwdSpfcG3bTiRoJIYNJGs2uIoRGO3resnCAkSYLUA1Jw7ws5Q	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiY2YyOGFmNjktMjA1NS00N2ZlLTg2ODYtZmNlNzQwM2M4MjNlIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjQ3ZjBmNTU4LTcxZjgtNGE1Yy05ODM3LTIyMjFkYWM0YzQ5YyJ9.rW7mM-3Jqsa0zI62PXq0JzH9akSMWc8yXxdlPsZm3T4coROu07o9N2KvbNpmDiUox0qjH9FirZmOssEWTZKBiA	2022-02-28 21:35:35.667653	2022-02-28 22:35:35.667717	2022-03-01 21:35:35.673455	f
39	485747b8-b81f-48cc-97ca-b90946aa11ed	38	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNDg1NzQ3YjgtYjgxZi00OGNjLTk3Y2EtYjkwOTQ2YWExMWVkIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.ygZoyB0iYZlja-kVH_unGB4MZAo6tSOwR3EP4fDjou4Xn1CFROt-13byJiBzTtad4_QPJdHVhnGYhqtABKFRKQ	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMGYyZWExMjAtOTg0Ny00ZDkzLTkyMGUtYzE1OGIzNTFiZmRhIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjQ4NTc0N2I4LWI4MWYtNDhjYy05N2NhLWI5MDk0NmFhMTFlZCJ9.Svv5cfLtBCciSEDd2X-KXus1h1BTiJUtuW4NnjlsymFMToc9oZHV1ZxtHZna4OVRjcmYMqA23Yl4if3z-yNAcQ	2022-03-01 02:22:00.807296	2022-03-01 03:22:00.807551	2022-03-02 02:22:00.819275	f
37	ad3b10a7-710f-4a21-a611-4a457711d496	36	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYWQzYjEwYTctNzEwZi00YTIxLWE2MTEtNGE0NTc3MTFkNDk2IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.V4E-uQxoIiW0kTrkkOuyBA89IkduWj5-MQ52eelyDr2-46mHwi2PHsn27M45Wc7s3CJ3-lpD59JNH-KoDzXQYA	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiZmYwODEwMWYtZjI5My00YmFmLWJkN2MtMWY4MTVhMjFkYjUyIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImFkM2IxMGE3LTcxMGYtNGEyMS1hNjExLTRhNDU3NzExZDQ5NiJ9.CpmNoGKXb7wwWReqBrb11osB650dbnzZzCxjglT9d7rvJHlvWo4rnar3fMLutMI87lhwWjq8t-oFG-2HaiVO9A	2022-02-28 23:48:57.220806	2022-03-01 00:48:57.220894	2022-03-01 23:48:57.236347	f
38	930b087a-c34f-49cf-890b-e765d35622b6	37	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiOTMwYjA4N2EtYzM0Zi00OWNmLTg5MGItZTc2NWQzNTYyMmI2IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.gHVbySukvYg3TYbINXBDjqqd-yhTOiZqsEQFFblFWvEMf9uKMRRnodrYx99NhCuWuicWGzHiN3NCngzd_nu0Tw	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiZTNhZGQ3OTYtOTJmMi00MzUwLTg4MGUtOTQ0ODY3MmEzYjYxIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjkzMGIwODdhLWMzNGYtNDljZi04OTBiLWU3NjVkMzU2MjJiNiJ9.4w4hWMC2F6rhtQWD6EEJif8ZaRTU6X6IW7LAYhQo80ouC0TPY_AWKFB7xhnAIwAhFL9x_VeqUMb3QTku00RnnA	2022-03-01 01:06:41.687897	2022-03-01 02:06:41.687943	2022-03-02 01:06:41.689896	f
40	4522d98e-4226-4101-a942-91909290abf1	39	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNDUyMmQ5OGUtNDIyNi00MTAxLWE5NDItOTE5MDkyOTBhYmYxIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.A1hvqQaip7h72NHgHTw2ceAbKQYCL8QGc2j8toxTH4mqJjxfSo3mFDVQcWHgPhRPEd1BNpAPh9yw_GOT5IXtew	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMTZlMTBiODgtOWRiMy00ZmU2LThjYjUtNGY3Mjc4M2UzY2FlIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjQ1MjJkOThlLTQyMjYtNDEwMS1hOTQyLTkxOTA5MjkwYWJmMSJ9.wV6Rx5kflikU_rv2YiDwLyf3W6pwPcN2mpQg7GZhFo7IjjIytYKxvlGNd-V41fZ5BFBslPGwU3YZ4fTHDhQ6Zw	2022-03-01 04:10:42.387516	2022-03-01 05:10:42.387549	2022-03-02 04:10:42.390759	f
41	4b2c705a-6838-4f9e-b44b-e1a9f933b41c	40	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNGIyYzcwNWEtNjgzOC00ZjllLWI0NGItZTFhOWY5MzNiNDFjIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.hnf9W1zeFHWyPN-tS8PFn6VMN8s4hQKGXf1dman0QVrvDo27rWm5wDc20qSPSyukaQ6uN1DgWYRrRzN8i073Gg	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiZTgzY2E3M2ItODVlZi00ZWIzLWE0ZmQtZWFiOTBmMzRiNDA0IiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjRiMmM3MDVhLTY4MzgtNGY5ZS1iNDRiLWUxYTlmOTMzYjQxYyJ9.K0N6hyGDM5NrnqRrLZC6hScrNIq4oTQ-C-hcZOIJaVzJo2nNa_yeKUFQVu-VetAt_2LpbBEKA1nYrTCFOfeY_A	2022-03-01 05:58:58.489133	2022-03-01 06:58:58.489166	2022-03-02 05:58:58.490425	f
43	1b190da0-48e7-4d22-ab2c-70a68d60b6d5	42	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMWIxOTBkYTAtNDhlNy00ZDIyLWFiMmMtNzBhNjhkNjBiNmQ1IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.V6NN8DSldR2eU4FpOLD2NEqZikH6HRPaVIBQfuZyyzY_ouN0F_3GAKkn6DgjoYRlBilbztQToWIKaGHMuhsZaw	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNDU2YjU1ZTUtZTUwMS00MDU4LTk4YTctOWIxNjlhNDhhNGFkIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjFiMTkwZGEwLTQ4ZTctNGQyMi1hYjJjLTcwYTY4ZDYwYjZkNSJ9.bhpFqFLs5YkISmX0i8hTB8C3zOQ52XByLOoYZvKfyLJPJyJuBQDVBUT829qZ8mq5FG5zqDeZbewCrJXkxir-ig	2022-03-01 08:52:18.248845	2022-03-01 09:52:18.248877	2022-03-02 08:52:18.25737	t
42	ad463d3a-0af1-4a03-bb47-23abecc97af7	41	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYWQ0NjNkM2EtMGFmMS00YTAzLWJiNDctMjNhYmVjYzk3YWY3IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.ewgqYFZrdUMt-syzkj1sM5uN_toU9xqyuT2wZsB7P3AjtkjWwUzIuVnR3L4qTXJsDlmsbElVxi7sGxP2mY9Gpw	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiZDkzNGIzZGEtYjlmYi00MjUzLWFkM2MtNGQwODc5YTYwYzZjIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImFkNDYzZDNhLTBhZjEtNGEwMy1iYjQ3LTIzYWJlY2M5N2FmNyJ9.cdfUeRtX0s1Xz1Z_6zfG8xXTUANeryQumHoLz-UfFsNMVemWvIu3FI1LDRaL0IuOKAC-V0FLgV_m5CriicwWlQ	2022-03-01 07:03:50.585422	2022-03-01 08:03:50.585455	2022-03-02 07:03:50.586926	f
46	e6b983f9-b785-46c9-9ccd-8a10038d817e	3	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiZTZiOTgzZjktYjc4NS00NmM5LTljY2QtOGExMDAzOGQ4MTdlIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.F43D-qdY4wuzjQDExijVivGqyW5Ifo4W_fiZGwhS9nn_MrrjF226IPgTQcdSquujeEQuMxh7HMxjcq4A5C_17A	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYWRhYmRkZWYtMWM4Mi00ODcxLTljZjctYjFjZWMyYmQ3ZGQwIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImU2Yjk4M2Y5LWI3ODUtNDZjOS05Y2NkLThhMTAwMzhkODE3ZSJ9.YnHUeKdkkv7Lsq2bTfNBG37DcjXZZMLfMv4kod_zVZC0_e2fE2Ju3Q8ShXyesr9ZaZUNCRBr698yYGNMmMIPHA	2022-03-01 21:05:29.319643	2022-03-01 22:05:29.3197	2022-03-02 21:05:29.329335	f
45	41d847c3-4d14-46fd-ab69-366e018b8069	44	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNDFkODQ3YzMtNGQxNC00NmZkLWFiNjktMzY2ZTAxOGI4MDY5IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.LHnWnLAtimZ9ixIqVteItzTBl4M9lSvAjTjpe8esWL18Y4asv-gkpM5yQMWlnwQJeAG1cET2yRv6k9PvRmr64A	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiZTNhYjQ5NmYtYjlmOS00NDZmLWFmNTAtMGQ1ODgxOTk3NzgyIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjQxZDg0N2MzLTRkMTQtNDZmZC1hYjY5LTM2NmUwMThiODA2OSJ9.8T5oYZsYJIIpwLRzNS431ZXJ9gx-g09mzaIZw7_R3Fp0IsOCmQfRpaQPR8HooZ36xA91MmsOUA_j9yQrY3qI1g	2022-03-01 20:31:14.576039	2022-03-01 21:31:14.576114	2022-03-02 20:31:14.579125	t
44	3f507d35-a97a-45c4-8961-e2414ed5d932	3	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiM2Y1MDdkMzUtYTk3YS00NWM0LTg5NjEtZTI0MTRlZDVkOTMyIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0._PY1G-ItFYTx4wheHGmXaD7H0DP7EkbR9Bt_ZCKSNsAYGl75WHo-6UvQ22hTnGtBrQUF_CziJIFR6MQS-2rFMg	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNmNhY2YwYjItNWRkZi00OTM1LWFlMTItNWI0N2ZmZDRhYjBlIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjNmNTA3ZDM1LWE5N2EtNDVjNC04OTYxLWUyNDE0ZWQ1ZDkzMiJ9.R5MP6oPrym3GYEDdna3x_vnryjCjGskZsNbUMdFhzXyiwbrGeidDwyv5ZlNVq49tdx9Vcm_mSp7BJttqUv-1Vg	2022-03-01 18:30:49.147171	2022-03-01 19:30:49.147361	2022-03-02 18:30:49.178709	f
50	12f40f43-0550-4f74-adf2-d4df24dd654f	49	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMTJmNDBmNDMtMDU1MC00Zjc0LWFkZjItZDRkZjI0ZGQ2NTRmIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.RqIRukXxXq84mp6aFFZdD2U6FLJt609MI4gZZzOQuzVmih2JgCS6AL1Hy0XW-RUizl_fA73ldjIEvRxrm8cW2w	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNjllYTFmZjYtNTg4MS00MzllLTliZGItMmY1NDZkMDJiODExIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjEyZjQwZjQzLTA1NTAtNGY3NC1hZGYyLWQ0ZGYyNGRkNjU0ZiJ9.nUdoQfr-UPQg2cpdJclX-0euNL1suJDadTYiwubT1tt6JtdziWjwMwB5_bg9OEDoOiWgkzMcGsZpVXlqUtEAtg	2022-03-02 03:25:56.19614	2022-03-02 04:25:56.19619	2022-03-03 03:25:56.198167	f
47	b8c98861-aaf1-453b-a540-f6ba0f076bff	46	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYjhjOTg4NjEtYWFmMS00NTNiLWE1NDAtZjZiYTBmMDc2YmZmIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.00re84pNfoZzdvPOM-tfQcz5NzbIX53BFqfet9ax2pNTgUgbKCPgQNvURZvgkySNLWWUyC0fBqk9fRWgXpYViQ	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMGNhYWY2MzUtMTc3Yy00NDdmLWFlMzYtZjAzOTI4N2NkNTZlIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImI4Yzk4ODYxLWFhZjEtNDUzYi1hNTQwLWY2YmEwZjA3NmJmZiJ9.NaKWK7AjoTn3tzmdS5SrXRKRpTgpwBXZcxd3TdRUqfvi8Z3szt9Tnxklenbdu8-93bR74I22XecsCN6my4xYdQ	2022-03-01 22:08:34.869451	2022-03-01 23:08:34.86953	2022-03-02 22:08:34.892599	t
48	96a4c9a5-21d3-4f88-8f24-7bfe3f3dfa20	3	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiOTZhNGM5YTUtMjFkMy00Zjg4LThmMjQtN2JmZTNmM2RmYTIwIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.jbXy39WEJl6B49ZoIh9wVbG0oFWpzF9jfqPUmIfFf9UWuXeUn64PQl0pVQCXyRvWdoTdoW6GuP0OUPLFi_8PgA	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYjE5MThlYTMtYTRlMi00YjlmLWE0NTItNGY0ZDg1M2FiYTA4IiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6Ijk2YTRjOWE1LTIxZDMtNGY4OC04ZjI0LTdiZmUzZjNkZmEyMCJ9.LDKsQbv9ckBFufuA636n1S2L78SCNfIyL1vZhfc8ZAcexac40dGcDjsdOdG0XyQldiXTGnOvRNiMHAdVDZH9Kw	2022-03-01 22:09:52.369395	2022-03-01 23:09:52.369437	2022-03-02 22:09:52.371227	f
49	77247b90-e239-4e80-b89e-618cf0ffc3d1	48	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNzcyNDdiOTAtZTIzOS00ZTgwLWI4OWUtNjE4Y2YwZmZjM2QxIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.GWnMk4sK_X5BEunW3Gpn0ojz-uXnpGgD5WiYNoMCKTGV7Zn1sbN2188J8gfYWl7IxoRKvtmMLrD72Az2pPVa5Q	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMjc2MmUwYmMtMDBmNC00MDQyLTlmNmItZmU2MTM5MDcyMjgwIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6Ijc3MjQ3YjkwLWUyMzktNGU4MC1iODllLTYxOGNmMGZmYzNkMSJ9.JgeuzB9ur2jNN3VlepFEcB8I62eIcW-3I2kJXEioqKFtQYx7pqwCZaKR54Y7eGTiAheGE76Z1TW5KLkcmqVOBQ	2022-03-02 02:24:55.19928	2022-03-02 03:24:55.199408	2022-03-03 02:24:55.204221	f
51	84998ed2-ca69-4dd9-be30-8eb2f4c28c87	50	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiODQ5OThlZDItY2E2OS00ZGQ5LWJlMzAtOGViMmY0YzI4Yzg3IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.GrO72inBwh_JNQbRbHJ6AeVg-7nfLDuaEfZcYyAAbxv9OmEp1oXxW8POCnvLHcDp8yWM5uAbc7bfw_oIPZVQ9Q	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNzA4ODNhOWUtZGE1Mi00MThmLWI4M2MtYTczOWM2MTFiZjgwIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6Ijg0OTk4ZWQyLWNhNjktNGRkOS1iZTMwLThlYjJmNGMyOGM4NyJ9.YmcT6rpBI89Y4qaOmHss1BFJ-32AP_N5ya4vXyvsbZ-LGapsVSxiZT9cuEm0UewmpdYNjQ-B-MJbRX7OseRHWg	2022-03-02 08:44:34.829109	2022-03-02 09:44:34.829144	2022-03-03 08:44:34.831633	t
53	b405f9f0-41c3-4fe1-b88e-b1488cb825f3	52	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYjQwNWY5ZjAtNDFjMy00ZmUxLWI4OGUtYjE0ODhjYjgyNWYzIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.OZVZDx9FLCZAtRuupKtkIjI_V_8JQrlSWgf6F6RtfsEW9Yoq0Z6R3sa2Nr53oGc659ehte4TcIc_0heCw5yPog	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYjg5ZDBjMmUtYzg5ZS00MDlmLWFmMjctMzZjMjVkMTUxNmE3IiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImI0MDVmOWYwLTQxYzMtNGZlMS1iODhlLWIxNDg4Y2I4MjVmMyJ9.cvmidL3HgEONRPTR5C21iQKHKjZw9jSW6HAgJf3eS2AEKhsI_NLHhVw39VENa-b89F5-gnI00TirwqESo6qhlQ	2022-03-02 13:02:40.284817	2022-03-02 14:02:40.28493	2022-03-03 13:02:40.301074	f
52	be204119-03c9-4b81-99f6-4388b57514c8	3	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYmUyMDQxMTktMDNjOS00YjgxLTk5ZjYtNDM4OGI1NzUxNGM4IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.tGRgytmNH5dhFixxkrQl1D5x1dCKsi8fTo4TylEyWyn4pIitc889XLw6ssvsnSNcMjqXy6-EJSFYjLmE1jx_8w	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMzc3YTQzNjUtZmY4OS00OGE2LWFiZjMtZTRmMTUzNDY2OTQ3IiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImJlMjA0MTE5LTAzYzktNGI4MS05OWY2LTQzODhiNTc1MTRjOCJ9.XB9ngnfehpNupksVRwKDjlAV-LZVqIRpaOTuU1N34FikMrKpECp0DiZ5O1JaIX00XMBidM8_6qTXglxCMR27Pw	2022-03-02 09:33:47.540695	2022-03-02 10:33:47.540944	2022-03-03 09:33:47.554403	f
57	b1d226c3-610a-4f3a-9f7c-83e8fe65a5c3	56	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYjFkMjI2YzMtNjEwYS00ZjNhLTlmN2MtODNlOGZlNjVhNWMzIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.lgdthVGuuJZ3XXHfjk_zGqpS_wIMTXq0B5y4nb7pBMJYCoh3_zxPg-U3EmHr4X2PE86O4u1AoA68Xhslv6W7XA	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiOWY0YTA5YjEtYTQzNy00ZTE5LWFkYzMtYzhkNDE1NjczZWIzIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImIxZDIyNmMzLTYxMGEtNGYzYS05ZjdjLTgzZThmZTY1YTVjMyJ9.Q0g81tRZwu3I3IBqLzY5ADzi-1ujClrfKuScxV0o6qTjXVgHa2h1zVNOwL849N_GrVC1AgZX3RnwwH-Z8NsYrg	2022-03-02 22:15:35.934708	2022-03-02 23:15:35.934794	2022-03-03 22:15:35.954634	f
54	c4608468-82fd-4b80-939c-1032d0b25baf	53	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYzQ2MDg0NjgtODJmZC00YjgwLTkzOWMtMTAzMmQwYjI1YmFmIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.PJ7vJHwTjhZpG-TJjcIoQWFmnvxjjS8fDJ44QDS_aOTJJJFMTaWft5_PeX14OnDCccMCqTYdbdoDeAgSCjsKqA	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNWRlNzZjODMtNjE2Ny00MzlhLTljMTYtMDg3Yjk1NDQyYjc2IiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImM0NjA4NDY4LTgyZmQtNGI4MC05MzljLTEwMzJkMGIyNWJhZiJ9.XsXVZLUG5PP_piYkI1Hnax1JRqHsR0EcnsMo_vdVtFpojNW3FWilUFawKzy6MmagzbJTR-ETJcsVkqtnjoJ64g	2022-03-02 14:08:09.214097	2022-03-02 15:08:09.214158	2022-03-03 14:08:09.217429	f
55	4334ad6c-ee63-471c-8a21-58d9dab3511f	54	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNDMzNGFkNmMtZWU2My00NzFjLThhMjEtNThkOWRhYjM1MTFmIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.Mulq7uLSZHyxbdnjdOUFzLd2JgxdllsFwjxQ6yXZUZlz8i9DDafngI1b6bgS2ir0hMebALjL3hdorMbAkRekyA	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNWRiMWI1Y2MtNTVhNS00NmUzLTgyNzctZmE0MTdjMDYyNmRiIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjQzMzRhZDZjLWVlNjMtNDcxYy04YTIxLTU4ZDlkYWIzNTExZiJ9.GV-gHjKQjKaLxycEe__JYQjNVqOh09PCK9_739hgNGvwU5IxCwGGhojUe96H44BL-dLyzOtH4npjJto4d-fJgg	2022-03-02 15:11:11.858949	2022-03-02 16:11:11.858989	2022-03-03 15:11:11.863273	f
56	eb0ca963-28a3-4a47-b5a1-b722999b29bf	55	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiZWIwY2E5NjMtMjhhMy00YTQ3LWI1YTEtYjcyMjk5OWIyOWJmIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.3m4VMBlFq13lPru3AYZtyGXgqqipEpgD2jDj0UGugHu8NsXryJVwv_-9bWncE5pzG4H-3IrIApZT5k5f4RPQUg	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiOTdlMWMzMDctMTYyMi00NzY2LThmZTEtZWM3ZmE5MTJlMzQ1IiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImViMGNhOTYzLTI4YTMtNGE0Ny1iNWExLWI3MjI5OTliMjliZiJ9.7oSBkJgB5hfC3P8MIBzOkv7RQ5OaqpX8MHVE7sy1WxRtY_VdzYHpD2TN88c07IOhTik3sbcSBzQTpkrFPDqLpA	2022-03-02 17:54:53.661643	2022-03-02 18:54:53.661833	2022-03-03 17:54:53.687291	f
62	ec8d8ee2-4797-499a-80bf-149e6d16ef4a	61	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiZWM4ZDhlZTItNDc5Ny00OTlhLTgwYmYtMTQ5ZTZkMTZlZjRhIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.fZWBL2gmY-4S8MEaGyzrx89s41BfaORezXe8MaDSHf2X3fV5pLxP_GJMpYXN8SZy5Dbx7x0N9EO9f-Yp1fk4CQ	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYmQxNjljZGQtMDM2OC00ZDE1LWI3MTQtMzY2YTc3MTY1M2U4IiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImVjOGQ4ZWUyLTQ3OTctNDk5YS04MGJmLTE0OWU2ZDE2ZWY0YSJ9.ASCHUbhUe2Z49YfRmKnBze2DmYgQuuZp6u2qMu3xONN-7_UkfJplZ2q0HBI4-XCagGJDHbHNlqb2JKtnxP4H5g	2022-03-03 06:22:54.179883	2022-03-03 07:22:54.179949	2022-03-04 06:22:54.181666	f
60	d5f9de5b-c596-4a26-af97-f70d156fde12	59	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiZDVmOWRlNWItYzU5Ni00YTI2LWFmOTctZjcwZDE1NmZkZTEyIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.DfttWDFFuKYzataure8K-VKXEekuHqILuOrwUH3hGLb1I8H90Gu-qCR6LtY9AM9_bUYKd4NB6VER5DXyHG8cwg	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMTBkMTQ4YzItYWQ3OS00Mjk4LThjYWMtNDk1OTY2YjBhZTVlIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImQ1ZjlkZTViLWM1OTYtNGEyNi1hZjk3LWY3MGQxNTZmZGUxMiJ9.yMyNBmDn6kYPT7eUltl6MtZbcle4KY0yFgzQ0_z3drbEPjKFDytS5n_8tQG2QyRO0Gdxkk9NN34mbNORwnDNXg	2022-03-03 03:23:40.011794	2022-03-03 04:23:40.011831	2022-03-04 03:23:40.013408	f
58	4a267bfa-fff4-4aed-8272-975a10040182	57	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNGEyNjdiZmEtZmZmNC00YWVkLTgyNzItOTc1YTEwMDQwMTgyIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.p-0MgX-v8JeAjF_3ePDl3eSDUpaMGjHAEA8XER2sQr8b5q1SLcMBMeTFv7SSl0DEcA56XwyYcr96EY2U8Ne19g	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNDYzZjQ1ZDMtNDY0My00ZGY5LWE4M2EtMmYyMTllODEyZjIzIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjRhMjY3YmZhLWZmZjQtNGFlZC04MjcyLTk3NWExMDA0MDE4MiJ9.NgoilucJrLkU9u4fzgPesqzGmsowa3otW-X2R4ssZBxUkmh-2ww-uu7syMCuomw48uZUqgGRyoioz1OwXQwEGw	2022-03-03 00:27:49.784928	2022-03-03 01:27:49.784972	2022-03-04 00:27:49.787115	f
61	7f8bcfc8-fbc3-4fa3-965a-ce8c94e444a9	60	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiN2Y4YmNmYzgtZmJjMy00ZmEzLTk2NWEtY2U4Yzk0ZTQ0NGE5IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.MFE1cG8R1MIUi10QVbjRvQzypHhbPQI6L23fCBNONGsV5VJmhYpCMTQB5a6if-bur82vEcnGWdPAwde69a9Mhw	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYjhjOWE2N2MtNmQwOS00YmIwLThjYTQtOGYwZjQ1MDIzOWQ1IiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjdmOGJjZmM4LWZiYzMtNGZhMy05NjVhLWNlOGM5NGU0NDRhOSJ9.AcL3DWCb_s2j5n5pf_v0KeL_J9ZfJRW94eQNlFus3VjAzS7pEhLV9qkXVVFsyLiRCfI_DVYV3yYIzc8nDJNg4g	2022-03-03 05:11:04.572084	2022-03-03 06:11:04.572116	2022-03-04 05:11:04.573204	f
59	ffe27eba-9611-4210-b467-5c546317950a	58	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiZmZlMjdlYmEtOTYxMS00MjEwLWI0NjctNWM1NDYzMTc5NTBhIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.vOhD03tIl2HZm39MviVN0qFepUjkUspX5uDiBojyxuyj-kLYAK0bH1xfWfndFZXWOraAozMz4Vh1gT5_rsUthA	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMzFjYTVmYjItNWYzZS00ZTk3LWE4NGUtYjRjMTQzY2Y0MmM2IiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImZmZTI3ZWJhLTk2MTEtNDIxMC1iNDY3LTVjNTQ2MzE3OTUwYSJ9.8-jedo6r3dtGs52C_FhLRizcmEhJfdppAwb7kOlKzPGoaRfHMMBMsBj1_rIPOzpvy1RISnKsJxZA10X6U8sNgw	2022-03-03 01:56:36.875607	2022-03-03 02:56:36.875639	2022-03-04 01:56:36.877597	f
64	8e6d39b1-901e-4367-9423-f084872a6b04	63	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiOGU2ZDM5YjEtOTAxZS00MzY3LTk0MjMtZjA4NDg3MmE2YjA0IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.Xf0fon3QFmhZgyEqBnV4WaZindJ9xQiDspJuP9FR8pU0C4bQvzUjtvWSPFsjVXltQDU8hzMResIrMtQeaQ48qA	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYjAwMmM5ZDMtZTAxNy00NTcyLWE2NTktYTk2NjhlYzM5NjVlIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjhlNmQzOWIxLTkwMWUtNDM2Ny05NDIzLWYwODQ4NzJhNmIwNCJ9.GM9gedGfbj6xeP7jG1owJQ0up1l04z4g2FOpb2IWASKb0--UgNak7xZpYnU8NSxR5hPPjs9VIq9DRuPNp4EKHA	2022-03-03 09:45:55.959698	2022-03-03 10:45:55.95973	2022-03-04 09:45:55.970454	t
63	cc9b36d6-71e4-42b9-9fef-35472c3f9899	62	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiY2M5YjM2ZDYtNzFlNC00MmI5LTlmZWYtMzU0NzJjM2Y5ODk5IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.N7HJHtC5hEkGYQVcX3YrfSHsaEDIHbOPpq7u58DECkwtLIlwrucnBWZ9dSBN8IRoFMAKF31UT9oJq0Fminfg5Q	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiZTRjMDNmNTAtNjRhMC00YzBiLWIwNjAtNjI3MDIwNTBlMDk0IiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImNjOWIzNmQ2LTcxZTQtNDJiOS05ZmVmLTM1NDcyYzNmOTg5OSJ9.X2S_rQ88ycUZ32aXx-kWvoNMwDGkS8hC05y4jQMzJ4Sq_OePhFyRJd8aleUTGkuJ4h6H0FeeL988Rhu6BHCiZQ	2022-03-03 08:16:23.706996	2022-03-03 09:16:23.707046	2022-03-04 08:16:23.715712	f
68	3e77ee4e-543b-43fe-8a91-2dba452d8f95	67	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiM2U3N2VlNGUtNTQzYi00M2ZlLThhOTEtMmRiYTQ1MmQ4Zjk1IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.ExqYxshDVEynXOHTo5JLHcA4lpUOoCa2qtrx-Enf6KxqqzB-k4tYSM2cSSFCaPSwi3NCkcvto5cqm96Fo1-jZw	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYTMyMmVjOWItMGFkNy00NDY2LWE3MzEtMjY3YmEwYjY3ZWUyIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjNlNzdlZTRlLTU0M2ItNDNmZS04YTkxLTJkYmE0NTJkOGY5NSJ9.1SAgFTwveUvai3gXv9LBgcdpe6i1xeu-JTOU9fdAM7M3NHXGABvE4QOWKuiqSk19w_JJ_ebOYTR2wOuSk1TbSw	2022-03-03 17:24:40.801808	2022-03-03 18:24:40.801852	2022-03-04 17:24:40.808126	t
67	1001590f-569b-4e78-a5bf-53d4afb165cd	66	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMTAwMTU5MGYtNTY5Yi00ZTc4LWE1YmYtNTNkNGFmYjE2NWNkIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.eOrhQdyVNfAQp0fcSCITgxyCJSepLJBi1Y7dqthFR5gmin56BW7dY69ThUqMUqoZLpRD_7jVT7T6eHbsV5Wz6w	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiOTUyYjU3NjktYTE3Mi00MTZlLWFkZmMtZTliZTM4NTU3YjcyIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjEwMDE1OTBmLTU2OWItNGU3OC1hNWJmLTUzZDRhZmIxNjVjZCJ9.er-c9SLTQq4mqkgmI1biEqxI7Q_cVypev6YlZ4LjOKr8mN-EWzH6howf31kmH1YNB577j4tjf_1Id5L4oFpzIQ	2022-03-03 13:22:57.211499	2022-03-03 14:22:57.211529	2022-03-04 13:22:57.213331	f
65	ef5e05f8-7482-4b9d-bae8-19491dfd1b68	3	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiZWY1ZTA1ZjgtNzQ4Mi00YjlkLWJhZTgtMTk0OTFkZmQxYjY4IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.MFp0bL5NxqEfLFA0CbIzscb1gvnFGdY836sHp5H8MD5Ic-leoBsXizzdlxLhhZbLAF7x78JWUt3GM5RGA74XAw	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMWY3YTY3NzctYjAxYS00OWQxLTlkYWEtOTM5ZTJhODFjNWI2IiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImVmNWUwNWY4LTc0ODItNGI5ZC1iYWU4LTE5NDkxZGZkMWI2OCJ9.eCYAH7-rWgAGINF4F1QcQLyzwY4Z5tzLLZol6S2jvFEd0ts_UNkJOJBr62Qh7ch2pdoJwTfkIV4A29wCDfkUsg	2022-03-03 10:25:54.831543	2022-03-03 11:25:54.831578	2022-03-04 10:25:54.837809	f
66	b9d00cfc-a2b7-4311-8c12-3a614aaf125a	65	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYjlkMDBjZmMtYTJiNy00MzExLThjMTItM2E2MTRhYWYxMjVhIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.xNWn6esyJiRXvtR-H5LS31WUN6hJF3QG0GsCQ9iaZRVL3yr51IeCFpGVGrJVSRtjhMnSBl056EpfcSxG4c7f9Q	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiZjhlZGU2MmItNmRmZi00ZGM0LWE5YzAtMWRkYTQwZjhjM2EwIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImI5ZDAwY2ZjLWEyYjctNDMxMS04YzEyLTNhNjE0YWFmMTI1YSJ9.0nubamUtvZ-Aw89cGZv9mo15rAOB0lG2hap74Ki02aumRPkly9qAVyqX8ZPHcydWkSea03WLi4_43AVPbUrJRQ	2022-03-03 11:28:36.203479	2022-03-03 12:28:36.203529	2022-03-04 11:28:36.219953	f
71	6a0d3e8c-492c-443b-9abd-4c6d4e1eea5f	70	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNmEwZDNlOGMtNDkyYy00NDNiLTlhYmQtNGM2ZDRlMWVlYTVmIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.DeFN7eUYXxgicJoW18EmJBWnYlnM9D_cW-gMO4YpVWlYd7rl84b8NTsjPR14g0PsHINXD9CsSNRHK54kpQQInw	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiM2JiODJlMzUtYWVjMS00OTZkLWE3M2UtYjJkMWQxYWM1MThmIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjZhMGQzZThjLTQ5MmMtNDQzYi05YWJkLTRjNmQ0ZTFlZWE1ZiJ9.jnW9vi5yuGjH9L0Y8zi37QBxz6UsIvcteaTiisIitZe-QmWOoTIDqcRSP03PD8vm-y96NwiTn09hZ09T-hVHAA	2022-03-03 22:37:34.334179	2022-03-03 23:37:34.334244	2022-03-04 22:37:34.339426	f
69	b46fdd97-d5c2-4f76-bf9a-d15abc21e623	3	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYjQ2ZmRkOTctZDVjMi00Zjc2LWJmOWEtZDE1YWJjMjFlNjIzIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.oVPEzGB9e1-saQ-WsXl2a4mEvzjxoN6ulCSB702Eu3U2lI0580UMBNos3K7khqfBziiI_33hcLHrwpSk5iwzKw	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMTlkNWY2ZGEtN2Q4NC00MzYyLThlNTYtNTFhYWM5Njc5NzllIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImI0NmZkZDk3LWQ1YzItNGY3Ni1iZjlhLWQxNWFiYzIxZTYyMyJ9.o9V3F9C3D2B8j7fTaCh613sb73JFlB9YEVnS33ICJ786K2mPNnO4eZI9r1N_WlG0pekMkgApo4TxOheceJ5TcQ	2022-03-03 19:37:47.803263	2022-03-03 20:37:47.803542	2022-03-04 19:37:47.817553	f
70	f508d4b9-ddce-40ee-bd81-c4cf26a0fe1c	69	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiZjUwOGQ0YjktZGRjZS00MGVlLWJkODEtYzRjZjI2YTBmZTFjIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.JdKwZn5Kx_-FQoikwTpEXzgD0eLOKI7K3dzka8af6xY_Ou-zai_bUtT4SiBcsIyDrKKXyeoFaR0ZZIi4E0HxZw	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNDRmM2JkMDItOTllMi00YjE4LWE2NWYtZGQwZWY4NzliZTBkIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImY1MDhkNGI5LWRkY2UtNDBlZS1iZDgxLWM0Y2YyNmEwZmUxYyJ9.hVIyhtJ1XMKowyGcLSRTglOoME3lAodKasTT_756nCWzriaqaT43mUA4U5piCpNwGrourlq-zg5_w0gn_xUD0Q	2022-03-03 21:35:29.469208	2022-03-03 22:35:29.469622	2022-03-04 21:35:29.489769	f
76	aaa0a21c-ac0a-4b7b-a9c6-191c87a4ef0d	75	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYWFhMGEyMWMtYWMwYS00YjdiLWE5YzYtMTkxYzg3YTRlZjBkIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.fnKk3oJCx7eHQnm6ut6sib9a5TNWNFuoR41d7U0NYPjSsNJ4OBwq-v_Z4oDjqz07Esy0lpFqCr3GZOwi8RGm5w	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNDE4MmVkNzAtM2RmMS00MTkxLWFlNTctZWU2ZTliNGY4MWZkIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImFhYTBhMjFjLWFjMGEtNGI3Yi1hOWM2LTE5MWM4N2E0ZWYwZCJ9.YwBfNvHphbGRS-VF8eiBpjFOhPuPqt9DIvP8pvMBc9DiefEBOv2X0g4n6UZat0wcrbodxjQYPas09DQp1JGoiA	2022-03-04 07:08:02.525148	2022-03-04 08:08:02.525316	2022-03-05 07:08:02.652964	f
74	69603dfe-100d-40c3-a6e6-e94b9bba3a74	73	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNjk2MDNkZmUtMTAwZC00MGMzLWE2ZTYtZTk0YjliYmEzYTc0IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.kRDIN0DoBpHXTySetc2bdY_eWbanr5CWKBTf4J0zV6YBjevez3YDFd911fnpFImo_3TC4r7-ItkTVWSFLmX5DQ	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYzQzMDg3YWMtNTk4Yy00Zjc5LTliMjItNGI1ZDNiMTk2YjNmIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjY5NjAzZGZlLTEwMGQtNDBjMy1hNmU2LWU5NGI5YmJhM2E3NCJ9.yn_uYMI1c8nylVeStiXwEeRTT3Wz8_Yy9TL5kvkSXxaszAowvlrYsLk5p0ifPo1kSL8hAQR8MkYOmNtAglXSzA	2022-03-04 02:08:41.177383	2022-03-04 03:08:41.177441	2022-03-05 02:08:41.198465	f
72	e4c40bd8-d316-4135-811c-a1399a3da25c	71	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiZTRjNDBiZDgtZDMxNi00MTM1LTgxMWMtYTEzOTlhM2RhMjVjIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.zW2b4ghcAYzUxhJY40cqqdlcyzo4rj0-ay87TSu5OJozWKdoALZUEVPVwrM2M20Y9tyVCS8WuxQ53s2UPsFp9A	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNjE3YWJjYzYtYzQ2ZS00MmE1LThiN2YtYTU1ZmQ1Y2U3NjUzIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImU0YzQwYmQ4LWQzMTYtNDEzNS04MTFjLWExMzk5YTNkYTI1YyJ9._EhlZSjRboAjYqnAoaVLQpCsyWICNBRLkxZfYXBGWSJbtSOkJZTeA-sS-VLysR56PROpDZoj-HaY1SuKi7hCLw	2022-03-03 23:39:29.164421	2022-03-04 00:39:29.164485	2022-03-04 23:39:29.167202	f
75	08f64607-2245-4196-840c-35adc61777e1	74	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMDhmNjQ2MDctMjI0NS00MTk2LTg0MGMtMzVhZGM2MTc3N2UxIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.eNnifN5_ZqR7OeV1veiWVMo9BU-z3FxbWwNNGMFMWuXZPNbC3wBAeX1NWLYj1JCGxouW7SY4dpniA_Px5RHz_A	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNWUxNmY1MjYtZTYwNS00YTkyLWFiMDYtNjJjZTIwYzc0NWQxIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjA4ZjY0NjA3LTIyNDUtNDE5Ni04NDBjLTM1YWRjNjE3NzdlMSJ9.zhwWJBkKxiygpGV4uxik3pAX68zlmlctp01fxdhsHEWuTHMccq2U1k64Ldp9iasR_G7GpMHMWcO3KpRiTvTn7w	2022-03-04 03:11:14.09971	2022-03-04 04:11:14.099775	2022-03-05 03:11:14.101657	f
73	cf8231a4-5fda-487f-ba41-01c3d5b08761	72	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiY2Y4MjMxYTQtNWZkYS00ODdmLWJhNDEtMDFjM2Q1YjA4NzYxIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.D26p2GH9PK10ujQeBAqL6e3KdPOTPGIca0Ymp0tcALIriD5nzodAjjBmA5_oZEb6qZULYrQ5u0uVzr3-vVpx1w	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMmQ5ODRiZTctMzU0Ny00NmE1LTkyNjYtODdkOWIzNWUwMjUyIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImNmODIzMWE0LTVmZGEtNDg3Zi1iYTQxLTAxYzNkNWIwODc2MSJ9.a0HfO1UIDXEoZL7YiO8Eb3FnnZHaouNnz4GgeAFt7jAIl6cgT5j97gxkg87nzJceS0V5mMT5H53IfSIG4V5b0Q	2022-03-04 00:40:34.404729	2022-03-04 01:40:34.404795	2022-03-05 00:40:34.408203	f
78	cc0f42fb-8f9b-4214-a75c-f74fdff4ae03	77	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiY2MwZjQyZmItOGY5Yi00MjE0LWE3NWMtZjc0ZmRmZjRhZTAzIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.V8AKlksgvWMaqO6GRnjDpzQXfdK1S-ss_pi3U3Vj_GBFt3RGq68xorFHyPRtcdg9lM32OIFV2lzlhfk38DF3FA	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMWNiNTUzMTQtNzM0MC00NjQ3LTllZGYtYTQ1NWJjYmIzMmU0IiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImNjMGY0MmZiLThmOWItNDIxNC1hNzVjLWY3NGZkZmY0YWUwMyJ9.wY1l5COB6cwkQab0nxGPQWylyO61_d6921kqJWE6omQibteMtCf12gh6Mxl29EoeJ3GgYy2CrFgR2e1BDR0tcQ	2022-03-04 11:19:40.920641	2022-03-04 12:19:40.920805	2022-03-05 11:19:40.939495	f
77	214d9fdf-82f4-49d4-919b-34854b6509bc	76	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMjE0ZDlmZGYtODJmNC00OWQ0LTkxOWItMzQ4NTRiNjUwOWJjIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.CtQKpqYqte7uhT3AzUw3r-Qn2IBRLHnYrAEQ2nQHyIVgGGk0IYxzVB_cVf5FkwNp0OFPufZ0-cmJSnI4b4inGQ	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYmRlNzMxZmYtZjhmNi00NTk0LTk3MjAtMzJkYWQ4ZTNjYjJmIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjIxNGQ5ZmRmLTgyZjQtNDlkNC05MTliLTM0ODU0YjY1MDliYyJ9.hJnMm0Xmj8-Y06eeZdLQus6fuNfhW92Uvjk_tYYsoKs72LBTEAaGJPjF_QldeaxwIrt9ri2Oeuu0KtsU9bOd8g	2022-03-04 09:04:19.222977	2022-03-04 10:04:19.223309	2022-03-05 09:04:19.270706	f
79	993f6d36-d353-4154-9934-c0f73087632a	78	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiOTkzZjZkMzYtZDM1My00MTU0LTk5MzQtYzBmNzMwODc2MzJhIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.ZDfS6xuy3uSteNscmHlSHYFpAxnGtf3oAEWIE0-Oj6MtHlLawI3vzWW7Z0sF5oVt1VqzTwjt9S1GF_OXInYmZg	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiM2QzNWMzZTUtZTkzMi00NTMzLTgwZjctZGU3N2FiYmZmYTk5IiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6Ijk5M2Y2ZDM2LWQzNTMtNDE1NC05OTM0LWMwZjczMDg3NjMyYSJ9.ZZQigkV9z0jGS8s7of-whCt0jWzVaGprQNoLrdGtEIivhjb-Sa5xafTKF8hfXOAlVNPfwnoReCz27p-e5vdRFQ	2022-03-04 13:04:46.321615	2022-03-04 14:04:46.32169	2022-03-05 13:04:46.332212	t
80	4c3193de-65ed-4a31-b4b7-18b091923096	3	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNGMzMTkzZGUtNjVlZC00YTMxLWI0YjctMThiMDkxOTIzMDk2IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.mL9epWlGEYy4ZoC39IQ4otplsJOx6IHg65Bgs_1kz0zZUrXR-dOR-iWlz8IF4ZGS20dFjy3D5yFT2DAyVu0W_w	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiZjcwY2IxZDQtZGMyYi00M2M2LTliNWUtYTMzZWYwMWM5YWEzIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjRjMzE5M2RlLTY1ZWQtNGEzMS1iNGI3LTE4YjA5MTkyMzA5NiJ9.K1YbJ7KXX34wsXkf2B9ObIeXhZohfGN4hE7u3cP3m0b-TFUWa6ED20aG89gTOAMFTiKv7fotHLJODLrFzqMnPQ	2022-03-04 19:21:14.410447	2022-03-04 20:21:14.410587	2022-03-05 19:21:14.430856	t
81	0a8e6803-1ba8-44ed-8761-b04e3ccbb397	3	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMGE4ZTY4MDMtMWJhOC00NGVkLTg3NjEtYjA0ZTNjY2JiMzk3IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.YANm5kAfZ3IeQw5qtZJgjTAAM_Wo4W7DbmvSKNF4KocXYa2JV1DxxF8qf7DHOfJMdeJaRiunM7nwaabJH0LOsA	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMTgwMDQwNWItMjFkYS00MzY1LTlhNDctNDY3NjJiYmM2YmFhIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjBhOGU2ODAzLTFiYTgtNDRlZC04NzYxLWIwNGUzY2NiYjM5NyJ9.Pj7qBpKEuoHHb1Zc16CK0PP4P93slRz77bFlwy4-9OVGjDEF9erN3ikEcP5aAlXWGsjXCfrDmpyBH8ylUYhZlQ	2022-03-05 12:41:03.394456	2022-03-05 13:41:03.395334	2022-03-06 12:41:03.42766	t
82	6d67edf7-785d-4ad8-8f50-abb2ddfc3bd9	3	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNmQ2N2VkZjctNzg1ZC00YWQ4LThmNTAtYWJiMmRkZmMzYmQ5IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.SLiMBTGKgmC8dKUYKVd1gfMHpu0aSjI_F8R1zbYotz_8hbZh93cF0OSk92akbUfCdck9ArF6fOeIK35chd7jag	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiN2JkMzE1NjctYWVkMS00NjM5LTg1NzYtODk3NTE3MmY1ODgzIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjZkNjdlZGY3LTc4NWQtNGFkOC04ZjUwLWFiYjJkZGZjM2JkOSJ9.UYHscN52bphGUyuDSvFNlNclHjjZpiP3qV9lmLgUBJEJ-cPsjIUZbd1TU37k7ZxW3V6tM15Uu8x8kho1oSN9dg	2022-03-05 12:47:30.57399	2022-03-05 13:47:30.574145	2022-03-06 12:47:30.582743	t
83	f22a4f74-7c56-45ec-92b6-e594b9caacd0	3	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiZjIyYTRmNzQtN2M1Ni00NWVjLTkyYjYtZTU5NGI5Y2FhY2QwIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.BPIhhXH335WPgaWlQXX-EzR8edGsio0R1WZfeSlVy8_9Lqp8yRi_W6az48IGIzKuwW4GINU2W7a8o6--LKD6XA	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYmI4Y2ExMjgtMWI3Mi00YTVlLWIxOTEtM2I0YmU3MmYxZjFiIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImYyMmE0Zjc0LTdjNTYtNDVlYy05MmI2LWU1OTRiOWNhYWNkMCJ9.gpu3HJOiEvy9YFfp3YfG0LDmL33OSfroGL7Ob1A9TcjA_NL60FVDWVKLqwFcziFsFAm4whp6qqK7SnU_3O33JQ	2022-03-05 20:20:14.176045	2022-03-05 21:20:14.177377	2022-03-06 20:20:14.188248	t
85	cb8e9e03-1201-49fe-9780-9782bba757b8	84	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiY2I4ZTllMDMtMTIwMS00OWZlLTk3ODAtOTc4MmJiYTc1N2I4IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.G49UurWWzv-Gg9pHS1HjA4Gg-dEq4gud2tYJmTZ8oqH5bOU8WS2B__SiLTszKOnEuRbg8DFlTCdxArK6mMtkKg	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMDgxMjEzMmItZTc1MS00OTcyLWFiZjQtOTdlZTI2OWRmYzhkIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImNiOGU5ZTAzLTEyMDEtNDlmZS05NzgwLTk3ODJiYmE3NTdiOCJ9.e-029Qsg7F7u64apyOIWuOeMecHVSAgisbKROM43yfOZUkLoymDg0RngmSUYwHL4vAzD9KXj891vQpnje1upLw	2022-03-05 22:58:48.154232	2022-03-05 23:58:48.154311	2022-03-06 22:58:48.160477	f
84	5f97196b-fa16-41d4-8535-bb322bce1106	3	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNWY5NzE5NmItZmExNi00MWQ0LTg1MzUtYmIzMjJiY2UxMTA2IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.rqujWaHA4NGlTHUrBZPrre8Rp3tp7r8utTaCF6PIMIhg5mSgZrPkxGPTo0XSI7GbciOjn2lPG9dtm8UtB7rbvg	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNjY1YWFlM2UtNDE4Zi00NWVlLTkxOTgtMDIxYWQ4NGJjZTJkIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjVmOTcxOTZiLWZhMTYtNDFkNC04NTM1LWJiMzIyYmNlMTEwNiJ9.Hz02o1ELTzWkSkJ6tNPaZHS5WQ0id4ysO-YQ1BNA_Kl1HE6Gkb1RxF4oyezoXb7eUzU1hmm9Kg5gQp2KBZVNLA	2022-03-05 21:13:26.271025	2022-03-05 22:13:26.271107	2022-03-06 21:13:26.276682	f
90	cc702c8a-99b0-4752-af08-6ef9132c1cec	89	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiY2M3MDJjOGEtOTliMC00NzUyLWFmMDgtNmVmOTEzMmMxY2VjIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.04175y76nBXhqJm8bSOmj0WnfYIt98TioHpTh1Ng9SWP6vFRfCej2AMD7ozHTee0_RdFF0yei6opyLIBFtDPFg	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMGZhODRhM2EtNGIyMy00NmZjLTk1MDAtMzFlOTM0ZTUyYWM3IiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImNjNzAyYzhhLTk5YjAtNDc1Mi1hZjA4LTZlZjkxMzJjMWNlYyJ9.RUd20isuow2fXCIVbTgMh7CRl1_oYWRNAjFtilacvYbb4TrStQaO_Cuuab1s7Q03geUKK4YyiWkqWj74NNpX1A	2022-03-06 09:37:15.359643	2022-03-06 10:37:15.359728	2022-03-07 09:37:15.362097	f
88	0fe551c2-12d4-430e-affd-da7fd97b0125	87	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMGZlNTUxYzItMTJkNC00MzBlLWFmZmQtZGE3ZmQ5N2IwMTI1IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.b2uxudmxNPe9dUfLOxTsWuBZQ5xFzTpYuEOjLbSc_vwzdgK18IsPcWNIdePIoZXV_TUjvt8PfDJU4ALSSdrymw	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMWFhNWFjOGMtOTU0My00ZjdhLWExM2QtNmNiMmEwOWUzMjc5IiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjBmZTU1MWMyLTEyZDQtNDMwZS1hZmZkLWRhN2ZkOTdiMDEyNSJ9.K2o9eEl_5kRsU1mqm8ht4mESA9pmkBqTTJl1qbp1GCt9Th7ArgsbI7RMJr0W1HpvAcT221FAGyR07GVF_3i3kw	2022-03-06 04:15:33.510593	2022-03-06 05:15:33.510644	2022-03-07 04:15:33.51792	f
86	5104bca4-5894-48f4-91a8-7376cdd159f9	85	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNTEwNGJjYTQtNTg5NC00OGY0LTkxYTgtNzM3NmNkZDE1OWY5IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.jdH0prbwUXxRQpaSLXBmJRCsBpRUS6EFFSIk9b1k8AJ5lkVcyN6XMgPC3sLULSdykelnGLAwLiXl1yKO0s7F1Q	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiODIwODI5OTMtNDBlZC00ZjBmLTk0NGUtOWZiYjVkZjkxODNhIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjUxMDRiY2E0LTU4OTQtNDhmNC05MWE4LTczNzZjZGQxNTlmOSJ9.SK9GDFJGkDWjl_JXbMw0m6qi8HInhffJUzIZ5FmW0NJGJZHdiRUGraVitMsqZt_ZU6tk615K2mV7RZKe81vEOw	2022-03-06 00:13:22.916906	2022-03-06 01:13:22.916955	2022-03-07 00:13:22.91899	f
89	e97f8789-9b1d-4f92-972b-6e99380d5b8e	88	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiZTk3Zjg3ODktOWIxZC00ZjkyLTk3MmItNmU5OTM4MGQ1YjhlIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.QcuaxxIy7lKdn3aUUue_PbwNKSZZa35Cp10hMslGUX9JO3J7a_OLcFOEKG4aYhN_SZCv0D_89Ahe5Y_Sc2oagw	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMjBiMGU4NjUtNjc4Zi00NjVkLTllY2QtZTQ3NmRiZjgzY2NlIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImU5N2Y4Nzg5LTliMWQtNGY5Mi05NzJiLTZlOTkzODBkNWI4ZSJ9.xdRODtCjCscErAVw67gj5a2S8ZJBRBZf_kim-FdTzSyAtp6Y2GNw9lMrToBG_Zuto91XYqFkBtptdGLmN5Z4qA	2022-03-06 06:55:17.588602	2022-03-06 07:55:17.588657	2022-03-07 06:55:17.638731	f
87	ae618abe-eb67-41a4-9c2a-03415d89c63b	86	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYWU2MThhYmUtZWI2Ny00MWE0LTljMmEtMDM0MTVkODljNjNiIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.gvszBIn4anVY56dvSY96zDPXXGKKJzIOoAmDryLCiFcmbAAvC1_u2QpdIIqkDRzUk4pdfzV2LL5uluCX_VU9wA	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiZjU3YTAzMjItMWJkOS00MDFiLTkzZjUtNDYwM2Q5NmEwZThmIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImFlNjE4YWJlLWViNjctNDFhNC05YzJhLTAzNDE1ZDg5YzYzYiJ9.B8f14rja1OFUmJLHjXyNurdwIm-Q67wgyfmwBtcJOlw6Rc_Dh6wP3Is7BrVeb4a8zKgRjV3ls_16kubM6xRpsg	2022-03-06 01:33:51.184132	2022-03-06 02:33:51.184182	2022-03-07 01:33:51.191138	f
92	88a8b913-264d-4e10-b91c-be6b076501ab	91	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiODhhOGI5MTMtMjY0ZC00ZTEwLWI5MWMtYmU2YjA3NjUwMWFiIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.Wnt0XcrHZF-zRXmK7i6ihq9oZcDVcXcHq8Vb0Mwp5CtAYTyWNhkC0rqxdlVGeTC-puGYhbN8GCpOPH6M2IhKWQ	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYjMyNjE5YTktMzkzMC00OTM2LWFjYmEtNTc2OWEyNjk1ZmNkIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6Ijg4YThiOTEzLTI2NGQtNGUxMC1iOTFjLWJlNmIwNzY1MDFhYiJ9.NpPkgmVUfvzZFIJu-zQRv_0TaRUhdln-JYqd8fFfu8dEO47RryBlnXUh7haAFA62NHnuEaDtJMOCbWFST7kaKQ	2022-03-06 15:25:20.080489	2022-03-06 16:25:20.080545	2022-03-07 15:25:20.084096	f
91	9708a883-ef8a-4805-b6b8-77c3ac963581	90	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiOTcwOGE4ODMtZWY4YS00ODA1LWI2YjgtNzdjM2FjOTYzNTgxIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.08YAI2_TnFlt7QPOaDvuF48DH0zDfnfQdZwKpEOjXwZNRsJliQt5LvXvah-j9KGTh0xE91gqWBI3TRVASAgkmA	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYmNmYzRlMTktN2E3Yi00MTgxLTgyZWUtNDZiMmY5NDRhODNlIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6Ijk3MDhhODgzLWVmOGEtNDgwNS1iNmI4LTc3YzNhYzk2MzU4MSJ9.ISkRWHiAZPtlIDxADFU0Ufv2z4HEyMwcg9Qd09S__znx1v6mkcu0_hj3IBMYNgv7GufCmEIfGDC33q0GMCaNpg	2022-03-06 13:24:14.112252	2022-03-06 14:24:14.112305	2022-03-07 13:24:14.114249	f
97	bcbdf545-2e2b-4f17-8842-166a466a5c02	96	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYmNiZGY1NDUtMmUyYi00ZjE3LTg4NDItMTY2YTQ2NmE1YzAyIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.ZWrQgUQDCWO22_3-oscXqcpGXSfcaNE4KYl4Qz6ZFE7hJn_HhqsVc-n6xlZLVPyPCwWlbraS1iOG3Y-DkgmZmQ	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYTVkODg1YjktZmRhZC00NDI5LWI4N2YtMDkzMWQ0M2NlY2JlIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImJjYmRmNTQ1LTJlMmItNGYxNy04ODQyLTE2NmE0NjZhNWMwMiJ9.bKAxi5SDmbbty_eaMYPfOayvPxrIvdtoXUteKeCt_wn5VDfct3Dkv26bx_8dQxBs-aeJqG56DDFFHUTAf9O9TQ	2022-03-07 05:07:27.906457	2022-03-07 06:07:27.911914	2022-03-08 05:07:27.927276	f
95	3f5c9147-6eb0-4717-97c8-5bef1e369ebe	94	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiM2Y1YzkxNDctNmViMC00NzE3LTk3YzgtNWJlZjFlMzY5ZWJlIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.f4H6MU3ox2UDAIOAMApLMY5fsF6yb8U3aDkXXzebquEpIbYm91D14iv_ixjaKdhUKUPrxq6DlM_fVErmkJC6WA	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMzA0MDA0ZGEtOThhZC00ODBjLWE1OGItM2QwMTBiMWEwYjJlIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjNmNWM5MTQ3LTZlYjAtNDcxNy05N2M4LTViZWYxZTM2OWViZSJ9.FyN9EX6t1FyKm08ar84iffbGdFdkhldlbe8EZlqEgdXiB_YfuxxJRvO4kH0N9fbgUmdVYPj2H4PMgZPWoIDGPg	2022-03-06 19:58:38.817153	2022-03-06 20:58:38.817184	2022-03-07 19:58:38.82055	f
93	45e9153c-db3a-494a-a30c-fd088d8f7bd8	92	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNDVlOTE1M2MtZGIzYS00OTRhLWEzMGMtZmQwODhkOGY3YmQ4IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.YCxHnZPE0u14LIfd6UxVOv1LLP8w-8WxjmQQIG2LTqWobLVEYhq3QtelmDAhmqYwIqBDkuIQNn8sCKHn6k8muw	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNzYzZmM2YzQtNWNiMC00YzAyLTg4NjYtNWI2ZGVmMzU4NTM1IiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjQ1ZTkxNTNjLWRiM2EtNDk0YS1hMzBjLWZkMDg4ZDhmN2JkOCJ9.d1Q8rzU759P6aekjG6ErngaHc7XG1g23bKF__YRRF0S21ZC_bN2oVMVyQwysE0QSBzA4u5KO-DoGhd5LZPwm-g	2022-03-06 17:30:05.465537	2022-03-06 18:30:05.466553	2022-03-07 17:30:05.468123	f
96	aee4abb9-5015-46c7-951a-be0f6efe3952	95	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYWVlNGFiYjktNTAxNS00NmM3LTk1MWEtYmUwZjZlZmUzOTUyIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.LWJm-_2uXIpj3agso7vzww1EAoBffyV7pWAp1ddrHt38HfR4xQmbQlCcLKFcVfBf05mSPFvzxqvbOOaa_R_jxQ	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMTdmZGJlMzgtNGNjMi00OWE3LTg3OGYtNzgzM2UxZmM1MmVmIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImFlZTRhYmI5LTUwMTUtNDZjNy05NTFhLWJlMGY2ZWZlMzk1MiJ9.82HjmJOYNDxRRexx5_lWlKxGfHlihZWZTsCyQvEglJeNOzQzSEQd7dBqJh8YMG8n_ShLdjWPCUU-t9r5l3dZAA	2022-03-07 03:51:49.381006	2022-03-07 04:51:49.381052	2022-03-08 03:51:49.385093	f
94	152638a0-c119-4781-b623-d498e86554f7	93	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMTUyNjM4YTAtYzExOS00NzgxLWI2MjMtZDQ5OGU4NjU1NGY3IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.88cUA4zyZqY3XKyfQkTjTPQTEnwe5d284qsoC6dA6fS5oTpmrDv7xgKHYg4TBjUPWo4mUzJFAu5VYWTM7XOI0Q	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiZjQyMjRkNTItODIyMy00ODYzLTg5MTAtZGVhZGU0ZmRlZjk1IiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjE1MjYzOGEwLWMxMTktNDc4MS1iNjIzLWQ0OThlODY1NTRmNyJ9.by0U08sTSRAHkBaRTyw4J7dfORWUVzCnMh2ZUvr5p4ty0X-NXW3yM6cJjPTJWgsaoQ1gz03SC6fhwI_BiiUquQ	2022-03-06 18:40:07.744958	2022-03-06 19:40:07.745129	2022-03-07 18:40:07.774262	f
139	c807ed8f-a255-47e2-b217-79be08122606	3	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYzgwN2VkOGYtYTI1NS00N2UyLWIyMTctNzliZTA4MTIyNjA2IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.xozIb82Z1QfCoNOIUe0MRRRYoK-xMu_DLDfT9hmzlHRFmrPdviPoxT2AVhwtfLGIfIiU2noUKXDrQw48b3DTvg	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYTAyYWZkODMtOWYxYi00MjA0LTlmNzctYWIxZDJlMmQyZTAwIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImM4MDdlZDhmLWEyNTUtNDdlMi1iMjE3LTc5YmUwODEyMjYwNiJ9.9SvNpSO3sou1Wfu469DjbFo8UjhR46L6sIGxKdCIEeku7_HbD9mtGnA21it9oabfn88HTD-9H_Gup2Sa4TFEIw	2022-03-08 20:23:42.540468	2022-03-08 21:23:42.540677	2022-03-09 20:23:42.555263	t
98	1620b03d-f89a-4e8b-a2f9-22383399ad33	97	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMTYyMGIwM2QtZjg5YS00ZThiLWEyZjktMjIzODMzOTlhZDMzIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.sY2r0IBqtU2aCgRpUeWGsQolemBv6TPmC02lUF5lmOAA1WV-bg3ZgPEMD2zK5FzJGdmQmNvQ90eemaA9tiH1lQ	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMDk4NjhjMzUtYzQxMC00M2E4LTgwYTItOTJkYjdhOTExNzE3IiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjE2MjBiMDNkLWY4OWEtNGU4Yi1hMmY5LTIyMzgzMzk5YWQzMyJ9.YzZ8Tih2kbsMo4U-ltNgsYhCQeo07K_O4HSM0_UKmBLWdaxBokGjuI-fVONNEGX1N0rYCg1jfBNlObkv-YIslA	2022-03-07 08:35:28.851895	2022-03-07 09:35:28.851938	2022-03-08 08:35:28.854452	t
99	a8a0ce5c-bc60-4455-962b-78fb4a2e70ca	3	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYThhMGNlNWMtYmM2MC00NDU1LTk2MmItNzhmYjRhMmU3MGNhIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.V21W4GoYRs9VAM9J5df_-JsMiSY2H5ZXvmWpNG2Trlwm694BHReTYQAc7R0HSZHehnnQaEy7Mqss-_5ZUgtTIQ	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMGYxM2Q2MWQtZmQwMi00N2YwLTkyODAtZDgwZjljOWFiZGJlIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImE4YTBjZTVjLWJjNjAtNDQ1NS05NjJiLTc4ZmI0YTJlNzBjYSJ9.HsTf1Dci-Az4qk-0oaNPZT_4m5oyf_qdhPK6RxA3v8x_Z126TqhOEpRmlgI_3qQAYC-SDsdNOxtJMfQUKt6Nnw	2022-03-07 15:46:32.902344	2022-03-07 16:46:32.902569	2022-03-08 15:46:32.926833	f
101	e952ae16-4498-43c1-bb59-5331bd10c66d	100	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiZTk1MmFlMTYtNDQ5OC00M2MxLWJiNTktNTMzMWJkMTBjNjZkIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.FbiRFidkQ_OR3AjmF9a4LqWyNAOmJpPpogBDAb6zGnNkUdXyv60HzgUEZyOxjetEXVgFPSjJocOrSrrMfwfA4g	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiZDM3ZDYyOGItZDRkMS00YWIyLThiMDYtNjlmYWE0Yjg4M2Q4IiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImU5NTJhZTE2LTQ0OTgtNDNjMS1iYjU5LTUzMzFiZDEwYzY2ZCJ9.u_s385VUTWZYlP96v_utAqlHGXMh3mfn2NHTJhGckq5AR0AiAEvzwYkmMuJ3NFWQ_9-YHNbwRuMArnYsmoYbfg	2022-03-08 00:35:55.286167	2022-03-08 01:35:55.286317	2022-03-09 00:35:55.310391	t
100	d540c060-3a2f-4479-86ff-92922bee8637	99	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiZDU0MGMwNjAtM2EyZi00NDc5LTg2ZmYtOTI5MjJiZWU4NjM3IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.mjE-NQ2g5HhlalKICB06JFEnQF9-vbk9DGGR-tGQ45NECZlkyayx0_7-XS7sJYfKlC05nY6JZqO0FBnwh6sRGQ	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYjEyMDk1ZjAtMTY1OC00NGUyLWE3NDQtZTk4YjI3OWYwMWEzIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImQ1NDBjMDYwLTNhMmYtNDQ3OS04NmZmLTkyOTIyYmVlODYzNyJ9.LTqlcbeLT_fCc_Ix_Y5EM53pQQFRfp4avuf1073E2uISrVPCJWkWPAIxq7zvvMoymeaKEw5AvLIJITW-ZFO0mA	2022-03-07 18:23:37.162227	2022-03-07 19:23:37.162325	2022-03-08 18:23:37.174976	f
134	b7646f86-38e9-4c81-a584-d9f90cd03d39	3	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYjc2NDZmODYtMzhlOS00YzgxLWE1ODQtZDlmOTBjZDAzZDM5IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.xWLSnY6TPWVZ_cnza4DA0z8zDhD0U-8cEFWVjI4-aRDXplrMF5cW_uUDnYrkmugr85HkHtPXng3_RfZmdxjknQ	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMDQ0MTg1MmItNWRjZi00MTk4LTlhMDMtZWU2MTkxNDJiMmY3IiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImI3NjQ2Zjg2LTM4ZTktNGM4MS1hNTg0LWQ5ZjkwY2QwM2QzOSJ9.BGTZtKvxEcSzC2pbVO6XF1Mv79ZXo2UF0aB5-3YYLSy29OP7-AlP8lZksapVy2RyxPSJ9ZdX8FietCfeFaBCvA	2022-03-08 15:24:17.072796	2022-03-08 16:24:17.073023	2022-03-09 15:24:17.09031	t
135	683924c9-5185-4d98-af03-7c791822ae6b	3	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNjgzOTI0YzktNTE4NS00ZDk4LWFmMDMtN2M3OTE4MjJhZTZiIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.wg-G_YCLK7t7Id6_CXRQytt3_Q2CVhnpkxunjW1EKQd1-SP0D1pRESEyC5sCZPr1ueXdNuxiHswmjI6Hzi3bLg	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiZjIxNmVhYzYtNTg2Ni00NTdiLWE4MTQtN2I3YWI3NmRiZmQyIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjY4MzkyNGM5LTUxODUtNGQ5OC1hZjAzLTdjNzkxODIyYWU2YiJ9.KBY4gvD3_RSfUABL9umgsu18JCf8pTYwMTdxvia64QwAMJcQGv4JlfAkYn4I4JNCV_WDLlvfY28_F4-SbBgJiw	2022-03-08 19:30:06.586362	2022-03-08 20:30:06.586545	2022-03-09 19:30:06.592642	t
136	3c776ddf-7a4a-4209-b7b8-32251eb3ff11	3	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiM2M3NzZkZGYtN2E0YS00MjA5LWI3YjgtMzIyNTFlYjNmZjExIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.WGyW4UqSumy63OpBCThGwk2CoiMx2wEihO7fz62pun-dM5PgCvqEv8_Ph4yiTveAZssYXjn2XK_zg1aEuQQeLw	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYTZhOWNjMTQtYmM3YS00ODNiLWFkMzMtYWNmOTkwNWExMDM3IiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjNjNzc2ZGRmLTdhNGEtNDIwOS1iN2I4LTMyMjUxZWIzZmYxMSJ9.prTGbpAqjC2gNrsI-YChu-s7zP7C0sYRpwMbNjfINL6HRQ2jsuYZQB9v5Sr8zH49rhdy_-4UqD7PaTb9q7Ey-w	2022-03-08 19:45:53.348581	2022-03-08 20:45:53.348645	2022-03-09 19:45:53.36545	t
137	d99f4851-65c0-4af6-8d58-0ff61b0845b1	3	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiZDk5ZjQ4NTEtNjVjMC00YWY2LThkNTgtMGZmNjFiMDg0NWIxIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.WJQjxu847UjAEAH29a4PiJT91emmtFJmKyWF03uHfainuloMJnXjw5NHN-Fr1bEpLkLpQ5fas-914_MJoPOrdA	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNDQ1ZDNkMDMtMzk4My00M2FhLTgwZmItZmIyNDNhYjE4ZWUwIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImQ5OWY0ODUxLTY1YzAtNGFmNi04ZDU4LTBmZjYxYjA4NDViMSJ9.B5_hOymdH3Dj5XFu2vmG6HzCIV5pMugDaxLVNjztVZvZkmz38TmQZ3un4rZ6KB2XKnsSUvtPlJTBGjvGam74rA	2022-03-08 20:02:02.736964	2022-03-08 21:02:02.737115	2022-03-09 20:02:02.767779	t
138	31158f0f-7c74-4fcd-a10f-8ccf9ab4e262	3	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMzExNThmMGYtN2M3NC00ZmNkLWExMGYtOGNjZjlhYjRlMjYyIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.doCtLf1dAXub5-2CDwummPtOhvJE_QCT8iStR9WlNthVJWApbRSHtQepYKBgTkvLjbBPe8Gw-jITMQPmKRmqew	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMjQ2NTlkMzQtYzQxMi00MDYxLWI1YTAtNzk0NTQ2ODRmNmFlIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjMxMTU4ZjBmLTdjNzQtNGZjZC1hMTBmLThjY2Y5YWI0ZTI2MiJ9.Tg7sh-lnsJgYKdHSWWbniaBhAWssXIBg_MNUb6dxyPhPfkBgnVzYddpteZnrJltrPahq64eFs-c1X5S_Cfrbnw	2022-03-08 20:12:11.17207	2022-03-08 21:12:11.172266	2022-03-09 20:12:11.189141	t
140	2cb107cc-d29b-446d-881f-36ca1c4d36a8	3	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMmNiMTA3Y2MtZDI5Yi00NDZkLTg4MWYtMzZjYTFjNGQzNmE4IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.vTh-qx1DtJGPLXURNK_8QGMsWAsm0qQ6ObzJHA6zgEAWDNkBBNVRpgcCfxVc83B_xxU7qLccL0-dpsU0TpAFwg	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNGMyMTg2OGUtNzA4Ni00ODhlLTllYWYtYTMwMmU5MjMzYTg4IiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjJjYjEwN2NjLWQyOWItNDQ2ZC04ODFmLTM2Y2ExYzRkMzZhOCJ9.dvlWgf0nHyv_AUZKcqPr3xFc7X_1HY8rmbwdVoC69YLH3u4ONaOq0XFnr4h7ViLggreFM7ErHllvb1DImhJrYg	2022-03-08 20:26:31.18753	2022-03-08 21:26:31.187608	2022-03-09 20:26:31.193724	t
141	43957f54-9058-42d9-9e20-e44d01c40b49	3	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNDM5NTdmNTQtOTA1OC00MmQ5LTllMjAtZTQ0ZDAxYzQwYjQ5IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.U8tdsbUOriiGbHIZMWx_EObt1VABY_lk-gHkxJ8-hmCWK1SwSulXa8D5PVuwSmP44kK47dLamlsoT5eSCKyCZg	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiOTczZmQ3NmUtOWExOC00Y2E2LWJiMTUtOWY3YjE5MGY2MjQxIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjQzOTU3ZjU0LTkwNTgtNDJkOS05ZTIwLWU0NGQwMWM0MGI0OSJ9.n3pw8XYwqMJed3BHLJBZw1wXByqV11p4cARY-q-fKCATx0HOOjtfeHXrWA5UBXkYFXskIxeGqF1FLOmhU2KsQQ	2022-03-08 21:14:43.693093	2022-03-08 22:14:43.69328	2022-03-09 21:14:43.705256	t
142	b62f0032-5af9-416d-9f0f-8a7a934a2174	3	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYjYyZjAwMzItNWFmOS00MTZkLTlmMGYtOGE3YTkzNGEyMTc0IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.FgQyE2OkIqvSYISckGtsXG-ddp7d-SEBigF7gbLFotD50pnMpJQ2byS5kYazjzgL_UM0-i0cbWs01hpQwA9FXQ	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNTYzY2ZlMWQtOGVhMy00YWQwLWFkMmYtODQzMGVlNTljODU2IiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImI2MmYwMDMyLTVhZjktNDE2ZC05ZjBmLThhN2E5MzRhMjE3NCJ9.gC8U6SyksLY4NkPIvdOgEL41aXcueBAtIQpcslGCSJ7MIlsio7ZC0HkekTivOsHGnKGiX2tKZH4iUFw915I1-w	2022-03-09 01:32:32.904508	2022-03-09 02:32:32.904716	2022-03-10 01:32:32.918087	t
146	c1d9e799-1baa-4926-bfa8-e37d05e299e7	3	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYzFkOWU3OTktMWJhYS00OTI2LWJmYTgtZTM3ZDA1ZTI5OWU3IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.Un78ZeL76UhuLsRfpu5lbuckJ2UwtouSpVGfIKq5ac47C9gUd0AwWEiRlP5B3zYZjf0XQ4vdrgqzyKQaow9YSg	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiZmJmYWZiNTItM2NiNy00MmJlLTkzNWUtZjliODc2ZTA4YjQ3IiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImMxZDllNzk5LTFiYWEtNDkyNi1iZmE4LWUzN2QwNWUyOTllNyJ9.TUNVsd2PccCNwiGeyCys5bqX5YMZKpWUEmp9Y-kMsV46psPElphtYvY92CZQY6xZh143ggx4HgBNfPUztYBtvA	2022-03-09 13:55:33.943041	2022-03-09 14:55:33.943105	2022-03-10 13:55:33.967363	t
143	b2482f8b-4d40-4c71-9daa-0924c56ed0a7	3	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYjI0ODJmOGItNGQ0MC00YzcxLTlkYWEtMDkyNGM1NmVkMGE3IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.PXHOxc_4X2awYGRYNcrGjjneRM5wRKoj_idezTrxgEzegZHQWGAx5FdaUE3maTihGP3S7Yx0M7hmKHcezGETWw	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMTc5OTViNjAtMWUwNy00MmZiLWFmOTMtN2Q3YzQyMDQ1MzRhIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImIyNDgyZjhiLTRkNDAtNGM3MS05ZGFhLTA5MjRjNTZlZDBhNyJ9.8G1erDlvOJnJtUXczt30YOQxKWD7E-g7onyq9oU8oVVNcen2pyTzGh9QApiVvfH3kOxf0J-yfDDpoCRnhhmrSg	2022-03-09 09:09:08.304946	2022-03-09 10:09:08.305246	2022-03-10 09:09:08.347551	f
145	a216f769-b5c0-47ba-b6a9-924c6f694115	144	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYTIxNmY3NjktYjVjMC00N2JhLWI2YTktOTI0YzZmNjk0MTE1IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.M8KUWjWIcKvrSxPJtn1Cimj5jZFoJa8KKJEnOPm_owYAbYK_9kzpR44w2dhQq8B0yQjEwkiyTJwbFn7UF5if6Q	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNzQ4MDBlZTItZTk1Yi00Njc2LTg5OTItZDcxYmFhMDNhYTMwIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImEyMTZmNzY5LWI1YzAtNDdiYS1iNmE5LTkyNGM2ZjY5NDExNSJ9.IHggu60snxpou5Nj1QxS9a6ssyZQXHb0I4wF2N8gGY-usq1goZnhY3eLjonH1ARtmXtoknZ-kVNePxhuiC60Dw	2022-03-09 12:54:59.584131	2022-03-09 13:54:59.584195	2022-03-10 12:54:59.5897	t
144	9c096207-6e92-421f-923a-b29447d1323b	143	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiOWMwOTYyMDctNmU5Mi00MjFmLTkyM2EtYjI5NDQ3ZDEzMjNiIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.fIcVoyzkIxf851lMbOiD7Pb8MLB9IYr9-mNt9_5rUnfS-JsxReY2CFx-lKugFagTHbD3-qpbwY8fkpFCBBTRdg	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMjkzZDE0YzEtYTNhNS00N2YzLWI1NDgtZmU3MTdlYmRiZWQzIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjljMDk2MjA3LTZlOTItNDIxZi05MjNhLWIyOTQ0N2QxMzIzYiJ9.f6OjRdtnrqJ-_gV5nqxVmFXvZd5ThoNoZP_BAB3-5-wEyFsQWUW9ziWr4qm2VxfXKDZLRYfHgjm2zMI6b-Vh9Q	2022-03-09 11:36:46.315512	2022-03-09 12:36:46.315589	2022-03-10 11:36:46.320229	f
147	729e65ea-f0ce-4bfd-9758-510ca17ecee1	3	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNzI5ZTY1ZWEtZjBjZS00YmZkLTk3NTgtNTEwY2ExN2VjZWUxIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.VGv57Ue7DxMEgOK-n_0bTwgHUs6thhm2Pt8wiQHBq0PWNaO_5kj2Lh5Ea9iy_kM9CpGNAOHGT5Rx1lP4iY0gUw	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiOTU1MzMwNDctYzEyMi00ZDUzLTk5NjUtYzEwM2I1MmU1YjAxIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjcyOWU2NWVhLWYwY2UtNGJmZC05NzU4LTUxMGNhMTdlY2VlMSJ9.36VCKO8i5htBozq_bGeoO0A8TzB9hyJL2CVn3OHW-wCtkJAVU4cCtnvQ9xllZFP3S_yGlhN0amHKjxggTG1CGQ	2022-03-09 15:12:55.282022	2022-03-09 16:12:55.282081	2022-03-10 15:12:55.288431	t
148	8d439a89-7f9e-4ce8-9798-d709504b68aa	3	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiOGQ0MzlhODktN2Y5ZS00Y2U4LTk3OTgtZDcwOTUwNGI2OGFhIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.mk4-CNSZL1gXsyvDVm_mHr2Dm_awjMLw6YtMNZnLrjz3VlRYtORBILPGRPatAIczKu84TJKOhdrFsbAX17WGQQ	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYTNhZjEzNWMtZDRmOS00MTA3LThkOWQtYzI1N2I2MTMzNWEzIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjhkNDM5YTg5LTdmOWUtNGNlOC05Nzk4LWQ3MDk1MDRiNjhhYSJ9.Gvh-fWPpFXEJ1D0lDpkmWArqSDRSmlL5RPYUXTno0PARbPX9CWOVSYHiK85t0_-FVQe04EWqKO1mpJKbVDNs6A	2022-03-09 15:36:35.695781	2022-03-09 16:36:35.69582	2022-03-10 15:36:35.719055	t
152	6d5705e9-9a5a-4b98-b860-b2d26bfec0f6	3	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNmQ1NzA1ZTktOWE1YS00Yjk4LWI4NjAtYjJkMjZiZmVjMGY2IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.s9SnjrT8CX8z_2EmBF-g7przsGaKUGQWHx6TMnj0McMJuEPk_0PCpLwqMeqQSr5ijOVCb2yrPs_nB2qti3Rv1A	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMGNiZDM0NjAtYmFmMy00ZTFhLWEyZTctZmMwZjg5ZWRlNmJjIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjZkNTcwNWU5LTlhNWEtNGI5OC1iODYwLWIyZDI2YmZlYzBmNiJ9.wZ2Q2E4Fto1BC0NNsR65qN-AJFVPy8jLdMKP5lR6YEFIPEGFnNkKcYk_0BVaUGsEk0EHeqF2VObYEw7YCj1NVA	2022-03-09 19:56:23.230829	2022-03-09 20:56:23.230973	2022-03-10 19:56:23.233988	t
149	ff231f20-5d94-4c11-a495-0ef85a981302	3	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiZmYyMzFmMjAtNWQ5NC00YzExLWE0OTUtMGVmODVhOTgxMzAyIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.9vC5tt_VL6VX-jjV2R-EGyK7b9Sr00oEEaR1ragIkpTtVKwYQp0yNFImakfejunoHmbJED2unMjVCvnk9bysnA	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYTUzMDM3Y2MtYjdiMy00YjE5LWFlOGMtZWNhNWJhNzRkNjA2IiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImZmMjMxZjIwLTVkOTQtNGMxMS1hNDk1LTBlZjg1YTk4MTMwMiJ9.P_vtD5pDQGaUIs0y4SZrxf53XWsgMi8JLAUpRk14_Dzrt3B-aPO8gcLKcptj2mKbJm7TeOjbkqJeWRqDDSIt1w	2022-03-09 16:21:21.566883	2022-03-09 17:21:21.566917	2022-03-10 16:21:21.568649	f
151	56a2622f-600c-45c9-b6eb-113be8a8f7ff	150	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNTZhMjYyMmYtNjAwYy00NWM5LWI2ZWItMTEzYmU4YThmN2ZmIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.VAyxSjv-gipXz6Pik4EWE4md1_r4DFqUHIYc7jg1FDKrQhEDNtpdg82mrPB-K8byTPAU2y9sdncdbTXI_UPL6g	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiOGE0NGExMDItN2M4YS00YzVlLTliZWEtODUxMjk1YjcxNDNiIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjU2YTI2MjJmLTYwMGMtNDVjOS1iNmViLTExM2JlOGE4ZjdmZiJ9._vedsn7eloXwvIZgBjJIEZ1nFEcoEx1KxovXy_Wta2yvN7A5pF5K0o5tnHynD_obQ5BPFWGHGPXNUE45jm8n7Q	2022-03-09 18:29:30.735742	2022-03-09 19:29:30.735826	2022-03-10 18:29:30.739423	t
150	0af035b7-1389-4543-bfb9-a84bdec88f90	149	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMGFmMDM1YjctMTM4OS00NTQzLWJmYjktYTg0YmRlYzg4ZjkwIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiYWVmZjA4NTYtYmQwNS00ZTJkLTk1ZDgtZTIxMWYzZjRjNmJiIn0.eYpoeS0DPUJFaRjFLja_7vaQBl3SIDLfhL6Ube94HK-oaAnW31lJ3lbvXN27j9Fxz2Ow9KguOwYIM8vsGiIjUw	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiZWE2ZmQ2ZDMtOGIzMC00ZTI5LTljNWUtMWUxMGFhMTU4YjYwIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjBhZjAzNWI3LTEzODktNDU0My1iZmI5LWE4NGJkZWM4OGY5MCJ9.0RtfbgvSWvaxDiA88ZYA_gHpO7mPugUi7vAqG73dHbjSSlgHXiAlhAeuLVHTl4ulL5r6H9-C1ZAKVzJUAJ1WnQ	2022-03-09 17:28:29.982318	2022-03-09 18:28:29.98235	2022-03-10 17:28:29.99211	f
153	584cf5f4-1bbc-48f9-b90f-5f29d3764566	5	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNTg0Y2Y1ZjQtMWJiYy00OGY5LWI5MGYtNWYyOWQzNzY0NTY2IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiZWRkOWIwYjYtZTA4YS00ZGNmLThmMTktNTE1OTY4NmE0NmRlIn0.vt54I1vWAskgV7NSyUTuBDoc4qCbN0pWbvS2cI0KwTE5GJHbuOXHQLtX813AYhBiWUtMH67Es5vCmC2NO-O2vw	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiZTAyYjJkODEtNWQ3YS00Yzc0LTk1YzctMTI5MTlhNzAwNDI3IiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjU4NGNmNWY0LTFiYmMtNDhmOS1iOTBmLTVmMjlkMzc2NDU2NiJ9.bKwAsmH8zUzTbjuWRd-yNriFg63CC8fb3A5_IzXAM6rgn9_EM5sGwHrgdHVTPlBomMB0FmfHG02nR_-qGJDbQw	2022-03-09 20:09:43.340249	2022-03-09 21:09:43.340333	2022-03-10 20:09:43.343915	t
154	ef73a63e-5c10-4acf-98bb-60d38c5a9c0c	6	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiZWY3M2E2M2UtNWMxMC00YWNmLTk4YmItNjBkMzhjNWE5YzBjIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidGlpbmEiLCJfdXNlcl9jb2RlIjoiIiwiX3VzZXJfbmFtZSI6IlRpaW5hIFJpbnRhbWFla2kiLCJfdXNlcl91aWQiOiJiZDY0NWU0NC1hZGViLTQxZTctOWZlZi1iNjQ0YmM4ODNjMDIifQ.GFKrt9fEZVwEjVac8rtqy4bLJJfbn_327PeZYSqh4wTkEQNOWHDq_p5C28X9MbIZNLmeE-m_eUZhzLcmTcYlrw	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYTdkYmJhMzQtYzRhYy00ZjFjLTkwYjMtZGE2Nzg5YmEzODg3IiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImVmNzNhNjNlLTVjMTAtNGFjZi05OGJiLTYwZDM4YzVhOWMwYyJ9.sFv2oQ2r6b23QEET1tDCLgo_mTTd9qjc1TxB5DKrFMDZBMD00FS8QLFOGiUV2knYb39wr7QjnICgB_ut6I5tcA	2022-03-09 20:52:48.163635	2022-03-09 21:52:48.163705	2022-03-10 20:52:48.166622	t
155	5cc6f0ad-24a7-4962-9a31-2933830b21e2	6	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNWNjNmYwYWQtMjRhNy00OTYyLTlhMzEtMjkzMzgzMGIyMWUyIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidGlpbmEiLCJfdXNlcl9jb2RlIjoiIiwiX3VzZXJfbmFtZSI6IlRpaW5hIFJpbnRhbWFla2kiLCJfdXNlcl91aWQiOiJiZDY0NWU0NC1hZGViLTQxZTctOWZlZi1iNjQ0YmM4ODNjMDIifQ.fboBmW7GVNKfjhFzEx1JjLIhtgwBiN-2vloA1-cbNAYSktTT1z8aQmDbK0pb9zre0X3EQHMCzM-0hH-F5NrcpA	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMDVjYTFlZGItNjEwMy00MmM5LWEzYTQtZDMxZTI3OTUxODNiIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjVjYzZmMGFkLTI0YTctNDk2Mi05YTMxLTI5MzM4MzBiMjFlMiJ9.osh07t4pdPvHYbj8UuN90PVPVTlyEvpSdvAxlKWFQl_h9J-wb8yjJYpUYNQYcY3XIYUxNd-6Ngo-49j058wsbQ	2022-03-09 21:08:41.89218	2022-03-09 22:08:41.892223	2022-03-10 21:08:41.906867	t
157	c4cf56b0-d8ed-449e-9a33-4fa955d565da	156	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYzRjZjU2YjAtZDhlZC00NDllLTlhMzMtNGZhOTU1ZDU2NWRhIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidGlpbmEiLCJfdXNlcl9jb2RlIjoiIiwiX3VzZXJfbmFtZSI6IlRpaW5hIFJpbnRhbWFla2kiLCJfdXNlcl91aWQiOiJiZDY0NWU0NC1hZGViLTQxZTctOWZlZi1iNjQ0YmM4ODNjMDIifQ.F28fbUmG7Ju6PGlRHORg65Oi_EDpLZPxbE8qTPES7jFhM-iYL72EIuyMoglzVcnv98sdfR9S4IV-OURsJQ18EQ	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYjM5OTViZTMtMzc5MC00NjIzLTlmZjgtYTJkNzg4ODM0YTg0IiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImM0Y2Y1NmIwLWQ4ZWQtNDQ5ZS05YTMzLTRmYTk1NWQ1NjVkYSJ9.1A2Zl_Iu85B7QypcOREpuz84CRHv80Kmc34LlxT_wz1UcIUK5KihaeE9sgb0fihj8ARegs_uVNabPHn5KnYaQg	2022-03-09 22:23:19.718075	2022-03-09 23:23:19.718128	2022-03-10 22:23:19.721576	f
156	dfdcf921-5eff-423b-bb6d-1435397e6b0f	6	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiZGZkY2Y5MjEtNWVmZi00MjNiLWJiNmQtMTQzNTM5N2U2YjBmIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidGlpbmEiLCJfdXNlcl9jb2RlIjoiIiwiX3VzZXJfbmFtZSI6IlRpaW5hIFJpbnRhbWFla2kiLCJfdXNlcl91aWQiOiJiZDY0NWU0NC1hZGViLTQxZTctOWZlZi1iNjQ0YmM4ODNjMDIifQ.OCi2MF7iTTBvl7ng878svUjqPMWabPafuF06Jd-EPZhkb7NIw6ToWVGf-nsImWq1pyiSFg-EtnLYfSLJVesN3Q	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNjMyMDc3NDMtMDFkMS00ZWVlLWEwY2ItMzFjZDI1N2IyM2FiIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImRmZGNmOTIxLTVlZmYtNDIzYi1iYjZkLTE0MzUzOTdlNmIwZiJ9.oHJVOXNLrEBRnbdcvdzZfpETopuZ9LUAtYz0xBQChj3Db_Pup1kP-3KnS2o9pRkDR_sJxG6_nciYWm5_CaLfaA	2022-03-09 21:09:26.854993	2022-03-09 22:09:26.855025	2022-03-10 21:09:26.857525	f
161	ce74a4b6-efa2-41f4-b5b4-7d88c11492e5	160	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiY2U3NGE0YjYtZWZhMi00MWY0LWI1YjQtN2Q4OGMxMTQ5MmU1IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidGlpbmEiLCJfdXNlcl9jb2RlIjoiIiwiX3VzZXJfbmFtZSI6IlRpaW5hIFJpbnRhbWFla2kiLCJfdXNlcl91aWQiOiJiZDY0NWU0NC1hZGViLTQxZTctOWZlZi1iNjQ0YmM4ODNjMDIifQ.OVekZgreriBJPpI_F0C5pzTjq9bJ2eRDq_aCp2oylybTPvuMtkj27-_FDEUkOTwGtQZi1QT7jZ80DV9h9ETnIg	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiZGU5Mzk0ZmItYmI5MS00YTY2LWFmZTQtMmQ1YWM1ZTA2ZmZhIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImNlNzRhNGI2LWVmYTItNDFmNC1iNWI0LTdkODhjMTE0OTJlNSJ9.Eew2Y_bWMZovhrER5zuom_72dLvWYeMnF-Iq_vaP17g2yA1agC3xfe2-J2v9ff1ozCmh-KpQre5jKkt_XH2Taw	2022-03-10 03:59:40.208342	2022-03-10 04:59:40.208385	2022-03-11 03:59:40.209844	f
158	00fc3067-32f0-426d-8a55-67de947a38ad	157	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMDBmYzMwNjctMzJmMC00MjZkLThhNTUtNjdkZTk0N2EzOGFkIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidGlpbmEiLCJfdXNlcl9jb2RlIjoiIiwiX3VzZXJfbmFtZSI6IlRpaW5hIFJpbnRhbWFla2kiLCJfdXNlcl91aWQiOiJiZDY0NWU0NC1hZGViLTQxZTctOWZlZi1iNjQ0YmM4ODNjMDIifQ.1wAbUpSIu_P1oSENtTd6HYHjs8R0BOniI6k76nCjVeH0_R9pl7r3bv2m0zlMVdaVCWYdgT4Zwa3mmu7cuSzPXA	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYzM1NWI0M2EtMTEwNS00NTdkLWJmNjctODMzZGViZjYzNjQ5IiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjAwZmMzMDY3LTMyZjAtNDI2ZC04YTU1LTY3ZGU5NDdhMzhhZCJ9.QCZP45ZGhV0bfgxs_AifqFnWvVrY0v6Hs0h-jXTuoXWuaILRazJCIh_t5lf0rIzF7_-h5gQr5VykujoKo-njMA	2022-03-10 00:12:31.453194	2022-03-10 01:12:31.453278	2022-03-11 00:12:31.46062	f
159	7da36449-634d-4ce3-953f-1d16f8ab4edb	158	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiN2RhMzY0NDktNjM0ZC00Y2UzLTk1M2YtMWQxNmY4YWI0ZWRiIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidGlpbmEiLCJfdXNlcl9jb2RlIjoiIiwiX3VzZXJfbmFtZSI6IlRpaW5hIFJpbnRhbWFla2kiLCJfdXNlcl91aWQiOiJiZDY0NWU0NC1hZGViLTQxZTctOWZlZi1iNjQ0YmM4ODNjMDIifQ.9NjiXFaCDdwd8_UL4CkhhBUnz-1jCqGa5NCvx6kQ6YAxwjv8SpMetzAzWQkKc1dCasO9-W9ylenm6TMXOxqQYg	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMDlhOTIyMjQtYjNjMi00MDdhLWFhMjItNzdmZDBmYWNkNDczIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjdkYTM2NDQ5LTYzNGQtNGNlMy05NTNmLTFkMTZmOGFiNGVkYiJ9.vHt6dxLZf9r75vsaReeb-ddv-sTAtvz_UUd9dW3icA7DZGzNwhNfc6tqor9nMhnZDI2mG-0F3IM0Ftwp9PYcKA	2022-03-10 01:16:07.289464	2022-03-10 02:16:07.289504	2022-03-11 01:16:07.291067	f
160	c496b8ba-8191-41fb-a32f-f13059573f13	159	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYzQ5NmI4YmEtODE5MS00MWZiLWEzMmYtZjEzMDU5NTczZjEzIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidGlpbmEiLCJfdXNlcl9jb2RlIjoiIiwiX3VzZXJfbmFtZSI6IlRpaW5hIFJpbnRhbWFla2kiLCJfdXNlcl91aWQiOiJiZDY0NWU0NC1hZGViLTQxZTctOWZlZi1iNjQ0YmM4ODNjMDIifQ.t7dMvHRhmRXGHPLSqzi8B4r85eXiTPiM-Z2MPcQYnhHrd_QsBNaZWQpr0Lqw-E1pKrxKMHjknrcqcqVeDO0VNQ	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiOTljYzg1ODYtZWRmNy00NjE5LTg0MzUtYmY4MTRiZTY3MzUxIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImM0OTZiOGJhLTgxOTEtNDFmYi1hMzJmLWYxMzA1OTU3M2YxMyJ9.MyxhL52Dz6mXsXtK8x-fUtOvc_YRui2ICJ7rHZbA8Gc2qdBI6PdnVvAI_zkPpTX3UUZyYb-zOx17HOy7JKhimg	2022-03-10 02:26:14.640611	2022-03-10 03:26:14.64064	2022-03-11 02:26:14.641802	f
163	dbb36412-0992-4e6b-b1c4-4d1d763d1ccb	162	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiZGJiMzY0MTItMDk5Mi00ZTZiLWIxYzQtNGQxZDc2M2QxY2NiIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidGlpbmEiLCJfdXNlcl9jb2RlIjoiIiwiX3VzZXJfbmFtZSI6IlRpaW5hIFJpbnRhbWFla2kiLCJfdXNlcl91aWQiOiJiZDY0NWU0NC1hZGViLTQxZTctOWZlZi1iNjQ0YmM4ODNjMDIifQ.vxPC7wEzT_YyB44OY21OOBMacmmlOgk-jM4vX2DrechHwCOGKs93CuzcvXL_bNsZNMQcoDmMT_kEM1EsYOB4Cg	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiZjAxY2JhNmMtZjMwOS00MmMwLTgzYzEtZTk4NmU4ZWM3Y2JjIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImRiYjM2NDEyLTA5OTItNGU2Yi1iMWM0LTRkMWQ3NjNkMWNjYiJ9.EUUy7mOBLwm6VIV0aohKDDiE9yZJ1ezwGmqtdbBD8WOoe60qKt26n5PhjDD3U_JK3ZvtzxDiSqUEcm23k6ynkw	2022-03-10 07:35:31.395504	2022-03-10 08:35:31.395732	2022-03-11 07:35:31.422443	t
162	22d50875-07c7-41d6-bbdf-339d4272b50d	161	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMjJkNTA4NzUtMDdjNy00MWQ2LWJiZGYtMzM5ZDQyNzJiNTBkIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidGlpbmEiLCJfdXNlcl9jb2RlIjoiIiwiX3VzZXJfbmFtZSI6IlRpaW5hIFJpbnRhbWFla2kiLCJfdXNlcl91aWQiOiJiZDY0NWU0NC1hZGViLTQxZTctOWZlZi1iNjQ0YmM4ODNjMDIifQ.DO9luuHwiD9woB5swxy1CZ_Rikbgn_soleLYDafdkzUfhoFPL1YPxn05vXbwV3TkPkzJWR6xf64Mrun00-8T6Q	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNTgzNzJiN2YtNWY2My00OTU0LWE3YjEtNDdkNzg3MDY2ZDZmIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjIyZDUwODc1LTA3YzctNDFkNi1iYmRmLTMzOWQ0MjcyYjUwZCJ9.62MbwYgxZ6Slg3AaVWgD2siOuEMZpgUD438-Mg1tXdT89ZbuuLHc4rpd5fsE5zIrtZh2loo-Iri40nhdXN_mLA	2022-03-10 05:47:05.259863	2022-03-10 06:47:05.259905	2022-03-11 05:47:05.263818	f
164	d5fcce08-0a1f-4048-b5c7-c2680aaae5fd	6	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiZDVmY2NlMDgtMGExZi00MDQ4LWI1YzctYzI2ODBhYWFlNWZkIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidGlpbmEiLCJfdXNlcl9jb2RlIjoiIiwiX3VzZXJfbmFtZSI6IlRpaW5hIFJpbnRhbWFla2kiLCJfdXNlcl91aWQiOiJiZDY0NWU0NC1hZGViLTQxZTctOWZlZi1iNjQ0YmM4ODNjMDIifQ.YqmfVH4RW8xTXsGClUdk5vSs4ebJvYGzfMyGQJkQ3Wp7qziwxJ625LgQo4ZMyKM2fjHjXWKJhLwiWf41QPxPyQ	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNGZjNDY5ZjYtNWFhMS00YTE3LTk4MWQtMDQxOTQzNjVkY2FmIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImQ1ZmNjZTA4LTBhMWYtNDA0OC1iNWM3LWMyNjgwYWFhZTVmZCJ9.OeNSuTKDR3uvVyCUSewsd7I3Oeqy8erOOEAiPM5AVhcUby5TiEh5vsS_7mr7xiYHN5VfTziF1Sl7lybBfSmTTA	2022-03-10 14:21:34.795113	2022-03-10 15:21:34.795326	2022-03-11 14:21:34.848556	t
165	29456623-2aca-4352-b0bf-753c3ab29fde	6	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMjk0NTY2MjMtMmFjYS00MzUyLWIwYmYtNzUzYzNhYjI5ZmRlIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidGlpbmEiLCJfdXNlcl9jb2RlIjoiIiwiX3VzZXJfbmFtZSI6IlRpaW5hIFJpbnRhbWFla2kiLCJfdXNlcl91aWQiOiJiZDY0NWU0NC1hZGViLTQxZTctOWZlZi1iNjQ0YmM4ODNjMDIifQ.KQsdKrufSQBufqEyfvl-yPWU0rwKKo5UMjFgujFJ-_Jay1e-GsjCU_qDx4JwTnz6JesjabRHg_sfd4uIsBjyVQ	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiZGJkYzljYTQtNDkzYy00NGRhLWFhOTYtNGQ4MWE4MjY2OTgzIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjI5NDU2NjIzLTJhY2EtNDM1Mi1iMGJmLTc1M2MzYWIyOWZkZSJ9.wuAamIyh7m8YMnFrzKdtID-j4kCqIWlyQAEyJdlOtVHDLEKk5Q3Lo5UnnFq0JdPb1WZL0am4k-a82xcgroYwSg	2022-03-10 14:39:15.82829	2022-03-10 15:39:15.828352	2022-03-11 14:39:15.831892	t
166	b575be12-9f24-4719-8e0c-2a7ada3ec07d	6	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYjU3NWJlMTItOWYyNC00NzE5LThlMGMtMmE3YWRhM2VjMDdkIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidGlpbmEiLCJfdXNlcl9jb2RlIjoiIiwiX3VzZXJfbmFtZSI6IlRpaW5hIFJpbnRhbWFla2kiLCJfdXNlcl91aWQiOiJiZDY0NWU0NC1hZGViLTQxZTctOWZlZi1iNjQ0YmM4ODNjMDIifQ.bbYK78rnWEIXgRqzE16z1tjIV9l0piQTd7bKA5sUMzNrjn6UcQNLRA1kxISVKcfLOjoE5C040dTGyT8U5g_Gdw	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiZmRlMzhmMDgtZWZiZi00ZDQ3LTg0MjQtN2E2MDUyMjkyMmZkIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImI1NzViZTEyLTlmMjQtNDcxOS04ZTBjLTJhN2FkYTNlYzA3ZCJ9.IyiHkna-9PkxX6JD02dS_fEwUEUr9g8oozxZ9qX4whXfyAUxbiaizOTI-E5oOFMK55_IuLi1Ri7VAxR7D5F2qQ	2022-03-10 14:40:10.35446	2022-03-10 15:40:10.354536	2022-03-11 14:40:10.356339	t
167	f6d1e1da-f100-49d1-84e7-b74847a0f515	6	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiZjZkMWUxZGEtZjEwMC00OWQxLTg0ZTctYjc0ODQ3YTBmNTE1IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidGlpbmEiLCJfdXNlcl9jb2RlIjoiIiwiX3VzZXJfbmFtZSI6IlRpaW5hIFJpbnRhbWFla2kiLCJfdXNlcl91aWQiOiJiZDY0NWU0NC1hZGViLTQxZTctOWZlZi1iNjQ0YmM4ODNjMDIifQ.h6xxxXGiY6MKhJI509DqTa6QkJhL1DBmnhDWAX6zc3m4zdd5MeKExCIdK0xyoS2enwb79KuvtKtX1clb3pxX2Q	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYmY0NjM1ZmQtMDg3Zi00Njc5LTkxMmQtOThjOGQzZTRiMzBmIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImY2ZDFlMWRhLWYxMDAtNDlkMS04NGU3LWI3NDg0N2EwZjUxNSJ9.eTel_qnBWYyu-U4yWIJVdbehoDU8r8BLLy4SFN1mT-e2qLsL94UTCCkty6u4tV7gFoWHMlq-agsa4yJI5SvMjQ	2022-03-10 15:04:43.78241	2022-03-10 16:04:43.782488	2022-03-11 15:04:43.784706	t
168	1110baa7-b801-4bcb-9332-21bbf73d9d6a	6	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMTExMGJhYTctYjgwMS00YmNiLTkzMzItMjFiYmY3M2Q5ZDZhIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidGlpbmEiLCJfdXNlcl9jb2RlIjoiIiwiX3VzZXJfbmFtZSI6IlRpaW5hIFJpbnRhbWFla2kiLCJfdXNlcl91aWQiOiJiZDY0NWU0NC1hZGViLTQxZTctOWZlZi1iNjQ0YmM4ODNjMDIifQ.L-l2MTxjO5LWuPTFq1YPe35-xMlpTgFW6sLYRgZTduK9Ybnc0zfN-0txoCJVFPbOHgFJeTXiy-fj0GzZrDsIzw	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMjI0NTJmNDItZjAwNy00N2UzLWE5ODItZGY5N2MwMmU2N2RhIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjExMTBiYWE3LWI4MDEtNGJjYi05MzMyLTIxYmJmNzNkOWQ2YSJ9.5EMiWh5xjsNEzsnvUlM7d7Hskeov14Se5mTFylmwOgOKA8f1SRH1r9-SuQW1WhhQGgMxKDB9iyDTNHftbWiHow	2022-03-10 15:11:39.508495	2022-03-10 16:11:39.508538	2022-03-11 15:11:39.51137	t
169	9df77fff-ab4a-48a3-8430-3690a8c493be	6	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiOWRmNzdmZmYtYWI0YS00OGEzLTg0MzAtMzY5MGE4YzQ5M2JlIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidGlpbmEiLCJfdXNlcl9jb2RlIjoiIiwiX3VzZXJfbmFtZSI6IlRpaW5hIFJpbnRhbWFla2kiLCJfdXNlcl91aWQiOiJiZDY0NWU0NC1hZGViLTQxZTctOWZlZi1iNjQ0YmM4ODNjMDIifQ.NR8uaQDerdbKPUCYbBATm6Wxy8mhdB1NPKoWc_AQIKv-lvdQG9nJ_21XCrAPqZtrtNlQ1K7_vgKJKO3e9L9zoQ	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYzQ4NTFlYzYtOWJkMC00N2FlLTk3NTQtOTZmMzIxYTk5MWQzIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjlkZjc3ZmZmLWFiNGEtNDhhMy04NDMwLTM2OTBhOGM0OTNiZSJ9.3tBxjJcquWEF_nej3Fc9zjY-EsfdRHisEN-ZPY61kJSJ-f5rFwzXL88kzVEe7RYPqJ3a1iUk7DNt6BqoidEWPg	2022-03-10 15:12:36.845076	2022-03-10 16:12:36.845142	2022-03-11 15:12:36.854954	t
170	423d47b8-5a7e-408d-ac31-09e36fa840e2	6	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNDIzZDQ3YjgtNWE3ZS00MDhkLWFjMzEtMDllMzZmYTg0MGUyIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidGlpbmEiLCJfdXNlcl9jb2RlIjoiIiwiX3VzZXJfbmFtZSI6IlRpaW5hIFJpbnRhbWFla2kiLCJfdXNlcl91aWQiOiJiZDY0NWU0NC1hZGViLTQxZTctOWZlZi1iNjQ0YmM4ODNjMDIifQ.WAnOAS1Hrz_gES6LqKYDSUGD3OjEx-G54-veLmDvC4uYdgc0DYT2DF53gRIQtRMEq8VOzqMp2z7NcUIAEvu85g	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiN2VlNGM1YzMtMjYyMy00NTljLTljMTgtYTAwNmIzMzhmM2VkIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjQyM2Q0N2I4LTVhN2UtNDA4ZC1hYzMxLTA5ZTM2ZmE4NDBlMiJ9.nIqL-RXVm2SgToayMQhks02ka9lHvVFA3gBtA3-JzCumQA2AQR9e4oEG5kISNZ6JEmLdx6c3CbNCO42mtqylVA	2022-03-10 15:12:46.677542	2022-03-10 16:12:46.677592	2022-03-11 15:12:46.680143	t
172	41892a7a-350f-4dc7-8ba0-26cca200df58	5	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNDE4OTJhN2EtMzUwZi00ZGM3LThiYTAtMjZjY2EyMDBkZjU4IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiZWRkOWIwYjYtZTA4YS00ZGNmLThmMTktNTE1OTY4NmE0NmRlIn0.Q2ZRuZITKntQIZtou_acqP-oP18MoObh4AICNDMWitT_v167bcSIJQVW4AA-GFZOSm7kQdcv85v47M6IVbl6rw	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiM2M0MjcyNDktNmY0MS00NjcwLWI5YzYtOTE3ZmZmYzUzYWY0IiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjQxODkyYTdhLTM1MGYtNGRjNy04YmEwLTI2Y2NhMjAwZGY1OCJ9.rQK52uOKQKNV23rI1y5MCSz00_Zg3_WzeLT9eO82-givYOChQrjjw5FaAHtK4P9wgA1HrrCnFSpVjrO1FZXz6w	2022-03-10 15:48:46.172982	2022-03-10 16:48:46.173217	2022-03-11 15:48:46.192942	t
173	7255b19d-ae0c-48a1-bc92-e9e5d2a3cbf7	171	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNzI1NWIxOWQtYWUwYy00OGExLWJjOTItZTllNWQyYTNjYmY3IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidGlpbmEiLCJfdXNlcl9jb2RlIjoiIiwiX3VzZXJfbmFtZSI6IlRpaW5hIFJpbnRhbWFla2kiLCJfdXNlcl91aWQiOiJiZDY0NWU0NC1hZGViLTQxZTctOWZlZi1iNjQ0YmM4ODNjMDIifQ.5twWNkGhJYl6N9fW_fPExQL_BMyXvJwH0ZnKZiscKVjJJ4E-v3cVzYhZz49jRX_OJn5phU9utDvSEeXhDFTJng	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNjBhMzU0ZjgtZTcxZS00YzM5LTliZmQtNjA0YmQyNzExNTUyIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjcyNTViMTlkLWFlMGMtNDhhMS1iYzkyLWU5ZTVkMmEzY2JmNyJ9.2AiEYBvztEzetTTrwFWvgdCCCcXAl2D9iaq7LDvmowtjdaFAX7PbqjE8LOTPUj94e3OOp-rYSgxil8_4kR3diQ	2022-03-10 16:57:42.8076	2022-03-10 17:57:42.807722	2022-03-11 16:57:42.827321	t
171	ebbe6e09-9978-483e-8fe5-bb8ab6c3c790	6	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiZWJiZTZlMDktOTk3OC00ODNlLThmZTUtYmI4YWI2YzNjNzkwIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidGlpbmEiLCJfdXNlcl9jb2RlIjoiIiwiX3VzZXJfbmFtZSI6IlRpaW5hIFJpbnRhbWFla2kiLCJfdXNlcl91aWQiOiJiZDY0NWU0NC1hZGViLTQxZTctOWZlZi1iNjQ0YmM4ODNjMDIifQ.fvu5hMaiUqOKr7zd15RIlmYYi_SwxJm709RP1ThCPiolS0iWbds6dAv-WgbBSCmLw5FIwP3BDNBG9WocdwzYdg	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYjJjMDA5NDItMGVjZS00ZDhjLWIwY2ItMjBiZDA4NmRmYmJiIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImViYmU2ZTA5LTk5NzgtNDgzZS04ZmU1LWJiOGFiNmMzYzc5MCJ9.wrFrI9iGBFssmK3TC5q97C8G51-yOaJLkb8t-w2nl5GdqcXLFUGF366HA3aZsEPsbNi0e3g_nZaEiGrGniBuHw	2022-03-10 15:14:05.003886	2022-03-10 16:14:05.003934	2022-03-11 15:14:05.005815	f
174	b05f8fa5-f426-4485-817e-a1131820c23f	6	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYjA1ZjhmYTUtZjQyNi00NDg1LTgxN2UtYTExMzE4MjBjMjNmIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidGlpbmEiLCJfdXNlcl9jb2RlIjoiIiwiX3VzZXJfbmFtZSI6IlRpaW5hIFJpbnRhbWFla2kiLCJfdXNlcl91aWQiOiJiZDY0NWU0NC1hZGViLTQxZTctOWZlZi1iNjQ0YmM4ODNjMDIifQ.wmUgcAakC566I1-m8R7QSfPqvg8EnmY7pp4e7J3LDQNE2-N-H4ntwX3zIk0agJrTcYU697eWA3Yv3-3HK1xgaw	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiODY3ZDRiNWUtNDFkNC00NGY1LWI4Y2EtYjExZTU2ZmQ2MjY0IiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImIwNWY4ZmE1LWY0MjYtNDQ4NS04MTdlLWExMTMxODIwYzIzZiJ9.SRU2VrMS9iSjpcpikAAO_9LWRhAzyPinN8e8Lz7VLpAnCESaKIHNKzEWDStzIRajoInpfp8zfNAYqRMo_3RNNg	2022-03-10 17:58:20.356422	2022-03-10 18:58:20.356755	2022-03-11 17:58:20.374039	t
175	c8c9ef78-3fa4-4d5f-9032-8c990c101ab6	6	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYzhjOWVmNzgtM2ZhNC00ZDVmLTkwMzItOGM5OTBjMTAxYWI2IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidGlpbmEiLCJfdXNlcl9jb2RlIjoiIiwiX3VzZXJfbmFtZSI6IlRpaW5hIFJpbnRhbWFla2kiLCJfdXNlcl91aWQiOiJiZDY0NWU0NC1hZGViLTQxZTctOWZlZi1iNjQ0YmM4ODNjMDIifQ.3zDvG_5_m-OD-OmGZt-djSju7f_NtLvciHP1oWNnILbtjnkpQVjMqd9YopYJ2wSAe0BEMmYRQW_rKPGlq6OZJA	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiOGYyZDNkNDgtM2JiOS00MmI0LTkyZWEtOGFjYjM0MWQ4NTRhIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImM4YzllZjc4LTNmYTQtNGQ1Zi05MDMyLThjOTkwYzEwMWFiNiJ9.-7nJARrknjtHc-M1p2e-NmTavMJvBR0Mnyz2bIvLIj6GxL-wbEjihXYtsUCeCgvaHDj1CmAAs4DJlTwlskmg2Q	2022-03-10 23:03:08.526321	2022-03-11 00:03:08.526559	2022-03-11 23:03:08.540815	t
176	af31565d-ab1e-4caf-8251-eadb0619e434	6	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYWYzMTU2NWQtYWIxZS00Y2FmLTgyNTEtZWFkYjA2MTllNDM0IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidGlpbmEiLCJfdXNlcl9jb2RlIjoiIiwiX3VzZXJfbmFtZSI6IlRpaW5hIFJpbnRhbWFla2kiLCJfdXNlcl91aWQiOiJiZDY0NWU0NC1hZGViLTQxZTctOWZlZi1iNjQ0YmM4ODNjMDIifQ.emKge1wx7SaZZRZNWyw0B-QStvFyUyKTSF8zWvVqOv9gwlOhlqJpqUnFFC9dGHYH3VWSgp9IIQWJxIbjpPWkog	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYTRjYmI1NTYtMzE4ZS00MmM2LWJhNjItODZmN2FiMjNhNTZkIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImFmMzE1NjVkLWFiMWUtNGNhZi04MjUxLWVhZGIwNjE5ZTQzNCJ9.UUC8xCxCFMIr-aRFCe9Twh1lHCisc0Ld0WVYthXbBJPtnpXPRZ11f2gWFKuZy8LjDwWhBVJzSy8qUgFxKQoDiw	2022-03-10 23:04:50.464221	2022-03-11 00:04:50.464297	2022-03-11 23:04:50.468884	t
177	3e4995eb-7a30-45f5-a987-0d4911aac794	7	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiM2U0OTk1ZWItN2EzMC00NWY1LWE5ODctMGQ0OTExYWFjNzk0IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoiemUiLCJfdXNlcl9jb2RlIjoiIiwiX3VzZXJfbmFtZSI6InplIiwiX3VzZXJfdWlkIjoiNjIyOWE0MjctMTM0NS00M2U1LWFhMjYtOWE1MWU4Y2U0ZThhIn0.gw4SQ7rtub5nabk0nSZoafZr4KSXNqjjDR5brNn7omdSr-fItk4_YmAqC4vOBIDhy7-uWh_YzV_UgUsAbRalzQ	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNTYwM2RhNzMtYmNjNC00MDE1LWJmOGEtMGQ4M2QyYjQ4ZGU2IiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjNlNDk5NWViLTdhMzAtNDVmNS1hOTg3LTBkNDkxMWFhYzc5NCJ9._NYtL4Rxqgi_YprzGYNj4xtEW_1mq4QMPKVaBqQRNbB8RfunJcgbBxdCdOnUwhkwfegR4C6XyaWMvJ97Lw4WLA	2022-03-10 23:05:55.455474	2022-03-11 00:05:55.455526	2022-03-11 23:05:55.458278	t
178	a920f5a4-5f7d-49cf-8930-05907548e034	5	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYTkyMGY1YTQtNWY3ZC00OWNmLTg5MzAtMDU5MDc1NDhlMDM0IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiZWRkOWIwYjYtZTA4YS00ZGNmLThmMTktNTE1OTY4NmE0NmRlIn0.XSv-LF1AM4Ltv9x_-mdBnXlolPHnEW2mOn2QLScbjCFlrRmxzio7SE_hl7kv5pWLCpF-lDD5v7aJZSEOmcukKA	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNGRkYTNkZjEtZTJmNC00ZjE5LWIyMjMtYmYyMjBkN2E4ZTdlIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImE5MjBmNWE0LTVmN2QtNDljZi04OTMwLTA1OTA3NTQ4ZTAzNCJ9.kZmjyuOLzzFcD5bXAKY-UHquQxubWsYpMoJuQgJh3jiaPjiJDR3p9GZlyLXWFRosVZXyzd1L8h3E_41LVyAO7A	2022-03-10 23:08:07.592427	2022-03-11 00:08:07.592498	2022-03-11 23:08:07.597915	t
180	b045ff9d-8975-41b3-8d4a-2311926a25da	179	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYjA0NWZmOWQtODk3NS00MWIzLThkNGEtMjMxMTkyNmEyNWRhIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoiemUiLCJfdXNlcl9jb2RlIjoiIiwiX3VzZXJfbmFtZSI6InplIiwiX3VzZXJfdWlkIjoiNjIyOWE0MjctMTM0NS00M2U1LWFhMjYtOWE1MWU4Y2U0ZThhIn0.eIdNBfj6xa3vv3CivMrYhLkJh68f67Lan8ON1U00vGv1Tv9sZOenml2DG0O6VUfgmfVsMlSola7AMlFTOCm0VQ	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYzdlODkzZDctZDE3ZC00OGI2LThlZDktZmU3ZGU0ZjZkMjFhIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImIwNDVmZjlkLTg5NzUtNDFiMy04ZDRhLTIzMTE5MjZhMjVkYSJ9.H7kgnPd9rQEXagiCZEqWyD_-esDGU1lhMvUHo2qW6zt83nphm895v4FVv-b-4UeEAAJi5xap41QrPoyfGVccjQ	2022-03-11 00:15:03.340831	2022-03-11 01:15:03.340955	2022-03-12 00:15:03.354957	f
179	17ef793d-6294-42ef-8c19-c43355f96a11	7	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMTdlZjc5M2QtNjI5NC00MmVmLThjMTktYzQzMzU1Zjk2YTExIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoiemUiLCJfdXNlcl9jb2RlIjoiIiwiX3VzZXJfbmFtZSI6InplIiwiX3VzZXJfdWlkIjoiNjIyOWE0MjctMTM0NS00M2U1LWFhMjYtOWE1MWU4Y2U0ZThhIn0.CKdT5-J3O4NtCsegq-0SqV_fYX_mzVQVopU6oh6KD29A_CNOa-QCwPUshZdUJnXaEGjt6ZbqUq4vsZP57hurAw	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMzhkOWIwNDQtYjk4NS00MTRhLWE5NWYtNWIzZjUwMjEwM2I1IiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjE3ZWY3OTNkLTYyOTQtNDJlZi04YzE5LWM0MzM1NWY5NmExMSJ9.E53bysTdueAnTnSMPLfrjlQgE9Mi82BTxFDlyPFGo1Rgt3zIrSBfSNFxoADzKpcfd-j79CbmIyoX9EXkdR4sRw	2022-03-10 23:12:49.771774	2022-03-11 00:12:49.771843	2022-03-11 23:12:49.775156	f
181	9df3d2f5-0ea1-4ba8-880f-cf554f428066	180	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiOWRmM2QyZjUtMGVhMS00YmE4LTg4MGYtY2Y1NTRmNDI4MDY2IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoiemUiLCJfdXNlcl9jb2RlIjoiIiwiX3VzZXJfbmFtZSI6InplIiwiX3VzZXJfdWlkIjoiNjIyOWE0MjctMTM0NS00M2U1LWFhMjYtOWE1MWU4Y2U0ZThhIn0.6Qk37h8sK4CqD15R7NhuCxc28XpjDDLtodPz19j82rykVt-QXitdEG4vpeTGHj8Z1J3PYyI29BO-5MTx8EfnQA	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMmZmMWIwNjQtMzhmMC00NzE5LThhNGMtMjFkZjNiMmQ0YjBiIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjlkZjNkMmY1LTBlYTEtNGJhOC04ODBmLWNmNTU0ZjQyODA2NiJ9.hnc4J6-WFgtNEM5RuV_syyugvvFUz36tzDOC5HUcYYXf5hHpSBtgBa1W5Q3BM6tb0JcioJfFOeo5wH_PQQ40AQ	2022-03-11 02:57:22.965749	2022-03-11 03:57:23.056929	2022-03-12 02:57:23.534005	f
182	7a3c1e41-c6a3-4344-be73-8df1ed0f0f3e	181	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiN2EzYzFlNDEtYzZhMy00MzQ0LWJlNzMtOGRmMWVkMGYwZjNlIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoiemUiLCJfdXNlcl9jb2RlIjoiIiwiX3VzZXJfbmFtZSI6InplIiwiX3VzZXJfdWlkIjoiNjIyOWE0MjctMTM0NS00M2U1LWFhMjYtOWE1MWU4Y2U0ZThhIn0.HK4fH1oLJ67MgyTaGHjAUNIeF9OzBUeVcmZiAR71_3mxXaGZKCD6fUlktYaeE2X8m1Q2AwNJeHZ7WT9q1JsMlw	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNTZhMGZlOTEtZDVkNS00YTUwLWI4YjYtMDBjNjlkNmM4ODllIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjdhM2MxZTQxLWM2YTMtNDM0NC1iZTczLThkZjFlZDBmMGYzZSJ9.JKLi5fXWGDAltIClyXSFEjSP9v_KEr23wQxC--tjUskXhI6JM7sDsSol7gzcLznYDbLOuJgXiL22qC3FOMJHzQ	2022-03-11 09:12:18.646512	2022-03-11 10:12:18.64667	2022-03-12 09:12:18.685531	f
183	6b20a859-83de-4762-be8b-0e6461b10288	182	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNmIyMGE4NTktODNkZS00NzYyLWJlOGItMGU2NDYxYjEwMjg4IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoiemUiLCJfdXNlcl9jb2RlIjoiIiwiX3VzZXJfbmFtZSI6InplIiwiX3VzZXJfdWlkIjoiNjIyOWE0MjctMTM0NS00M2U1LWFhMjYtOWE1MWU4Y2U0ZThhIn0.uZbl9haiNpJezPHlql7zM27rLT9z3M0TYMbkcSHeHxu3Rdo7d30kPjVU-xw2TF1G_ZRD5m8gwOlEpH_C1J9TKQ	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMmIyMGY5YWItMDY3Mi00OTkyLWExNzMtMDZlNmM0Y2UzMDhlIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjZiMjBhODU5LTgzZGUtNDc2Mi1iZThiLTBlNjQ2MWIxMDI4OCJ9.NJ9f8WkxdhjS3O8CaRp0JKSyHpm_k0G0OzInObMllQM2FJmTGNcdIdIz4PJ3V2hy7ezf_1aPoferf6bjjMVCNQ	2022-03-11 10:13:44.339912	2022-03-11 11:13:44.339966	2022-03-12 10:13:44.34309	f
184	22fd72d0-b5cf-44a6-998d-d28ce4708167	183	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMjJmZDcyZDAtYjVjZi00NGE2LTk5OGQtZDI4Y2U0NzA4MTY3IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoiemUiLCJfdXNlcl9jb2RlIjoiIiwiX3VzZXJfbmFtZSI6InplIiwiX3VzZXJfdWlkIjoiNjIyOWE0MjctMTM0NS00M2U1LWFhMjYtOWE1MWU4Y2U0ZThhIn0.ZuPZ5dqPLdk3EOSDLEOWu9RjJrR2KIEA9k3FCaeABtgza-jKc9YI-y_HW6HXnnrRAc-N-eWMg0SYvIlNsC0kOQ	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiZDdlNzcxOGEtNTRlOS00ODUwLWFlMWMtZmI4ZjNhYjQyZmJiIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjIyZmQ3MmQwLWI1Y2YtNDRhNi05OThkLWQyOGNlNDcwODE2NyJ9.QMQr5suWw-NkR32XBQcY89mZbBTmCXD3AbgpSqzAUwKWRet0m2g5Mjf518M_tT0Yn2zUiye5s6NiCWWfdbCtzA	2022-03-11 11:15:40.7003	2022-03-11 12:15:40.700357	2022-03-12 11:15:40.703027	f
185	abbd027a-1f53-473f-851a-04a9c7d5b8ec	184	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYWJiZDAyN2EtMWY1My00NzNmLTg1MWEtMDRhOWM3ZDViOGVjIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoiemUiLCJfdXNlcl9jb2RlIjoiIiwiX3VzZXJfbmFtZSI6InplIiwiX3VzZXJfdWlkIjoiNjIyOWE0MjctMTM0NS00M2U1LWFhMjYtOWE1MWU4Y2U0ZThhIn0.Ft3vwddaM5PIN4tmDiF4RW1yD5g3wvoC_o5POxPMC_KgV8Z_9w8oBMFi6b39xYMWmJ5FXvlOJxhsjpaOq3T9ag	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYjE3N2NjYWEtNDJkOC00MjJkLWIwN2UtZTg4ZDRmZGQ0NTc1IiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImFiYmQwMjdhLTFmNTMtNDczZi04NTFhLTA0YTljN2Q1YjhlYyJ9.HhhP1KsS9WXKGUdTW6GZAuSJCsgHhfJEn_nduoI-z16Hu87aT37J0qUdS2EgPLGuEeuGFGCieaQpaQzcVhzgDA	2022-03-11 12:16:40.851664	2022-03-11 13:16:40.851749	2022-03-12 12:16:40.854195	f
186	731c36cf-090b-4b10-8b1d-84e69f7e2a1e	185	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNzMxYzM2Y2YtMDkwYi00YjEwLThiMWQtODRlNjlmN2UyYTFlIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoiemUiLCJfdXNlcl9jb2RlIjoiIiwiX3VzZXJfbmFtZSI6InplIiwiX3VzZXJfdWlkIjoiNjIyOWE0MjctMTM0NS00M2U1LWFhMjYtOWE1MWU4Y2U0ZThhIn0.N8pxrzZk423Nzs9dWjKjCAQhGI5lekSOJC-NCKaKxmhlVSUhOu1zF0aHa9Y8lV2m_LlVvS0w_54gaNrUoTEHiw	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiOWYwYzAxYmItYTUxYy00MDYwLTliOGQtYjQyOTU5ZGM2ZDU4IiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjczMWMzNmNmLTA5MGItNGIxMC04YjFkLTg0ZTY5ZjdlMmExZSJ9.MI5GdYMWu0nZTzQMIkPTW3O37l9NbjCaGwKtFrSFs04szLwiUlN6w2Rm-lQ9jZnyk0igoG4YSpt5P1gGbKrkqQ	2022-03-11 13:18:38.505545	2022-03-11 14:18:38.505596	2022-03-12 13:18:38.507852	f
189	dd2fb560-18af-46de-8a30-3bd014fbd804	188	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiZGQyZmI1NjAtMThhZi00NmRlLThhMzAtM2JkMDE0ZmJkODA0IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoiemUiLCJfdXNlcl9jb2RlIjoiIiwiX3VzZXJfbmFtZSI6InplIiwiX3VzZXJfdWlkIjoiNjIyOWE0MjctMTM0NS00M2U1LWFhMjYtOWE1MWU4Y2U0ZThhIn0.KLApU2yeykPh8l2foOkX4yyvDrNBtuXSCbz1Vu12f9oowtLEirOnVoxEoBMxPfHEU25zrpy6Y6IY7Lsrfk3KUA	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMDc2ZTRmMDktYjQyYy00ZjJjLTgzYjktMWI3OWY3NWRjMmU0IiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImRkMmZiNTYwLTE4YWYtNDZkZS04YTMwLTNiZDAxNGZiZDgwNCJ9.g2Hm-vzdaeguL2-qzDhfenP5hNiUs0KL8ClIYmXvUnhWgCrXkeavNkoFSq-NV9KnnHX0N6mpcTbqxau5USonFw	2022-03-11 16:22:45.604756	2022-03-11 17:22:45.604791	2022-03-12 16:22:45.607173	f
187	7f7a0d25-c02e-479e-afae-f1945a1e17aa	186	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiN2Y3YTBkMjUtYzAyZS00NzllLWFmYWUtZjE5NDVhMWUxN2FhIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoiemUiLCJfdXNlcl9jb2RlIjoiIiwiX3VzZXJfbmFtZSI6InplIiwiX3VzZXJfdWlkIjoiNjIyOWE0MjctMTM0NS00M2U1LWFhMjYtOWE1MWU4Y2U0ZThhIn0.Zr2KwCQIHhGaaNFWYFb2JqQXrCcH6O7mtPpgGR6iSTcWSqFc5BNWC3Xex85If-AuYOsKiQyNTS0NHfYyjTFzXw	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiZTA5YjUwNDMtZTllOS00MWU5LThmNWMtMzlmM2E0OWE5MzMzIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjdmN2EwZDI1LWMwMmUtNDc5ZS1hZmFlLWYxOTQ1YTFlMTdhYSJ9.j1IisjLxsVHu6lqFk6XPRzaK6wtF7rhxwsWHrCS4tCcq-zft2nCJcuXPzv24cZiTQbOC3fKnC3sJwDQvpcjLgw	2022-03-11 14:19:39.483179	2022-03-11 15:19:39.483229	2022-03-12 14:19:39.487533	f
188	ada027c5-1567-4928-93ba-85c640a4e145	187	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYWRhMDI3YzUtMTU2Ny00OTI4LTkzYmEtODVjNjQwYTRlMTQ1IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoiemUiLCJfdXNlcl9jb2RlIjoiIiwiX3VzZXJfbmFtZSI6InplIiwiX3VzZXJfdWlkIjoiNjIyOWE0MjctMTM0NS00M2U1LWFhMjYtOWE1MWU4Y2U0ZThhIn0.rcxjqayvtXLn4opQ9OBo7xmO1h5WVUCP64WbbwYdZP_YnC10CiW6MXOXrzUDwg5TguAP32BJYI49WP4GKpRV1A	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiZWQxNjllYzQtNjYwOS00ODU2LTg5MjYtYWExYTU4NGQ5MTA2IiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImFkYTAyN2M1LTE1NjctNDkyOC05M2JhLTg1YzY0MGE0ZTE0NSJ9.5ZDhoXW6s_bpWL-QEYA3yeBnWlf5QrdTyjQVzLHulgYjJVcLTuCrST3vKj4VqiOAGVwOGC9sZ3DKFgwmS2Ayww	2022-03-11 15:20:46.522079	2022-03-11 16:20:46.522114	2022-03-12 15:20:46.52454	f
190	cc6975c2-aec0-4b06-9ea9-520900013022	189	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiY2M2OTc1YzItYWVjMC00YjA2LTllYTktNTIwOTAwMDEzMDIyIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoiemUiLCJfdXNlcl9jb2RlIjoiIiwiX3VzZXJfbmFtZSI6InplIiwiX3VzZXJfdWlkIjoiNjIyOWE0MjctMTM0NS00M2U1LWFhMjYtOWE1MWU4Y2U0ZThhIn0.mP3In0Hal9NJm35ByVSTw_SHF4VP31GvmsYXvN7Yy8fxU0IKiAA9DeR09g1TPeMfDm3IUiyBPWscRM7YO0q94g	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNDliMzdmMTUtN2JkNC00OTE3LTkyMDktZjFhN2UzMzdhOThkIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImNjNjk3NWMyLWFlYzAtNGIwNi05ZWE5LTUyMDkwMDAxMzAyMiJ9.a3Gd7WC9iQzj6umjTzV7aw1FOqEvT7aeQ1q2niRWL1AlsUL7yp1cdWqLAI2l04lL4dXtunfp2nY7Ttzvw-WT7g	2022-03-11 18:05:41.323099	2022-03-11 19:05:41.323144	2022-03-12 18:05:41.331283	t
191	19be5a76-37df-451f-b4d6-63fc5322de1b	5	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMTliZTVhNzYtMzdkZi00NTFmLWI0ZDYtNjNmYzUzMjJkZTFiIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiZWRkOWIwYjYtZTA4YS00ZGNmLThmMTktNTE1OTY4NmE0NmRlIn0.SY18oEPtugqNgHw0vNQAlpX1l08NcRV1_aZ4Tdd2ia8Ehy1Eej2twGA7DgrIA3_gRM5WSlH-CYwbaboxZACZoQ	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiZjM2ZWZkMzctODIzMy00MWQ0LWJkMDAtMDI2ZDM2ODE5ZGUzIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjE5YmU1YTc2LTM3ZGYtNDUxZi1iNGQ2LTYzZmM1MzIyZGUxYiJ9.bolhipXzF_ioSf77EoU4bwGAUhGwcrwMxOJbnvJnObONDhin0p3KDIzXtrMAYPT_Ds3I6b7a7OIYHt64U9mIrg	2022-03-11 18:44:10.4686	2022-03-11 19:44:10.468759	2022-03-12 18:44:10.487101	t
192	30f2c70c-0e03-410d-a53b-1fb4a202f430	5	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMzBmMmM3MGMtMGUwMy00MTBkLWE1M2ItMWZiNGEyMDJmNDMwIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiZWRkOWIwYjYtZTA4YS00ZGNmLThmMTktNTE1OTY4NmE0NmRlIn0.nwRwYsGotwLkrNS4xAHcef7HFRo7CYzH3hg6oXPo8I1jipoMNUCkygWxVdTg76JxWBbblrRbJZD4uMd80fxsFA	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiZmQ4MmVkMjItYjhlOS00ZDQxLTg2NzQtMDY3ZDIwYzc3ZTQzIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjMwZjJjNzBjLTBlMDMtNDEwZC1hNTNiLTFmYjRhMjAyZjQzMCJ9.cgrGb2TyGMX-ptk43ey-jklhvDFaXVlkLBLfcj8VIVQKMW-F-KJ2qwLhMaj2WctXkV_J-a61J_FXzVYAqDyrkg	2022-03-11 19:48:32.736316	2022-03-11 20:48:32.736379	2022-03-12 19:48:32.746041	f
196	9f082172-4fe2-4dce-a9cc-0b3cbbd7b0bb	195	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiOWYwODIxNzItNGZlMi00ZGNlLWE5Y2MtMGIzY2JiZDdiMGJiIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiZWRkOWIwYjYtZTA4YS00ZGNmLThmMTktNTE1OTY4NmE0NmRlIn0.5lTkC8X92ZnGYmDftV1LzfMnuiieic08WPYgLwXkcPVJ040LbtZYafZYrMyVkv9urFfpKdPWWutg7BCcVqTmzg	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMDAxZWJlYjctMGM1Ny00MTg0LTg4NGUtZjhjYjk1MzQ2NWMzIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjlmMDgyMTcyLTRmZTItNGRjZS1hOWNjLTBiM2NiYmQ3YjBiYiJ9.FJmhxc8OZ3PxPAJebCwhr1InTUnCLNU16MDVxAIcCsBtIjUBpPPPXAkM_Fh4p6EUYo0P51IStqW5NEESlnFFrg	2022-03-12 01:04:47.177504	2022-03-12 02:04:47.177551	2022-03-13 01:04:47.180898	f
193	4fb6b5ba-f25f-4db2-bd55-e51e3ac7e02c	192	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNGZiNmI1YmEtZjI1Zi00ZGIyLWJkNTUtZTUxZTNhYzdlMDJjIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiZWRkOWIwYjYtZTA4YS00ZGNmLThmMTktNTE1OTY4NmE0NmRlIn0.OH1mJ3opxyB2Jg3aJLkyqGIPjc-zbr9ZPG0mp3IQL2_KjUSGkWlk-gzlQLGGiA48JOCDQ2pTWoGLIMzVxCqXUA	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiZDYzMzA0YzMtZTBhNi00ZWJlLTk1ZGUtYzBmNGI5OGI2OWJmIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjRmYjZiNWJhLWYyNWYtNGRiMi1iZDU1LWU1MWUzYWM3ZTAyYyJ9.7mhDHWxzSCaZFZiyAYcSjxMs4kIPl84Sxp9Sgam5YqDgjmyJV9Z2a7UW-Fgluunlwva3zX_f9PvOKEJa-KF-3w	2022-03-11 21:59:38.875533	2022-03-11 22:59:38.875584	2022-03-12 21:59:38.88523	f
194	979580b3-730d-43a4-8e2c-8378cab073d0	193	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiOTc5NTgwYjMtNzMwZC00M2E0LThlMmMtODM3OGNhYjA3M2QwIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiZWRkOWIwYjYtZTA4YS00ZGNmLThmMTktNTE1OTY4NmE0NmRlIn0.M_Ikg0oLI5wdIFAf-c3MsIT6bSS7HeU1kPESL15VjKbmziv-gmB-8Vd5dda8rIQNdzyijTLYMoPVBn44hXMDpQ	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMzYzMjVmOGMtMWE5ZS00ODkzLTg3MDAtMTQ1MGUxN2E4NjBhIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6Ijk3OTU4MGIzLTczMGQtNDNhNC04ZTJjLTgzNzhjYWIwNzNkMCJ9.ljftRvF8YYR01s-dJnomfzM8xpcvioX-mRRPqujp7BTU5BVw63tnC4_csHOVP6UMq1h0DvGzRUnV-esIEuJXMQ	2022-03-11 23:01:38.941376	2022-03-12 00:01:38.941408	2022-03-12 23:01:38.944211	f
195	6669287d-8b30-41fc-adf9-90787c575cf3	194	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNjY2OTI4N2QtOGIzMC00MWZjLWFkZjktOTA3ODdjNTc1Y2YzIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiZWRkOWIwYjYtZTA4YS00ZGNmLThmMTktNTE1OTY4NmE0NmRlIn0.LvWz8Ngf0TLnGt7gBi-Avq82h9gcD3CrI_cdXLDkj7lPnnyd9N0jJwjoBwLOA2VEv94b-Po6qKDqy0WezijKwA	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNzE2NGNhZGItMTVlZi00NGVkLTk2YTUtMjEwNjA1ODEzMmZmIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjY2NjkyODdkLThiMzAtNDFmYy1hZGY5LTkwNzg3YzU3NWNmMyJ9.Xp0mQHPKWRDDvaljnQ2pA9asbwKFllGvwrksMpiFjEgtO_xKvnu7ALof7-5sZGieNQ-S2h_IcdIAjvXHznQ8Sw	2022-03-12 00:02:47.110252	2022-03-12 01:02:47.110296	2022-03-13 00:02:47.130263	f
201	be665d1d-8b24-4687-aae8-84ab8c5e0368	200	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYmU2NjVkMWQtOGIyNC00Njg3LWFhZTgtODRhYjhjNWUwMzY4IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiZWRkOWIwYjYtZTA4YS00ZGNmLThmMTktNTE1OTY4NmE0NmRlIn0.1-YVpLoulZG0bV6DfV6CQJM6RYiU0aJH7DiNtzWNw8HSiBlLitiwapxH2PEk4n1L45n0QZCNXs52gRSsUeA4Ig	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMmY2NGI4OTktZTFmZi00N2EyLTg5NzgtYjk2N2MyNmEzZjk1IiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImJlNjY1ZDFkLThiMjQtNDY4Ny1hYWU4LTg0YWI4YzVlMDM2OCJ9.2HHRfeoCtCoIbZCcBfw7BhzLCN_bbH3XpMgcbs_3jDCLjRjVjU0ZxJfRxW-g8ogDotoj1P63fQoqppHATcLqkA	2022-03-12 06:13:22.202494	2022-03-12 07:13:22.202537	2022-03-13 06:13:22.22198	f
199	a9eb56c1-3ad9-4820-b2df-74cd28763004	198	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYTllYjU2YzEtM2FkOS00ODIwLWIyZGYtNzRjZDI4NzYzMDA0IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiZWRkOWIwYjYtZTA4YS00ZGNmLThmMTktNTE1OTY4NmE0NmRlIn0.ZVVoNYC8Uzrh0ETKGgeOGyG0P0FbbSXbxDVoRO18ZFGkBJcqhJU3v0SE6JGePm7UdsWcKG4RfX9kM4eF2J-zOQ	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYmNkYzhiYjEtMWEwNy00ODkxLTkwYzYtZDdmN2Y0MDA1Mzg3IiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImE5ZWI1NmMxLTNhZDktNDgyMC1iMmRmLTc0Y2QyODc2MzAwNCJ9.dDKUy6DXvYLrOPJwJYIXU3nMjRRetRlZx4UtTuxKlsvzW85upP_ur_-zx3Tk64dM9A2aPgc2oUg7-owcxdwuZw	2022-03-12 04:10:31.596185	2022-03-12 05:10:31.596241	2022-03-13 04:10:31.611849	f
197	0581f7f6-e062-4093-877a-4fe2a3e83614	196	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMDU4MWY3ZjYtZTA2Mi00MDkzLTg3N2EtNGZlMmEzZTgzNjE0IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiZWRkOWIwYjYtZTA4YS00ZGNmLThmMTktNTE1OTY4NmE0NmRlIn0.LDcYAsKbFzhGLzFdE-YT9loZFBYB0SbaAyLOLqbKwJ9-L5y9bSIxotrJAp5kiCe2LCpDfdDAXK2xZpiNPsQVyQ	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiY2E3MmFhZjAtMDA3MS00ZTE0LWFjMTMtM2YwZTJjZGM1MThiIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjA1ODFmN2Y2LWUwNjItNDA5My04NzdhLTRmZTJhM2U4MzYxNCJ9.y4XZyqoF5sZDP3PEHlZkwfxYSnqub2ZGrrTuoIbnrIHFBX1jcjeBHYDsp_TOya9DFDexH2CQ4pynBioPYtHyvQ	2022-03-12 02:07:02.203189	2022-03-12 03:07:02.203236	2022-03-13 02:07:02.206084	f
200	efee9b2a-835f-42a7-be31-32f721160324	199	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiZWZlZTliMmEtODM1Zi00MmE3LWJlMzEtMzJmNzIxMTYwMzI0IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiZWRkOWIwYjYtZTA4YS00ZGNmLThmMTktNTE1OTY4NmE0NmRlIn0.oX4S7nuz5d6AE105xNDtkmTEhq02PB2FoEv7Pr0zw9RoFvTC6IGFrSiRbM7Y3nT58JOJuPYyAyGi5fxBRXWErQ	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMzYxZTI5NzMtOWVkNS00N2E5LWFlM2UtNjcyNzc4ODAwOGI3IiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImVmZWU5YjJhLTgzNWYtNDJhNy1iZTMxLTMyZjcyMTE2MDMyNCJ9.LxBQsUxr4Vl58KKbD4IGJSLC4GSBGE_qwucJ1wO80IG_xFTIzBkRxEZu4HYkCQxp4R2K3YN91lV_ofA7_z3w8Q	2022-03-12 05:12:21.064567	2022-03-12 06:12:21.064596	2022-03-13 05:12:21.069075	f
198	c05c0af5-e707-459c-b222-52fcd975d8c7	197	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYzA1YzBhZjUtZTcwNy00NTljLWIyMjItNTJmY2Q5NzVkOGM3IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiZWRkOWIwYjYtZTA4YS00ZGNmLThmMTktNTE1OTY4NmE0NmRlIn0.mVQvpubkbIKMZirRP5cZup7t0wPydMIdkHXd6gzFURCZgDyzFfpZoGw6zyamXhOtwNY6Z1V4DxByb1lokvoMoQ	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMjI0MjFhZWEtNDU1Ny00ZmYxLTgxZTktMjk1MDdkODdmOGJkIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImMwNWMwYWY1LWU3MDctNDU5Yy1iMjIyLTUyZmNkOTc1ZDhjNyJ9.EqAWC41BBrB_mPX75MbWJkmLN_Dxok4LeRU3ObrX1KP6qpFrYGkg_-poQHTH4KIa0TMdbqE3XI4I8Z0gO0zzwg	2022-03-12 03:09:04.4562	2022-03-12 04:09:04.456434	2022-03-13 03:09:04.481436	f
203	372b72d8-a6d1-4f06-a970-0a372fb9638f	202	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMzcyYjcyZDgtYTZkMS00ZjA2LWE5NzAtMGEzNzJmYjk2MzhmIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiZWRkOWIwYjYtZTA4YS00ZGNmLThmMTktNTE1OTY4NmE0NmRlIn0.9KAhfjAo8IeSpl7KwlJ93LRJS-Mdo-tu7EYfrzYjKaICHYuzv-LnP7FRF6AYDLRcFskxy5qYdhkWiz0jzx-QNA	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYTZlZTE0ZGEtOTc4Yy00NWFlLWExYjYtZDRiYTg0YTdiNTY3IiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjM3MmI3MmQ4LWE2ZDEtNGYwNi1hOTcwLTBhMzcyZmI5NjM4ZiJ9.xM6wG-uEzS8kr_Oe7g2hottNlyGwcBxY0JezeU5ZkiqH5_D_R9RUJDBA2O11DsM768s0PwYimadGAf2f6YEx7w	2022-03-12 08:17:53.614575	2022-03-12 09:17:53.614616	2022-03-13 08:17:53.62932	f
202	6176be7a-f081-4931-b19a-89bcdcd98493	201	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNjE3NmJlN2EtZjA4MS00OTMxLWIxOWEtODliY2RjZDk4NDkzIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiZWRkOWIwYjYtZTA4YS00ZGNmLThmMTktNTE1OTY4NmE0NmRlIn0.2vSpcXVrtygRY7kkSvNHW_Rc-dJ6hogVYMhcAZeELKfGQ08p8rI70EE23eRMmklqOpTEj_ttLvfC5W8JfIFocg	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNTkwNDdhMzEtZDJiMi00ZWY5LWJiYWQtNGUzZjQxNGJiYjVkIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjYxNzZiZTdhLWYwODEtNDkzMS1iMTlhLTg5YmNkY2Q5ODQ5MyJ9.o2iSjK8kwHMNWAIR6m7Bjk7QEtAfkOoQT04KqH8EHB6SWRgJXryXqj9s7dUeuYWbtm4JJ39S1MT7JNCBLBkNlw	2022-03-12 07:15:39.204702	2022-03-12 08:15:39.20474	2022-03-13 07:15:39.208456	f
205	ff36af3f-8675-405e-90b3-6fc3b11993d3	204	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiZmYzNmFmM2YtODY3NS00MDVlLTkwYjMtNmZjM2IxMTk5M2QzIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiZWRkOWIwYjYtZTA4YS00ZGNmLThmMTktNTE1OTY4NmE0NmRlIn0.rpmMmf0wf-pqpHBBjyz8-KmmgYZcpoEnT248Q_d-fxIaUOVDkiEgBP-jO4wy7AdSmDpwUCBZYLdInqoHsJxDkw	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNjFlYTI2NmMtMjQ0OS00YzY5LWI3YTAtM2RjZDE0NjhiZjQxIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImZmMzZhZjNmLTg2NzUtNDA1ZS05MGIzLTZmYzNiMTE5OTNkMyJ9.hmHxSbiUNHXT_cixktw73B8c6bg-xfftNg1gDjPlfDBN8F-clIHv38R6366nOCc9tbjz-Tfv0dp4GF8h1W0Y1A	2022-03-12 10:21:26.436735	2022-03-12 11:21:26.436765	2022-03-13 10:21:26.446505	t
204	8afb895c-6e9e-4372-bb8d-8e54ab6a1028	203	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiOGFmYjg5NWMtNmU5ZS00MzcyLWJiOGQtOGU1NGFiNmExMDI4IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiZWRkOWIwYjYtZTA4YS00ZGNmLThmMTktNTE1OTY4NmE0NmRlIn0.wmb58ftw0E66s9X82RZFCoMxPzpwAHhegv2Z5iJw8ioPuOur6z_pfL8WD6TemfW2BL5Er0m6BuP5lcSJVjodgA	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYzA4ZTZkM2YtMzUwNC00MWU4LWE2ZDAtY2RlMGJlZTc0Y2Y2IiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjhhZmI4OTVjLTZlOWUtNDM3Mi1iYjhkLThlNTRhYjZhMTAyOCJ9.4yN9maMiZ8yd2GBlhP9psF1k5sb4j296V6i5xEJPIW6hpnXLrNQEjU5GC5-PAVh9fh-OhYMImDd5AwHcdK5R_g	2022-03-12 09:20:04.340031	2022-03-12 10:20:04.340061	2022-03-13 09:20:04.343096	f
206	a642e45d-a5cf-46f8-933f-28802c14aff8	8	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYTY0MmU0NWQtYTVjZi00NmY4LTkzM2YtMjg4MDJjMTRhZmY4IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoibWFyaW8iLCJfdXNlcl9jb2RlIjoiIiwiX3VzZXJfbmFtZSI6Ik1hcmlvIEdvbsOnYWx2ZXMiLCJfdXNlcl91aWQiOiJmMzk1NzdmNS0zYmYyLTRhZjgtYjcwMy02MTg5ZmM5YTZhOTUifQ.pfdIov3iInQQ4RG1VcBFNX4aEqehxbCuZu1Q8I5gRWBokFWJHdv9rBn5F6XvidXg3xX-e_oCIhhr2G2TyWCzEw	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYjczNDNlMWEtY2Y3MC00ZTRkLTk3ZTktOTdkZThmOWRmYTRkIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImE2NDJlNDVkLWE1Y2YtNDZmOC05MzNmLTI4ODAyYzE0YWZmOCJ9.-qYM0Z0Ej4BrFbXA_BKERCFjSitWzvYMjSlvDbpTF72QJmqcsKIEpHan5OFaCjSKGWkS850i-NXAnwSTUJ6WBg	2022-03-12 11:57:27.623693	2022-03-12 12:57:27.623901	2022-03-13 11:57:27.633865	t
207	bb929647-2d55-4075-ade8-72d34022d382	5	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYmI5Mjk2NDctMmQ1NS00MDc1LWFkZTgtNzJkMzQwMjJkMzgyIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiZWRkOWIwYjYtZTA4YS00ZGNmLThmMTktNTE1OTY4NmE0NmRlIn0.C74j4bNNz9AUsBKCG3f5eL4cLBCh8EKXs0g6UaJVI_BX_9XGW6uLJazX_xoiY2urqjcVOFekNrEjucrW7VRGmQ	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNzAyNmY3ZDYtM2MzZi00MzQzLTliMTEtNzM3YzM4ZjU4ZjBhIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6ImJiOTI5NjQ3LTJkNTUtNDA3NS1hZGU4LTcyZDM0MDIyZDM4MiJ9.J8nPvlzDmZQFJmZdSZjXsUX6Lbv1edlicz_YtnIRcJuTyQIR4BdgL-_KT8LHTn5upcyxRT8bGAZyeB-oYtLHMQ	2022-03-12 12:02:46.393564	2022-03-12 13:02:46.393644	2022-03-13 12:02:46.397471	t
208	13d67eeb-f0f2-4dda-8697-7338f7730470	8	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiMTNkNjdlZWItZjBmMi00ZGRhLTg2OTctNzMzOGY3NzMwNDcwIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoibWFyaW8iLCJfdXNlcl9jb2RlIjoiIiwiX3VzZXJfbmFtZSI6Ik1hcmlvIEdvbsOnYWx2ZXMiLCJfdXNlcl91aWQiOiJmMzk1NzdmNS0zYmYyLTRhZjgtYjcwMy02MTg5ZmM5YTZhOTUifQ.HL2TrW7UwUQ2vkajgvcIviWLV6-qAorcBA0DEQRDrIBj4TRL228PLvZydIM3kUQ9TM3Q-hhvvqSrF-lVUz9BvQ	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiYTI0YTc4ZDktZWE3NS00NmIxLWFlMTMtNTJiZWZiZDFiZjYxIiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjEzZDY3ZWViLWYwZjItNGRkYS04Njk3LTczMzhmNzczMDQ3MCJ9.iMMPx4nG7lgRcuwjw0B22MvY6LWly2I-ohbcoU5lCfCK0IAbmJu9G-Cmjc-OaRzjDX7U4rzwohpQ0gZE2LLHhg	2022-03-12 12:08:48.81054	2022-03-12 13:08:48.810583	2022-03-13 12:08:48.824411	t
210	49d4371d-bd34-4c7d-aa6f-f91874cdaa84	209	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNDlkNDM3MWQtYmQzNC00YzdkLWFhNmYtZjkxODc0Y2RhYTg0IiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiZWRkOWIwYjYtZTA4YS00ZGNmLThmMTktNTE1OTY4NmE0NmRlIn0.SEJ_gDm8ExTyd0u3HKX-3rvukaRF2Mad9YoG-OmTgzDyiO1upIeoi49SMx6aBOc5aJEDP1UWp1517tfA--9szw	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNDgxMTEzOTAtNmU0MC00NjRjLTg5ZGQtMDY4NmM0MjM5Zjk5IiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjQ5ZDQzNzFkLWJkMzQtNGM3ZC1hYTZmLWY5MTg3NGNkYWE4NCJ9.NhfJr47mFVdMJO_lslYM0QS38FfDDQKSZfp8_BjNXf5bX1RCrIgLvefEvGX0JzxMRrrU3lhBEtcgCshkCV9OGw	2022-03-12 13:50:20.382928	2022-03-12 14:50:20.382986	2022-03-13 13:50:20.387007	t
209	58f238db-6e0d-4a0c-8868-bd4dc163b44c	5	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNThmMjM4ZGItNmUwZC00YTBjLTg4NjgtYmQ0ZGMxNjNiNDRjIiwiX2FkbWluIjpmYWxzZSwiX2RldiI6ZmFsc2UsIl9ncm91cF9jb2RlIjoiY2xpZW50IiwiX2dyb3VwX25hbWUiOiJDbGllbnRlIiwiX2dyb3VwX3VpZCI6IjUwNzI0NTNhLTI0NjktNGVkNS04NTY5LTczMWRmN2QzNTIzNiIsIl91c2VyIjoidm9sdCIsIl91c2VyX2NvZGUiOiIiLCJfdXNlcl9uYW1lIjoiQ2FybG9zIFZpdG9yaW5vIiwiX3VzZXJfdWlkIjoiZWRkOWIwYjYtZTA4YS00ZGNmLThmMTktNTE1OTY4NmE0NmRlIn0.cdol7Q4EAAz7vx0AhP2NoUv2sZQwk8npBeqPnmj8i_v2kYqCEZ7oTJb_FrbYLH7w6KhE5rbRrpNMbaR3-bzmPQ	eyJhbGciOiJIUzUxMiJ9.eyJ0b2tlbl90eXBlIjoiQmVhcmVyIiwidWlkIjoiNjI3YzVjYTItZjUxYy00YTljLWE2ZDgtMTBiZjJlMWZiN2Q4IiwiZXhwaXJlc19pbiI6ODY0MDAwMDAsInRva2VuX3VpZCI6IjU4ZjIzOGRiLTZlMGQtNGEwYy04ODY4LWJkNGRjMTYzYjQ0YyJ9.CltyZ3lbbmcv0G5Q_8agUnbgxWVXLd8owOH-tEgBLR-axQvmbyBAbbaK2IBE1ALPyF-9WZIymRW1wR-sTSSy9w	2022-03-12 12:22:53.367004	2022-03-12 13:22:53.367052	2022-03-13 12:22:53.370452	f
\.


--
-- Data for Name: netuno_client; Type: TABLE DATA; Schema: public; Owner: bodylanguage
--

COPY public.netuno_client (id, uid, name, token, secret, active) FROM stdin;
\.


--
-- Data for Name: netuno_client_hit; Type: TABLE DATA; Schema: public; Owner: bodylanguage
--

COPY public.netuno_client_hit (id, uid, client_id, user_id, moment) FROM stdin;
\.


--
-- Data for Name: netuno_design; Type: TABLE DATA; Schema: public; Owner: bodylanguage
--

COPY public.netuno_design (id, uid, table_id, name, displayname, description, x, y, type, width, height, max, min, colspan, rowspan, tdwidth, tdheight, "notnull", primarykey, whenresult, whenfilter, whenedit, whenview, whennew, whenexport, user_id, group_id, view_user_id, view_group_id, edit_user_id, edit_group_id, properties, firebase) FROM stdin;
2	4d47e2f4-86e9-4a63-a650-7670acdb6e6b	1	email	Email		1	3	email	0	0	0	0	0	0	0	0	f	t	t	t	t	t	t	t	0	0	0	0	0	0	{}	
3	5d3dcdfe-cba8-4094-9571-eb43aaa731f3	1	name	Name		1	1	text	0	0	0	0	0	0	0	0	t	f	t	t	t	t	t	t	0	0	0	0	0	0	{"MASK_REVERSE":{"default":"false","type":"BOOLEAN","value":"false"},"MASK_SELECTONFOCUS":{"default":"false","type":"BOOLEAN","value":"false"},"MASK":{"default":"","type":"STRING","value":""}}	
11	58b22300-b974-447b-b5aa-3ca5a31559c7	2	gender	Gender		1	2	text	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{"MASK_REVERSE":{"default":"false","type":"BOOLEAN","value":"false"},"MASK_SELECTONFOCUS":{"default":"false","type":"BOOLEAN","value":"false"},"MASK":{"default":"","type":"STRING","value":""}}	
12	6a700750-eabe-4328-9d09-4b94c219a702	2	weight	Weight		1	3	textfloat	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{"MASK_REVERSE":{"default":"true","type":"BOOLEAN","value":"true"},"MASK_SELECTONFOCUS":{"default":"false","type":"BOOLEAN","value":"false"},"MASK":{"default":"#.##0,00","type":"STRING","value":"#.##0,00"}}	
13	2bb5e0e2-e045-4d62-b777-a500a7893ca8	2	height	Height		1	4	textfloat	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{"MASK_REVERSE":{"default":"true","type":"BOOLEAN","value":"true"},"MASK_SELECTONFOCUS":{"default":"false","type":"BOOLEAN","value":"false"},"MASK":{"default":"#.##0,00","type":"STRING","value":"#.##0,00"}}	
14	7bba90eb-adde-4119-8e51-e1383ca57eb2	2	goals	Goals		1	5	textarea	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{}	
21	b1ff3902-d935-4d0d-8712-f45d98c776d1	9	name	Name		1	1	text	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{"MASK_REVERSE":{"default":"false","type":"BOOLEAN","value":"false"},"MASK_SELECTONFOCUS":{"default":"false","type":"BOOLEAN","value":"false"},"MASK":{"default":"","type":"STRING","value":""}}	
22	a80c66ea-b528-43db-9094-835492f2d1ee	9	code	Code		1	2	text	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{"MASK_REVERSE":{"default":"false","type":"BOOLEAN","value":"false"},"MASK_SELECTONFOCUS":{"default":"false","type":"BOOLEAN","value":"false"},"MASK":{"default":"","type":"STRING","value":""}}	
28	70107171-287c-4a7a-a8c0-ac917c7ab8a3	1	sessions_per_month	Sessions Per Month		1	15	textnum	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{"MASK_REVERSE":{"default":"false","type":"BOOLEAN","value":"false"},"MASK_SELECTONFOCUS":{"default":"false","type":"BOOLEAN","value":"false"},"MASK":{"default":"","type":"STRING","value":""}}	
1	a12ea087-4080-4efc-97db-bca79995311d	1	user	User		1	2	user	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{"ALLOW_USER_LOGGED":{"default":"false","type":"BOOLEAN","value":"false"},"GROUPS":{"default":"","type":"STRING","value":""},"GROUPS_MODE":{"default":"all|exclude|only","type":"CHOICE","value":"all"},"USERS_MODE":{"default":"all|exclude|only","type":"CHOICE","value":"all"},"USERS":{"default":"","type":"STRING","value":""}}	
25	a0b07be4-cd79-4cf8-9374-0986c56bbf43	2	age	Age		1	1	textnum	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{"MASK_REVERSE":{"default":"false","type":"BOOLEAN","value":"false"},"MASK_SELECTONFOCUS":{"default":"false","type":"BOOLEAN","value":"false"},"MASK":{"default":"","type":"STRING","value":""}}	
15	33fe10b8-0a9b-45fe-98b1-68a8852eb17d	2	likes	Likes		1	7	textarea	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{}	
18	552224db-80ca-4dbb-9ef7-a5d524529348	4	name	Name		1	2	text	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{"MASK_REVERSE":{"default":"false","type":"BOOLEAN","value":"false"},"MASK_SELECTONFOCUS":{"default":"false","type":"BOOLEAN","value":"false"},"MASK":{"default":"","type":"STRING","value":""}}	
20	4a19d31c-ddd5-4c39-81c1-50d00ee30d99	4	vat	VAT number		1	5	text	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{"MASK_REVERSE":{"default":"false","type":"BOOLEAN","value":"false"},"MASK_SELECTONFOCUS":{"default":"false","type":"BOOLEAN","value":"false"},"MASK":{"default":"","type":"STRING","value":""}}	
16	fd4a5330-4b72-4b07-805b-6e403da1ed2c	2	dislikes	Dislikes		1	8	textarea	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{}	
17	4714ccbc-14c8-4fb6-8436-72c3c40b6be3	2	injuries_conditions	Injuries / Conditions		1	9	textarea	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{}	
26	68dbd293-fa49-4125-8bcb-3e0cf823faec	2	client_id	client		1	10	select	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{"MAX_COLUMN_LENGTH":{"default":"0","type":"INTEGER","value":"0"},"COLUMN_SEPARATOR":{"default":" - ","type":"LINK_SEPARATOR","value":" - "},"LINK":{"default":"","type":"LINK","value":"client:email"},"SERVICE":{"default":"com/Select.netuno","type":"STRING","value":"com/Select.netuno"},"ONLY_ACTIVES":{"default":"false","type":"BOOLEAN","value":"false"}}	
7	4741d18e-9f7a-480b-a176-b547f783af9b	1	photo	Photo		1	10	image	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{}	
9	4c0bdcbc-3b27-496d-92e6-4afad2520dfe	1	session_duration	Session Duration		1	12	textnum	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{"MASK_REVERSE":{"default":"false","type":"BOOLEAN","value":"false"},"MASK_SELECTONFOCUS":{"default":"false","type":"BOOLEAN","value":"false"},"MASK":{"default":"","type":"STRING","value":""}}	
24	448e7e57-a8bd-4e3d-b610-6d9856b7c39e	1	phone_number	Phone Number		1	13	text	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{"MASK_REVERSE":{"default":"false","type":"BOOLEAN","value":"false"},"MASK_SELECTONFOCUS":{"default":"false","type":"BOOLEAN","value":"false"},"MASK":{"default":"","type":"STRING","value":""}}	
27	de63d8e7-ddd9-4189-885f-6a4c4ccffaf0	1	start_date	Start Date		1	14	date	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{"DEFAULT_CURRENT":{"default":"false","type":"BOOLEAN","value":"false"}}	
4	5d5d0751-c200-4e19-816d-2aa7d6b56952	1	recovery_key	Chave de Recuperação		1	5	text	0	0	0	0	0	0	0	0	f	f	f	t	t	t	t	t	0	0	0	0	0	0	{"MASK_REVERSE":{"default":"false","type":"BOOLEAN","value":"false"},"MASK_SELECTONFOCUS":{"default":"false","type":"BOOLEAN","value":"false"},"MASK":{"default":"","type":"STRING","value":""}}	
8	46d1dce2-0d50-40fb-ab00-51ad786f563c	1	default_price	Default Price		1	11	textfloat	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{"MASK_REVERSE":{"default":"true","type":"BOOLEAN","value":"true"},"MASK_SELECTONFOCUS":{"default":"false","type":"BOOLEAN","value":"false"},"MASK":{"default":"#.##0,00","type":"STRING","value":"#.##0,00"}}	
5	fa1239f7-7565-41f7-a5ad-ef6790f67d6e	1	recovery_limit	Limite de Recuperação		1	7	datetime	0	0	0	0	0	0	0	0	f	f	f	t	t	t	t	t	0	0	0	0	0	0	{"DEFAULT_CURRENT":{"default":"false","type":"BOOLEAN","value":"false"}}	
34	2ec9f3ce-3364-481b-a840-e3c7bca467a7	11	value	Value		1	1	text	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{"MASK_REVERSE":{"default":"false","type":"BOOLEAN","value":"false"},"MASK_SELECTONFOCUS":{"default":"false","type":"BOOLEAN","value":"false"},"MASK":{"default":"","type":"STRING","value":""}}	
58	cf50c83b-7dbc-44bf-a57e-b1427fe89fdb	10	label	Label		1	2	text	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{"MASK_REVERSE":{"default":"false","type":"BOOLEAN","value":"false"},"MASK_SELECTONFOCUS":{"default":"false","type":"BOOLEAN","value":"false"},"MASK":{"default":"","type":"STRING","value":""}}	
38	3d8a7c42-cb4e-4a5f-b74d-fc9591625169	6	client_id	client		1	1	select	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{"MAX_COLUMN_LENGTH":{"default":"0","type":"INTEGER","value":"0"},"COLUMN_SEPARATOR":{"default":" - ","type":"LINK_SEPARATOR","value":" - "},"LINK":{"default":"","type":"LINK","value":"client:name"},"SERVICE":{"default":"com/Select.netuno","type":"STRING","value":"com/Select.netuno"},"ONLY_ACTIVES":{"default":"false","type":"BOOLEAN","value":"false"}}	
40	948390b6-18c8-48cd-a353-46c9d8903927	6	duration	Duration		1	3	textnum	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{"MASK_REVERSE":{"default":"false","type":"BOOLEAN","value":"false"},"MASK_SELECTONFOCUS":{"default":"false","type":"BOOLEAN","value":"false"},"MASK":{"default":"","type":"STRING","value":""}}	
41	27ea64dc-154a-4fad-aef3-df7c99ff4f79	6	price	Price		1	4	textfloat	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{"MASK_REVERSE":{"default":"true","type":"BOOLEAN","value":"true"},"MASK_SELECTONFOCUS":{"default":"false","type":"BOOLEAN","value":"false"},"MASK":{"default":"#.##0,00","type":"STRING","value":"#.##0,00"}}	
44	c27f4843-0552-4483-87ac-84e34b7da102	5	client_id	Client		1	1	select	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{"MAX_COLUMN_LENGTH":{"default":"0","type":"INTEGER","value":"0"},"COLUMN_SEPARATOR":{"default":" - ","type":"LINK_SEPARATOR","value":" - "},"LINK":{"default":"","type":"LINK","value":"client:name"},"SERVICE":{"default":"com/Select.netuno","type":"STRING","value":"com/Select.netuno"},"ONLY_ACTIVES":{"default":"false","type":"BOOLEAN","value":"false"}}	
45	e7b5209c-901f-4785-9096-0f7adef24096	5	pay_day	Pay Day		1	2	date	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{"DEFAULT_CURRENT":{"default":"false","type":"BOOLEAN","value":"true"}}	
46	8643858d-bfc3-497b-9ac2-339162d79c3a	5	sessions	Sessions		1	3	textarea	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{}	
48	71133276-5f78-4b23-b0c7-10b2b6b18235	5	billing_period	Billing Period		1	5	text	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{"MASK_REVERSE":{"default":"false","type":"BOOLEAN","value":"false"},"MASK_SELECTONFOCUS":{"default":"false","type":"BOOLEAN","value":"false"},"MASK":{"default":"","type":"STRING","value":""}}	
54	846ed14c-a000-4299-b758-de0d7293713d	5	description	Description		1	9	text	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{"MASK_REVERSE":{"default":"false","type":"BOOLEAN","value":"false"},"MASK_SELECTONFOCUS":{"default":"false","type":"BOOLEAN","value":"false"},"MASK":{"default":"","type":"STRING","value":""}}	
53	ab0500bd-fb3a-4afa-8935-a1de155a48a6	12	value	Value	\N	1	1	text	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{"MASK_REVERSE":{"default":"false","type":"BOOLEAN","value":"false"},"MASK_SELECTONFOCUS":{"default":"false","type":"BOOLEAN","value":"false"},"MASK":{"default":"","type":"STRING","value":""}}	
51	05edb23a-bac9-4606-bd16-27785731444c	5	status_id	status		1	8	select	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{"MAX_COLUMN_LENGTH":{"default":"0","type":"INTEGER","value":"0"},"COLUMN_SEPARATOR":{"default":" - ","type":"LINK_SEPARATOR","value":" - "},"LINK":{"default":"","type":"LINK","value":"payment_status:name"},"SERVICE":{"default":"com/Select.netuno","type":"STRING","value":"com/Select.netuno"},"ONLY_ACTIVES":{"default":"false","type":"BOOLEAN","value":"true"}}	
47	66b853d6-f147-4af4-9d30-721e852742e4	5	total_amount	Total Amount		1	4	textfloat	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{"MASK_REVERSE":{"default":"true","type":"BOOLEAN","value":"true"},"MASK_SELECTONFOCUS":{"default":"false","type":"BOOLEAN","value":"false"},"MASK":{"default":"#.##0,00","type":"STRING","value":"#-##0,00"}}	
57	aee6a070-2117-4f32-a5ca-049c656527a8	5	paid_at	Paid At		1	11	date	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{"DEFAULT_CURRENT":{"default":"false","type":"BOOLEAN","value":"true"}}	
52	0b8ba22b-3f3e-4f3f-846f-ad357eb9535c	12	label	Label		1	2	text	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{"MASK_REVERSE":{"default":"false","type":"BOOLEAN","value":"false"},"MASK_SELECTONFOCUS":{"default":"false","type":"BOOLEAN","value":"false"},"MASK":{"default":"","type":"STRING","value":""}}	
42	2cba1156-5b85-4332-9d44-175a5eb94d29	6	type_id	Type		1	5	select	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{"MAX_COLUMN_LENGTH":{"default":"0","type":"INTEGER","value":"0"},"COLUMN_SEPARATOR":{"default":" - ","type":"LINK_SEPARATOR","value":" - "},"LINK":{"default":"","type":"LINK","value":"session_type:label"},"SERVICE":{"default":"com/Select.netuno","type":"STRING","value":"com/Select.netuno"},"ONLY_ACTIVES":{"default":"false","type":"BOOLEAN","value":"false"}}	
50	88bd4e4a-1072-47d9-9282-0f2e577f8cde	5	created_at	Created At		1	7	date	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{"DEFAULT_CURRENT":{"default":"false","type":"BOOLEAN","value":"true"}}	
55	a50ff9cf-7f16-4a89-b022-582a5b83a5c4	5	provider_id	Provider		1	10	select	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{"MAX_COLUMN_LENGTH":{"default":"0","type":"INTEGER","value":"0"},"COLUMN_SEPARATOR":{"default":" - ","type":"LINK_SEPARATOR","value":" - "},"LINK":{"default":"","type":"LINK","value":"provider:text"},"SERVICE":{"default":"com/Select.netuno","type":"STRING","value":"com/Select.netuno"},"ONLY_ACTIVES":{"default":"false","type":"BOOLEAN","value":"false"}}	
43	65be798d-a766-4fb6-a5d2-bcd083dd92a4	6	date	Date		1	7	date	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{"DEFAULT_CURRENT":{"default":"false","type":"BOOLEAN","value":"true"}}	
33	da670ff2-dd9e-45b5-bb3a-28f5286d4f65	1	default_session_type_id	Default Session Type		1	16	select	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{"MAX_COLUMN_LENGTH":{"default":"0","type":"INTEGER","value":"0"},"COLUMN_SEPARATOR":{"default":" - ","type":"LINK_SEPARATOR","value":" - "},"LINK":{"default":"","type":"LINK","value":"session_type:code,name"},"SERVICE":{"default":"com/Select.netuno","type":"STRING","value":"com/Select.netuno"},"ONLY_ACTIVES":{"default":"false","type":"BOOLEAN","value":"false"}}	
59	1f31da4c-8cd2-495e-aa65-02eaebced836	10	value	Value	\N	1	1	text	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{"MASK_REVERSE":{"default":"false","type":"BOOLEAN","value":"false"},"MASK_SELECTONFOCUS":{"default":"false","type":"BOOLEAN","value":"false"},"MASK":{"default":"","type":"STRING","value":""}}	
60	13359e0d-55ae-4161-b5f4-a82b030f0d32	10	type_id	type		1	3	select	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{"MAX_COLUMN_LENGTH":{"default":"0","type":"INTEGER","value":"0"},"COLUMN_SEPARATOR":{"default":" - ","type":"LINK_SEPARATOR","value":" - "},"LINK":{"default":"","type":"LINK","value":"session_type:text"},"SERVICE":{"default":"com/Select.netuno","type":"STRING","value":"com/Select.netuno"},"ONLY_ACTIVES":{"default":"false","type":"BOOLEAN","value":"false"}}	
35	254f5d56-36e4-467c-b7d9-39beb8bb87a9	11	label	Label		1	2	text	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{"MASK_REVERSE":{"default":"false","type":"BOOLEAN","value":"false"},"MASK_SELECTONFOCUS":{"default":"false","type":"BOOLEAN","value":"false"},"MASK":{"default":"","type":"STRING","value":""}}	
62	70e21c31-c1ff-4fca-99c9-cc26a1077c0a	1	default_session_sub_type_id	Default Session Sub Type		1	17	select	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{"MAX_COLUMN_LENGTH":{"default":"0","type":"INTEGER","value":"0"},"COLUMN_SEPARATOR":{"default":" - ","type":"LINK_SEPARATOR","value":" - "},"LINK":{"default":"","type":"LINK","value":"session_sub_type:label"},"SERVICE":{"default":"com/Select.netuno","type":"STRING","value":"com/Select.netuno"},"ONLY_ACTIVES":{"default":"false","type":"BOOLEAN","value":"false"}}	
19	71fb9811-b112-4b87-95bc-73df053b23ce	4	legal_name	Legal Name		1	4	text	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{"MASK_REVERSE":{"default":"false","type":"BOOLEAN","value":"false"},"MASK_SELECTONFOCUS":{"default":"false","type":"BOOLEAN","value":"false"},"MASK":{"default":"","type":"STRING","value":""}}	
68	fca37a03-c3fb-4baf-9a95-aea916278509	4	phone	phone		1	9	text	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{"MASK_REVERSE":{"default":"false","type":"BOOLEAN","value":"false"},"MASK_SELECTONFOCUS":{"default":"false","type":"BOOLEAN","value":"false"},"MASK":{"default":"","type":"STRING","value":""}}	
70	0a63d01a-8485-407e-9d0e-3565b1096127	13	recovery_key	Chave de Recuperação	\N	1	4	text	0	0	0	0	0	0	0	0	f	f	f	t	t	t	t	t	0	0	0	0	0	0	{"MASK_REVERSE":{"default":"false","type":"BOOLEAN","value":"false"},"MASK_SELECTONFOCUS":{"default":"false","type":"BOOLEAN","value":"false"},"MASK":{"default":"","type":"STRING","value":""}}	
71	32599868-8d6a-416b-aba5-d0158a30e381	13	recovery_limit	Limite de Recuperação	\N	1	5	datetime	0	0	0	0	0	0	0	0	f	f	f	t	t	t	t	t	0	0	0	0	0	0	{"DEFAULT_CURRENT":{"default":"false","type":"BOOLEAN","value":"false"}}	
72	110001e1-7975-414b-be05-c42b7d2a0a5f	13	client_user_id	Client User		1	6	user	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{"ALLOW_USER_LOGGED":{"default":"false","type":"BOOLEAN","value":"false"},"GROUPS":{"default":"","type":"STRING","value":""},"GROUPS_MODE":{"default":"all|exclude|only","type":"CHOICE","value":"all"},"USERS_MODE":{"default":"all|exclude|only","type":"CHOICE","value":"all"},"USERS":{"default":"","type":"STRING","value":""}}	
74	95c3ac89-f789-4e33-9ae9-a7047ef87f67	2	client_user_id	Client User	\N	1	6	user	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{"ALLOW_USER_LOGGED":{"default":"false","type":"BOOLEAN","value":"false"},"GROUPS":{"default":"","type":"STRING","value":""},"GROUPS_MODE":{"default":"all|exclude|only","type":"CHOICE","value":"all"},"USERS_MODE":{"default":"all|exclude|only","type":"CHOICE","value":"all"},"USERS":{"default":"","type":"STRING","value":""}}	
75	d550a1ab-62f1-4c6b-a23a-7fd4043c08b1	3	client_user_id	Client User	\N	1	6	user	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{"ALLOW_USER_LOGGED":{"default":"false","type":"BOOLEAN","value":"false"},"GROUPS":{"default":"","type":"STRING","value":""},"GROUPS_MODE":{"default":"all|exclude|only","type":"CHOICE","value":"all"},"USERS_MODE":{"default":"all|exclude|only","type":"CHOICE","value":"all"},"USERS":{"default":"","type":"STRING","value":""}}	
76	0f806daf-2812-4c65-a8d6-031c1518c3f6	4	client_user_id	Client User	\N	1	6	user	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{"ALLOW_USER_LOGGED":{"default":"false","type":"BOOLEAN","value":"false"},"GROUPS":{"default":"","type":"STRING","value":""},"GROUPS_MODE":{"default":"all|exclude|only","type":"CHOICE","value":"all"},"USERS_MODE":{"default":"all|exclude|only","type":"CHOICE","value":"all"},"USERS":{"default":"","type":"STRING","value":""}}	
66	5fcb4efc-1098-49cd-845a-d1cf509dc67b	4	website	website		1	7	text	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{"MASK_REVERSE":{"default":"false","type":"BOOLEAN","value":"false"},"MASK_SELECTONFOCUS":{"default":"false","type":"BOOLEAN","value":"false"},"MASK":{"default":"","type":"STRING","value":""}}	
67	a3ce736e-dbe3-408d-a44a-b135ced21480	4	email	email		1	8	text	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{"MASK_REVERSE":{"default":"false","type":"BOOLEAN","value":"false"},"MASK_SELECTONFOCUS":{"default":"false","type":"BOOLEAN","value":"false"},"MASK":{"default":"","type":"STRING","value":""}}	
77	10262a3a-72ec-492d-ab84-c6d60e3a7399	5	client_user_id	Client User	\N	1	6	user	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{"ALLOW_USER_LOGGED":{"default":"false","type":"BOOLEAN","value":"false"},"GROUPS":{"default":"","type":"STRING","value":""},"GROUPS_MODE":{"default":"all|exclude|only","type":"CHOICE","value":"all"},"USERS_MODE":{"default":"all|exclude|only","type":"CHOICE","value":"all"},"USERS":{"default":"","type":"STRING","value":""}}	
63	d6e7b689-5495-4013-b916-a6e2d352224b	6	sub_type_id	Sub Type		1	8	select	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{"MAX_COLUMN_LENGTH":{"default":"0","type":"INTEGER","value":"0"},"COLUMN_SEPARATOR":{"default":" - ","type":"LINK_SEPARATOR","value":" - "},"LINK":{"default":"","type":"LINK","value":"session_sub_type:label"},"SERVICE":{"default":"com/Select.netuno","type":"STRING","value":"com/Select.netuno"},"ONLY_ACTIVES":{"default":"false","type":"BOOLEAN","value":"true"}}	
73	15d78d29-e712-4fa6-95cf-e91c008aff40	1	client_user_id	Client User	\N	1	9	user	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{"ALLOW_USER_LOGGED":{"default":"false","type":"BOOLEAN","value":"false"},"GROUPS":{"default":"","type":"STRING","value":""},"GROUPS_MODE":{"default":"all|exclude|only","type":"CHOICE","value":"all"},"USERS_MODE":{"default":"all|exclude|only","type":"CHOICE","value":"all"},"USERS":{"default":"","type":"STRING","value":""}}	
69	caa49851-950e-4005-80c1-d916dd5a16e8	5	company_id	company		1	12	select	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{"MAX_COLUMN_LENGTH":{"default":"0","type":"INTEGER","value":"0"},"COLUMN_SEPARATOR":{"default":" - ","type":"LINK_SEPARATOR","value":" - "},"LINK":{"default":"","type":"LINK","value":"company:name"},"SERVICE":{"default":"com/Select.netuno","type":"STRING","value":"com/Select.netuno"},"ONLY_ACTIVES":{"default":"false","type":"BOOLEAN","value":"false"}}	
79	fa44d5e6-616f-47ad-86bc-67e0199661fb	12	client_user_id	Client User	\N	1	6	user	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{"ALLOW_USER_LOGGED":{"default":"false","type":"BOOLEAN","value":"false"},"GROUPS":{"default":"","type":"STRING","value":""},"GROUPS_MODE":{"default":"all|exclude|only","type":"CHOICE","value":"all"},"USERS_MODE":{"default":"all|exclude|only","type":"CHOICE","value":"all"},"USERS":{"default":"","type":"STRING","value":""}}	
80	5dbc428e-e59b-48a2-835b-7d88ee27837b	6	client_user_id	Client User	\N	1	6	user	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{"ALLOW_USER_LOGGED":{"default":"false","type":"BOOLEAN","value":"false"},"GROUPS":{"default":"","type":"STRING","value":""},"GROUPS_MODE":{"default":"all|exclude|only","type":"CHOICE","value":"all"},"USERS_MODE":{"default":"all|exclude|only","type":"CHOICE","value":"all"},"USERS":{"default":"","type":"STRING","value":""}}	
81	62dc2e43-bc6c-4c3e-bc11-2fd2fc2d1f7a	8	client_user_id	Client User	\N	1	6	user	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{"ALLOW_USER_LOGGED":{"default":"false","type":"BOOLEAN","value":"false"},"GROUPS":{"default":"","type":"STRING","value":""},"GROUPS_MODE":{"default":"all|exclude|only","type":"CHOICE","value":"all"},"USERS_MODE":{"default":"all|exclude|only","type":"CHOICE","value":"all"},"USERS":{"default":"","type":"STRING","value":""}}	
82	6ffb032a-0697-471e-8b62-78213fd70d3a	7	client_user_id	Client User	\N	1	6	user	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{"ALLOW_USER_LOGGED":{"default":"false","type":"BOOLEAN","value":"false"},"GROUPS":{"default":"","type":"STRING","value":""},"GROUPS_MODE":{"default":"all|exclude|only","type":"CHOICE","value":"all"},"USERS_MODE":{"default":"all|exclude|only","type":"CHOICE","value":"all"},"USERS":{"default":"","type":"STRING","value":""}}	
83	6c7d0487-2b50-4868-a3f2-a5ddf9ea9ac0	10	client_user_id	Client User	\N	1	6	user	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{"ALLOW_USER_LOGGED":{"default":"false","type":"BOOLEAN","value":"false"},"GROUPS":{"default":"","type":"STRING","value":""},"GROUPS_MODE":{"default":"all|exclude|only","type":"CHOICE","value":"all"},"USERS_MODE":{"default":"all|exclude|only","type":"CHOICE","value":"all"},"USERS":{"default":"","type":"STRING","value":""}}	
84	9ee7ee02-cd2b-4b65-a785-f5407903f107	11	client_user_id	Client User	\N	1	6	user	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{"ALLOW_USER_LOGGED":{"default":"false","type":"BOOLEAN","value":"false"},"GROUPS":{"default":"","type":"STRING","value":""},"GROUPS_MODE":{"default":"all|exclude|only","type":"CHOICE","value":"all"},"USERS_MODE":{"default":"all|exclude|only","type":"CHOICE","value":"all"},"USERS":{"default":"","type":"STRING","value":""}}	
85	562fd546-70cc-4d06-942c-35057cbd6c76	11	description	Description		1	7	textarea	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{}	
86	03601835-36a0-4eca-b85d-551539eacca4	10	description	Description	\N	1	7	textarea	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{}	
92	4130ef12-e25d-406e-b6e4-45f654dd22e2	13	email	Email	\N	1	3	email	0	0	0	0	0	0	0	0	f	t	t	t	t	t	t	t	0	0	0	0	0	0	{}	
93	2cd1bd38-e25e-4dad-b4e8-ac169a98f785	13	user	User	\N	1	2	user	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{"ALLOW_USER_LOGGED":{"default":"false","type":"BOOLEAN","value":"false"},"GROUPS":{"default":"","type":"STRING","value":""},"GROUPS_MODE":{"default":"all|exclude|only","type":"CHOICE","value":"all"},"USERS_MODE":{"default":"all|exclude|only","type":"CHOICE","value":"all"},"USERS":{"default":"","type":"STRING","value":""}}	
90	b5f2ac23-5f26-43fb-8a16-16c5f99a22e1	1	legal_name	Legal Name	\N	1	4	text	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{"MASK_REVERSE":{"default":"false","type":"BOOLEAN","value":"false"},"MASK_SELECTONFOCUS":{"default":"false","type":"BOOLEAN","value":"false"},"MASK":{"default":"","type":"STRING","value":""}}	
88	68b2947e-a4a2-40fa-9957-99673cd5051a	1	vat	VAT number	\N	1	6	text	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{"MASK_REVERSE":{"default":"false","type":"BOOLEAN","value":"false"},"MASK_SELECTONFOCUS":{"default":"false","type":"BOOLEAN","value":"false"},"MASK":{"default":"","type":"STRING","value":""}}	
89	bd8d9cb6-9a73-4daa-9170-6ef4b624bdde	1	website	website	\N	1	8	text	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{"MASK_REVERSE":{"default":"false","type":"BOOLEAN","value":"false"},"MASK_SELECTONFOCUS":{"default":"false","type":"BOOLEAN","value":"false"},"MASK":{"default":"","type":"STRING","value":""}}	
87	d60834d9-10e0-4e2e-9cc3-1a82af42bc76	1	is_company	Is Company		1	18	checkbox	0	0	0	0	0	0	0	0	f	f	t	t	t	t	t	t	0	0	0	0	0	0	{"DEFAULT":{"default":"true","type":"BOOLEAN","value":"true"}}	
91	eddccc1f-efaa-490f-b4fe-922ebd3d0680	13	name	Name	\N	1	1	text	0	0	0	0	0	0	0	0	t	f	t	t	t	t	t	t	0	0	0	0	0	0	{"MASK_REVERSE":{"default":"false","type":"BOOLEAN","value":"false"},"MASK_SELECTONFOCUS":{"default":"false","type":"BOOLEAN","value":"false"},"MASK":{"default":"","type":"STRING","value":""}}	
\.


--
-- Data for Name: netuno_group; Type: TABLE DATA; Schema: public; Owner: bodylanguage
--

COPY public.netuno_group (id, uid, name, netuno_group, active, report, code, mail, config, extra) FROM stdin;
1	ece18097-2170-4254-bbbe-f520e69c8717	Developer	-2	t					
2	747b0408-2cf6-4c43-942b-2f5495fbc536	Administrator	-1	t					
3	5072453a-2469-4ed5-8569-731df7d35236	Cliente	0	t		client			
\.


--
-- Data for Name: netuno_group_rule; Type: TABLE DATA; Schema: public; Owner: bodylanguage
--

COPY public.netuno_group_rule (id, uid, group_id, table_id, active, rule_read, rule_write, rule_delete) FROM stdin;
\.


--
-- Data for Name: netuno_log; Type: TABLE DATA; Schema: public; Owner: bodylanguage
--

COPY public.netuno_log (id, uid, user_id, group_id, moment, action, table_id, item_id, data) FROM stdin;
1	d50891f2-5001-4f36-a8cb-a04fef0e6108	3	3	2022-02-25 22:48:15.174852	1	1	1	{"recovery_key":"","recovery_limit":"","client_user_id":"3","name":"Carlos Vitorino","email":"carlos.duartv@gmail.com"}
2	a5d01602-df1d-4837-b4a2-83450bf49833	0	0	2022-02-26 01:47:09.577111	1	1	2	{"recovery_key":"","recovery_limit":"","default_price":"31.0","name":"teste","photo":"","phone_number":"966466572","user":"0","email":"","session_duration":"50"}
3	92b4148d-b511-4f2d-9139-d16738286b97	1	1	2022-02-26 01:51:49.844135	3	1	2	{"code":"","gender":"","default_price":"31.0","vat":"","photo":"","weight":"","dislikes":"","session_duration":"50","recovery_key":"","recovery_limit":"","name":"teste","phone_number":"966466572","legal_name":"","injuries_conditions":"","user":"0","age":"","email":"","goals":"","height":"","likes":""}
4	77785e32-b338-4e52-8399-4375a798dc99	0	0	2022-02-26 01:51:56.331748	1	1	5	{"recovery_key":"","recovery_limit":"","default_price":"25.0","name":"teste","photo":"","phone_number":"9645439534","user":"0","email":"","session_duration":"131"}
5	0c0703e5-cf48-4681-9108-07832fa84081	0	0	2022-02-26 01:51:56.34457	1	2	1	{"gender":"other","weight":"123.0","dislikes":"ewewew","injuries_conditions":"ewew","age":"35","goals":"werw","height":"0.32","likes":"wqeeqw"}
6	d5f15efa-95a7-4bcb-8f51-6e21dd7a5bd4	1	1	2022-02-26 01:53:10.421797	3	1	5	{"code":"","gender":"","default_price":"25.0","vat":"","photo":"","weight":"","dislikes":"","session_duration":"131","recovery_key":"","recovery_limit":"","name":"teste","phone_number":"9645439534","legal_name":"","injuries_conditions":"","user":"0","age":"","email":"","goals":"","height":"","likes":""}
7	ff03fba3-a370-4c40-b4ba-1067a2a313a5	1	1	2022-02-26 01:53:18.99612	3	2	1	{"code":"","gender":"other","default_price":"","vat":"","photo":"","weight":"123.0","dislikes":"ewewew","session_duration":"","recovery_key":"","recovery_limit":"","name":"","phone_number":"","legal_name":"","injuries_conditions":"ewew","user":"0","age":"35","email":"","goals":"werw","height":"0.32","likes":"wqeeqw"}
8	4c6bf1ad-f5a4-4a83-a6a3-c26f23097736	0	0	2022-02-26 01:53:22.410245	1	1	6	{"recovery_key":"","recovery_limit":"","default_price":"25.0","name":"teste","photo":"","phone_number":"9645439534","user":"0","email":"teste@teste.pt","session_duration":"131"}
9	95bf5fdc-cc3f-4940-aadd-538497074d22	0	0	2022-02-26 01:53:22.417675	1	2	2	{"gender":"other","weight":"123.0","dislikes":"ewewew","injuries_conditions":"ewew","age":"35","goals":"werw","height":"0.32","likes":"wqeeqw"}
10	0989e7f6-5dfe-4b70-ac10-9448ddcdbb33	1	1	2022-02-26 01:55:29.598386	3	1	1	{"code":"","gender":"","default_price":"23.22","vat":"","photo":"","weight":"","dislikes":"","session_duration":"12","recovery_key":"","recovery_limit":"","name":"Carlos Vitorino","phone_number":"","legal_name":"","injuries_conditions":"","user":"3","age":"","email":"carlos.duartv@gmail.com","goals":"","height":"","likes":""}
11	0d974ade-0965-40f5-926f-728e747f199a	1	1	2022-02-26 01:57:56.318637	3	1	6	{"code":"","gender":"","default_price":"25.0","vat":"","photo":"","weight":"","dislikes":"","client_id":"0","session_duration":"131","recovery_key":"","recovery_limit":"","name":"teste","phone_number":"9645439534","legal_name":"","injuries_conditions":"","user":"0","age":"","email":"teste@teste.pt","goals":"","height":"","likes":""}
12	1809022c-971b-4d28-8584-b6dcc036ccf2	1	1	2022-02-26 01:58:02.575855	3	2	2	{"code":"","gender":"other","default_price":"","vat":"","photo":"","weight":"123.0","dislikes":"ewewew","client_id":"0","session_duration":"","recovery_key":"","recovery_limit":"","name":"","phone_number":"","legal_name":"","injuries_conditions":"ewew","user":"0","age":"35","email":"","goals":"werw","height":"0.32","likes":"wqeeqw"}
13	30d8eb44-4f7a-4564-a83b-37aa7c561c0b	0	0	2022-02-26 01:58:10.453939	1	1	8	{"recovery_key":"","recovery_limit":"","default_price":"25.5","name":"teste","photo":"","phone_number":"9645439534","user":"0","email":"teste@teste.pt","session_duration":"131"}
14	f42633eb-bb6a-40bb-b897-e6f5a1501f72	0	0	2022-02-26 01:58:10.474457	1	2	3	{"gender":"other","weight":"123.0","dislikes":"ewewew","injuries_conditions":"ewew","age":"35","client_id":"8","goals":"werw","height":"0.32","likes":"wqeeqw"}
15	5eafa07b-e55e-4015-b59d-8476ee94f449	3	3	2022-02-26 16:12:25.161317	2	1	8	{"recovery_key":"","recovery_limit":"","default_price":"25.5","name":"teste baltas","photo":"","phone_number":"9645439534","user":"0","email":"teste@teste.pt","session_duration":"131"}
16	8faa637b-1ef9-4c62-bc17-b0ed4e91b469	3	3	2022-02-26 16:13:19.042885	2	1	8	{"recovery_key":"","recovery_limit":"","default_price":"25.5","name":"teste baltas","photo":"","phone_number":"9645439534","user":"0","email":"teste@teste.pt","session_duration":"131"}
17	5b37901f-4ab3-4357-aa6a-b85995bb2d9a	3	3	2022-02-26 16:13:19.063878	2	2	3	{"gender":"other","weight":"123.0","dislikes":"ewewew","injuries_conditions":"ewew","age":"35","client_id":"8","goals":"werw","height":"-0.01","likes":"wqeeqw"}
18	a4dbe8ad-1387-494e-8d74-4e9cb41eccfa	3	3	2022-02-26 16:33:49.142909	1	1	12	{"recovery_key":"","recovery_limit":"","default_price":"30.0","name":"Tiina","photo":"","phone_number":"9543545454","user":"0","email":"tiina.rinatamaeki@gmail.com","session_duration":"59"}
19	a96cb38f-925a-4080-8db2-54490511e5d2	3	3	2022-02-26 16:33:49.169406	1	2	4	{"gender":"female","weight":"123.0","dislikes":"dsadsada","injuries_conditions":"dsadsa","age":"30","client_id":"12","goals":"2313231","height":"0.32","likes":"dasdadas"}
20	2a0f3a07-147f-435c-8ae7-733ef7d06709	3	3	2022-02-26 16:34:49.060223	2	1	12	{"recovery_key":"","recovery_limit":"","default_price":"30.0","name":"Tiina R.","photo":"","phone_number":"9543545454","user":"0","email":"tiina.rinatamaeki@gmail.com","session_duration":"59"}
21	da035e09-e815-4926-a692-e050971e3e11	3	3	2022-02-26 16:34:49.077216	2	2	4	{"gender":"female","weight":"123.0","dislikes":"dsadsada","injuries_conditions":"dsadsa","age":"30","client_id":"12","goals":"2313231","height":"-0.01","likes":"dasdadas"}
22	a97a61dc-c8bc-4026-865c-501fe6508916	1	1	2022-02-26 17:00:56.55056	1	11	1	{"code":"Fitness","name":"fitness"}
23	96c39053-58cc-4139-b0da-66fc3f597cda	1	1	2022-02-26 17:01:05.472743	1	11	2	{"code":"German","name":"german"}
24	d9b8a9be-dda7-498b-83d3-f71fb61967a9	3	3	2022-02-26 17:37:20.700834	2	1	8	{"sessions_per_month":"0","default_session_type_id":"0","recovery_key":"","recovery_limit":"","default_price":"25.5","name":"teste baltas","photo":"","phone_number":"9645439534","user":"0","email":"teste@teste.pt","session_duration":"131","start_date":"2022-02-26"}
25	c830260c-cef5-4af4-a48c-ee7ab9f30bbe	3	3	2022-02-26 17:37:20.715205	2	2	3	{"gender":"other","weight":"123.0","dislikes":"ewewew","injuries_conditions":"ewew","age":"35","client_id":"8","goals":"werw","height":"-0.01","likes":"wqeeqw"}
26	972ffa6b-e972-44c6-aea1-c0ed262c9e13	3	3	2022-02-26 17:48:59.980044	2	1	8	{"sessions_per_month":"0","default_session_type_id":"0","recovery_key":"","recovery_limit":"","default_price":"25.5","name":"teste baltas","photo":"","phone_number":"9645439534","user":"0","email":"teste@teste.pt","session_duration":"131","start_date":"2022-02-26"}
27	c30cd271-a0ed-4540-af91-29a30c5dc953	3	3	2022-02-26 18:05:26.300677	2	1	8	{"sessions_per_month":"0","default_session_type_id":"0","recovery_key":"","recovery_limit":"","default_price":"25.5","name":"teste baltas","photo":"","phone_number":"9645439534","user":"0","email":"teste@teste.pt","session_duration":"131","start_date":"2022-02-26"}
28	7eb4e9a2-7898-4690-bc6b-b779d8a524e0	3	3	2022-02-26 18:05:59.265684	2	1	8	{"sessions_per_month":"0","default_session_type_id":"0","recovery_key":"","recovery_limit":"","default_price":"25.5","name":"teste baltas","photo":"","phone_number":"9645439534","user":"0","email":"teste@teste.pt","session_duration":"131","start_date":"2022-02-26"}
29	4365b342-62d2-495a-b9f2-5ada55acbd15	3	3	2022-02-26 18:06:05.830982	2	1	8	{"sessions_per_month":"0","default_session_type_id":"0","recovery_key":"","recovery_limit":"","default_price":"25.5","name":"teste baltas","photo":"","phone_number":"9645439534","user":"0","email":"teste@teste.pt","session_duration":"131","start_date":"2022-02-26"}
30	6daf002d-1d06-4821-9e5c-642a94230e5a	3	3	2022-02-26 18:07:21.788633	2	1	8	{"sessions_per_month":"0","default_session_type_id":"0","recovery_key":"","recovery_limit":"","default_price":"25.5","name":"teste baltas","photo":"","phone_number":"9645439534","user":"0","email":"teste@teste.pt","session_duration":"131","start_date":"2022-02-26"}
31	241c01a1-02d7-4917-aef4-7aa9c0ffcb53	3	3	2022-02-26 18:07:21.803733	2	2	3	{"gender":"male","weight":"1.31","dislikes":"wewqeqw","injuries_conditions":"asdf","age":"40","client_id":"8","goals":"wqeweqw","height":"0.11","likes":"ewqewqeqw"}
32	82e8889e-5d25-48b5-a3e7-411891901d08	3	3	2022-02-26 18:13:39.924602	2	1	8	{"sessions_per_month":"0","default_session_type_id":"0","recovery_key":"","recovery_limit":"","default_price":"25.5","name":"teste baltas","photo":"","phone_number":"9645439534","user":"0","email":"teste@teste.pt","session_duration":"131","start_date":"2022-02-26"}
33	9110ed87-5f24-4009-a0b4-c162b6bd48e7	3	3	2022-02-26 18:13:39.936583	2	2	3	{"gender":"male","weight":"-0.01","dislikes":"wewqeqw","injuries_conditions":"asdf","age":"40","client_id":"8","goals":"wqeweqw","height":"-0.01","likes":"ewqewqeqw"}
34	7bf5d73d-4fc2-49e5-9112-40c83fc5263e	3	3	2022-02-26 18:18:10.217265	2	1	8	{"sessions_per_month":"0","default_session_type_id":"2","recovery_key":"","recovery_limit":"","default_price":"25.5","name":"teste baltas","photo":"","phone_number":"9645439534","user":"0","email":"teste@teste.pt","session_duration":"131","start_date":"2022-02-26"}
35	c8b7b630-8018-4b29-84d0-bc2898c18ae4	3	3	2022-02-26 18:18:10.232949	2	2	3	{"gender":"male","weight":"-0.01","dislikes":"wewqeqw","injuries_conditions":"asdf","age":"40","client_id":"8","goals":"wqeweqw","height":"-0.01","likes":"ewqewqeqw"}
36	106340a1-e8b4-48d3-ae4f-f037941e1817	3	3	2022-02-26 18:18:54.683095	2	1	8	{"sessions_per_month":"4","default_session_type_id":"2","recovery_key":"","recovery_limit":"","default_price":"25.5","name":"teste baltas","photo":"","phone_number":"9645439534","user":"0","email":"teste@teste.pt","session_duration":"131","start_date":"2022-02-26"}
37	148267dc-cd61-42d9-a3f1-6538fd3734b9	3	3	2022-02-26 18:18:54.764964	2	2	3	{"gender":"male","weight":"-0.01","dislikes":"wewqeqw","injuries_conditions":"asdf","age":"40","client_id":"8","goals":"wqeweqw","height":"-0.01","likes":"ewqewqeqw"}
38	15d0c9de-f672-438c-9a45-115e5af4b775	3	3	2022-02-26 18:21:20.698815	2	1	8	{"sessions_per_month":"1","default_session_type_id":"1","recovery_key":"","recovery_limit":"","default_price":"25.5","name":"teste baltas","photo":"","phone_number":"9645439534","user":"0","email":"teste@teste.pt","session_duration":"131","start_date":"2022-02-26"}
39	80b34d80-f0af-455d-a947-f386ed67a04c	3	3	2022-02-26 18:21:20.716108	2	2	3	{"gender":"male","weight":"-0.01","dislikes":"wewqeqw","injuries_conditions":"asdf","age":"40","client_id":"8","goals":"wqeweqw","height":"-0.01","likes":"ewqewqeqw"}
40	df34fcc7-1b42-40f1-9a39-9df4d202c900	3	3	2022-02-26 18:24:03.62012	2	1	8	{"sessions_per_month":"1","default_session_type_id":"1","recovery_key":"","recovery_limit":"","default_price":"25.5","name":"teste baltas","photo":"","phone_number":"9645439534","user":"0","email":"teste@teste.pt","session_duration":"131","start_date":"2022-02-26"}
41	d916dea9-9541-4dbf-acf5-f0318a7623f1	3	3	2022-02-26 18:24:03.886925	2	2	3	{"gender":"male","weight":"-0.01","dislikes":"wewqeqw","injuries_conditions":"asdf","age":"40","client_id":"8","goals":"wqeweqw","height":"-0.01","likes":"ewqewqeqw"}
42	8f08a8a5-8d3e-4c20-b383-a67a002598f4	3	3	2022-02-26 18:24:38.953914	2	1	8	{"sessions_per_month":"1","default_session_type_id":"1","recovery_key":"","recovery_limit":"","default_price":"25.5","name":"teste baltas","photo":"","phone_number":"9645439534","user":"0","email":"teste@teste.pt","session_duration":"131","start_date":"2022-02-02"}
43	ddb5a6ab-c8fc-49a1-ab68-af6249c8c891	3	3	2022-02-26 18:24:38.998469	2	2	3	{"gender":"male","weight":"-0.01","dislikes":"wewqeqw","injuries_conditions":"asdf","age":"40","client_id":"8","goals":"wqeweqw","height":"-0.01","likes":"ewqewqeqw"}
44	00564b07-c749-46b9-befe-3b0250db1076	3	3	2022-02-26 18:25:21.910917	2	1	8	{"sessions_per_month":"1","default_session_type_id":"1","recovery_key":"","recovery_limit":"","default_price":"25.5","name":"teste baltas","photo":"","phone_number":"9645439534","user":"0","email":"teste@teste.pt","session_duration":"131","start_date":"2022-02-02"}
45	55bf0d41-18e6-408d-b9bf-c7a776cbaaae	3	3	2022-02-26 18:25:21.938671	2	2	3	{"gender":"male","weight":"0.4","dislikes":"wewqeqw","injuries_conditions":"asdf","age":"40","client_id":"8","goals":"wqeweqw","height":"1.11","likes":"ewqewqeqw"}
46	f5f281dc-67e1-42b7-84f1-6b1191a0b194	3	3	2022-02-26 18:26:15.799712	2	1	8	{"sessions_per_month":"1","default_session_type_id":"1","recovery_key":"","recovery_limit":"","default_price":"25.5","name":"teste baltas","photo":"","phone_number":"9645439534","user":"0","email":"teste@teste.pt","session_duration":"-1","start_date":"2022-02-02"}
47	eaf663e1-650c-43f2-bdba-a66b5f6ee6ee	3	3	2022-02-26 18:26:15.822807	2	2	3	{"gender":"male","weight":"-0.01","dislikes":"wewqeqw","injuries_conditions":"asdf","age":"-1","client_id":"8","goals":"wqeweqw","height":"-0.01","likes":"ewqewqeqw"}
48	7b37a65d-a6aa-4ab3-9288-b83b17958faf	3	3	2022-02-28 15:03:28.639064	1	1	14	{"sessions_per_month":"","default_session_type_id":"0","recovery_key":"","recovery_limit":"","default_price":"","name":"Carlos Vitorino","photo":"","phone_number":"966466572","user":"0","email":"carlos.vitorino@sitana.pt","session_duration":"","start_date":""}
49	636c15c4-db38-4a2d-8c36-ff5b4da345c1	3	3	2022-02-28 15:03:28.683843	1	2	5	{"gender":"male","weight":"","dislikes":"","injuries_conditions":"","age":"","client_id":"14","goals":"","height":"","likes":""}
50	92bea38d-754e-4812-bdca-d4ed73f6c024	3	3	2022-02-28 15:04:06.138826	2	1	14	{"sessions_per_month":"0","default_session_type_id":"0","recovery_key":"","recovery_limit":"","default_price":"30.0","name":"Carlos Vitorino","photo":"","phone_number":"966466572","user":"0","email":"carlos.vitorino@sitana.pt","session_duration":"45","start_date":"2022-03-01"}
51	2d843930-644c-473d-9557-d9e87ae57f18	3	3	2022-02-28 15:04:06.166512	2	2	5	{"gender":"male","weight":"0","dislikes":"","injuries_conditions":"","age":"0","client_id":"14","goals":"Get fit","height":"0","likes":""}
52	572c8055-b79e-4e87-a816-2b5775996786	3	3	2022-02-28 15:04:24.16095	2	1	14	{"sessions_per_month":"0","default_session_type_id":"0","recovery_key":"","recovery_limit":"","default_price":"30.0","name":"Carlos Vitorino","photo":"","phone_number":"966466572","user":"0","email":"carlos.vitorino@sitana.pt","session_duration":"45","start_date":"2022-03-01"}
53	f099d3ab-a72f-4e3b-9632-dd080d8a7722	3	3	2022-02-28 15:04:24.196565	2	2	5	{"gender":"male","weight":"0","dislikes":"","injuries_conditions":"","age":"0","client_id":"14","goals":"Get fit","height":"0","likes":""}
54	f928c581-0ec6-4455-b727-6eab6bed9786	3	3	2022-02-28 15:46:12.550338	2	1	12	{"sessions_per_month":"0","default_session_type_id":"0","recovery_key":"","recovery_limit":"","default_price":"30.0","name":"Tiina R.","photo":"","phone_number":"9543545454","user":"0","email":"tiina.rinatamaeki@gmail.com","session_duration":"59","start_date":"2022-02-26"}
55	d5dba7a2-9ef0-401a-a22f-61b98d0f872d	3	3	2022-02-28 15:46:51.239972	2	1	12	{"sessions_per_month":"0","default_session_type_id":"0","recovery_key":"","recovery_limit":"","default_price":"30.0","name":"Tiina R.","photo":"","phone_number":"9543545454","user":"0","email":"tiina.rinatamaeki@gmail.com","session_duration":"59","start_date":"2022-02-26"}
135	c2e2aa23-4774-4854-9cb6-70dfd932a3b4	1	1	2022-03-02 00:53:53.027653	1	6	39	{"date":"2022-02-01","duration":"30","price":"0.3","type_id":"1","client_id":"8"}
56	c4192463-9ae0-4ae4-b5f4-84aec4229fce	3	3	2022-02-28 15:46:55.968274	2	1	12	{"sessions_per_month":"0","default_session_type_id":"0","recovery_key":"","recovery_limit":"","default_price":"30.0","name":"Tiina R.","photo":"","phone_number":"9543545454","user":"0","email":"tiina.rinatamaeki@gmail.com","session_duration":"59","start_date":"2022-02-26"}
57	63935224-0004-4d42-9115-4fc830112636	3	3	2022-02-28 15:47:02.854901	2	1	12	{"sessions_per_month":"0","default_session_type_id":"0","recovery_key":"","recovery_limit":"","default_price":"30.0","name":"Tiina R.","photo":"","phone_number":"9543545454","user":"0","email":"tiina.rinatamaeki@gmail.com","session_duration":"59","start_date":"2022-02-26"}
58	a36f4635-454b-4f84-a2e2-bb0c7670723c	3	3	2022-02-28 15:47:57.100369	2	1	12	{"sessions_per_month":"0","default_session_type_id":"0","recovery_key":"","recovery_limit":"","default_price":"30.0","name":"Tiina R.","photo":"","phone_number":"9543545454","user":"0","email":"tiina.rinatamaeki@gmail.com","session_duration":"59","start_date":"2022-02-26"}
59	9c5853a9-67ab-4886-9b14-b0fe2ff35833	3	3	2022-02-28 15:48:00.130458	2	1	12	{"sessions_per_month":"0","default_session_type_id":"0","recovery_key":"","recovery_limit":"","default_price":"30.0","name":"Tiina R.","photo":"","phone_number":"9543545454","user":"0","email":"tiina.rinatamaeki@gmail.com","session_duration":"59","start_date":"2022-02-26"}
60	fb378d5e-098a-468d-9a6d-4bd4d848bf63	3	3	2022-02-28 15:48:46.623019	2	1	12	{"sessions_per_month":"0","default_session_type_id":"0","recovery_key":"","recovery_limit":"","default_price":"30.0","name":"Tiina R.","photo":"","phone_number":"9543545454","user":"0","email":"tiina.rinatamaeki@gmail.com","session_duration":"59","start_date":"2022-02-26"}
61	aea61b65-b5de-4444-9927-7c7383fafeeb	3	3	2022-02-28 15:48:48.08076	2	1	12	{"sessions_per_month":"0","default_session_type_id":"0","recovery_key":"","recovery_limit":"","default_price":"30.0","name":"Tiina R.","photo":"","phone_number":"9543545454","user":"0","email":"tiina.rinatamaeki@gmail.com","session_duration":"59","start_date":"2022-02-26"}
62	cfdaad86-e8a4-4906-8855-2cd8545b4c00	3	3	2022-02-28 15:49:03.199664	2	1	12	{"sessions_per_month":"0","default_session_type_id":"0","recovery_key":"","recovery_limit":"","default_price":"30.0","name":"Tiina R.","photo":"","phone_number":"9543545454","user":"0","email":"tiina.rinatamaeki@gmail.com","session_duration":"59","start_date":"2022-02-26"}
63	b39360ba-43bb-4e67-91e2-33fb0e356dc2	3	3	2022-02-28 15:51:15.019827	2	1	12	{"sessions_per_month":"0","default_session_type_id":"0","recovery_key":"","recovery_limit":"","default_price":"30.0","name":"Tiina R.","photo":"","phone_number":"9543545454","user":"0","email":"tiina.rinatamaeki@gmail.com","session_duration":"59","start_date":"2022-02-26"}
64	f026f7eb-31d3-49d1-9377-6c76a2531078	3	3	2022-02-28 15:51:25.667718	2	1	12	{"sessions_per_month":"0","default_session_type_id":"0","recovery_key":"","recovery_limit":"","default_price":"30.0","name":"Tiina R.","photo":"","phone_number":"9543545454","user":"0","email":"tiina.rinatamaeki@gmail.com","session_duration":"59","start_date":"2022-02-26"}
65	1958bf98-4f0c-4c1b-a9fa-ab9711ba3bd1	3	3	2022-02-28 15:51:33.330916	2	1	12	{"sessions_per_month":"0","default_session_type_id":"0","recovery_key":"","recovery_limit":"","default_price":"30.0","name":"Tiina R.","photo":"","phone_number":"9543545454","user":"0","email":"tiina.rinatamaeki@gmail.com","session_duration":"59","start_date":"2022-02-26"}
66	102bc4d9-f437-43d2-9693-4adce8bff5aa	3	3	2022-02-28 19:06:47.69401	2	1	14	{"sessions_per_month":"0","default_session_type_id":"0","recovery_key":"","recovery_limit":"","default_price":"30.0","name":"Carlos Vitorino","photo":"","phone_number":"966466572","user":"0","email":"carlos.vitorino@sitana.pt","session_duration":"45","start_date":"2022-03-01"}
67	9bdf0815-af33-4a58-af43-5c8483593f68	3	3	2022-02-28 19:09:21.814617	2	1	14	{"sessions_per_month":"0","default_session_type_id":"2","recovery_key":"","recovery_limit":"","default_price":"30.0","name":"Carlos Vitorino","photo":"","phone_number":"966466572","user":"0","email":"carlos.vitorino@sitana.pt","session_duration":"45","start_date":"2022-03-01"}
68	225d2071-aecc-42f8-934d-ec82c8a755a7	3	3	2022-02-28 19:09:21.848224	2	2	5	{"gender":"male","weight":"0","dislikes":"","injuries_conditions":"","age":"0","client_id":"14","goals":"Get fit","height":"0","likes":""}
69	ffe8049e-8fa9-47f6-94b5-ddbe79c2e8b2	3	3	2022-02-28 19:09:45.009558	2	1	12	{"sessions_per_month":"0","default_session_type_id":"0","recovery_key":"","recovery_limit":"","default_price":"30.0","name":"Tiina R.","photo":"","phone_number":"9543545454","user":"0","email":"tiina.rinatamaeki@gmail.com","session_duration":"59","start_date":"2022-02-26"}
70	7df686c6-c26b-4f05-87be-7684fcd318e6	3	3	2022-02-28 19:09:50.721612	2	1	12	{"sessions_per_month":"0","default_session_type_id":"1","recovery_key":"","recovery_limit":"","default_price":"30.0","name":"Tiina R.","photo":"","phone_number":"9543545454","user":"0","email":"tiina.rinatamaeki@gmail.com","session_duration":"59","start_date":"2022-02-26"}
71	919eb109-bcba-493c-8578-e99d7430594d	3	3	2022-02-28 19:09:50.74561	2	2	4	{"gender":"female","weight":"1.23","dislikes":"dsadsada","injuries_conditions":"dsadsa","age":"30","client_id":"12","goals":"2313231","height":"-0.01","likes":"dasdadas"}
72	ac7e1c18-4dfc-4ece-850d-a6dc131b00b7	1	1	2022-02-28 22:07:41.459759	2	11	1	{"text":"Fitness","value":"fitness"}
73	4425fd10-d4a0-4aa5-90ee-494ca46b8a9a	1	1	2022-02-28 22:07:48.329158	2	11	2	{"text":"German","value":"german"}
74	b20f7f98-f9f5-4e8e-bc31-3867ad936f3b	3	3	2022-03-01 22:32:01.9046	1	6	1	{"date":"","duration":"-1","price":"25.5","type_id":"0","client_id":"8"}
75	d3544dbd-ff46-4f55-9aed-de67b2fa35f7	3	3	2022-03-01 22:32:44.704595	1	6	2	{"date":"","duration":"59","price":"0.3","type_id":"0","client_id":"12"}
76	c067c0cc-b8d1-45db-93fa-818ffdf7de14	3	3	2022-03-01 22:32:44.726368	1	6	3	{"date":"","duration":"45","price":"0.3","type_id":"0","client_id":"14"}
77	590d014e-b19f-436e-a2ac-d93617efbf8c	3	3	2022-03-01 22:34:37.150287	1	6	4	{"date":"","duration":"59","price":"0.3","type_id":"0","client_id":"12"}
78	fc818f8d-0094-429d-80bd-1aff2282a41a	3	3	2022-03-01 22:34:37.175688	1	6	5	{"date":"","duration":"45","price":"0.3","type_id":"0","client_id":"14"}
79	e0988ab0-0098-4d94-97b4-94bf66e2748c	3	3	2022-03-01 22:38:49.791573	1	6	6	{"date":"","duration":"-1","price":"25.5","type_id":"2","client_id":"8"}
80	033565a4-810f-4332-bad6-bae9d0c8488f	3	3	2022-03-01 22:38:49.818628	1	6	7	{"date":"","duration":"59","price":"0.3","type_id":"1","client_id":"12"}
81	d087c2b2-ab6a-4426-8a70-1cbc8f00fd13	3	3	2022-03-01 22:39:57.652044	1	6	8	{"date":"2022-03-01 00:00:00","duration":"-1","price":"25.5","type_id":"1","client_id":"8"}
82	4ad6541c-8c37-4aaf-bad0-19c81b5120fe	3	3	2022-03-01 22:48:11.136646	1	6	9	{"date":"2022-03-01 00:00:00","duration":"","price":"","type_id":"1","client_id":"0"}
83	e448ec78-8fa9-40d7-bf40-a01d4cdad2e5	3	3	2022-03-01 22:48:11.166177	3	6	6	{"date":"","code":"","gender":"","default_price":"","client_id":"8","session_duration":"","duration":"-1","recovery_key":"","recovery_limit":"","price":"25.5","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","type_id":"2","vat":"","photo":"","weight":"","dislikes":"","default_session_type_id":"0","name":"","phone_number":"","injuries_conditions":"","user":"0","age":""}
84	12c3a75c-2e66-4b03-94a1-3953a3e0089d	3	3	2022-03-01 22:48:11.179125	3	6	7	{"date":"","code":"","gender":"","default_price":"","client_id":"12","session_duration":"","duration":"59","recovery_key":"","recovery_limit":"","price":"0.3","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","type_id":"1","vat":"","photo":"","weight":"","dislikes":"","default_session_type_id":"0","name":"","phone_number":"","injuries_conditions":"","user":"0","age":""}
85	b4101ae1-d5d2-4d26-b84d-f00e07f48233	3	3	2022-03-01 22:48:11.192438	3	6	8	{"date":"2022-03-01 00:00:00","code":"","gender":"","default_price":"","client_id":"8","session_duration":"","duration":"-1","recovery_key":"","recovery_limit":"","price":"25.5","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","type_id":"1","vat":"","photo":"","weight":"","dislikes":"","default_session_type_id":"0","name":"","phone_number":"","injuries_conditions":"","user":"0","age":""}
136	e17ec107-6bbf-4079-b308-5ccf96dd6535	1	1	2022-03-02 00:55:02.97762	1	6	40	{"date":"2022-03-02","duration":"10","price":"0.3","type_id":"1","client_id":"12"}
183	412c5a57-2322-46e6-be79-b7462e3bbc91	1	1	2022-03-02 11:23:47.617373	1	6	46	{"date":"2022-03-02","duration":"30","price":"25.5","type_id":"2","client_id":"8"}
86	28803345-f1a5-4949-b622-ddd7515ab604	1	1	2022-03-01 22:49:00.041605	3	6	1	{"date":"","code":"","gender":"","default_price":"","client_id":"8","session_duration":"","duration":"-1","recovery_key":"","recovery_limit":"","price":"25.5","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","default_session_type_id":"0","name":"","phone_number":"","injuries_conditions":"","user":"0","age":""}
87	36f25814-def5-4837-adad-6842799c0f90	1	1	2022-03-01 22:49:00.050349	3	6	2	{"date":"","code":"","gender":"","default_price":"","client_id":"12","session_duration":"","duration":"59","recovery_key":"","recovery_limit":"","price":"0.3","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","default_session_type_id":"0","name":"","phone_number":"","injuries_conditions":"","user":"0","age":""}
88	c965f983-356a-4139-ae0a-bea6d59f9d2b	1	1	2022-03-01 22:49:00.059224	3	6	3	{"date":"","code":"","gender":"","default_price":"","client_id":"14","session_duration":"","duration":"45","recovery_key":"","recovery_limit":"","price":"0.3","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","default_session_type_id":"0","name":"","phone_number":"","injuries_conditions":"","user":"0","age":""}
89	089351ff-541e-455c-b42d-c6f856a6cb56	1	1	2022-03-01 22:49:00.06653	3	6	4	{"date":"","code":"","gender":"","default_price":"","client_id":"12","session_duration":"","duration":"59","recovery_key":"","recovery_limit":"","price":"0.3","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","default_session_type_id":"0","name":"","phone_number":"","injuries_conditions":"","user":"0","age":""}
90	6b6d21c4-dde4-46c5-9038-0f18b4c8e4f9	1	1	2022-03-01 22:49:00.07488	3	6	5	{"date":"","code":"","gender":"","default_price":"","client_id":"14","session_duration":"","duration":"45","recovery_key":"","recovery_limit":"","price":"0.3","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","default_session_type_id":"0","name":"","phone_number":"","injuries_conditions":"","user":"0","age":""}
91	cf77fd5b-d9d3-4456-ada8-ffd897759740	1	1	2022-03-01 22:49:00.08159	3	6	9	{"date":"2022-03-01 00:00:00","code":"","gender":"","default_price":"","client_id":"0","session_duration":"","duration":"0","recovery_key":"","recovery_limit":"","price":"0","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","type_id":"1","vat":"","photo":"","weight":"","dislikes":"","default_session_type_id":"0","name":"","phone_number":"","injuries_conditions":"","user":"0","age":""}
92	ade4b01d-2fc6-435a-8e0b-b0ea7a457bb8	3	3	2022-03-01 22:49:16.942285	1	6	10	{"date":"2022-03-01 00:00:00","duration":"45","price":"0.3","type_id":"2","client_id":"14"}
93	1e422aa4-48ce-4b43-a984-361b90135869	3	3	2022-03-01 22:49:16.957142	1	6	11	{"date":"2022-03-01 00:00:00","duration":"59","price":"0.3","type_id":"1","client_id":"12"}
94	bc256683-46d9-47e1-a544-447f8c7bb59d	3	3	2022-03-01 23:05:39.911672	1	6	12	{"date":"2022-03-01 22:49:43","duration":"59","price":"","type_id":"1","client_id":"12"}
95	5362c02f-72e5-4504-a959-0bbcb3e941b2	3	3	2022-03-01 23:05:39.936916	3	6	10	{"date":"2022-03-01 00:00:00","code":"","gender":"","default_price":"","client_id":"14","session_duration":"","duration":"45","recovery_key":"","recovery_limit":"","price":"0.3","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","type_id":"2","vat":"","photo":"","weight":"","dislikes":"","default_session_type_id":"0","name":"","phone_number":"","injuries_conditions":"","user":"0","age":""}
96	efde2260-769e-40b1-bfcb-b31589d5ede4	3	3	2022-03-01 23:05:39.957539	3	6	11	{"date":"2022-03-01 00:00:00","code":"","gender":"","default_price":"","client_id":"12","session_duration":"","duration":"59","recovery_key":"","recovery_limit":"","price":"0.3","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","type_id":"1","vat":"","photo":"","weight":"","dislikes":"","default_session_type_id":"0","name":"","phone_number":"","injuries_conditions":"","user":"0","age":""}
97	38182709-3f74-4dc9-91d1-055de7b3bab5	3	3	2022-03-01 23:08:23.566267	1	6	13	{"date":"2022-03-01 00:00:00","duration":"45","price":"0.3","type_id":"2","client_id":"14"}
98	20ecb751-3647-4147-8178-ec78e89fa9e2	3	3	2022-03-01 23:08:41.968504	1	6	14	{"date":"2022-03-01 00:00:00","duration":"-1","price":"25.5","type_id":"1","client_id":"8"}
99	3265186d-d694-4410-b458-118d7c835ccf	3	3	2022-03-01 23:08:41.982197	3	6	13	{"date":"2022-03-01 00:00:00","code":"","gender":"","default_price":"","client_id":"14","session_duration":"","duration":"45","recovery_key":"","recovery_limit":"","price":"0.3","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","type_id":"2","vat":"","photo":"","weight":"","dislikes":"","default_session_type_id":"0","name":"","phone_number":"","injuries_conditions":"","user":"0","age":""}
100	6a2b46d5-1943-4704-a99a-c59167841f85	3	3	2022-03-01 23:09:10.08819	1	6	15	{"date":"2022-03-01 00:00:00","duration":"-1","price":"25.5","type_id":"1","client_id":"8"}
101	dec8d93f-280e-49ef-828a-4d654c7b7bd9	3	3	2022-03-01 23:09:10.120201	1	6	16	{"date":"2022-03-01 00:00:00","duration":"45","price":"0.3","type_id":"2","client_id":"14"}
102	4e0170c1-58ce-4dda-ab7b-2d212a59337f	3	3	2022-03-01 23:09:10.137045	3	6	12	{"date":"2022-03-01 22:49:43","code":"","gender":"","default_price":"","client_id":"12","session_duration":"","duration":"59","recovery_key":"","recovery_limit":"","price":"0","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","type_id":"1","vat":"","photo":"","weight":"","dislikes":"","default_session_type_id":"0","name":"","phone_number":"","injuries_conditions":"","user":"0","age":""}
103	69f75565-7bd2-4977-9ce7-102851b1aba5	1	1	2022-03-01 23:09:56.294832	1	6	17	{"date":"2022-03-01 00:00:00","duration":"59","price":"0.3","type_id":"1","client_id":"12"}
104	9b284d3c-5011-44b3-8ba4-a1322300e7d1	1	1	2022-03-01 23:09:56.310844	1	6	18	{"date":"2022-03-01 00:00:00","duration":"59","price":"0.3","type_id":"1","client_id":"12"}
105	e59a47cf-6499-4dec-906d-3c267115c8a2	1	1	2022-03-01 23:09:56.324068	3	6	15	{"date":"2022-03-01 00:00:00","code":"","gender":"","default_price":"","client_id":"8","session_duration":"","duration":"-1","recovery_key":"","recovery_limit":"","price":"25.5","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","type_id":"1","vat":"","photo":"","weight":"","dislikes":"","default_session_type_id":"0","name":"","phone_number":"","injuries_conditions":"","user":"0","age":""}
106	264e3c86-7be3-405a-ab9d-7072ba42210f	1	1	2022-03-01 23:12:08.268526	1	6	19	{"date":"2022-03-01 00:00:00","duration":"-1","price":"25.5","type_id":"1","client_id":"8"}
160	af1491b6-74fb-4369-b67e-2869300ce010	1	1	2022-03-02 01:11:46.416914	2	1	8	{"sessions_per_month":"1","default_session_type_id":"1","recovery_key":"","recovery_limit":"","default_price":"25.5","name":"teste baltas","photo":"","phone_number":"9645439534","user":"0","email":"teste@teste.pt","session_duration":"-1","start_date":"2022-02-02"}
448	c9463a84-9190-445b-af38-86dff37961a1	1	1	2022-03-09 20:00:05.281033	1	13	1	{"recovery_key":"","recovery_limit":"","user":"0"}
107	5b334b4f-df7e-44d4-b6f3-422ca734c241	1	1	2022-03-01 23:12:08.27812	3	6	14	{"date":"2022-03-01 00:00:00","code":"","gender":"","default_price":"","client_id":"8","session_duration":"","duration":"-1","recovery_key":"","recovery_limit":"","price":"25.5","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","type_id":"1","vat":"","photo":"","weight":"","dislikes":"","default_session_type_id":"0","name":"","phone_number":"","injuries_conditions":"","user":"0","age":""}
108	25fade7a-cc42-492b-9aa2-2afe1e998a39	1	1	2022-03-01 23:12:08.290386	3	6	16	{"date":"2022-03-01 00:00:00","code":"","gender":"","default_price":"","client_id":"14","session_duration":"","duration":"45","recovery_key":"","recovery_limit":"","price":"0.3","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","type_id":"2","vat":"","photo":"","weight":"","dislikes":"","default_session_type_id":"0","name":"","phone_number":"","injuries_conditions":"","user":"0","age":""}
109	c0ca56cb-8f94-4902-918f-47346c2907e1	1	1	2022-03-02 00:01:08.016531	1	6	20	{"date":"2022-03-26 00:00:00","duration":"60","price":"0.31","type_id":"2","client_id":"12"}
110	3af5c19f-48cf-4498-b5f8-137116500e0c	1	1	2022-03-02 00:01:56.980348	3	6	18	{"date":"2022-03-01 00:00:00","code":"","gender":"","default_price":"","client_id":"12","session_duration":"","duration":"59","recovery_key":"","recovery_limit":"","price":"0.3","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","type_id":"1","vat":"","photo":"","weight":"","dislikes":"","default_session_type_id":"0","name":"","phone_number":"","injuries_conditions":"","user":"0","age":""}
111	bbb983b9-e6a2-4d25-b95f-1d5ac3e2b5b8	1	1	2022-03-02 00:01:56.995828	3	6	17	{"date":"2022-03-01 00:00:00","code":"","gender":"","default_price":"","client_id":"12","session_duration":"","duration":"59","recovery_key":"","recovery_limit":"","price":"0.3","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","type_id":"1","vat":"","photo":"","weight":"","dislikes":"","default_session_type_id":"0","name":"","phone_number":"","injuries_conditions":"","user":"0","age":""}
112	d896c4ec-b9da-43fb-ba08-24efdcf33ca3	1	1	2022-03-02 00:13:02.146576	1	6	21	{"date":"2022-03-01 00:00:00","duration":"-1","price":"25.5","type_id":"1","client_id":"8"}
113	abdd75ec-e7f0-4094-be57-e7efc2a0dad3	1	1	2022-03-02 00:13:02.165032	3	6	19	{"date":"2022-03-01 00:00:00","code":"","gender":"","default_price":"","client_id":"8","session_duration":"","duration":"-1","recovery_key":"","recovery_limit":"","price":"25.5","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","type_id":"1","vat":"","photo":"","weight":"","dislikes":"","default_session_type_id":"0","name":"","phone_number":"","injuries_conditions":"","user":"0","age":""}
114	4cdd304e-5349-410f-92aa-8eb84126dca2	1	1	2022-03-02 00:23:11.719343	3	6	21	{"date":"2022-03-01 00:00:00","code":"","gender":"","default_price":"","client_id":"8","session_duration":"","duration":"-1","recovery_key":"","recovery_limit":"","price":"25.5","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","type_id":"1","vat":"","photo":"","weight":"","dislikes":"","default_session_type_id":"0","name":"","phone_number":"","injuries_conditions":"","user":"0","age":""}
115	7190aabb-f799-4137-acfb-06c4195a57d4	1	1	2022-03-02 00:31:28.752479	1	6	22	{"date":"2022-03-02 00:00:00","duration":"59","price":"0.3","type_id":"1","client_id":"12"}
116	54f8a78d-8ca1-47f2-82f6-62b5192ab284	1	1	2022-03-02 00:31:28.772703	1	6	23	{"date":"2022-03-02 00:00:00","duration":"45","price":"0.3","type_id":"2","client_id":"14"}
117	27e6326d-84f1-48bd-8c00-f16be6c0a17c	1	1	2022-03-02 00:31:28.789614	1	6	24	{"date":"2022-03-02 00:00:00","duration":"-1","price":"25.5","type_id":"1","client_id":"8"}
118	f9580819-4d56-4538-a5b7-629a25227d28	1	1	2022-03-02 00:32:01.659764	1	6	25	{"date":"2022-03-02 00:00:00","duration":"59","price":"0.3","type_id":"1","client_id":"12"}
119	78fd3dcf-55d8-494b-b621-c703ef49ac64	1	1	2022-03-02 00:32:01.681214	3	6	22	{"date":"2022-03-02 00:00:00","code":"","gender":"","default_price":"","client_id":"12","session_duration":"","duration":"59","recovery_key":"","recovery_limit":"","price":"0.3","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","type_id":"1","vat":"","photo":"","weight":"","dislikes":"","default_session_type_id":"0","name":"","phone_number":"","injuries_conditions":"","user":"0","age":""}
120	5ceed37d-b6c5-4dec-8250-dee5d1a97a6f	1	1	2022-03-02 00:32:01.69866	3	6	24	{"date":"2022-03-02 00:00:00","code":"","gender":"","default_price":"","client_id":"8","session_duration":"","duration":"-1","recovery_key":"","recovery_limit":"","price":"25.5","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","type_id":"1","vat":"","photo":"","weight":"","dislikes":"","default_session_type_id":"0","name":"","phone_number":"","injuries_conditions":"","user":"0","age":""}
121	14e34fab-79c4-4542-b8de-1567bb25e9d8	1	1	2022-03-02 00:34:05.956974	1	6	26	{"date":"2022-03-02 00:00:00","duration":"45","price":"0.3","type_id":"1","client_id":"14"}
122	969f3ea1-133e-4900-b7a0-5623cf990ae3	1	1	2022-03-02 00:35:19.736931	1	6	27	{"date":"2022-03-29","duration":"-1","price":"25.5","type_id":"1","client_id":"8"}
123	936b8bc4-5d50-44a1-b658-e3cd7a3e4c66	1	1	2022-03-02 00:36:00.31374	1	6	28	{"date":"2022-03-31","duration":"45","price":"0.3","type_id":"2","client_id":"14"}
124	acb49ecc-9a00-4a79-bdf5-37470a2a3cf0	1	1	2022-03-02 00:36:00.345503	1	6	29	{"date":"2022-03-01","duration":"59","price":"0.3","type_id":"1","client_id":"12"}
125	f1650a68-8f99-4440-b25a-5489b1a3b290	1	1	2022-03-02 00:37:13.9655	1	6	30	{"date":"2022-03-02","duration":"45","price":"0.3","type_id":"2","client_id":"14"}
126	2618700a-7f9b-4c95-820b-8121c4ed736a	1	1	2022-03-02 00:37:46.763678	1	6	31	{"date":"2022-03-31","duration":"-1","price":"25.5","type_id":"1","client_id":"8"}
127	9c42a3e1-9573-48b3-9dad-6faaeac9a4f8	1	1	2022-03-02 00:39:00.254669	1	6	32	{"date":"2022-03-14","duration":"59","price":"0.3","type_id":"1","client_id":"12"}
128	4f313673-97f7-48c5-8041-838b3c091c1f	1	1	2022-03-02 00:41:40.569066	1	6	33	{"date":"2022-03-01","duration":"45","price":"0.3","type_id":"2","client_id":"14"}
129	e5899b8f-5da3-45d7-b523-e438343cb342	1	1	2022-03-02 00:44:04.699019	1	6	34	{"date":"2022-03-02","duration":"","price":"","type_id":"0","client_id":"0"}
130	60a5797c-c8f1-4116-8359-c606c97444ee	1	1	2022-03-02 00:44:04.721702	1	6	35	{"date":"2022-03-02","duration":"59","price":"0.3","type_id":"1","client_id":"12"}
131	854b3415-04e3-4f31-815a-47a69044eab1	1	1	2022-03-02 00:46:10.289634	1	6	36	{"date":"2022-03-02","duration":"","price":"","type_id":"0","client_id":"0"}
132	32ae849f-80e3-4f25-bdc7-6df00380bc51	1	1	2022-03-02 00:46:10.31906	1	6	37	{"date":"2022-03-02","duration":"59","price":"0.3","type_id":"1","client_id":"12"}
133	679b8c41-d1df-4799-aeb8-97a7112a3493	1	1	2022-03-02 00:50:24.326333	1	6	38	{"date":"2022-03-31","duration":"69","price":"0.35","type_id":"2","client_id":"12"}
134	2f229750-bb28-4fea-b4fd-3705696fc5ac	1	1	2022-03-02 00:50:24.338127	3	6	20	{"date":"2022-03-02","code":"","gender":"","default_price":"","client_id":"12","session_duration":"","duration":"60","recovery_key":"","recovery_limit":"","price":"0.31","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","type_id":"2","vat":"","photo":"","weight":"","dislikes":"","default_session_type_id":"0","name":"","phone_number":"","injuries_conditions":"","user":"0","age":""}
137	03b61a1f-73cb-4bb5-8a59-941fa9e15471	1	1	2022-03-02 00:55:02.993057	3	6	38	{"date":"2022-03-31","code":"","gender":"","default_price":"","client_id":"12","session_duration":"","duration":"69","recovery_key":"","recovery_limit":"","price":"0.35","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","type_id":"2","vat":"","photo":"","weight":"","dislikes":"","default_session_type_id":"0","name":"","phone_number":"","injuries_conditions":"","user":"0","age":""}
138	28e2ea88-a5f4-4130-8850-27f9e613c2de	1	1	2022-03-02 00:56:22.799316	1	6	41	{"date":"2022-03-02","duration":"45","price":"0.3","type_id":"2","client_id":"14"}
139	1db5785d-91a3-4028-9be5-91eca60ca56d	1	1	2022-03-02 00:56:22.824843	1	6	42	{"date":"2022-03-02","duration":"10","price":"0.3","type_id":"1","client_id":"12"}
140	ad17f355-356a-4d55-b892-75a6bac8e499	1	1	2022-03-02 00:58:46.746714	2	1	8	{"sessions_per_month":"1","default_session_type_id":"1","recovery_key":"","recovery_limit":"","default_price":"25.5","name":"teste baltas","photo":"","phone_number":"9645439534","user":"0","email":"teste@teste.pt","session_duration":"-1","start_date":"2022-02-02"}
141	b001d539-f2aa-4e43-b72b-1a3cde037bfe	1	1	2022-03-02 00:58:54.190815	2	1	12	{"sessions_per_month":"0","default_session_type_id":"1","recovery_key":"","recovery_limit":"","default_price":"30.0","name":"Tiina R.","photo":"","phone_number":"9543545454","user":"0","email":"tiina.rinatamaeki@gmail.com","session_duration":"59","start_date":"2022-02-26"}
142	62161a6e-0a9e-45ea-9a4c-f67faaa4110b	1	1	2022-03-02 00:58:58.747256	2	1	14	{"sessions_per_month":"0","default_session_type_id":"2","recovery_key":"","recovery_limit":"","default_price":"30.0","name":"Carlos Vitorino","photo":"","phone_number":"966466572","user":"0","email":"carlos.vitorino@sitana.pt","session_duration":"45","start_date":"2022-03-01"}
143	6b22200f-4653-4930-82f2-ce6f96580c9b	1	1	2022-03-02 00:59:35.904308	2	1	8	{"sessions_per_month":"1","default_session_type_id":"1","recovery_key":"","recovery_limit":"","default_price":"25.5","name":"teste baltas","photo":"","phone_number":"9645439534","user":"0","email":"teste@teste.pt","session_duration":"-1","start_date":"2022-02-02"}
144	dcb9b541-38e0-46a3-8689-48024c46482d	1	1	2022-03-02 01:00:40.070434	2	1	8	{"sessions_per_month":"1","default_session_type_id":"1","recovery_key":"","recovery_limit":"","default_price":"25.5","name":"teste baltas","photo":"","phone_number":"9645439534","user":"0","email":"teste@teste.pt","session_duration":"-1","start_date":"2022-02-02"}
145	cae5e729-2c73-45ec-ac5b-a9b93925bba1	1	1	2022-03-02 01:02:08.745509	2	1	8	{"sessions_per_month":"1","default_session_type_id":"1","recovery_key":"","recovery_limit":"","default_price":"25.5","name":"teste baltas","photo":"","phone_number":"9645439534","user":"0","email":"teste@teste.pt","session_duration":"-1","start_date":"2022-02-02"}
146	e911d7dc-d804-48f7-8f2a-ddb4c4efdff3	1	1	2022-03-02 01:02:08.755386	2	1	8	{"sessions_per_month":"1","default_session_type_id":"1","recovery_key":"","recovery_limit":"","default_price":"25.5","name":"teste baltas","photo":"","phone_number":"9645439534","user":"0","email":"teste@teste.pt","session_duration":"-1","start_date":"2022-02-02"}
147	dd1e45ee-f089-4a76-9c32-a7158a8b6969	1	1	2022-03-02 01:02:12.57648	2	1	8	{"sessions_per_month":"1","default_session_type_id":"1","recovery_key":"","recovery_limit":"","default_price":"25.5","name":"teste baltas","photo":"","phone_number":"9645439534","user":"0","email":"teste@teste.pt","session_duration":"-1","start_date":"2022-02-02"}
148	b073d108-6af5-4da8-981e-da691243f05f	1	1	2022-03-02 01:03:23.028359	2	1	8	{"sessions_per_month":"1","default_session_type_id":"1","recovery_key":"","recovery_limit":"","default_price":"25.5","name":"teste baltas","photo":"","phone_number":"9645439534","user":"0","email":"teste@teste.pt","session_duration":"-1","start_date":"2022-02-02"}
149	fcc8f6d8-a00c-4a28-9fcf-19f84e278c57	1	1	2022-03-02 01:05:06.830952	2	1	8	{"sessions_per_month":"1","default_session_type_id":"1","recovery_key":"","recovery_limit":"","default_price":"25.5","name":"teste baltas","photo":"","phone_number":"9645439534","user":"0","email":"teste@teste.pt","session_duration":"-1","start_date":"2022-02-02"}
150	18db3d87-0397-4fe6-9468-38cc59e9fcda	1	1	2022-03-02 01:05:32.381187	2	1	8	{"sessions_per_month":"1","default_session_type_id":"1","recovery_key":"","recovery_limit":"","default_price":"25.5","name":"teste baltas","photo":"","phone_number":"9645439534","user":"0","email":"teste@teste.pt","session_duration":"-1","start_date":"2022-02-02"}
151	d3118efd-9d8c-48c7-836d-0edfe6cac510	1	1	2022-03-02 01:05:38.848902	2	1	8	{"sessions_per_month":"1","default_session_type_id":"1","recovery_key":"","recovery_limit":"","default_price":"25.5","name":"teste baltas","photo":"","phone_number":"9645439534","user":"0","email":"teste@teste.pt","session_duration":"-1","start_date":"2022-02-02"}
152	9394a80a-91ac-4de8-af04-ea0fc893de8d	1	1	2022-03-02 01:05:40.301926	2	1	8	{"sessions_per_month":"1","default_session_type_id":"1","recovery_key":"","recovery_limit":"","default_price":"25.5","name":"teste baltas","photo":"","phone_number":"9645439534","user":"0","email":"teste@teste.pt","session_duration":"-1","start_date":"2022-02-02"}
153	8ff64331-b227-4adc-a696-1fb5d9e5eaf5	1	1	2022-03-02 01:06:09.623867	2	1	8	{"sessions_per_month":"1","default_session_type_id":"1","recovery_key":"","recovery_limit":"","default_price":"25.5","name":"teste baltas","photo":"","phone_number":"9645439534","user":"0","email":"teste@teste.pt","session_duration":"-1","start_date":"2022-02-02"}
154	74ba69a7-8a9e-4a63-ab9f-01a954e8ffb5	1	1	2022-03-02 01:06:49.476871	2	1	8	{"sessions_per_month":"1","default_session_type_id":"1","recovery_key":"","recovery_limit":"","default_price":"25.5","name":"teste baltas","photo":"","phone_number":"9645439534","user":"0","email":"teste@teste.pt","session_duration":"-1","start_date":"2022-02-02"}
155	744b0628-e992-477a-8413-8d5f8560e6bc	1	1	2022-03-02 01:07:20.089015	2	1	8	{"sessions_per_month":"1","default_session_type_id":"1","recovery_key":"","recovery_limit":"","default_price":"25.5","name":"teste baltas","photo":"","phone_number":"9645439534","user":"0","email":"teste@teste.pt","session_duration":"-1","start_date":"2022-02-02"}
156	197ad6c5-17c9-47c4-8268-72778a77bb6f	1	1	2022-03-02 01:07:38.259507	2	1	8	{"sessions_per_month":"1","default_session_type_id":"1","recovery_key":"","recovery_limit":"","default_price":"25.5","name":"teste baltas","photo":"","phone_number":"9645439534","user":"0","email":"teste@teste.pt","session_duration":"-1","start_date":"2022-02-02"}
157	9e2d4b19-91d9-4dbb-8091-fe2f0b9fe5bd	1	1	2022-03-02 01:07:56.280154	2	1	8	{"sessions_per_month":"1","default_session_type_id":"1","recovery_key":"","recovery_limit":"","default_price":"25.5","name":"teste baltas","photo":"","phone_number":"9645439534","user":"0","email":"teste@teste.pt","session_duration":"-1","start_date":"2022-02-02"}
158	7fb507db-3c63-48dc-b1be-ac5b9cb9a496	1	1	2022-03-02 01:09:27.298006	2	1	8	{"sessions_per_month":"1","default_session_type_id":"1","recovery_key":"","recovery_limit":"","default_price":"25.5","name":"teste baltas","photo":"","phone_number":"9645439534","user":"0","email":"teste@teste.pt","session_duration":"-1","start_date":"2022-02-02"}
159	126ffc07-3c58-4516-a06d-334698244ae4	1	1	2022-03-02 01:09:35.590664	2	1	8	{"sessions_per_month":"1","default_session_type_id":"1","recovery_key":"","recovery_limit":"","default_price":"25.5","name":"teste baltas","photo":"","phone_number":"9645439534","user":"0","email":"teste@teste.pt","session_duration":"-1","start_date":"2022-02-02"}
182	fa135bf1-3747-49df-8607-d076be6c9901	1	1	2022-03-02 11:22:21.524652	1	6	45	{"date":"2022-03-02","duration":"59","price":"0.3","type_id":"1","client_id":"12"}
161	240c9bb5-547d-4ab1-a794-8db61b8cd9bf	1	1	2022-03-02 01:13:53.973864	2	1	8	{"sessions_per_month":"1","default_session_type_id":"1","recovery_key":"","recovery_limit":"","default_price":"25.5","name":"teste baltas","photo":"","phone_number":"9645439534","user":"0","email":"teste@teste.pt","session_duration":"-1","start_date":"2022-02-02"}
163	433de37e-2484-40b3-8bf2-7546203c7e3f	1	1	2022-03-02 01:15:03.76538	2	1	8	{"sessions_per_month":"1","default_session_type_id":"1","recovery_key":"","recovery_limit":"","default_price":"25.5","name":"teste baltas","photo":"","phone_number":"9645439534","user":"0","email":"teste@teste.pt","session_duration":"-1","start_date":"2022-02-02"}
164	4e743e4e-f00b-4571-9ef2-b88c45f388c0	1	1	2022-03-02 01:17:08.43654	2	1	8	{"sessions_per_month":"1","default_session_type_id":"1","recovery_key":"","recovery_limit":"","default_price":"25.5","name":"teste baltas","photo":"","phone_number":"9645439534","user":"0","email":"teste@teste.pt","session_duration":"-1","start_date":"2022-02-02"}
165	0a496754-6e73-4f4d-9e33-ee225f4d3d42	1	1	2022-03-02 01:17:38.889529	2	1	8	{"sessions_per_month":"1","default_session_type_id":"1","recovery_key":"","recovery_limit":"","default_price":"25.5","name":"teste baltas","photo":"","phone_number":"9645439534","user":"0","email":"teste@teste.pt","session_duration":"-1","start_date":"2022-02-02"}
162	38cb80b8-a084-4091-83b4-3aedfc9a6b12	1	1	2022-03-02 01:14:47.62343	2	1	8	{"sessions_per_month":"1","default_session_type_id":"1","recovery_key":"","recovery_limit":"","default_price":"25.5","name":"teste baltas","photo":"","phone_number":"9645439534","user":"0","email":"teste@teste.pt","session_duration":"-1","start_date":"2022-02-02"}
166	c9f3cf4d-d0b0-4887-876d-c3f61135b5f6	1	1	2022-03-02 01:17:44.22352	2	1	8	{"sessions_per_month":"1","default_session_type_id":"1","recovery_key":"","recovery_limit":"","default_price":"25.5","name":"teste baltas","photo":"","phone_number":"9645439534","user":"0","email":"teste@teste.pt","session_duration":"-1","start_date":"2022-02-02"}
167	c04711e4-7a96-4a79-b7d1-73b585ee4a01	1	1	2022-03-02 11:10:58.107167	1	6	43	{"date":"2022-03-05","duration":"50","price":"0.3","type_id":"1","client_id":"14"}
168	3271d624-7434-4080-b7ad-47638658525b	1	1	2022-03-02 11:10:58.122017	3	6	28	{"date":"2022-03-31","code":"","gender":"","default_price":"","client_id":"14","session_duration":"","duration":"45","recovery_key":"","recovery_limit":"","price":"0.3","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","type_id":"2","vat":"","photo":"","weight":"","dislikes":"","default_session_type_id":"0","name":"","phone_number":"","injuries_conditions":"","user":"0","age":""}
169	f1982e48-1008-4d95-8abb-9ad3fe244e23	1	1	2022-03-02 11:10:58.135533	3	6	31	{"date":"2022-03-31","code":"","gender":"","default_price":"","client_id":"8","session_duration":"","duration":"-1","recovery_key":"","recovery_limit":"","price":"25.5","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","type_id":"1","vat":"","photo":"","weight":"","dislikes":"","default_session_type_id":"0","name":"","phone_number":"","injuries_conditions":"","user":"0","age":""}
170	bd947fc9-38cc-4994-a8ac-46dbf1f9cc12	1	1	2022-03-02 11:10:58.146853	3	6	27	{"date":"2022-03-29","code":"","gender":"","default_price":"","client_id":"8","session_duration":"","duration":"-1","recovery_key":"","recovery_limit":"","price":"25.5","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","type_id":"1","vat":"","photo":"","weight":"","dislikes":"","default_session_type_id":"0","name":"","phone_number":"","injuries_conditions":"","user":"0","age":""}
171	a1472bad-1a3d-4bc5-aca8-b3d05b95bd81	1	1	2022-03-02 11:10:58.156961	3	6	32	{"date":"2022-03-14","code":"","gender":"","default_price":"","client_id":"12","session_duration":"","duration":"59","recovery_key":"","recovery_limit":"","price":"0.3","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","type_id":"1","vat":"","photo":"","weight":"","dislikes":"","default_session_type_id":"0","name":"","phone_number":"","injuries_conditions":"","user":"0","age":""}
172	cecb77e0-4126-4f77-b753-4289b8be340b	1	1	2022-03-02 11:10:58.169029	3	6	41	{"date":"2022-03-02","code":"","gender":"","default_price":"","client_id":"14","session_duration":"","duration":"45","recovery_key":"","recovery_limit":"","price":"0.3","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","type_id":"2","vat":"","photo":"","weight":"","dislikes":"","default_session_type_id":"0","name":"","phone_number":"","injuries_conditions":"","user":"0","age":""}
173	5ec0890e-86aa-43e9-9de0-9534e3ac3c56	1	1	2022-03-02 11:10:58.180449	3	6	42	{"date":"2022-03-02","code":"","gender":"","default_price":"","client_id":"12","session_duration":"","duration":"10","recovery_key":"","recovery_limit":"","price":"0.3","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","type_id":"1","vat":"","photo":"","weight":"","dislikes":"","default_session_type_id":"0","name":"","phone_number":"","injuries_conditions":"","user":"0","age":""}
174	1bf919c1-c76e-446c-bfdf-9b92586fbfbe	1	1	2022-03-02 11:10:58.190596	3	6	23	{"date":"2022-03-02","code":"","gender":"","default_price":"","client_id":"14","session_duration":"","duration":"45","recovery_key":"","recovery_limit":"","price":"0.3","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","type_id":"2","vat":"","photo":"","weight":"","dislikes":"","default_session_type_id":"0","name":"","phone_number":"","injuries_conditions":"","user":"0","age":""}
175	e26c0bd3-1cc3-44e9-b28b-8cfaedc19da4	1	1	2022-03-02 11:10:58.200446	3	6	25	{"date":"2022-03-02","code":"","gender":"","default_price":"","client_id":"12","session_duration":"","duration":"59","recovery_key":"","recovery_limit":"","price":"0.3","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","type_id":"1","vat":"","photo":"","weight":"","dislikes":"","default_session_type_id":"0","name":"","phone_number":"","injuries_conditions":"","user":"0","age":""}
176	9e0b9f52-212f-4827-b4bf-a036f8faad6b	1	1	2022-03-02 11:10:58.215027	3	6	30	{"date":"2022-03-02","code":"","gender":"","default_price":"","client_id":"14","session_duration":"","duration":"45","recovery_key":"","recovery_limit":"","price":"0.3","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","type_id":"2","vat":"","photo":"","weight":"","dislikes":"","default_session_type_id":"0","name":"","phone_number":"","injuries_conditions":"","user":"0","age":""}
177	4446fb11-5b25-4823-bfc4-7a5fbcd0385f	1	1	2022-03-02 11:10:58.303862	3	6	35	{"date":"2022-03-02","code":"","gender":"","default_price":"","client_id":"12","session_duration":"","duration":"59","recovery_key":"","recovery_limit":"","price":"0.3","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","type_id":"1","vat":"","photo":"","weight":"","dislikes":"","default_session_type_id":"0","name":"","phone_number":"","injuries_conditions":"","user":"0","age":""}
178	fc97e7e5-acb4-4cc1-b3ae-cee1b9185c71	1	1	2022-03-02 11:10:58.318737	3	6	33	{"date":"2022-03-01","code":"","gender":"","default_price":"","client_id":"14","session_duration":"","duration":"45","recovery_key":"","recovery_limit":"","price":"0.3","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","type_id":"2","vat":"","photo":"","weight":"","dislikes":"","default_session_type_id":"0","name":"","phone_number":"","injuries_conditions":"","user":"0","age":""}
179	0cda6265-5d4d-41af-9e5a-07c32f2ee82d	1	1	2022-03-02 11:10:58.332059	3	6	29	{"date":"2022-03-01","code":"","gender":"","default_price":"","client_id":"12","session_duration":"","duration":"59","recovery_key":"","recovery_limit":"","price":"0.3","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","type_id":"1","vat":"","photo":"","weight":"","dislikes":"","default_session_type_id":"0","name":"","phone_number":"","injuries_conditions":"","user":"0","age":""}
180	3385148f-d6cf-4eeb-a7eb-b31e7b90f641	1	1	2022-03-02 11:10:58.341779	3	6	39	{"date":"2022-02-01","code":"","gender":"","default_price":"","client_id":"8","session_duration":"","duration":"30","recovery_key":"","recovery_limit":"","price":"0.3","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","type_id":"1","vat":"","photo":"","weight":"","dislikes":"","default_session_type_id":"0","name":"","phone_number":"","injuries_conditions":"","user":"0","age":""}
181	efbc204a-4158-4599-893f-4da3d2dd863c	1	1	2022-03-02 11:22:21.509975	1	6	44	{"date":"2022-03-02","duration":"60","price":"0.3","type_id":"1","client_id":"12"}
184	6d9e0919-c644-49de-ae0a-21b0744b18ea	1	1	2022-03-02 11:23:47.63088	1	6	47	{"date":"2022-03-02","duration":"30","price":"25.5","type_id":"1","client_id":"8"}
185	b4b34877-8263-4145-8958-448ebf3ee933	1	1	2022-03-02 11:23:47.646881	1	6	48	{"date":"2022-03-02","duration":"-1","price":"25.5","type_id":"1","client_id":"8"}
186	d0b46d4b-5d9a-4305-88b1-e6b62c67f2ed	1	1	2022-03-02 11:27:04.549124	1	6	49	{"date":"2022-03-02","duration":"200","price":"0.3","type_id":"1","client_id":"14"}
187	56352944-b3f6-4df6-9b87-e86b91c60483	1	1	2022-03-02 11:29:10.094217	1	6	50	{"date":"2022-03-02","duration":"100","price":"0.3","type_id":"1","client_id":"12"}
188	51db41e6-abfe-4c64-8626-01938b75b40b	1	1	2022-03-02 11:29:10.10423	3	6	49	{"date":"2022-03-02","code":"","gender":"","default_price":"","client_id":"14","session_duration":"","duration":"200","recovery_key":"","recovery_limit":"","price":"0.3","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","type_id":"1","vat":"","photo":"","weight":"","dislikes":"","default_session_type_id":"0","name":"","phone_number":"","injuries_conditions":"","user":"0","age":""}
189	30a4e4eb-770f-4b39-8a46-79783e71f7f5	1	1	2022-03-02 11:33:21.465265	1	6	51	{"date":"2022-03-02","duration":"45","price":"0.3","type_id":"2","client_id":"14"}
190	7c59e20b-8e6c-4396-8b89-1c9160d32a5a	1	1	2022-03-02 11:34:11.2876	1	6	52	{"date":"2022-03-10","duration":"-1","price":"25.5","type_id":"1","client_id":"8"}
191	41b15900-92c9-49a7-8956-40403def5caf	1	1	2022-03-02 11:34:35.060711	1	6	53	{"date":"2022-03-05","duration":"59","price":"0.3","type_id":"1","client_id":"12"}
192	de81cc31-5ab2-418f-8ebf-60050fd6af3e	1	1	2022-03-02 11:34:35.070898	1	6	54	{"date":"2022-03-10","duration":"-1","price":"25.5","type_id":"1","client_id":"8"}
193	71a94d4e-6975-4a04-ba13-f07e5c3ecae4	1	1	2022-03-02 11:35:40.108622	1	6	55	{"date":"2022-03-02","duration":"89","price":"0.3","type_id":"1","client_id":"12"}
194	8a8b9266-9106-43b5-99ee-e522e9e594f7	1	1	2022-03-02 16:41:58.148202	2	1	12	{"sessions_per_month":"0","default_session_type_id":"1","recovery_key":"","recovery_limit":"","default_price":"30.0","name":"Tiina R.","photo":"","phone_number":"9543545454","user":"0","email":"tiina.rinatamaeki@gmail.com","session_duration":"59","start_date":"2022-02-26"}
195	b7509536-fb81-46a6-9e83-8f7ccc9cb054	1	1	2022-03-02 16:42:02.71351	2	1	12	{"sessions_per_month":"0","default_session_type_id":"1","recovery_key":"","recovery_limit":"","default_price":"30.0","name":"Tiina R.","photo":"","phone_number":"9543545454","user":"0","email":"tiina.rinatamaeki@gmail.com","session_duration":"59","start_date":"2022-02-26"}
196	118ee655-640a-42e8-87ad-dfbc460aaada	1	1	2022-03-02 16:43:06.922288	1	6	56	{"date":"2022-03-24","duration":"45","price":"0.3","type_id":"1","client_id":"14"}
197	087e7af6-b6b5-475b-a2e4-5803add3d18a	1	1	2022-03-02 16:46:19.426962	3	6	50	{"date":"2022-03-02","code":"","gender":"","default_price":"","client_id":"12","session_duration":"","duration":"100","recovery_key":"","recovery_limit":"","price":"0.3","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","type_id":"1","vat":"","photo":"","weight":"","dislikes":"","default_session_type_id":"0","name":"","phone_number":"","injuries_conditions":"","user":"0","age":""}
198	d5a55597-d428-4b23-8f4c-c07bd667cae7	1	1	2022-03-02 19:11:12.49772	2	1	12	{"sessions_per_month":"0","default_session_type_id":"1","recovery_key":"","recovery_limit":"","default_price":"30.0","name":"Tiina R.","photo":"","phone_number":"9543545454","user":"0","email":"tiina.rinatamaeki@gmail.com","session_duration":"59","start_date":"2022-02-26"}
199	0d85fb84-b9db-4b3a-99bf-3a86e4b7fdb7	1	1	2022-03-02 19:11:12.525747	2	2	4	{"gender":"female","weight":"-0.01","dislikes":"dsadsada","injuries_conditions":"dsadsa","age":"30","client_id":"12","goals":"2313231","height":"-0.01","likes":"dasdadas"}
200	089f86c7-1070-41e8-ba38-72188403ca03	1	1	2022-03-02 19:11:23.104838	2	1	8	{"sessions_per_month":"1","default_session_type_id":"1","recovery_key":"","recovery_limit":"","default_price":"25.5","name":"teste baltas","photo":"","phone_number":"9645439534","user":"0","email":"teste@teste.pt","session_duration":"-1","start_date":"2022-02-02"}
201	3db2ffd3-436d-4953-b500-0a506ebbd965	1	1	2022-03-02 19:11:23.131789	2	2	3	{"gender":"male","weight":"-0.01","dislikes":"wewqeqw","injuries_conditions":"asdf","age":"-1","client_id":"8","goals":"wqeweqw","height":"-0.01","likes":"ewqewqeqw"}
202	2381aa07-dd4b-4828-83ad-052fd7c6a8c8	1	1	2022-03-02 19:11:56.676908	1	6	57	{"date":"2022-03-02","duration":"45","price":"0.3","type_id":"2","client_id":"14"}
203	c109c64c-f5e6-4af9-b969-203f1c0af4a2	1	1	2022-03-02 19:11:56.690197	1	6	58	{"date":"2022-03-02","duration":"59","price":"0.3","type_id":"1","client_id":"12"}
204	afe29389-65ed-43b2-b1db-65207e6c7d5b	1	1	2022-03-02 19:11:56.700391	1	6	59	{"date":"2022-03-02","duration":"-1","price":"25.5","type_id":"1","client_id":"8"}
205	6365be40-3562-4e72-ac83-2106a3d33dc2	1	1	2022-03-02 19:39:17.115741	1	5	1	{"pay_day":"","sessions":"[56,52,54,53,43,47,48,51,26,55]","total_amount":"-0.01","client_id":"0"}
206	4b31a245-1051-40e0-81e9-6aa24e959ea4	1	1	2022-03-02 19:42:08.237773	1	5	2	{"pay_day":"","sessions":"[56,52,54,53,43,47,48,51,26,55]","total_amount":"-0.01","client_id":"14"}
207	886f657e-7023-4f61-b649-2380feb9288c	1	1	2022-03-02 19:43:26.663067	1	5	3	{"pay_day":"","sessions":"[56,52,54,53,43,47,48,51,26,55]","total_amount":"-0.01","client_id":"14"}
208	421e9657-a868-4ddf-a5b2-26d88a95d388	1	1	2022-03-02 19:44:22.430072	1	5	4	{"pay_day":"","sessions":"[56,52,54,53,43,47,48,51,26,55]","total_amount":"103.80000305175781","client_id":"14"}
209	534fa76b-7a7b-4fd9-9690-c95f4ee3cab9	1	1	2022-03-02 19:44:43.16979	3	5	3	{"date":"","code":"","gender":"","default_price":"","client_id":"14","session_duration":"","duration":"","pay_day":"","recovery_key":"","recovery_limit":"","price":"","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"[56,52,54,53,43,47,48,51,26,55]","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","default_session_type_id":"0","total_amount":"-0.01","name":"","phone_number":"","injuries_conditions":"","user":"0","age":""}
210	436cdb11-c4dd-4e1f-b4c5-4480a8000647	1	1	2022-03-02 19:44:43.177397	3	5	2	{"date":"","code":"","gender":"","default_price":"","client_id":"14","session_duration":"","duration":"","pay_day":"","recovery_key":"","recovery_limit":"","price":"","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"[56,52,54,53,43,47,48,51,26,55]","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","default_session_type_id":"0","total_amount":"-0.01","name":"","phone_number":"","injuries_conditions":"","user":"0","age":""}
211	4a1a9ff1-be91-4294-a219-4f3c77455f88	1	1	2022-03-02 19:44:43.188496	3	5	1	{"date":"","code":"","gender":"","default_price":"","client_id":"0","session_duration":"","duration":"","pay_day":"","recovery_key":"","recovery_limit":"","price":"","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"[56,52,54,53,43,47,48,51,26,55]","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","default_session_type_id":"0","total_amount":"-0.01","name":"","phone_number":"","injuries_conditions":"","user":"0","age":""}
212	92d91b76-38a2-4353-a9da-d66aa18664df	1	1	2022-03-02 19:47:52.039197	1	5	5	{"pay_day":"","sessions":"[56,52,54,53,43,47,48,51,26,55]","total_amount":"103.80000305175781","client_id":"8"}
213	850715cb-157f-4a4a-9926-2f4ae6643d84	1	1	2022-03-02 19:48:25.060766	1	5	6	{"pay_day":"","sessions":"[56,52,54,53,43,47,48,51,26,55]","total_amount":"103.80000305175781","client_id":"14"}
214	52c7afcd-9358-442f-a7eb-0b307e96786c	1	1	2022-03-02 19:57:00.329759	1	5	7	{"billing_period":"2022-03-01 - 2022-03-24","pay_day":"","sessions":"[56,52,54,53,43,47,48,51,26,55]","total_amount":"103.80000305175781","created_at":"","client_id":"12"}
215	08098f20-f5cf-4ebf-bf90-7d382da2ee0b	1	1	2022-03-02 20:00:40.674474	1	5	8	{"billing_period":"2022-03-01 - 2022-03-23","pay_day":"","sessions":"[56,52,54,53,43,47,48,51,26,55]","total_amount":"103.80000305175781","created_at":"","client_id":"14"}
216	f5dffc77-ffce-4296-85e3-66c5665d2338	1	1	2022-03-02 20:01:35.653455	1	5	9	{"billing_period":"2022-03-01 - 2022-03-31","pay_day":"","sessions":"[56,53,43,47,51,26,55]","total_amount":"27.299999237060547","created_at":"","client_id":"12"}
217	e73e4feb-a821-4401-84a1-6cbf8c8ae536	1	1	2022-03-02 20:03:29.43269	1	5	10	{"billing_period":"2022-03-01 - 2022-03-15","pay_day":"","sessions":"[56,52,54,53,43,47,55]","total_amount":"77.69999694824219","created_at":"","client_id":"14"}
449	e829a232-65a5-422f-9597-f49050eba9e3	1	1	2022-03-09 20:01:57.748475	1	13	2	{"recovery_key":"","recovery_limit":"","client_user_id":"5"}
218	2d896391-5627-447d-b87a-1dfe90518a98	1	1	2022-03-02 20:05:48.485588	1	5	11	{"billing_period":"2022-03-01 - 2022-03-31","pay_day":"","sessions":"[56,52,54,53,43,47,48,51,26,55]","total_amount":"103.80000305175781","created_at":"","client_id":"12"}
219	f5186c9c-1a25-4fb0-93fd-546caa93095e	1	1	2022-03-02 20:07:02.530315	1	5	12	{"billing_period":"2022-03-08 - 2022-03-30","pay_day":"","sessions":"[56,52,54,53,43,47,48,51,26,55]","total_amount":"103.80000305175781","created_at":"","client_id":"14"}
220	ae3e1fee-3e33-43b5-b766-66cd6546357a	1	1	2022-03-02 20:08:37.253561	1	5	13	{"billing_period":"2022-03-08 - 2022-03-22","pay_day":"","bill_created_at":"","sessions":"[56,52,54,53,43,47,48,51,26,55]","total_amount":"103.80000305175781","client_id":"12"}
221	038e6ea9-7fdd-406f-957b-7ed6d220fb32	1	1	2022-03-02 20:10:47.808006	1	5	14	{"billing_period":"2022-03-08 - 2022-03-15","pay_day":"2022-03-15","bill_created_at":"2022-03-02","sessions":"[56,52,54,53,43,47,48,51,26,55]","total_amount":"103.80000305175781","client_id":"12"}
222	b73d694b-7fd7-46cb-8d89-d136ba68ad51	1	1	2022-03-02 20:36:45.735748	1	5	15	{"billing_period":"2022-03-01 - 2022-03-15","pay_day":"2022-03-14","sessions":"[56,52,54,53,43,47,48,51,26,55]","total_amount":"103.80000305175781","created_at":"2022-03-02","client_id":"12"}
223	004618d2-6b32-449a-bb7c-a5c1e84e3b0d	1	1	2022-03-02 20:47:07.61854	1	9	1	{"code":"waiting_payment","name":"Waiting Payment"}
224	0f01b62e-b57a-4de1-93b0-bc15a4cae68e	1	1	2022-03-02 20:48:01.13254	1	9	2	{"code":"paid","name":"Paid"}
225	a40746e7-ffe6-4bf1-ad71-00d7b922288f	1	1	2022-03-02 20:49:26.497476	1	5	16	{"billing_period":"2022-03-01 - 2022-03-31","pay_day":"2022-03-14","sessions":"[56,52,54,53,43,47,48,51,26,55]","status_id":"1","total_amount":"103.80000305175781","created_at":"2022-03-02","client_id":"14"}
226	4a17034d-1fa0-4585-bb3a-992b95bb5303	1	1	2022-03-02 21:12:13.5379	2	5	13	{"billing_period":"2022-03-08 - 2022-03-22","pay_day":"","sessions":"[56,52,54,53,43,47,48,51,26,55]","status_id":"1","total_amount":"103.8","created_at":"","client_id":"12"}
227	417aa128-5126-4b13-b28a-e2b109e91e6a	1	1	2022-03-02 21:12:28.455252	2	5	13	{"billing_period":"2022-03-08 - 2022-03-22","pay_day":"","sessions":"[56,52,54,53,43,47,48,51,26,55]","status_id":"1","total_amount":"103.8","created_at":"","client_id":"12"}
228	ab00dec6-4708-4c7b-95c8-09e861f6d1d7	1	1	2022-03-02 21:13:49.750168	2	5	12	{"billing_period":"2022-03-08 - 2022-03-30","pay_day":"","sessions":"[56,52,54,53,43,47,48,51,26,55]","status_id":"2","total_amount":"103.8","created_at":"","client_id":"14"}
229	dd5e339a-e267-44a2-a01e-35c00150c3b1	1	1	2022-03-02 21:14:01.602662	2	5	13	{"billing_period":"2022-03-08 - 2022-03-22","pay_day":"","sessions":"[56,52,54,53,43,47,48,51,26,55]","status_id":"2","total_amount":"103.8","created_at":"","client_id":"12"}
230	e48b673f-c591-46c1-8514-4fd7555f1a37	3	3	2022-03-03 10:26:34.846427	1	5	17	{"billing_period":"2022-03-01 - 2022-03-31","pay_day":"2022-04-30","sessions":"[56,52,54,53,43,47,48,51,26,55]","status_id":"1","total_amount":"103.80000305175781","created_at":"2022-03-03","client_id":"14"}
231	254d6f9e-9c1c-4f2f-a627-63cb2d463482	3	3	2022-03-03 10:28:34.66973	1	5	18	{"billing_period":"2022-03-01 - 2022-03-31","pay_day":"2022-03-31","sessions":"[52,54,53]","status_id":"1","total_amount":"51.29999923706055","created_at":"2022-03-03","client_id":"8"}
232	174e0895-7954-4179-98ac-d9c24114b8cc	3	3	2022-03-03 10:28:56.433085	2	5	15	{"billing_period":"2022-03-01 - 2022-03-15","pay_day":"2022-03-14","sessions":"[56,52,54,53,43,47,48,51,26,55]","status_id":"2","total_amount":"103.8","created_at":"2022-03-02","client_id":"12"}
233	d5501501-7944-4695-8208-4b7fc1fd3c5b	1	1	2022-03-03 18:07:00.338008	1	12	1	{"text":"solinca","value":"Solinca"}
234	afbb7702-85eb-4dd0-b517-28e9c4f9434d	1	1	2022-03-03 18:07:30.818157	1	12	2	{"text":"formacao_xpto","value":"Forma\\u00E7\\u00E3o Xpto"}
235	615b9140-b407-4193-bc57-92fee4dbf5d7	1	1	2022-03-03 18:07:55.128115	2	12	2	{"text":"formacao","value":"Forma\\u00E7\\u00E3o"}
236	5aab85a0-521f-45eb-8bda-6831c24b92f9	1	1	2022-03-03 18:08:50.583041	1	12	3	{"text":"equipment","value":"Equipment"}
237	ca93aebf-ad82-46de-bd82-4152d6da44b0	1	1	2022-03-03 18:08:59.400075	2	12	2	{"text":"training","value":"Training"}
238	00ffd1c6-d307-4110-ae66-1452df792276	1	1	2022-03-03 18:09:13.710125	1	12	4	{"text":"certification","value":"Certification"}
239	a59ae24d-dfe6-44d2-b751-72bceaea8dd3	3	3	2022-03-03 18:20:46.520393	1	5	19	{"billing_period":"","pay_day":"","sessions":"","status_id":"2","total_amount":"400.0","created_at":"2022-03-03","description":"lalala","provider_id":"0","client_id":"0"}
240	f9cf9a93-78a3-4ee2-9576-ceccf326ab62	1	1	2022-03-03 18:24:22.802647	2	5	19	{"billing_period":"","pay_day":"2022-03-03","sessions":"","status_id":"2","total_amount":"400.0","created_at":"2022-03-03","description":"lalala","provider_id":"0","client_id":"0"}
241	6cc8470f-ab5b-4da2-8e7d-bf5f923c16d7	1	1	2022-03-03 18:24:32.720076	2	5	19	{"billing_period":"","pay_day":"2022-03-03","sessions":"","status_id":"2","total_amount":"400.0","created_at":"2022-03-03","description":"lalala","provider_id":"0","client_id":"0"}
242	0c3e3481-41f6-4b02-b7a1-daae00793395	1	1	2022-03-03 18:33:37.038661	1	5	20	{"billing_period":"","pay_day":"","sessions":"","status_id":"2","total_amount":"140.0","created_at":"2022-03-03","description":"teste123","provider_id":"0","client_id":"0"}
243	411cfe93-b3e0-4382-8dbf-6b0ee4364a6c	1	1	2022-03-03 18:36:12.159547	1	5	21	{"billing_period":"","pay_day":"","sessions":"","status_id":"2","total_amount":"140.0","created_at":"2022-03-03","description":"testeeee","provider_id":"Solinca","client_id":"0"}
244	d79179fa-dacb-4f2b-b203-4815c8df3a9c	1	1	2022-03-03 18:43:21.103604	2	12	1	{"label":"Solinca","value":"solinca"}
245	45863b5d-9928-46a1-9ae1-79699f54d307	1	1	2022-03-03 18:43:30.669371	2	12	2	{"label":"Training","value":"training"}
246	55f62883-4f1b-472d-8e69-a22a61625d36	1	1	2022-03-03 18:43:37.249798	2	12	3	{"label":"Equipment","value":"equipment"}
247	05ac642b-7ea1-4d0d-b111-835f782e6c21	1	1	2022-03-03 18:43:44.057111	2	12	4	{"label":"Certification","value":"certification"}
248	92d513bd-50d2-4c11-9672-f68fa158ae59	1	1	2022-03-03 18:48:39.531258	1	5	26	{"billing_period":"","pay_day":"","sessions":"","status_id":"2","total_amount":"-1312.0","created_at":"2022-03-03","description":"21345","provider_id":"4","client_id":"0"}
249	fc5a4f3f-eeb7-4351-bfbe-8aeb330eeade	1	1	2022-03-03 18:58:46.602922	2	1	8	{"sessions_per_month":"1","default_session_type_id":"1","recovery_key":"","recovery_limit":"","default_price":"25.5","name":"teste baltas","photo":"","phone_number":"9645439534","user":"0","email":"teste@teste.pt","session_duration":"40","start_date":"2022-02-02"}
250	ff7c8cff-3686-4447-bd0a-b7e5c5297db4	1	1	2022-03-03 18:58:46.631569	2	2	3	{"gender":"male","weight":"-0.01","dislikes":"wewqeqw","injuries_conditions":"asdf","age":"35","client_id":"8","goals":"wqeweqw","height":"-0.01","likes":"ewqewqeqw"}
251	7fb1dfa5-f18d-4462-887b-d6f9f02e91c1	1	1	2022-03-03 18:58:58.720427	2	1	8	{"sessions_per_month":"1","default_session_type_id":"1","recovery_key":"","recovery_limit":"","default_price":"25.5","name":"teste baltas","photo":"","phone_number":"9645439534","user":"0","email":"teste@teste.pt","session_duration":"40","start_date":"2022-02-02"}
252	8b97eb43-0ea2-4e75-96fb-11be7a4545f0	1	1	2022-03-03 18:58:58.736287	2	2	3	{"gender":"male","weight":"2.3","dislikes":"wewqeqw","injuries_conditions":"asdf","age":"35","client_id":"8","goals":"wqeweqw","height":"1.0","likes":"ewqewqeqw"}
253	8479200e-3e86-471e-b7a8-8ee85e0ca11b	3	3	2022-03-04 13:05:47.237044	1	5	27	{"billing_period":"2022-03-01 - 2022-03-31","pay_day":"2022-03-31","sessions":"[56,43,51,26,57]","status_id":"1","total_amount":"1.5","created_at":"2022-03-04","description":"","provider_id":"0","client_id":"14"}
254	b2ebbb38-cbba-417d-be31-695a15418e9c	3	3	2022-03-04 13:06:38.640196	1	5	28	{"billing_period":"","pay_day":"","sessions":"","status_id":"2","total_amount":"-400.0","created_at":"2022-03-04","description":"renda","provider_id":"1","client_id":"0"}
255	dabedf1d-1cf3-4f78-8a53-8850300a0b2b	3	3	2022-03-04 13:07:01.141626	2	5	28	{"billing_period":"","pay_day":"","sessions":"","status_id":"1","total_amount":"-400.0","created_at":"2022-03-04","description":"renda","provider_id":"1","client_id":"0"}
259	04ade61b-f218-4459-b1c0-ebe17e54df70	3	3	2022-03-04 13:11:35.578158	1	1	15	{"sessions_per_month":"","default_session_type_id":"0","recovery_key":"","recovery_limit":"","default_price":"","name":"Solinca","photo":"","phone_number":"949494944","user":"0","email":"info@solinca.pt","session_duration":"","start_date":""}
260	bb6f3761-0976-47d8-b4d4-031ab79db509	3	3	2022-03-04 13:11:35.624208	1	2	6	{"gender":"other","weight":"","dislikes":"","injuries_conditions":"","age":"","client_id":"15","goals":"","height":"","likes":""}
268	401c8192-938f-48f5-b8e0-f0880f8b3d82	1	1	2022-03-04 13:16:12.107279	2	12	1	{"label":"Rent","value":"rent"}
256	7fd6ddeb-b962-4636-9e8c-212b61465629	3	3	2022-03-04 13:07:04.462641	2	5	28	{"billing_period":"","pay_day":"","sessions":"","status_id":"2","total_amount":"-400.0","created_at":"2022-03-04","description":"renda","provider_id":"1","client_id":"0"}
257	7d72029b-2351-493b-b4a9-4b14421d8564	1	1	2022-03-04 13:10:40.894722	1	11	3	{"text":"Bunda","value":"bunda"}
258	4dbbde1d-c8e3-4d78-aa2d-b88b3517b4f9	3	3	2022-03-04 13:11:00.750843	1	6	60	{"date":"2022-03-04","duration":"45","price":"0.3","type_id":"3","client_id":"14"}
261	e165d139-f656-47cb-a03e-172d155f3c80	3	3	2022-03-04 13:12:00.988871	2	1	15	{"sessions_per_month":"0","default_session_type_id":"0","recovery_key":"","recovery_limit":"","default_price":"12.5","name":"Solinca","photo":"","phone_number":"949494944","user":"0","email":"info@solinca.pt","session_duration":"30","start_date":""}
262	ab7e93b1-04a1-4e7e-a3d5-867b0a91a91b	3	3	2022-03-04 13:12:01.023833	2	2	6	{"gender":"other","weight":"0","dislikes":"","injuries_conditions":"","age":"0","client_id":"15","goals":"","height":"0","likes":""}
263	aaf8a072-829a-4fbf-8082-d2ff53ca0acd	3	3	2022-03-04 13:12:23.055956	2	1	15	{"sessions_per_month":"0","default_session_type_id":"3","recovery_key":"","recovery_limit":"","default_price":"12.5","name":"Solinca","photo":"","phone_number":"949494944","user":"0","email":"info@solinca.pt","session_duration":"30","start_date":""}
264	ff1e3e1d-f2ba-4a0a-a74c-bfa9eff2bf63	3	3	2022-03-04 13:12:23.117089	2	2	6	{"gender":"other","weight":"0","dislikes":"","injuries_conditions":"","age":"0","client_id":"15","goals":"","height":"0","likes":""}
265	4d2df61b-9e3f-4119-82c8-9baddf3890f3	3	3	2022-03-04 13:12:34.273291	1	6	61	{"date":"2022-03-04","duration":"30","price":"12.5","type_id":"3","client_id":"15"}
266	80ca2a02-bea3-42d5-bbbe-54e865f4ea9c	3	3	2022-03-04 13:12:44.835234	3	6	60	{"billing_period":"","date":"2022-03-04","code":"","gender":"","default_price":"","created_at":"","description":"","client_id":"14","session_duration":"","duration":"45","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"0","price":"0.3","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"","type_id":"3","vat":"","photo":"","weight":"","dislikes":"","label":"","default_session_type_id":"0","total_amount":"","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
267	0f4b4d7d-bf7a-46c1-8f62-87666a3de051	3	3	2022-03-04 13:13:06.614421	1	5	29	{"billing_period":"2022-03-01 - 2022-03-31","pay_day":"2022-03-31","sessions":"[61]","status_id":"1","total_amount":"12.5","created_at":"2022-03-04","description":"","provider_id":"0","client_id":"15"}
269	abc6d00e-7725-4e51-aaad-9d31351c225b	1	1	2022-03-04 17:55:36.698633	2	1	14	{"sessions_per_month":"4","default_session_type_id":"2","recovery_key":"","recovery_limit":"","default_price":"30.0","name":"Carlos Vitorino","photo":"","phone_number":"966466572","user":"0","email":"carlos.vitorino@sitana.pt","session_duration":"45","start_date":"2022-03-01"}
270	bd863272-bbb6-4292-a3dc-101b6a770c52	1	1	2022-03-04 17:55:36.731505	2	2	5	{"gender":"male","weight":"0","dislikes":"","injuries_conditions":"","age":"0","client_id":"14","goals":"Get fit","height":"0","likes":""}
271	5b015f4d-fe47-4a6c-aba9-a79c083c5bab	1	1	2022-03-04 18:29:09.962413	3	5	28	{"billing_period":"","date":"","code":"","gender":"","default_price":"","created_at":"2022-03-04","description":"renda","client_id":"0","session_duration":"","duration":"","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"2","price":"","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","label":"","paid_at":"2022-03-04","default_session_type_id":"0","total_amount":"-400.0","name":"","provider_id":"1","phone_number":"","injuries_conditions":"","user":"0","age":""}
272	18b5a02d-56f7-4232-80be-175b3862aa03	1	1	2022-03-04 18:29:09.976557	3	5	27	{"billing_period":"2022-03-01 - 2022-03-31","date":"","code":"","gender":"","default_price":"","created_at":"2022-03-04","description":"","client_id":"14","session_duration":"","duration":"","pay_day":"2022-03-31","recovery_key":"","recovery_limit":"","status_id":"1","price":"","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"[56,43,51,26,57]","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","label":"","paid_at":"2022-03-04","default_session_type_id":"0","total_amount":"1.5","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
273	81db22b2-4b5a-47be-a9fc-440a589c4c12	1	1	2022-03-04 18:29:09.990987	3	5	26	{"billing_period":"","date":"","code":"","gender":"","default_price":"","created_at":"2022-03-03","description":"21345","client_id":"0","session_duration":"","duration":"","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"2","price":"","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","label":"","paid_at":"2022-03-04","default_session_type_id":"0","total_amount":"-1312.0","name":"","provider_id":"4","phone_number":"","injuries_conditions":"","user":"0","age":""}
274	13efbcdf-c38f-4d64-9252-0c56126dbd67	1	1	2022-03-04 18:29:10.007597	3	5	4	{"billing_period":"","date":"","code":"","gender":"","default_price":"","created_at":"2022-03-02","description":"","client_id":"14","session_duration":"","duration":"","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"1","price":"","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"[56,52,54,53,43,47,48,51,26,55]","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","label":"","paid_at":"2022-03-04","default_session_type_id":"0","total_amount":"103.8","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
275	ac3a0ad3-a53e-4d99-bb24-85a83505ffac	1	1	2022-03-04 18:29:10.022524	3	5	5	{"billing_period":"","date":"","code":"","gender":"","default_price":"","created_at":"2022-03-02","description":"","client_id":"8","session_duration":"","duration":"","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"1","price":"","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"[56,52,54,53,43,47,48,51,26,55]","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","label":"","paid_at":"2022-03-04","default_session_type_id":"0","total_amount":"103.8","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
276	df6603fc-ea03-44a2-b6fa-0367439fbfcb	1	1	2022-03-04 18:29:10.043315	3	5	6	{"billing_period":"","date":"","code":"","gender":"","default_price":"","created_at":"2022-03-02","description":"","client_id":"14","session_duration":"","duration":"","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"1","price":"","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"[56,52,54,53,43,47,48,51,26,55]","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","label":"","paid_at":"2022-03-04","default_session_type_id":"0","total_amount":"103.8","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
299	0f05ce2a-0802-42b3-bf4a-8d607feacbbc	1	1	2022-03-04 18:30:59.891996	1	5	32	{"billing_period":"2022-02-01 - 2022-02-28","paid_at":"","pay_day":"2022-03-31","sessions":"[53,45,44,55,40,58,37]","status_id":"1","total_amount":"2.0999999046325684","created_at":"2022-03-04","description":"","provider_id":"0","client_id":"12"}
277	ea5d9bb9-6191-4bb9-a7af-3f4401fa11a2	1	1	2022-03-04 18:29:10.058625	3	5	7	{"billing_period":"2022-03-01 - 2022-03-24","date":"","code":"","gender":"","default_price":"","created_at":"2022-03-02","description":"","client_id":"12","session_duration":"","duration":"","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"1","price":"","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"[56,52,54,53,43,47,48,51,26,55]","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","label":"","paid_at":"2022-03-04","default_session_type_id":"0","total_amount":"103.8","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
278	441a7604-abf3-4167-8961-086e9b3a5747	1	1	2022-03-04 18:29:10.087181	3	5	8	{"billing_period":"2022-03-01 - 2022-03-23","date":"","code":"","gender":"","default_price":"","created_at":"2022-03-02","description":"","client_id":"14","session_duration":"","duration":"","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"1","price":"","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"[56,52,54,53,43,47,48,51,26,55]","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","label":"","paid_at":"2022-03-04","default_session_type_id":"0","total_amount":"103.8","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
279	a5baf2be-e522-4056-8891-cc79e4b317ee	1	1	2022-03-04 18:29:10.102229	3	5	9	{"billing_period":"2022-03-01 - 2022-03-31","date":"","code":"","gender":"","default_price":"","created_at":"2022-03-02","description":"","client_id":"12","session_duration":"","duration":"","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"1","price":"","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"[56,53,43,47,51,26,55]","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","label":"","paid_at":"2022-03-04","default_session_type_id":"0","total_amount":"27.3","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
280	0fff60bd-8cf5-4ac2-a68a-ea564de7f0c5	1	1	2022-03-04 18:29:10.114819	3	5	10	{"billing_period":"2022-03-01 - 2022-03-15","date":"","code":"","gender":"","default_price":"","created_at":"2022-03-02","description":"","client_id":"14","session_duration":"","duration":"","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"1","price":"","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"[56,52,54,53,43,47,55]","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","label":"","paid_at":"2022-03-04","default_session_type_id":"0","total_amount":"77.7","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
281	8fe18f75-3bd2-4e69-8654-ec5ed11d908c	1	1	2022-03-04 18:29:10.127406	3	5	11	{"billing_period":"2022-03-01 - 2022-03-31","date":"","code":"","gender":"","default_price":"","created_at":"2022-03-02","description":"","client_id":"12","session_duration":"","duration":"","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"1","price":"","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"[56,52,54,53,43,47,48,51,26,55]","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","label":"","paid_at":"2022-03-04","default_session_type_id":"0","total_amount":"103.8","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
282	a839446e-2edb-47fc-9c26-334c7ffefd58	1	1	2022-03-04 18:29:10.140591	3	5	12	{"billing_period":"2022-03-08 - 2022-03-30","date":"","code":"","gender":"","default_price":"","created_at":"","description":"","client_id":"14","session_duration":"","duration":"","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"2","price":"","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"[56,52,54,53,43,47,48,51,26,55]","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","label":"","paid_at":"2022-03-04","default_session_type_id":"0","total_amount":"103.8","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
283	9386c8f0-3ddf-48cf-b9ee-882922b22fe4	1	1	2022-03-04 18:29:10.153194	3	5	13	{"billing_period":"2022-03-08 - 2022-03-22","date":"","code":"","gender":"","default_price":"","created_at":"","description":"","client_id":"12","session_duration":"","duration":"","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"2","price":"","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"[56,52,54,53,43,47,48,51,26,55]","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","label":"","paid_at":"2022-03-04","default_session_type_id":"0","total_amount":"103.8","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
284	20b751e0-b423-4459-8575-eba5cd4870a4	1	1	2022-03-04 18:29:10.240714	3	5	14	{"billing_period":"2022-03-08 - 2022-03-15","date":"","code":"","gender":"","default_price":"","created_at":"2022-03-02","description":"","client_id":"12","session_duration":"","duration":"","pay_day":"2022-03-15","recovery_key":"","recovery_limit":"","status_id":"1","price":"","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"[56,52,54,53,43,47,48,51,26,55]","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","label":"","paid_at":"2022-03-04","default_session_type_id":"0","total_amount":"103.8","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
285	f4aea73e-f9d8-43a5-939f-86d268379fb5	1	1	2022-03-04 18:29:10.249343	3	5	15	{"billing_period":"2022-03-01 - 2022-03-15","date":"","code":"","gender":"","default_price":"","created_at":"2022-03-02","description":"","client_id":"12","session_duration":"","duration":"","pay_day":"2022-03-14","recovery_key":"","recovery_limit":"","status_id":"2","price":"","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"[56,52,54,53,43,47,48,51,26,55]","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","label":"","paid_at":"2022-03-04","default_session_type_id":"0","total_amount":"103.8","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
286	f14d9725-ba4c-43f6-a333-2a22b2d8571e	1	1	2022-03-04 18:29:10.260367	3	5	16	{"billing_period":"2022-03-01 - 2022-03-31","date":"","code":"","gender":"","default_price":"","created_at":"2022-03-02","description":"","client_id":"14","session_duration":"","duration":"","pay_day":"2022-03-14","recovery_key":"","recovery_limit":"","status_id":"1","price":"","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"[56,52,54,53,43,47,48,51,26,55]","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","label":"","paid_at":"2022-03-04","default_session_type_id":"0","total_amount":"103.8","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
300	3067059a-5e87-4a0c-add9-2997da6c7ede	1	1	2022-03-04 18:31:45.872025	1	6	62	{"date":"2022-03-04","duration":"30","price":"12.5","type_id":"3","client_id":"15"}
301	f84dd4f7-4061-47bf-9992-25de1c639c69	1	1	2022-03-04 18:31:45.888502	1	6	63	{"date":"2022-03-04","duration":"30","price":"12.5","type_id":"3","client_id":"15"}
302	59f89227-c4e9-45bf-92f2-547220d57933	1	1	2022-03-04 18:31:45.899919	1	6	64	{"date":"2022-03-04","duration":"30","price":"12.5","type_id":"3","client_id":"15"}
287	7f265a53-92d4-4ba0-ace3-a453c375a456	1	1	2022-03-04 18:29:10.269126	3	5	17	{"billing_period":"2022-03-01 - 2022-03-31","date":"","code":"","gender":"","default_price":"","created_at":"2022-03-03","description":"","client_id":"14","session_duration":"","duration":"","pay_day":"2022-04-30","recovery_key":"","recovery_limit":"","status_id":"1","price":"","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"[56,52,54,53,43,47,48,51,26,55]","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","label":"","paid_at":"2022-03-04","default_session_type_id":"0","total_amount":"103.8","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
288	f5b292d9-2259-4aba-ba85-f4b47880ea38	1	1	2022-03-04 18:29:10.277898	3	5	18	{"billing_period":"2022-03-01 - 2022-03-31","date":"","code":"","gender":"","default_price":"","created_at":"2022-03-03","description":"","client_id":"8","session_duration":"","duration":"","pay_day":"2022-03-31","recovery_key":"","recovery_limit":"","status_id":"1","price":"","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"[52,54,53]","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","label":"","paid_at":"2022-03-04","default_session_type_id":"0","total_amount":"51.3","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
289	b1cbf6f2-3365-4a5b-b205-65791ea0ab69	1	1	2022-03-04 18:29:10.285632	3	5	19	{"billing_period":"","date":"","code":"","gender":"","default_price":"","created_at":"2022-03-03","description":"lalala","client_id":"0","session_duration":"","duration":"","pay_day":"2022-03-03","recovery_key":"","recovery_limit":"","status_id":"2","price":"","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","label":"","paid_at":"2022-03-04","default_session_type_id":"0","total_amount":"400.0","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
290	975c527f-b7fb-4bdb-aeab-264cf1cfd843	1	1	2022-03-04 18:29:10.293426	3	5	20	{"billing_period":"","date":"","code":"","gender":"","default_price":"","created_at":"2022-03-03","description":"teste123","client_id":"0","session_duration":"","duration":"","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"2","price":"","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","label":"","paid_at":"2022-03-04","default_session_type_id":"0","total_amount":"140.0","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
291	9ced9b62-d7dc-4435-87b2-313105d7d9fe	1	1	2022-03-04 18:29:10.300775	3	5	21	{"billing_period":"","date":"","code":"","gender":"","default_price":"","created_at":"2022-03-03","description":"testeeee","client_id":"0","session_duration":"","duration":"","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"2","price":"","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","label":"","paid_at":"2022-03-04","default_session_type_id":"0","total_amount":"140.0","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
292	150db1bc-72e7-4246-8cec-c38d5007b316	1	1	2022-03-04 18:29:10.308724	3	5	22	{"billing_period":"","date":"","code":"","gender":"","default_price":"","created_at":"2022-03-03","description":"","client_id":"0","session_duration":"","duration":"","pay_day":"2022-03-03","recovery_key":"","recovery_limit":"","status_id":"0","price":"","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","label":"","paid_at":"2022-03-04","default_session_type_id":"0","total_amount":"0.0","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
293	3845c15f-6c79-41d1-956f-225994405de9	1	1	2022-03-04 18:29:10.316653	3	5	23	{"billing_period":"","date":"","code":"","gender":"","default_price":"","created_at":"2022-03-03","description":"","client_id":"0","session_duration":"","duration":"","pay_day":"2022-03-03","recovery_key":"","recovery_limit":"","status_id":"0","price":"","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","label":"","paid_at":"2022-03-04","default_session_type_id":"0","total_amount":"0.0","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
294	16a5230b-575a-4f1c-8731-9c43656a4b42	1	1	2022-03-04 18:29:10.325375	3	5	24	{"billing_period":"","date":"","code":"","gender":"","default_price":"","created_at":"2022-03-03","description":"","client_id":"0","session_duration":"","duration":"","pay_day":"2022-03-03","recovery_key":"","recovery_limit":"","status_id":"0","price":"","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","label":"","paid_at":"2022-03-04","default_session_type_id":"0","total_amount":"0.0","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
295	f9cfb716-05e4-4c26-a3d5-370e45b434d1	1	1	2022-03-04 18:29:10.334262	3	5	25	{"billing_period":"","date":"","code":"","gender":"","default_price":"","created_at":"2022-03-03","description":"","client_id":"0","session_duration":"","duration":"","pay_day":"2022-03-03","recovery_key":"","recovery_limit":"","status_id":"0","price":"","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","label":"","paid_at":"2022-03-04","default_session_type_id":"0","total_amount":"0.0","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
296	d5b20eac-c680-441a-bf26-e1168c5023f5	1	1	2022-03-04 18:29:23.39892	3	5	29	{"billing_period":"2022-03-01 - 2022-03-31","date":"","code":"","gender":"","default_price":"","created_at":"2022-03-04","description":"","client_id":"15","session_duration":"","duration":"","pay_day":"2022-03-31","recovery_key":"","recovery_limit":"","status_id":"1","price":"","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"[61]","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","label":"","paid_at":"2022-03-04","default_session_type_id":"0","total_amount":"12.5","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
297	e24c30fa-94a5-4e92-8413-9432bb803577	1	1	2022-03-04 18:29:46.727052	1	5	30	{"billing_period":"","paid_at":"","pay_day":"","sessions":"","status_id":"2","total_amount":"-400.0","created_at":"2022-03-04","description":"Renda","provider_id":"1","client_id":"0"}
298	ed244e4f-bce7-48c6-b511-e4a733c0df98	1	1	2022-03-04 18:30:10.65105	1	5	31	{"billing_period":"2022-02-01 - 2022-02-28","paid_at":"","pay_day":"2022-03-31","sessions":"[56,43,51,26,57]","status_id":"1","total_amount":"1.5","created_at":"2022-03-04","description":"","provider_id":"0","client_id":"14"}
303	46bb0c8f-703c-4106-8ea0-0f0115a4fd0b	1	1	2022-03-04 18:31:45.910925	1	6	65	{"date":"2022-03-04","duration":"30","price":"12.5","type_id":"3","client_id":"15"}
304	aa54665f-5948-45b3-880c-56524910b120	1	1	2022-03-04 18:32:12.180111	1	5	33	{"billing_period":"2022-02-01 - 2022-02-28","paid_at":"","pay_day":"2022-03-31","sessions":"[65,61,62,63,64]","status_id":"1","total_amount":"62.5","created_at":"2022-03-04","description":"","provider_id":"0","client_id":"14"}
305	6cf4b4cf-3b13-47a9-9db1-115e1a53df7a	1	1	2022-03-04 18:32:49.684351	1	5	34	{"billing_period":"2022-03-08 - 2022-03-24","paid_at":"","pay_day":"2022-03-15","sessions":"[54,52,59,46,47,48]","status_id":"1","total_amount":"153.0","created_at":"2022-03-04","description":"","provider_id":"0","client_id":"8"}
306	10d089a2-ae26-4cfe-ab33-4b0fd26bd73d	1	1	2022-03-04 18:33:01.463275	2	5	34	{"billing_period":"2022-03-08 - 2022-03-24","paid_at":"2022-03-04","pay_day":"2022-03-15","sessions":"[54,52,59,46,47,48]","status_id":"2","total_amount":"153.0","created_at":"2022-03-04","description":"","provider_id":"0","client_id":"8"}
307	6e4909ac-1427-4cae-9def-00dae94ae996	1	1	2022-03-04 18:33:07.229365	2	5	33	{"billing_period":"2022-02-01 - 2022-02-28","paid_at":"2022-03-04","pay_day":"2022-03-31","sessions":"[65,61,62,63,64]","status_id":"2","total_amount":"62.5","created_at":"2022-03-04","description":"","provider_id":"0","client_id":"14"}
308	656abf6e-57ba-4309-9490-508ea21d6f30	1	1	2022-03-04 19:32:42.226267	2	6	43	{"date":"2022-02-02","duration":"50","price":"0.3","type_id":"1","client_id":"14"}
309	22bb67a3-55d6-4fb1-a410-173cc6e80992	1	1	2022-03-04 19:32:58.47524	2	6	54	{"date":"2022-01-10","duration":"-1","price":"25.5","type_id":"1","client_id":"8"}
310	c413bb3b-0cc8-4d67-a657-c29ace042576	1	1	2022-03-04 19:33:05.612717	2	6	47	{"date":"2022-02-02","duration":"30","price":"25.5","type_id":"1","client_id":"8"}
311	7facbed3-65d1-4e8e-881e-969dd2f26148	1	1	2022-03-04 19:33:11.185928	2	6	47	{"date":"2022-01-02","duration":"30","price":"25.5","type_id":"1","client_id":"8"}
312	adc7a883-5b5e-4ddb-b174-d23632b9a220	1	1	2022-03-05 13:50:40.993453	1	5	35	{"billing_period":"","paid_at":"","pay_day":"","sessions":"","status_id":"2","total_amount":"-400.0","created_at":"2022-03-05","description":"Renda","provider_id":"1","client_id":"0"}
313	fc3f5b8a-423f-42b2-bf77-e0330fbb50cb	1	1	2022-03-05 13:50:58.851765	1	5	36	{"billing_period":"","paid_at":"","pay_day":"","sessions":"","status_id":"2","total_amount":"-50.0","created_at":"2022-03-05","description":"Training","provider_id":"2","client_id":"0"}
314	40a545b7-6643-41c8-88dd-b0414022523d	1	1	2022-03-05 13:51:14.593134	1	5	37	{"billing_period":"","paid_at":"","pay_day":"","sessions":"","status_id":"2","total_amount":"-100.0","created_at":"2022-03-05","description":"Canto","provider_id":"3","client_id":"0"}
315	6f19bd75-7982-4d42-9200-564528750c82	1	1	2022-03-05 13:53:38.220661	1	5	38	{"billing_period":"","paid_at":"","pay_day":"","sessions":"","status_id":"2","total_amount":"-400.0","created_at":"2022-03-05","description":"dwf","provider_id":"2","client_id":"0"}
316	ed14ee20-fbd8-4615-99e2-8a1826f9f9bf	1	1	2022-03-05 13:56:12.853522	1	5	39	{"billing_period":"","paid_at":"2022-02-01","pay_day":"","sessions":"","status_id":"2","total_amount":"-123.0","created_at":"2022-03-05","description":"teste123","provider_id":"2","client_id":"0"}
317	acd5fa67-b62d-4ba5-9232-2512d02030d0	1	1	2022-03-05 13:58:13.102431	3	5	39	{"billing_period":"","date":"","code":"","gender":"","default_price":"","created_at":"2022-03-05","description":"teste123","client_id":"0","session_duration":"","duration":"","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"2","price":"","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","label":"","paid_at":"2022-02-01","default_session_type_id":"0","total_amount":"-123.0","name":"","provider_id":"2","phone_number":"","injuries_conditions":"","user":"0","age":""}
318	36b6ead4-9a9e-4935-8a8f-ad2171b370fd	1	1	2022-03-05 13:58:13.12156	3	5	38	{"billing_period":"","date":"","code":"","gender":"","default_price":"","created_at":"2022-03-05","description":"dwf","client_id":"0","session_duration":"","duration":"","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"2","price":"","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","label":"","paid_at":"","default_session_type_id":"0","total_amount":"-400.0","name":"","provider_id":"2","phone_number":"","injuries_conditions":"","user":"0","age":""}
319	07371974-3f2a-4624-836f-ec1a19e8d749	1	1	2022-03-05 13:58:13.138634	3	5	37	{"billing_period":"","date":"","code":"","gender":"","default_price":"","created_at":"2022-03-05","description":"Canto","client_id":"0","session_duration":"","duration":"","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"2","price":"","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","label":"","paid_at":"","default_session_type_id":"0","total_amount":"-100.0","name":"","provider_id":"3","phone_number":"","injuries_conditions":"","user":"0","age":""}
320	e4cbd185-1021-47a3-88c3-0008f4ce952e	1	1	2022-03-05 13:58:13.152247	3	5	36	{"billing_period":"","date":"","code":"","gender":"","default_price":"","created_at":"2022-03-05","description":"Training","client_id":"0","session_duration":"","duration":"","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"2","price":"","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","label":"","paid_at":"","default_session_type_id":"0","total_amount":"-50.0","name":"","provider_id":"2","phone_number":"","injuries_conditions":"","user":"0","age":""}
321	1cc980e8-5eca-4109-b210-17854aa8c378	1	1	2022-03-05 13:58:13.169576	3	5	35	{"billing_period":"","date":"","code":"","gender":"","default_price":"","created_at":"2022-03-05","description":"Renda","client_id":"0","session_duration":"","duration":"","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"2","price":"","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","label":"","paid_at":"","default_session_type_id":"0","total_amount":"-400.0","name":"","provider_id":"1","phone_number":"","injuries_conditions":"","user":"0","age":""}
322	5090f475-1e55-4451-b084-26a4e19c1145	1	1	2022-03-05 13:58:13.18257	3	5	30	{"billing_period":"","date":"","code":"","gender":"","default_price":"","created_at":"2022-03-04","description":"Renda","client_id":"0","session_duration":"","duration":"","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"2","price":"","legal_name":"","text":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","label":"","paid_at":"","default_session_type_id":"0","total_amount":"-400.0","name":"","provider_id":"1","phone_number":"","injuries_conditions":"","user":"0","age":""}
323	65528bab-41e9-470a-9542-29974b685c65	1	1	2022-03-05 13:58:37.979027	1	5	40	{"billing_period":"","paid_at":"2022-03-01","pay_day":"","sessions":"","status_id":"2","total_amount":"-400.0","created_at":"2022-03-05","description":"Renda","provider_id":"1","client_id":"0"}
324	6f3b850a-69ba-4e1b-8e05-a717b1c3b898	1	1	2022-03-05 13:58:52.139768	1	5	41	{"billing_period":"","paid_at":"2022-02-01","pay_day":"","sessions":"","status_id":"2","total_amount":"-400.0","created_at":"2022-03-05","description":"Renda","provider_id":"1","client_id":"0"}
325	72a93ead-b8bc-4f6d-af88-ed4d4f7331b1	1	1	2022-03-05 13:59:08.898166	1	5	42	{"billing_period":"","paid_at":"2022-01-01","pay_day":"","sessions":"","status_id":"2","total_amount":"-200.0","created_at":"2022-03-05","description":"Renda","provider_id":"1","client_id":"0"}
326	dabf33a0-425b-479a-9044-37ad38ee6f09	1	1	2022-03-05 14:00:03.618369	1	5	43	{"billing_period":"","paid_at":"2022-02-01","pay_day":"","sessions":"","status_id":"2","total_amount":"-50.0","created_at":"2022-03-05","description":"","provider_id":"2","client_id":"0"}
327	437893ac-ab97-4abd-bc08-ee68827a75de	1	1	2022-03-05 14:00:17.844968	1	5	44	{"billing_period":"","paid_at":"2021-12-15","pay_day":"","sessions":"","status_id":"2","total_amount":"-70.0","created_at":"2022-03-05","description":"","provider_id":"3","client_id":"0"}
328	978f935b-ef79-4dcd-b33b-7f2e2b8a27e1	1	1	2022-03-05 16:07:38.413818	2	11	3	{"text":"Group Class","value":"group_class"}
329	ba280f8e-c568-49cb-be01-eef0158b041b	1	1	2022-03-05 16:07:51.049581	1	10	1	{"type_id":"3","text":"Bunda","value":"bunda"}
330	be02fbf9-4a68-4e0e-8c5a-18fd41b9c0ab	1	1	2022-03-05 16:08:13.640437	1	10	2	{"type_id":"3","text":"Body Balance","value":"body_balance"}
331	b6baa3d5-b2fc-4741-a65e-e5c02f642049	1	1	2022-03-05 16:09:46.489438	1	10	3	{"type_id":"2","text":"General","value":"general"}
332	c2b26d1b-301a-40a6-893a-fe5640fdaa39	1	1	2022-03-05 16:10:38.972438	1	10	4	{"type_id":"2","text":"Test Preparation","value":"test_preparation"}
333	7a36561f-e8b4-444d-886c-13badcdddb10	1	1	2022-03-05 16:11:04.958779	1	10	5	{"type_id":"1","text":"Gym","value":"gym"}
334	8940d1bd-66bf-466c-bdf7-152be04c67a5	1	1	2022-03-05 16:11:15.374074	1	10	6	{"type_id":"1","text":"Online","value":"online"}
335	1b483d82-f54f-4cf7-86f2-222b5df088ce	1	1	2022-03-05 16:11:27.755921	1	10	7	{"type_id":"1","text":"Outdoor","value":"outdoor"}
336	73c53ad7-7bd3-45fa-9978-ce21eacde32d	1	1	2022-03-05 16:58:19.756572	1	1	16	{"sessions_per_month":"3","default_price":"30.0","photo":"","default_session_sub_type_id":"6","session_duration":"45","default_session_type_id":"1","recovery_key":"","recovery_limit":"","name":"Maria","phone_number":"964324322","user":"0","email":"maria@gmail.com","start_date":"2022-03-05"}
337	056a2c22-2cef-4ffd-9973-8253b4307ab2	1	1	2022-03-05 16:58:19.796205	1	2	7	{"gender":"male","weight":"","dislikes":"","injuries_conditions":"","age":"","client_id":"16","goals":"","height":"","likes":""}
338	4dcddf56-a73a-4c4c-addc-8922e5481f3a	1	1	2022-03-05 17:40:06.230082	1	6	66	{"date":"2022-03-05","duration":"45","price":"0.3","type_id":"3","sub_type_id":"0","client_id":"14"}
339	e9792d71-8430-41af-9c2b-4dd7a4523e35	1	1	2022-03-05 17:40:06.246405	1	6	67	{"date":"2022-03-05","duration":"45","price":"0.3","type_id":"0","sub_type_id":"0","client_id":"16"}
340	3f7cb201-cf33-4b86-81c9-068d6cce328b	1	1	2022-03-05 17:44:19.444092	1	6	68	{"date":"2022-03-05","duration":"45","price":"0.3","type_id":"0","sub_type_id":"0","client_id":"16"}
341	d99bc8d8-894c-4775-a3ff-d511831aefe9	1	1	2022-03-05 17:49:31.270995	1	6	70	{"date":"2022-03-05","duration":"45","price":"0.3","type_id":"0","sub_type_id":"0","client_id":"16"}
342	4ab39bc2-78b0-467b-8565-09922b543a25	1	1	2022-03-05 17:50:22.234202	1	6	71	{"date":"2022-03-05","duration":"45","price":"0.3","type_id":"3","sub_type_id":"1","client_id":"14"}
343	83ee1e44-c4ce-4874-bec3-217257ba8cb8	1	1	2022-03-05 17:54:15.548375	1	6	72	{"date":"2022-03-05","duration":"45","price":"0.3","type_id":"0","sub_type_id":"0","client_id":"16"}
344	14ba4bc1-027e-46ec-8808-992beb25c3ba	1	1	2022-03-05 17:55:39.390559	1	6	73	{"date":"2022-03-05","duration":"45","price":"0.3","type_id":"1","sub_type_id":"6","client_id":"16"}
345	d8843785-9c2f-4843-89b6-45e3886859cb	1	1	2022-03-05 18:06:51.584561	1	6	74	{"date":"2022-03-05","duration":"45","price":"0.3","type_id":"2","sub_type_id":"4","client_id":"16"}
346	934d1c7b-0637-4f8e-b081-e214f933f248	1	1	2022-03-05 18:08:22.79106	1	6	75	{"date":"2022-03-05","duration":"45","price":"0.3","type_id":"2","sub_type_id":"3","client_id":"16"}
347	1b05ce82-1442-4d46-8643-2183933741ef	1	1	2022-03-05 18:11:03.280882	1	6	76	{"date":"2022-03-05","duration":"45","price":"0.3","type_id":"1","sub_type_id":"6","client_id":"16"}
348	7e602c22-423b-4ac6-b45a-63d46ae50a2c	1	1	2022-03-05 18:11:35.250912	1	6	77	{"date":"2022-03-05","duration":"45","price":"30.1","type_id":"1","sub_type_id":"6","client_id":"16"}
349	f43e5215-f7dc-4d02-adeb-dd8fdcb2a12c	1	1	2022-03-05 18:12:56.600917	1	6	78	{"date":"2022-03-05","duration":"45","price":"0.3","type_id":"1","sub_type_id":"6","client_id":"16"}
350	8545a3f7-9bbb-4e00-8a90-5ab03d002ff2	1	1	2022-03-05 18:14:29.379546	1	6	79	{"date":"2022-03-05","duration":"45","price":"30.00","type_id":"1","sub_type_id":"6","client_id":"16"}
351	c8248433-585e-4db0-9302-1e71b2a24ba7	1	1	2022-03-05 18:23:51.451677	2	1	12	{"sessions_per_month":"0","default_price":"30.0","photo":"","default_session_sub_type_id":"7","session_duration":"59","default_session_type_id":"1","recovery_key":"","recovery_limit":"","name":"Tiina R.","phone_number":"9543545454","user":"0","email":"tiina.rinatamaeki@gmail.com","start_date":"2022-02-26"}
352	ba26e325-5ea0-4186-8e70-2c5c34e47fa5	1	1	2022-03-05 18:23:51.50964	2	2	4	{"gender":"female","weight":"-0.01","dislikes":"dsadsada","injuries_conditions":"dsadsa","age":"30","client_id":"12","goals":"2313231","height":"-0.01","likes":"dasdadas"}
353	609b2aba-61aa-4dc2-90f9-1d5d5cb4ce34	1	1	2022-03-05 18:24:02.681255	2	1	8	{"sessions_per_month":"1","default_price":"25.5","photo":"","default_session_sub_type_id":"2","session_duration":"40","default_session_type_id":"3","recovery_key":"","recovery_limit":"","name":"teste baltas","phone_number":"9645439534","user":"0","email":"teste@teste.pt","start_date":"2022-02-02"}
354	d0b2d60e-c763-4856-8ce1-b80154173243	1	1	2022-03-05 18:24:02.695263	2	2	3	{"gender":"male","weight":"-0.01","dislikes":"wewqeqw","injuries_conditions":"asdf","age":"35","client_id":"8","goals":"wqeweqw","height":"0.01","likes":"ewqewqeqw"}
355	41beb2df-5167-4a07-a767-9c4b00ebfc6d	1	1	2022-03-05 18:24:18.784912	2	1	14	{"sessions_per_month":"4","default_price":"30.0","photo":"","default_session_sub_type_id":"3","session_duration":"45","default_session_type_id":"2","recovery_key":"","recovery_limit":"","name":"Carlos Vitorino","phone_number":"966466572","user":"0","email":"carlos.vitorino@sitana.pt","start_date":"2022-03-01"}
356	fb4bc3cf-3fbf-4062-8c14-65dd48197b4b	1	1	2022-03-05 18:24:18.821004	2	2	5	{"gender":"male","weight":"0","dislikes":"","injuries_conditions":"","age":"0","client_id":"14","goals":"Get fit","height":"0","likes":""}
357	07d28568-fa80-4b06-bc68-ab3d6b8584e4	1	1	2022-03-05 18:24:55.333198	2	1	15	{"sessions_per_month":"0","default_price":"12.5","photo":"","default_session_sub_type_id":"1","session_duration":"30","default_session_type_id":"3","recovery_key":"","recovery_limit":"","name":"Solinca","phone_number":"949494944","user":"0","email":"info@solinca.pt","start_date":""}
358	d33ec3bd-df78-4c5f-973d-b7a73a1a6e92	1	1	2022-03-05 18:24:55.357759	2	2	6	{"gender":"other","weight":"0","dislikes":"","injuries_conditions":"","age":"0","client_id":"15","goals":"","height":"0","likes":""}
359	fe078d19-c29d-40d2-93a0-5ab604d6e2bd	1	1	2022-03-05 18:25:14.91746	2	1	8	{"sessions_per_month":"1","default_price":"25.5","photo":"","default_session_sub_type_id":"4","session_duration":"40","default_session_type_id":"2","recovery_key":"","recovery_limit":"","name":"teste baltas","phone_number":"9645439534","user":"0","email":"teste@teste.pt","start_date":"2022-02-02"}
360	ec0c2f0b-8780-48b0-8ef6-c2385c3a7cfa	1	1	2022-03-05 18:25:14.941554	2	2	3	{"gender":"male","weight":"-0.01","dislikes":"wewqeqw","injuries_conditions":"asdf","age":"35","client_id":"8","goals":"wqeweqw","height":"-0.01","likes":"ewqewqeqw"}
361	2376f571-11e1-4b53-b182-db2d51e160dd	1	1	2022-03-05 18:25:44.755619	1	5	45	{"billing_period":"2022-03-01 - 2022-03-31","paid_at":"","pay_day":"2022-03-31","sessions":"[74,79,78,77,76,73,75]","status_id":"1","total_amount":"61.599998474121094","created_at":"2022-03-05","description":"","provider_id":"0","client_id":"16"}
450	b47d73b5-5e0d-4864-8aed-21decfcdff4e	1	1	2022-03-09 20:12:41.256607	2	11	1	{"client_user_id":"5","label":"Fitness","value":"fitness"}
451	542bd5c0-a4ab-4876-9acf-52f87fbb8cd1	1	1	2022-03-09 20:12:45.443173	2	11	2	{"client_user_id":"5","label":"German","value":"german"}
362	bb455fbe-ea64-4a73-9979-72c5c6125744	1	1	2022-03-05 18:25:55.201985	2	5	45	{"billing_period":"2022-03-01 - 2022-03-31","paid_at":"2022-03-05","pay_day":"2022-03-31","sessions":"[74,79,78,77,76,73,75]","status_id":"2","total_amount":"61.6","created_at":"2022-03-05","description":"","provider_id":"0","client_id":"16"}
363	8659171f-97e4-4dcc-bf98-c44a8812ef71	1	1	2022-03-05 18:26:17.383305	1	5	46	{"billing_period":"","paid_at":"2022-03-31","pay_day":"","sessions":"","status_id":"2","total_amount":"-69.0","created_at":"2022-03-05","description":"Cenas Pessoais","provider_id":"3","client_id":"0"}
364	2ea8ca0a-3e16-4b6c-ab00-6dc6a757a131	1	1	2022-03-05 18:48:30.945403	2	6	66	{"date":"2022-03-05","duration":"45","price":"0.3","type_id":"3","sub_type_id":"7","client_id":"14"}
365	78bfc09d-cc95-4b51-8ae5-5aeb689f6661	1	1	2022-03-05 18:49:54.503793	3	6	34	{"billing_period":"","date":"2022-03-02","code":"","gender":"","default_price":"","created_at":"","description":"","client_id":"0","session_duration":"","duration":"0","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"0","price":"0","legal_name":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","label":"","default_session_sub_type_id":"0","paid_at":"","default_session_type_id":"0","total_amount":"","sub_type_id":"0","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
366	309205b7-9d58-4878-b9e5-28789a492e93	1	1	2022-03-05 18:49:54.516361	3	6	36	{"billing_period":"","date":"2022-03-02","code":"","gender":"","default_price":"","created_at":"","description":"","client_id":"0","session_duration":"","duration":"0","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"0","price":"0","legal_name":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","label":"","default_session_sub_type_id":"0","paid_at":"","default_session_type_id":"0","total_amount":"","sub_type_id":"0","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
367	c2b9f586-02f1-4db9-873a-8ef293bdf94d	1	1	2022-03-05 18:50:02.454502	2	6	26	{"date":"2022-03-02","duration":"45","price":"0.3","type_id":"1","sub_type_id":"5","client_id":"14"}
368	5f7f202f-44f8-458a-9db0-1488fa0757de	1	1	2022-03-05 18:50:18.351494	3	6	67	{"billing_period":"","date":"2022-03-05","code":"","gender":"","default_price":"","created_at":"","description":"","client_id":"16","session_duration":"","duration":"45","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"0","price":"0.3","legal_name":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","label":"","default_session_sub_type_id":"0","paid_at":"","default_session_type_id":"0","total_amount":"","sub_type_id":"0","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
369	7d7b1290-0653-466a-986f-eea3c96d6a07	1	1	2022-03-05 18:50:18.362523	3	6	65	{"billing_period":"","date":"2022-03-04","code":"","gender":"","default_price":"","created_at":"","description":"","client_id":"15","session_duration":"","duration":"30","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"0","price":"12.5","legal_name":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"","type_id":"3","vat":"","photo":"","weight":"","dislikes":"","label":"","default_session_sub_type_id":"0","paid_at":"","default_session_type_id":"0","total_amount":"","sub_type_id":"0","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
370	11dccee0-89f6-4d90-968c-aad52884f97e	1	1	2022-03-05 18:50:18.374133	3	6	66	{"billing_period":"","date":"2022-03-05","code":"","gender":"","default_price":"","created_at":"","description":"","client_id":"14","session_duration":"","duration":"45","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"0","price":"0.3","legal_name":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"","type_id":"3","vat":"","photo":"","weight":"","dislikes":"","label":"","default_session_sub_type_id":"0","paid_at":"","default_session_type_id":"0","total_amount":"","sub_type_id":"7","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
371	7010e17f-b556-41bf-8acf-90532f33e9b8	1	1	2022-03-05 18:50:18.38604	3	6	64	{"billing_period":"","date":"2022-03-04","code":"","gender":"","default_price":"","created_at":"","description":"","client_id":"15","session_duration":"","duration":"30","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"0","price":"12.5","legal_name":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"","type_id":"3","vat":"","photo":"","weight":"","dislikes":"","label":"","default_session_sub_type_id":"0","paid_at":"","default_session_type_id":"0","total_amount":"","sub_type_id":"0","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
372	1f1df626-965d-45a1-bada-49fa730a409d	1	1	2022-03-05 18:50:18.40083	3	6	26	{"billing_period":"","date":"2022-03-02","code":"","gender":"","default_price":"","created_at":"","description":"","client_id":"14","session_duration":"","duration":"45","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"0","price":"0.3","legal_name":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"","type_id":"1","vat":"","photo":"","weight":"","dislikes":"","label":"","default_session_sub_type_id":"0","paid_at":"","default_session_type_id":"0","total_amount":"","sub_type_id":"5","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
373	b502f5d5-55e6-4f8d-84ab-267b0d293716	1	1	2022-03-05 18:50:18.419008	3	6	37	{"billing_period":"","date":"2022-03-02","code":"","gender":"","default_price":"","created_at":"","description":"","client_id":"12","session_duration":"","duration":"59","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"0","price":"0.3","legal_name":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"","type_id":"1","vat":"","photo":"","weight":"","dislikes":"","label":"","default_session_sub_type_id":"0","paid_at":"","default_session_type_id":"0","total_amount":"","sub_type_id":"0","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
374	dd4e3e58-3116-4e48-a076-175312969ee2	1	1	2022-03-05 18:50:18.431546	3	6	40	{"billing_period":"","date":"2022-03-02","code":"","gender":"","default_price":"","created_at":"","description":"","client_id":"12","session_duration":"","duration":"10","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"0","price":"0.3","legal_name":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"","type_id":"1","vat":"","photo":"","weight":"","dislikes":"","label":"","default_session_sub_type_id":"0","paid_at":"","default_session_type_id":"0","total_amount":"","sub_type_id":"0","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
375	34cfb1e8-3c9b-4c7d-b841-d53cd73d0221	1	1	2022-03-05 18:50:18.479781	3	6	43	{"billing_period":"","date":"2022-02-02","code":"","gender":"","default_price":"","created_at":"","description":"","client_id":"14","session_duration":"","duration":"50","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"0","price":"0.3","legal_name":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"","type_id":"1","vat":"","photo":"","weight":"","dislikes":"","label":"","default_session_sub_type_id":"0","paid_at":"","default_session_type_id":"0","total_amount":"","sub_type_id":"0","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
376	a26cff5b-2f0d-4d3e-abd0-1c0f971f8e77	1	1	2022-03-05 18:50:18.493972	3	6	44	{"billing_period":"","date":"2022-03-02","code":"","gender":"","default_price":"","created_at":"","description":"","client_id":"12","session_duration":"","duration":"60","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"0","price":"0.3","legal_name":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"","type_id":"1","vat":"","photo":"","weight":"","dislikes":"","label":"","default_session_sub_type_id":"0","paid_at":"","default_session_type_id":"0","total_amount":"","sub_type_id":"0","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
377	f1b81c8e-b5b4-499d-8421-3af9adee75c7	1	1	2022-03-05 18:50:18.50446	3	6	45	{"billing_period":"","date":"2022-03-02","code":"","gender":"","default_price":"","created_at":"","description":"","client_id":"12","session_duration":"","duration":"59","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"0","price":"0.3","legal_name":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"","type_id":"1","vat":"","photo":"","weight":"","dislikes":"","label":"","default_session_sub_type_id":"0","paid_at":"","default_session_type_id":"0","total_amount":"","sub_type_id":"0","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
378	827b5722-7dab-4746-889d-7220990db3ac	1	1	2022-03-05 18:50:18.516617	3	6	46	{"billing_period":"","date":"2022-03-02","code":"","gender":"","default_price":"","created_at":"","description":"","client_id":"8","session_duration":"","duration":"30","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"0","price":"25.5","legal_name":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"","type_id":"2","vat":"","photo":"","weight":"","dislikes":"","label":"","default_session_sub_type_id":"0","paid_at":"","default_session_type_id":"0","total_amount":"","sub_type_id":"0","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
379	b9daa8a6-613d-4308-b1fc-12d4ffa1f7ed	1	1	2022-03-05 18:50:18.528892	3	6	47	{"billing_period":"","date":"2022-01-02","code":"","gender":"","default_price":"","created_at":"","description":"","client_id":"8","session_duration":"","duration":"30","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"0","price":"25.5","legal_name":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"","type_id":"1","vat":"","photo":"","weight":"","dislikes":"","label":"","default_session_sub_type_id":"0","paid_at":"","default_session_type_id":"0","total_amount":"","sub_type_id":"0","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
380	85094a02-0a1a-44aa-b0f9-58e6c1d2ff23	1	1	2022-03-05 18:50:18.537896	3	6	48	{"billing_period":"","date":"2022-03-02","code":"","gender":"","default_price":"","created_at":"","description":"","client_id":"8","session_duration":"","duration":"-1","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"0","price":"25.5","legal_name":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"","type_id":"1","vat":"","photo":"","weight":"","dislikes":"","label":"","default_session_sub_type_id":"0","paid_at":"","default_session_type_id":"0","total_amount":"","sub_type_id":"0","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
381	d7ca7daa-e1b2-42b7-97f1-0d93caf7dab5	1	1	2022-03-05 18:50:18.548519	3	6	51	{"billing_period":"","date":"2022-03-02","code":"","gender":"","default_price":"","created_at":"","description":"","client_id":"14","session_duration":"","duration":"45","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"0","price":"0.3","legal_name":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"","type_id":"2","vat":"","photo":"","weight":"","dislikes":"","label":"","default_session_sub_type_id":"0","paid_at":"","default_session_type_id":"0","total_amount":"","sub_type_id":"0","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
382	8eec1a4b-ea58-484e-9bf3-32282fd8497f	1	1	2022-03-05 18:50:18.569686	3	6	52	{"billing_period":"","date":"2022-03-10","code":"","gender":"","default_price":"","created_at":"","description":"","client_id":"8","session_duration":"","duration":"-1","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"0","price":"25.5","legal_name":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"","type_id":"1","vat":"","photo":"","weight":"","dislikes":"","label":"","default_session_sub_type_id":"0","paid_at":"","default_session_type_id":"0","total_amount":"","sub_type_id":"0","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
383	c5b428e9-59fd-444c-9a79-a9ebc3c66d74	1	1	2022-03-05 18:50:18.583528	3	6	53	{"billing_period":"","date":"2022-03-05","code":"","gender":"","default_price":"","created_at":"","description":"","client_id":"12","session_duration":"","duration":"59","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"0","price":"0.3","legal_name":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"","type_id":"1","vat":"","photo":"","weight":"","dislikes":"","label":"","default_session_sub_type_id":"0","paid_at":"","default_session_type_id":"0","total_amount":"","sub_type_id":"0","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
384	be1cc600-fb53-43f2-ad2f-4e226cf5952d	1	1	2022-03-05 18:50:18.594538	3	6	54	{"billing_period":"","date":"2022-01-10","code":"","gender":"","default_price":"","created_at":"","description":"","client_id":"8","session_duration":"","duration":"-1","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"0","price":"25.5","legal_name":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"","type_id":"1","vat":"","photo":"","weight":"","dislikes":"","label":"","default_session_sub_type_id":"0","paid_at":"","default_session_type_id":"0","total_amount":"","sub_type_id":"0","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
385	a3250d68-1212-4056-b113-18d4be12dead	1	1	2022-03-05 18:50:18.604757	3	6	55	{"billing_period":"","date":"2022-03-02","code":"","gender":"","default_price":"","created_at":"","description":"","client_id":"12","session_duration":"","duration":"89","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"0","price":"0.3","legal_name":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"","type_id":"1","vat":"","photo":"","weight":"","dislikes":"","label":"","default_session_sub_type_id":"0","paid_at":"","default_session_type_id":"0","total_amount":"","sub_type_id":"0","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
386	8520dd70-cf57-4d2c-90b8-2fdbaac4524a	1	1	2022-03-05 18:50:18.616081	3	6	56	{"billing_period":"","date":"2022-03-24","code":"","gender":"","default_price":"","created_at":"","description":"","client_id":"14","session_duration":"","duration":"45","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"0","price":"0.3","legal_name":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"","type_id":"1","vat":"","photo":"","weight":"","dislikes":"","label":"","default_session_sub_type_id":"0","paid_at":"","default_session_type_id":"0","total_amount":"","sub_type_id":"0","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
387	e413efd1-f1de-4933-9154-9f0a891896ce	1	1	2022-03-05 18:50:18.625601	3	6	57	{"billing_period":"","date":"2022-03-02","code":"","gender":"","default_price":"","created_at":"","description":"","client_id":"14","session_duration":"","duration":"45","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"0","price":"0.3","legal_name":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"","type_id":"2","vat":"","photo":"","weight":"","dislikes":"","label":"","default_session_sub_type_id":"0","paid_at":"","default_session_type_id":"0","total_amount":"","sub_type_id":"0","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
388	df8954ee-f69c-4daa-97d7-56606f4b084d	1	1	2022-03-05 18:50:18.633762	3	6	58	{"billing_period":"","date":"2022-03-02","code":"","gender":"","default_price":"","created_at":"","description":"","client_id":"12","session_duration":"","duration":"59","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"0","price":"0.3","legal_name":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"","type_id":"1","vat":"","photo":"","weight":"","dislikes":"","label":"","default_session_sub_type_id":"0","paid_at":"","default_session_type_id":"0","total_amount":"","sub_type_id":"0","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
389	546272f7-3197-4509-8f77-adc40573fdc0	1	1	2022-03-05 18:50:18.642555	3	6	59	{"billing_period":"","date":"2022-03-02","code":"","gender":"","default_price":"","created_at":"","description":"","client_id":"8","session_duration":"","duration":"-1","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"0","price":"25.5","legal_name":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"","type_id":"1","vat":"","photo":"","weight":"","dislikes":"","label":"","default_session_sub_type_id":"0","paid_at":"","default_session_type_id":"0","total_amount":"","sub_type_id":"0","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
390	a268546b-6b33-43ea-a88f-b327fc22a784	1	1	2022-03-05 18:50:18.650757	3	6	61	{"billing_period":"","date":"2022-03-04","code":"","gender":"","default_price":"","created_at":"","description":"","client_id":"15","session_duration":"","duration":"30","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"0","price":"12.5","legal_name":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"","type_id":"3","vat":"","photo":"","weight":"","dislikes":"","label":"","default_session_sub_type_id":"0","paid_at":"","default_session_type_id":"0","total_amount":"","sub_type_id":"0","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
391	729191a8-6ee5-4288-aab1-7cf5d2b65714	1	1	2022-03-05 18:50:18.65909	3	6	62	{"billing_period":"","date":"2022-03-04","code":"","gender":"","default_price":"","created_at":"","description":"","client_id":"15","session_duration":"","duration":"30","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"0","price":"12.5","legal_name":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"","type_id":"3","vat":"","photo":"","weight":"","dislikes":"","label":"","default_session_sub_type_id":"0","paid_at":"","default_session_type_id":"0","total_amount":"","sub_type_id":"0","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
392	abd71f4f-a1b7-4932-84b7-5fda180acbca	1	1	2022-03-05 18:50:18.666878	3	6	63	{"billing_period":"","date":"2022-03-04","code":"","gender":"","default_price":"","created_at":"","description":"","client_id":"15","session_duration":"","duration":"30","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"0","price":"12.5","legal_name":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"","type_id":"3","vat":"","photo":"","weight":"","dislikes":"","label":"","default_session_sub_type_id":"0","paid_at":"","default_session_type_id":"0","total_amount":"","sub_type_id":"0","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
396	6ef2cd52-e6f5-4917-8041-564d950bd8e2	1	1	2022-03-05 18:56:51.763598	1	6	80	{"date":"2022-02-10","duration":"59","price":"30.00","type_id":"1","sub_type_id":"7","client_id":"12"}
397	ee8d79c9-7b3d-47bb-ab7f-0b7c170518ea	1	1	2022-03-05 18:56:51.774571	1	6	81	{"date":"2022-03-05","duration":"59","price":"30.00","type_id":"1","sub_type_id":"7","client_id":"12"}
398	e9393b69-752b-4b6b-a145-7343b7e18388	1	1	2022-03-05 18:56:51.785351	1	6	82	{"date":"2022-03-05","duration":"45","price":"30.00","type_id":"2","sub_type_id":"3","client_id":"14"}
399	76bf7a1f-6813-46fd-90cd-b4db85e666ed	1	1	2022-03-05 18:56:51.795613	1	6	83	{"date":"2022-01-13","duration":"59","price":"30.00","type_id":"1","sub_type_id":"7","client_id":"12"}
400	cf31908e-059e-437c-8360-a53520e90706	1	1	2022-03-05 18:56:51.805643	1	6	84	{"date":"2022-02-05","duration":"45","price":"30.00","type_id":"2","sub_type_id":"3","client_id":"14"}
393	bb49f902-0b8d-40f8-bd27-471b4b21027a	1	1	2022-03-05 18:50:40.61233	3	6	72	{"billing_period":"","date":"2022-03-05","code":"","gender":"","default_price":"","created_at":"","description":"","client_id":"16","session_duration":"","duration":"45","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"0","price":"0.3","legal_name":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","label":"","default_session_sub_type_id":"0","paid_at":"","default_session_type_id":"0","total_amount":"","sub_type_id":"0","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
394	5d66e872-f34d-4187-aa41-b210a155b285	1	1	2022-03-05 18:50:40.628291	3	6	70	{"billing_period":"","date":"2022-03-05","code":"","gender":"","default_price":"","created_at":"","description":"","client_id":"16","session_duration":"","duration":"45","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"0","price":"0.3","legal_name":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","label":"","default_session_sub_type_id":"0","paid_at":"","default_session_type_id":"0","total_amount":"","sub_type_id":"0","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
395	326114b5-a25a-4f0c-b0e3-8acecf080c37	1	1	2022-03-05 18:50:40.640364	3	6	69	{"billing_period":"","date":"2022-03-05","code":"","gender":"","default_price":"","created_at":"","description":"","client_id":"0","session_duration":"","duration":"0","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"0","price":"0.0","legal_name":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","label":"","default_session_sub_type_id":"0","paid_at":"","default_session_type_id":"0","total_amount":"","sub_type_id":"0","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
401	9545015c-074e-486a-b8aa-93814787ca60	1	1	2022-03-05 19:20:37.352126	2	6	74	{"date":"2022-03-05","duration":"45","price":"0.3","type_id":"2","sub_type_id":"4","client_id":"16"}
402	0106fc2f-dcc0-4c17-8230-24cc0899195d	1	1	2022-03-05 19:21:01.807303	2	6	68	{"date":"2022-03-05","duration":"45","price":"0.3","type_id":"3","sub_type_id":"2","client_id":"16"}
403	d73c9598-066c-4349-a0f7-3f5290c49ddb	1	1	2022-03-05 19:21:57.909908	2	6	74	{"date":"2022-03-05","duration":"45","price":"0.3","type_id":"2","sub_type_id":"4","client_id":"16"}
404	7b9008c9-08cb-4327-9320-66ca0153fc8b	1	1	2022-03-05 19:28:42.126145	1	6	85	{"date":"2022-03-05","duration":"45","price":"40.00","type_id":"2","sub_type_id":"4","client_id":"14"}
405	1a3b5cef-55af-485f-ad04-0cd529d568a8	1	1	2022-03-05 20:32:58.0167	1	4	1	{"website":"www.berlitz.pt","phone":"21 352 0123","name":"Berlitz","vat":"508486068","legal_name":"LISBER, LDA","email":"lisboa@berlitz.pt"}
406	fa2da49d-a35e-4e18-a4c8-7a1ce551cc5a	3	3	2022-03-05 20:55:15.466349	1	5	47	{"billing_period":"2022-03-01 - 2022-03-05","paid_at":"","pay_day":"2022-03-31","sessions":"[77,78]","status_id":"2","company_id":"1","total_amount":"60.099998474121094","created_at":"2022-03-05","description":"","provider_id":"0","client_id":"0"}
407	e3394d0c-88ef-4403-910b-e69824c368cc	3	3	2022-03-05 21:00:50.835636	1	5	48	{"billing_period":"","paid_at":"2022-03-01","pay_day":"","sessions":"","status_id":"2","company_id":"1","total_amount":"-500.0","created_at":"2022-03-05","description":"compras","provider_id":"0","client_id":"0"}
408	cf050e69-660e-486f-b88a-8bb65d520c85	1	1	2022-03-05 21:27:47.348092	1	4	2	{"website":"","phone":"","name":"Solinca","vat":"","legal_name":"Sonae","email":""}
409	785a415c-ded5-442c-b63a-e819ed5a800b	1	1	2022-03-05 21:27:57.501836	2	5	40	{"billing_period":"","paid_at":"2022-03-01","pay_day":"2022-03-05","sessions":"","status_id":"2","company_id":"2","total_amount":"400.0","created_at":"2022-03-05","description":"Renda","provider_id":"1","client_id":"0"}
410	80dd66de-e208-4ebd-b24d-71b992bbc798	1	1	2022-03-05 21:28:04.798177	2	5	40	{"billing_period":"","paid_at":"2022-03-01","pay_day":"2022-03-05","sessions":"","status_id":"2","company_id":"2","total_amount":"400.0","created_at":"2022-03-05","description":"Renda","provider_id":"1","client_id":"0"}
411	d1a0bd0f-caf8-4145-bb37-b259da2705da	1	1	2022-03-05 21:28:22.797089	2	5	41	{"billing_period":"","paid_at":"2022-02-01","pay_day":"2022-03-05","sessions":"","status_id":"2","company_id":"2","total_amount":"400.0","created_at":"2022-03-05","description":"Renda","provider_id":"1","client_id":"0"}
412	e03ab4a7-f84b-40a7-a48c-b8470c60dc00	1	1	2022-03-05 21:28:28.16801	2	5	42	{"billing_period":"","paid_at":"2022-01-01","pay_day":"2022-03-05","sessions":"","status_id":"2","company_id":"2","total_amount":"200.0","created_at":"2022-03-05","description":"Renda","provider_id":"1","client_id":"0"}
413	afb9c3b4-f903-41d9-9900-0249ce5081ca	1	1	2022-03-05 21:28:49.516666	1	4	3	{"website":"","phone":"","name":"Other","vat":"","legal_name":"","email":""}
414	2789cc03-9885-4f0b-9fe6-165cd5b6158a	1	1	2022-03-05 21:29:09.226545	2	5	43	{"billing_period":"","paid_at":"2022-02-01","pay_day":"2022-03-05","sessions":"","status_id":"2","company_id":"3","total_amount":"50.0","created_at":"2022-03-05","description":"","provider_id":"2","client_id":"0"}
415	3684fffd-d8f4-4db3-bc17-2f90faf76bf4	1	1	2022-03-05 21:29:24.029627	2	5	44	{"billing_period":"","paid_at":"2021-12-15","pay_day":"2022-03-05","sessions":"","status_id":"2","company_id":"0","total_amount":"70.0","created_at":"2022-03-05","description":"","provider_id":"3","client_id":"8"}
416	1f7e7506-cdd5-47f5-b87a-f69beecf7eea	1	1	2022-03-05 21:29:47.653569	3	5	46	{"billing_period":"","date":"","code":"","gender":"","default_price":"","created_at":"2022-03-05","description":"Cenas Pessoais","client_id":"16","session_duration":"","duration":"","pay_day":"2022-03-05","recovery_key":"","recovery_limit":"","status_id":"2","price":"","legal_name":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"","website":"","company_id":"0","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","label":"","default_session_sub_type_id":"0","paid_at":"2022-03-31","default_session_type_id":"0","phone":"","total_amount":"69.0","sub_type_id":"0","name":"","provider_id":"3","phone_number":"","injuries_conditions":"","user":"0","age":""}
417	c5732684-40fd-47bf-a37c-4ec38d89b97a	1	1	2022-03-05 21:30:13.056955	3	5	44	{"billing_period":"","date":"","code":"","gender":"","default_price":"","created_at":"2022-03-05","description":"","client_id":"8","session_duration":"","duration":"","pay_day":"2022-03-05","recovery_key":"","recovery_limit":"","status_id":"2","price":"","legal_name":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"","website":"","company_id":"0","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","label":"","default_session_sub_type_id":"0","paid_at":"2021-12-15","default_session_type_id":"0","phone":"","total_amount":"70.0","sub_type_id":"0","name":"","provider_id":"3","phone_number":"","injuries_conditions":"","user":"0","age":""}
446	a808fd7a-6c4e-4887-a54e-7028294fcdc8	3	3	2022-03-09 16:22:16.057156	2	5	48	{"billing_period":"","paid_at":"2022-03-09","pay_day":"","sessions":"","status_id":"2","company_id":"1","total_amount":"-500.0","created_at":"2022-03-05","description":"compras","provider_id":"0","client_id":"0"}
452	6bcf47e2-ce26-423e-b66a-12bc7d6c07a7	1	1	2022-03-09 20:12:49.425909	2	11	3	{"client_user_id":"5","label":"Group Class","value":"group_class"}
418	4b7e2b72-c35f-44d8-8a8f-4e6630b25aaf	1	1	2022-03-05 21:31:20.340964	3	5	40	{"billing_period":"","date":"","code":"","gender":"","default_price":"","created_at":"2022-03-05","description":"Renda","client_id":"0","session_duration":"","duration":"","pay_day":"2022-03-05","recovery_key":"","recovery_limit":"","status_id":"2","price":"","legal_name":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"","website":"","company_id":"2","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","label":"","default_session_sub_type_id":"0","paid_at":"2022-03-01","default_session_type_id":"0","phone":"","total_amount":"400.0","sub_type_id":"0","name":"","provider_id":"1","phone_number":"","injuries_conditions":"","user":"0","age":""}
419	19c582b9-6a1c-437c-a45f-e69469623f4c	1	1	2022-03-05 21:31:20.355282	3	5	42	{"billing_period":"","date":"","code":"","gender":"","default_price":"","created_at":"2022-03-05","description":"Renda","client_id":"0","session_duration":"","duration":"","pay_day":"2022-03-05","recovery_key":"","recovery_limit":"","status_id":"2","price":"","legal_name":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"","website":"","company_id":"2","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","label":"","default_session_sub_type_id":"0","paid_at":"2022-01-01","default_session_type_id":"0","phone":"","total_amount":"200.0","sub_type_id":"0","name":"","provider_id":"1","phone_number":"","injuries_conditions":"","user":"0","age":""}
420	d2bcb5b6-adc1-49c3-acea-eea9e7458938	1	1	2022-03-05 21:31:20.370441	3	5	41	{"billing_period":"","date":"","code":"","gender":"","default_price":"","created_at":"2022-03-05","description":"Renda","client_id":"0","session_duration":"","duration":"","pay_day":"2022-03-05","recovery_key":"","recovery_limit":"","status_id":"2","price":"","legal_name":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"","website":"","company_id":"2","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","label":"","default_session_sub_type_id":"0","paid_at":"2022-02-01","default_session_type_id":"0","phone":"","total_amount":"400.0","sub_type_id":"0","name":"","provider_id":"1","phone_number":"","injuries_conditions":"","user":"0","age":""}
421	4879598a-6e9d-400e-85fb-e18f24f462c3	3	3	2022-03-05 21:31:38.930582	1	5	49	{"billing_period":"","paid_at":"2022-03-01","pay_day":"","sessions":"","status_id":"2","company_id":"2","total_amount":"-400.0","created_at":"2022-03-05","description":"renda","provider_id":"0","client_id":"0"}
422	9dc82a56-b33f-4a20-a725-c773dab3fe7d	3	3	2022-03-05 21:31:51.868608	1	5	50	{"billing_period":"","paid_at":"2022-02-01","pay_day":"","sessions":"","status_id":"2","company_id":"2","total_amount":"-400.0","created_at":"2022-03-05","description":"renda","provider_id":"0","client_id":"0"}
423	66f57ab5-6346-40ea-b34e-fd083083285e	3	3	2022-03-05 21:32:14.704974	1	5	51	{"billing_period":"","paid_at":"2022-01-01","pay_day":"","sessions":"","status_id":"2","company_id":"2","total_amount":"-400.0","created_at":"2022-03-05","description":"renda","provider_id":"0","client_id":"0"}
424	df8040c4-a614-42bc-a021-043a452d18a0	3	3	2022-03-05 21:35:35.425869	2	5	34	{"billing_period":"2022-03-08 - 2022-03-24","paid_at":"2022-03-04","pay_day":"2022-03-15","sessions":"[54,52,59,46,47,48]","status_id":"1","company_id":"0","total_amount":"153.0","created_at":"2022-03-04","description":"","provider_id":"0","client_id":"8"}
425	1d03c7aa-0a1e-4da9-a407-3024a509d56a	3	3	2022-03-05 21:35:40.217612	2	5	31	{"billing_period":"2022-02-01 - 2022-02-28","paid_at":"2022-03-05","pay_day":"2022-03-31","sessions":"[56,43,51,26,57]","status_id":"2","company_id":"0","total_amount":"1.5","created_at":"2022-03-04","description":"","provider_id":"0","client_id":"14"}
426	ed492929-51d4-42ce-92dc-09a506b966b0	3	3	2022-03-05 21:36:04.106872	2	5	34	{"billing_period":"2022-03-08 - 2022-03-24","paid_at":"2022-03-05","pay_day":"2022-03-15","sessions":"[54,52,59,46,47,48]","status_id":"2","company_id":"0","total_amount":"153.0","created_at":"2022-03-04","description":"","provider_id":"0","client_id":"8"}
427	9f164320-3c12-4db1-bccb-2d8c24675eec	1	1	2022-03-05 21:36:56.300452	3	5	34	{"billing_period":"2022-03-08 - 2022-03-24","date":"","code":"","gender":"","default_price":"","created_at":"2022-03-04","description":"","client_id":"8","session_duration":"","duration":"","pay_day":"2022-03-15","recovery_key":"","recovery_limit":"","status_id":"2","price":"","legal_name":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"[54,52,59,46,47,48]","website":"","company_id":"0","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","label":"","default_session_sub_type_id":"0","paid_at":"2022-03-05","default_session_type_id":"0","phone":"","total_amount":"153.0","sub_type_id":"0","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
429	0516d410-ee23-4111-8ac7-2114872a1552	3	3	2022-03-05 21:48:19.514426	1	5	52	{"billing_period":"2022-03-01 - 2022-03-05","paid_at":"","pay_day":"2022-03-31","sessions":"[68,77,78,79,73,74,75,76]","status_id":"2","company_id":"2","total_amount":"240.10000610351562","created_at":"2022-03-05","description":"","provider_id":"0","client_id":"0"}
428	9fab9147-0aad-448f-a41b-6a501ef3ffd1	1	1	2022-03-05 21:42:16.207848	3	5	47	{"billing_period":"2022-03-01 - 2022-03-05","date":"","code":"","gender":"","default_price":"","created_at":"2022-03-05","description":"","client_id":"0","session_duration":"","duration":"","pay_day":"2022-03-31","recovery_key":"","recovery_limit":"","status_id":"2","price":"","legal_name":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"[77,78]","website":"","company_id":"1","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","label":"","default_session_sub_type_id":"0","paid_at":"2022-03-05","default_session_type_id":"0","phone":"","total_amount":"60.1","sub_type_id":"0","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
430	631b5fea-4b1d-43ee-8dca-1f08aaaf344e	3	3	2022-03-05 21:49:55.531326	1	5	53	{"billing_period":"2022-03-02 - 2022-03-03","paid_at":"","pay_day":"2022-03-06","sessions":"[85]","status_id":"1","company_id":"0","total_amount":"40.0","created_at":"2022-03-05","description":"","provider_id":"0","client_id":"14"}
431	2769cee5-5cee-4af7-b06e-f576704ebd4e	3	3	2022-03-05 21:51:01.806376	1	5	54	{"billing_period":"2022-03-01 - 2022-03-31","paid_at":"","pay_day":"2022-03-13","sessions":"[85,71,82,84]","status_id":"1","company_id":"0","total_amount":"130.0","created_at":"2022-03-05","description":"","provider_id":"0","client_id":"14"}
432	921e4aff-5080-454f-a9e4-5e12c4a2cae2	3	3	2022-03-05 21:51:42.021755	1	5	55	{"billing_period":"2022-03-30 - 2022-03-31","paid_at":"","pay_day":"2022-03-14","sessions":"[68,77,78,79,73,74,75,76]","status_id":"2","company_id":"3","total_amount":"240.10000610351562","created_at":"2022-03-05","description":"","provider_id":"0","client_id":"0"}
433	9036658e-9516-407a-96ed-bddc93c11187	3	3	2022-03-05 21:53:15.474223	1	5	56	{"billing_period":"2022-03-01 - 2022-03-05","paid_at":"","pay_day":"2022-03-01","sessions":"[81,68]","status_id":"1","company_id":"3","total_amount":"60.0","created_at":"2022-03-05","description":"","provider_id":"0","client_id":"0"}
434	3e6cf2e2-d331-4761-81cd-8e7b58b41776	3	3	2022-03-05 21:53:39.86725	2	5	54	{"billing_period":"2022-03-01 - 2022-03-31","paid_at":"2022-03-05","pay_day":"2022-03-13","sessions":"[85,71,82,84]","status_id":"2","company_id":"0","total_amount":"130.0","created_at":"2022-03-05","description":"","provider_id":"0","client_id":"14"}
435	d3f631c9-888e-4a32-b213-50347f5d2d2e	1	1	2022-03-05 21:55:02.840035	3	2	6	{"billing_period":"","date":"","code":"","gender":"other","default_price":"","created_at":"","description":"","client_id":"15","session_duration":"","duration":"","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"0","price":"","legal_name":"","value":"","email":"","goals":"","height":"00","likes":"","start_date":"","sessions_per_month":"","sessions":"","website":"","company_id":"0","type_id":"0","vat":"","photo":"","weight":"00","dislikes":"","label":"","default_session_sub_type_id":"0","paid_at":"","default_session_type_id":"0","phone":"","total_amount":"","sub_type_id":"0","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":"0"}
436	a5643866-ca29-4527-96e6-b9f1fc002992	1	1	2022-03-05 21:55:09.652245	3	1	15	{"billing_period":"","date":"","code":"","gender":"","default_price":"12.5","created_at":"","description":"","client_id":"0","session_duration":"30","duration":"","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"0","price":"","legal_name":"","value":"","email":"info@solinca.pt","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"0","sessions":"","website":"","company_id":"0","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","label":"","default_session_sub_type_id":"1","paid_at":"","default_session_type_id":"3","phone":"","total_amount":"","sub_type_id":"0","name":"Solinca","provider_id":"0","phone_number":"949494944","injuries_conditions":"","user":"0","age":""}
437	b1ae0ae3-e8bd-4b5c-95e2-31301ed26aee	3	3	2022-03-07 15:47:13.972891	3	5	31	{"billing_period":"2022-02-01 - 2022-02-28","date":"","code":"","gender":"","default_price":"","created_at":"2022-03-04","description":"","client_id":"14","session_duration":"","duration":"","pay_day":"2022-03-31","recovery_key":"","recovery_limit":"","status_id":"2","price":"","legal_name":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"[56,43,51,26,57]","website":"","company_id":"0","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","label":"","default_session_sub_type_id":"0","paid_at":"2022-03-05","default_session_type_id":"0","phone":"","total_amount":"1.5","sub_type_id":"0","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
438	a2aefe49-d4a9-42d9-912a-4b193abeff8d	3	3	2022-03-07 15:47:19.859889	3	5	32	{"billing_period":"2022-02-01 - 2022-02-28","date":"","code":"","gender":"","default_price":"","created_at":"2022-03-04","description":"","client_id":"12","session_duration":"","duration":"","pay_day":"2022-03-31","recovery_key":"","recovery_limit":"","status_id":"1","price":"","legal_name":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"[53,45,44,55,40,58,37]","website":"","company_id":"0","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","label":"","default_session_sub_type_id":"0","paid_at":"","default_session_type_id":"0","phone":"","total_amount":"2.1","sub_type_id":"0","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
439	f92c1b6e-9f5d-4610-8792-073d02386aca	3	3	2022-03-07 16:41:50.369497	2	1	8	{"sessions_per_month":"1","default_price":"25.5","photo":"","default_session_sub_type_id":"4","session_duration":"40","default_session_type_id":"2","recovery_key":"","recovery_limit":"","name":"teste baltas","phone_number":"9645439534","user":"0","email":"teste@teste.pt","start_date":"2022-02-02"}
440	b8f888a2-12ea-4724-a052-26abf6df5440	3	3	2022-03-07 16:41:54.703726	2	1	8	{"sessions_per_month":"1","default_price":"25.5","photo":"","default_session_sub_type_id":"4","session_duration":"40","default_session_type_id":"2","recovery_key":"","recovery_limit":"","name":"teste baltas","phone_number":"9645439534","user":"0","email":"teste@teste.pt","start_date":"2022-02-02"}
441	e3b381de-373e-4317-9036-203f88e42e6c	1	1	2022-03-07 17:16:17.08974	1	6	86	{"date":"2022-03-07","duration":"40","price":"25.50","type_id":"2","sub_type_id":"4","client_id":"8"}
442	8008e489-7aec-4d05-b540-1a3e8e16895f	1	1	2022-03-07 17:16:32.344341	1	5	57	{"billing_period":"2022-03-01 - 2022-03-02","paid_at":"","pay_day":"2022-03-05","sessions":"[86]","status_id":"1","company_id":"0","total_amount":"25.5","created_at":"2022-03-07","description":"","provider_id":"0","client_id":"8"}
443	1367fdc6-4c8e-4bbc-8f1c-21f819677487	3	3	2022-03-09 15:05:04.129424	2	5	57	{"billing_period":"2022-03-01 - 2022-03-02","paid_at":"2022-03-09","pay_day":"2022-03-05","sessions":"[86]","status_id":"2","company_id":"0","total_amount":"25.5","created_at":"2022-03-07","description":"","provider_id":"0","client_id":"8"}
444	e0925753-0315-4cb7-a6ef-422100953d8a	3	3	2022-03-09 15:05:11.648304	2	5	57	{"billing_period":"2022-03-01 - 2022-03-02","paid_at":"2022-03-09","pay_day":"2022-03-05","sessions":"[86]","status_id":"1","company_id":"0","total_amount":"25.5","created_at":"2022-03-07","description":"","provider_id":"0","client_id":"8"}
445	e104bf99-dbdc-4126-bf8a-58df82e94064	3	3	2022-03-09 16:22:08.830093	2	5	48	{"billing_period":"","paid_at":"2022-03-01","pay_day":"","sessions":"","status_id":"1","company_id":"1","total_amount":"-500.0","created_at":"2022-03-05","description":"compras","provider_id":"0","client_id":"0"}
447	ea6039b6-6f50-4a79-b9e6-24814bb7a8be	1	1	2022-03-09 19:39:46.52186	1	6	87	{"date":"2022-03-01","duration":"45","price":"30.00","type_id":"2","sub_type_id":"3","client_id":"14"}
453	acb31f53-497f-41ff-93a3-40310c0bd200	1	1	2022-03-09 20:12:56.711353	2	10	1	{"client_user_id":"5","type_id":"3","label":"Bunda","value":"bunda"}
454	a2e872fc-3eef-4c6b-a5c5-210100b82b56	5	3	2022-03-09 20:13:51.727814	1	1	17	{"sessions_per_month":"4","client_user_id":"5","default_price":"25.0","photo":"","default_session_sub_type_id":"5","session_duration":"50","default_session_type_id":"1","recovery_key":"","recovery_limit":"","name":"Maria atleta","phone_number":"99494949","user":"0","email":"maria.atleta@tester.pt","start_date":"2022-03-01"}
455	18ef9a99-9fa6-4d02-9ac0-803e4201ad31	5	3	2022-03-09 20:13:51.796233	1	2	8	{"gender":"female","client_user_id":"5","weight":"","dislikes":"rewrew","injuries_conditions":"rewrew","age":"24","client_id":"17","goals":"tewrewr","height":"","likes":"rwrew"}
456	9ce4f0d9-21f9-4aea-8b6c-ae65ef7576e4	5	3	2022-03-09 20:34:53.00416	1	1	18	{"sessions_per_month":"2","client_user_id":"5","default_price":"20.0","photo":"","default_session_sub_type_id":"1","session_duration":"40","default_session_type_id":"3","recovery_key":"","recovery_limit":"","name":"Z\\u00E9 Emanuel da Silva","phone_number":"32131231","user":"0","email":"zemanel@email.pt","start_date":"2022-01-01"}
457	35b72797-0cc0-4699-a76e-47dcd09fe76a	5	3	2022-03-09 20:34:53.071834	1	2	9	{"gender":"other","client_user_id":"5","weight":"","dislikes":"","injuries_conditions":"","age":"40","client_id":"18","goals":"","height":"","likes":""}
458	ff974487-b160-451b-be9f-39fea9b47bfd	5	3	2022-03-09 20:35:11.299811	1	6	88	{"date":"2022-03-09","duration":"40","client_user_id":"5","price":"20.00","type_id":"3","sub_type_id":"1","client_id":"18"}
459	966b6c60-bf75-4339-b6ea-641adecf485c	5	3	2022-03-09 20:35:11.32191	1	6	89	{"date":"2022-03-09","duration":"50","client_user_id":"5","price":"25.00","type_id":"1","sub_type_id":"5","client_id":"17"}
460	72517c39-f32d-44f5-ae7d-619309892e14	5	3	2022-03-09 20:38:18.499801	1	5	58	{"billing_period":"2022-03-01 - 2022-03-05","paid_at":"","pay_day":"2022-03-01","sessions":"[88,89]","status_id":"1","company_id":"0","client_user_id":"5","total_amount":"45.0","created_at":"2022-03-09","description":"","provider_id":"0","client_id":"17"}
461	dfc02161-fefc-4f03-af02-6cbe789e1e8f	5	3	2022-03-09 20:40:26.348898	2	5	58	{"billing_period":"2022-03-01 - 2022-03-05","paid_at":"2022-03-09","pay_day":"2022-03-01","sessions":"[88,89]","status_id":"2","company_id":"0","client_user_id":"5","total_amount":"45.0","created_at":"2022-03-09","description":"","provider_id":"0","client_id":"17"}
462	42ed7ac1-c5c4-4cdd-8c09-7784f498f4bd	5	3	2022-03-09 20:40:30.388036	3	5	58	{"billing_period":"2022-03-01 - 2022-03-05","date":"","code":"","gender":"","default_price":"","created_at":"2022-03-09","description":"","client_id":"17","session_duration":"","duration":"","pay_day":"2022-03-01","recovery_key":"","recovery_limit":"","status_id":"2","price":"","legal_name":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"[88,89]","website":"","company_id":"0","client_user_id":"5","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","label":"","default_session_sub_type_id":"0","paid_at":"2022-03-09","default_session_type_id":"0","phone":"","total_amount":"45.0","sub_type_id":"0","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
463	17bf2be0-4882-4271-aaa9-05dc6f5e47a3	5	3	2022-03-09 20:40:51.366731	1	1	19	{"sessions_per_month":"","client_user_id":"5","default_price":"","photo":"","default_session_sub_type_id":"0","session_duration":"","default_session_type_id":"0","recovery_key":"","recovery_limit":"","name":"wqewqeq","phone_number":"2312321","user":"0","email":"eqwewq@wqewq.pt","start_date":""}
464	5205d35b-b7a8-49b2-b9af-3a53d96625b8	5	3	2022-03-09 20:40:51.404353	1	2	10	{"gender":"","client_user_id":"5","weight":"","dislikes":"","injuries_conditions":"","age":"","client_id":"19","goals":"","height":"","likes":""}
465	8093c977-7657-4670-81c3-45ea38675b62	5	3	2022-03-09 20:50:24.678545	1	5	59	{"billing_period":"2022-02-01 - 2022-03-01","paid_at":"","pay_day":"2022-03-01","sessions":"[89]","status_id":"1","company_id":"0","client_user_id":"5","total_amount":"25.0","created_at":"2022-03-09","description":"","provider_id":"0","client_id":"17"}
466	3c3b9b32-1ef5-4039-ba67-5baf8ccae901	5	3	2022-03-09 20:50:43.937029	1	5	60	{"billing_period":"2022-03-01 - 2022-03-05","paid_at":"","pay_day":"2022-03-01","sessions":"[88]","status_id":"1","company_id":"0","client_user_id":"5","total_amount":"20.0","created_at":"2022-03-09","description":"","provider_id":"0","client_id":"18"}
467	75eb3809-28a0-4353-b292-d5f39fbdd550	5	3	2022-03-09 20:51:48.01362	1	5	61	{"billing_period":"","paid_at":"2022-03-01","pay_day":"","sessions":"","status_id":"2","company_id":"2","client_user_id":"5","total_amount":"-100.0","created_at":"2022-03-09","description":"Renda","provider_id":"0","client_id":"0"}
468	4335289e-ddbd-451b-bf0d-87b18b33549a	5	3	2022-03-09 20:52:42.037638	1	13	3	{"recovery_key":"","recovery_limit":"","client_user_id":"6"}
469	6a4930d6-165b-4e40-a1cc-233966f37ec3	6	3	2022-03-10 14:54:49.7368	1	1	20	{"sessions_per_month":"4","client_user_id":"6","default_price":"50.0","photo":"","default_session_sub_type_id":"0","session_duration":"30","default_session_type_id":"0","recovery_key":"","recovery_limit":"","name":"Carlos VItorino","phone_number":"966466572","user":"0","email":"carlos.duartv@gmail.com","start_date":"2022-01-01"}
470	49504397-d562-434d-af01-41f3d261f592	6	3	2022-03-10 14:54:49.785394	1	2	11	{"gender":"","client_user_id":"6","weight":"","dislikes":"","injuries_conditions":"","age":"","client_id":"20","goals":"","height":"","likes":""}
471	53fa8b47-0172-49ef-beb9-a1b423372aad	6	3	2022-03-10 18:42:31.726042	1	6	90	{"date":"2022-03-10","duration":"30","client_user_id":"6","price":"50.00","type_id":"0","sub_type_id":"0","client_id":"20"}
472	decd02f3-4148-49e9-8981-ea4300444eaf	6	3	2022-03-10 18:43:07.709215	1	6	91	{"date":"2022-03-10","duration":"30","client_user_id":"6","price":"50.00","type_id":"0","sub_type_id":"0","client_id":"20"}
473	b3f576fc-a458-44c5-a14d-20efc6e7ec95	6	3	2022-03-10 18:45:59.420547	1	5	62	{"billing_period":"2022-03-01 - 2022-03-10","paid_at":"","pay_day":"2022-03-31","sessions":"[90,91]","status_id":"1","company_id":"0","client_user_id":"6","total_amount":"100.0","created_at":"2022-03-10","description":"","provider_id":"0","client_id":"20"}
474	b5ac0c39-c086-4562-8aeb-576c10ca3cfe	1	1	2022-03-10 19:54:00.854377	1	4	4	{"website":"","client_user_id":"1","phone":"","name":"","vat":"","legal_name":"","email":""}
475	34be6771-8806-479d-9a11-422b08abfa99	1	1	2022-03-10 19:54:23.034725	1	4	5	{"website":"","client_user_id":"1","phone":"","name":"","vat":"","legal_name":"","email":""}
476	a4c58d1b-154b-40a4-bf5f-7ac0a7793552	1	1	2022-03-10 19:54:23.44416	1	4	6	{"website":"","client_user_id":"1","phone":"","name":"","vat":"","legal_name":"","email":""}
477	a3acfbc2-4abf-4820-9557-67684ce94098	1	1	2022-03-10 19:58:47.678019	3	4	6	{"billing_period":"","date":"","code":"","gender":"","default_price":"","created_at":"","description":"","client_id":"0","session_duration":"","duration":"","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"0","price":"","legal_name":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"","website":"","company_id":"0","client_user_id":"1","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","label":"","default_session_sub_type_id":"0","paid_at":"","default_session_type_id":"0","phone":"","total_amount":"","sub_type_id":"0","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
519	62252129-a8b8-41ca-a0d0-9175c613afe7	5	3	2022-03-12 12:30:31.69108	1	6	94	{"date":"2022-03-12","duration":"40","client_user_id":"5","price":"20.00","type_id":"3","sub_type_id":"1","client_id":"18"}
478	3c123dd4-adcc-42a2-a373-c74961835be8	1	1	2022-03-10 19:58:47.709783	3	4	5	{"billing_period":"","date":"","code":"","gender":"","default_price":"","created_at":"","description":"","client_id":"0","session_duration":"","duration":"","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"0","price":"","legal_name":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"","website":"","company_id":"0","client_user_id":"1","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","label":"","default_session_sub_type_id":"0","paid_at":"","default_session_type_id":"0","phone":"","total_amount":"","sub_type_id":"0","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
479	415f5636-18c8-41c2-9e63-55b9328e8359	1	1	2022-03-10 19:58:47.724718	3	4	4	{"billing_period":"","date":"","code":"","gender":"","default_price":"","created_at":"","description":"","client_id":"0","session_duration":"","duration":"","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"0","price":"","legal_name":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"","website":"","company_id":"0","client_user_id":"1","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","label":"","default_session_sub_type_id":"0","paid_at":"","default_session_type_id":"0","phone":"","total_amount":"","sub_type_id":"0","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
480	158ee05f-79f1-4511-a68b-1bbeaa98cf98	1	1	2022-03-10 19:59:05.823732	1	4	7	{"website":"www.decatlhon.pt","client_user_id":"1","phone":"2321312321","name":"Decatlhon","vat":"231231","legal_name":"Decatlhon","email":""}
481	e6ae9cbb-314a-4b68-8354-bc0fa1dc8acf	1	1	2022-03-10 19:59:22.43493	1	4	8	{"website":"www.zezito.pt","client_user_id":"1","phone":"2321312321","name":"Z\\u00E9 da esquina","vat":"231231","legal_name":"bla","email":""}
482	21a0bfb2-621e-4619-8069-b0cde74b6146	6	3	2022-03-10 23:05:51.510158	1	13	4	{"recovery_key":"","recovery_limit":"","client_user_id":"7"}
483	e56f2ff3-99c7-439f-9a8f-9a724def18be	1	1	2022-03-11 19:10:24.121454	2	11	1	{"client_user_id":"5","description":"Fitness private classes","label":"Fitness","value":"fitness"}
484	83e0b232-0b11-4cc6-a9b5-8edb17b8b818	1	1	2022-03-11 19:10:48.086464	2	11	2	{"client_user_id":"5","description":"German Language Class","label":"German","value":"german"}
485	b3250b9a-5090-4fc7-9db0-147b88d95b85	1	1	2022-03-11 19:11:11.355695	2	11	3	{"client_user_id":"5","description":"Group Class Fitness","label":"Group Class","value":"group_class"}
486	a056fd55-4c86-4bea-92df-4b2242e4fadc	1	1	2022-03-11 19:11:28.415768	2	11	1	{"client_user_id":"5","description":"Fitness private class","label":"Fitness","value":"fitness"}
487	f20296f6-2475-4b46-a676-293f18046b2b	0	0	2022-03-11 19:45:16.078772	1	4	9	{"website":"","client_user_id":"0","phone":"","name":"Decathlon","vat":"","legal_name":"","email":""}
488	13a20743-cd60-4d55-adbd-de187fb0d16c	0	0	2022-03-11 19:45:31.862796	1	4	10	{"website":"","client_user_id":"0","phone":"","name":"Decathlon","vat":"","legal_name":"","email":""}
489	5755857b-3fba-48d5-a2c7-c31f798409fe	1	1	2022-03-11 19:46:32.7465	3	4	10	{"billing_period":"","date":"","code":"","gender":"","default_price":"","created_at":"","description":"","client_id":"0","session_duration":"","duration":"","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"0","price":"","legal_name":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"","website":"","company_id":"0","client_user_id":"0","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","label":"","default_session_sub_type_id":"0","paid_at":"","default_session_type_id":"0","phone":"","total_amount":"","sub_type_id":"0","name":"Decathlon","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
490	5109de51-f2f4-4211-a32c-31822e0e365f	5	3	2022-03-11 19:49:18.121282	1	4	11	{"website":"","client_user_id":"5","phone":"","name":"Decathlon ","vat":"","legal_name":"Decathlon","email":""}
491	6f0048bf-dbbb-405d-b160-a4239e70fda4	5	3	2022-03-11 19:50:53.451523	1	11	4	{"client_user_id":"5","description":"","label":"Coding","value":"coding"}
492	db6d4b15-5d1e-4332-89ad-a509e1c71a70	5	3	2022-03-11 19:51:09.490659	1	11	5	{"client_user_id":"5","description":"Software Development","label":"Coding","value":"coding"}
493	389c9e41-32f6-4aa8-b21e-70281e6b397c	5	3	2022-03-11 19:52:05.344397	1	10	8	{"client_user_id":"5","type_id":"0","description":"freelaaaaa work","label":"Freelancing","value":"freelancing"}
494	44397f37-d7f6-4596-ad09-2a3ea1de4c9d	5	3	2022-03-11 19:57:26.568532	3	4	3	{"billing_period":"","date":"","code":"","gender":"","default_price":"","created_at":"","description":"","client_id":"0","session_duration":"","duration":"","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"0","price":"","legal_name":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"","website":"","company_id":"0","client_user_id":"5","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","label":"","default_session_sub_type_id":"0","paid_at":"","default_session_type_id":"0","phone":"","total_amount":"","sub_type_id":"0","name":"Other","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
495	b2581b03-62c2-4dd7-9983-29fcb453f96b	5	3	2022-03-11 19:57:34.509966	3	11	4	{"billing_period":"","date":"","code":"","gender":"","default_price":"","created_at":"","description":"","client_id":"0","session_duration":"","duration":"","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"0","price":"","legal_name":"","value":"coding","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"","website":"","company_id":"0","client_user_id":"5","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","label":"Coding","default_session_sub_type_id":"0","paid_at":"","default_session_type_id":"0","phone":"","total_amount":"","sub_type_id":"0","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
496	ba2cc894-ad65-401d-9fcc-5d370b6582cf	5	3	2022-03-11 19:57:39.894599	3	10	8	{"billing_period":"","date":"","code":"","gender":"","default_price":"","created_at":"","description":"freelaaaaa work","client_id":"0","session_duration":"","duration":"","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"0","price":"","legal_name":"","value":"freelancing","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"","website":"","company_id":"0","client_user_id":"5","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","label":"Freelancing","default_session_sub_type_id":"0","paid_at":"","default_session_type_id":"0","phone":"","total_amount":"","sub_type_id":"0","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
497	5ee6ea1b-317f-4fa3-b158-e5274c5934e9	5	3	2022-03-11 20:01:08.154654	1	10	9	{"client_user_id":"5","type_id":"german","description":"blab bla","label":"Special Client","value":"special-client"}
498	ddbb4175-90b8-4122-8fac-950c93a1d288	5	3	2022-03-11 20:09:00.985242	1	10	10	{"client_user_id":"5","type_id":"fitness","description":"weqweq","label":"another one","value":"another-one"}
499	616c8262-9155-4565-a446-3db1bf2dc33b	5	3	2022-03-11 20:11:56.698916	1	10	11	{"client_user_id":"5","type_id":"5","description":"31231","label":"bla212312","value":"bla212312"}
520	b03dbac5-b415-4c09-8697-11017f6114d6	5	3	2022-03-12 12:30:37.10407	1	6	95	{"date":"2022-03-12","duration":"50","client_user_id":"5","price":"25.00","type_id":"1","sub_type_id":"5","client_id":"17"}
500	2baa9744-8e4f-4b9e-ac27-bcc9528d7818	5	3	2022-03-11 20:12:03.076841	3	10	10	{"billing_period":"","date":"","code":"","gender":"","default_price":"","created_at":"","description":"weqweq","client_id":"0","session_duration":"","duration":"","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"0","price":"","legal_name":"","value":"another-one","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"","website":"","company_id":"0","client_user_id":"5","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","label":"another one","default_session_sub_type_id":"0","paid_at":"","default_session_type_id":"0","phone":"","total_amount":"","sub_type_id":"0","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
501	91d7691b-ccd7-4385-9ac3-760527f41acf	5	3	2022-03-11 20:12:06.888056	3	10	9	{"billing_period":"","date":"","code":"","gender":"","default_price":"","created_at":"","description":"blab bla","client_id":"0","session_duration":"","duration":"","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"0","price":"","legal_name":"","value":"special-client","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"","website":"","company_id":"0","client_user_id":"5","type_id":"0","vat":"","photo":"","weight":"","dislikes":"","label":"Special Client","default_session_sub_type_id":"0","paid_at":"","default_session_type_id":"0","phone":"","total_amount":"","sub_type_id":"0","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
502	e8fb8b57-f4db-4275-a5e6-ef883dd15516	5	3	2022-03-11 20:12:09.430182	3	10	11	{"billing_period":"","date":"","code":"","gender":"","default_price":"","created_at":"","description":"31231","client_id":"0","session_duration":"","duration":"","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"0","price":"","legal_name":"","value":"bla212312","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"","website":"","company_id":"0","client_user_id":"5","type_id":"5","vat":"","photo":"","weight":"","dislikes":"","label":"bla212312","default_session_sub_type_id":"0","paid_at":"","default_session_type_id":"0","phone":"","total_amount":"","sub_type_id":"0","name":"","provider_id":"0","phone_number":"","injuries_conditions":"","user":"0","age":""}
503	63db05ca-429c-4b80-aa4d-8265433e9640	5	3	2022-03-11 20:19:14.862746	1	5	63	{"billing_period":"","paid_at":"2022-03-11","pay_day":"","sessions":"","status_id":"2","company_id":"0","client_user_id":"5","total_amount":"-58.0","created_at":"2022-03-11","description":"blabla","provider_id":"0","client_id":"0"}
504	fd779118-6349-4a48-b5d6-66c12a58740a	5	3	2022-03-11 20:21:12.308808	1	6	92	{"date":"2022-03-11","duration":"50","client_user_id":"5","price":"25.00","type_id":"1","sub_type_id":"6","client_id":"17"}
505	ac46dca9-a2ce-461f-9369-cf2984b2acdf	5	3	2022-03-11 20:21:28.710949	1	6	93	{"date":"2022-03-11","duration":"40","client_user_id":"5","price":"20.00","type_id":"5","sub_type_id":"1","client_id":"18"}
506	a9dbb302-59b2-4bd1-b1c0-faaf012b133d	0	0	2022-03-12 11:43:34.143652	1	1	21	{"sessions_per_month":"4","website":"https://www.solinca.pt/","client_user_id":"0","default_price":"12.5","vat":"505200597","photo":"","default_session_sub_type_id":"0","session_duration":"30","default_session_type_id":"0","recovery_key":"","recovery_limit":"","name":"Solinca","phone_number":"930 574 174","legal_name":"Solinca Classic, S.A","is_company":"false","user":"0","email":"contacto@solinca.pt","start_date":""}
507	60f6aaad-aeed-4aa0-85ae-a290dbbe2952	0	0	2022-03-12 11:43:34.211251	1	2	12	{"gender":"","client_user_id":"0","weight":"","dislikes":"","injuries_conditions":"","age":"","client_id":"21","goals":"","height":"","likes":""}
508	f1dfe44f-a64d-48b8-a82a-775dbb13ff87	0	0	2022-03-12 11:49:06.586415	2	1	21	{"sessions_per_month":"4","website":"https://www.solinca.pt/","client_user_id":"0","default_price":"12.5","vat":"505200597","photo":"","default_session_sub_type_id":"0","session_duration":"30","default_session_type_id":"0","recovery_key":"","recovery_limit":"","name":"Solinca","phone_number":"930 574 174","legal_name":"Solinca Classic, S.A","is_company":"false","user":"0","email":"contacto@solinca.pt","start_date":""}
509	1a8668b6-7eb6-4576-acf3-efd65bf6ef4c	0	0	2022-03-12 11:49:06.603503	2	2	12	{"gender":"","client_user_id":"0","weight":"0","dislikes":"","injuries_conditions":"","age":"0","client_id":"21","goals":"","height":"0","likes":""}
510	7c38d310-9124-4d7d-a544-5e48805ad128	0	0	2022-03-12 11:50:18.190368	2	1	21	{"sessions_per_month":"4","website":"https://www.solinca.pt/","client_user_id":"0","default_price":"12.5","vat":"505200597","photo":"","default_session_sub_type_id":"0","session_duration":"30","default_session_type_id":"0","recovery_key":"","recovery_limit":"","name":"Solinca","phone_number":"930 574 174","legal_name":"Solinca Classic, S.A","is_company":"false","user":"0","email":"contacto@solinca.pt","start_date":""}
511	f4ee2eea-0d1a-4852-918b-ba83e9773990	0	0	2022-03-12 11:50:18.225609	2	2	12	{"gender":"","client_user_id":"0","weight":"0.0","dislikes":"","injuries_conditions":"","age":"0","client_id":"21","goals":"","height":"0.0","likes":""}
512	f2df3a30-5a0e-4b66-acb0-fc5cec57ea8e	0	0	2022-03-12 11:50:55.700098	2	1	21	{"sessions_per_month":"4","website":"https://www.solinca.pt/","client_user_id":"0","default_price":"12.5","vat":"505200597","photo":"","default_session_sub_type_id":"0","session_duration":"30","default_session_type_id":"0","recovery_key":"","recovery_limit":"","name":"Solinca","phone_number":"930 574 174","legal_name":"Solinca Classic, S.A","is_company":"false","user":"0","email":"contacto@solinca.pt","start_date":""}
513	a9ae5dbf-06d2-442f-960f-373799f866af	0	0	2022-03-12 11:50:55.719624	2	2	12	{"gender":"","client_user_id":"0","weight":"0.0","dislikes":"","injuries_conditions":"","age":"0","client_id":"21","goals":"","height":"0.0","likes":""}
514	d3b42c11-2080-45b2-b798-6621601e012f	0	0	2022-03-12 11:51:52.522808	2	1	21	{"sessions_per_month":"4","website":"https://www.solinca.pt/","client_user_id":"0","default_price":"12.5","vat":"505200597","photo":"","default_session_sub_type_id":"0","session_duration":"30","default_session_type_id":"0","recovery_key":"","recovery_limit":"","name":"Solinca","phone_number":"930 574 174","legal_name":"Solinca Classic, S.A","is_company":"true","user":"0","email":"contacto@solinca.pt","start_date":""}
515	0e07fa0a-c041-436d-957e-7d7833715e01	0	0	2022-03-12 11:51:52.545875	2	2	12	{"gender":"","client_user_id":"0","weight":"0.0","dislikes":"","injuries_conditions":"","age":"0","client_id":"21","goals":"","height":"0.0","likes":""}
516	558fae45-ea68-499e-9021-eb843ed3f9c3	1	1	2022-03-12 11:57:17.297791	1	13	5	{"recovery_key":"","recovery_limit":"","client_user_id":"8","name":"Mario Gon\\u00E7alves","user":"0","email":"mario.goncalves@mail.com"}
517	fb3b9af2-e954-41dd-8a15-68416cf24ec0	1	1	2022-03-12 11:59:00.923121	2	13	2	{"recovery_key":"","recovery_limit":"","client_user_id":"5","name":"Carlos Vitorino","user":"5","email":"carlos.duartv@gmail.com"}
518	32715bb0-8de1-4864-a970-51f63b37f9da	5	3	2022-03-12 12:30:20.340535	3	6	89	{"billing_period":"","date":"2022-03-09","code":"","gender":"","default_price":"","created_at":"","description":"","client_id":"17","session_duration":"","duration":"50","pay_day":"","recovery_key":"","recovery_limit":"","status_id":"0","price":"25.0","legal_name":"","value":"","email":"","goals":"","height":"","likes":"","start_date":"","sessions_per_month":"","sessions":"","website":"","company_id":"0","client_user_id":"5","type_id":"1","vat":"","photo":"","weight":"","dislikes":"","label":"","default_session_sub_type_id":"0","paid_at":"","default_session_type_id":"0","phone":"","total_amount":"","sub_type_id":"5","name":"","provider_id":"0","phone_number":"","is_company":"false","injuries_conditions":"","user":"0","age":""}
521	26c05e01-ee9d-4475-ad5e-868d57dd4365	5	3	2022-03-12 12:31:00.671952	1	5	64	{"billing_period":"2022-03-01 - 2022-03-31","paid_at":"","pay_day":"2022-03-01","sessions":"[95,92]","status_id":"1","company_id":"0","client_user_id":"5","total_amount":"50.0","created_at":"2022-03-12","description":"","provider_id":"0","client_id":"17"}
522	0e5e731c-50cf-441b-9b42-d1f1cab22361	5	3	2022-03-12 12:32:36.080534	1	1	22	{"sessions_per_month":"","website":"","client_user_id":"5","default_price":"","vat":"1231232131","photo":"","default_session_sub_type_id":"0","session_duration":"","default_session_type_id":"0","recovery_key":"","recovery_limit":"","name":"Solinca","phone_number":"966454454","legal_name":"Solinca","is_company":"true","user":"0","email":"info@solinca.pt","start_date":""}
523	d378af23-2913-4559-b754-cc07d8a760d1	5	3	2022-03-12 12:32:36.109253	1	2	13	{"gender":"","client_user_id":"5","weight":"","dislikes":"","injuries_conditions":"","age":"","client_id":"22","goals":"","height":"","likes":""}
\.


--
-- Data for Name: netuno_statistic_average; Type: TABLE DATA; Schema: public; Owner: bodylanguage
--

COPY public.netuno_statistic_average (id, uid, type_id, average_type_id, moment, average) FROM stdin;
\.


--
-- Data for Name: netuno_statistic_average_type; Type: TABLE DATA; Schema: public; Owner: bodylanguage
--

COPY public.netuno_statistic_average_type (id, uid, code) FROM stdin;
\.


--
-- Data for Name: netuno_statistic_moment; Type: TABLE DATA; Schema: public; Owner: bodylanguage
--

COPY public.netuno_statistic_moment (id, uid, type_id, moment, count) FROM stdin;
\.


--
-- Data for Name: netuno_statistic_type; Type: TABLE DATA; Schema: public; Owner: bodylanguage
--

COPY public.netuno_statistic_type (id, uid, code) FROM stdin;
\.


--
-- Data for Name: netuno_table; Type: TABLE DATA; Schema: public; Owner: bodylanguage
--

COPY public.netuno_table (id, uid, name, displayname, description, user_id, group_id, js, report, show_id, control_active, control_user, control_group, export_xls, export_xml, export_json, export_id, export_uid, export_lastchange, big, parent_id, reorder, firebase) FROM stdin;
1	0028953a-b610-4e37-9f25-87bdad2e37dd	client	Client		0	0	\N	f	t	t	f	f	t	t	t	f	t	f	f	0	0	
2	283ecca5-e801-42eb-8657-50c89a017d2c	fitness_data	Fitness Data		0	0	\N	f	t	t	f	f	t	t	t	f	t	f	f	1	0	
3	9ccf2730-8170-460c-9bf3-178cb365b3cd	language_data	Language Data		0	0	\N	f	t	t	f	f	t	t	t	f	t	f	f	1	0	
7	319ffc16-9fef-4ab1-a055-70dd9bbe7dc6	session_payment	Session Payment		0	0	\N	f	t	t	f	f	t	t	t	f	t	f	f	6	0	
6	209f8320-23be-4357-a428-1695ceb55912	session	Session		0	0	\N	f	t	t	f	f	t	t	t	f	t	f	f	0	0	
8	937312b2-13d1-44a4-813f-b14ea91e159a	document_session	Document Session		0	0	\N	f	t	t	f	f	t	t	t	f	t	f	f	6	0	
9	735d56ae-0d70-4a09-948b-9b0ca3362fb5	payment_status	Payment Status		0	0	\N	f	t	t	f	f	t	t	t	f	t	f	f	5	0	
5	26699f0a-2e25-48ee-a092-8d208c4432fe	finance	Finance		0	0	\N	f	t	t	f	f	t	t	t	f	t	f	f	0	0	
11	6a2b2d61-6091-4597-80ab-bd35ee0885eb	session_type	Session Type		0	0	\N	f	t	t	f	f	t	t	t	f	t	f	f	0	0	
12	6a0e217a-dc32-40c4-b4a9-2edab956520d	provider	Provider		0	0	\N	f	t	t	f	f	t	t	t	f	t	f	f	5	0	
10	83a983c2-7b71-49cf-9dc7-8c51f4ad390b	session_sub_type	Session Sub Type		0	0	\N	f	t	t	f	f	t	t	t	f	t	f	f	0	0	
13	f24a6931-3259-4036-9535-d911a94bdca8	client_user	Client User		0	0	\N	f	t	t	f	f	t	t	t	f	t	f	f	0	0	
4	1b4d42ce-319e-48ca-b563-dfd817b7e311	supplier	Supplier		0	0	\N	f	t	t	f	f	t	t	t	f	t	f	f	0	0	
\.


--
-- Data for Name: netuno_user; Type: TABLE DATA; Schema: public; Owner: bodylanguage
--

COPY public.netuno_user (id, uid, name, group_id, "user", pass, active, report, code, mail, config, extra) FROM stdin;
1	5d81a86c-f910-4ee0-8902-511e6fe6d99c	Developer	1	dev	ef260e9aa3c673af240d17a2660480361a8e081d1ffeca2a5ed0e3219fc18567	t					
2	5706fa54-2ebf-4b4d-ac14-cf44947676a4	Administrator	2	admin	8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918	t					
5	edd9b0b6-e08a-4dcf-8f19-5159686a46de	Carlos Vitorino	3	volt	d6c0d589d9e5b7e44fcada1f6c8f3af6afa9ec088018cb0b467c4b64da4d2423	t			carlos.duartv@gmail.com		
6	bd645e44-adeb-41e7-9fef-b644bc883c02	Tiina Rintamaeki	3	tiina	d6c0d589d9e5b7e44fcada1f6c8f3af6afa9ec088018cb0b467c4b64da4d2423	t			tiina@gmail.com		
7	6229a427-1345-43e5-aa26-9a51e8ce4e8a	ze	3	ze	d6c0d589d9e5b7e44fcada1f6c8f3af6afa9ec088018cb0b467c4b64da4d2423	t			ze@gmail.com		
8	f39577f5-3bf2-4af8-b703-6189fc9a6a95	Mario Gonçalves	3	mario	d6c0d589d9e5b7e44fcada1f6c8f3af6afa9ec088018cb0b467c4b64da4d2423	t			mario.goncalves@mail.com		
\.


--
-- Data for Name: netuno_user_rule; Type: TABLE DATA; Schema: public; Owner: bodylanguage
--

COPY public.netuno_user_rule (id, uid, user_id, table_id, active, rule_read, rule_write, rule_delete) FROM stdin;
\.


--
-- Data for Name: payment_status; Type: TABLE DATA; Schema: public; Owner: bodylanguage
--

COPY public.payment_status (id, uid, user_id, group_id, lastchange_time, lastchange_user_id, active, lock, name, code) FROM stdin;
1	640e3e9a-d86a-4d43-8d95-736c2f3c37cc	1	1	2022-03-02 20:47:07.616645	1	t	f	Waiting Payment	waiting_payment
2	e876aa83-0e08-4fba-92ec-8e5217ee3466	1	1	2022-03-02 20:48:01.130966	1	t	f	Paid	paid
\.


--
-- Data for Name: provider; Type: TABLE DATA; Schema: public; Owner: bodylanguage
--

COPY public.provider (id, uid, user_id, group_id, lastchange_time, lastchange_user_id, active, lock, label, value, client_user_id) FROM stdin;
2	912e10d9-737b-4839-8c9e-f575f2138b1b	1	1	2022-03-03 18:43:30.664432	1	t	f	Training	training	0
3	a408811f-29dd-439c-8d47-145b2be8242f	1	1	2022-03-03 18:43:37.242797	1	t	f	Equipment	equipment	0
4	a4662f19-982d-4013-a112-fc9091231c7b	1	1	2022-03-03 18:43:44.053816	1	t	f	Certification	certification	0
1	00e93d41-442c-4406-81ab-ab00e28581de	1	1	2022-03-04 13:16:12.104647	1	t	f	Rent	rent	0
\.


--
-- Data for Name: session; Type: TABLE DATA; Schema: public; Owner: bodylanguage
--

COPY public.session (id, uid, user_id, group_id, lastchange_time, lastchange_user_id, active, lock, client_id, duration, price, type_id, date, sub_type_id, client_user_id) FROM stdin;
71	ffc9cf6f-cf1f-41ef-ab1d-aab649f2d200	1	1	2022-03-05 17:50:22.232019	1	t	f	14	45	30.0	3	2022-03-05	1	0
73	d5fff8c0-e4cd-4c39-a7d9-72196ad475b1	1	1	2022-03-05 17:55:39.389135	1	t	f	16	45	30.0	1	2022-03-05	6	0
75	0ec5a991-83ec-432c-8716-d869225570d9	1	1	2022-03-05 18:08:22.789709	1	t	f	16	45	30.0	2	2022-03-05	3	0
76	d5e1ab3a-0ab0-411f-9294-a71d751c9afc	1	1	2022-03-05 18:11:03.279644	1	t	f	16	45	30.0	1	2022-03-05	6	0
78	a79205ed-984b-4d53-87cf-6aa7003529f8	1	1	2022-03-05 18:12:56.599744	1	t	f	16	45	30.0	1	2022-03-05	6	0
68	6c787317-0b87-417d-b47d-031cb8090e0c	1	1	2022-03-05 19:21:01.805042	1	t	f	16	45	30.0	3	2022-03-05	2	0
74	629ab42c-d774-4379-9766-9b3ec2857229	1	1	2022-03-05 19:21:57.906634	1	t	f	16	45	30.0	2	2022-03-05	4	0
85	cd937e42-f26e-487f-9c17-76712d84b78a	1	1	2022-03-05 19:28:42.123531	1	t	f	14	45	40.0	2	2022-03-05	4	0
87	68af1d6d-7771-49db-89ee-f2c3efae7589	1	1	2022-03-09 19:39:46.514529	1	t	f	14	45	30.0	2	2022-03-01	3	0
88	e1e4bb52-832d-4965-a63a-aa5b0b0a191d	5	3	2022-03-09 20:35:11.297506	5	t	f	18	40	20.0	3	2022-03-09	1	5
90	93f82ff9-4b21-4792-8c6e-afc48be19d49	6	3	2022-03-10 18:42:31.722581	6	t	f	20	30	50.0	0	2022-03-10	0	6
91	62c2ade9-8df1-4879-a5f2-ec34edd6fc5a	6	3	2022-03-10 18:43:07.707508	6	t	f	20	30	50.0	0	2022-03-10	0	6
77	7dbc0625-911d-43b3-b37d-2690515c0771	1	1	2022-03-05 18:11:35.249116	1	t	f	16	45	30.1	1	2022-03-05	6	0
92	26fecdbb-5b95-4ff6-98f5-7d5ba927b138	5	3	2022-03-11 20:21:12.306749	5	t	f	17	50	25.0	1	2022-03-11	6	5
93	ed71728e-9072-4e8d-90c3-925461dae8e0	5	3	2022-03-11 20:21:28.708752	5	t	f	18	40	20.0	5	2022-03-11	1	5
94	05e1af39-8ca8-4866-a639-2d1a31a86274	5	3	2022-03-12 12:30:31.687498	5	t	f	18	40	20.0	3	2022-03-12	1	5
79	38329a3e-48f2-4039-bdb4-5ab0c7f96089	1	1	2022-03-05 18:14:29.377786	1	t	f	16	45	30.0	1	2022-03-05	6	0
95	741f5444-670b-4c73-8365-8c73e452fef2	5	3	2022-03-12 12:30:37.102513	5	t	f	17	50	25.0	1	2022-03-12	5	5
80	4b55c112-f1fd-44f1-b10a-455d5d2ab5f1	1	1	2022-03-05 18:56:51.762167	1	t	f	12	59	30.0	1	2022-02-10	7	0
81	da787187-5e5b-4e25-a4ec-68e44962a87d	1	1	2022-03-05 18:56:51.773305	1	t	f	12	59	30.0	1	2022-03-05	7	0
82	838d2f77-f79b-4478-bec5-191f9347e927	1	1	2022-03-05 18:56:51.78403	1	t	f	14	45	30.0	2	2022-03-05	3	0
83	7112b152-22f7-4489-a34f-dcf46594c327	1	1	2022-03-05 18:56:51.794443	1	t	f	12	59	30.0	1	2022-01-13	7	0
84	c7b8e69b-bc09-459d-bac4-0465ef816416	1	1	2022-03-05 18:56:51.804472	1	t	f	14	45	30.0	2	2022-02-05	3	0
\.


--
-- Data for Name: session_payment; Type: TABLE DATA; Schema: public; Owner: bodylanguage
--

COPY public.session_payment (id, uid, user_id, group_id, lastchange_time, lastchange_user_id, active, lock, client_user_id) FROM stdin;
\.


--
-- Data for Name: session_sub_type; Type: TABLE DATA; Schema: public; Owner: bodylanguage
--

COPY public.session_sub_type (id, uid, user_id, group_id, lastchange_time, lastchange_user_id, active, lock, label, value, type_id, client_user_id, description) FROM stdin;
2	78dc0eda-9656-4e6c-b50f-cdbad82df24e	1	1	2022-03-05 16:08:13.639064	1	t	f	Body Balance	body_balance	3	5	
3	36258a13-6cc5-4650-9137-eb090e9fc4c5	1	1	2022-03-05 16:09:46.485704	1	t	f	General	general	2	5	
4	5bf985aa-bda5-4e54-a2f5-45ca1dea91a1	1	1	2022-03-05 16:10:38.969392	1	t	f	Test Preparation	test_preparation	2	5	
5	87c4d9c5-1a9e-47ab-9dba-416895b378b1	1	1	2022-03-05 16:11:04.956779	1	t	f	Gym	gym	1	5	
6	2e0339af-b1fd-498a-a6c8-b3e6b6f6ba14	1	1	2022-03-05 16:11:15.372566	1	t	f	Online	online	1	5	
7	25bfe664-917e-4038-95cb-e7e530dd4c35	1	1	2022-03-05 16:11:27.754805	1	t	f	Outdoor	outdoor	1	5	
1	099769aa-eddf-4e54-b363-055848569c7e	1	1	2022-03-09 20:12:56.707322	1	t	f	Bunda	bunda	3	5	
\.


--
-- Data for Name: session_type; Type: TABLE DATA; Schema: public; Owner: bodylanguage
--

COPY public.session_type (id, uid, user_id, group_id, lastchange_time, lastchange_user_id, active, lock, value, label, client_user_id, description) FROM stdin;
2	80c81754-a9d3-47c7-857f-5a820a454689	1	1	2022-03-11 19:10:48.084219	1	t	f	german	German	5	German Language Class
3	cdc0181b-2147-4737-a8ae-04f6979530b6	1	1	2022-03-11 19:11:11.344808	1	t	f	group_class	Group Class	5	Group Class Fitness
1	b286c416-94f6-4e0b-90b3-dac8748c757f	1	1	2022-03-11 19:11:28.407916	1	t	f	fitness	Fitness	5	Fitness private class
5	09a3ed1f-a353-4cf7-a3c7-c0c207a17488	5	3	2022-03-11 19:51:09.488952	5	t	f	coding	Coding	5	Software Development
\.


--
-- Data for Name: supplier; Type: TABLE DATA; Schema: public; Owner: bodylanguage
--

COPY public.supplier (id, uid, user_id, group_id, lastchange_time, lastchange_user_id, active, lock, name, legal_name, vat, website, email, phone, client_user_id) FROM stdin;
1	d197deec-9e84-4568-93ca-3b4e1530f0c4	1	1	2022-03-05 20:32:58.014798	1	t	f	Berlitz	LISBER, LDA	508486068	www.berlitz.pt	lisboa@berlitz.pt	21 352 0123	5
2	c7f88da6-34af-4dd2-9fe3-80f42346a21d	1	1	2022-03-05 21:27:47.346403	1	t	f	Solinca	Sonae					5
7	c7c4b081-9a75-4814-ad4b-cad3d336c19a	1	1	2022-03-10 19:59:05.821649	1	t	f	Decatlhon	Decatlhon	231231	www.decatlhon.pt		2321312321	1
8	72d3824c-8b0a-4994-b8ee-6dcd0b8dac0a	1	1	2022-03-10 19:59:22.432955	1	t	f	Zé da esquina	bla	231231	www.zezito.pt		2321312321	1
9	853c9e56-a194-4f6e-8546-18d2650fa977	0	0	2022-03-11 19:45:16.076888	0	t	f	Decathlon						0
11	e022280c-ee07-4d39-8d5e-3444c6fc5b9f	5	3	2022-03-11 19:49:18.113781	5	t	f	Decathlon 	Decathlon					5
\.


--
-- Name: client_id; Type: SEQUENCE SET; Schema: public; Owner: bodylanguage
--

SELECT pg_catalog.setval('public.client_id', 22, true);


--
-- Name: client_user_id; Type: SEQUENCE SET; Schema: public; Owner: bodylanguage
--

SELECT pg_catalog.setval('public.client_user_id', 5, true);


--
-- Name: document_session_id; Type: SEQUENCE SET; Schema: public; Owner: bodylanguage
--

SELECT pg_catalog.setval('public.document_session_id', 1, false);


--
-- Name: finance_id; Type: SEQUENCE SET; Schema: public; Owner: bodylanguage
--

SELECT pg_catalog.setval('public.finance_id', 64, true);


--
-- Name: fitness_data_id; Type: SEQUENCE SET; Schema: public; Owner: bodylanguage
--

SELECT pg_catalog.setval('public.fitness_data_id', 13, true);


--
-- Name: language_data_id; Type: SEQUENCE SET; Schema: public; Owner: bodylanguage
--

SELECT pg_catalog.setval('public.language_data_id', 1, false);


--
-- Name: netuno_app_id; Type: SEQUENCE SET; Schema: public; Owner: bodylanguage
--

SELECT pg_catalog.setval('public.netuno_app_id', 2, true);


--
-- Name: netuno_app_meta_id; Type: SEQUENCE SET; Schema: public; Owner: bodylanguage
--

SELECT pg_catalog.setval('public.netuno_app_meta_id', 1, false);


--
-- Name: netuno_app_table_id; Type: SEQUENCE SET; Schema: public; Owner: bodylanguage
--

SELECT pg_catalog.setval('public.netuno_app_table_id', 1, false);


--
-- Name: netuno_auth_jwt_token_id; Type: SEQUENCE SET; Schema: public; Owner: bodylanguage
--

SELECT pg_catalog.setval('public.netuno_auth_jwt_token_id', 210, true);


--
-- Name: netuno_client_hit_id; Type: SEQUENCE SET; Schema: public; Owner: bodylanguage
--

SELECT pg_catalog.setval('public.netuno_client_hit_id', 1, false);


--
-- Name: netuno_client_id; Type: SEQUENCE SET; Schema: public; Owner: bodylanguage
--

SELECT pg_catalog.setval('public.netuno_client_id', 1, false);


--
-- Name: netuno_design_id; Type: SEQUENCE SET; Schema: public; Owner: bodylanguage
--

SELECT pg_catalog.setval('public.netuno_design_id', 93, true);


--
-- Name: netuno_group_id; Type: SEQUENCE SET; Schema: public; Owner: bodylanguage
--

SELECT pg_catalog.setval('public.netuno_group_id', 3, true);


--
-- Name: netuno_group_rule_id; Type: SEQUENCE SET; Schema: public; Owner: bodylanguage
--

SELECT pg_catalog.setval('public.netuno_group_rule_id', 1, false);


--
-- Name: netuno_log_id; Type: SEQUENCE SET; Schema: public; Owner: bodylanguage
--

SELECT pg_catalog.setval('public.netuno_log_id', 523, true);


--
-- Name: netuno_statistic_average_id; Type: SEQUENCE SET; Schema: public; Owner: bodylanguage
--

SELECT pg_catalog.setval('public.netuno_statistic_average_id', 1, false);


--
-- Name: netuno_statistic_average_type_id; Type: SEQUENCE SET; Schema: public; Owner: bodylanguage
--

SELECT pg_catalog.setval('public.netuno_statistic_average_type_id', 1, false);


--
-- Name: netuno_statistic_moment_id; Type: SEQUENCE SET; Schema: public; Owner: bodylanguage
--

SELECT pg_catalog.setval('public.netuno_statistic_moment_id', 1, false);


--
-- Name: netuno_statistic_type_id; Type: SEQUENCE SET; Schema: public; Owner: bodylanguage
--

SELECT pg_catalog.setval('public.netuno_statistic_type_id', 1, false);


--
-- Name: netuno_table_id; Type: SEQUENCE SET; Schema: public; Owner: bodylanguage
--

SELECT pg_catalog.setval('public.netuno_table_id', 13, true);


--
-- Name: netuno_user_id; Type: SEQUENCE SET; Schema: public; Owner: bodylanguage
--

SELECT pg_catalog.setval('public.netuno_user_id', 8, true);


--
-- Name: netuno_user_rule_id; Type: SEQUENCE SET; Schema: public; Owner: bodylanguage
--

SELECT pg_catalog.setval('public.netuno_user_rule_id', 1, false);


--
-- Name: payment_status_id; Type: SEQUENCE SET; Schema: public; Owner: bodylanguage
--

SELECT pg_catalog.setval('public.payment_status_id', 2, true);


--
-- Name: provider_id; Type: SEQUENCE SET; Schema: public; Owner: bodylanguage
--

SELECT pg_catalog.setval('public.provider_id', 4, true);


--
-- Name: session_id; Type: SEQUENCE SET; Schema: public; Owner: bodylanguage
--

SELECT pg_catalog.setval('public.session_id', 95, true);


--
-- Name: session_payment_id; Type: SEQUENCE SET; Schema: public; Owner: bodylanguage
--

SELECT pg_catalog.setval('public.session_payment_id', 1, false);


--
-- Name: session_sub_type_id; Type: SEQUENCE SET; Schema: public; Owner: bodylanguage
--

SELECT pg_catalog.setval('public.session_sub_type_id', 11, true);


--
-- Name: session_type_id; Type: SEQUENCE SET; Schema: public; Owner: bodylanguage
--

SELECT pg_catalog.setval('public.session_type_id', 5, true);


--
-- Name: supplier_id; Type: SEQUENCE SET; Schema: public; Owner: bodylanguage
--

SELECT pg_catalog.setval('public.supplier_id', 11, true);


--
-- Name: client client_pkey; Type: CONSTRAINT; Schema: public; Owner: bodylanguage
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id);


--
-- Name: supplier companies_pkey; Type: CONSTRAINT; Schema: public; Owner: bodylanguage
--

ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);


--
-- Name: document_session document_session_pkey; Type: CONSTRAINT; Schema: public; Owner: bodylanguage
--

ALTER TABLE ONLY public.document_session
    ADD CONSTRAINT document_session_pkey PRIMARY KEY (id);


--
-- Name: fitness_data fitness_data_pkey; Type: CONSTRAINT; Schema: public; Owner: bodylanguage
--

ALTER TABLE ONLY public.fitness_data
    ADD CONSTRAINT fitness_data_pkey PRIMARY KEY (id);


--
-- Name: language_data language_data_pkey; Type: CONSTRAINT; Schema: public; Owner: bodylanguage
--

ALTER TABLE ONLY public.language_data
    ADD CONSTRAINT language_data_pkey PRIMARY KEY (id);


--
-- Name: netuno_app_meta netuno_app_meta_pkey; Type: CONSTRAINT; Schema: public; Owner: bodylanguage
--

ALTER TABLE ONLY public.netuno_app_meta
    ADD CONSTRAINT netuno_app_meta_pkey PRIMARY KEY (id);


--
-- Name: netuno_app netuno_app_pkey; Type: CONSTRAINT; Schema: public; Owner: bodylanguage
--

ALTER TABLE ONLY public.netuno_app
    ADD CONSTRAINT netuno_app_pkey PRIMARY KEY (id);


--
-- Name: netuno_app_table netuno_app_table_pkey; Type: CONSTRAINT; Schema: public; Owner: bodylanguage
--

ALTER TABLE ONLY public.netuno_app_table
    ADD CONSTRAINT netuno_app_table_pkey PRIMARY KEY (id);


--
-- Name: netuno_auth_jwt_token netuno_auth_jwt_token_pkey; Type: CONSTRAINT; Schema: public; Owner: bodylanguage
--

ALTER TABLE ONLY public.netuno_auth_jwt_token
    ADD CONSTRAINT netuno_auth_jwt_token_pkey PRIMARY KEY (id);


--
-- Name: netuno_client_hit netuno_client_hit_pkey; Type: CONSTRAINT; Schema: public; Owner: bodylanguage
--

ALTER TABLE ONLY public.netuno_client_hit
    ADD CONSTRAINT netuno_client_hit_pkey PRIMARY KEY (id);


--
-- Name: netuno_client netuno_client_pkey; Type: CONSTRAINT; Schema: public; Owner: bodylanguage
--

ALTER TABLE ONLY public.netuno_client
    ADD CONSTRAINT netuno_client_pkey PRIMARY KEY (id);


--
-- Name: netuno_design netuno_design_pkey; Type: CONSTRAINT; Schema: public; Owner: bodylanguage
--

ALTER TABLE ONLY public.netuno_design
    ADD CONSTRAINT netuno_design_pkey PRIMARY KEY (id);


--
-- Name: netuno_group netuno_group_pkey; Type: CONSTRAINT; Schema: public; Owner: bodylanguage
--

ALTER TABLE ONLY public.netuno_group
    ADD CONSTRAINT netuno_group_pkey PRIMARY KEY (id);


--
-- Name: netuno_group_rule netuno_group_rule_pkey; Type: CONSTRAINT; Schema: public; Owner: bodylanguage
--

ALTER TABLE ONLY public.netuno_group_rule
    ADD CONSTRAINT netuno_group_rule_pkey PRIMARY KEY (id);


--
-- Name: netuno_log netuno_log_pkey; Type: CONSTRAINT; Schema: public; Owner: bodylanguage
--

ALTER TABLE ONLY public.netuno_log
    ADD CONSTRAINT netuno_log_pkey PRIMARY KEY (id);


--
-- Name: netuno_statistic_average netuno_statistic_average_pkey; Type: CONSTRAINT; Schema: public; Owner: bodylanguage
--

ALTER TABLE ONLY public.netuno_statistic_average
    ADD CONSTRAINT netuno_statistic_average_pkey PRIMARY KEY (id);


--
-- Name: netuno_statistic_average_type netuno_statistic_average_type_pkey; Type: CONSTRAINT; Schema: public; Owner: bodylanguage
--

ALTER TABLE ONLY public.netuno_statistic_average_type
    ADD CONSTRAINT netuno_statistic_average_type_pkey PRIMARY KEY (id);


--
-- Name: netuno_statistic_moment netuno_statistic_moment_pkey; Type: CONSTRAINT; Schema: public; Owner: bodylanguage
--

ALTER TABLE ONLY public.netuno_statistic_moment
    ADD CONSTRAINT netuno_statistic_moment_pkey PRIMARY KEY (id);


--
-- Name: netuno_statistic_type netuno_statistic_type_pkey; Type: CONSTRAINT; Schema: public; Owner: bodylanguage
--

ALTER TABLE ONLY public.netuno_statistic_type
    ADD CONSTRAINT netuno_statistic_type_pkey PRIMARY KEY (id);


--
-- Name: netuno_table netuno_table_pkey; Type: CONSTRAINT; Schema: public; Owner: bodylanguage
--

ALTER TABLE ONLY public.netuno_table
    ADD CONSTRAINT netuno_table_pkey PRIMARY KEY (id);


--
-- Name: netuno_user netuno_user_pkey; Type: CONSTRAINT; Schema: public; Owner: bodylanguage
--

ALTER TABLE ONLY public.netuno_user
    ADD CONSTRAINT netuno_user_pkey PRIMARY KEY (id);


--
-- Name: netuno_user_rule netuno_user_rule_pkey; Type: CONSTRAINT; Schema: public; Owner: bodylanguage
--

ALTER TABLE ONLY public.netuno_user_rule
    ADD CONSTRAINT netuno_user_rule_pkey PRIMARY KEY (id);


--
-- Name: finance payment_pkey; Type: CONSTRAINT; Schema: public; Owner: bodylanguage
--

ALTER TABLE ONLY public.finance
    ADD CONSTRAINT payment_pkey PRIMARY KEY (id);


--
-- Name: payment_status payment_status_pkey; Type: CONSTRAINT; Schema: public; Owner: bodylanguage
--

ALTER TABLE ONLY public.payment_status
    ADD CONSTRAINT payment_status_pkey PRIMARY KEY (id);


--
-- Name: provider provider_pkey; Type: CONSTRAINT; Schema: public; Owner: bodylanguage
--

ALTER TABLE ONLY public.provider
    ADD CONSTRAINT provider_pkey PRIMARY KEY (id);


--
-- Name: session_payment session_payment_pkey; Type: CONSTRAINT; Schema: public; Owner: bodylanguage
--

ALTER TABLE ONLY public.session_payment
    ADD CONSTRAINT session_payment_pkey PRIMARY KEY (id);


--
-- Name: session session_pkey; Type: CONSTRAINT; Schema: public; Owner: bodylanguage
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT session_pkey PRIMARY KEY (id);


--
-- Name: session_type session_type_pkey; Type: CONSTRAINT; Schema: public; Owner: bodylanguage
--

ALTER TABLE ONLY public.session_type
    ADD CONSTRAINT session_type_pkey PRIMARY KEY (id);


--
-- Name: session_sub_type session_types_pkey; Type: CONSTRAINT; Schema: public; Owner: bodylanguage
--

ALTER TABLE ONLY public.session_sub_type
    ADD CONSTRAINT session_types_pkey PRIMARY KEY (id);


--
-- Name: client_user user_pkey; Type: CONSTRAINT; Schema: public; Owner: bodylanguage
--

ALTER TABLE ONLY public.client_user
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: client_client_user_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX client_client_user_id_idx ON public.client USING btree ("user");


--
-- Name: client_default_session_sub_type_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX client_default_session_sub_type_id_idx ON public.client USING btree (default_session_sub_type_id);


--
-- Name: client_default_session_type_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX client_default_session_type_id_idx ON public.client USING btree (default_session_type_id);


--
-- Name: client_group_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX client_group_id_idx ON public.client USING btree (group_id);


--
-- Name: client_lastchange_user_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX client_lastchange_user_id_idx ON public.client USING btree (lastchange_user_id);


--
-- Name: client_user_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX client_user_id_idx ON public.client USING btree (user_id);


--
-- Name: client_user_user_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX client_user_user_idx ON public.client_user USING btree ("user");


--
-- Name: companies_group_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX companies_group_id_idx ON public.supplier USING btree (group_id);


--
-- Name: companies_lastchange_user_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX companies_lastchange_user_id_idx ON public.supplier USING btree (lastchange_user_id);


--
-- Name: companies_user_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX companies_user_id_idx ON public.supplier USING btree (user_id);


--
-- Name: company_client_user_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX company_client_user_id_idx ON public.supplier USING btree (client_user_id);


--
-- Name: document_session_client_user_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX document_session_client_user_id_idx ON public.document_session USING btree (client_user_id);


--
-- Name: document_session_group_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX document_session_group_id_idx ON public.document_session USING btree (group_id);


--
-- Name: document_session_lastchange_user_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX document_session_lastchange_user_id_idx ON public.document_session USING btree (lastchange_user_id);


--
-- Name: document_session_user_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX document_session_user_id_idx ON public.document_session USING btree (user_id);


--
-- Name: finance_client_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX finance_client_id_idx ON public.finance USING btree (client_id);


--
-- Name: finance_client_user_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX finance_client_user_id_idx ON public.finance USING btree (client_user_id);


--
-- Name: finance_company_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX finance_company_id_idx ON public.finance USING btree (company_id);


--
-- Name: finance_provider_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX finance_provider_id_idx ON public.finance USING btree (provider_id);


--
-- Name: finance_status_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX finance_status_id_idx ON public.finance USING btree (status_id);


--
-- Name: fitness_data_client_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX fitness_data_client_id_idx ON public.fitness_data USING btree (client_id);


--
-- Name: fitness_data_client_user_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX fitness_data_client_user_id_idx ON public.fitness_data USING btree (client_user_id);


--
-- Name: fitness_data_group_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX fitness_data_group_id_idx ON public.fitness_data USING btree (group_id);


--
-- Name: fitness_data_lastchange_user_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX fitness_data_lastchange_user_id_idx ON public.fitness_data USING btree (lastchange_user_id);


--
-- Name: fitness_data_user_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX fitness_data_user_id_idx ON public.fitness_data USING btree (user_id);


--
-- Name: language_data_client_user_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX language_data_client_user_id_idx ON public.language_data USING btree (client_user_id);


--
-- Name: language_data_group_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX language_data_group_id_idx ON public.language_data USING btree (group_id);


--
-- Name: language_data_lastchange_user_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX language_data_lastchange_user_id_idx ON public.language_data USING btree (lastchange_user_id);


--
-- Name: language_data_user_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX language_data_user_id_idx ON public.language_data USING btree (user_id);


--
-- Name: netuno_app_table_app_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX netuno_app_table_app_id_idx ON public.netuno_app_table USING btree (app_id);


--
-- Name: netuno_app_table_table_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX netuno_app_table_table_id_idx ON public.netuno_app_table USING btree (table_id);


--
-- Name: netuno_client_hit_client_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX netuno_client_hit_client_id_idx ON public.netuno_client_hit USING btree (client_id);


--
-- Name: netuno_client_hit_user_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX netuno_client_hit_user_id_idx ON public.netuno_client_hit USING btree (user_id);


--
-- Name: netuno_design_table_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX netuno_design_table_id_idx ON public.netuno_design USING btree (table_id);


--
-- Name: netuno_group_rule_group_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX netuno_group_rule_group_id_idx ON public.netuno_group_rule USING btree (group_id);


--
-- Name: netuno_group_rule_table_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX netuno_group_rule_table_id_idx ON public.netuno_group_rule USING btree (table_id);


--
-- Name: netuno_log_group_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX netuno_log_group_id_idx ON public.netuno_log USING btree (group_id);


--
-- Name: netuno_log_item_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX netuno_log_item_id_idx ON public.netuno_log USING btree (item_id);


--
-- Name: netuno_log_table_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX netuno_log_table_id_idx ON public.netuno_log USING btree (table_id);


--
-- Name: netuno_log_user_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX netuno_log_user_id_idx ON public.netuno_log USING btree (user_id);


--
-- Name: netuno_statistic_average_type_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX netuno_statistic_average_type_id_idx ON public.netuno_statistic_average USING btree (type_id);


--
-- Name: netuno_statistic_moment_type_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX netuno_statistic_moment_type_id_idx ON public.netuno_statistic_moment USING btree (type_id);


--
-- Name: netuno_table_group_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX netuno_table_group_id_idx ON public.netuno_table USING btree (group_id);


--
-- Name: netuno_table_parent_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX netuno_table_parent_id_idx ON public.netuno_table USING btree (parent_id);


--
-- Name: netuno_user_group_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX netuno_user_group_id_idx ON public.netuno_user USING btree (group_id);


--
-- Name: netuno_user_rule_table_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX netuno_user_rule_table_id_idx ON public.netuno_user_rule USING btree (table_id);


--
-- Name: netuno_user_rule_user_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX netuno_user_rule_user_id_idx ON public.netuno_user_rule USING btree (user_id);


--
-- Name: payment_group_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX payment_group_id_idx ON public.finance USING btree (group_id);


--
-- Name: payment_lastchange_user_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX payment_lastchange_user_id_idx ON public.finance USING btree (lastchange_user_id);


--
-- Name: payment_status_group_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX payment_status_group_id_idx ON public.payment_status USING btree (group_id);


--
-- Name: payment_status_lastchange_user_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX payment_status_lastchange_user_id_idx ON public.payment_status USING btree (lastchange_user_id);


--
-- Name: payment_status_user_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX payment_status_user_id_idx ON public.payment_status USING btree (user_id);


--
-- Name: payment_user_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX payment_user_id_idx ON public.finance USING btree (user_id);


--
-- Name: provider_client_user_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX provider_client_user_id_idx ON public.provider USING btree (client_user_id);


--
-- Name: provider_group_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX provider_group_id_idx ON public.provider USING btree (group_id);


--
-- Name: provider_lastchange_user_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX provider_lastchange_user_id_idx ON public.provider USING btree (lastchange_user_id);


--
-- Name: provider_user_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX provider_user_id_idx ON public.provider USING btree (user_id);


--
-- Name: session_client_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX session_client_id_idx ON public.session USING btree (client_id);


--
-- Name: session_client_user_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX session_client_user_id_idx ON public.session USING btree (client_user_id);


--
-- Name: session_group_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX session_group_id_idx ON public.session USING btree (group_id);


--
-- Name: session_lastchange_user_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX session_lastchange_user_id_idx ON public.session USING btree (lastchange_user_id);


--
-- Name: session_payment_client_user_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX session_payment_client_user_id_idx ON public.session_payment USING btree (client_user_id);


--
-- Name: session_payment_group_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX session_payment_group_id_idx ON public.session_payment USING btree (group_id);


--
-- Name: session_payment_lastchange_user_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX session_payment_lastchange_user_id_idx ON public.session_payment USING btree (lastchange_user_id);


--
-- Name: session_payment_user_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX session_payment_user_id_idx ON public.session_payment USING btree (user_id);


--
-- Name: session_sub_type_client_user_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX session_sub_type_client_user_id_idx ON public.session_sub_type USING btree (client_user_id);


--
-- Name: session_sub_type_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX session_sub_type_id_idx ON public.session USING btree (sub_type_id);


--
-- Name: session_sub_types_type_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX session_sub_types_type_id_idx ON public.session_sub_type USING btree (type_id);


--
-- Name: session_type_client_user_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX session_type_client_user_id_idx ON public.session_type USING btree (client_user_id);


--
-- Name: session_type_group_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX session_type_group_id_idx ON public.session_type USING btree (group_id);


--
-- Name: session_type_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX session_type_id_idx ON public.session USING btree (type_id);


--
-- Name: session_type_lastchange_user_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX session_type_lastchange_user_id_idx ON public.session_type USING btree (lastchange_user_id);


--
-- Name: session_type_user_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX session_type_user_id_idx ON public.session_type USING btree (user_id);


--
-- Name: session_types_group_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX session_types_group_id_idx ON public.session_sub_type USING btree (group_id);


--
-- Name: session_types_lastchange_user_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX session_types_lastchange_user_id_idx ON public.session_sub_type USING btree (lastchange_user_id);


--
-- Name: session_types_user_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX session_types_user_id_idx ON public.session_sub_type USING btree (user_id);


--
-- Name: session_user_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX session_user_id_idx ON public.session USING btree (user_id);


--
-- Name: user_group_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX user_group_id_idx ON public.client_user USING btree (group_id);


--
-- Name: user_lastchange_user_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX user_lastchange_user_id_idx ON public.client_user USING btree (lastchange_user_id);


--
-- Name: user_user_id_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX user_user_id_idx ON public.client_user USING btree (user_id);


--
-- Name: user_user_idx; Type: INDEX; Schema: public; Owner: bodylanguage
--

CREATE INDEX user_user_idx ON public.client_user USING btree (client_user_id);


--
-- PostgreSQL database dump complete
--

