--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.3
-- Dumped by pg_dump version 9.5.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: owner
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE ar_internal_metadata OWNER TO owner;

--
-- Name: meetup_memberships; Type: TABLE; Schema: public; Owner: owner
--

CREATE TABLE meetup_memberships (
    id integer NOT NULL,
    user_id integer NOT NULL,
    meetup_id integer NOT NULL,
    creator_id boolean NOT NULL
);


ALTER TABLE meetup_memberships OWNER TO owner;

--
-- Name: meetup_memberships_id_seq; Type: SEQUENCE; Schema: public; Owner: owner
--

CREATE SEQUENCE meetup_memberships_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE meetup_memberships_id_seq OWNER TO owner;

--
-- Name: meetup_memberships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: owner
--

ALTER SEQUENCE meetup_memberships_id_seq OWNED BY meetup_memberships.id;


--
-- Name: meetups; Type: TABLE; Schema: public; Owner: owner
--

CREATE TABLE meetups (
    id integer NOT NULL,
    name character varying NOT NULL,
    description character varying NOT NULL,
    location character varying NOT NULL
);


ALTER TABLE meetups OWNER TO owner;

--
-- Name: meetups_id_seq; Type: SEQUENCE; Schema: public; Owner: owner
--

CREATE SEQUENCE meetups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE meetups_id_seq OWNER TO owner;

--
-- Name: meetups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: owner
--

ALTER SEQUENCE meetups_id_seq OWNED BY meetups.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: owner
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO owner;

--
-- Name: users; Type: TABLE; Schema: public; Owner: owner
--

CREATE TABLE users (
    id integer NOT NULL,
    provider character varying NOT NULL,
    uid character varying NOT NULL,
    username character varying NOT NULL,
    email character varying NOT NULL,
    avatar_url character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE users OWNER TO owner;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: owner
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO owner;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: owner
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: owner
--

ALTER TABLE ONLY meetup_memberships ALTER COLUMN id SET DEFAULT nextval('meetup_memberships_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: owner
--

ALTER TABLE ONLY meetups ALTER COLUMN id SET DEFAULT nextval('meetups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: owner
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: owner
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: meetup_memberships_pkey; Type: CONSTRAINT; Schema: public; Owner: owner
--

ALTER TABLE ONLY meetup_memberships
    ADD CONSTRAINT meetup_memberships_pkey PRIMARY KEY (id);


--
-- Name: meetups_pkey; Type: CONSTRAINT; Schema: public; Owner: owner
--

ALTER TABLE ONLY meetups
    ADD CONSTRAINT meetups_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: owner
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: owner
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_users_on_uid_and_provider; Type: INDEX; Schema: public; Owner: owner
--

CREATE UNIQUE INDEX index_users_on_uid_and_provider ON users USING btree (uid, provider);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

