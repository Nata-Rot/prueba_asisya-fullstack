--
-- PostgreSQL database dump
--

\restrict NX3gB30LOHd0exUMOP81ldv9br5IaZAoSXavMyv9AdRKojKAsybmKLp0YSdm836

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

-- Started on 2025-11-02 23:01:23

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 218 (class 1259 OID 21495)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    categoryid integer NOT NULL,
    categoryname character varying(255) NOT NULL,
    description text,
    picture bytea,
    createdat timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updatedat timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 21494)
-- Name: categories_categoryid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_categoryid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_categoryid_seq OWNER TO postgres;

--
-- TOC entry 4938 (class 0 OID 0)
-- Dependencies: 217
-- Name: categories_categoryid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_categoryid_seq OWNED BY public.categories.categoryid;


--
-- TOC entry 222 (class 1259 OID 21515)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    productid integer NOT NULL,
    productname character varying(255) NOT NULL,
    supplierid integer,
    categoryid integer,
    quantityperunit character varying(255),
    unitprice numeric(10,2),
    unitsinstock integer,
    unitsonorder integer,
    reorderlevel integer,
    discontinued boolean DEFAULT false
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 21514)
-- Name: products_productid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_productid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_productid_seq OWNER TO postgres;

--
-- TOC entry 4939 (class 0 OID 0)
-- Dependencies: 221
-- Name: products_productid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_productid_seq OWNED BY public.products.productid;


--
-- TOC entry 220 (class 1259 OID 21506)
-- Name: suppliers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.suppliers (
    supplierid integer NOT NULL,
    companyname character varying(255) NOT NULL,
    contactname character varying(255),
    contacttitle character varying(255),
    address character varying(255),
    city character varying(255),
    region character varying(255),
    postalcode character varying(20),
    country character varying(255),
    phone character varying(50),
    fax character varying(50),
    homepage text
);


ALTER TABLE public.suppliers OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 21505)
-- Name: suppliers_supplierid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.suppliers_supplierid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.suppliers_supplierid_seq OWNER TO postgres;

--
-- TOC entry 4940 (class 0 OID 0)
-- Dependencies: 219
-- Name: suppliers_supplierid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.suppliers_supplierid_seq OWNED BY public.suppliers.supplierid;


--
-- TOC entry 224 (class 1259 OID 21562)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password_hash character varying(255) NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    role character varying(50) DEFAULT 'User'::character varying NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 21561)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 4941 (class 0 OID 0)
-- Dependencies: 223
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 4757 (class 2604 OID 21498)
-- Name: categories categoryid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN categoryid SET DEFAULT nextval('public.categories_categoryid_seq'::regclass);


--
-- TOC entry 4761 (class 2604 OID 21518)
-- Name: products productid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN productid SET DEFAULT nextval('public.products_productid_seq'::regclass);


--
-- TOC entry 4760 (class 2604 OID 21509)
-- Name: suppliers supplierid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suppliers ALTER COLUMN supplierid SET DEFAULT nextval('public.suppliers_supplierid_seq'::regclass);


--
-- TOC entry 4763 (class 2604 OID 21565)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 4926 (class 0 OID 21495)
-- Dependencies: 218
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (categoryid, categoryname, description, picture, createdat, updatedat) FROM stdin;
1	Beverages	Soft drinks, coffees, teas, beers, and ales	\N	2025-10-29 19:47:34.265145	2025-10-29 19:47:34.265145
2	Condiments	Sweet and savory sauces, relishes, spreads, and seasonings	\N	2025-10-29 19:47:34.265145	2025-10-29 19:47:34.265145
4	Grains/Cereals	Breads, crackers, pasta, and cereal	\N	2025-10-29 19:47:34.265145	2025-10-29 19:47:34.265145
5	SERVIDORES	Servidores fisicos y virtuales	\\x	2025-10-30 20:51:11.721349	2025-10-30 20:51:11.721448
6	CLOUD	Servicios y soluciones de computacion en la nube	\\x	2025-10-30 20:51:22.155607	2025-10-30 20:51:22.155607
7	Computadores	Equipos Asus	\\x	2025-11-02 19:58:11.210038	2025-11-02 19:58:11.210142
\.


