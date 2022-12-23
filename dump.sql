--
-- PostgreSQL database dump
--

-- Dumped from database version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.session (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    token text NOT NULL,
    "createAt" date DEFAULT now()
);


ALTER TABLE public.session OWNER TO postgres;

--
-- Name: session_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.session_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.session_id_seq OWNER TO postgres;

--
-- Name: session_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.session_id_seq OWNED BY public.session.id;


--
-- Name: urls; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.urls (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    link text NOT NULL,
    "shortlyLink" text NOT NULL,
    amount integer DEFAULT 0 NOT NULL,
    "createAt" date DEFAULT now()
);


ALTER TABLE public.urls OWNER TO postgres;

--
-- Name: urls_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.urls_id_seq OWNER TO postgres;

--
-- Name: urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.urls_id_seq OWNED BY public.urls.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    "createAt" date DEFAULT now()
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: session id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.session ALTER COLUMN id SET DEFAULT nextval('public.session_id_seq'::regclass);


--
-- Name: urls id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.urls ALTER COLUMN id SET DEFAULT nextval('public.urls_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.session (id, "userId", token, "createAt") FROM stdin;
1	2	a39e65a3-a953-4246-9d02-669b220d8587	2022-12-20
2	2	5a47e630-df78-450c-aa37-06c2ada1e8b3	2022-12-20
3	2	8c187dd4-0cf6-42ce-9789-59274a0619a4	2022-12-20
4	2	fd569727-8cf9-4c38-a75b-6fce428c5010	2022-12-21
5	3	b2bbeca9-3720-47bb-8b54-8d7151cbec1c	2022-12-21
6	2	8773176d-4256-489d-90e1-4dd5a97064cd	2022-12-21
7	2	3e335234-73f2-4875-ac5d-5a74477630fd	2022-12-21
8	3	5be31c72-a514-42fd-86f3-8b10e20f12f0	2022-12-21
9	3	767dde0a-864d-4e93-88bd-62fa0b9ca11a	2022-12-21
10	5	e874b993-1927-4c44-a36b-bdce68b6e85a	2022-12-21
11	5	48479745-d3f2-4d88-8bb2-0b74784e30ba	2022-12-21
\.


--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.urls (id, "userId", link, "shortlyLink", amount, "createAt") FROM stdin;
2	2	asdfasdfasdf	JyHYSrAo	0	2022-12-21
3	2	asdfasdfasdf	0aOX-OfY	0	2022-12-21
4	2	asdfasdfasdf	DOefDIeY	0	2022-12-21
5	2	asdfasdfasdf	LhaKrH96	0	2022-12-21
6	2	asdfasdfasdf	UkOko6Nh	0	2022-12-21
11	3	NAHANAHANAHANAH	C9w8Hn_u	35	2022-12-21
10	2	https://www.notion.so/bootcampra/Projeto-Shortly-API-3ef2afe78c254d069f862c036efa6f04	iTH8n0E6	1	2022-12-21
18	3	NAHANAHANAHANAH	G2GLUcVu	1	2022-12-21
7	2	https://www.geeksforgeeks.org/express-js-res-redirect-function/	4OVKRrRS	7	2022-12-21
9	2	https://www.notion.so/bootcampra/Projeto-Shortly-API-3ef2afe78c254d069f862c036efa6f04	_nwkw9eA	0	2022-12-21
21	3	123412341234	d9bRxty2	4	2022-12-21
22	3	https://www.youtube.com	WfyZDBKd	3	2022-12-21
23	5	https://www.youtube.com	GBT6qhw9	0	2022-12-21
8	2	https://www.notion.so/bootcampra/Projeto-Shortly-API-3ef2afe78c254d069f862c036efa6f04	oz4mYeKp	10	2022-12-21
12	3	NAHANAHANAHANAH	ipE7ooSw	0	2022-12-21
13	3	NAHANAHANAHANAH	v3iI1cIL	0	2022-12-21
14	3	NAHANAHANAHANAH	yq-ulE3b	0	2022-12-21
15	3	NAHANAHANAHANAH	h44oyREE	0	2022-12-21
16	3	NAHANAHANAHANAH	3ZQ9S_uv	0	2022-12-21
17	3	NAHANAHANAHANAH	AWGZtJWT	0	2022-12-21
19	3	NAHANAHANAHANAH	_GHvDina	0	2022-12-21
20	3	NAHANAHANAHANAH	uv4_-X77	3	2022-12-21
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, password, "createAt") FROM stdin;
1	ação	fasdfasdfas	$2b$10$6FpqTiAmu2ZR8FMzpZhlLOsctOCBy0XzW59p.5Bl5rOjlOfmY/7V6	2022-12-20
2	Gabriel	gabriel@email.com	$2b$10$P.a.fEAKYchMF4tyIH2e7uxmcZ8.vzvAT9nBuxI71zeJZm2CoK2W2	2022-12-20
3	GabrielMed	gabrielMed@email.com	$2b$10$nN5vGKQ2VkpOfHnndbf5BuHuVLcdAXGoxhOn16kc/BTRj43jjZ7sO	2022-12-21
4	Gabriellll	gabriel@emailll.com	$2b$10$VKJ7s0Dun8I/qrCHLk5q/eyZCdVSa0FMGkPeirv3JNUpkpvz0LYcK	2022-12-21
5	Gabrielllfghjl	gabriel@emailllfghj.com	$2b$10$pQvKL6d2UzX7tyvTGBt9fOBVyMZEuNGZYlpqfgLCpCltfRN34B5UW	2022-12-21
\.


--
-- Name: session_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.session_id_seq', 11, true);


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.urls_id_seq', 23, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 5, true);


--
-- Name: session session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT session_pkey PRIMARY KEY (id);


--
-- Name: urls urls_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

