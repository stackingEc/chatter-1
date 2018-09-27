--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.10
-- Dumped by pg_dump version 9.6.10

-- Started on 2018-09-27 13:32:11 -05

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
-- TOC entry 1 (class 3079 OID 12393)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2325 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 192 (class 1259 OID 53188)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO root;

--
-- TOC entry 191 (class 1259 OID 53186)
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
-- TOC entry 2326 (class 0 OID 0)
-- Dependencies: 191
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- TOC entry 194 (class 1259 OID 53198)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO root;

--
-- TOC entry 193 (class 1259 OID 53196)
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
-- TOC entry 2327 (class 0 OID 0)
-- Dependencies: 193
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- TOC entry 190 (class 1259 OID 53180)
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
-- TOC entry 189 (class 1259 OID 53178)
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
-- TOC entry 2328 (class 0 OID 0)
-- Dependencies: 189
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- TOC entry 196 (class 1259 OID 53206)
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
-- TOC entry 198 (class 1259 OID 53216)
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO root;

--
-- TOC entry 197 (class 1259 OID 53214)
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
-- TOC entry 2329 (class 0 OID 0)
-- Dependencies: 197
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- TOC entry 195 (class 1259 OID 53204)
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
-- TOC entry 2330 (class 0 OID 0)
-- Dependencies: 195
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- TOC entry 200 (class 1259 OID 53224)
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO root;

--
-- TOC entry 199 (class 1259 OID 53222)
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
-- TOC entry 2331 (class 0 OID 0)
-- Dependencies: 199
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- TOC entry 202 (class 1259 OID 53284)
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
-- TOC entry 201 (class 1259 OID 53282)
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
-- TOC entry 2332 (class 0 OID 0)
-- Dependencies: 201
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- TOC entry 188 (class 1259 OID 53170)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO root;

--
-- TOC entry 187 (class 1259 OID 53168)
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
-- TOC entry 2333 (class 0 OID 0)
-- Dependencies: 187
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- TOC entry 186 (class 1259 OID 53159)
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
-- TOC entry 185 (class 1259 OID 53157)
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
-- TOC entry 2334 (class 0 OID 0)
-- Dependencies: 185
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- TOC entry 203 (class 1259 OID 53312)
-- Name: django_session; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO root;

--
-- TOC entry 207 (class 1259 OID 53339)
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
-- TOC entry 206 (class 1259 OID 53337)
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
-- TOC entry 2335 (class 0 OID 0)
-- Dependencies: 206
-- Name: history_chathistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.history_chathistory_id_seq OWNED BY public.history_chathistory.id;


--
-- TOC entry 209 (class 1259 OID 53347)
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
-- TOC entry 208 (class 1259 OID 53345)
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
-- TOC entry 2336 (class 0 OID 0)
-- Dependencies: 208
-- Name: history_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.history_groups_id_seq OWNED BY public.history_groups.id;


--
-- TOC entry 211 (class 1259 OID 53355)
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
-- TOC entry 210 (class 1259 OID 53353)
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
-- TOC entry 2337 (class 0 OID 0)
-- Dependencies: 210
-- Name: history_personalmessage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.history_personalmessage_id_seq OWNED BY public.history_personalmessage.id;


--
-- TOC entry 205 (class 1259 OID 53325)
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
-- TOC entry 204 (class 1259 OID 53323)
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
-- TOC entry 2338 (class 0 OID 0)
-- Dependencies: 204
-- Name: profiles_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.profiles_profile_id_seq OWNED BY public.profiles_profile.id;


--
-- TOC entry 2089 (class 2604 OID 53191)
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- TOC entry 2090 (class 2604 OID 53201)
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 2088 (class 2604 OID 53183)
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- TOC entry 2091 (class 2604 OID 53209)
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- TOC entry 2092 (class 2604 OID 53219)
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- TOC entry 2093 (class 2604 OID 53227)
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 2094 (class 2604 OID 53287)
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- TOC entry 2087 (class 2604 OID 53173)
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- TOC entry 2086 (class 2604 OID 53162)
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- TOC entry 2097 (class 2604 OID 53342)
-- Name: history_chathistory id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.history_chathistory ALTER COLUMN id SET DEFAULT nextval('public.history_chathistory_id_seq'::regclass);


--
-- TOC entry 2098 (class 2604 OID 53350)
-- Name: history_groups id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.history_groups ALTER COLUMN id SET DEFAULT nextval('public.history_groups_id_seq'::regclass);


--
-- TOC entry 2099 (class 2604 OID 53358)
-- Name: history_personalmessage id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.history_personalmessage ALTER COLUMN id SET DEFAULT nextval('public.history_personalmessage_id_seq'::regclass);


--
-- TOC entry 2096 (class 2604 OID 53328)
-- Name: profiles_profile id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.profiles_profile ALTER COLUMN id SET DEFAULT nextval('public.profiles_profile_id_seq'::regclass);