--
-- TOC entry 4930 (class 0 OID 21515)
-- Dependencies: 222
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) FROM stdin;
1063	MongoDB Database 2987	\N	1	6 units	774.42	62	44	7	f
6	MongoDB Database 3106	\N	1	7 units	736.44	61	34	13	f
7	Google Cloud Compute 5633	\N	2	3 units	1067.83	39	32	15	f
8	Oracle Database 2810	\N	2	4 units	1080.92	49	44	10	f
9	Server Dell PowerEdge 3595	\N	2	1 units	220.88	21	48	18	f
11	Kubernetes Cluster 3053	\N	1	5 units	392.68	95	18	18	f
12	Azure Virtual Machine 4805	\N	2	7 units	104.67	68	40	17	f
13	Oracle Database 9459	\N	2	1 units	572.45	68	1	14	t
14	Google Cloud Compute 4795	\N	2	1 units	156.41	0	11	9	f
15	MySQL Database 7269	\N	1	3 units	1079.78	22	5	6	f
16	Node.js Runtime 2562	\N	1	8 units	554.12	58	39	6	f
17	Azure Virtual Machine 3422	\N	1	3 units	572.64	66	12	6	f
18	Python Runtime 2943	\N	2	3 units	785.03	50	28	7	f
19	Redis Cache 3291	\N	2	7 units	127.01	21	5	10	f
20	HP ProLiant Server 7408	\N	2	6 units	463.51	53	9	12	t
21	MySQL Database 8878	\N	1	4 units	269.20	91	1	17	f
22	Azure Virtual Machine 9343	\N	2	4 units	841.87	1	9	11	f
23	IBM System x 5937	\N	2	3 units	1095.25	95	20	13	t
24	Docker Container 5009	\N	2	9 units	116.30	50	30	11	f
25	Server Dell PowerEdge 3335	\N	2	9 units	485.26	95	38	13	f
26	Apache Web Server 3459	\N	2	5 units	364.57	16	13	9	f
27	Nginx Load Balancer 2668	\N	2	9 units	715.49	34	4	8	f
28	PostgreSQL Server 6138	\N	2	9 units	993.87	53	21	8	f
29	HP ProLiant Server 9284	\N	1	5 units	805.11	82	13	18	f
30	Google Cloud Compute 9561	\N	2	4 units	915.53	18	4	9	f
31	Tomcat Application Server 8532	\N	1	7 units	390.74	30	22	15	f
32	Cisco UCS 2816	\N	1	1 units	609.11	80	16	17	f
33	Google Cloud Compute 3477	\N	2	5 units	795.61	61	14	9	f
34	Apache Web Server 5630	\N	1	9 units	679.42	80	26	19	f
35	Python Runtime 7505	\N	2	8 units	247.22	80	11	10	f
36	Tomcat Application Server 5449	\N	2	2 units	145.80	66	26	7	f
37	IBM System x 9588	\N	1	1 units	154.77	64	20	5	f
38	Kubernetes Cluster 9990	\N	1	6 units	1000.97	6	16	17	f
39	AWS EC2 Instance 4211	\N	1	6 units	311.48	9	14	11	f
40	Python Runtime 2967	\N	1	8 units	1001.76	66	30	18	f
41	PostgreSQL Server 6591	\N	2	5 units	717.76	76	22	9	f
42	Python Runtime 6340	\N	2	1 units	796.80	26	11	7	f
43	IBM System x 6213	\N	1	4 units	791.48	38	19	7	f
44	Tomcat Application Server 9978	\N	1	5 units	213.70	91	24	16	f
45	Tomcat Application Server 6768	\N	1	3 units	499.84	37	10	10	t
46	Nginx Load Balancer 3420	\N	2	7 units	997.69	20	19	19	f
47	Google Cloud Compute 3205	\N	2	3 units	598.52	3	30	12	f
48	Nginx Load Balancer 2381	\N	1	6 units	195.71	44	11	16	f
49	Redis Cache 6434	\N	2	7 units	1092.53	81	45	14	f
50	Azure Virtual Machine 7977	\N	2	4 units	276.07	82	18	11	f
51	Tomcat Application Server 5880	\N	1	9 units	924.54	76	45	13	f
52	Node.js Runtime 9109	\N	2	7 units	435.53	4	21	12	f
53	PostgreSQL Server 2334	\N	1	6 units	433.97	45	28	11	f
54	MySQL Database 9574	\N	2	1 units	240.20	11	28	18	f
55	Oracle Database 6385	\N	1	7 units	967.65	83	31	18	f
56	Kubernetes Cluster 6916	\N	1	1 units	941.90	53	21	16	f
57	Tomcat Application Server 7429	\N	1	7 units	231.70	77	29	6	f
58	Redis Cache 9745	\N	1	2 units	850.46	99	33	8	f
59	Python Runtime 7983	\N	1	9 units	874.98	22	31	13	f
60	Server Dell PowerEdge 8004	\N	2	4 units	536.87	23	37	12	f
61	Redis Cache 6355	\N	2	1 units	611.44	47	19	7	f
62	Aws	\N	5	89	0.03	3	3	5	f
3	Azure	\N	5	4	388000.00	2	2	5	t
63	Kubernetes Cluster 3901	\N	2	3 units	651.28	77	13	15	f
64	AWS EC2 Instance 1943	\N	2	4 units	722.87	12	41	12	f
65	Server Dell PowerEdge 4168	\N	2	1 units	1012.90	49	1	18	f
66	HP ProLiant Server 9701	\N	2	1 units	336.92	41	21	13	f
67	HP ProLiant Server 9499	\N	1	8 units	695.58	36	4	18	f
68	Kubernetes Cluster 9433	\N	1	4 units	1087.36	73	19	17	f
69	MySQL Database 6730	\N	2	1 units	315.15	92	8	7	f
70	Server Dell PowerEdge 1535	\N	1	4 units	643.85	46	27	8	f
71	Python Runtime 8074	\N	1	2 units	1080.86	75	11	10	f
72	AWS EC2 Instance 6539	\N	1	4 units	196.90	7	28	7	f
73	Tomcat Application Server 5657	\N	1	8 units	760.75	74	49	6	t
74	Redis Cache 6193	\N	1	1 units	200.73	77	20	8	f
75	Docker Container 6776	\N	2	3 units	898.32	26	21	9	f
76	Kubernetes Cluster 1340	\N	1	1 units	243.52	7	47	13	f
77	IBM System x 4662	\N	1	5 units	898.23	2	8	17	f
78	Redis Cache 6715	\N	1	9 units	641.93	95	47	7	f
1064	Docker Container 3640	\N	2	3 units	1036.02	12	37	14	f
1065	Oracle Database 3733	\N	2	4 units	293.81	53	24	13	f
4	Cisco UCS 43	\N	1	5 units	305.79	24	22	10	f
79	Python Runtime 8071	\N	1	3 units	201.10	62	29	7	f
80	Cisco UCS 6114	\N	2	9 units	165.24	97	30	14	f
81	Kubernetes Cluster 6432	\N	2	1 units	1051.13	37	6	13	f
82	Azure Virtual Machine 3958	\N	2	6 units	649.43	7	43	5	f
83	Apache Web Server 6686	\N	2	5 units	360.20	46	49	10	f
84	Cisco UCS 5824	\N	2	9 units	303.73	8	47	13	f
85	IBM System x 3704	\N	2	5 units	733.85	19	29	13	t
86	Docker Container 1191	\N	1	7 units	674.99	23	15	12	f
87	Tomcat Application Server 4287	\N	2	3 units	288.15	33	5	17	t
88	Node.js Runtime 2691	\N	2	7 units	794.26	33	13	13	f
89	SQL Server 9585	\N	1	8 units	306.42	87	3	12	f
90	Azure Virtual Machine 2052	\N	1	5 units	966.20	88	23	12	f
91	Node.js Runtime 6114	\N	1	6 units	234.71	47	42	9	f
92	Docker Container 8514	\N	1	7 units	890.10	88	22	7	f
93	Kubernetes Cluster 6688	\N	2	6 units	333.08	64	48	13	f
94	Python Runtime 6131	\N	2	8 units	1070.80	95	18	14	f
95	SQL Server 1918	\N	2	2 units	684.94	60	49	9	f
96	AWS EC2 Instance 2889	\N	1	1 units	588.73	4	18	7	f
97	HP ProLiant Server 2133	\N	2	7 units	1076.96	77	28	10	f
98	AWS EC2 Instance 1732	\N	2	8 units	627.29	80	10	12	t
99	AWS EC2 Instance 5805	\N	2	3 units	767.68	43	18	6	f
100	IBM System x 4734	\N	1	1 units	423.74	40	28	14	f
101	Cisco UCS 8851	\N	1	6 units	635.68	30	6	13	f
102	Node.js Runtime 5517	\N	2	6 units	934.20	41	30	5	f
103	Google Cloud Compute 7164	\N	2	7 units	688.06	90	45	7	f
104	Apache Web Server 8599	\N	1	9 units	113.17	85	44	6	f
105	Node.js Runtime 1677	\N	1	3 units	193.45	66	46	17	f
106	Node.js Runtime 4202	\N	2	4 units	104.03	34	6	18	f
107	SQL Server 1128	\N	1	8 units	289.49	22	14	19	t
108	HP ProLiant Server 9787	\N	1	3 units	177.15	64	10	17	f
109	AWS EC2 Instance 2731	\N	2	4 units	161.24	12	28	7	f
110	HP ProLiant Server 1632	\N	2	3 units	708.42	84	19	13	f
111	MySQL Database 5783	\N	2	4 units	793.44	82	17	9	f
112	Azure Virtual Machine 4779	\N	2	9 units	643.96	45	13	5	f
113	Oracle Database 7033	\N	2	1 units	658.54	11	2	10	f
114	Redis Cache 1279	\N	2	2 units	815.08	81	4	11	f
115	Python Runtime 1238	\N	1	3 units	351.08	93	46	13	f
116	Google Cloud Compute 7344	\N	2	8 units	1091.17	98	5	7	f
117	AWS EC2 Instance 7372	\N	2	2 units	341.14	59	49	17	f
118	IBM System x 4409	\N	1	2 units	825.68	50	32	7	f
119	Docker Container 3928	\N	1	7 units	245.60	22	28	11	f
120	Redis Cache 9074	\N	1	6 units	924.60	68	43	12	f
121	Nginx Load Balancer 4595	\N	2	9 units	205.44	65	5	10	f
122	SQL Server 2476	\N	1	3 units	507.18	90	26	7	f
123	AWS EC2 Instance 9592	\N	2	8 units	533.13	41	27	13	f
124	Google Cloud Compute 2281	\N	1	3 units	547.02	50	38	6	f
125	Azure Virtual Machine 4043	\N	1	7 units	616.11	86	46	19	f
126	Nginx Load Balancer 5013	\N	1	5 units	734.53	70	12	17	f
127	Server Dell PowerEdge 1355	\N	2	7 units	641.11	5	44	14	f
128	Kubernetes Cluster 3569	\N	1	7 units	271.44	58	12	13	f
129	Kubernetes Cluster 5614	\N	2	3 units	150.00	39	23	10	f
130	Python Runtime 1805	\N	1	1 units	395.74	58	47	9	f
131	Docker Container 9347	\N	1	5 units	241.53	54	23	10	t
132	AWS EC2 Instance 9781	\N	1	8 units	322.09	5	47	14	f
133	Node.js Runtime 5066	\N	1	1 units	969.10	31	36	15	f
134	Google Cloud Compute 6111	\N	1	7 units	319.65	82	8	5	f
135	Nginx Load Balancer 6855	\N	1	6 units	410.89	96	45	10	f
136	Docker Container 8534	\N	2	4 units	483.69	68	42	6	f
137	Tomcat Application Server 8716	\N	2	3 units	508.53	11	3	18	f
138	Apache Web Server 6563	\N	1	6 units	705.66	80	15	17	f
139	Redis Cache 7564	\N	2	1 units	405.46	9	45	13	f
140	Tomcat Application Server 6271	\N	1	3 units	193.66	83	22	12	f
141	Tomcat Application Server 6693	\N	1	4 units	343.72	15	37	8	f
142	MySQL Database 8507	\N	1	5 units	330.51	39	41	18	f
143	Tomcat Application Server 6376	\N	1	1 units	692.95	67	38	17	f
144	Docker Container 4406	\N	1	6 units	161.56	83	16	14	f
145	Python Runtime 5054	\N	2	3 units	713.11	35	24	8	f
146	HP ProLiant Server 6599	\N	1	7 units	678.92	92	26	12	f
147	Node.js Runtime 9865	\N	2	8 units	506.88	74	16	5	f
148	Python Runtime 3619	\N	2	5 units	591.51	78	19	7	f
149	Node.js Runtime 6457	\N	2	9 units	627.72	64	27	11	t
150	Python Runtime 1646	\N	1	8 units	803.50	40	12	11	f
151	Azure Virtual Machine 3766	\N	1	4 units	101.04	40	23	16	f
152	Google Cloud Compute 4182	\N	2	9 units	626.91	0	45	15	f
153	Tomcat Application Server 5980	\N	2	7 units	932.67	6	38	8	f
154	Cisco UCS 5312	\N	2	4 units	440.10	35	34	9	f
155	Redis Cache 7414	\N	2	5 units	375.35	70	37	17	f
156	MongoDB Database 9227	\N	1	1 units	917.76	71	29	6	f
157	Tomcat Application Server 6077	\N	1	5 units	270.91	19	14	10	f
158	Redis Cache 3928	\N	1	8 units	428.59	10	33	18	f
159	Cisco UCS 9619	\N	1	6 units	488.01	71	7	17	f
160	Redis Cache 5233	\N	2	5 units	280.82	90	13	5	f
161	HP ProLiant Server 2375	\N	1	1 units	834.89	9	28	9	f
162	Tomcat Application Server 6622	\N	2	7 units	656.30	66	47	14	f
163	Google Cloud Compute 2434	\N	1	8 units	582.00	61	18	18	f
164	Azure Virtual Machine 6027	\N	1	4 units	842.26	59	49	12	f
165	SQL Server 7899	\N	1	5 units	1086.82	13	16	17	f
166	MongoDB Database 7546	\N	2	4 units	256.46	90	5	5	f
167	Tomcat Application Server 8563	\N	2	3 units	629.53	52	15	11	f
168	Server Dell PowerEdge 4223	\N	1	2 units	661.31	59	28	9	f
169	AWS EC2 Instance 5481	\N	2	6 units	276.37	34	33	18	f
170	Docker Container 8007	\N	1	9 units	574.10	39	36	10	f
171	Apache Web Server 2050	\N	1	3 units	1070.98	14	1	18	f
172	SQL Server 6075	\N	2	8 units	631.57	17	4	17	f
173	AWS EC2 Instance 9700	\N	1	1 units	570.33	44	18	5	f
174	Tomcat Application Server 1900	\N	2	3 units	466.28	96	0	10	f
175	Tomcat Application Server 3906	\N	2	3 units	494.49	34	13	11	f
176	Server Dell PowerEdge 1924	\N	1	6 units	668.64	71	8	11	f
177	Google Cloud Compute 5200	\N	1	5 units	215.19	22	39	16	f
178	HP ProLiant Server 7869	\N	1	5 units	1066.50	97	5	5	f
179	AWS EC2 Instance 5410	\N	1	1 units	386.06	97	43	19	t
180	MySQL Database 7477	\N	1	5 units	216.30	0	36	7	f
181	Oracle Database 1597	\N	1	5 units	732.15	23	22	6	f
182	Kubernetes Cluster 2300	\N	1	1 units	695.66	80	33	18	f
183	Apache Web Server 6196	\N	2	1 units	907.43	48	1	5	f
184	Server Dell PowerEdge 1984	\N	2	6 units	1033.68	79	13	17	f
185	Google Cloud Compute 9203	\N	1	1 units	267.38	38	41	18	f
186	AWS EC2 Instance 2104	\N	2	8 units	335.48	59	14	12	f
187	Redis Cache 9672	\N	1	2 units	371.49	63	43	9	t
188	Docker Container 9993	\N	1	8 units	977.76	98	9	9	f
189	MySQL Database 3873	\N	2	6 units	849.33	36	9	12	f
190	PostgreSQL Server 1860	\N	2	8 units	1089.89	35	8	14	t
191	Cisco UCS 6904	\N	1	9 units	992.39	39	3	6	f
192	Tomcat Application Server 6849	\N	2	3 units	996.22	51	14	17	f
193	Python Runtime 3877	\N	1	2 units	525.18	26	21	14	f
194	Cisco UCS 4939	\N	1	1 units	855.49	61	25	16	f
195	Server Dell PowerEdge 4725	\N	2	8 units	440.27	78	20	8	f
196	MongoDB Database 3374	\N	1	8 units	447.17	97	11	11	f
197	SQL Server 8033	\N	2	5 units	340.66	49	48	10	f
198	MySQL Database 5518	\N	2	9 units	181.54	87	27	11	f
199	Server Dell PowerEdge 9405	\N	1	7 units	537.27	42	17	14	f
200	Apache Web Server 7461	\N	1	5 units	1076.89	7	7	16	f
201	AWS EC2 Instance 2857	\N	2	9 units	487.07	20	7	11	f
202	Oracle Database 5453	\N	1	5 units	523.88	63	30	12	f
203	SQL Server 1771	\N	2	8 units	412.78	74	46	9	f
204	Oracle Database 9590	\N	1	2 units	1027.25	0	33	13	f
205	Node.js Runtime 8776	\N	2	7 units	1096.62	65	23	7	f
206	Tomcat Application Server 4598	\N	1	6 units	241.95	87	7	14	f
207	Nginx Load Balancer 7915	\N	2	9 units	954.15	88	8	16	f
208	Cisco UCS 1383	\N	2	5 units	774.81	50	41	13	t
209	Server Dell PowerEdge 3085	\N	1	4 units	1004.02	96	34	11	f
210	Apache Web Server 9003	\N	2	2 units	910.28	80	11	17	f
211	Node.js Runtime 4055	\N	2	2 units	366.06	84	23	7	f
212	Server Dell PowerEdge 4723	\N	1	2 units	872.21	51	1	18	f
213	Kubernetes Cluster 8273	\N	1	5 units	371.14	48	40	10	f
214	Node.js Runtime 6971	\N	2	3 units	570.42	16	24	10	f
215	IBM System x 6277	\N	1	6 units	673.72	70	44	19	f
216	Oracle Database 7890	\N	2	6 units	688.14	18	30	14	t
217	Kubernetes Cluster 6884	\N	1	2 units	1024.00	83	33	11	f
218	Oracle Database 1474	\N	1	4 units	1044.82	33	39	18	f
219	Node.js Runtime 7626	\N	2	2 units	693.71	10	15	17	f
220	Google Cloud Compute 4197	\N	2	2 units	1018.77	51	21	15	f
221	Docker Container 1486	\N	1	7 units	295.27	0	5	17	f
222	AWS EC2 Instance 2896	\N	2	2 units	999.09	43	33	19	f
223	Nginx Load Balancer 9389	\N	1	2 units	836.70	20	47	17	f
224	Node.js Runtime 2542	\N	2	1 units	497.62	43	13	10	f
225	Docker Container 6205	\N	2	1 units	373.84	92	7	6	f
226	MongoDB Database 4796	\N	1	2 units	478.97	47	13	17	f
227	Kubernetes Cluster 9787	\N	1	9 units	787.19	15	43	8	f
228	Server Dell PowerEdge 9617	\N	2	8 units	500.08	19	40	10	f
229	AWS EC2 Instance 7529	\N	1	1 units	642.95	44	39	8	t
230	Kubernetes Cluster 5970	\N	1	1 units	406.25	91	11	11	f
231	Cisco UCS 4101	\N	2	4 units	430.40	54	19	17	f
232	Node.js Runtime 8657	\N	2	5 units	162.22	25	38	12	f
233	Cisco UCS 1538	\N	1	6 units	927.61	41	40	18	f
234	Oracle Database 3612	\N	2	6 units	190.69	99	17	15	f
235	Kubernetes Cluster 6543	\N	2	5 units	445.09	26	47	18	f
236	Docker Container 2895	\N	1	9 units	508.02	13	44	13	f
237	Docker Container 8270	\N	1	1 units	1032.00	92	11	17	f
238	IBM System x 3576	\N	1	4 units	857.83	50	30	10	t
239	PostgreSQL Server 3832	\N	2	8 units	793.32	59	4	19	f
240	Google Cloud Compute 7735	\N	1	5 units	866.62	40	10	15	f
241	MongoDB Database 8041	\N	2	7 units	674.31	76	24	8	f
242	Cisco UCS 1774	\N	1	3 units	361.05	28	5	8	f
243	Nginx Load Balancer 2759	\N	2	8 units	443.77	68	21	19	f
244	MongoDB Database 9965	\N	1	3 units	552.17	28	40	5	f
245	Azure Virtual Machine 8387	\N	2	1 units	231.53	23	4	19	f
246	AWS EC2 Instance 8650	\N	2	8 units	1030.83	66	17	11	f
247	Google Cloud Compute 9403	\N	2	6 units	390.79	73	30	9	f
248	HP ProLiant Server 3399	\N	2	8 units	449.80	29	19	8	f
249	Nginx Load Balancer 9739	\N	1	9 units	605.29	66	22	11	f
250	Azure Virtual Machine 9161	\N	1	8 units	1089.33	73	32	5	f
251	Oracle Database 4658	\N	1	1 units	1080.95	71	6	15	f
252	Docker Container 7446	\N	2	6 units	604.70	87	48	19	f
253	Tomcat Application Server 8833	\N	1	3 units	674.40	61	11	10	f
254	AWS EC2 Instance 2751	\N	1	2 units	179.26	88	34	11	f
255	Python Runtime 1529	\N	2	8 units	720.56	57	3	8	f
256	Python Runtime 3653	\N	2	6 units	461.72	14	2	15	f
257	HP ProLiant Server 7546	\N	2	4 units	671.95	89	12	10	f
258	HP ProLiant Server 3266	\N	2	5 units	248.68	56	46	15	f
259	Node.js Runtime 4954	\N	1	4 units	1080.54	62	16	8	f
260	Azure Virtual Machine 3449	\N	1	9 units	235.25	28	16	11	t
261	MongoDB Database 6555	\N	2	9 units	775.32	6	43	14	f
262	SQL Server 5499	\N	1	1 units	484.00	37	24	13	f
263	Tomcat Application Server 4720	\N	1	5 units	324.37	83	19	15	f
264	Redis Cache 4146	\N	2	6 units	623.91	27	49	9	t
265	Nginx Load Balancer 6141	\N	1	4 units	1038.23	79	39	14	f
266	Google Cloud Compute 6297	\N	2	3 units	499.00	69	47	9	f
267	Kubernetes Cluster 7409	\N	2	5 units	856.66	96	24	13	f
268	PostgreSQL Server 8583	\N	2	5 units	1006.70	59	22	5	f
269	HP ProLiant Server 9534	\N	2	6 units	786.66	92	9	13	f
270	IBM System x 7815	\N	1	5 units	930.23	12	29	15	f
271	AWS EC2 Instance 2401	\N	2	2 units	1072.29	7	15	6	f
272	Oracle Database 7593	\N	1	7 units	969.73	66	36	15	t
273	PostgreSQL Server 1823	\N	2	4 units	821.79	4	11	8	f
274	IBM System x 8528	\N	1	3 units	444.42	48	28	12	f
275	Docker Container 6451	\N	1	3 units	874.45	13	2	9	f
276	PostgreSQL Server 4455	\N	1	9 units	658.85	55	29	9	f
277	AWS EC2 Instance 1108	\N	2	8 units	663.47	10	20	14	f
278	PostgreSQL Server 7172	\N	1	4 units	197.76	95	21	9	t
279	MongoDB Database 6701	\N	2	4 units	790.68	23	28	6	f
280	Node.js Runtime 6692	\N	1	4 units	366.83	96	10	10	f
281	Azure Virtual Machine 5090	\N	1	4 units	223.70	49	33	17	t
282	Python Runtime 7445	\N	1	6 units	789.54	38	27	5	f
283	Kubernetes Cluster 6789	\N	1	2 units	984.82	55	4	10	t
284	Python Runtime 8403	\N	2	8 units	927.29	85	17	6	f
285	Docker Container 5304	\N	1	8 units	121.78	57	7	15	f
286	Nginx Load Balancer 8195	\N	2	8 units	795.83	92	11	9	f
287	AWS EC2 Instance 8453	\N	2	7 units	671.21	81	31	18	f
288	Cisco UCS 2156	\N	2	2 units	1041.29	81	2	7	t
289	Docker Container 3918	\N	2	3 units	1067.24	8	19	15	t
290	Cisco UCS 1267	\N	1	9 units	520.59	16	32	9	f
291	PostgreSQL Server 7134	\N	1	3 units	138.23	99	16	10	t
292	Azure Virtual Machine 4928	\N	2	5 units	994.98	69	5	11	f
293	Apache Web Server 8740	\N	1	8 units	922.34	4	11	13	f
294	Google Cloud Compute 1105	\N	1	8 units	259.47	65	39	10	f
295	Node.js Runtime 8748	\N	1	2 units	470.09	56	21	7	f
296	HP ProLiant Server 5977	\N	2	4 units	341.32	55	33	8	f
297	SQL Server 1461	\N	1	6 units	518.31	27	45	10	f
298	Node.js Runtime 9378	\N	1	9 units	848.20	78	7	16	f
299	Redis Cache 5425	\N	1	1 units	841.50	16	5	17	f
300	MySQL Database 7284	\N	1	2 units	530.79	46	2	18	f
301	Azure Virtual Machine 3782	\N	2	1 units	659.99	6	20	13	f
302	AWS EC2 Instance 3012	\N	2	1 units	1007.10	60	0	14	f
303	HP ProLiant Server 2962	\N	1	6 units	692.21	44	42	17	f
304	Python Runtime 2967	\N	2	5 units	1029.16	64	16	13	t
305	Apache Web Server 5908	\N	2	3 units	1023.93	0	14	7	f
306	Kubernetes Cluster 3386	\N	1	9 units	921.72	33	24	18	f
307	AWS EC2 Instance 3578	\N	1	6 units	630.57	48	23	5	f
308	Kubernetes Cluster 4757	\N	1	2 units	690.98	96	45	15	f
309	Node.js Runtime 7551	\N	2	1 units	585.55	99	48	11	f
310	Azure Virtual Machine 6544	\N	2	1 units	288.94	88	49	9	f
311	Node.js Runtime 5014	\N	2	5 units	697.33	47	33	5	f
312	MongoDB Database 2456	\N	1	5 units	481.33	58	16	17	f
313	MySQL Database 9996	\N	2	1 units	983.50	54	24	8	f
314	MySQL Database 9744	\N	2	4 units	629.23	73	42	15	t
315	HP ProLiant Server 9568	\N	1	6 units	1005.92	97	48	13	f
316	Oracle Database 3801	\N	1	9 units	370.01	59	8	13	f
317	Nginx Load Balancer 7126	\N	2	9 units	655.63	71	44	6	f
318	Google Cloud Compute 3791	\N	2	8 units	797.76	16	41	7	f
319	MySQL Database 7340	\N	1	6 units	941.44	84	49	7	t
320	Azure Virtual Machine 8678	\N	1	9 units	1059.99	75	16	15	f
321	SQL Server 4035	\N	2	9 units	456.33	20	18	18	f
322	MongoDB Database 5609	\N	2	8 units	1072.28	20	15	8	f
323	Nginx Load Balancer 5305	\N	1	6 units	377.26	5	20	8	f
324	Cisco UCS 3364	\N	1	5 units	681.16	26	45	15	f
325	Apache Web Server 9564	\N	1	6 units	857.38	3	9	8	f
326	Redis Cache 6557	\N	2	6 units	659.81	94	14	17	f
327	AWS EC2 Instance 7168	\N	2	2 units	250.75	23	34	12	t
328	PostgreSQL Server 3536	\N	2	4 units	799.57	88	0	11	f
329	Kubernetes Cluster 8078	\N	1	9 units	692.15	75	11	15	f
330	Azure Virtual Machine 4752	\N	1	3 units	1014.44	3	14	15	f
331	PostgreSQL Server 1350	\N	1	8 units	717.06	90	6	10	f
332	Node.js Runtime 8662	\N	1	9 units	594.74	18	13	11	t
333	Oracle Database 8700	\N	1	6 units	990.36	44	48	13	f
334	MySQL Database 3769	\N	1	3 units	455.37	59	7	16	f
335	Google Cloud Compute 8989	\N	2	1 units	113.84	83	15	18	f
336	MongoDB Database 2333	\N	2	8 units	675.24	85	1	17	f
337	MySQL Database 4706	\N	2	6 units	727.42	84	22	17	t
338	Python Runtime 9794	\N	1	6 units	588.59	45	47	14	f
339	Docker Container 8332	\N	1	4 units	426.42	68	31	7	f
340	Kubernetes Cluster 7369	\N	2	4 units	923.97	44	33	13	t
341	SQL Server 3097	\N	1	2 units	543.63	54	18	10	f
342	Cisco UCS 4421	\N	2	6 units	922.73	53	27	6	f
343	AWS EC2 Instance 3444	\N	2	4 units	860.38	65	19	17	f
344	Nginx Load Balancer 4517	\N	1	8 units	924.50	17	22	7	f
345	AWS EC2 Instance 2457	\N	2	4 units	869.91	77	27	6	f
346	SQL Server 5317	\N	1	6 units	607.56	12	17	5	f
347	Docker Container 2567	\N	2	8 units	789.67	58	8	6	f
348	PostgreSQL Server 4164	\N	1	1 units	954.38	82	46	5	f
349	Node.js Runtime 4557	\N	1	2 units	302.32	73	25	19	f
350	Server Dell PowerEdge 6601	\N	2	7 units	514.03	14	32	6	f
351	Cisco UCS 6219	\N	1	6 units	1039.24	17	36	8	f
352	Python Runtime 7632	\N	1	2 units	586.02	47	19	7	f
353	Redis Cache 5965	\N	2	1 units	648.31	99	18	7	f
354	MySQL Database 9468	\N	1	1 units	721.24	95	36	17	t
355	Cisco UCS 2084	\N	2	7 units	200.69	12	48	10	f
356	PostgreSQL Server 7964	\N	2	8 units	136.59	28	34	6	t
357	IBM System x 1919	\N	1	5 units	609.89	97	48	13	f
358	Oracle Database 1605	\N	2	6 units	124.80	80	11	7	t
359	Node.js Runtime 3343	\N	2	9 units	256.82	6	26	9	f
360	Google Cloud Compute 9870	\N	2	4 units	1062.87	15	43	15	f
361	Node.js Runtime 2872	\N	1	7 units	296.14	16	34	10	f
362	Docker Container 8433	\N	1	8 units	128.23	66	17	15	f
363	Cisco UCS 1039	\N	1	9 units	1015.05	7	38	16	f
364	Docker Container 8518	\N	1	9 units	914.37	2	33	18	f
365	Redis Cache 7992	\N	1	4 units	563.75	18	29	12	f
366	Docker Container 2648	\N	2	4 units	164.96	26	43	16	f
367	Server Dell PowerEdge 9587	\N	1	2 units	628.68	50	6	11	t
368	Python Runtime 3214	\N	2	1 units	598.30	61	18	11	f
369	Docker Container 8677	\N	2	3 units	129.37	69	44	10	t
370	Server Dell PowerEdge 8335	\N	2	8 units	633.77	6	27	11	f
371	PostgreSQL Server 9736	\N	2	6 units	265.11	60	21	10	f
372	MySQL Database 1192	\N	1	7 units	590.91	4	32	8	f
373	Node.js Runtime 5507	\N	2	3 units	1054.54	30	5	16	f
374	Nginx Load Balancer 2156	\N	1	3 units	128.96	15	6	6	f
375	Cisco UCS 6490	\N	1	5 units	518.15	98	23	17	f
376	Python Runtime 2889	\N	2	6 units	928.08	5	48	8	t
377	Python Runtime 2802	\N	1	6 units	632.06	24	48	7	f
378	Kubernetes Cluster 4761	\N	1	1 units	920.30	87	31	6	f
379	Google Cloud Compute 5173	\N	2	8 units	1095.22	21	21	11	f
380	Node.js Runtime 3726	\N	1	3 units	882.71	96	20	15	f
381	Docker Container 4933	\N	1	3 units	906.54	20	7	7	f
382	AWS EC2 Instance 8701	\N	1	7 units	405.19	80	19	15	f
383	Oracle Database 9215	\N	1	9 units	748.01	12	45	15	f
384	MySQL Database 9017	\N	1	5 units	1060.02	21	21	10	t
385	Google Cloud Compute 8332	\N	1	9 units	307.87	91	17	10	f
386	Cisco UCS 3275	\N	2	7 units	433.29	29	28	6	f
387	Cisco UCS 3190	\N	1	6 units	359.61	76	21	19	f
388	Server Dell PowerEdge 4596	\N	1	1 units	974.17	90	45	10	f
389	PostgreSQL Server 6238	\N	2	2 units	1018.85	65	38	12	f
390	Azure Virtual Machine 7734	\N	1	5 units	694.11	88	46	5	f
391	Node.js Runtime 8360	\N	1	1 units	1039.25	77	24	19	f
392	MongoDB Database 2247	\N	2	3 units	159.08	18	38	11	f
393	MySQL Database 1358	\N	2	4 units	881.71	82	17	19	f
394	IBM System x 2607	\N	1	5 units	541.29	84	34	11	f
395	PostgreSQL Server 8492	\N	2	5 units	464.59	95	4	16	f
396	Server Dell PowerEdge 2931	\N	1	3 units	282.93	37	5	9	f
397	SQL Server 6464	\N	1	4 units	702.68	68	36	19	f
398	Azure Virtual Machine 2301	\N	2	3 units	654.72	77	9	16	f
399	Cisco UCS 8800	\N	2	9 units	410.32	27	16	18	f
400	Node.js Runtime 8226	\N	1	7 units	990.50	56	29	8	f
401	Node.js Runtime 3953	\N	2	5 units	1017.76	61	4	7	f
402	Oracle Database 1099	\N	1	5 units	172.23	79	12	14	f
403	Python Runtime 6332	\N	2	2 units	175.65	24	44	5	f
404	Google Cloud Compute 6566	\N	1	8 units	310.99	78	8	14	f
405	Tomcat Application Server 1545	\N	2	1 units	820.23	47	3	19	f
406	HP ProLiant Server 3271	\N	1	9 units	836.16	3	44	19	f
407	Node.js Runtime 8585	\N	1	3 units	561.03	5	22	9	f
408	Oracle Database 4521	\N	1	7 units	980.21	71	18	14	f
409	Python Runtime 2141	\N	2	7 units	912.07	45	40	13	f
410	Tomcat Application Server 6047	\N	1	2 units	651.05	51	17	7	f
411	HP ProLiant Server 9221	\N	2	7 units	923.10	84	41	16	f
412	Apache Web Server 9339	\N	2	2 units	282.68	80	12	9	f
413	Cisco UCS 7680	\N	2	6 units	560.37	63	35	15	f
414	AWS EC2 Instance 2483	\N	2	5 units	667.20	77	33	5	t
415	MySQL Database 3492	\N	2	6 units	831.21	9	6	14	t
416	SQL Server 7449	\N	1	5 units	262.70	83	18	13	f
417	Docker Container 2350	\N	2	3 units	1000.25	26	37	5	f
418	Docker Container 8654	\N	1	7 units	130.25	77	19	13	f
419	PostgreSQL Server 3595	\N	1	3 units	1014.08	82	37	9	f
420	Azure Virtual Machine 1407	\N	1	3 units	432.30	58	15	16	f
421	Nginx Load Balancer 4985	\N	2	3 units	493.65	44	1	13	f
422	HP ProLiant Server 4431	\N	1	6 units	954.36	61	5	17	f
423	HP ProLiant Server 8629	\N	2	5 units	883.52	83	3	14	f
424	Apache Web Server 6051	\N	1	8 units	675.83	65	1	16	f
425	MongoDB Database 5350	\N	1	1 units	1083.73	58	9	16	f
426	Node.js Runtime 4232	\N	2	2 units	993.39	42	11	13	f
427	IBM System x 9351	\N	1	3 units	513.06	15	27	9	t
428	Cisco UCS 8030	\N	2	6 units	612.51	3	0	10	f
429	Apache Web Server 8034	\N	1	7 units	1058.50	15	10	5	f
430	Cisco UCS 7430	\N	1	5 units	630.94	67	20	6	t
431	PostgreSQL Server 9302	\N	1	2 units	890.14	71	27	14	t
432	Server Dell PowerEdge 9544	\N	2	5 units	493.31	55	43	5	f
433	Apache Web Server 8192	\N	2	2 units	221.62	65	45	8	f
434	AWS EC2 Instance 1132	\N	1	6 units	915.76	11	34	10	f
435	Apache Web Server 5835	\N	2	5 units	1091.20	20	13	17	f
436	Python Runtime 1586	\N	2	7 units	480.08	92	2	12	f
437	HP ProLiant Server 6944	\N	1	6 units	341.16	61	31	7	f
438	Redis Cache 4893	\N	1	8 units	606.21	15	4	15	t
439	PostgreSQL Server 9261	\N	2	4 units	678.85	28	48	15	f
440	HP ProLiant Server 9832	\N	1	7 units	1024.67	3	16	6	f
441	Google Cloud Compute 5571	\N	2	4 units	551.39	17	3	13	f
442	HP ProLiant Server 8037	\N	1	3 units	112.16	91	26	12	f
443	IBM System x 1363	\N	1	8 units	275.28	36	46	6	f
444	Node.js Runtime 1382	\N	1	5 units	638.32	91	2	17	f
445	Redis Cache 2522	\N	2	9 units	523.83	72	47	18	f
446	HP ProLiant Server 5035	\N	2	9 units	979.89	64	34	6	f
447	Tomcat Application Server 9497	\N	1	9 units	434.24	79	21	6	f
448	Redis Cache 4620	\N	2	7 units	220.50	10	26	6	f
449	Google Cloud Compute 8618	\N	2	6 units	1062.92	81	25	19	f
450	Node.js Runtime 2860	\N	1	9 units	372.65	92	0	12	f
451	Kubernetes Cluster 6589	\N	2	6 units	506.86	97	6	19	f
452	Nginx Load Balancer 3389	\N	1	2 units	677.55	6	24	14	f
453	Kubernetes Cluster 8019	\N	1	4 units	759.51	31	7	18	f
454	Azure Virtual Machine 4103	\N	2	4 units	211.45	24	38	18	t
455	PostgreSQL Server 9159	\N	1	4 units	438.75	81	24	15	f
456	Tomcat Application Server 9153	\N	2	4 units	323.70	19	3	7	f
457	IBM System x 4362	\N	1	4 units	994.97	50	48	5	f
458	Apache Web Server 7680	\N	1	2 units	423.91	34	36	6	f
459	Azure Virtual Machine 9196	\N	1	9 units	912.19	18	18	9	f
460	Node.js Runtime 8882	\N	1	5 units	876.41	32	24	15	f
461	Python Runtime 2656	\N	2	9 units	813.65	49	8	17	f
462	MongoDB Database 3231	\N	1	5 units	399.70	7	25	15	f
463	PostgreSQL Server 4099	\N	2	4 units	1068.84	63	12	9	f
464	SQL Server 6688	\N	1	3 units	338.10	74	30	10	f
465	Redis Cache 7367	\N	1	8 units	152.32	60	29	12	f
466	Google Cloud Compute 2685	\N	1	7 units	105.76	35	10	9	f
467	Google Cloud Compute 7598	\N	1	7 units	157.89	27	4	7	f
468	Nginx Load Balancer 7638	\N	1	6 units	659.14	26	10	5	f
469	Tomcat Application Server 9600	\N	2	8 units	981.67	32	33	17	f
470	Docker Container 6425	\N	2	8 units	416.43	74	7	13	f
471	Server Dell PowerEdge 2760	\N	2	4 units	1022.95	60	18	10	f
472	Cisco UCS 9629	\N	2	1 units	940.45	41	25	18	f
473	Nginx Load Balancer 2978	\N	2	9 units	1063.29	40	43	15	f
474	Cisco UCS 3334	\N	2	9 units	157.87	36	23	16	f
475	Python Runtime 7251	\N	2	3 units	1050.51	61	18	15	f
476	Docker Container 1604	\N	1	5 units	638.54	53	49	8	f
477	AWS EC2 Instance 4997	\N	1	9 units	156.96	63	15	7	f
478	HP ProLiant Server 3213	\N	2	9 units	993.49	88	42	7	t
479	Python Runtime 9595	\N	2	6 units	542.37	31	9	7	f
480	Oracle Database 6379	\N	2	3 units	302.42	77	2	8	f
481	Azure Virtual Machine 4446	\N	1	7 units	246.73	15	37	19	f
482	Cisco UCS 2410	\N	2	2 units	850.96	25	23	7	t
483	Server Dell PowerEdge 2162	\N	2	6 units	792.95	83	9	13	t
484	Azure Virtual Machine 5240	\N	1	2 units	815.78	37	1	11	f
485	Server Dell PowerEdge 3504	\N	2	9 units	444.96	27	6	13	f
486	PostgreSQL Server 3162	\N	2	8 units	355.87	44	35	9	f
487	Redis Cache 1779	\N	1	3 units	281.86	32	7	16	f
488	Kubernetes Cluster 7404	\N	2	6 units	646.58	30	47	13	f
489	Redis Cache 3451	\N	2	1 units	572.69	41	24	15	f
490	Azure Virtual Machine 1882	\N	2	4 units	377.04	80	25	18	t
491	MySQL Database 7717	\N	1	5 units	861.90	59	24	18	f
492	Tomcat Application Server 5665	\N	1	5 units	337.05	41	44	19	f
493	Python Runtime 2549	\N	1	1 units	190.95	91	16	5	f
494	Cisco UCS 1135	\N	2	8 units	924.84	2	14	13	f
495	Cisco UCS 6014	\N	1	9 units	700.55	21	47	8	f
496	Kubernetes Cluster 4830	\N	1	4 units	143.82	51	37	8	f
497	Nginx Load Balancer 1683	\N	1	7 units	601.81	6	33	16	t
498	MongoDB Database 6639	\N	2	9 units	867.88	93	23	17	f
499	MySQL Database 7816	\N	2	5 units	630.67	26	41	13	f
500	Google Cloud Compute 7601	\N	2	7 units	658.51	19	3	6	f
501	MongoDB Database 4220	\N	1	3 units	993.84	61	49	10	f
502	Cisco UCS 1034	\N	1	4 units	287.34	86	31	13	f
503	Tomcat Application Server 4431	\N	1	4 units	869.91	95	47	9	f
504	AWS EC2 Instance 1706	\N	2	7 units	826.14	83	31	12	f
505	Kubernetes Cluster 2793	\N	2	5 units	604.55	11	25	6	f
506	Apache Web Server 7331	\N	2	6 units	374.84	48	16	10	t
507	Redis Cache 4224	\N	1	5 units	731.59	80	11	11	f
508	Docker Container 9465	\N	1	3 units	102.55	57	2	7	f
509	HP ProLiant Server 2788	\N	1	3 units	769.41	29	44	19	f
510	MongoDB Database 5770	\N	2	8 units	368.89	11	34	16	f
511	Oracle Database 4355	\N	2	7 units	734.05	32	10	14	f
512	Node.js Runtime 8754	\N	1	3 units	777.62	17	28	11	f
513	Docker Container 1969	\N	2	7 units	582.06	51	23	18	t
514	Kubernetes Cluster 3371	\N	2	5 units	878.50	14	11	15	f
515	MySQL Database 8078	\N	2	3 units	938.54	57	43	8	f
516	Google Cloud Compute 2842	\N	2	4 units	812.22	82	4	16	f
517	MongoDB Database 1795	\N	1	7 units	295.75	74	12	10	t
518	Python Runtime 1395	\N	2	4 units	260.81	37	42	6	f
519	Kubernetes Cluster 2415	\N	1	3 units	974.30	89	8	16	f
520	Nginx Load Balancer 9154	\N	2	5 units	467.20	55	23	5	f
521	Tomcat Application Server 9767	\N	1	4 units	1089.10	51	22	9	f
522	Server Dell PowerEdge 5896	\N	1	5 units	888.97	54	41	8	f
523	Redis Cache 4232	\N	1	8 units	536.76	44	14	6	f
524	Tomcat Application Server 8299	\N	1	2 units	457.25	21	5	12	f
525	IBM System x 4780	\N	1	8 units	252.49	4	5	12	t
526	Azure Virtual Machine 2069	\N	2	6 units	362.78	47	2	5	f
527	Oracle Database 5414	\N	1	7 units	983.29	13	6	16	f
528	HP ProLiant Server 1527	\N	2	5 units	1053.92	64	6	15	f
529	HP ProLiant Server 9352	\N	2	6 units	383.03	96	9	19	f
530	Python Runtime 1664	\N	1	8 units	286.98	37	26	8	f
531	Oracle Database 4436	\N	1	5 units	1030.11	76	35	12	f
532	AWS EC2 Instance 9291	\N	1	6 units	564.69	70	18	18	f
533	HP ProLiant Server 6908	\N	2	8 units	682.68	28	11	15	f
534	AWS EC2 Instance 1148	\N	2	9 units	424.82	87	47	18	f
535	Nginx Load Balancer 2642	\N	1	8 units	451.58	70	44	5	f
536	HP ProLiant Server 4033	\N	2	5 units	503.73	47	18	15	f
537	AWS EC2 Instance 4635	\N	1	6 units	312.13	37	9	7	f
538	Redis Cache 1281	\N	2	5 units	490.80	51	12	13	f
539	Azure Virtual Machine 9083	\N	2	1 units	744.86	12	1	15	f
540	MongoDB Database 9437	\N	2	1 units	599.41	26	47	5	f
541	Python Runtime 4852	\N	1	7 units	637.50	54	36	15	f
542	Oracle Database 2358	\N	2	6 units	610.94	71	48	10	f
543	Tomcat Application Server 8581	\N	1	9 units	309.22	30	3	10	f
544	Cisco UCS 5104	\N	2	9 units	633.07	35	48	14	f
545	Cisco UCS 2886	\N	2	2 units	302.27	38	32	12	f
546	Cisco UCS 2023	\N	1	8 units	891.89	74	3	11	t
547	Server Dell PowerEdge 9125	\N	1	6 units	712.67	94	44	13	f
548	Azure Virtual Machine 2669	\N	2	2 units	932.27	75	36	9	f
549	IBM System x 3850	\N	2	7 units	669.76	96	31	5	f
550	Docker Container 5347	\N	2	1 units	972.04	91	0	8	f
551	Kubernetes Cluster 3023	\N	1	1 units	670.62	81	2	15	f
552	Google Cloud Compute 1316	\N	1	1 units	1088.15	21	39	12	f
553	Nginx Load Balancer 7551	\N	1	4 units	562.66	57	40	19	t
554	Azure Virtual Machine 5609	\N	2	3 units	893.93	87	34	6	f
555	Docker Container 1188	\N	2	2 units	651.90	17	37	9	f
556	MySQL Database 9029	\N	1	8 units	551.59	94	49	16	f
557	MongoDB Database 7678	\N	1	6 units	493.03	56	39	8	f
558	Google Cloud Compute 7185	\N	1	3 units	927.82	39	4	8	t
559	HP ProLiant Server 5989	\N	2	9 units	840.16	34	47	11	f
560	SQL Server 4965	\N	2	1 units	419.54	19	30	16	f
561	AWS EC2 Instance 5351	\N	1	8 units	101.10	4	20	19	f
562	Docker Container 8135	\N	2	5 units	597.50	82	33	17	f
563	Cisco UCS 4956	\N	2	8 units	519.60	53	19	13	f
564	Google Cloud Compute 7559	\N	2	8 units	770.17	80	17	10	f
565	Docker Container 1459	\N	1	7 units	672.83	22	13	19	f
566	Nginx Load Balancer 5111	\N	1	9 units	969.22	27	44	16	t
567	MySQL Database 9710	\N	1	5 units	494.27	61	34	5	f
568	IBM System x 2460	\N	1	9 units	673.42	85	2	19	f
569	Cisco UCS 5310	\N	1	7 units	729.51	85	35	6	f
570	Tomcat Application Server 3401	\N	1	9 units	391.54	87	38	14	f
571	Azure Virtual Machine 9217	\N	2	1 units	239.17	95	3	11	f
572	HP ProLiant Server 7414	\N	1	1 units	860.47	79	14	8	f
573	Python Runtime 9697	\N	1	9 units	274.10	8	47	6	f
574	SQL Server 1256	\N	2	1 units	687.53	9	31	11	f
575	Azure Virtual Machine 7240	\N	2	3 units	122.89	75	22	13	f
576	Node.js Runtime 9230	\N	2	1 units	822.54	57	9	7	f
577	Node.js Runtime 1357	\N	2	8 units	355.99	45	2	18	t
578	Nginx Load Balancer 2065	\N	2	1 units	659.93	55	42	16	f
579	AWS EC2 Instance 1254	\N	2	1 units	343.76	5	42	17	f
580	IBM System x 4036	\N	2	6 units	480.97	82	1	12	f
581	AWS EC2 Instance 1889	\N	1	9 units	218.48	97	11	10	f
582	Kubernetes Cluster 1347	\N	2	4 units	182.25	70	9	18	f
583	Tomcat Application Server 2079	\N	1	2 units	831.84	50	41	8	f
584	IBM System x 5909	\N	2	6 units	860.54	39	1	13	f
585	Server Dell PowerEdge 6721	\N	2	3 units	566.03	50	26	17	f
586	Cisco UCS 2504	\N	2	4 units	853.15	16	42	5	f
587	Cisco UCS 5166	\N	2	3 units	966.84	48	20	18	t
588	Node.js Runtime 8695	\N	2	7 units	320.04	18	5	5	f
589	Cisco UCS 7773	\N	1	4 units	139.50	95	23	14	f
590	Apache Web Server 9790	\N	1	3 units	604.42	76	16	15	t
591	Apache Web Server 7671	\N	2	8 units	586.67	61	17	16	f
592	Redis Cache 2615	\N	2	8 units	123.84	8	16	19	t
593	Nginx Load Balancer 3426	\N	1	6 units	365.97	79	16	17	f
594	Redis Cache 7441	\N	2	1 units	785.88	32	45	15	f
595	IBM System x 5629	\N	2	7 units	500.60	27	9	19	f
596	Docker Container 7562	\N	2	3 units	488.48	50	34	18	f
597	Redis Cache 8314	\N	1	4 units	589.68	27	47	13	f
598	Server Dell PowerEdge 4872	\N	2	7 units	844.96	52	33	10	f
599	HP ProLiant Server 5642	\N	2	9 units	372.79	70	45	10	f
600	Node.js Runtime 8492	\N	2	5 units	523.42	20	25	7	f
601	Node.js Runtime 1607	\N	2	3 units	680.31	26	49	6	t
602	MongoDB Database 9759	\N	1	6 units	522.67	48	35	17	f
603	HP ProLiant Server 7394	\N	2	3 units	883.94	30	11	7	f
604	MySQL Database 6071	\N	1	2 units	1035.89	58	29	19	f
605	Python Runtime 7314	\N	2	5 units	1002.81	51	7	12	f
606	SQL Server 5233	\N	2	4 units	1048.63	12	11	8	f
607	Azure Virtual Machine 4893	\N	2	6 units	495.43	72	2	15	f
608	AWS EC2 Instance 4050	\N	2	3 units	216.39	16	37	6	f
609	MongoDB Database 9689	\N	1	1 units	217.75	58	45	11	f
610	Nginx Load Balancer 5580	\N	2	5 units	185.77	36	9	10	f
611	Cisco UCS 6583	\N	2	5 units	298.79	42	33	6	f
612	HP ProLiant Server 4177	\N	2	1 units	200.76	24	21	15	f
613	MySQL Database 1127	\N	1	7 units	1026.54	40	48	11	f
614	PostgreSQL Server 1564	\N	2	7 units	668.87	89	48	16	f
615	MySQL Database 4427	\N	2	9 units	433.29	31	41	19	f
616	IBM System x 6523	\N	1	7 units	243.97	58	28	12	f
617	Google Cloud Compute 2560	\N	2	6 units	703.62	15	38	6	f
618	Node.js Runtime 4824	\N	2	6 units	821.78	59	35	7	t
619	Redis Cache 3377	\N	1	5 units	814.51	8	20	17	t
620	IBM System x 1196	\N	1	6 units	665.54	14	37	18	f
621	IBM System x 4957	\N	1	9 units	208.63	50	46	17	f
622	IBM System x 4343	\N	2	6 units	370.44	70	9	15	f
623	Kubernetes Cluster 8413	\N	2	1 units	121.55	40	15	17	f
624	Server Dell PowerEdge 3799	\N	1	1 units	812.05	5	17	19	f
625	Azure Virtual Machine 8955	\N	1	2 units	568.96	22	8	13	f
626	AWS EC2 Instance 8351	\N	2	4 units	533.70	46	12	16	f
627	Kubernetes Cluster 5096	\N	1	6 units	820.06	8	41	17	f
628	SQL Server 3016	\N	2	8 units	674.55	86	21	9	f
629	IBM System x 2717	\N	2	4 units	353.23	10	46	5	f
630	MongoDB Database 5817	\N	1	6 units	1067.51	6	31	7	f
631	Oracle Database 1649	\N	2	4 units	919.00	68	18	13	f
632	HP ProLiant Server 4816	\N	1	2 units	310.31	93	13	11	f
633	Google Cloud Compute 8112	\N	2	9 units	966.28	84	17	19	f
634	Nginx Load Balancer 8630	\N	1	5 units	505.91	3	4	5	f
635	Python Runtime 5565	\N	2	6 units	366.87	63	15	13	f
636	Docker Container 4016	\N	2	6 units	1002.88	98	34	9	f
637	HP ProLiant Server 7464	\N	2	5 units	912.36	74	34	13	f
638	MongoDB Database 1157	\N	2	2 units	114.10	4	33	6	f
639	Kubernetes Cluster 3339	\N	2	8 units	669.53	0	14	8	f
640	MySQL Database 7712	\N	2	2 units	513.37	33	2	17	f
641	SQL Server 1022	\N	2	1 units	1027.35	97	39	12	f
642	Kubernetes Cluster 2378	\N	2	3 units	662.53	94	2	6	t
643	Kubernetes Cluster 5357	\N	1	3 units	869.97	83	20	17	f
644	Kubernetes Cluster 8835	\N	2	9 units	137.03	9	2	11	f
645	SQL Server 7073	\N	1	7 units	437.52	52	4	19	f
646	Apache Web Server 4113	\N	2	9 units	710.15	24	48	19	f
647	Azure Virtual Machine 7048	\N	2	9 units	1085.91	29	24	16	f
648	MySQL Database 8004	\N	2	6 units	678.95	4	28	18	f
649	MongoDB Database 5726	\N	1	7 units	312.55	50	46	9	f
650	MySQL Database 6699	\N	1	7 units	803.38	93	0	17	f
651	MySQL Database 9398	\N	1	7 units	596.34	1	47	17	f
652	Nginx Load Balancer 8909	\N	1	6 units	1060.15	66	29	11	f
653	Redis Cache 6635	\N	2	7 units	691.46	90	24	11	f
654	HP ProLiant Server 4874	\N	1	7 units	482.22	63	16	9	f
655	Oracle Database 8270	\N	2	2 units	202.61	65	4	16	f
656	Azure Virtual Machine 2809	\N	2	9 units	876.72	54	47	9	f
657	Azure Virtual Machine 7354	\N	1	6 units	358.26	40	28	17	f
658	Azure Virtual Machine 1756	\N	2	1 units	815.67	20	39	15	f
659	Google Cloud Compute 5150	\N	1	4 units	292.56	47	39	6	t
660	PostgreSQL Server 9022	\N	1	2 units	536.91	3	18	5	f
661	Kubernetes Cluster 1212	\N	1	8 units	993.37	87	0	11	f
662	IBM System x 1543	\N	1	4 units	714.12	63	20	17	f
663	Google Cloud Compute 2348	\N	2	5 units	808.09	71	44	13	f
664	Oracle Database 6224	\N	2	2 units	1001.48	69	21	18	f
665	MongoDB Database 2814	\N	2	5 units	988.90	60	18	18	f
666	Nginx Load Balancer 2636	\N	2	4 units	917.81	44	48	15	f
667	Apache Web Server 3795	\N	2	6 units	767.07	72	35	11	f
668	Docker Container 4284	\N	1	4 units	900.48	87	14	8	f
669	SQL Server 6254	\N	2	1 units	699.89	31	31	13	f
670	Kubernetes Cluster 8714	\N	2	6 units	778.68	35	38	18	f
671	Redis Cache 6097	\N	2	8 units	335.57	75	16	13	f
672	Google Cloud Compute 7187	\N	2	9 units	653.09	13	17	14	f
673	Cisco UCS 2984	\N	2	3 units	880.74	27	41	5	f
674	Oracle Database 4391	\N	1	3 units	625.45	96	45	10	f
675	Cisco UCS 7053	\N	2	5 units	615.22	8	14	9	f
676	Azure Virtual Machine 7099	\N	2	7 units	322.61	34	16	11	f
677	MySQL Database 2936	\N	2	6 units	379.02	13	39	6	f
678	MongoDB Database 1578	\N	1	2 units	593.13	70	9	13	f
679	Docker Container 5260	\N	1	1 units	128.55	49	8	5	f
680	Node.js Runtime 7141	\N	2	9 units	105.49	56	37	18	f
681	Cisco UCS 5699	\N	2	8 units	645.00	37	42	11	f
682	IBM System x 4843	\N	2	8 units	308.50	82	25	7	f
683	MongoDB Database 4435	\N	2	1 units	1073.60	5	32	12	f
684	SQL Server 9100	\N	2	1 units	1048.73	2	49	10	f
685	Server Dell PowerEdge 5072	\N	2	5 units	319.86	21	7	9	f
686	MongoDB Database 6578	\N	2	4 units	666.50	49	39	6	f
687	Cisco UCS 5813	\N	2	2 units	462.11	54	25	14	f
688	PostgreSQL Server 2704	\N	1	6 units	258.87	69	14	11	f
689	Tomcat Application Server 4449	\N	2	2 units	860.52	35	43	7	f
690	Nginx Load Balancer 8056	\N	2	5 units	930.86	1	2	5	f
691	Kubernetes Cluster 2161	\N	2	6 units	1038.12	22	13	10	f
692	SQL Server 5770	\N	2	1 units	189.57	2	24	18	f
693	Redis Cache 1926	\N	1	8 units	601.38	66	16	13	f
694	Apache Web Server 3401	\N	2	4 units	827.53	30	34	16	f
695	Google Cloud Compute 9185	\N	1	4 units	477.43	10	16	9	t
696	HP ProLiant Server 8483	\N	1	9 units	891.19	87	49	13	f
697	Docker Container 1515	\N	2	3 units	135.97	45	43	16	f
698	Docker Container 8408	\N	1	8 units	326.30	21	12	7	f
699	IBM System x 8529	\N	1	7 units	720.01	69	26	7	f
700	Kubernetes Cluster 5761	\N	1	3 units	432.67	50	42	5	f
701	Cisco UCS 6030	\N	2	9 units	436.87	87	24	8	f
702	Oracle Database 2535	\N	2	7 units	791.27	18	13	19	t
703	Kubernetes Cluster 6720	\N	2	1 units	809.26	55	2	10	t
704	MongoDB Database 5947	\N	2	5 units	873.06	13	18	8	f
705	Tomcat Application Server 1529	\N	2	9 units	730.58	56	23	13	f
706	Cisco UCS 5765	\N	2	2 units	303.57	40	4	19	f
707	MongoDB Database 8543	\N	1	1 units	387.78	73	35	13	f
708	AWS EC2 Instance 9852	\N	2	1 units	376.85	47	45	19	f
709	Server Dell PowerEdge 3733	\N	1	6 units	306.81	80	22	7	f
710	AWS EC2 Instance 8325	\N	1	2 units	749.39	81	46	11	f
711	AWS EC2 Instance 1688	\N	1	7 units	955.73	91	34	16	f
712	Tomcat Application Server 8573	\N	2	8 units	826.92	81	11	19	f
713	PostgreSQL Server 9794	\N	1	6 units	137.20	77	44	5	f
714	SQL Server 9549	\N	1	1 units	1039.71	58	36	7	f
715	Oracle Database 7617	\N	1	6 units	811.04	73	41	13	f
716	Oracle Database 4044	\N	1	7 units	969.37	27	46	7	f
717	Python Runtime 5070	\N	2	9 units	371.34	35	23	8	f
718	Azure Virtual Machine 4374	\N	2	3 units	264.52	17	38	13	t
719	IBM System x 6454	\N	1	4 units	915.40	52	49	12	f
720	PostgreSQL Server 1206	\N	2	9 units	450.22	21	37	15	t
721	Cisco UCS 9181	\N	1	9 units	710.69	27	17	9	f
722	MongoDB Database 3435	\N	1	7 units	814.29	41	1	17	f
723	Apache Web Server 5128	\N	1	9 units	366.09	6	26	9	f
724	Cisco UCS 2263	\N	2	1 units	307.78	67	12	6	f
725	Node.js Runtime 7602	\N	2	2 units	456.76	63	15	16	f
726	Redis Cache 3937	\N	1	8 units	305.23	75	42	16	f
727	MongoDB Database 8131	\N	1	5 units	1022.04	47	23	9	f
728	MySQL Database 3446	\N	1	6 units	187.81	15	48	10	f
729	Azure Virtual Machine 8129	\N	2	7 units	535.45	89	28	16	f
730	PostgreSQL Server 8721	\N	2	9 units	955.47	78	29	19	f
731	Server Dell PowerEdge 5574	\N	1	7 units	733.84	17	21	15	f
732	MySQL Database 6212	\N	2	5 units	397.95	26	10	5	f
733	Server Dell PowerEdge 6481	\N	2	2 units	332.14	45	37	8	f
734	Python Runtime 1594	\N	1	2 units	1085.85	38	4	15	f
735	Redis Cache 2373	\N	2	2 units	607.76	35	21	12	f
736	Oracle Database 2747	\N	2	7 units	369.18	70	11	8	f
737	Tomcat Application Server 3857	\N	2	8 units	471.34	89	31	13	f
738	Redis Cache 3051	\N	1	7 units	859.45	83	46	15	f
739	Python Runtime 7428	\N	1	4 units	609.43	96	11	6	f
740	Tomcat Application Server 2886	\N	2	9 units	207.51	68	3	9	f
741	Docker Container 5900	\N	2	2 units	501.56	32	48	13	f
742	Redis Cache 3075	\N	1	9 units	948.71	27	1	14	f
743	MongoDB Database 7630	\N	1	1 units	170.76	12	42	10	f
744	Tomcat Application Server 1464	\N	2	1 units	192.48	67	5	17	f
745	PostgreSQL Server 5956	\N	2	8 units	843.03	3	35	10	f
746	Node.js Runtime 6347	\N	2	4 units	345.73	45	43	14	f
747	Azure Virtual Machine 4458	\N	1	1 units	134.37	20	17	5	f
748	Azure Virtual Machine 7118	\N	1	8 units	157.94	52	30	5	f
749	Server Dell PowerEdge 4355	\N	2	7 units	1090.75	41	14	11	f
750	Oracle Database 3641	\N	2	4 units	110.20	16	0	10	f
751	Server Dell PowerEdge 1460	\N	2	2 units	288.00	92	7	14	f
752	Python Runtime 4259	\N	1	9 units	615.61	33	16	19	f
753	MySQL Database 4689	\N	2	5 units	500.65	16	33	17	f
754	Cisco UCS 9354	\N	2	1 units	1091.29	90	3	5	f
755	MySQL Database 3905	\N	1	6 units	899.82	20	48	6	f
756	Kubernetes Cluster 7380	\N	1	8 units	600.58	8	44	8	f
757	Tomcat Application Server 1997	\N	2	5 units	782.37	38	32	6	t
758	MongoDB Database 2445	\N	1	9 units	475.78	68	28	11	f
759	MongoDB Database 1385	\N	2	3 units	1022.79	25	8	9	f
760	IBM System x 6822	\N	2	5 units	352.04	56	44	15	t
761	Apache Web Server 3314	\N	1	5 units	643.88	9	16	17	t
762	IBM System x 5294	\N	2	4 units	646.16	0	30	5	f
763	Redis Cache 9412	\N	1	9 units	483.92	14	8	15	f
764	SQL Server 8527	\N	2	7 units	712.93	9	29	6	f
765	Node.js Runtime 2767	\N	2	4 units	101.81	63	25	7	f
766	Node.js Runtime 9508	\N	2	7 units	383.84	33	15	11	f
767	Oracle Database 2726	\N	1	2 units	612.03	26	0	14	f
768	Azure Virtual Machine 8379	\N	2	6 units	291.04	1	44	12	f
769	Node.js Runtime 2192	\N	1	4 units	349.51	72	28	10	f
770	Redis Cache 6688	\N	1	1 units	721.77	78	38	14	t
771	IBM System x 1508	\N	1	3 units	119.30	64	46	6	f
772	HP ProLiant Server 9528	\N	1	4 units	446.98	4	13	14	f
773	IBM System x 2999	\N	2	4 units	130.70	29	25	15	f
774	HP ProLiant Server 9450	\N	2	9 units	527.93	49	29	10	f
775	Oracle Database 5116	\N	1	9 units	610.59	88	31	18	f
776	Redis Cache 7034	\N	1	1 units	486.58	83	0	11	f
777	Google Cloud Compute 8633	\N	1	8 units	249.88	61	2	15	f
778	AWS EC2 Instance 5930	\N	2	9 units	876.53	68	25	6	f
779	Server Dell PowerEdge 5779	\N	2	2 units	642.23	12	35	12	f
780	Server Dell PowerEdge 2699	\N	2	3 units	542.75	28	0	16	f
781	Apache Web Server 7113	\N	1	1 units	960.83	75	48	14	f
782	Apache Web Server 8779	\N	2	3 units	968.30	85	28	17	f
783	MongoDB Database 8585	\N	1	1 units	1065.56	1	23	5	f
784	Python Runtime 5049	\N	1	6 units	649.69	43	23	15	f
785	Cisco UCS 4484	\N	1	5 units	112.48	69	49	12	f
786	Node.js Runtime 5596	\N	2	2 units	276.76	6	19	13	f
787	Docker Container 4800	\N	1	2 units	714.74	78	45	6	f
788	Google Cloud Compute 6922	\N	1	8 units	1043.42	55	30	5	f
789	Python Runtime 3346	\N	2	9 units	826.52	48	34	16	f
790	Server Dell PowerEdge 1839	\N	2	9 units	443.40	92	42	13	f
791	Python Runtime 6349	\N	1	4 units	373.14	13	28	11	f
792	Google Cloud Compute 1390	\N	1	7 units	353.21	73	21	15	f
793	Tomcat Application Server 6352	\N	1	8 units	788.18	75	33	6	f
794	Node.js Runtime 1465	\N	1	7 units	367.36	51	18	16	t
795	Server Dell PowerEdge 2955	\N	1	1 units	819.46	92	47	15	f
796	IBM System x 4662	\N	2	2 units	439.91	10	39	17	f
797	Google Cloud Compute 8561	\N	1	7 units	222.45	23	47	8	f
798	Oracle Database 3717	\N	1	3 units	760.92	55	25	19	f
799	MongoDB Database 3411	\N	2	5 units	1067.04	70	26	14	f
800	Docker Container 4346	\N	1	5 units	1042.82	27	31	16	f
801	Python Runtime 9885	\N	2	1 units	552.03	4	20	12	f
802	PostgreSQL Server 5670	\N	1	3 units	691.07	10	35	12	f
803	Node.js Runtime 1215	\N	2	3 units	769.17	97	31	5	f
804	HP ProLiant Server 1682	\N	1	7 units	258.38	1	35	5	f
805	Node.js Runtime 1487	\N	1	3 units	157.55	54	5	15	f
806	Redis Cache 3757	\N	2	8 units	988.14	34	42	8	f
807	AWS EC2 Instance 1737	\N	2	1 units	844.90	48	30	6	f
808	Kubernetes Cluster 7111	\N	2	4 units	452.15	59	28	14	f
809	HP ProLiant Server 6984	\N	2	8 units	1087.82	71	37	14	f
810	HP ProLiant Server 9734	\N	1	3 units	803.09	35	31	19	f
811	Apache Web Server 7035	\N	1	3 units	243.05	40	2	6	f
812	MySQL Database 9221	\N	2	6 units	313.77	58	4	14	f
813	SQL Server 5444	\N	1	2 units	360.07	41	21	15	f
814	Apache Web Server 4016	\N	1	6 units	626.77	34	45	8	f
815	SQL Server 7880	\N	2	1 units	366.34	17	25	13	f
816	Cisco UCS 8817	\N	2	7 units	526.06	4	32	10	f
817	Tomcat Application Server 4354	\N	2	9 units	381.82	65	44	7	f
818	Nginx Load Balancer 9724	\N	2	4 units	206.02	5	35	5	f
819	Nginx Load Balancer 1357	\N	2	3 units	886.18	69	3	8	f
820	Docker Container 2799	\N	2	9 units	895.32	69	8	10	f
821	Python Runtime 8717	\N	2	6 units	320.75	67	43	8	t
822	Server Dell PowerEdge 1648	\N	2	6 units	467.13	1	33	14	f
823	Oracle Database 3102	\N	1	1 units	148.27	0	5	5	f
824	Oracle Database 2197	\N	1	5 units	754.24	4	45	8	t
825	MySQL Database 6955	\N	1	8 units	163.95	26	5	17	f
826	PostgreSQL Server 4942	\N	2	4 units	720.05	86	32	19	f
827	PostgreSQL Server 7453	\N	2	8 units	180.69	55	17	15	f
828	Google Cloud Compute 8291	\N	1	7 units	983.51	73	3	7	f
829	Cisco UCS 3776	\N	2	7 units	1056.55	69	11	13	f
830	Cisco UCS 1294	\N	2	8 units	222.50	35	7	10	f
831	Apache Web Server 3658	\N	2	9 units	718.28	89	35	12	f
832	Tomcat Application Server 5860	\N	2	6 units	697.20	97	16	14	f
833	SQL Server 3854	\N	2	7 units	339.09	24	41	11	f
834	HP ProLiant Server 2760	\N	2	6 units	746.89	76	20	13	f
835	HP ProLiant Server 8663	\N	1	1 units	729.22	28	27	19	f
836	AWS EC2 Instance 1598	\N	1	1 units	116.35	86	10	19	f
837	IBM System x 8546	\N	1	7 units	357.62	36	30	12	f
838	HP ProLiant Server 2543	\N	2	3 units	878.20	84	36	9	f
839	Docker Container 4843	\N	2	2 units	756.40	74	49	13	f
840	Docker Container 7847	\N	2	8 units	263.75	43	10	14	f
841	PostgreSQL Server 5175	\N	1	3 units	125.69	14	25	10	f
842	Tomcat Application Server 4437	\N	1	8 units	1026.97	61	44	6	f
843	Apache Web Server 6033	\N	2	3 units	782.81	96	18	16	f
844	Oracle Database 5918	\N	2	9 units	716.57	62	18	8	f
845	HP ProLiant Server 3887	\N	1	8 units	397.80	60	29	16	f
846	Azure Virtual Machine 5424	\N	2	4 units	844.89	98	25	18	f
847	Oracle Database 4938	\N	2	9 units	515.44	53	37	7	f
848	Docker Container 9995	\N	1	9 units	106.52	42	35	13	f
849	Azure Virtual Machine 7124	\N	1	1 units	755.08	77	18	5	f
850	SQL Server 5323	\N	2	8 units	693.18	69	28	8	f
851	Kubernetes Cluster 4884	\N	2	7 units	847.12	98	38	15	t
852	MySQL Database 9684	\N	1	8 units	461.97	42	8	13	f
853	Docker Container 1191	\N	1	8 units	511.56	43	8	9	f
854	Node.js Runtime 2914	\N	1	2 units	764.83	73	39	19	f
855	MongoDB Database 5484	\N	2	9 units	793.36	67	21	15	f
856	Tomcat Application Server 5879	\N	2	1 units	535.42	57	47	17	f
857	HP ProLiant Server 9916	\N	1	6 units	181.14	95	24	10	f
858	Docker Container 9896	\N	2	2 units	777.78	70	33	13	f
859	Node.js Runtime 9812	\N	1	9 units	214.49	28	12	19	t
860	Apache Web Server 5251	\N	2	5 units	280.42	68	6	11	t
861	Docker Container 3772	\N	1	5 units	587.04	12	13	8	f
862	Server Dell PowerEdge 4802	\N	1	9 units	251.36	34	45	12	f
863	IBM System x 6305	\N	2	8 units	949.56	25	42	19	f
864	PostgreSQL Server 9624	\N	2	8 units	524.44	32	49	17	t
865	Redis Cache 1749	\N	2	8 units	673.67	68	0	7	f
866	AWS EC2 Instance 5130	\N	2	8 units	500.38	99	22	9	f
867	Cisco UCS 7542	\N	1	8 units	231.15	71	39	15	f
868	HP ProLiant Server 7367	\N	2	8 units	981.62	79	10	16	f
869	Docker Container 4070	\N	2	2 units	545.36	55	42	15	f
870	AWS EC2 Instance 1829	\N	1	6 units	823.86	84	14	14	f
871	Oracle Database 8360	\N	2	6 units	249.49	45	35	14	f
872	Server Dell PowerEdge 9778	\N	2	6 units	925.90	67	38	16	f
873	MySQL Database 6192	\N	1	8 units	639.24	38	5	6	f
874	Kubernetes Cluster 7937	\N	2	4 units	879.47	24	49	13	f
875	Oracle Database 6795	\N	2	2 units	212.22	53	29	5	f
876	MongoDB Database 2063	\N	2	5 units	791.28	26	47	17	f
877	Oracle Database 9715	\N	1	4 units	161.75	83	7	19	f
878	Python Runtime 2641	\N	2	4 units	618.87	63	49	19	f
879	Azure Virtual Machine 5578	\N	2	5 units	667.80	79	1	17	f
880	Tomcat Application Server 4387	\N	2	5 units	119.91	89	4	9	f
881	Python Runtime 1687	\N	1	7 units	861.42	55	24	10	f
882	Node.js Runtime 5462	\N	1	8 units	974.81	26	15	6	f
883	HP ProLiant Server 4671	\N	2	7 units	277.00	71	37	11	f
884	Docker Container 5735	\N	1	4 units	1043.35	82	26	10	f
885	Redis Cache 2187	\N	2	8 units	751.95	47	2	18	f
886	Cisco UCS 8324	\N	2	8 units	608.67	86	48	9	f
887	PostgreSQL Server 2343	\N	2	7 units	191.33	14	28	5	t
888	AWS EC2 Instance 2565	\N	2	6 units	1098.96	35	27	17	f
889	Nginx Load Balancer 1611	\N	1	2 units	397.06	0	16	12	f
890	Python Runtime 9873	\N	2	6 units	328.21	1	40	12	f
891	Node.js Runtime 6882	\N	2	8 units	396.05	72	40	7	f
892	Redis Cache 2155	\N	2	2 units	362.56	55	21	14	f
893	Server Dell PowerEdge 8105	\N	2	8 units	142.76	22	36	9	f
894	Server Dell PowerEdge 4859	\N	2	1 units	1075.52	27	42	8	t
895	Azure Virtual Machine 1287	\N	1	1 units	909.10	11	20	16	f
896	HP ProLiant Server 7898	\N	2	9 units	847.50	75	29	10	f
897	Google Cloud Compute 9158	\N	2	3 units	449.52	49	25	18	f
898	Redis Cache 8846	\N	1	6 units	165.79	37	8	14	f
899	Python Runtime 8293	\N	2	2 units	253.42	34	39	11	f
900	Node.js Runtime 3753	\N	1	7 units	871.23	11	25	8	f
901	SQL Server 7565	\N	1	9 units	330.84	90	24	14	f
902	Oracle Database 2549	\N	1	5 units	1017.00	49	25	16	f
903	MongoDB Database 6069	\N	1	1 units	641.27	98	25	18	f
904	Python Runtime 1799	\N	2	5 units	398.89	61	4	13	f
905	Python Runtime 7752	\N	1	5 units	1090.14	0	7	9	f
906	Cisco UCS 1518	\N	2	7 units	1086.38	41	29	16	f
907	MySQL Database 9443	\N	1	5 units	337.85	28	21	13	f
908	IBM System x 8511	\N	2	5 units	219.52	77	40	15	f
909	Kubernetes Cluster 1900	\N	2	3 units	437.28	38	4	15	f
910	IBM System x 3529	\N	1	8 units	921.45	25	15	16	f
911	Nginx Load Balancer 6615	\N	1	5 units	909.15	47	32	16	f
912	Kubernetes Cluster 5194	\N	1	7 units	922.00	74	11	12	f
913	IBM System x 4749	\N	2	4 units	879.12	43	19	9	f
914	AWS EC2 Instance 6656	\N	1	6 units	1043.42	96	29	8	f
915	IBM System x 3788	\N	1	6 units	1051.54	48	41	8	f
916	Python Runtime 1392	\N	2	6 units	140.45	11	42	15	f
917	Tomcat Application Server 1004	\N	1	4 units	1024.86	73	47	10	f
918	Google Cloud Compute 3774	\N	1	4 units	812.16	7	47	14	f
919	PostgreSQL Server 2037	\N	2	2 units	586.85	77	10	5	f
920	Cisco UCS 7942	\N	2	7 units	309.57	43	21	11	f
921	Server Dell PowerEdge 5612	\N	2	7 units	192.20	88	18	9	f
922	Python Runtime 7342	\N	1	5 units	684.87	67	19	14	f
923	Nginx Load Balancer 3626	\N	1	5 units	534.16	31	3	8	t
924	Google Cloud Compute 1644	\N	1	9 units	497.62	41	13	18	f
925	IBM System x 7205	\N	1	5 units	351.51	53	34	19	f
926	Tomcat Application Server 8892	\N	1	4 units	154.40	10	38	8	f
927	Server Dell PowerEdge 5988	\N	2	1 units	872.99	0	18	6	f
928	Docker Container 9067	\N	1	1 units	980.37	91	35	16	f
929	AWS EC2 Instance 8945	\N	2	2 units	1058.09	78	31	5	f
930	PostgreSQL Server 4183	\N	2	7 units	1084.65	10	21	14	f
931	Nginx Load Balancer 6312	\N	2	8 units	325.72	50	22	19	f
932	Node.js Runtime 2874	\N	1	4 units	210.81	65	42	10	f
933	AWS EC2 Instance 2197	\N	1	1 units	858.43	22	5	7	f
934	IBM System x 9882	\N	1	6 units	568.29	16	42	19	t
935	IBM System x 7532	\N	2	8 units	867.75	33	10	11	f
936	Tomcat Application Server 2396	\N	2	1 units	394.58	82	20	8	f
937	HP ProLiant Server 8692	\N	1	7 units	932.09	96	17	18	f
938	Azure Virtual Machine 9339	\N	2	5 units	625.39	23	34	18	f
939	Docker Container 9671	\N	1	2 units	433.63	59	46	9	f
940	Cisco UCS 5000	\N	1	3 units	373.64	13	31	9	f
941	Redis Cache 4096	\N	2	1 units	361.39	99	13	18	f
942	MySQL Database 4944	\N	1	8 units	232.81	18	11	10	f
943	MongoDB Database 5955	\N	2	6 units	281.06	99	39	9	f
944	Google Cloud Compute 9230	\N	1	1 units	494.65	76	45	15	f
945	AWS EC2 Instance 2790	\N	2	5 units	718.33	96	37	11	f
946	MySQL Database 2425	\N	2	3 units	341.53	48	35	6	f
947	HP ProLiant Server 9540	\N	2	3 units	330.62	30	49	13	f
948	Azure Virtual Machine 3536	\N	1	3 units	1099.40	43	14	11	f
949	Server Dell PowerEdge 6169	\N	2	1 units	1029.05	11	11	10	f
950	Google Cloud Compute 3465	\N	2	5 units	290.89	29	28	6	f
951	MongoDB Database 7293	\N	1	9 units	1033.40	39	23	9	f
952	Apache Web Server 6711	\N	1	7 units	668.78	19	24	14	f
953	MySQL Database 6636	\N	1	5 units	1014.92	57	24	18	f
954	MySQL Database 1312	\N	2	2 units	453.32	15	43	17	f
955	Oracle Database 8633	\N	1	1 units	949.19	60	36	7	f
956	MySQL Database 5103	\N	2	4 units	526.54	25	7	12	t
957	Google Cloud Compute 1435	\N	2	2 units	725.94	94	47	7	f
958	PostgreSQL Server 6525	\N	1	1 units	376.13	38	18	12	f
959	Python Runtime 4049	\N	2	6 units	168.81	8	29	13	f
960	MySQL Database 9673	\N	2	8 units	1013.34	49	23	17	t
961	Redis Cache 4900	\N	2	7 units	991.57	21	22	9	f
962	Kubernetes Cluster 9989	\N	2	8 units	927.58	25	36	18	f
963	Redis Cache 7740	\N	2	9 units	385.86	81	3	17	f
964	Google Cloud Compute 8325	\N	1	5 units	472.68	1	34	14	f
965	Azure Virtual Machine 4070	\N	1	7 units	906.90	73	27	6	f
966	Docker Container 4847	\N	1	7 units	671.31	53	48	9	f
967	Oracle Database 7705	\N	1	8 units	1042.02	79	25	6	f
968	IBM System x 6207	\N	2	6 units	920.86	98	34	5	f
969	HP ProLiant Server 2072	\N	2	1 units	974.61	36	7	18	t
970	Node.js Runtime 2138	\N	2	2 units	680.35	76	26	13	f
971	IBM System x 4914	\N	1	1 units	803.45	24	21	16	t
972	Docker Container 1160	\N	2	5 units	577.00	24	1	19	f
973	Apache Web Server 4191	\N	2	2 units	782.56	93	19	18	f
974	Node.js Runtime 8019	\N	2	2 units	137.06	89	23	8	f
975	Server Dell PowerEdge 5476	\N	1	3 units	955.74	21	40	11	t
976	HP ProLiant Server 6389	\N	2	5 units	800.14	0	16	7	f
977	MongoDB Database 4040	\N	2	5 units	677.42	29	1	10	f
978	Azure Virtual Machine 2310	\N	2	4 units	961.65	37	22	6	f
979	Tomcat Application Server 8153	\N	1	5 units	267.63	98	33	13	f
980	Cisco UCS 7990	\N	2	9 units	787.94	20	1	18	f
981	Python Runtime 2852	\N	2	5 units	747.67	7	48	13	t
982	SQL Server 7645	\N	1	9 units	985.31	55	39	17	f
983	Azure Virtual Machine 5499	\N	1	1 units	549.71	58	24	7	f
984	Redis Cache 8254	\N	2	3 units	787.22	37	26	12	t
985	Cisco UCS 9410	\N	1	2 units	974.21	17	40	7	t
986	PostgreSQL Server 3192	\N	2	7 units	339.38	28	1	7	f
987	Node.js Runtime 6338	\N	1	5 units	807.05	24	22	8	t
988	PostgreSQL Server 9184	\N	2	5 units	360.02	8	8	7	f
989	MySQL Database 2368	\N	1	5 units	564.48	57	8	19	f
990	Server Dell PowerEdge 1792	\N	1	8 units	637.61	70	17	14	f
991	HP ProLiant Server 3130	\N	1	5 units	108.48	66	7	12	t
992	Python Runtime 6015	\N	2	1 units	1049.91	73	48	6	f
993	Server Dell PowerEdge 4788	\N	2	4 units	1006.72	50	21	19	f
994	PostgreSQL Server 4087	\N	2	8 units	953.02	96	45	14	f
995	IBM System x 3904	\N	1	3 units	495.33	83	19	7	t
996	SQL Server 9106	\N	2	1 units	627.30	88	30	10	f
997	IBM System x 8864	\N	2	8 units	218.04	9	9	16	f
998	Azure Virtual Machine 9491	\N	2	1 units	1048.55	20	41	17	f
999	SQL Server 6685	\N	2	8 units	307.53	53	23	13	f
1000	Python Runtime 5874	\N	2	2 units	884.97	42	11	7	f
1001	Node.js Runtime 3456	\N	1	5 units	429.54	17	18	8	f
1002	Redis Cache 1281	\N	2	8 units	185.37	6	41	10	f
1003	Python Runtime 9968	\N	2	1 units	390.93	24	42	10	f
1004	Oracle Database 5723	\N	2	1 units	961.47	54	49	8	f
1005	Tomcat Application Server 2671	\N	2	8 units	458.03	51	44	13	f
1006	Node.js Runtime 1026	\N	1	5 units	373.02	12	3	5	t
1007	Python Runtime 3599	\N	2	1 units	144.60	66	39	7	f
1008	Python Runtime 3127	\N	1	2 units	249.35	91	12	8	f
1009	Oracle Database 1275	\N	2	5 units	373.75	61	46	15	f
1010	Node.js Runtime 4422	\N	2	2 units	412.12	53	17	5	f
1011	HP ProLiant Server 2644	\N	1	7 units	882.03	98	8	10	t
1012	IBM System x 7791	\N	2	5 units	121.20	7	23	14	f
1013	IBM System x 2935	\N	2	5 units	471.74	39	27	5	f
1014	Python Runtime 1520	\N	2	2 units	422.09	21	38	11	f
1015	Google Cloud Compute 4557	\N	1	3 units	450.53	71	37	18	f
1016	Azure Virtual Machine 1361	\N	1	6 units	727.54	93	16	5	f
1017	Tomcat Application Server 2337	\N	2	9 units	198.04	10	10	7	f
1018	Cisco UCS 2872	\N	1	5 units	502.37	52	48	6	t
1019	PostgreSQL Server 1885	\N	1	8 units	515.82	16	26	15	f
1020	PostgreSQL Server 9027	\N	2	5 units	245.10	65	7	6	f
1021	Cisco UCS 3771	\N	1	4 units	258.47	66	12	12	f
1022	Python Runtime 3640	\N	2	4 units	652.92	95	27	5	f
1023	Redis Cache 7447	\N	2	9 units	921.54	58	26	7	f
1024	Apache Web Server 8443	\N	1	2 units	675.96	93	34	7	t
1025	Google Cloud Compute 8850	\N	2	1 units	799.28	8	48	10	f
1026	Nginx Load Balancer 5383	\N	2	4 units	970.02	94	1	11	f
1027	Nginx Load Balancer 2788	\N	1	3 units	494.39	53	8	18	t
1028	PostgreSQL Server 8552	\N	1	1 units	691.94	11	38	12	f
1029	HP ProLiant Server 2826	\N	1	4 units	823.15	28	7	5	f
1030	Server Dell PowerEdge 5456	\N	2	8 units	643.77	76	6	12	f
1031	HP ProLiant Server 7154	\N	2	2 units	240.02	56	22	5	f
1032	PostgreSQL Server 1629	\N	2	2 units	116.65	40	23	6	f
1033	HP ProLiant Server 6795	\N	1	3 units	974.30	5	34	13	f
1034	Tomcat Application Server 8885	\N	1	7 units	745.44	67	6	11	f
1035	Cisco UCS 6496	\N	1	1 units	459.01	65	25	10	f
1036	AWS EC2 Instance 5635	\N	2	1 units	756.53	52	45	16	f
1037	AWS EC2 Instance 1704	\N	1	4 units	548.70	76	6	8	f
1038	Python Runtime 7562	\N	2	1 units	243.26	95	41	19	f
1039	Server Dell PowerEdge 8380	\N	2	1 units	752.58	34	41	5	f
1040	Python Runtime 7616	\N	2	9 units	261.40	72	9	10	f
1041	SQL Server 3861	\N	1	3 units	1098.69	78	40	17	f
1042	Nginx Load Balancer 3149	\N	1	2 units	696.65	19	2	9	f
1043	Apache Web Server 1241	\N	1	1 units	1033.84	0	43	18	f
1044	Server Dell PowerEdge 4423	\N	2	7 units	325.56	94	1	8	f
1045	Docker Container 9002	\N	2	4 units	286.23	21	19	12	t
1046	Nginx Load Balancer 3655	\N	1	1 units	669.14	1	48	13	f
1047	Server Dell PowerEdge 4036	\N	1	5 units	640.47	65	7	7	t
1048	Azure Virtual Machine 2727	\N	1	1 units	854.05	41	16	10	f
1049	Redis Cache 6812	\N	1	4 units	426.33	41	6	9	f
1050	Docker Container 4432	\N	2	6 units	971.06	71	42	15	f
1051	AWS EC2 Instance 1783	\N	2	1 units	703.31	26	4	11	f
1052	Tomcat Application Server 1633	\N	2	3 units	867.19	68	25	15	t
1053	HP ProLiant Server 9658	\N	2	9 units	961.58	37	6	15	f
1054	AWS EC2 Instance 5165	\N	1	9 units	275.66	43	26	15	f
1055	SQL Server 1767	\N	1	9 units	649.61	8	6	5	f
1056	PostgreSQL Server 9441	\N	1	6 units	569.44	28	38	15	f
1057	Oracle Database 6112	\N	1	3 units	545.33	45	32	8	t
1058	PostgreSQL Server 5384	\N	1	3 units	515.63	40	18	14	f
1059	SQL Server 4116	\N	1	4 units	774.69	22	34	16	f
1060	SQL Server 3288	\N	1	6 units	506.05	59	6	14	t
1061	HP ProLiant Server 3600	\N	2	2 units	754.35	56	18	14	f
1062	AWS EC2 Instance 4222	\N	1	8 units	287.25	38	27	9	f
1066	Kubernetes Cluster 7518	\N	2	9 units	908.69	20	15	9	f
1067	PostgreSQL Server 6744	\N	1	6 units	497.60	48	16	12	f
1068	HP ProLiant Server 6137	\N	2	4 units	569.54	60	26	8	t
1069	Azure Virtual Machine 1221	\N	2	9 units	271.35	2	2	17	f
1070	SQL Server 2107	\N	1	8 units	728.77	8	1	17	f
1071	Docker Container 3461	\N	1	8 units	959.01	10	36	12	f
1072	Tomcat Application Server 9377	\N	2	4 units	249.16	76	48	15	f
1073	Tomcat Application Server 9816	\N	2	4 units	191.24	61	44	12	t
1074	SQL Server 5756	\N	2	9 units	123.88	22	26	19	f
1075	Redis Cache 1598	\N	2	2 units	1095.21	12	38	17	f
1076	HP ProLiant Server 2648	\N	1	7 units	568.29	50	34	6	f
1077	Azure Virtual Machine 3128	\N	1	8 units	1086.91	90	48	18	f
1078	SQL Server 1752	\N	2	1 units	561.79	76	49	16	t
1079	Node.js Runtime 1604	\N	2	7 units	810.93	96	19	8	f
1080	Tomcat Application Server 1784	\N	1	9 units	569.42	3	9	6	f
1081	Kubernetes Cluster 7983	\N	2	3 units	1038.54	93	27	9	f
1082	AWS EC2 Instance 7673	\N	2	1 units	587.58	4	11	11	f
1083	Google Cloud Compute 5006	\N	2	8 units	221.18	5	3	16	f
1084	HP ProLiant Server 4253	\N	1	1 units	851.48	82	23	19	f
1085	Nginx Load Balancer 8874	\N	2	7 units	569.42	78	10	14	f
1086	AWS EC2 Instance 1522	\N	2	8 units	958.69	72	11	15	f
1087	IBM System x 6649	\N	2	3 units	887.06	20	38	14	f
1088	IBM System x 6548	\N	1	9 units	256.76	45	11	12	f
1089	Azure Virtual Machine 8766	\N	1	4 units	182.03	30	10	14	f
1090	Tomcat Application Server 2666	\N	2	7 units	847.88	69	40	9	f
1091	Google Cloud Compute 4829	\N	2	9 units	219.65	7	14	13	t
1092	Docker Container 4929	\N	1	8 units	809.01	94	10	8	f
1093	Azure Virtual Machine 6422	\N	2	3 units	115.64	31	12	18	f
1094	MySQL Database 8910	\N	1	3 units	243.75	11	36	9	f
1095	Azure Virtual Machine 2776	\N	1	6 units	528.14	68	46	7	f
1096	Nginx Load Balancer 8745	\N	1	2 units	125.18	9	15	18	f
1097	Google Cloud Compute 4655	\N	1	1 units	1005.10	63	21	15	f
1098	SQL Server 7764	\N	2	1 units	684.27	26	11	11	f
1099	Azure Virtual Machine 1080	\N	2	1 units	257.00	50	3	6	f
1100	Redis Cache 2146	\N	2	3 units	809.64	68	29	17	t
1101	Server Dell PowerEdge 8978	\N	1	2 units	1083.31	0	47	18	f
1102	Cisco UCS 7992	\N	1	2 units	409.18	44	35	8	t
1103	AWS EC2 Instance 1425	\N	1	7 units	932.52	98	30	18	f
1104	Node.js Runtime 4050	\N	1	1 units	594.47	48	22	16	f
1105	AWS EC2 Instance 9098	\N	1	5 units	918.58	29	31	17	f
1106	Google Cloud Compute 3461	\N	1	8 units	701.84	60	24	5	f
1107	Tomcat Application Server 5482	\N	1	2 units	783.63	57	6	16	f
1108	Python Runtime 7410	\N	1	2 units	501.70	84	36	17	f
1109	Oracle Database 3352	\N	1	9 units	875.44	31	1	8	f
1110	HP ProLiant Server 1574	\N	2	4 units	295.95	19	12	9	f
1111	Server Dell PowerEdge 8033	\N	2	4 units	529.56	21	21	19	f
1112	Google Cloud Compute 5270	\N	2	6 units	232.82	26	46	5	f
1113	Kubernetes Cluster 4564	\N	2	7 units	520.16	42	22	19	f
1114	Google Cloud Compute 9182	\N	1	3 units	750.50	86	9	11	f
1115	Apache Web Server 7246	\N	2	1 units	589.77	79	25	12	f
1116	Docker Container 5992	\N	1	9 units	764.92	82	38	9	f
1117	Azure Virtual Machine 2800	\N	2	7 units	112.39	70	11	5	t
1118	Oracle Database 4164	\N	2	7 units	887.23	43	30	8	f
1119	Python Runtime 5325	\N	1	2 units	887.93	1	16	6	f
1120	PostgreSQL Server 7415	\N	2	1 units	388.07	55	24	13	f
1121	MongoDB Database 8582	\N	1	5 units	668.15	4	43	14	f
1122	HP ProLiant Server 9312	\N	1	6 units	834.32	52	32	13	f
1123	SQL Server 5669	\N	2	6 units	496.96	32	22	9	f
1124	Google Cloud Compute 4981	\N	2	9 units	415.06	45	33	11	t
1125	MySQL Database 2991	\N	1	6 units	279.08	2	13	13	f
1126	Oracle Database 9582	\N	1	9 units	206.42	95	24	11	f
1127	Python Runtime 8030	\N	2	3 units	604.82	18	8	13	f
1128	Azure Virtual Machine 9197	\N	2	3 units	901.92	30	9	13	f
1129	Apache Web Server 5801	\N	1	8 units	535.41	1	6	19	f
1130	Apache Web Server 1782	\N	1	4 units	108.73	40	35	19	f
1131	Node.js Runtime 6816	\N	2	1 units	507.77	53	11	16	f
1132	Tomcat Application Server 8278	\N	1	4 units	883.72	79	47	14	f
1133	Redis Cache 4159	\N	2	5 units	948.53	43	14	19	f
1134	Redis Cache 4305	\N	2	5 units	794.24	21	49	18	f
1135	PostgreSQL Server 5515	\N	2	8 units	715.87	20	8	7	f
1136	Apache Web Server 8938	\N	2	7 units	702.79	77	39	5	f
1137	SQL Server 8538	\N	1	8 units	361.21	21	40	10	f
1138	MySQL Database 1122	\N	1	4 units	432.19	86	24	6	f
1139	AWS EC2 Instance 2252	\N	1	4 units	1025.38	54	31	13	f
1140	Google Cloud Compute 7785	\N	2	4 units	990.60	46	46	7	f
1141	MongoDB Database 4698	\N	1	5 units	845.54	47	15	16	f
1142	Cisco UCS 6323	\N	1	6 units	482.86	95	1	19	f
1143	Tomcat Application Server 1934	\N	2	1 units	852.52	4	38	19	f
1144	HP ProLiant Server 5977	\N	1	1 units	156.18	51	3	6	f
1145	Node.js Runtime 6594	\N	2	9 units	1006.23	92	18	19	f
1146	Kubernetes Cluster 1646	\N	1	8 units	810.09	49	19	14	f
1147	Oracle Database 8709	\N	2	7 units	327.47	43	41	15	f
1148	Node.js Runtime 3613	\N	1	7 units	112.10	25	35	5	f
1149	MySQL Database 6673	\N	1	3 units	399.13	89	38	8	f
1150	Redis Cache 4529	\N	1	5 units	227.60	8	17	15	f
1151	Nginx Load Balancer 8747	\N	1	1 units	1093.36	53	12	17	f
1152	Redis Cache 3962	\N	1	4 units	688.94	4	14	12	f
1153	Google Cloud Compute 3115	\N	1	9 units	431.50	69	27	9	f
1154	Docker Container 2531	\N	1	3 units	688.54	93	22	9	f
1155	Docker Container 5175	\N	2	3 units	1053.51	70	44	10	f
1156	Docker Container 4343	\N	1	5 units	253.36	95	45	9	f
1157	AWS EC2 Instance 2383	\N	1	3 units	712.24	52	33	16	f
1158	Cisco UCS 9311	\N	1	6 units	1094.67	27	16	11	f
1159	Apache Web Server 6587	\N	2	1 units	976.56	19	6	12	f
1160	Oracle Database 9379	\N	1	2 units	103.89	50	16	18	f
1161	MySQL Database 2256	\N	2	3 units	933.10	14	14	18	t
1162	Docker Container 6380	\N	2	4 units	231.53	54	10	13	f
1163	Python Runtime 4584	\N	2	5 units	944.63	14	39	8	f
1164	Nginx Load Balancer 9386	\N	2	9 units	557.71	72	30	17	f
1165	MongoDB Database 9828	\N	2	3 units	597.86	2	6	18	f
1166	Redis Cache 4522	\N	2	8 units	259.76	93	47	16	f
1167	SQL Server 5166	\N	2	8 units	745.04	83	4	11	f
1168	PostgreSQL Server 2797	\N	1	6 units	566.73	53	41	15	f
1169	Nginx Load Balancer 2478	\N	2	8 units	561.01	76	41	9	f
1170	MongoDB Database 4971	\N	1	1 units	746.05	78	28	11	f
1171	Server Dell PowerEdge 5434	\N	2	8 units	828.92	53	26	10	f
1172	PostgreSQL Server 5835	\N	1	1 units	971.14	43	14	14	f
1173	HP ProLiant Server 7876	\N	2	9 units	196.64	42	18	5	f
1174	SQL Server 6457	\N	2	2 units	821.16	47	6	6	f
1175	Python Runtime 2025	\N	1	2 units	695.20	7	26	17	f
1176	Kubernetes Cluster 3174	\N	1	7 units	763.98	59	43	7	f
1177	Oracle Database 2033	\N	2	5 units	381.91	68	34	8	f
1178	IBM System x 8973	\N	1	5 units	902.84	18	39	18	f
1179	Node.js Runtime 9769	\N	1	7 units	652.46	40	38	14	f
1180	Google Cloud Compute 3155	\N	2	2 units	970.94	23	18	9	f
1181	Oracle Database 3309	\N	1	6 units	429.27	24	8	11	f
1182	Kubernetes Cluster 9722	\N	2	3 units	192.34	97	48	16	f
1183	HP ProLiant Server 4932	\N	2	6 units	609.04	9	28	10	f
1184	HP ProLiant Server 3305	\N	1	1 units	442.70	93	30	9	f
1185	Azure Virtual Machine 2565	\N	2	8 units	807.25	29	0	7	f
1186	Server Dell PowerEdge 6930	\N	1	2 units	823.02	94	27	7	f
1187	MySQL Database 8227	\N	1	7 units	329.37	26	21	11	f
1188	MongoDB Database 9730	\N	1	9 units	207.00	43	32	5	f
1189	MongoDB Database 2461	\N	2	3 units	510.28	37	28	11	f
1190	MongoDB Database 2862	\N	1	3 units	649.32	80	2	5	f
1191	SQL Server 3369	\N	2	9 units	418.54	35	43	11	t
1192	MongoDB Database 6316	\N	2	2 units	502.81	68	13	8	f
1193	Apache Web Server 2796	\N	2	3 units	378.61	59	44	15	f
1194	Server Dell PowerEdge 2846	\N	2	3 units	652.19	39	10	6	f
1195	Server Dell PowerEdge 7900	\N	2	9 units	1089.91	3	27	12	f
1196	MongoDB Database 1763	\N	2	4 units	156.78	88	3	15	f
1197	Node.js Runtime 9713	\N	1	1 units	683.46	23	19	11	f
1198	HP ProLiant Server 3251	\N	2	9 units	172.03	35	31	8	f
1199	Apache Web Server 5790	\N	2	3 units	764.60	17	0	12	f
1200	Apache Web Server 1715	\N	2	1 units	339.60	86	30	17	f
1201	Server Dell PowerEdge 5402	\N	2	8 units	331.25	12	44	12	f
1202	Nginx Load Balancer 8169	\N	2	2 units	507.25	79	49	5	f
1203	AWS EC2 Instance 6469	\N	2	2 units	139.63	19	42	16	f
1204	Server Dell PowerEdge 2064	\N	1	9 units	219.98	18	16	6	f
1205	Kubernetes Cluster 1188	\N	2	1 units	725.89	73	39	6	f
1206	MongoDB Database 8851	\N	1	3 units	825.02	73	49	19	f
1207	MySQL Database 8234	\N	2	5 units	382.45	1	30	16	f
1208	PostgreSQL Server 3115	\N	1	3 units	813.98	64	42	14	f
1209	AWS EC2 Instance 6215	\N	1	5 units	646.08	39	22	11	f
1210	Cisco UCS 8339	\N	1	7 units	151.75	9	24	5	f
1211	Kubernetes Cluster 9116	\N	1	4 units	139.75	23	6	7	f
1212	Python Runtime 3867	\N	1	9 units	319.63	53	19	7	f
1213	Node.js Runtime 6813	\N	2	8 units	390.13	48	43	10	f
1214	Redis Cache 6498	\N	1	4 units	300.31	46	44	6	f
1215	Redis Cache 4945	\N	2	2 units	406.50	83	26	15	f
1216	IBM System x 2816	\N	2	5 units	358.21	29	23	18	f
1217	Apache Web Server 6989	\N	2	7 units	687.01	85	25	6	f
1218	Google Cloud Compute 4358	\N	1	1 units	1033.87	28	34	12	f
1219	Cisco UCS 6569	\N	1	6 units	845.53	95	15	12	f
1220	Server Dell PowerEdge 4681	\N	1	9 units	952.41	72	19	13	f
1221	HP ProLiant Server 3171	\N	2	4 units	627.34	84	1	11	f
1222	HP ProLiant Server 2880	\N	2	1 units	777.58	44	43	16	f
1223	Tomcat Application Server 1015	\N	2	8 units	1014.11	68	15	10	t
1224	MongoDB Database 3112	\N	1	9 units	825.94	96	20	18	f
1225	MongoDB Database 5640	\N	1	4 units	272.08	59	16	14	f
1226	Cisco UCS 4804	\N	1	2 units	835.29	62	0	12	f
1227	Tomcat Application Server 1843	\N	2	9 units	419.16	84	26	9	f
1228	Tomcat Application Server 9895	\N	2	1 units	777.42	43	29	11	f
1229	Nginx Load Balancer 8556	\N	1	4 units	893.77	80	43	8	f
1230	MySQL Database 1933	\N	1	2 units	442.27	26	44	6	f
1231	Oracle Database 8035	\N	1	5 units	965.95	74	25	11	f
1232	Kubernetes Cluster 8664	\N	1	4 units	294.61	27	37	7	f
1233	IBM System x 5796	\N	2	4 units	1014.84	15	12	14	f
1234	Kubernetes Cluster 9299	\N	2	4 units	274.55	9	39	5	f
1235	Server Dell PowerEdge 8413	\N	2	6 units	247.00	17	9	12	f
1236	Apache Web Server 1792	\N	1	8 units	514.66	70	6	6	f
1237	MongoDB Database 8867	\N	1	3 units	605.04	34	35	7	f
1238	Docker Container 2612	\N	2	5 units	206.10	17	24	10	f
1239	Apache Web Server 1376	\N	2	7 units	399.77	84	34	19	f
1240	Oracle Database 9956	\N	1	3 units	729.89	13	22	10	f
1241	Kubernetes Cluster 2974	\N	1	3 units	619.66	14	16	12	f
1242	Node.js Runtime 3022	\N	2	2 units	340.23	71	26	18	f
1243	IBM System x 1164	\N	1	3 units	1072.15	60	42	15	f
1244	Cisco UCS 6005	\N	2	2 units	140.37	80	9	10	f
1245	Redis Cache 2224	\N	2	6 units	325.94	43	6	8	t
1246	Redis Cache 6399	\N	2	5 units	553.29	81	23	8	f
1247	IBM System x 9031	\N	2	5 units	973.99	85	18	11	f
1248	Docker Container 6247	\N	1	8 units	908.83	17	24	7	f
1249	Server Dell PowerEdge 4284	\N	1	5 units	317.99	90	6	5	f
1250	Oracle Database 3851	\N	2	6 units	758.59	57	19	16	f
1251	Kubernetes Cluster 6995	\N	2	6 units	1061.82	66	0	5	f
1252	PostgreSQL Server 5689	\N	1	8 units	526.43	21	44	18	f
1253	Tomcat Application Server 2472	\N	2	1 units	428.15	36	13	15	f
1254	MongoDB Database 7309	\N	2	3 units	1051.81	39	42	5	f
1255	Apache Web Server 5865	\N	1	4 units	848.43	64	34	7	f
1256	Python Runtime 9913	\N	1	7 units	449.95	63	7	5	f
1257	Node.js Runtime 8412	\N	2	8 units	700.78	20	32	5	f
1258	Nginx Load Balancer 5086	\N	1	7 units	260.20	11	36	17	f
1259	Google Cloud Compute 6269	\N	2	2 units	175.98	25	19	10	f
1260	IBM System x 1027	\N	2	5 units	1003.85	55	42	16	f
1261	IBM System x 6185	\N	2	7 units	412.99	65	35	5	f
1262	PostgreSQL Server 1443	\N	1	8 units	1072.02	60	42	17	f
1263	Kubernetes Cluster 8278	\N	1	1 units	137.00	31	7	15	f
1264	MongoDB Database 9588	\N	1	3 units	353.08	87	23	7	f
1265	HP ProLiant Server 5873	\N	1	1 units	866.82	23	12	16	f
1266	MongoDB Database 6962	\N	2	6 units	624.76	15	37	7	f
1267	HP ProLiant Server 6624	\N	2	9 units	369.38	25	3	12	f
1268	Nginx Load Balancer 5219	\N	2	6 units	281.94	43	4	7	f
1269	Python Runtime 7852	\N	1	1 units	471.10	26	40	8	f
1270	Tomcat Application Server 5014	\N	2	3 units	712.26	33	0	6	f
1271	MySQL Database 5903	\N	1	5 units	788.50	41	11	11	f
1272	Tomcat Application Server 3010	\N	2	3 units	331.67	63	27	6	t
1273	Python Runtime 4723	\N	2	2 units	406.74	35	21	14	f
1274	MySQL Database 3088	\N	2	6 units	772.03	12	21	13	f
1275	PostgreSQL Server 4178	\N	2	2 units	791.04	23	47	15	t
1276	Server Dell PowerEdge 5532	\N	2	4 units	658.96	6	43	7	f
1277	Azure Virtual Machine 9382	\N	2	5 units	214.27	19	35	15	f
1278	Apache Web Server 7170	\N	1	7 units	657.72	4	1	17	f
1279	Python Runtime 8891	\N	2	5 units	161.65	42	49	15	t
1280	Python Runtime 4416	\N	2	9 units	867.71	93	37	13	f
1281	SQL Server 6096	\N	2	8 units	380.20	94	7	10	f
1282	Docker Container 6465	\N	1	9 units	784.36	99	1	15	f
1283	Azure Virtual Machine 5216	\N	1	2 units	524.90	58	5	18	f
1284	Server Dell PowerEdge 8609	\N	1	3 units	358.39	23	14	15	f
1285	Server Dell PowerEdge 3905	\N	2	4 units	285.00	85	6	19	f
1286	Python Runtime 7347	\N	1	2 units	878.30	54	33	17	f
1287	Server Dell PowerEdge 8062	\N	2	3 units	395.79	18	16	6	f
1288	MongoDB Database 8599	\N	2	4 units	550.36	40	18	10	f
1289	PostgreSQL Server 7178	\N	2	5 units	617.47	71	14	19	t
1290	Apache Web Server 9786	\N	2	1 units	916.65	76	40	7	f
1291	MongoDB Database 7275	\N	1	8 units	1086.90	99	14	18	f
1292	PostgreSQL Server 7035	\N	1	4 units	107.98	60	9	17	f
1293	MySQL Database 7875	\N	1	9 units	135.90	47	48	11	f
1294	IBM System x 6723	\N	2	1 units	225.75	71	46	5	f
1295	AWS EC2 Instance 7809	\N	1	6 units	991.89	11	8	6	f
1296	Azure Virtual Machine 8991	\N	1	2 units	294.17	39	40	7	f
1297	AWS EC2 Instance 1672	\N	1	1 units	552.42	36	16	18	f
1298	Tomcat Application Server 8528	\N	2	6 units	845.05	83	14	9	f
1299	IBM System x 9800	\N	1	8 units	206.95	48	23	9	f
1300	Nginx Load Balancer 8249	\N	1	7 units	747.59	99	19	17	f
1301	Docker Container 2848	\N	1	5 units	981.19	11	34	13	f
1302	PostgreSQL Server 7531	\N	2	2 units	786.94	68	10	5	t
1303	MongoDB Database 5227	\N	2	6 units	748.03	4	37	16	f
1304	MySQL Database 6446	\N	1	1 units	274.84	96	24	6	f
1305	Cisco UCS 3007	\N	1	5 units	856.09	76	49	5	f
1306	Google Cloud Compute 4261	\N	1	8 units	704.11	64	0	18	f
1307	Python Runtime 9738	\N	1	5 units	190.98	2	19	17	t
1308	Python Runtime 1534	\N	1	5 units	236.26	86	48	18	f
1309	Tomcat Application Server 6555	\N	2	3 units	1048.61	65	28	18	f
1310	AWS EC2 Instance 4255	\N	1	7 units	959.44	92	16	10	f
1311	Node.js Runtime 9357	\N	1	8 units	725.58	14	26	10	t
1312	AWS EC2 Instance 9852	\N	1	5 units	853.33	85	35	11	t
1313	Google Cloud Compute 1913	\N	1	9 units	322.21	71	18	19	f
1314	Oracle Database 5621	\N	2	5 units	160.26	53	18	13	f
1315	Google Cloud Compute 2190	\N	1	2 units	334.80	98	32	16	f
1316	AWS EC2 Instance 8558	\N	1	9 units	733.33	30	30	19	f
1317	Google Cloud Compute 7644	\N	2	8 units	1055.26	72	15	9	f
1318	Google Cloud Compute 9566	\N	2	7 units	335.53	13	22	13	f
1319	Apache Web Server 4993	\N	1	9 units	538.37	97	13	10	f
1320	Node.js Runtime 4470	\N	2	2 units	174.08	38	15	19	f
1321	Server Dell PowerEdge 6029	\N	1	1 units	976.18	14	27	17	f
1322	Node.js Runtime 4328	\N	1	4 units	507.46	87	24	12	f
1323	Server Dell PowerEdge 9250	\N	1	7 units	893.42	96	2	18	f
1324	Kubernetes Cluster 5660	\N	2	2 units	500.00	65	39	11	f
1325	Node.js Runtime 7361	\N	1	7 units	912.33	65	16	18	f
1326	Node.js Runtime 7488	\N	2	1 units	812.72	15	27	12	f
1327	Google Cloud Compute 5882	\N	1	1 units	386.39	81	9	10	t
1328	Azure Virtual Machine 9665	\N	2	9 units	482.78	27	23	5	t
1329	Node.js Runtime 9567	\N	1	4 units	927.44	74	39	7	t
1330	Python Runtime 1714	\N	2	7 units	327.08	64	37	13	f
1331	Apache Web Server 6842	\N	2	3 units	272.45	10	46	7	t
1332	Docker Container 2828	\N	1	9 units	685.54	30	48	9	f
1333	Redis Cache 1173	\N	1	9 units	177.11	60	40	9	f
1334	Google Cloud Compute 2272	\N	1	9 units	101.91	0	40	11	f
1335	Server Dell PowerEdge 3908	\N	1	8 units	336.11	39	13	5	f
1336	Cisco UCS 3089	\N	1	4 units	811.21	87	10	14	f
1337	HP ProLiant Server 7960	\N	1	2 units	536.23	80	40	6	f
1338	SQL Server 2857	\N	1	1 units	132.70	13	15	13	f
1339	HP ProLiant Server 3025	\N	1	7 units	1093.19	96	44	6	f
1340	MySQL Database 4157	\N	2	8 units	213.51	53	22	18	f
1341	Google Cloud Compute 9015	\N	1	1 units	480.92	8	10	9	f
1342	IBM System x 7490	\N	1	1 units	795.28	18	23	5	f
1343	AWS EC2 Instance 8561	\N	1	4 units	129.17	27	30	16	f
1344	Apache Web Server 7009	\N	1	8 units	322.40	5	22	15	f
1345	Redis Cache 3973	\N	2	7 units	207.17	8	42	8	f
1346	MongoDB Database 8569	\N	1	8 units	464.54	20	19	15	f
1347	Node.js Runtime 3800	\N	2	1 units	144.86	35	38	19	f
1348	Azure Virtual Machine 8376	\N	1	1 units	876.80	6	2	6	t
1349	Oracle Database 9655	\N	2	9 units	583.40	32	10	9	f
1350	Oracle Database 8756	\N	1	2 units	997.72	76	20	17	f
1351	Cisco UCS 6834	\N	1	3 units	811.96	0	12	11	f
1352	MongoDB Database 1016	\N	1	8 units	882.70	69	21	13	f
1353	Docker Container 6711	\N	1	7 units	739.52	45	20	16	f
1354	AWS EC2 Instance 2964	\N	1	3 units	703.82	1	19	9	f
1355	Google Cloud Compute 3911	\N	2	6 units	855.45	68	15	7	f
1356	Docker Container 9495	\N	1	3 units	301.06	48	23	19	f
1357	Redis Cache 9298	\N	2	5 units	766.66	64	41	7	t
1358	Kubernetes Cluster 2448	\N	1	8 units	472.68	95	47	5	f
1359	Azure Virtual Machine 4738	\N	2	3 units	152.15	70	35	7	f
1360	Python Runtime 9787	\N	2	6 units	344.55	9	7	19	f
1361	HP ProLiant Server 1101	\N	2	4 units	143.41	80	41	12	f
1362	SQL Server 4386	\N	2	5 units	968.33	75	6	7	f
1363	Python Runtime 8705	\N	2	8 units	413.14	32	45	5	f
1364	Tomcat Application Server 5389	\N	1	3 units	566.36	66	23	15	f
1365	Server Dell PowerEdge 5459	\N	1	4 units	435.31	60	23	17	f
1366	Cisco UCS 3035	\N	1	1 units	189.46	59	7	17	f
1367	Docker Container 2346	\N	2	7 units	913.69	62	5	18	t
1368	Redis Cache 6772	\N	1	1 units	646.75	5	9	7	f
1369	Tomcat Application Server 2718	\N	2	1 units	758.82	46	32	5	f
1370	AWS EC2 Instance 3068	\N	2	5 units	139.57	50	27	10	t
1371	Node.js Runtime 7331	\N	1	9 units	472.11	37	6	12	f
1372	Azure Virtual Machine 4886	\N	2	6 units	978.59	33	35	12	f
1373	Redis Cache 7062	\N	1	8 units	1023.12	37	19	13	f
1374	Google Cloud Compute 5871	\N	1	7 units	902.87	83	42	14	f
1375	MongoDB Database 3615	\N	2	5 units	583.03	98	49	9	f
1376	MongoDB Database 7987	\N	2	1 units	693.33	23	34	8	f
1377	Apache Web Server 5830	\N	1	2 units	117.89	75	1	19	f
1378	Google Cloud Compute 2650	\N	1	4 units	887.33	46	5	12	f
1379	Oracle Database 3444	\N	2	3 units	272.45	55	6	18	f
1380	Server Dell PowerEdge 8177	\N	2	9 units	990.63	7	37	13	f
1381	MongoDB Database 3686	\N	2	8 units	260.19	89	10	11	f
1382	Kubernetes Cluster 5576	\N	1	6 units	140.28	97	44	8	f
1383	PostgreSQL Server 3151	\N	1	5 units	117.53	86	33	7	f
1384	Server Dell PowerEdge 4789	\N	1	9 units	955.24	31	18	7	f
1385	Oracle Database 4323	\N	1	8 units	786.31	3	11	7	f
1386	Kubernetes Cluster 7852	\N	1	9 units	880.92	4	22	8	f
1387	Server Dell PowerEdge 4929	\N	1	3 units	788.56	28	35	19	t
1388	SQL Server 3320	\N	2	7 units	196.03	30	42	12	t
1389	HP ProLiant Server 3088	\N	2	5 units	491.23	17	34	17	t
1390	PostgreSQL Server 7334	\N	1	1 units	698.48	25	34	15	f
1391	HP ProLiant Server 6600	\N	1	8 units	592.95	19	14	5	f
1392	Kubernetes Cluster 2083	\N	1	5 units	1049.64	45	45	17	f
1393	Oracle Database 1300	\N	1	5 units	700.49	14	5	9	f
1394	HP ProLiant Server 4070	\N	1	8 units	763.24	82	18	6	f
1395	SQL Server 8735	\N	2	2 units	599.74	81	37	14	f
1396	MySQL Database 8105	\N	2	6 units	654.14	89	7	8	f
1397	MongoDB Database 3132	\N	2	6 units	552.51	32	36	10	f
1398	Python Runtime 7005	\N	2	7 units	945.78	35	7	7	f
1399	Apache Web Server 6336	\N	1	2 units	504.39	91	33	8	f
1400	PostgreSQL Server 2804	\N	1	3 units	964.65	23	33	15	f
1401	Server Dell PowerEdge 9952	\N	1	6 units	732.68	8	33	9	f
1402	Node.js Runtime 2847	\N	2	4 units	192.74	36	38	11	f
1403	IBM System x 5503	\N	1	5 units	320.76	88	35	13	f
1404	PostgreSQL Server 4766	\N	2	9 units	239.06	27	23	6	f
1405	Python Runtime 4251	\N	1	9 units	338.77	8	9	18	f
1406	Nginx Load Balancer 7748	\N	2	1 units	357.71	33	30	9	f
1407	Server Dell PowerEdge 4228	\N	2	4 units	909.66	68	23	16	f
1408	HP ProLiant Server 6858	\N	1	8 units	666.60	92	35	6	f
1409	Cisco UCS 5099	\N	1	6 units	713.55	68	31	19	f
1410	PostgreSQL Server 5116	\N	2	6 units	739.58	26	8	5	t
1411	PostgreSQL Server 2750	\N	1	4 units	803.98	35	41	19	f
1412	Kubernetes Cluster 4387	\N	1	3 units	541.62	56	29	5	f
1413	PostgreSQL Server 4709	\N	1	8 units	640.65	18	15	15	f
1414	Tomcat Application Server 6347	\N	2	2 units	382.89	47	34	18	f
1415	Azure Virtual Machine 5571	\N	1	7 units	305.17	80	19	19	f
1416	PostgreSQL Server 6645	\N	1	8 units	649.78	25	10	6	f
1417	Cisco UCS 5754	\N	1	9 units	530.03	21	37	9	t
1418	Docker Container 6900	\N	2	7 units	613.91	92	35	15	f
1419	Python Runtime 8817	\N	1	9 units	760.44	76	13	14	f
1420	SQL Server 6972	\N	1	7 units	398.39	37	29	17	f
1421	MongoDB Database 8805	\N	1	8 units	466.73	9	8	9	t
1422	SQL Server 5464	\N	2	9 units	549.57	95	18	16	f
1423	Oracle Database 7720	\N	2	8 units	667.04	37	15	14	f
1424	Azure Virtual Machine 2682	\N	2	9 units	191.70	82	37	11	f
1425	Redis Cache 3544	\N	1	7 units	613.85	94	16	6	f
1426	Redis Cache 5833	\N	2	7 units	851.80	35	28	11	f
1427	Python Runtime 3901	\N	2	4 units	434.02	78	26	10	f
1428	Server Dell PowerEdge 8189	\N	1	4 units	547.95	67	2	14	f
1429	Server Dell PowerEdge 8052	\N	2	1 units	505.14	73	37	7	f
1430	Docker Container 1878	\N	2	3 units	160.22	58	45	13	f
1431	Apache Web Server 6905	\N	1	2 units	392.72	55	9	11	f
1432	HP ProLiant Server 3667	\N	2	2 units	1014.07	44	36	5	f
1433	MongoDB Database 2211	\N	2	3 units	909.22	12	41	18	f
1434	MongoDB Database 1252	\N	1	7 units	739.08	50	43	19	f
1435	MongoDB Database 2712	\N	2	3 units	351.49	81	35	6	f
1436	HP ProLiant Server 8360	\N	1	9 units	1014.30	74	14	6	f
1437	Server Dell PowerEdge 6825	\N	2	7 units	593.77	48	9	19	f
1438	PostgreSQL Server 4129	\N	1	8 units	689.71	75	27	11	f
1439	Cisco UCS 3904	\N	2	6 units	1064.34	81	1	18	f
1440	Node.js Runtime 4391	\N	2	1 units	732.44	15	22	10	f
1441	Server Dell PowerEdge 2239	\N	2	5 units	411.94	30	11	13	t
1442	Tomcat Application Server 3442	\N	2	2 units	826.00	15	11	16	f
1443	Node.js Runtime 1651	\N	2	5 units	373.97	20	10	17	f
1444	Apache Web Server 4885	\N	2	1 units	125.89	28	41	6	f
1445	Azure Virtual Machine 9564	\N	2	1 units	776.03	15	24	9	f
1446	AWS EC2 Instance 3396	\N	1	2 units	679.97	40	2	10	f
1447	IBM System x 1733	\N	1	4 units	627.08	96	21	14	f
1448	HP ProLiant Server 7967	\N	2	6 units	835.52	70	49	17	f
1449	Tomcat Application Server 3542	\N	2	6 units	200.00	27	20	8	f
1450	Cisco UCS 9266	\N	1	4 units	220.26	86	19	14	f
1451	MongoDB Database 6018	\N	2	1 units	1064.00	54	18	10	f
1452	AWS EC2 Instance 3232	\N	2	2 units	663.44	62	48	5	f
1453	Google Cloud Compute 6609	\N	2	8 units	714.72	54	13	5	t
1454	Azure Virtual Machine 5875	\N	2	4 units	933.99	27	20	6	f
1455	Cisco UCS 8994	\N	1	6 units	270.39	7	39	11	f
1456	Apache Web Server 5115	\N	2	7 units	720.85	47	14	17	f
1457	MongoDB Database 4448	\N	1	8 units	116.48	69	11	6	f
1458	HP ProLiant Server 8578	\N	2	3 units	163.63	57	11	15	f
1459	Node.js Runtime 7008	\N	1	6 units	855.91	82	25	8	t
1460	Oracle Database 8961	\N	2	6 units	1077.37	43	48	11	f
1461	Google Cloud Compute 9834	\N	1	8 units	691.82	84	1	19	t
1462	Apache Web Server 4686	\N	1	5 units	1014.04	10	16	10	f
1463	Server Dell PowerEdge 3360	\N	1	2 units	855.60	10	18	6	f
1464	Azure Virtual Machine 7010	\N	1	8 units	625.22	80	8	16	t
1465	PostgreSQL Server 2993	\N	2	1 units	906.01	62	25	12	f
1466	Apache Web Server 4746	\N	1	7 units	603.36	36	34	11	f
1467	IBM System x 8357	\N	2	3 units	312.67	96	16	11	f
1468	Google Cloud Compute 4923	\N	1	9 units	1013.96	15	32	13	f
1469	SQL Server 5364	\N	1	6 units	1042.45	39	11	6	f
1470	Python Runtime 4060	\N	1	9 units	444.35	58	41	16	f
1471	Apache Web Server 7526	\N	2	1 units	168.84	90	7	7	f
1472	AWS EC2 Instance 1562	\N	1	3 units	316.23	34	19	16	f
1473	MySQL Database 9703	\N	1	3 units	275.36	11	16	18	f
1474	Redis Cache 8159	\N	1	3 units	391.00	94	8	7	t
1475	Tomcat Application Server 8192	\N	2	9 units	257.23	50	27	6	f
1476	AWS EC2 Instance 1095	\N	2	4 units	848.90	82	33	7	f
1477	Docker Container 4951	\N	2	7 units	728.18	73	9	8	f
1478	Tomcat Application Server 5815	\N	2	3 units	1095.76	11	7	17	f
1479	HP ProLiant Server 6023	\N	2	7 units	112.65	63	6	11	f
1480	Docker Container 2249	\N	2	5 units	310.82	53	15	12	f
1481	SQL Server 7502	\N	1	3 units	416.07	84	46	18	f
1482	Google Cloud Compute 8030	\N	2	2 units	676.33	16	21	7	f
1483	Apache Web Server 5800	\N	1	4 units	236.57	99	13	16	f
1484	Docker Container 1738	\N	1	5 units	445.64	21	6	13	f
1485	AWS EC2 Instance 9940	\N	1	7 units	140.67	77	2	11	f
1486	Tomcat Application Server 5253	\N	2	7 units	874.16	89	30	17	f
1487	PostgreSQL Server 3229	\N	1	8 units	656.85	90	4	9	t
1488	Nginx Load Balancer 9686	\N	2	2 units	843.88	61	38	9	f
1489	Azure Virtual Machine 6100	\N	1	4 units	595.77	64	20	11	t
1490	IBM System x 4180	\N	1	4 units	452.58	33	11	6	t
1491	Redis Cache 3337	\N	1	3 units	855.76	50	17	15	f
1492	Server Dell PowerEdge 2756	\N	1	6 units	100.31	10	35	7	f
1493	Azure Virtual Machine 2286	\N	1	1 units	602.98	30	39	19	f
1494	MongoDB Database 6630	\N	2	6 units	993.74	23	7	7	f
1495	IBM System x 4588	\N	2	6 units	775.78	15	43	9	f
1496	Cisco UCS 1673	\N	1	8 units	201.33	36	33	17	f
1497	AWS EC2 Instance 8743	\N	2	6 units	529.31	2	43	18	f
1498	Python Runtime 1439	\N	1	2 units	736.12	93	35	7	f
1499	Cisco UCS 8850	\N	1	2 units	854.30	41	6	5	f
1500	Google Cloud Compute 7410	\N	1	9 units	898.99	43	33	13	f
1501	Server Dell PowerEdge 8004	\N	1	2 units	1059.22	73	16	5	f
1502	MySQL Database 5227	\N	1	2 units	494.13	26	16	11	f
1503	Server Dell PowerEdge 3359	\N	2	2 units	903.58	93	0	9	f
1504	Cisco UCS 3714	\N	1	8 units	428.12	89	2	6	f
1505	Apache Web Server 9014	\N	1	5 units	963.60	26	28	16	f
1506	Cisco UCS 6424	\N	2	9 units	358.86	64	49	17	f
1507	Redis Cache 3795	\N	1	9 units	812.53	48	23	8	f
1508	Tomcat Application Server 5256	\N	2	9 units	518.82	29	44	8	f
1509	AWS EC2 Instance 3917	\N	2	1 units	755.92	15	22	19	f
1510	AWS EC2 Instance 8074	\N	1	8 units	514.99	66	3	18	f
1511	MySQL Database 1418	\N	2	4 units	629.72	79	1	17	f
1512	AWS EC2 Instance 5641	\N	2	8 units	962.68	18	47	19	f
1513	Nginx Load Balancer 4016	\N	2	5 units	166.83	52	33	16	f
1514	MySQL Database 6137	\N	2	9 units	943.83	55	35	19	f
1515	Node.js Runtime 2799	\N	2	1 units	615.58	21	37	13	f
1516	Docker Container 3210	\N	2	2 units	597.75	62	43	6	f
1517	Oracle Database 6949	\N	2	9 units	945.00	67	21	14	f
1518	SQL Server 3247	\N	2	5 units	186.29	9	25	8	f
1519	Docker Container 4540	\N	1	3 units	801.72	18	27	14	f
1520	Kubernetes Cluster 1443	\N	2	8 units	504.90	78	47	15	f
1521	Tomcat Application Server 2720	\N	1	7 units	140.55	3	6	18	f
1522	Apache Web Server 6400	\N	1	9 units	163.27	85	19	11	f
1523	Server Dell PowerEdge 3965	\N	1	2 units	443.80	80	24	15	f
1524	Tomcat Application Server 4676	\N	1	8 units	547.36	71	29	10	f
1525	Tomcat Application Server 3174	\N	1	7 units	382.58	40	27	11	f
1526	HP ProLiant Server 5417	\N	1	5 units	430.92	31	16	11	f
1527	Server Dell PowerEdge 3922	\N	1	9 units	926.15	99	10	5	f
1528	Apache Web Server 3324	\N	1	9 units	252.87	78	11	19	f
1529	MongoDB Database 4860	\N	1	4 units	396.58	45	39	6	f
1530	IBM System x 6429	\N	1	9 units	429.31	99	13	9	f
1531	Node.js Runtime 3452	\N	2	7 units	483.96	53	25	6	f
1532	Apache Web Server 4902	\N	1	2 units	543.87	89	19	13	f
1533	Azure Virtual Machine 4190	\N	2	8 units	977.08	77	9	13	f
1534	AWS EC2 Instance 4477	\N	1	8 units	623.55	60	1	14	f
1535	Oracle Database 4542	\N	1	9 units	479.90	93	45	12	f
1536	Nginx Load Balancer 6594	\N	2	5 units	652.79	76	42	9	f
1537	SQL Server 6341	\N	2	8 units	790.71	2	10	16	f
1538	Apache Web Server 3497	\N	2	9 units	935.57	42	40	10	f
1539	MongoDB Database 4434	\N	1	1 units	467.14	4	19	9	f
1540	Python Runtime 4582	\N	1	7 units	645.95	8	18	14	f
1541	Node.js Runtime 2992	\N	2	7 units	216.06	87	44	10	f
1542	Apache Web Server 4045	\N	1	8 units	596.84	57	49	18	f
1543	HP ProLiant Server 6053	\N	1	1 units	215.78	59	18	15	f
1544	HP ProLiant Server 4765	\N	1	1 units	979.81	10	40	18	f
1545	MySQL Database 3984	\N	1	4 units	272.39	0	28	6	f
1546	SQL Server 7061	\N	2	7 units	1019.56	10	10	7	f
1547	Kubernetes Cluster 8668	\N	2	6 units	222.38	61	3	13	t
1548	Cisco UCS 7853	\N	1	3 units	701.83	44	40	5	f
1549	Azure Virtual Machine 8573	\N	1	3 units	298.05	50	48	8	f
1550	Azure Virtual Machine 2534	\N	2	9 units	1056.47	5	7	6	f
1551	Oracle Database 1813	\N	2	1 units	379.32	73	49	7	f
1552	Cisco UCS 5038	\N	2	4 units	998.19	20	24	19	f
1553	Docker Container 7952	\N	1	4 units	1083.45	15	31	6	t
1554	Cisco UCS 2921	\N	2	2 units	613.77	12	39	13	f
1555	Azure Virtual Machine 6228	\N	1	2 units	357.78	93	9	14	f
1556	MongoDB Database 4469	\N	2	9 units	506.15	90	34	14	f
1557	HP ProLiant Server 2162	\N	2	9 units	264.26	54	49	14	f
1558	HP ProLiant Server 3429	\N	1	3 units	304.11	48	17	11	f
1559	HP ProLiant Server 2409	\N	1	9 units	137.03	82	40	14	f
1560	PostgreSQL Server 8024	\N	1	9 units	480.85	70	24	14	f
1561	Server Dell PowerEdge 2203	\N	1	6 units	907.07	77	6	12	f
1562	MongoDB Database 9440	\N	1	7 units	723.34	65	37	19	t
1563	AWS EC2 Instance 2608	\N	1	8 units	445.77	23	26	9	f
1564	AWS EC2 Instance 2541	\N	2	7 units	262.41	41	40	7	t
1565	MongoDB Database 4017	\N	1	9 units	826.26	47	25	9	f
1566	HP ProLiant Server 4357	\N	1	6 units	237.46	50	35	13	f
1567	Apache Web Server 4902	\N	2	4 units	1025.96	24	39	8	f
1568	Redis Cache 7694	\N	1	2 units	907.67	16	21	5	f
1569	SQL Server 4325	\N	2	9 units	341.69	99	33	9	f
1570	Tomcat Application Server 4950	\N	1	7 units	331.60	25	8	18	f
1571	MongoDB Database 3126	\N	2	2 units	233.23	46	35	13	f
1572	MongoDB Database 2050	\N	2	4 units	800.00	47	44	16	t
1573	Cisco UCS 8503	\N	2	8 units	142.34	69	10	10	f
1574	HP ProLiant Server 9298	\N	2	6 units	390.14	8	25	9	f
1575	MySQL Database 4043	\N	2	9 units	419.29	55	42	15	f
1576	Nginx Load Balancer 7615	\N	1	2 units	320.78	21	18	10	f
1577	Tomcat Application Server 5180	\N	2	5 units	788.24	82	36	8	f
1578	SQL Server 3718	\N	1	2 units	619.37	90	15	16	f
1579	SQL Server 4328	\N	1	8 units	1092.38	89	1	13	f
1580	PostgreSQL Server 9805	\N	1	9 units	237.90	2	31	7	f
1581	Kubernetes Cluster 5205	\N	2	6 units	966.83	66	6	13	f
1582	SQL Server 9728	\N	2	4 units	576.69	47	16	8	f
1583	Kubernetes Cluster 9259	\N	1	5 units	1020.34	8	22	16	f
1584	IBM System x 6051	\N	1	1 units	882.76	55	20	9	f
1585	PostgreSQL Server 9856	\N	1	6 units	806.38	6	3	9	f
1586	MySQL Database 1393	\N	1	7 units	179.25	36	24	19	f
1587	MySQL Database 8843	\N	1	5 units	974.66	99	24	18	f
1588	Google Cloud Compute 2078	\N	1	9 units	596.95	67	43	5	f
1589	Cisco UCS 8600	\N	1	1 units	1029.75	33	9	7	f
1590	Oracle Database 7753	\N	1	7 units	207.64	13	1	18	f
1591	PostgreSQL Server 1301	\N	2	5 units	523.04	0	26	10	f
1592	Cisco UCS 4217	\N	1	1 units	846.13	8	15	8	f
1593	Tomcat Application Server 4044	\N	2	7 units	276.73	30	13	15	f
1594	MongoDB Database 6859	\N	1	3 units	360.63	98	2	12	f
1595	Python Runtime 2070	\N	2	9 units	683.46	72	43	10	f
1596	MySQL Database 3637	\N	1	1 units	352.98	45	34	6	f
1597	Python Runtime 6461	\N	1	5 units	1008.17	19	20	14	f
1598	SQL Server 4602	\N	1	3 units	450.62	81	19	17	f
1599	Nginx Load Balancer 5958	\N	2	4 units	544.62	28	21	11	f
1600	Kubernetes Cluster 6321	\N	1	9 units	766.16	44	21	15	f
1601	SQL Server 5269	\N	1	5 units	471.78	70	18	18	f
1602	MongoDB Database 6134	\N	1	2 units	399.33	25	18	18	f
1603	AWS EC2 Instance 6764	\N	1	5 units	835.56	8	47	16	f
1604	Server Dell PowerEdge 5017	\N	1	3 units	289.20	12	38	19	t
1605	Cisco UCS 9964	\N	1	6 units	594.94	50	14	17	f
1606	IBM System x 9244	\N	2	6 units	431.65	56	6	13	f
1607	Oracle Database 6339	\N	1	2 units	205.76	53	25	19	f
1608	Node.js Runtime 2932	\N	2	4 units	834.59	6	49	9	f
1609	Google Cloud Compute 6845	\N	1	1 units	652.56	0	27	5	f
1610	SQL Server 7251	\N	2	1 units	311.59	56	6	15	f
1611	Cisco UCS 1261	\N	1	5 units	919.42	60	19	12	f
1612	AWS EC2 Instance 8881	\N	2	2 units	899.94	41	39	6	f
1613	Server Dell PowerEdge 7014	\N	2	6 units	236.94	39	41	7	t
1614	Python Runtime 1861	\N	2	7 units	1070.17	36	14	10	f
1615	Oracle Database 5803	\N	1	7 units	979.51	36	0	18	f
1616	SQL Server 3391	\N	2	2 units	423.06	49	7	15	f
1617	Nginx Load Balancer 9403	\N	1	1 units	645.18	53	2	5	f
1618	Python Runtime 1637	\N	1	2 units	883.19	48	33	18	f
1619	IBM System x 9402	\N	2	4 units	241.01	32	12	16	f
1620	Docker Container 1012	\N	1	7 units	665.81	63	36	12	f
1621	IBM System x 5245	\N	2	6 units	1063.65	87	33	6	f
1622	Redis Cache 2724	\N	1	1 units	644.44	98	8	13	f
1623	Oracle Database 5015	\N	2	6 units	200.83	67	34	13	f
1624	SQL Server 3109	\N	1	8 units	1049.88	6	9	16	f
1625	Node.js Runtime 6234	\N	1	4 units	363.46	14	2	10	f
1626	Tomcat Application Server 7476	\N	2	3 units	617.98	95	35	12	f
1627	Azure Virtual Machine 7591	\N	1	5 units	916.88	20	8	5	f
1628	HP ProLiant Server 5696	\N	1	7 units	238.31	96	9	16	f
1629	Node.js Runtime 2571	\N	2	6 units	1068.66	87	11	8	f
1630	SQL Server 6573	\N	1	2 units	173.17	2	2	16	f
1631	PostgreSQL Server 9048	\N	1	5 units	953.81	34	22	6	f
1632	Nginx Load Balancer 2663	\N	2	9 units	654.76	39	28	10	f
1633	SQL Server 1707	\N	1	1 units	735.58	63	10	11	f
1634	HP ProLiant Server 2011	\N	2	8 units	535.26	52	36	18	f
1635	PostgreSQL Server 6839	\N	2	8 units	644.53	43	2	6	t
1636	Azure Virtual Machine 9138	\N	1	8 units	1045.11	97	33	19	f
1637	Node.js Runtime 7616	\N	1	3 units	452.11	38	41	5	f
1638	HP ProLiant Server 3637	\N	1	4 units	1019.59	27	15	9	f
1639	SQL Server 3197	\N	1	7 units	289.75	29	22	17	f
1640	Google Cloud Compute 3180	\N	2	4 units	674.40	94	2	9	f
1641	Node.js Runtime 9872	\N	2	7 units	285.48	65	38	9	f
1642	Oracle Database 7576	\N	2	9 units	411.83	7	2	15	f
1643	SQL Server 8002	\N	1	1 units	516.68	26	14	18	f
1644	Server Dell PowerEdge 4178	\N	2	3 units	528.07	85	38	18	f
1645	Oracle Database 5573	\N	1	4 units	183.07	82	3	16	f
1646	Azure Virtual Machine 9318	\N	1	2 units	871.66	1	5	14	f
1647	Oracle Database 1651	\N	2	4 units	847.86	43	43	19	f
1648	Cisco UCS 9053	\N	1	1 units	607.81	78	47	11	f
1649	Oracle Database 3660	\N	2	1 units	584.27	70	30	17	f
1650	PostgreSQL Server 2032	\N	2	3 units	158.75	86	3	7	f
1651	Server Dell PowerEdge 4747	\N	2	3 units	1035.99	51	29	17	f
1652	Cisco UCS 7611	\N	1	3 units	690.00	16	43	19	f
1653	Tomcat Application Server 8525	\N	2	8 units	677.24	88	48	11	f
1654	Tomcat Application Server 2619	\N	1	5 units	203.29	74	40	16	f
1655	Cisco UCS 7223	\N	1	9 units	575.95	74	39	6	f
1656	Server Dell PowerEdge 7010	\N	1	6 units	328.59	52	7	5	f
1657	MySQL Database 5880	\N	2	6 units	235.20	59	19	13	f
1658	Server Dell PowerEdge 2808	\N	2	5 units	979.81	60	13	12	f
1659	SQL Server 1650	\N	1	4 units	545.37	57	8	19	t
1660	MySQL Database 5605	\N	2	3 units	1039.49	60	48	16	f
1661	Tomcat Application Server 6550	\N	2	7 units	266.46	16	7	14	f
1662	HP ProLiant Server 2334	\N	2	5 units	161.26	22	17	14	f
1663	IBM System x 7233	\N	2	4 units	905.39	5	17	17	f
1664	Docker Container 2574	\N	1	8 units	631.92	28	5	16	f
1665	Node.js Runtime 2070	\N	1	8 units	628.20	81	25	17	f
1666	Oracle Database 6488	\N	1	7 units	335.01	78	20	7	f
1667	Cisco UCS 9151	\N	1	8 units	711.96	19	33	5	f
1668	Google Cloud Compute 9520	\N	1	3 units	779.78	40	44	14	f
1669	Redis Cache 1370	\N	2	5 units	745.72	79	5	8	f
1670	Node.js Runtime 7787	\N	1	4 units	499.00	91	3	19	f
1671	Redis Cache 1814	\N	1	8 units	1041.10	90	1	19	f
1672	Nginx Load Balancer 9147	\N	1	4 units	464.78	69	29	17	f
1673	Redis Cache 4062	\N	1	3 units	992.52	37	46	13	f
1674	Tomcat Application Server 7294	\N	2	9 units	1066.02	85	34	6	f
1675	Oracle Database 3551	\N	2	3 units	800.49	19	31	17	f
1676	Oracle Database 4171	\N	1	8 units	286.34	57	43	5	f
1677	Nginx Load Balancer 6799	\N	1	5 units	496.49	78	34	10	f
1678	PostgreSQL Server 1963	\N	1	2 units	880.65	96	6	10	f
1679	IBM System x 8252	\N	2	7 units	1033.81	36	37	11	f
1680	MySQL Database 2587	\N	2	1 units	998.98	85	14	9	f
1681	HP ProLiant Server 3665	\N	1	8 units	867.85	35	46	19	f
1682	Nginx Load Balancer 4318	\N	2	1 units	690.19	57	28	19	f
1683	Python Runtime 2739	\N	1	1 units	307.76	90	39	16	f
1684	HP ProLiant Server 3067	\N	2	2 units	207.11	62	24	7	f
1685	MongoDB Database 8110	\N	1	5 units	1044.21	6	46	17	f
1686	Cisco UCS 7209	\N	2	8 units	906.75	8	14	8	f
1687	Google Cloud Compute 5026	\N	1	8 units	451.72	66	36	6	f
1688	Docker Container 4484	\N	2	4 units	363.47	66	3	7	f
1689	Node.js Runtime 9087	\N	2	6 units	971.66	16	28	9	f
1690	MongoDB Database 3788	\N	1	2 units	363.21	52	5	5	f
1691	MySQL Database 1802	\N	1	5 units	968.92	9	25	10	f
1692	Node.js Runtime 4088	\N	2	3 units	804.50	9	45	10	f
1693	HP ProLiant Server 7843	\N	1	8 units	545.16	1	39	14	f
1694	IBM System x 9767	\N	2	1 units	408.28	25	28	19	f
1695	Kubernetes Cluster 7210	\N	2	4 units	732.51	10	10	12	f
1696	IBM System x 2662	\N	1	3 units	715.35	80	31	19	f
1697	Docker Container 9255	\N	2	1 units	718.03	37	39	13	t
1698	Redis Cache 5756	\N	2	2 units	818.84	45	37	12	f
1699	Node.js Runtime 7940	\N	1	7 units	390.55	37	18	16	t
1700	Azure Virtual Machine 9255	\N	2	2 units	545.04	44	0	6	f
1701	PostgreSQL Server 2069	\N	1	7 units	437.24	20	39	7	f
1702	Server Dell PowerEdge 6496	\N	1	1 units	483.11	31	22	10	f
1703	Nginx Load Balancer 4970	\N	2	3 units	253.14	66	17	5	f
1704	IBM System x 8583	\N	2	8 units	546.49	84	45	7	f
1705	IBM System x 9813	\N	2	4 units	122.41	42	1	10	f
1706	Azure Virtual Machine 9617	\N	1	2 units	655.67	18	28	10	f
1707	Redis Cache 7244	\N	2	3 units	875.43	61	17	19	f
1708	HP ProLiant Server 8328	\N	2	6 units	716.31	39	6	5	f
1709	Azure Virtual Machine 7540	\N	2	3 units	822.09	3	45	11	f
1710	Python Runtime 2331	\N	2	9 units	618.08	40	27	11	f
1711	Google Cloud Compute 9675	\N	1	9 units	227.02	24	26	19	f
1712	Kubernetes Cluster 1063	\N	2	4 units	850.31	81	11	18	t
1713	Python Runtime 6990	\N	1	8 units	1070.72	69	24	18	f
1714	Python Runtime 4002	\N	2	4 units	966.83	54	27	14	f
1715	IBM System x 5326	\N	1	7 units	980.62	32	22	8	f
1716	Google Cloud Compute 8038	\N	2	2 units	565.24	90	21	11	f
1717	IBM System x 9587	\N	2	2 units	1052.92	71	38	5	f
1718	Redis Cache 8235	\N	1	3 units	371.58	11	24	8	f
1719	SQL Server 1103	\N	2	9 units	896.58	40	5	14	f
1720	SQL Server 3354	\N	2	4 units	532.26	97	30	18	f
1721	PostgreSQL Server 7746	\N	2	1 units	763.01	79	38	17	f
1722	SQL Server 6772	\N	2	5 units	538.34	40	44	5	f
1723	Nginx Load Balancer 7964	\N	1	9 units	972.66	73	44	5	f
1724	MySQL Database 1555	\N	2	4 units	781.32	22	18	11	f
1725	HP ProLiant Server 3342	\N	1	5 units	401.80	48	29	14	f
1726	Azure Virtual Machine 2288	\N	1	8 units	812.35	76	36	13	f
1727	Google Cloud Compute 2751	\N	1	3 units	988.47	7	5	17	f
1728	Docker Container 6425	\N	2	2 units	910.23	70	14	5	f
1729	SQL Server 1815	\N	2	8 units	535.89	61	7	5	f
1730	Tomcat Application Server 9727	\N	1	1 units	554.91	25	39	16	f
1731	AWS EC2 Instance 2559	\N	1	9 units	325.96	96	33	10	f
1732	Google Cloud Compute 5978	\N	1	5 units	272.84	89	49	18	f
1733	Oracle Database 2951	\N	2	6 units	618.63	76	7	8	f
1734	SQL Server 2010	\N	2	9 units	245.14	34	41	18	f
1735	Oracle Database 6398	\N	2	8 units	274.04	14	2	8	f
1736	Google Cloud Compute 5996	\N	2	4 units	960.71	73	47	7	f
1737	Nginx Load Balancer 4867	\N	1	9 units	354.13	55	13	12	f
1738	MongoDB Database 7561	\N	1	2 units	392.32	10	8	12	f
1739	Node.js Runtime 9412	\N	2	2 units	705.04	0	41	8	f
1740	SQL Server 7735	\N	2	8 units	1097.20	15	1	6	f
1741	Python Runtime 9045	\N	2	7 units	914.79	36	32	18	f
1742	MongoDB Database 9333	\N	2	7 units	366.76	29	44	5	f
1743	SQL Server 8400	\N	1	7 units	903.62	17	11	19	f
1744	Cisco UCS 3246	\N	1	9 units	855.04	62	15	12	f
1745	PostgreSQL Server 9520	\N	1	6 units	598.86	45	23	8	f
1746	Google Cloud Compute 5510	\N	2	4 units	883.13	55	2	19	f
1747	Tomcat Application Server 9258	\N	2	9 units	619.47	43	21	18	f
1748	Apache Web Server 3846	\N	1	5 units	426.65	22	25	17	t
1749	IBM System x 5598	\N	2	5 units	1028.94	99	44	10	f
1750	IBM System x 5050	\N	2	7 units	773.33	51	29	18	f
1751	Cisco UCS 1663	\N	2	1 units	254.86	14	34	8	f
1752	Docker Container 3693	\N	1	6 units	1049.05	49	46	12	f
1753	MongoDB Database 5567	\N	1	9 units	674.18	41	23	8	t
1754	PostgreSQL Server 9628	\N	1	6 units	1012.80	58	19	7	f
1755	Redis Cache 5671	\N	2	2 units	599.63	12	41	6	f
1756	PostgreSQL Server 8303	\N	1	9 units	761.69	70	43	14	f
1757	Redis Cache 5503	\N	1	5 units	116.15	24	49	19	f
1758	Cisco UCS 2825	\N	1	4 units	783.36	75	41	17	f
1759	SQL Server 4346	\N	2	9 units	875.29	77	6	11	t
1760	Apache Web Server 6500	\N	2	8 units	1002.62	12	16	9	f
1761	Docker Container 4300	\N	1	5 units	1083.62	55	42	17	f
1762	PostgreSQL Server 7769	\N	1	5 units	220.84	74	38	15	t
1763	Apache Web Server 8684	\N	2	1 units	658.44	44	43	7	t
1764	Cisco UCS 4374	\N	1	2 units	672.57	81	26	17	f
1765	MySQL Database 3607	\N	2	5 units	982.60	36	30	16	f
1766	Kubernetes Cluster 6523	\N	1	2 units	1029.82	87	46	13	f
1767	Redis Cache 5126	\N	2	1 units	350.30	14	41	7	f
1768	Server Dell PowerEdge 1930	\N	2	9 units	474.14	3	21	18	f
1769	Node.js Runtime 2637	\N	2	5 units	399.32	76	7	15	f
1770	Apache Web Server 2355	\N	1	1 units	427.81	5	32	6	f
1771	Azure Virtual Machine 5265	\N	1	5 units	789.50	56	39	12	f
1772	Nginx Load Balancer 6042	\N	1	1 units	1006.16	96	24	13	f
1773	HP ProLiant Server 8522	\N	1	8 units	216.79	21	47	10	f
1774	Apache Web Server 5591	\N	2	1 units	1091.06	83	26	7	f
1775	Apache Web Server 3175	\N	1	1 units	473.63	3	33	14	f
1776	MongoDB Database 4468	\N	2	1 units	208.57	84	14	5	f
1777	HP ProLiant Server 2399	\N	2	6 units	1073.57	15	18	11	t
1778	Cisco UCS 3028	\N	1	6 units	167.26	4	48	19	f
1779	Python Runtime 5880	\N	2	2 units	939.53	29	26	11	f
1780	Server Dell PowerEdge 3607	\N	2	7 units	362.46	71	30	16	f
1781	Azure Virtual Machine 6174	\N	1	7 units	575.76	6	19	8	t
1782	MongoDB Database 3813	\N	2	2 units	606.64	69	19	10	f
1783	IBM System x 4260	\N	1	7 units	654.07	11	17	15	f
1784	AWS EC2 Instance 8255	\N	2	8 units	470.16	3	30	7	f
1785	SQL Server 4957	\N	2	2 units	914.26	67	11	11	f
1786	Google Cloud Compute 5978	\N	2	4 units	933.45	31	1	17	t
1787	MySQL Database 8793	\N	2	5 units	455.13	29	46	14	f
1788	SQL Server 2438	\N	1	5 units	798.99	75	18	8	f
1789	HP ProLiant Server 7328	\N	2	8 units	552.91	94	14	19	f
1790	Oracle Database 2526	\N	1	3 units	624.66	3	19	15	t
1791	Nginx Load Balancer 3783	\N	1	5 units	107.60	77	25	15	f
1792	MongoDB Database 5369	\N	1	8 units	551.30	71	4	13	t
1793	Tomcat Application Server 5524	\N	2	5 units	302.31	67	29	6	f
1794	SQL Server 8579	\N	1	5 units	1088.14	92	12	19	f
1795	HP ProLiant Server 3012	\N	1	5 units	832.43	72	3	17	f
1796	Tomcat Application Server 2722	\N	2	6 units	448.41	45	37	17	f
1797	Kubernetes Cluster 8602	\N	1	9 units	970.02	96	22	7	f
1798	Cisco UCS 8074	\N	1	2 units	224.60	97	14	7	f
1799	Node.js Runtime 4459	\N	2	6 units	414.96	18	49	13	t
1800	Docker Container 2713	\N	1	1 units	1018.01	33	26	16	f
1801	Oracle Database 1310	\N	2	8 units	423.72	73	38	19	f
1802	AWS EC2 Instance 8599	\N	2	3 units	990.99	50	31	5	f
1803	MySQL Database 9662	\N	2	8 units	458.81	41	39	15	f
1804	Server Dell PowerEdge 4042	\N	1	8 units	390.48	48	20	15	f
1805	Docker Container 6383	\N	1	4 units	468.19	26	17	13	f
1806	AWS EC2 Instance 5176	\N	2	4 units	826.32	94	45	18	f
1807	HP ProLiant Server 9258	\N	1	7 units	583.15	87	29	15	f
1808	AWS EC2 Instance 3094	\N	2	3 units	728.97	89	17	10	f
1809	SQL Server 9490	\N	1	1 units	661.56	16	7	9	f
1810	Google Cloud Compute 1773	\N	1	3 units	682.54	75	17	19	f
1811	Kubernetes Cluster 6027	\N	2	6 units	239.45	76	0	7	f
1812	Nginx Load Balancer 8790	\N	2	7 units	932.35	12	10	15	f
1813	Docker Container 6193	\N	1	3 units	1053.23	6	6	13	f
1814	MongoDB Database 8798	\N	2	2 units	1006.01	51	30	17	f
1815	Azure Virtual Machine 9987	\N	2	7 units	587.81	20	6	14	f
1816	Nginx Load Balancer 5202	\N	2	7 units	764.47	40	26	8	f
1817	Nginx Load Balancer 1584	\N	2	4 units	549.14	90	25	6	f
1818	Server Dell PowerEdge 9713	\N	2	5 units	326.02	67	22	18	f
1819	IBM System x 6208	\N	1	3 units	830.59	92	14	6	f
1820	Azure Virtual Machine 5015	\N	2	7 units	233.85	8	38	8	f
1821	Tomcat Application Server 8759	\N	1	9 units	188.65	11	36	18	f
1822	Cisco UCS 4267	\N	2	9 units	334.82	72	9	12	f
1823	Docker Container 5559	\N	1	6 units	774.97	14	2	7	f
1824	Google Cloud Compute 4633	\N	1	7 units	181.54	9	41	10	f
1825	Redis Cache 7773	\N	2	4 units	163.58	78	48	5	f
1826	HP ProLiant Server 7878	\N	1	5 units	285.14	39	5	5	f
1827	Google Cloud Compute 7829	\N	1	5 units	695.36	66	30	15	f
1828	Python Runtime 8465	\N	1	8 units	739.89	67	11	16	f
1829	Apache Web Server 7471	\N	1	7 units	1047.04	21	34	13	f
1830	MongoDB Database 6813	\N	2	4 units	351.17	74	6	9	f
1831	AWS EC2 Instance 6925	\N	2	9 units	759.09	47	43	11	t
1832	Node.js Runtime 7423	\N	2	1 units	1017.07	47	15	15	f
1833	Docker Container 2746	\N	1	7 units	715.85	77	36	13	f
1834	MongoDB Database 4597	\N	2	3 units	807.12	7	43	5	f
1835	PostgreSQL Server 9586	\N	1	9 units	397.53	8	47	14	f
1836	SQL Server 6377	\N	2	3 units	461.08	64	0	15	f
1837	SQL Server 1450	\N	2	5 units	295.29	27	17	7	f
1838	IBM System x 7972	\N	1	8 units	282.47	13	49	15	t
1839	Redis Cache 5598	\N	2	4 units	1005.50	38	49	12	f
1840	Azure Virtual Machine 4459	\N	2	3 units	664.93	9	48	7	f
1841	MySQL Database 5722	\N	1	1 units	591.47	96	29	18	f
1842	Google Cloud Compute 8613	\N	2	1 units	452.84	39	2	6	f
1843	PostgreSQL Server 6258	\N	2	8 units	336.63	1	18	5	f
1844	Google Cloud Compute 9274	\N	2	9 units	455.79	63	19	17	f
1845	Node.js Runtime 6365	\N	1	8 units	339.09	73	43	19	f
1846	PostgreSQL Server 1735	\N	2	1 units	414.27	79	18	19	f
1847	Google Cloud Compute 1502	\N	2	4 units	900.66	21	36	12	t
1848	Server Dell PowerEdge 2878	\N	1	2 units	165.69	34	7	17	f
1849	Redis Cache 5892	\N	2	9 units	492.44	50	7	8	f
1850	Oracle Database 7730	\N	2	3 units	925.32	39	6	17	f
1851	Cisco UCS 9899	\N	2	8 units	729.90	62	19	6	t
1852	MongoDB Database 4191	\N	1	6 units	155.85	64	27	7	f
1853	Node.js Runtime 5461	\N	1	1 units	280.37	9	9	12	f
1854	PostgreSQL Server 6672	\N	2	2 units	443.87	89	44	14	f
1855	MongoDB Database 7842	\N	1	2 units	636.39	53	23	7	f
1856	Docker Container 9763	\N	1	3 units	820.19	59	32	10	f
1857	PostgreSQL Server 3645	\N	2	7 units	659.53	74	3	7	f
1858	Docker Container 9916	\N	2	4 units	169.24	17	7	11	f
1859	Cisco UCS 9064	\N	2	3 units	682.45	63	36	14	t
1860	Nginx Load Balancer 4717	\N	1	8 units	559.90	96	45	8	f
1861	PostgreSQL Server 6397	\N	1	6 units	662.60	67	23	12	t
1862	Redis Cache 9830	\N	2	7 units	706.42	51	35	18	f
1863	Python Runtime 4271	\N	1	7 units	180.57	36	0	13	f
1864	SQL Server 3096	\N	2	7 units	911.96	29	7	6	f
1865	Kubernetes Cluster 7770	\N	1	3 units	245.36	68	39	13	f
1866	Tomcat Application Server 4574	\N	2	2 units	542.96	62	38	19	f
1867	Oracle Database 1890	\N	2	4 units	213.79	22	11	9	t
1868	Python Runtime 6877	\N	1	1 units	774.95	23	41	17	f
1869	Node.js Runtime 4366	\N	1	3 units	938.82	83	30	10	f
1870	Nginx Load Balancer 8230	\N	1	4 units	109.38	84	49	14	t
1871	SQL Server 8514	\N	2	3 units	449.43	94	0	14	t
1872	Cisco UCS 4502	\N	1	2 units	400.09	1	37	9	f
1873	Python Runtime 1625	\N	1	6 units	416.45	80	49	13	f
1874	Node.js Runtime 5915	\N	1	7 units	698.19	5	39	9	f
1875	Kubernetes Cluster 4810	\N	1	4 units	208.53	78	8	6	f
1876	MongoDB Database 9755	\N	1	2 units	1075.93	64	0	18	f
1877	AWS EC2 Instance 2724	\N	1	1 units	214.84	16	16	7	f
1878	Apache Web Server 7668	\N	2	7 units	731.04	6	13	12	f
1879	Cisco UCS 6141	\N	1	5 units	558.73	67	27	15	f
1880	MySQL Database 8238	\N	1	7 units	1093.81	41	41	17	f
1881	MySQL Database 3590	\N	2	2 units	671.28	45	10	19	f
1882	Cisco UCS 6552	\N	1	6 units	139.09	8	18	16	t
1883	MySQL Database 5547	\N	2	8 units	913.54	50	24	5	f
1884	MySQL Database 4071	\N	1	5 units	589.93	26	45	10	f
1885	HP ProLiant Server 3975	\N	1	9 units	497.11	63	40	12	f
1886	PostgreSQL Server 7003	\N	1	1 units	288.53	97	34	19	t
1887	Azure Virtual Machine 7714	\N	2	8 units	627.67	31	27	12	f
1888	Server Dell PowerEdge 3990	\N	2	3 units	289.58	77	2	15	t
1889	Oracle Database 3633	\N	2	6 units	538.07	7	9	10	f
1890	Redis Cache 9249	\N	1	3 units	467.10	21	3	17	f
1891	Oracle Database 3063	\N	2	1 units	698.63	15	19	12	f
1892	MySQL Database 5687	\N	2	7 units	894.48	4	32	18	f
1893	MySQL Database 3306	\N	1	5 units	560.32	71	32	6	f
1894	Google Cloud Compute 1213	\N	2	5 units	970.59	66	22	13	f
1895	Google Cloud Compute 9290	\N	1	4 units	140.75	9	9	10	f
1896	IBM System x 4008	\N	2	3 units	1022.33	63	34	17	f
1897	Docker Container 6858	\N	2	2 units	969.77	49	43	9	f
1898	Node.js Runtime 8254	\N	2	6 units	755.72	10	39	17	f
1899	Server Dell PowerEdge 1200	\N	1	1 units	504.57	20	12	8	f
1900	Nginx Load Balancer 1299	\N	1	2 units	176.75	38	2	17	f
1901	Oracle Database 3926	\N	2	3 units	661.13	45	11	5	f
1902	MongoDB Database 3640	\N	2	3 units	778.48	74	1	8	f
1903	Server Dell PowerEdge 5434	\N	2	9 units	987.26	85	11	19	f
1904	Python Runtime 1253	\N	2	2 units	1032.20	24	34	9	t
1905	Docker Container 8811	\N	1	6 units	1021.49	22	22	6	f
1906	SQL Server 3738	\N	2	5 units	702.65	77	5	18	t
1907	Server Dell PowerEdge 6317	\N	1	6 units	294.57	42	29	19	f
1908	Node.js Runtime 2608	\N	2	3 units	393.17	51	35	10	f
1909	Kubernetes Cluster 6796	\N	2	9 units	871.94	70	29	19	f
1910	Cisco UCS 8892	\N	1	4 units	547.62	15	0	11	f
1911	MongoDB Database 9727	\N	1	4 units	687.59	19	3	19	f
1912	SQL Server 8114	\N	2	5 units	572.00	30	21	5	f
1913	SQL Server 7936	\N	2	6 units	620.45	49	10	10	t
1914	MySQL Database 1852	\N	1	1 units	268.54	13	1	18	f
1915	HP ProLiant Server 9748	\N	2	5 units	924.35	12	43	13	f
1916	Oracle Database 2976	\N	2	5 units	1066.21	64	3	7	t
1917	Azure Virtual Machine 2285	\N	2	4 units	317.22	69	16	14	t
1918	Google Cloud Compute 6389	\N	2	9 units	1016.07	55	3	16	f
1919	PostgreSQL Server 3920	\N	2	9 units	532.23	67	24	9	f
1920	Tomcat Application Server 7879	\N	2	3 units	478.20	25	43	18	f
1921	Google Cloud Compute 4686	\N	1	8 units	289.49	5	5	12	f
1922	Google Cloud Compute 5972	\N	1	2 units	1093.31	4	13	14	f
1923	Cisco UCS 9344	\N	2	1 units	455.20	69	2	10	f
1924	Node.js Runtime 1124	\N	1	3 units	200.09	15	37	11	f
1925	Redis Cache 9086	\N	2	1 units	167.13	56	35	15	f
1926	Kubernetes Cluster 1387	\N	1	1 units	853.21	45	13	19	f
1927	Docker Container 9853	\N	2	3 units	304.59	93	29	13	t
1928	Oracle Database 9383	\N	1	9 units	1069.63	45	37	5	f
1929	Redis Cache 8713	\N	1	8 units	432.29	89	22	12	f
1930	Cisco UCS 7581	\N	2	8 units	260.70	86	41	15	f
1931	SQL Server 7872	\N	1	6 units	111.55	38	4	15	f
1932	Azure Virtual Machine 4812	\N	1	1 units	351.34	39	8	14	f
1933	Redis Cache 6765	\N	2	6 units	202.55	71	36	9	f
1934	Kubernetes Cluster 3175	\N	2	4 units	1085.52	11	37	11	f
1935	Apache Web Server 9990	\N	1	9 units	242.85	14	44	19	f
1936	HP ProLiant Server 2896	\N	2	1 units	236.40	20	46	7	f
1937	PostgreSQL Server 9164	\N	1	4 units	676.35	75	21	14	t
1938	AWS EC2 Instance 9143	\N	1	1 units	456.58	76	29	6	f
1939	SQL Server 2379	\N	1	7 units	345.50	90	7	13	f
1940	Google Cloud Compute 6774	\N	1	7 units	945.11	90	46	5	f
1941	Node.js Runtime 3465	\N	1	7 units	767.20	54	48	8	f
1942	Docker Container 2128	\N	1	8 units	269.91	14	21	15	f
1943	Nginx Load Balancer 3375	\N	1	8 units	693.67	22	20	19	t
1944	HP ProLiant Server 8389	\N	1	8 units	620.29	85	23	11	f
1945	IBM System x 6753	\N	2	4 units	581.41	4	42	11	f
1946	Apache Web Server 6429	\N	1	3 units	1084.63	77	2	6	t
1947	Nginx Load Balancer 5338	\N	2	1 units	750.83	17	34	8	f
1948	Node.js Runtime 4765	\N	2	6 units	881.99	56	5	18	f
1949	Cisco UCS 1730	\N	2	4 units	103.04	50	43	13	t
1950	IBM System x 6438	\N	1	6 units	977.69	38	4	6	f
1951	Google Cloud Compute 4130	\N	1	7 units	674.13	52	29	9	f
1952	Oracle Database 9339	\N	2	5 units	910.94	90	17	14	f
1953	Nginx Load Balancer 4450	\N	2	3 units	1043.52	31	24	17	f
1954	Tomcat Application Server 8131	\N	1	9 units	157.13	98	10	6	f
1955	Apache Web Server 9372	\N	1	7 units	983.15	36	12	6	f
1956	HP ProLiant Server 8460	\N	2	7 units	728.74	83	48	13	f
1957	Oracle Database 6569	\N	2	3 units	699.41	5	19	12	f
1958	MySQL Database 2893	\N	2	7 units	1033.36	46	0	17	f
1959	Kubernetes Cluster 2246	\N	2	9 units	115.30	92	19	7	f
1960	Node.js Runtime 4772	\N	1	2 units	467.62	38	8	15	f
1961	Tomcat Application Server 9814	\N	1	5 units	514.22	17	16	5	f
1962	AWS EC2 Instance 8193	\N	1	6 units	947.04	69	13	11	f
1963	Azure Virtual Machine 3601	\N	1	7 units	268.04	41	9	15	f
1964	Server Dell PowerEdge 5651	\N	1	9 units	509.49	23	5	8	f
1965	Kubernetes Cluster 8650	\N	2	1 units	131.29	30	20	15	f
1966	Cisco UCS 5704	\N	1	9 units	499.75	42	29	11	f
1967	Apache Web Server 5003	\N	2	3 units	749.31	96	27	9	f
1968	IBM System x 7543	\N	1	7 units	555.49	70	4	13	f
1969	SQL Server 1310	\N	2	9 units	678.95	3	0	7	t
1970	HP ProLiant Server 5524	\N	1	8 units	619.48	59	49	14	f
1971	Python Runtime 2100	\N	2	1 units	702.33	5	14	18	t
1972	PostgreSQL Server 9254	\N	1	8 units	790.34	37	24	13	f
1973	IBM System x 2045	\N	2	6 units	1001.99	22	43	13	f
1974	Apache Web Server 9089	\N	1	8 units	1078.33	90	24	18	f
1975	Python Runtime 1624	\N	2	6 units	642.34	87	18	16	f
1976	MySQL Database 9780	\N	1	7 units	913.13	81	3	6	f
1977	Tomcat Application Server 7835	\N	1	2 units	110.68	31	42	12	f
1978	Google Cloud Compute 5859	\N	2	1 units	316.26	80	24	16	f
1979	MySQL Database 9252	\N	1	5 units	482.79	27	0	19	f
1980	PostgreSQL Server 3016	\N	1	9 units	1002.72	60	42	9	f
1981	Python Runtime 6461	\N	2	5 units	1098.31	91	36	5	t
1982	HP ProLiant Server 3674	\N	1	6 units	104.53	26	36	12	f
1983	Apache Web Server 6169	\N	1	8 units	992.89	58	42	15	f
1984	Apache Web Server 3644	\N	1	4 units	475.82	12	21	5	f
1985	HP ProLiant Server 3593	\N	1	6 units	430.67	9	28	10	f
1986	PostgreSQL Server 2328	\N	2	4 units	251.44	93	17	11	t
1987	Google Cloud Compute 2581	\N	1	5 units	108.55	47	23	7	f
1988	MongoDB Database 6773	\N	1	7 units	868.95	67	42	19	f
1989	Oracle Database 2786	\N	2	5 units	389.92	39	48	15	f
1990	HP ProLiant Server 7792	\N	1	2 units	204.60	49	35	6	f
1991	Apache Web Server 7584	\N	2	5 units	210.41	13	7	13	f
1992	SQL Server 8330	\N	1	4 units	742.74	37	26	17	f
1993	Node.js Runtime 7728	\N	1	2 units	198.70	55	11	14	f
1994	MySQL Database 8130	\N	1	5 units	144.22	17	10	19	f
1995	Oracle Database 2023	\N	2	6 units	374.13	34	37	14	f
1996	Nginx Load Balancer 3401	\N	1	7 units	782.45	63	25	18	f
1997	Google Cloud Compute 7131	\N	2	4 units	140.35	16	39	7	t
1998	AWS EC2 Instance 3065	\N	1	2 units	683.38	31	43	10	f
1999	Tomcat Application Server 7544	\N	2	7 units	630.98	76	36	11	f
2000	PostgreSQL Server 4250	\N	2	7 units	170.85	37	31	17	f
2001	Docker Container 1770	\N	1	6 units	1090.54	76	1	15	t
2002	Node.js Runtime 7921	\N	1	6 units	1047.82	6	41	18	f
2003	MongoDB Database 2883	\N	2	8 units	996.26	17	6	16	f
2004	Docker Container 1730	\N	1	8 units	1015.85	49	22	7	f
2005	Tomcat Application Server 8925	\N	2	8 units	392.33	44	46	5	f
2006	Node.js Runtime 1512	\N	2	7 units	622.70	2	44	10	f
2007	SQL Server 2942	\N	2	5 units	520.58	70	33	7	f
2008	HP ProLiant Server 6164	\N	2	9 units	737.62	31	7	18	f
2009	Tomcat Application Server 5203	\N	2	7 units	910.46	79	32	16	f
2010	Node.js Runtime 8847	\N	2	6 units	109.88	32	12	15	f
2011	Cisco UCS 4525	\N	2	8 units	827.72	53	48	8	f
2012	Python Runtime 2010	\N	1	3 units	630.12	66	9	14	f
2013	Oracle Database 7341	\N	2	5 units	136.20	57	35	11	f
2014	Kubernetes Cluster 9718	\N	1	5 units	761.90	79	18	6	t
2015	Node.js Runtime 4584	\N	2	5 units	337.04	72	17	14	f
2016	Server Dell PowerEdge 3753	\N	1	6 units	1066.28	24	4	13	f
2017	Server Dell PowerEdge 3976	\N	2	4 units	802.53	12	3	6	f
2018	PostgreSQL Server 4148	\N	1	6 units	268.83	2	4	16	f
2019	Redis Cache 9258	\N	2	4 units	512.52	23	20	7	f
2020	Cisco UCS 2540	\N	2	4 units	150.21	48	35	10	f
2021	Docker Container 1926	\N	2	9 units	1067.11	49	36	14	f
2022	Cisco UCS 1873	\N	1	5 units	648.21	1	8	8	f
2023	Apache Web Server 7148	\N	2	8 units	768.53	77	7	10	f
2024	Node.js Runtime 1283	\N	2	8 units	501.81	8	47	7	f
2025	Node.js Runtime 2316	\N	2	5 units	1099.38	1	48	9	f
2026	Google Cloud Compute 8858	\N	2	3 units	559.40	56	31	10	f
2027	Azure Virtual Machine 6890	\N	1	9 units	348.85	38	23	18	f
2028	Docker Container 4624	\N	1	5 units	516.79	41	48	17	f
2029	Google Cloud Compute 1627	\N	2	2 units	805.87	92	15	16	f
2030	Azure Virtual Machine 6327	\N	2	1 units	428.32	96	48	17	f
2031	IBM System x 9269	\N	2	7 units	333.69	86	22	9	f
2032	AWS EC2 Instance 8185	\N	2	7 units	894.36	51	10	12	f
2033	Nginx Load Balancer 2597	\N	1	7 units	102.85	75	33	16	f
2034	Redis Cache 6915	\N	1	4 units	1081.85	75	45	10	f
2035	MongoDB Database 5810	\N	1	2 units	142.38	33	9	14	f
2036	Apache Web Server 4124	\N	2	6 units	608.94	74	8	19	f
2037	Google Cloud Compute 6399	\N	1	8 units	962.63	48	19	13	f
2038	Docker Container 8847	\N	1	9 units	190.37	71	33	6	t
2039	Azure Virtual Machine 5198	\N	1	6 units	837.21	96	16	7	f
2040	Tomcat Application Server 5824	\N	1	5 units	353.93	85	35	9	f
2041	MySQL Database 7113	\N	2	1 units	452.46	89	10	17	f
2042	Redis Cache 5381	\N	1	6 units	304.01	41	37	15	f
2043	Apache Web Server 8225	\N	2	4 units	226.87	29	21	10	f
2044	IBM System x 3692	\N	2	2 units	690.86	29	41	16	f
2045	IBM System x 9019	\N	1	1 units	235.68	78	38	9	f
2046	Cisco UCS 9774	\N	1	7 units	354.86	40	10	12	f
2047	Google Cloud Compute 9733	\N	1	1 units	639.74	9	45	11	f
2048	HP ProLiant Server 7388	\N	2	8 units	213.49	6	21	8	f
2049	Server Dell PowerEdge 1318	\N	2	9 units	550.99	65	27	14	f
2050	Node.js Runtime 6517	\N	2	5 units	366.06	66	42	12	t
2051	Google Cloud Compute 2663	\N	2	1 units	1013.52	77	24	8	f
2052	Nginx Load Balancer 9267	\N	1	2 units	946.22	72	19	8	f
2053	SQL Server 9989	\N	1	6 units	1031.70	6	7	19	f
2054	Oracle Database 8886	\N	2	3 units	930.63	45	49	7	f
2055	IBM System x 2906	\N	1	9 units	839.83	78	31	13	t
2056	Apache Web Server 3951	\N	2	7 units	346.87	1	40	13	f
2057	Azure Virtual Machine 2001	\N	2	2 units	400.70	21	36	18	f
2058	MongoDB Database 3310	\N	2	7 units	785.99	6	12	8	f
2059	Server Dell PowerEdge 5894	\N	1	5 units	383.40	43	13	14	t
2060	PostgreSQL Server 3272	\N	1	9 units	1022.90	60	16	14	f
2061	Apache Web Server 7995	\N	1	3 units	363.00	32	0	9	f
2062	Cisco UCS 9342	\N	2	2 units	202.50	21	48	9	f
2063	AC12	\N	1	2	3450.00	2	1	3	f
2064	AWS EC2 Instance 8741	\N	1	9 units	559.59	54	1	18	f
2068	Calzado	\N	4	6 units	3400.00	32767	32767	32767	t
2069	Mac Ios	\N	7	2 units	4500.00	32767	32767	32767	t
2070	SQL Server 6923	\N	1	6 units	1040.08	56	9	12	f
2071	Cisco UCS 6005	\N	1	4 units	950.78	30	27	11	f
2072	Tomcat Application Server 5456	\N	1	9 units	286.05	75	32	9	f
2073	Azure Virtual Machine 4550	\N	1	5 units	725.67	47	44	6	f
2074	Tomcat Application Server 7659	\N	1	4 units	395.44	65	9	13	f
2075	IBM System x 1108	\N	2	8 units	831.17	85	49	7	f
\.


