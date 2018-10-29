--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.10
-- Dumped by pg_dump version 9.6.10

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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO root;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO root;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO root;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO root;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO root;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO root;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO root;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO root;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO root;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO root;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO root;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO root;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO root;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO root;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO root;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO root;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO root;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO root;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO root;

--
-- Name: history_chathistory; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.history_chathistory (
    id integer NOT NULL,
    message character varying(140) NOT NULL,
    date timestamp with time zone NOT NULL,
    group_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.history_chathistory OWNER TO root;

--
-- Name: history_chathistory_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.history_chathistory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.history_chathistory_id_seq OWNER TO root;

--
-- Name: history_chathistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.history_chathistory_id_seq OWNED BY public.history_chathistory.id;


--
-- Name: history_groups; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.history_groups (
    id integer NOT NULL,
    name character varying(20) NOT NULL,
    type character varying(20) NOT NULL,
    date timestamp with time zone NOT NULL
);


ALTER TABLE public.history_groups OWNER TO root;

--
-- Name: history_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.history_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.history_groups_id_seq OWNER TO root;

--
-- Name: history_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.history_groups_id_seq OWNED BY public.history_groups.id;


--
-- Name: history_personalmessage; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.history_personalmessage (
    id integer NOT NULL,
    message character varying(1000) NOT NULL,
    date timestamp with time zone NOT NULL,
    profile_reciver_id integer NOT NULL,
    user_sender_id integer NOT NULL
);


ALTER TABLE public.history_personalmessage OWNER TO root;

--
-- Name: history_personalmessage_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.history_personalmessage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.history_personalmessage_id_seq OWNER TO root;

--
-- Name: history_personalmessage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.history_personalmessage_id_seq OWNED BY public.history_personalmessage.id;


--
-- Name: profiles_profile; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.profiles_profile (
    id integer NOT NULL,
    number character varying(50) NOT NULL,
    date_of_birth timestamp with time zone NOT NULL,
    date_inserted timestamp with time zone NOT NULL,
    image character varying(250),
    user_id integer NOT NULL
);


ALTER TABLE public.profiles_profile OWNER TO root;

--
-- Name: profiles_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.profiles_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.profiles_profile_id_seq OWNER TO root;

--
-- Name: profiles_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.profiles_profile_id_seq OWNED BY public.profiles_profile.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: history_chathistory id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.history_chathistory ALTER COLUMN id SET DEFAULT nextval('public.history_chathistory_id_seq'::regclass);


--
-- Name: history_groups id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.history_groups ALTER COLUMN id SET DEFAULT nextval('public.history_groups_id_seq'::regclass);


--
-- Name: history_personalmessage id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.history_personalmessage ALTER COLUMN id SET DEFAULT nextval('public.history_personalmessage_id_seq'::regclass);


--
-- Name: profiles_profile id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.profiles_profile ALTER COLUMN id SET DEFAULT nextval('public.profiles_profile_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add personal message	7	add_personalmessage
26	Can change personal message	7	change_personalmessage
27	Can delete personal message	7	delete_personalmessage
28	Can view personal message	7	view_personalmessage
29	Can add groups	8	add_groups
30	Can change groups	8	change_groups
31	Can delete groups	8	delete_groups
32	Can view groups	8	view_groups
33	Can add chat history	9	add_chathistory
34	Can change chat history	9	change_chathistory
35	Can delete chat history	9	delete_chathistory
36	Can view chat history	9	view_chathistory
37	Can add profile	10	add_profile
38	Can change profile	10	change_profile
39	Can delete profile	10	delete_profile
40	Can view profile	10	view_profile
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 40, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
5	pbkdf2_sha256$120000$NcEGsxgauxVJ$mZBj/9WaBXnX1JpAW+0LlYH/vbrZrG//qvWFyQnAMr0=	2018-10-22 10:10:23.518394-05	f	amc			mcordova@nadhat.com	f	t	2018-10-22 10:10:17.562122-05
4	pbkdf2_sha256$120000$QZv3gcV0WtN4$v1HDizAGUB8NODCI7Y09gY4fIMzn8ZoA4F/GjeituhE=	2018-10-22 10:49:52.309348-05	t	andrews			rsilva2014@live.com	t	t	2018-09-27 12:41:20.876188-05
1	pbkdf2_sha256$120000$aqIK8HjD9st0$peqjopfjZk/EpurBe2fG8iWGMTshGeOQYVENkJcS6J4=	2018-10-22 10:50:08.426704-05	f	kim			yachayx@gmail.com	f	t	2018-09-27 12:29:04.228949-05
2	pbkdf2_sha256$120000$83dMmmdmCvOi$KFSOclEd2tUIJ7Jiv76vIh+3neKIpQSAqXbUPjDt8Zo=	2018-10-22 23:26:44.479525-05	f	dave			dave@gmail.com	f	t	2018-09-27 12:30:38.409309-05
3	pbkdf2_sha256$120000$RewWlZ26wGSw$Yk383NvNR5CevjJS7ekQrafrZHaoJ8NQ2rZIq3Obzd0=	2018-10-22 23:34:53.786241-05	f	crack			crack@live.com	f	t	2018-09-27 12:33:55.967165-05
6	pbkdf2_sha256$120000$PGjjrF75XPlK$mBFL/lkEaqd5mUFb9ny6twRpv0AOmpyx6n6037vw8Ic=	\N	f	melany			melany@tech.com	f	t	2018-10-25 14:39:00.934493-05
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 6, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	history	personalmessage
8	history	groups
9	history	chathistory
10	profiles	profile
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 10, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2018-09-27 12:22:36.889988-05
2	auth	0001_initial	2018-09-27 12:22:38.042959-05
3	admin	0001_initial	2018-09-27 12:22:38.285609-05
4	admin	0002_logentry_remove_auto_add	2018-09-27 12:22:38.328167-05
5	admin	0003_logentry_add_action_flag_choices	2018-09-27 12:22:38.361234-05
6	contenttypes	0002_remove_content_type_name	2018-09-27 12:22:38.393348-05
7	auth	0002_alter_permission_name_max_length	2018-09-27 12:22:38.415798-05
8	auth	0003_alter_user_email_max_length	2018-09-27 12:22:38.437604-05
9	auth	0004_alter_user_username_opts	2018-09-27 12:22:38.482159-05
10	auth	0005_alter_user_last_login_null	2018-09-27 12:22:38.514802-05
11	auth	0006_require_contenttypes_0002	2018-09-27 12:22:38.529833-05
12	auth	0007_alter_validators_add_error_messages	2018-09-27 12:22:38.559091-05
13	auth	0008_alter_user_username_max_length	2018-09-27 12:22:38.639705-05
14	auth	0009_alter_user_last_name_max_length	2018-09-27 12:22:38.703926-05
15	sessions	0001_initial	2018-09-27 12:22:38.872517-05
16	profiles	0001_initial	2018-09-27 12:24:36.980485-05
17	history	0001_initial	2018-09-27 12:24:37.458878-05
18	history	0002_auto_20180927_1758	2018-09-27 12:58:33.957651-05
19	profiles	0002_auto_20180927_1758	2018-09-27 12:58:34.056891-05
20	history	0003_auto_20180927_1800	2018-09-27 13:00:43.058501-05
21	profiles	0003_auto_20180927_1800	2018-09-27 13:00:43.098986-05
22	history	0004_auto_20180927_1806	2018-09-27 13:06:06.804525-05
23	profiles	0004_auto_20180927_1806	2018-09-27 13:06:06.871303-05
24	history	0005_auto_20180927_1809	2018-09-27 13:09:28.613297-05
25	profiles	0005_auto_20180927_1809	2018-09-27 13:09:28.641006-05
26	history	0006_auto_20180927_1813	2018-09-27 13:13:15.808443-05
27	profiles	0006_auto_20180927_1813	2018-09-27 13:13:15.859384-05
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 27, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
a7qqxrqhxxf82zwl49yc88214492m3r4	ZjAxNmNlNDYyNzNiODExYjgzNmI2ZjYzZDViNGI0NzJhOTI4NGQxMzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiNmI3OGEyNzE1MDEyYzIxY2QyZmZkZmUwZWJjZTY2ZDFlYWFhOTFkMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-10-11 17:23:15.078414-05
c4bb4wmbstjqnq5dtbqxsoamn2ti5kh2	YjM5NTZiODVhNzg1NjlkZDdiNWE3ZjE0NjMyNTQzMTY0ZTU0OGFlMzp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjFiZDQ0YjFlZWU3NDc3YjE1OTMxZjY3NTNiM2U2OGZkOTA1MzI1YiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-10-11 17:23:57.774904-05
actfg31r4feccvpeg21eortxdcn27u25	ODgwOWYxODdiY2Q1NjY1OTJjYWRiNTMxN2RmNDgzZGM0ZTVjMjI3MTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNmM2OTAyNzc1ODAyNmNmY2JmYjRiMjE1MjAyMzk4ODgyM2MyMWZlYSIsIl9hdXRoX3VzZXJfaWQiOiI1In0=	2018-11-05 10:10:23.551543-05
1w839omwqcw8njuq08iqfzd7cbp9xcic	MmJjMWViNWEzMmFjZDVmOGNjZjM3MWViNTVmMWJmZWIzNzBjMzMyMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNmI3OGEyNzE1MDEyYzIxY2QyZmZkZmUwZWJjZTY2ZDFlYWFhOTFkMyIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=	2018-11-05 10:52:37.279997-05
xt4lzxfctsqavr2dnod1oqgyifr42wxn	YjMzMjk4M2JmOTIxMDE1YzRjYjQ3ZjA2N2U0M2IxNTUxMTE5MWQ3Zjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2Yjc4YTI3MTUwMTJjMjFjZDJmZmRmZTBlYmNlNjZkMWVhYWE5MWQzIn0=	2018-11-05 11:12:48.177056-05
1e4ump4pbilwpl5fabl0dsfkn1nxj6eo	YjMzMjk4M2JmOTIxMDE1YzRjYjQ3ZjA2N2U0M2IxNTUxMTE5MWQ3Zjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2Yjc4YTI3MTUwMTJjMjFjZDJmZmRmZTBlYmNlNjZkMWVhYWE5MWQzIn0=	2018-11-05 11:14:31.139896-05
rozx0j0zrbtks4zqvew67jzm0s8mbi29	YjMzMjk4M2JmOTIxMDE1YzRjYjQ3ZjA2N2U0M2IxNTUxMTE5MWQ3Zjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2Yjc4YTI3MTUwMTJjMjFjZDJmZmRmZTBlYmNlNjZkMWVhYWE5MWQzIn0=	2018-11-05 11:31:32.161345-05
ulxhduragcv8dm026q2wtcru4zjwu8q3	ZjAxNmNlNDYyNzNiODExYjgzNmI2ZjYzZDViNGI0NzJhOTI4NGQxMzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiNmI3OGEyNzE1MDEyYzIxY2QyZmZkZmUwZWJjZTY2ZDFlYWFhOTFkMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-11-05 19:54:37.531949-05
mi4e5tglricwnuxsj5xza5k36jduyvzr	ZjAxNmNlNDYyNzNiODExYjgzNmI2ZjYzZDViNGI0NzJhOTI4NGQxMzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9oYXNoIjoiNmI3OGEyNzE1MDEyYzIxY2QyZmZkZmUwZWJjZTY2ZDFlYWFhOTFkMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-11-05 20:16:27.153788-05
kgent9rcc03dr17f2q0wl2roef8az5fc	NmMxYzA2M2MwYWNiMmUxZGJkNzg4NTI2MDZiOTU3ZDQ0MDU2MWUzYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjZiNzhhMjcxNTAxMmMyMWNkMmZmZGZlMGViY2U2NmQxZWFhYTkxZDMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=	2018-11-05 20:39:41.264181-05
7clvyynsykqnye268ymijnnxshuff0r4	MmJjMWViNWEzMmFjZDVmOGNjZjM3MWViNTVmMWJmZWIzNzBjMzMyMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNmI3OGEyNzE1MDEyYzIxY2QyZmZkZmUwZWJjZTY2ZDFlYWFhOTFkMyIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=	2018-11-05 21:25:17.161768-05
oc9ex55vm8xhwfbegcmdp76prsiaqqa5	MmJjMWViNWEzMmFjZDVmOGNjZjM3MWViNTVmMWJmZWIzNzBjMzMyMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNmI3OGEyNzE1MDEyYzIxY2QyZmZkZmUwZWJjZTY2ZDFlYWFhOTFkMyIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=	2018-11-05 23:26:44.530553-05
xd9ge0ljle2k8a9tfmy4ulnhft3g06o0	NjgzNmJhOWEyNjhiZjY4MmNmMTFhMmIzYzI4ZTYwYjU0NWMxYWEwZTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjFiZDQ0YjFlZWU3NDc3YjE1OTMxZjY3NTNiM2U2OGZkOTA1MzI1YiIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=	2018-11-05 23:34:53.832657-05
\.


--
-- Data for Name: history_chathistory; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.history_chathistory (id, message, date, group_id, user_id) FROM stdin;
1	hello	2018-09-27 17:20:00-05	1	2
2	hi	2018-09-27 17:20:00-05	1	3
3	Hi	2018-09-27 17:20:00-05	1	3
4	hello	2018-09-27 17:20:00-05	1	2
5	hi	2018-09-27 17:20:00-05	1	2
56	333	2018-10-22 22:04:00-05	1	2
7	AAA	2018-10-22 11:05:00-05	1	2
8	hehe	2018-10-22 19:55:00-05	1	2
9	hey	2018-10-22 19:55:00-05	1	2
10	lala	2018-10-22 20:31:00-05	1	2
11	ll	2018-10-22 20:33:00-05	1	2
12	asdd	2018-10-22 20:35:00-05	1	2
13	aaa	2018-10-22 20:38:00-05	1	2
14	vvv	2018-10-22 20:40:00-05	1	2
15	vvv	2018-10-22 20:43:00-05	1	2
16	asdd	2018-10-22 20:43:00-05	1	2
17	sdf4	2018-10-22 20:47:00-05	1	2
18	asdd	2018-10-22 20:51:00-05	1	2
19	sdfff	2018-10-22 20:54:00-05	1	2
20	sddd	2018-10-22 20:55:00-05	1	2
21	asd	2018-10-22 20:55:00-05	1	2
22	serio	2018-10-22 20:55:00-05	1	2
23	asss	2018-10-22 20:55:00-05	1	2
24	asd	2018-10-22 20:59:00-05	1	2
25	asd	2018-10-22 20:59:00-05	1	2
26	ddd	2018-10-22 20:59:00-05	1	2
27	asd	2018-10-22 20:59:00-05	1	2
28	12233	2018-10-22 20:59:00-05	1	2
29	asd	2018-10-22 20:59:00-05	1	2
30	235555	2018-10-22 20:59:00-05	1	2
31	SD	2018-10-22 21:24:00-05	1	2
32	sddd	2018-10-22 21:24:00-05	1	2
33	asd	2018-10-22 21:26:00-05	1	2
34	sddd	2018-10-22 21:26:00-05	1	2
35	saddd	2018-10-22 21:32:00-05	1	2
36	333	2018-10-22 21:57:00-05	1	2
37	6666666	2018-10-22 21:57:00-05	1	2
38	6666666	2018-10-22 22:04:00-05	1	2
39	777	2018-10-22 22:04:00-05	1	2
40	111	2018-10-22 22:04:00-05	1	2
41	xxxx	2018-10-22 22:04:00-05	1	2
42	sddd	2018-10-22 22:04:00-05	1	2
43	aaaa	2018-10-22 22:04:00-05	1	2
44	aaaaa	2018-10-22 22:04:00-05	1	2
45	777	2018-10-22 22:04:00-05	1	2
46	223	2018-10-22 22:04:00-05	1	2
47	145	2018-10-22 22:04:00-05	1	2
48	posilca	2018-10-22 22:04:00-05	1	2
49	asddd	2018-10-22 22:04:00-05	1	2
50	sss	2018-10-22 22:04:00-05	1	2
51	LL	2018-10-22 22:04:00-05	1	2
52	ASD	2018-10-22 22:04:00-05	1	2
53	sd12	2018-10-22 22:04:00-05	1	2
54	as123	2018-10-22 22:04:00-05	1	2
55	123tre	2018-10-22 22:04:00-05	1	2
57	da45	2018-10-22 22:04:00-05	1	2
58	das123	2018-10-22 22:04:00-05	1	2
59	ds23	2018-10-22 22:04:00-05	1	2
60	asd345	2018-10-22 22:04:00-05	1	2
61	asdd	2018-10-22 23:24:00-05	1	2
62	asd123?	2018-10-22 23:24:00-05	1	2
63	sda23	2018-10-22 23:24:00-05	1	2
64	daaa54	2018-10-22 23:24:00-05	1	2
65	asd3	2018-10-22 23:24:00-05	1	2
66	asd	2018-10-22 23:24:00-05	1	2
67	lala	2018-10-22 23:24:00-05	1	3
68	asd	2018-10-22 23:24:00-05	1	2
69	sda	2018-10-22 23:24:00-05	1	3
70	why	2018-10-22 23:24:00-05	1	2
71	lslsl	2018-10-22 23:24:00-05	1	3
72	lla	2018-10-22 23:24:00-05	1	2
73	ok	2018-10-22 23:24:00-05	1	3
74	ll	2018-10-22 23:24:00-05	1	2
75	ll	2018-10-22 23:24:00-05	1	3
76	;;7	2018-10-22 23:24:00-05	1	2
77	123	2018-10-22 23:24:00-05	1	3
78	bn,	2018-10-22 23:24:00-05	1	3
\.


--
-- Name: history_chathistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.history_chathistory_id_seq', 78, true);


--
-- Data for Name: history_groups; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.history_groups (id, name, type, date) FROM stdin;
1	Technology	tech	2018-06-03 10:00:00-05
\.


--
-- Name: history_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.history_groups_id_seq', 1, false);


--
-- Data for Name: history_personalmessage; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.history_personalmessage (id, message, date, profile_reciver_id, user_sender_id) FROM stdin;
\.


--
-- Name: history_personalmessage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.history_personalmessage_id_seq', 1, false);


--
-- Data for Name: profiles_profile; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.profiles_profile (id, number, date_of_birth, date_inserted, image, user_id) FROM stdin;
1	096816232	1978-06-01 05:00:00-05	2018-09-27 12:29:00-05	my.gif	2
3	0968196666	2004-01-01 07:00:00-05	2018-09-27 12:33:00-05	my.jpeg	3
4	0968196867	2018-06-02 19:00:00-05	2018-10-22 10:08:00-05	5.jpg	5
5	0968196867	2018-10-01 08:00:00-05	2018-10-25 14:36:00-05	5.jpg	6
\.


--
-- Name: profiles_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.profiles_profile_id_seq', 5, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: history_chathistory history_chathistory_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.history_chathistory
    ADD CONSTRAINT history_chathistory_pkey PRIMARY KEY (id);


--
-- Name: history_groups history_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.history_groups
    ADD CONSTRAINT history_groups_pkey PRIMARY KEY (id);


--
-- Name: history_personalmessage history_personalmessage_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.history_personalmessage
    ADD CONSTRAINT history_personalmessage_pkey PRIMARY KEY (id);


--
-- Name: profiles_profile profiles_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.profiles_profile
    ADD CONSTRAINT profiles_profile_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: history_chathistory_group_id_f18baa15; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX history_chathistory_group_id_f18baa15 ON public.history_chathistory USING btree (group_id);


--
-- Name: history_chathistory_user_id_43d0e70a; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX history_chathistory_user_id_43d0e70a ON public.history_chathistory USING btree (user_id);


--
-- Name: history_personalmessage_profile_reciver_id_c1919511; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX history_personalmessage_profile_reciver_id_c1919511 ON public.history_personalmessage USING btree (profile_reciver_id);


--
-- Name: history_personalmessage_user_sender_id_59da1eaf; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX history_personalmessage_user_sender_id_59da1eaf ON public.history_personalmessage USING btree (user_sender_id);


--
-- Name: profiles_profile_user_id_a3e81f91; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX profiles_profile_user_id_a3e81f91 ON public.profiles_profile USING btree (user_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: history_chathistory history_chathistory_group_id_f18baa15_fk_history_groups_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.history_chathistory
    ADD CONSTRAINT history_chathistory_group_id_f18baa15_fk_history_groups_id FOREIGN KEY (group_id) REFERENCES public.history_groups(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: history_chathistory history_chathistory_user_id_43d0e70a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.history_chathistory
    ADD CONSTRAINT history_chathistory_user_id_43d0e70a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: history_personalmessage history_personalmess_profile_reciver_id_c1919511_fk_profiles_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.history_personalmessage
    ADD CONSTRAINT history_personalmess_profile_reciver_id_c1919511_fk_profiles_ FOREIGN KEY (profile_reciver_id) REFERENCES public.profiles_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: history_personalmessage history_personalmessage_user_sender_id_59da1eaf_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.history_personalmessage
    ADD CONSTRAINT history_personalmessage_user_sender_id_59da1eaf_fk_auth_user_id FOREIGN KEY (user_sender_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: profiles_profile profiles_profile_user_id_a3e81f91_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.profiles_profile
    ADD CONSTRAINT profiles_profile_user_id_a3e81f91_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