--
-- TOC entry 2298 (class 0 OID 53188)
-- Dependencies: 192
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- TOC entry 2339 (class 0 OID 0)
-- Dependencies: 191
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- TOC entry 2300 (class 0 OID 53198)
-- Dependencies: 194
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- TOC entry 2340 (class 0 OID 0)
-- Dependencies: 193
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 2296 (class 0 OID 53180)
-- Dependencies: 190
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
-- TOC entry 2341 (class 0 OID 0)
-- Dependencies: 189
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 40, true);


--
-- TOC entry 2302 (class 0 OID 53206)
-- Dependencies: 196
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$120000$aqIK8HjD9st0$peqjopfjZk/EpurBe2fG8iWGMTshGeOQYVENkJcS6J4=	\N	f	kim			yachayx@gmail.com	f	t	2018-09-27 12:29:04.228949-05
3	pbkdf2_sha256$120000$RewWlZ26wGSw$Yk383NvNR5CevjJS7ekQrafrZHaoJ8NQ2rZIq3Obzd0=	2018-09-27 12:34:10.524534-05	f	crack			crack@live.com	f	t	2018-09-27 12:33:55.967165-05
4	pbkdf2_sha256$120000$QZv3gcV0WtN4$v1HDizAGUB8NODCI7Y09gY4fIMzn8ZoA4F/GjeituhE=	2018-09-27 12:41:43.542197-05	t	andrews			rsilva2014@live.com	t	t	2018-09-27 12:41:20.876188-05
2	pbkdf2_sha256$120000$83dMmmdmCvOi$KFSOclEd2tUIJ7Jiv76vIh+3neKIpQSAqXbUPjDt8Zo=	2018-09-27 13:24:23.63213-05	f	dave			dave@gmail.com	f	t	2018-09-27 12:30:38.409309-05
\.


--
-- TOC entry 2304 (class 0 OID 53216)
-- Dependencies: 198
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- TOC entry 2342 (class 0 OID 0)
-- Dependencies: 197
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- TOC entry 2343 (class 0 OID 0)
-- Dependencies: 195
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 4, true);


--
-- TOC entry 2306 (class 0 OID 53224)
-- Dependencies: 200
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- TOC entry 2344 (class 0 OID 0)
-- Dependencies: 199
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 2308 (class 0 OID 53284)
-- Dependencies: 202
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- TOC entry 2345 (class 0 OID 0)
-- Dependencies: 201
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- TOC entry 2294 (class 0 OID 53170)
-- Dependencies: 188
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
-- TOC entry 2346 (class 0 OID 0)
-- Dependencies: 187
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 10, true);


--
-- TOC entry 2292 (class 0 OID 53159)
-- Dependencies: 186
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
-- TOC entry 2347 (class 0 OID 0)
-- Dependencies: 185
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 27, true);


--
-- TOC entry 2309 (class 0 OID 53312)
-- Dependencies: 203
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
a7qqxrqhxxf82zwl49yc88214492m3r4	YjMzMjk4M2JmOTIxMDE1YzRjYjQ3ZjA2N2U0M2IxNTUxMTE5MWQ3Zjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2Yjc4YTI3MTUwMTJjMjFjZDJmZmRmZTBlYmNlNjZkMWVhYWE5MWQzIn0=	2018-10-11 13:24:23.649916-05
\.


--
-- TOC entry 2313 (class 0 OID 53339)
-- Dependencies: 207
-- Data for Name: history_chathistory; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.history_chathistory (id, message, date, group_id, user_id) FROM stdin;
\.


--
-- TOC entry 2348 (class 0 OID 0)
-- Dependencies: 206
-- Name: history_chathistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.history_chathistory_id_seq', 1, false);


--
-- TOC entry 2315 (class 0 OID 53347)
-- Dependencies: 209
-- Data for Name: history_groups; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.history_groups (id, name, type, date) FROM stdin;
1	Technology	tech	2018-06-03 10:00:00-05
\.


--
-- TOC entry 2349 (class 0 OID 0)
-- Dependencies: 208
-- Name: history_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.history_groups_id_seq', 1, false);


--
-- TOC entry 2317 (class 0 OID 53355)
-- Dependencies: 211
-- Data for Name: history_personalmessage; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.history_personalmessage (id, message, date, profile_reciver_id, user_sender_id) FROM stdin;
\.


--
-- TOC entry 2350 (class 0 OID 0)
-- Dependencies: 210
-- Name: history_personalmessage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.history_personalmessage_id_seq', 1, false);


--
-- TOC entry 2311 (class 0 OID 53325)
-- Dependencies: 205
-- Data for Name: profiles_profile; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.profiles_profile (id, number, date_of_birth, date_inserted, image, user_id) FROM stdin;
1	096816232	1978-06-01 05:00:00-05	2018-09-27 12:29:00-05	my.gif	2
3	0968196666	2004-01-01 07:00:00-05	2018-09-27 12:33:00-05	my.jpeg	3
\.


--
-- TOC entry 2351 (class 0 OID 0)
-- Dependencies: 204
-- Name: profiles_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.profiles_profile_id_seq', 3, true);