--
-- TOC entry 4928 (class 0 OID 21506)
-- Dependencies: 220
-- Data for Name: suppliers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.suppliers (supplierid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax, homepage) FROM stdin;
\.


--
-- TOC entry 4932 (class 0 OID 21562)
-- Dependencies: 224
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, email, password_hash, first_name, last_name, role, is_active, created_at, updated_at) FROM stdin;
7	admin	admin@example.com	\\\\\\	Admin	User	Admin	t	2025-10-29 20:36:18.200463	2025-10-29 20:36:18.200463
8	user	user@example.com	\\\\\\.4N8zGzqx5tV8gJ3.nMKO	Regular	User	User	t	2025-10-29 20:36:18.200463	2025-10-29 20:36:18.200463
\.


--
-- TOC entry 4942 (class 0 OID 0)
-- Dependencies: 217
-- Name: categories_categoryid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_categoryid_seq', 7, true);


--
-- TOC entry 4943 (class 0 OID 0)
-- Dependencies: 221
-- Name: products_productid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_productid_seq', 2075, true);


--
-- TOC entry 4944 (class 0 OID 0)
-- Dependencies: 219
-- Name: suppliers_supplierid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.suppliers_supplierid_seq', 1, false);


--
-- TOC entry 4945 (class 0 OID 0)
-- Dependencies: 223
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 8, true);


--
-- TOC entry 4769 (class 2606 OID 21504)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (categoryid);


--
-- TOC entry 4773 (class 2606 OID 21523)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (productid);


--
-- TOC entry 4771 (class 2606 OID 21513)
-- Name: suppliers suppliers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT suppliers_pkey PRIMARY KEY (supplierid);


--
-- TOC entry 4775 (class 2606 OID 21573)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4777 (class 2606 OID 21575)
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- TOC entry 4778 (class 2606 OID 21529)
-- Name: products products_categoryid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_categoryid_fkey FOREIGN KEY (categoryid) REFERENCES public.categories(categoryid);


--
-- TOC entry 4779 (class 2606 OID 21524)
-- Name: products products_supplierid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_supplierid_fkey FOREIGN KEY (supplierid) REFERENCES public.suppliers(supplierid);


-- Completed on 2025-11-02 23:01:23

--
-- PostgreSQL database dump complete
--

\unrestrict NX3gB30LOHd0exUMOP81ldv9br5IaZAoSXavMyv9AdRKojKAsybmKLp0YSdm836