--
-- TOC entry 2113 (class 2606 OID 53195)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 2118 (class 2606 OID 53250)
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 2121 (class 2606 OID 53203)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2115 (class 2606 OID 53193)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 2108 (class 2606 OID 53236)
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 2110 (class 2606 OID 53185)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2129 (class 2606 OID 53221)
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 2132 (class 2606 OID 53265)
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- TOC entry 2123 (class 2606 OID 53211)
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2135 (class 2606 OID 53229)
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2138 (class 2606 OID 53279)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- TOC entry 2126 (class 2606 OID 53307)
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 2141 (class 2606 OID 53293)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 2103 (class 2606 OID 53177)
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 2105 (class 2606 OID 53175)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 2101 (class 2606 OID 53167)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2145 (class 2606 OID 53319)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 2152 (class 2606 OID 53344)
-- Name: history_chathistory history_chathistory_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.history_chathistory
    ADD CONSTRAINT history_chathistory_pkey PRIMARY KEY (id);


--
-- TOC entry 2155 (class 2606 OID 53352)
-- Name: history_groups history_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.history_groups
    ADD CONSTRAINT history_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 2157 (class 2606 OID 53363)
-- Name: history_personalmessage history_personalmessage_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.history_personalmessage
    ADD CONSTRAINT history_personalmessage_pkey PRIMARY KEY (id);


--
-- TOC entry 2148 (class 2606 OID 53330)
-- Name: profiles_profile profiles_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.profiles_profile
    ADD CONSTRAINT profiles_profile_pkey PRIMARY KEY (id);


--
-- TOC entry 2111 (class 1259 OID 53238)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 2116 (class 1259 OID 53251)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- TOC entry 2119 (class 1259 OID 53252)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- TOC entry 2106 (class 1259 OID 53237)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- TOC entry 2127 (class 1259 OID 53267)
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- TOC entry 2130 (class 1259 OID 53266)
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- TOC entry 2133 (class 1259 OID 53281)
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- TOC entry 2136 (class 1259 OID 53280)
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- TOC entry 2124 (class 1259 OID 53308)
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 2139 (class 1259 OID 53304)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- TOC entry 2142 (class 1259 OID 53305)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- TOC entry 2143 (class 1259 OID 53321)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- TOC entry 2146 (class 1259 OID 53320)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 2150 (class 1259 OID 53376)
-- Name: history_chathistory_group_id_f18baa15; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX history_chathistory_group_id_f18baa15 ON public.history_chathistory USING btree (group_id);


--
-- TOC entry 2153 (class 1259 OID 53382)
-- Name: history_chathistory_user_id_43d0e70a; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX history_chathistory_user_id_43d0e70a ON public.history_chathistory USING btree (user_id);


--
-- TOC entry 2158 (class 1259 OID 53374)
-- Name: history_personalmessage_profile_reciver_id_c1919511; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX history_personalmessage_profile_reciver_id_c1919511 ON public.history_personalmessage USING btree (profile_reciver_id);


--
-- TOC entry 2159 (class 1259 OID 53375)
-- Name: history_personalmessage_user_sender_id_59da1eaf; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX history_personalmessage_user_sender_id_59da1eaf ON public.history_personalmessage USING btree (user_sender_id);


--
-- TOC entry 2149 (class 1259 OID 53336)
-- Name: profiles_profile_user_id_a3e81f91; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX profiles_profile_user_id_a3e81f91 ON public.profiles_profile USING btree (user_id);


--
-- TOC entry 2162 (class 2606 OID 53244)
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2161 (class 2606 OID 53239)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2160 (class 2606 OID 53230)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2164 (class 2606 OID 53259)
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2163 (class 2606 OID 53254)
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2166 (class 2606 OID 53273)
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2165 (class 2606 OID 53268)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2167 (class 2606 OID 53294)
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2168 (class 2606 OID 53299)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2170 (class 2606 OID 53377)
-- Name: history_chathistory history_chathistory_group_id_f18baa15_fk_history_groups_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.history_chathistory
    ADD CONSTRAINT history_chathistory_group_id_f18baa15_fk_history_groups_id FOREIGN KEY (group_id) REFERENCES public.history_groups(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2171 (class 2606 OID 53383)
-- Name: history_chathistory history_chathistory_user_id_43d0e70a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.history_chathistory
    ADD CONSTRAINT history_chathistory_user_id_43d0e70a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2172 (class 2606 OID 53364)
-- Name: history_personalmessage history_personalmess_profile_reciver_id_c1919511_fk_profiles_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.history_personalmessage
    ADD CONSTRAINT history_personalmess_profile_reciver_id_c1919511_fk_profiles_ FOREIGN KEY (profile_reciver_id) REFERENCES public.profiles_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2173 (class 2606 OID 53369)
-- Name: history_personalmessage history_personalmessage_user_sender_id_59da1eaf_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.history_personalmessage
    ADD CONSTRAINT history_personalmessage_user_sender_id_59da1eaf_fk_auth_user_id FOREIGN KEY (user_sender_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2169 (class 2606 OID 53331)
-- Name: profiles_profile profiles_profile_user_id_a3e81f91_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.profiles_profile
    ADD CONSTRAINT profiles_profile_user_id_a3e81f91_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2018-09-27 13:32:11 -05

--
-- PostgreSQL database dump complete
--

