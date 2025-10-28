--
-- PostgreSQL database dump
--

\restrict AGK72t9QdQocBQukw22eNmwqN74SWCGcP4dUhQqeLxegFVscrVpJ948vL7UXcms

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

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
-- Name: accounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts (
    account_id integer NOT NULL,
    investor_id integer,
    balance numeric(12,2),
    status character varying(20)
);


ALTER TABLE public.accounts OWNER TO postgres;

--
-- Name: accounts_account_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_account_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.accounts_account_id_seq OWNER TO postgres;

--
-- Name: accounts_account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_account_id_seq OWNED BY public.accounts.account_id;


--
-- Name: brokers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.brokers (
    broker_id integer NOT NULL,
    broker_name character varying(100),
    branch_city character varying(50),
    commission_rate numeric(5,2)
);


ALTER TABLE public.brokers OWNER TO postgres;

--
-- Name: brokers_broker_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.brokers_broker_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.brokers_broker_id_seq OWNER TO postgres;

--
-- Name: brokers_broker_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.brokers_broker_id_seq OWNED BY public.brokers.broker_id;


--
-- Name: investors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.investors (
    investor_id integer NOT NULL,
    investor_name character varying(100),
    city character varying(50),
    email character varying(100),
    contact_no character varying(20)
);


ALTER TABLE public.investors OWNER TO postgres;

--
-- Name: investors_investor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.investors_investor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.investors_investor_id_seq OWNER TO postgres;

--
-- Name: investors_investor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.investors_investor_id_seq OWNED BY public.investors.investor_id;


--
-- Name: stocks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stocks (
    stock_id integer NOT NULL,
    symbol character varying(10),
    company_name character varying(100),
    current_price numeric(10,2),
    city character varying(50)
);


ALTER TABLE public.stocks OWNER TO postgres;

--
-- Name: stocks_stock_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stocks_stock_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.stocks_stock_id_seq OWNER TO postgres;

--
-- Name: stocks_stock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stocks_stock_id_seq OWNED BY public.stocks.stock_id;


--
-- Name: trades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trades (
    trade_id integer NOT NULL,
    stock_id integer,
    quantity integer,
    trade_type character varying(10),
    trade_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.trades OWNER TO postgres;

--
-- Name: trades_trade_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.trades_trade_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.trades_trade_id_seq OWNER TO postgres;

--
-- Name: trades_trade_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.trades_trade_id_seq OWNED BY public.trades.trade_id;


--
-- Name: transactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transactions (
    transaction_id integer NOT NULL,
    account_id integer,
    transaction_type character varying(20),
    amount numeric(12,2),
    transaction_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.transactions OWNER TO postgres;

--
-- Name: transactions_transaction_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transactions_transaction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.transactions_transaction_id_seq OWNER TO postgres;

--
-- Name: transactions_transaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transactions_transaction_id_seq OWNED BY public.transactions.transaction_id;


--
-- Name: accounts account_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts ALTER COLUMN account_id SET DEFAULT nextval('public.accounts_account_id_seq'::regclass);


--
-- Name: brokers broker_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brokers ALTER COLUMN broker_id SET DEFAULT nextval('public.brokers_broker_id_seq'::regclass);


--
-- Name: investors investor_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.investors ALTER COLUMN investor_id SET DEFAULT nextval('public.investors_investor_id_seq'::regclass);


--
-- Name: stocks stock_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stocks ALTER COLUMN stock_id SET DEFAULT nextval('public.stocks_stock_id_seq'::regclass);


--
-- Name: trades trade_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trades ALTER COLUMN trade_id SET DEFAULT nextval('public.trades_trade_id_seq'::regclass);


--
-- Name: transactions transaction_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions ALTER COLUMN transaction_id SET DEFAULT nextval('public.transactions_transaction_id_seq'::regclass);


--
-- Data for Name: accounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts (account_id, investor_id, balance, status) FROM stdin;
1	1	850000.50	Active
2	2	325000.00	Inactive
3	3	1275000.75	Active
4	4	450000.20	Active
5	5	985000.00	Suspended
6	6	1120000.00	Active
7	7	705000.40	Active
8	8	375000.00	Inactive
9	9	1325000.60	Active
10	10	920000.00	Active
11	11	615000.00	Inactive
12	12	1460000.00	Active
13	13	835000.50	Suspended
14	14	480000.00	Active
15	15	1210000.00	Active
16	16	395000.25	Inactive
17	17	570000.00	Active
18	18	1400000.50	Active
19	19	360000.00	Inactive
20	20	1550000.00	Active
\.


--
-- Data for Name: brokers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.brokers (broker_id, broker_name, branch_city, commission_rate) FROM stdin;
1	Alpha Securities Islamabad	Islamabad	1.50
2	TrustLine Brokers Islamabad	Islamabad	1.55
3	Metro Capital Islamabad	Islamabad	1.60
4	BrightTrade Islamabad	Islamabad	1.65
5	Unity Investments Islamabad	Islamabad	1.70
6	RoyalEdge Securities Islamabad	Islamabad	1.75
7	PakTrade Financials Islamabad	Islamabad	1.80
8	BlueSky Brokers Islamabad	Islamabad	1.60
9	CapitalVest Islamabad	Islamabad	1.55
10	PrimeBridge Investments Islamabad	Islamabad	1.65
11	SafeTrust Securities Islamabad	Islamabad	1.70
12	WealthMax Islamabad	Islamabad	1.85
13	GlobalEdge Investments Islamabad	Islamabad	1.75
14	TradeWise Capital Islamabad	Islamabad	1.60
15	BrightLine Brokers Islamabad	Islamabad	1.55
16	RoyalPath Securities Islamabad	Islamabad	1.90
17	NextGen Brokers Islamabad	Islamabad	1.50
18	SecureVest Capital Islamabad	Islamabad	1.65
19	VertexLine Islamabad	Islamabad	1.70
20	CityTrade Investments Islamabad	Islamabad	1.75
21	GrowSafe Financial Islamabad	Islamabad	1.55
22	MetroEdge Brokers Islamabad	Islamabad	1.65
23	CitiLine Securities Islamabad	Islamabad	1.80
24	BlueRock Islamabad	Islamabad	1.85
25	PrimeEdge Finance Islamabad	Islamabad	1.60
26	AlphaBridge Brokers Islamabad	Islamabad	1.55
27	RoyalTrust Islamabad	Islamabad	1.70
28	TradeBridge Securities Islamabad	Islamabad	1.65
29	SmartTrade Islamabad	Islamabad	1.75
30	PakWealth Capital Islamabad	Islamabad	1.60
31	SecureEdge Brokers Islamabad	Islamabad	1.80
32	BrightPath Securities Islamabad	Islamabad	1.85
33	NextTrade Islamabad	Islamabad	1.55
34	Crescent Capital Islamabad	Islamabad	1.70
35	UnityTrust Brokers Islamabad	Islamabad	1.75
36	SafeLine Financial Islamabad	Islamabad	1.60
37	TradeAxis Islamabad	Islamabad	1.50
38	CapitalBridge Islamabad	Islamabad	1.65
39	Vertex Securities Islamabad	Islamabad	1.85
40	WealthGrow Investments Islamabad	Islamabad	1.70
41	TrustEdge Capital Islamabad	Islamabad	1.60
42	AlphaGrow Brokers Islamabad	Islamabad	1.75
43	SmartEdge Securities Islamabad	Islamabad	1.80
44	MetroTrust Islamabad	Islamabad	1.65
45	RoyalPeak Financial Islamabad	Islamabad	1.70
46	SecureWealth Islamabad	Islamabad	1.55
47	CitiVest Islamabad	Islamabad	1.85
48	BlueVest Financial Islamabad	Islamabad	1.60
49	OptimaTrade Islamabad	Islamabad	1.75
50	TradePoint Securities Islamabad	Islamabad	1.70
\.


--
-- Data for Name: investors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.investors (investor_id, investor_name, city, email, contact_no) FROM stdin;
1	Ali Raza	Islamabad	ali.raza.isb@example.com	0301-3333311
2	Imran Akram	Islamabad	imran.akram.isb@example.com	0302-3333312
3	Jawad Ahmed	Islamabad	jawad.ahmed.isb@example.com	0303-3333313
4	Tahir Khalid	Islamabad	tahir.khalid.isb@example.com	0304-3333314
5	Raza Jameel	Islamabad	raza.jameel.isb@example.com	0305-3333315
6	Hamid Qureshi	Islamabad	hamid.qureshi.isb@example.com	0306-3333316
7	Umer Aslam	Islamabad	umer.aslam.isb@example.com	0307-3333317
8	Nasir Hussain	Islamabad	nasir.hussain.isb@example.com	0308-3333318
9	Adeel Iqbal	Islamabad	adeel.iqbal.isb@example.com	0309-3333319
10	Waseem Rafiq	Islamabad	waseem.rafiq.isb@example.com	0310-3333320
11	Haris Malik	Islamabad	haris.malik.isb@example.com	0311-3333321
12	Ahsan Farooq	Islamabad	ahsan.farooq.isb@example.com	0312-3333322
13	Taimur Ali	Islamabad	taimur.ali.isb@example.com	0313-3333323
14	Zahid Rehman	Islamabad	zahid.rehman.isb@example.com	0314-3333324
15	Fahad Saeed	Islamabad	fahad.saeed.isb@example.com	0315-3333325
16	Asad Noor	Islamabad	asad.noor.isb@example.com	0316-3333326
17	Raheel Ahmed	Islamabad	raheel.ahmed.isb@example.com	0317-3333327
18	Hammad Baig	Islamabad	hammad.baig.isb@example.com	0318-3333328
19	Amir Hussain	Islamabad	amir.hussain.isb@example.com	0319-3333329
20	Muneer Alam	Islamabad	muneer.alam.isb@example.com	0320-3333330
\.


--
-- Data for Name: stocks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stocks (stock_id, symbol, company_name, current_price, city) FROM stdin;
1	ISB01	Islamabad Steel Mills	122.50	Islamabad
2	ISB02	Capital Foods Pvt Ltd	89.40	Islamabad
3	ISB03	Islamabad Electric Company	147.30	Islamabad
4	ISB04	Blue Area Textiles	98.60	Islamabad
5	ISB05	Margalla Cement Works	185.90	Islamabad
6	ISB06	Faisal IT Solutions	130.75	Islamabad
7	ISB07	Pak Software Hub	92.20	Islamabad
8	ISB08	Islamabad Dairy Farm	65.80	Islamabad
9	ISB09	Mega Tech Systems	142.00	Islamabad
10	ISB10	Hill View Constructions	171.60	Islamabad
11	ISB11	Green Energy Pakistan	153.25	Islamabad
12	ISB12	Smart Devices Ltd	117.40	Islamabad
13	ISB13	Metro Electronics	190.60	Islamabad
14	ISB14	Sunrise Apparel	72.10	Islamabad
15	ISB15	TechBridge Solutions	155.90	Islamabad
16	ISB16	Islamabad Plastics	64.30	Islamabad
17	ISB17	Royal Marble Works	83.75	Islamabad
18	ISB18	National Agro Farms	95.60	Islamabad
19	ISB19	Al Noor Technologies	132.80	Islamabad
20	ISB20	Dynamic Software House	145.50	Islamabad
21	ISB21	Islamabad Builders Ltd	210.40	Islamabad
22	ISB22	Mega Power Solutions	177.30	Islamabad
23	ISB23	Urban Developers	188.90	Islamabad
24	ISB24	Capital Motors	235.70	Islamabad
25	ISB25	Pak Cyber Labs	156.80	Islamabad
26	ISB26	Data Vision Pvt Ltd	119.90	Islamabad
27	ISB27	Islamabad Cotton Mills	102.40	Islamabad
28	ISB28	Pak Fertilizer Co	165.20	Islamabad
29	ISB29	SkyNet Internet Services	97.30	Islamabad
30	ISB30	Twin City Developers	181.45	Islamabad
31	ISB31	Margalla Builders	220.80	Islamabad
32	ISB32	Zain Electronics	146.20	Islamabad
33	ISB33	Awan Foods Pvt Ltd	91.70	Islamabad
34	ISB34	Smart Engineering Works	128.90	Islamabad
35	ISB35	Metro Power Systems	150.10	Islamabad
36	ISB36	Pak National Bank	141.75	Islamabad
37	ISB37	Islamabad Chemical Works	86.40	Islamabad
38	ISB38	Green Leaf Agro	79.30	Islamabad
39	ISB39	Pure Water Co	101.50	Islamabad
40	ISB40	Capital Software Labs	133.80	Islamabad
41	ISB41	Pak Housing Ltd	213.60	Islamabad
42	ISB42	ISB Cables & Wires	110.50	Islamabad
43	ISB43	Urban Technologies	149.90	Islamabad
44	ISB44	Margalla Foods	84.75	Islamabad
45	ISB45	Sky Heights Builders	205.40	Islamabad
46	ISB46	Islamabad Printing Press	92.10	Islamabad
47	ISB47	Digital Mind Solutions	137.25	Islamabad
48	ISB48	A1 Automobile Parts	176.60	Islamabad
49	ISB49	Galaxy Steel Foundry	195.70	Islamabad
50	ISB50	National Packaging Co	125.90	Islamabad
51	ISB51	Islamabad Auto Works	143.50	Islamabad
52	ISB52	Capital Electronics Pvt Ltd	179.20	Islamabad
53	ISB53	BlueSky Textiles	96.40	Islamabad
54	ISB54	Smart Builders Ltd	212.30	Islamabad
55	ISB55	Green Leaf Pharmaceuticals	127.90	Islamabad
56	ISB56	Pak Cables Ltd	63.40	Islamabad
57	ISB57	TwinCity Foods	98.75	Islamabad
58	ISB58	Royal Engineering Co	173.60	Islamabad
59	ISB59	Margalla Wood Works	88.10	Islamabad
60	ISB60	Pak Solar Energy	146.80	Islamabad
61	ISB61	Islamabad Paints Ltd	95.70	Islamabad
62	ISB62	Digital Techno Systems	159.90	Islamabad
63	ISB63	Future IT Hub	108.50	Islamabad
64	ISB64	Capital Dairy Farms	72.10	Islamabad
65	ISB65	Metro Steel Co	185.20	Islamabad
66	ISB66	Hill View Glass Works	115.60	Islamabad
67	ISB67	SkyNet Developers	163.40	Islamabad
68	ISB68	Pure Agro Products	84.70	Islamabad
69	ISB69	National Hardware	92.90	Islamabad
70	ISB70	Tech Frontier Labs	144.60	Islamabad
71	ISB71	Evergreen Foods	125.80	Islamabad
72	ISB72	Margalla Developers	210.40	Islamabad
73	ISB73	Pak Security Systems	133.50	Islamabad
74	ISB74	Smart Logistics Ltd	175.30	Islamabad
75	ISB75	Digital Vision Studio	122.40	Islamabad
76	ISB76	Islamabad Ceramics	88.60	Islamabad
77	ISB77	Capital Textile Mills	158.20	Islamabad
78	ISB78	Skyline Energy Co	149.90	Islamabad
79	ISB79	Unity Plastics	97.10	Islamabad
80	ISB80	Urban Motors Pvt Ltd	214.30	Islamabad
81	ISB81	BluePeak Construction	230.70	Islamabad
82	ISB82	Islamabad Pharma Labs	109.40	Islamabad
83	ISB83	National Builders Ltd	204.20	Islamabad
84	ISB84	Pak Agro Seeds	93.10	Islamabad
85	ISB85	Dynamic Metals	156.90	Islamabad
86	ISB86	Margalla IT Hub	131.50	Islamabad
87	ISB87	TechBridge Data Systems	188.40	Islamabad
88	ISB88	GreenHub Organics	82.30	Islamabad
89	ISB89	Mega Builders Ltd	223.50	Islamabad
90	ISB90	SkyView Media Pvt Ltd	121.80	Islamabad
91	ISB91	City Lights Developers	191.20	Islamabad
92	ISB92	Capital Drinks Co	103.60	Islamabad
93	ISB93	Royal Foods Pvt Ltd	147.50	Islamabad
94	ISB94	Islamabad Iron Works	176.90	Islamabad
95	ISB95	Pak Cement Pvt Ltd	199.20	Islamabad
96	ISB96	Pure Textiles	118.70	Islamabad
97	ISB97	Smart Energy Co	137.40	Islamabad
98	ISB98	Urban Textiles Ltd	105.80	Islamabad
99	ISB99	Capital Computers	126.10	Islamabad
100	ISB100	HillView Builders	203.40	Islamabad
101	ISB101	Islamabad Electrical Works	156.90	Islamabad
102	ISB102	Royal Dairy Pvt Ltd	96.50	Islamabad
103	ISB103	Pak Software Lab	152.30	Islamabad
104	ISB104	Twin City Auto Parts	93.80	Islamabad
105	ISB105	GreenLand Paints	115.90	Islamabad
106	ISB106	Capital Engineering	172.60	Islamabad
107	ISB107	Digital Ware Pvt Ltd	110.20	Islamabad
108	ISB108	Islamabad Motors	182.50	Islamabad
109	ISB109	BlueStar Tech	128.30	Islamabad
110	ISB110	Urban Agro Co	97.70	Islamabad
111	ISB111	National Plastics	144.10	Islamabad
112	ISB112	Capital Agro Seeds	83.60	Islamabad
113	ISB113	Margalla Iron Co	194.50	Islamabad
114	ISB114	SkyTech Innovations	108.70	Islamabad
115	ISB115	Pure Energy Ltd	134.80	Islamabad
116	ISB116	Islamabad Tannery Works	89.90	Islamabad
117	ISB117	Pak Cement Works	175.60	Islamabad
118	ISB118	GreenTech Builders	203.90	Islamabad
119	ISB119	Mega Dairy Co	122.70	Islamabad
120	ISB120	Capital Auto Traders	112.30	Islamabad
121	ISB121	HillView Minerals	197.40	Islamabad
122	ISB122	Digital Dreams	138.60	Islamabad
123	ISB123	Pak Agro Chemical	124.80	Islamabad
124	ISB124	BlueEdge Foods	113.90	Islamabad
125	ISB125	Smart Spark Solutions	176.50	Islamabad
126	ISB126	Urban Paints Pvt Ltd	104.20	Islamabad
127	ISB127	Capital Pharma	193.70	Islamabad
128	ISB128	Green Wood Co	86.50	Islamabad
129	ISB129	Margalla Power Pvt Ltd	183.60	Islamabad
130	ISB130	Royal Auto Co	161.70	Islamabad
131	ISB131	SkyNet Electric	123.90	Islamabad
132	ISB132	Future Builders Ltd	192.40	Islamabad
133	ISB133	Tech Valley Systems	159.10	Islamabad
134	ISB134	Pure Life Industries	98.70	Islamabad
135	ISB135	Islamabad Beverage Ltd	126.50	Islamabad
136	ISB136	Digital Vision Group	147.80	Islamabad
137	ISB137	Capital Engineering Works	205.60	Islamabad
138	ISB138	SkyHigh Auto Ltd	187.40	Islamabad
139	ISB139	Margalla Foods Pvt Ltd	104.50	Islamabad
140	ISB140	Green Energy Systems	153.80	Islamabad
141	ISB141	Islamabad Paper Mills	132.40	Islamabad
142	ISB142	Mega Glass Works	176.10	Islamabad
143	ISB143	BlueWave Chemicals	169.70	Islamabad
144	ISB144	Capital Textiles Ltd	119.80	Islamabad
145	ISB145	Hill View Developers	233.40	Islamabad
146	ISB146	Pure Motors	185.60	Islamabad
147	ISB147	Smart Agro Mills	148.50	Islamabad
148	ISB148	National Constructions	203.20	Islamabad
149	ISB149	GreenTech Fertilizers	97.90	Islamabad
150	ISB150	SkyBridge Engineering	184.10	Islamabad
151	ISB151	Urban Electronics Ltd	113.60	Islamabad
152	ISB152	Pure Plastics Co	126.80	Islamabad
153	ISB153	Capital Agro Chemicals	178.90	Islamabad
154	ISB154	BlueLine Builders	191.20	Islamabad
155	ISB155	Metro Paint Works	97.40	Islamabad
156	ISB156	Margalla Dairy Co	123.50	Islamabad
157	ISB157	Pak Minerals Pvt Ltd	167.60	Islamabad
158	ISB158	Smart Techno Labs	132.70	Islamabad
159	ISB159	Islamabad Builders	212.80	Islamabad
160	ISB160	SkyWay Motors	142.90	Islamabad
161	ISB161	Green Agro Foods	116.30	Islamabad
162	ISB162	Urban Hardware Ltd	93.20	Islamabad
163	ISB163	Capital Dairy Products	154.50	Islamabad
164	ISB164	BlueStar Engineering	208.60	Islamabad
165	ISB165	Margalla Constructions	196.90	Islamabad
166	ISB166	Pure Tech Pvt Ltd	121.80	Islamabad
167	ISB167	Islamabad Plastics	94.40	Islamabad
168	ISB168	National Textiles Ltd	188.90	Islamabad
169	ISB169	Green Engineering Works	159.20	Islamabad
170	ISB170	Smart Agro Works	132.40	Islamabad
171	ISB171	Capital Motors Ltd	174.90	Islamabad
172	ISB172	HillView Dairy Pvt Ltd	98.30	Islamabad
173	ISB173	Digital Agro Systems	122.70	Islamabad
174	ISB174	SkyHigh Builders	203.10	Islamabad
175	ISB175	BlueEdge Textiles	95.80	Islamabad
176	ISB176	Islamabad Electronics	157.90	Islamabad
177	ISB177	Green Agro Seeds	114.50	Islamabad
178	ISB178	Capital IT Systems	186.70	Islamabad
179	ISB179	Pure Glass Co	107.20	Islamabad
180	ISB180	Urban Steel Ltd	169.40	Islamabad
181	ISB181	Metro Dairy Ltd	134.10	Islamabad
182	ISB182	Margalla Builders Pvt Ltd	211.60	Islamabad
183	ISB183	National Agro Works	99.70	Islamabad
184	ISB184	GreenTech Motors	182.40	Islamabad
185	ISB185	SkyNet Builders	153.10	Islamabad
186	ISB186	Capital Paints	119.90	Islamabad
187	ISB187	BlueTech Solutions	132.70	Islamabad
188	ISB188	Pure Foods Pvt Ltd	106.80	Islamabad
189	ISB189	Islamabad Engineering	193.90	Islamabad
190	ISB190	Urban Paper Mills	158.10	Islamabad
191	ISB191	Green Agro Ltd	127.40	Islamabad
192	ISB192	National Cement Works	176.70	Islamabad
193	ISB193	SkyBridge Builders	189.60	Islamabad
194	ISB194	Metro Energy Systems	141.20	Islamabad
195	ISB195	Capital Dairy Co	105.30	Islamabad
196	ISB196	BlueLine Energy Ltd	197.90	Islamabad
197	ISB197	Smart Agro Pvt Ltd	165.20	Islamabad
198	ISB198	Green Plastics Ltd	118.50	Islamabad
199	ISB199	HillView IT Hub	184.60	Islamabad
200	ISB200	Urban Motors Works	173.10	Islamabad
201	ISB201	Islamabad Power Systems	142.30	Islamabad
202	ISB202	Capital Builders Hub	179.60	Islamabad
203	ISB203	Green Agro Fertilizers	125.40	Islamabad
204	ISB204	BlueSky Motors Ltd	191.20	Islamabad
205	ISB205	Margalla Engineering Works	165.80	Islamabad
206	ISB206	Urban Agro Foods	97.60	Islamabad
207	ISB207	National Paints Co	113.70	Islamabad
208	ISB208	Pure Agro Pvt Ltd	127.10	Islamabad
209	ISB209	HillView Chemicals	175.90	Islamabad
210	ISB210	SkyNet Engineering	186.50	Islamabad
211	ISB211	Digital Agro Works	102.30	Islamabad
212	ISB212	Mega Construction Ltd	211.60	Islamabad
213	ISB213	Smart Energy Pvt Ltd	156.70	Islamabad
214	ISB214	Capital Dairy Farms	122.80	Islamabad
215	ISB215	Pure Water Pvt Ltd	84.60	Islamabad
216	ISB216	Margalla Agro Works	153.20	Islamabad
217	ISB217	Urban Pharma Co	176.90	Islamabad
218	ISB218	BlueEdge Builders	138.10	Islamabad
219	ISB219	GreenLeaf Systems	118.70	Islamabad
220	ISB220	Islamabad Auto Traders	197.50	Islamabad
221	ISB221	TechWorld Pvt Ltd	142.80	Islamabad
222	ISB222	Capital Agro Traders	103.90	Islamabad
223	ISB223	Margalla Hardware Co	123.40	Islamabad
224	ISB224	Urban Plastics Ltd	115.90	Islamabad
225	ISB225	National Agro Mills	175.30	Islamabad
226	ISB226	Smart Solutions Pvt Ltd	138.60	Islamabad
227	ISB227	BlueTech Builders	190.70	Islamabad
228	ISB228	HillView Developers Ltd	199.10	Islamabad
229	ISB229	Pure Engineering Co	120.60	Islamabad
230	ISB230	Islamabad Textile Works	108.40	Islamabad
231	ISB231	Capital IT Labs	146.70	Islamabad
232	ISB232	Urban Dairy Works	95.90	Islamabad
233	ISB233	Margalla Motors	173.80	Islamabad
234	ISB234	SkyNet Construction	203.40	Islamabad
235	ISB235	Green Agro Solutions	117.90	Islamabad
236	ISB236	Digital Engineering Ltd	134.60	Islamabad
237	ISB237	Mega Builders Pvt Ltd	206.10	Islamabad
238	ISB238	BluePeak Agro Co	127.80	Islamabad
239	ISB239	Smart Agro Chemicals	104.50	Islamabad
240	ISB240	Islamabad Builders Co	213.60	Islamabad
241	ISB241	Capital Glass Works	154.20	Islamabad
242	ISB242	Margalla Dairy Ltd	111.70	Islamabad
243	ISB243	Green Techno Works	189.30	Islamabad
244	ISB244	Urban Auto Ltd	147.80	Islamabad
245	ISB245	Pak Agro Mills	94.20	Islamabad
246	ISB246	HillView Agro Foods	163.90	Islamabad
247	ISB247	National Software Labs	174.10	Islamabad
248	ISB248	Smart Builders Ltd	203.60	Islamabad
249	ISB249	BlueStar Paints	117.80	Islamabad
250	ISB250	Capital Agro Systems	125.60	Islamabad
251	ISB251	Pure Electric Co	178.20	Islamabad
252	ISB252	Islamabad Marble Works	144.10	Islamabad
253	ISB253	Green Agro Engineering	160.70	Islamabad
254	ISB254	Urban Agro Pvt Ltd	132.60	Islamabad
255	ISB255	SkyBridge Pharma	119.40	Islamabad
256	ISB256	Margalla Paper Mills	94.70	Islamabad
257	ISB257	Smart Electric Pvt Ltd	137.80	Islamabad
258	ISB258	BlueLine Agro Co	184.30	Islamabad
259	ISB259	Capital Cement Ltd	207.60	Islamabad
260	ISB260	Islamabad IT Labs	124.90	Islamabad
261	ISB261	Green Agro Pharma	112.70	Islamabad
262	ISB262	Pure Builders Ltd	205.40	Islamabad
263	ISB263	Urban Engineering Ltd	177.90	Islamabad
264	ISB264	Margalla Builders	203.70	Islamabad
265	ISB265	Capital Dairy Ltd	139.60	Islamabad
266	ISB266	BlueTech Agro Systems	128.40	Islamabad
267	ISB267	National Motors	187.20	Islamabad
268	ISB268	Smart Plastics Ltd	119.90	Islamabad
269	ISB269	Islamabad Builders Pvt Ltd	210.40	Islamabad
270	ISB270	Pure Agro Products	132.70	Islamabad
271	ISB271	Urban Agro Ltd	122.80	Islamabad
272	ISB272	HillView Auto Parts	199.10	Islamabad
273	ISB273	Capital Techno Systems	118.60	Islamabad
274	ISB274	Smart Agro Mills	156.40	Islamabad
275	ISB275	Green Agro Works	102.80	Islamabad
276	ISB276	BlueEdge Developers	213.10	Islamabad
277	ISB277	Islamabad Cement Ltd	192.60	Islamabad
278	ISB278	Margalla Tech Works	133.80	Islamabad
279	ISB279	Urban Dairy Co	99.70	Islamabad
280	ISB280	SkyNet Agro Pvt Ltd	167.50	Islamabad
281	ISB281	Capital Agro Industries	116.80	Islamabad
282	ISB282	Pure Energy Works	145.60	Islamabad
283	ISB283	Smart Paints Pvt Ltd	91.90	Islamabad
284	ISB284	BlueSky Agro Works	176.30	Islamabad
285	ISB285	Margalla Agro Chemicals	136.40	Islamabad
286	ISB286	Islamabad Builders Ltd	205.70	Islamabad
287	ISB287	Urban Agro Seeds	128.10	Islamabad
288	ISB288	Capital Agro Builders	194.30	Islamabad
289	ISB289	HillView Cement Works	178.90	Islamabad
290	ISB290	Green Agro Pvt Ltd	106.70	Islamabad
291	ISB291	Smart Agro Co	139.50	Islamabad
292	ISB292	Pure Agro Builders	208.10	Islamabad
293	ISB293	Islamabad Agro Systems	126.90	Islamabad
294	ISB294	BlueTech Builders	173.60	Islamabad
295	ISB295	Margalla Agro Traders	111.50	Islamabad
296	ISB296	Urban Agro Engineering	143.40	Islamabad
297	ISB297	Capital Agro Mills	118.90	Islamabad
298	ISB298	HillView Agro Builders	205.90	Islamabad
299	ISB299	Smart Agro Industries	134.50	Islamabad
300	ISB300	Pure Agro Developers	192.80	Islamabad
301	ISB301	Green Agro Works	128.60	Islamabad
302	ISB302	Capital Agro Traders	163.70	Islamabad
303	ISB303	Urban Agro Seeds Ltd	114.40	Islamabad
304	ISB304	Islamabad Agro Chemicals	137.50	Islamabad
305	ISB305	BlueEdge Agro Builders	125.90	Islamabad
306	ISB306	Smart Agro Ltd	188.40	Islamabad
307	ISB307	Margalla Agro Developers	116.60	Islamabad
308	ISB308	HillView Agro Seeds	173.20	Islamabad
309	ISB309	Pure Agro Works	149.10	Islamabad
310	ISB310	Urban Agro Ltd	117.80	Islamabad
311	ISB311	Capital Agro Seeds	161.50	Islamabad
312	ISB312	Smart Agro Works	195.30	Islamabad
313	ISB313	BlueTech Agro Systems	128.40	Islamabad
314	ISB314	Green Agro Seeds	108.20	Islamabad
315	ISB315	Islamabad Agro Builders	203.10	Islamabad
316	ISB316	Margalla Agro Pvt Ltd	136.70	Islamabad
317	ISB317	HillView Agro Systems	169.30	Islamabad
318	ISB318	Smart Agro Traders	127.60	Islamabad
319	ISB319	Pure Agro Builders	117.90	Islamabad
320	ISB320	Capital Agro Pvt Ltd	191.40	Islamabad
321	ISB321	Urban Agro Works	132.80	Islamabad
322	ISB322	BlueSky Agro Ltd	126.30	Islamabad
323	ISB323	Green Agro Developers	178.70	Islamabad
324	ISB324	Islamabad Agro Mills	111.80	Islamabad
325	ISB325	Margalla Agro Builders	207.20	Islamabad
326	ISB326	Smart Agro Engineering	120.60	Islamabad
327	ISB327	Capital Agro Works	133.40	Islamabad
328	ISB328	Pure Agro Ltd	101.70	Islamabad
329	ISB329	Urban Agro Pvt Ltd	145.60	Islamabad
330	ISB330	HillView Agro Developers	118.50	Islamabad
331	ISB331	Smart Agro Pvt Ltd	187.40	Islamabad
332	ISB332	Green Agro Builders	131.90	Islamabad
333	ISB333	Islamabad Agro Traders	163.40	Islamabad
334	ISB334	BlueEdge Agro Mills	149.30	Islamabad
335	ISB335	Margalla Agro Systems	124.80	Islamabad
336	ISB336	Urban Agro Builders	198.20	Islamabad
337	ISB337	Capital Agro Developers	175.60	Islamabad
338	ISB338	Pure Agro Co	134.50	Islamabad
339	ISB339	Smart Agro Mills	121.40	Islamabad
340	ISB340	HillView Agro Works	143.70	Islamabad
341	ISB341	Islamabad Agro Ltd	186.90	Islamabad
342	ISB342	Margalla Agro Traders	111.50	Islamabad
343	ISB343	Green Agro Builders	173.40	Islamabad
344	ISB344	Urban Agro Developers	139.10	Islamabad
345	ISB345	Capital Agro Seeds	120.70	Islamabad
346	ISB346	Smart Agro Co	151.30	Islamabad
347	ISB347	BlueTech Agro Pvt Ltd	197.80	Islamabad
348	ISB348	HillView Agro Mills	163.90	Islamabad
349	ISB349	Pure Agro Pvt Ltd	115.20	Islamabad
350	ISB350	Islamabad Agro Works	140.80	Islamabad
351	ISB351	Islamabad Auto Works	185.60	Islamabad
352	ISB352	Future Plastics Pvt Ltd	98.40	Islamabad
353	ISB353	Blue Tech Electronics	139.80	Islamabad
354	ISB354	Capital Dairy Products	77.60	Islamabad
355	ISB355	Margalla Cement Factory	192.70	Islamabad
356	ISB356	Pak Solar Technologies	143.10	Islamabad
357	ISB357	National Paint Works	122.45	Islamabad
358	ISB358	Smart Textile Mills	130.80	Islamabad
359	ISB359	Future Power Systems	175.60	Islamabad
360	ISB360	Islamabad Tea Traders	84.25	Islamabad
361	ISB361	Urban Marble Works	114.10	Islamabad
362	ISB362	Pak Trading Company	168.90	Islamabad
363	ISB363	Mega Agro Farms	97.70	Islamabad
364	ISB364	Capital Housing Society	215.60	Islamabad
365	ISB365	Metro Steel Company	190.30	Islamabad
366	ISB366	Islamabad IT Park	156.70	Islamabad
367	ISB367	National Digital Hub	145.25	Islamabad
368	ISB368	Green Valley Foods	88.50	Islamabad
369	ISB369	Future Constructions	223.10	Islamabad
370	ISB370	SkyLine Developers	241.80	Islamabad
371	ISB371	Margalla Builders Pvt Ltd	205.20	Islamabad
372	ISB372	Pak Engineering Works	130.60	Islamabad
373	ISB373	Urban Energy Pvt Ltd	142.10	Islamabad
374	ISB374	Capital Web Solutions	112.30	Islamabad
375	ISB375	Metro Auto Parts	184.50	Islamabad
376	ISB376	Digital Marketing Hub	102.60	Islamabad
377	ISB377	Smart Agro Products	89.20	Islamabad
378	ISB378	Blue Flame Constructions	198.40	Islamabad
379	ISB379	Green Leaf Textiles	115.70	Islamabad
380	ISB380	National Motors	225.60	Islamabad
381	ISB381	Future Builders Co	176.80	Islamabad
382	ISB382	Islamabad Foods Pvt Ltd	121.90	Islamabad
383	ISB383	Twin City Power Solutions	138.30	Islamabad
384	ISB384	Pak Fiber Ltd	148.40	Islamabad
385	ISB385	Urban Glass Works	109.75	Islamabad
386	ISB386	Capital Agro Chemicals	164.80	Islamabad
387	ISB387	Mega Developers Group	219.90	Islamabad
388	ISB388	Islamabad Dairy Pvt Ltd	92.60	Islamabad
389	ISB389	Future Electronics	137.10	Islamabad
390	ISB390	Metro Constructions	204.60	Islamabad
391	ISB391	Smart Power Systems	160.40	Islamabad
392	ISB392	Capital Software House	129.80	Islamabad
393	ISB393	Pak Wood Works	112.50	Islamabad
394	ISB394	Margalla Auto Industries	178.70	Islamabad
395	ISB395	Islamabad Printing Co	98.30	Islamabad
396	ISB396	Green Energy Systems	146.90	Islamabad
397	ISB397	Future Agro Tech	132.80	Islamabad
398	ISB398	National Glass Company	119.30	Islamabad
399	ISB399	Urban Developers Ltd	236.50	Islamabad
400	ISB400	Mega Power Corporation	222.40	Islamabad
401	ISB401	Capital Tech Innovations	154.70	Islamabad
402	ISB402	Margalla Agro Pvt Ltd	132.20	Islamabad
403	ISB403	Smart Cloud Solutions	145.30	Islamabad
404	ISB404	Future Steel Industries	176.40	Islamabad
405	ISB405	Islamabad Media Works	110.60	Islamabad
406	ISB406	Pak Construction Hub	201.90	Islamabad
407	ISB407	National Solar Power	167.30	Islamabad
408	ISB408	Green Future Developers	185.40	Islamabad
409	ISB409	Twin City Cables	124.50	Islamabad
410	ISB410	Capital Logistics Ltd	96.70	Islamabad
411	ISB411	Islamabad Chemical Works	141.80	Islamabad
412	ISB412	Urban Tech Studios	128.60	Islamabad
413	ISB413	Blue Sky Builders	207.20	Islamabad
414	ISB414	Metro Software House	138.40	Islamabad
415	ISB415	Smart Agro Mills	119.90	Islamabad
416	ISB416	Future Motors Pvt Ltd	222.30	Islamabad
417	ISB417	Margalla Food Processing	104.20	Islamabad
418	ISB418	Capital Engineering Works	132.10	Islamabad
419	ISB419	Pak Pharma Labs	153.40	Islamabad
420	ISB420	Digital Connect Pvt Ltd	168.90	Islamabad
421	ISB421	Green Leaf Energy	147.60	Islamabad
422	ISB422	Metro Agro Traders	95.30	Islamabad
423	ISB423	Smart Tech Hub	116.70	Islamabad
424	ISB424	Islamabad Developers Co	194.80	Islamabad
425	ISB425	Future Web Systems	109.60	Islamabad
426	ISB426	Pak Stone Works	142.70	Islamabad
427	ISB427	Mega Chemical Industries	121.30	Islamabad
428	ISB428	Urban Lighting Pvt Ltd	134.90	Islamabad
429	ISB429	Capital Auto Parts	210.10	Islamabad
430	ISB430	Islamabad Packaging Co	103.50	Islamabad
431	ISB431	Margalla Construction Ltd	187.40	Islamabad
432	ISB432	National Data Systems	162.30	Islamabad
433	ISB433	Blue Tech Energy	178.10	Islamabad
434	ISB434	Smart Engineering Solutions	132.80	Islamabad
435	ISB435	Capital Builders Group	202.70	Islamabad
436	ISB436	Future Robotics Pvt Ltd	141.10	Islamabad
437	ISB437	Urban Dairy Products	99.20	Islamabad
438	ISB438	Pak Digital Solutions	123.90	Islamabad
439	ISB439	Green Agro Chemicals	115.50	Islamabad
440	ISB440	Metro Power Pvt Ltd	185.30	Islamabad
441	ISB441	Capital IT Labs	149.40	Islamabad
442	ISB442	Islamabad Brick Works	94.80	Islamabad
443	ISB443	National Marble Traders	126.70	Islamabad
444	ISB444	Smart Textiles Ltd	139.90	Islamabad
445	ISB445	Future Auto Works	191.60	Islamabad
446	ISB446	Urban Software Innovations	125.30	Islamabad
447	ISB447	Margalla Agro Foods	107.80	Islamabad
448	ISB448	Pak Solar Industries	169.40	Islamabad
449	ISB449	Islamabad Electric Works	156.90	Islamabad
450	ISB450	Mega Construction Pvt Ltd	218.50	Islamabad
451	ISB451	Capital Steel Foundry	172.40	Islamabad
452	ISB452	Metro Dairy Products	94.20	Islamabad
453	ISB453	Smart Grid Systems	185.30	Islamabad
454	ISB454	Future Builders Pvt Ltd	201.70	Islamabad
455	ISB455	Islamabad Marble Works	142.90	Islamabad
456	ISB456	Pak Agro Industries	122.60	Islamabad
457	ISB457	National Hardware Co	97.80	Islamabad
458	ISB458	Capital Engineering Ltd	189.50	Islamabad
459	ISB459	Margalla Furniture Works	115.40	Islamabad
460	ISB460	Islamabad Cables Ltd	138.90	Islamabad
461	ISB461	Green Valley Foods	106.30	Islamabad
462	ISB462	Urban Energy Systems	164.20	Islamabad
463	ISB463	Mega Textile Mills	130.70	Islamabad
464	ISB464	Pak Electronics Works	99.90	Islamabad
465	ISB465	Capital Developers Hub	219.10	Islamabad
466	ISB466	Blue Line Solutions	187.50	Islamabad
467	ISB467	Smart Data Analytics	151.80	Islamabad
468	ISB468	Future Agro Processing	112.40	Islamabad
469	ISB469	Islamabad Motors Pvt Ltd	178.30	Islamabad
470	ISB470	National Cement Works	139.60	Islamabad
471	ISB471	Margalla Tech Systems	121.50	Islamabad
472	ISB472	Urban Developers Ltd	199.40	Islamabad
473	ISB473	Pak Oil & Gas Services	171.70	Islamabad
474	ISB474	Capital Chemical Works	133.20	Islamabad
475	ISB475	Smart Agro Fertilizers	98.80	Islamabad
476	ISB476	Future Packaging Pvt Ltd	145.10	Islamabad
477	ISB477	Islamabad Cotton Traders	118.70	Islamabad
478	ISB478	Green Earth Builders	189.30	Islamabad
479	ISB479	Metro Power Hub	162.50	Islamabad
480	ISB480	Capital Construction Co	211.40	Islamabad
481	ISB481	Smart Logistics Ltd	127.60	Islamabad
482	ISB482	Margalla Auto Parts	154.80	Islamabad
483	ISB483	National Poultry Farms	101.90	Islamabad
484	ISB484	Blue Valley Constructions	194.50	Islamabad
485	ISB485	Future Tech Pvt Ltd	175.30	Islamabad
486	ISB486	Islamabad Builders Group	208.90	Islamabad
487	ISB487	Green Land Industries	129.40	Islamabad
488	ISB488	Urban Power Pvt Ltd	182.10	Islamabad
489	ISB489	Capital Auto Traders	111.80	Islamabad
490	ISB490	Pak Electric Works	158.20	Islamabad
491	ISB491	Margalla Marble Traders	103.70	Islamabad
492	ISB492	Future Web Developers	133.80	Islamabad
493	ISB493	Smart Industrial Solutions	167.50	Islamabad
494	ISB494	Capital Fabrics Mills	119.30	Islamabad
495	ISB495	Urban Dairy Pvt Ltd	97.10	Islamabad
496	ISB496	Mega Food Products	142.40	Islamabad
497	ISB497	National Engineering Hub	126.80	Islamabad
498	ISB498	Islamabad Printing Co	114.90	Islamabad
499	ISB499	Green Life Textiles	135.60	Islamabad
500	ISB500	Future Builders Group	202.70	Islamabad
\.


--
-- Data for Name: trades; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trades (trade_id, stock_id, quantity, trade_type, trade_time) FROM stdin;
1	1	100	buy	2025-10-26 10:55:05.667747
2	2	150	sell	2025-10-26 10:55:05.667747
3	3	200	buy	2025-10-26 10:55:05.667747
4	4	120	sell	2025-10-26 10:55:05.667747
5	5	180	buy	2025-10-26 10:55:05.667747
6	6	90	sell	2025-10-26 10:55:05.667747
7	7	130	buy	2025-10-26 10:55:05.667747
8	8	250	sell	2025-10-26 10:55:05.667747
9	9	300	buy	2025-10-26 10:55:05.667747
10	10	110	sell	2025-10-26 10:55:05.667747
11	11	170	buy	2025-10-26 10:55:05.667747
12	12	140	sell	2025-10-26 10:55:05.667747
13	13	220	buy	2025-10-26 10:55:05.667747
14	14	160	sell	2025-10-26 10:55:05.667747
15	15	190	buy	2025-10-26 10:55:05.667747
16	16	210	sell	2025-10-26 10:55:05.667747
17	17	240	buy	2025-10-26 10:55:05.667747
18	18	150	sell	2025-10-26 10:55:05.667747
19	19	180	buy	2025-10-26 10:55:05.667747
20	20	130	sell	2025-10-26 10:55:05.667747
21	21	170	buy	2025-10-26 10:55:05.667747
22	22	140	sell	2025-10-26 10:55:05.667747
23	23	220	buy	2025-10-26 10:55:05.667747
24	24	200	sell	2025-10-26 10:55:05.667747
25	25	160	buy	2025-10-26 10:55:05.667747
26	26	250	sell	2025-10-26 10:55:05.667747
27	27	190	buy	2025-10-26 10:55:05.667747
28	28	130	sell	2025-10-26 10:55:05.667747
29	29	150	buy	2025-10-26 10:55:05.667747
30	30	230	sell	2025-10-26 10:55:05.667747
31	31	175	buy	2025-10-26 10:55:05.667747
32	32	195	sell	2025-10-26 10:55:05.667747
33	33	165	buy	2025-10-26 10:55:05.667747
34	34	210	sell	2025-10-26 10:55:05.667747
35	35	185	buy	2025-10-26 10:55:05.667747
36	36	240	sell	2025-10-26 10:55:05.667747
37	37	155	buy	2025-10-26 10:55:05.667747
38	38	180	sell	2025-10-26 10:55:05.667747
39	39	205	buy	2025-10-26 10:55:05.667747
40	40	220	sell	2025-10-26 10:55:05.667747
41	41	200	buy	2025-10-26 10:55:05.667747
42	42	260	sell	2025-10-26 10:55:05.667747
43	43	230	buy	2025-10-26 10:55:05.667747
44	44	210	sell	2025-10-26 10:55:05.667747
45	45	185	buy	2025-10-26 10:55:05.667747
46	46	175	sell	2025-10-26 10:55:05.667747
47	47	195	buy	2025-10-26 10:55:05.667747
48	48	250	sell	2025-10-26 10:55:05.667747
49	49	215	buy	2025-10-26 10:55:05.667747
50	50	225	sell	2025-10-26 10:55:05.667747
51	51	120	buy	2025-10-26 23:13:54.860381
52	52	80	sell	2025-10-26 23:13:54.860381
53	53	200	buy	2025-10-26 23:13:54.860381
54	54	150	sell	2025-10-26 23:13:54.860381
55	55	90	buy	2025-10-26 23:13:54.860381
56	56	220	sell	2025-10-26 23:13:54.860381
57	57	130	buy	2025-10-26 23:13:54.860381
58	58	300	sell	2025-10-26 23:13:54.860381
59	59	95	buy	2025-10-26 23:13:54.860381
60	60	210	buy	2025-10-26 23:13:54.860381
61	61	70	sell	2025-10-26 23:13:54.860381
62	62	320	buy	2025-10-26 23:13:54.860381
63	63	180	sell	2025-10-26 23:13:54.860381
64	64	110	buy	2025-10-26 23:13:54.860381
65	65	270	sell	2025-10-26 23:13:54.860381
66	66	250	buy	2025-10-26 23:13:54.860381
67	67	60	sell	2025-10-26 23:13:54.860381
68	68	330	buy	2025-10-26 23:13:54.860381
69	69	140	sell	2025-10-26 23:13:54.860381
70	70	170	buy	2025-10-26 23:13:54.860381
71	71	90	buy	2025-10-26 23:13:54.860381
72	72	260	sell	2025-10-26 23:13:54.860381
73	73	310	buy	2025-10-26 23:13:54.860381
74	74	80	sell	2025-10-26 23:13:54.860381
75	75	220	buy	2025-10-26 23:13:54.860381
76	76	100	buy	2025-10-26 23:13:54.860381
77	77	150	sell	2025-10-26 23:13:54.860381
78	78	200	buy	2025-10-26 23:13:54.860381
79	79	230	sell	2025-10-26 23:13:54.860381
80	80	115	buy	2025-10-26 23:13:54.860381
81	81	90	buy	2025-10-26 23:13:54.860381
82	82	210	sell	2025-10-26 23:13:54.860381
83	83	260	buy	2025-10-26 23:13:54.860381
84	84	170	sell	2025-10-26 23:13:54.860381
85	85	120	buy	2025-10-26 23:13:54.860381
86	86	180	sell	2025-10-26 23:13:54.860381
87	87	140	buy	2025-10-26 23:13:54.860381
88	88	90	sell	2025-10-26 23:13:54.860381
89	89	250	buy	2025-10-26 23:13:54.860381
90	90	280	sell	2025-10-26 23:13:54.860381
91	91	60	buy	2025-10-26 23:13:54.860381
92	92	320	sell	2025-10-26 23:13:54.860381
93	93	110	buy	2025-10-26 23:13:54.860381
94	94	240	sell	2025-10-26 23:13:54.860381
95	95	150	buy	2025-10-26 23:13:54.860381
96	96	100	sell	2025-10-26 23:13:54.860381
97	97	220	buy	2025-10-26 23:13:54.860381
98	98	90	sell	2025-10-26 23:13:54.860381
99	99	190	buy	2025-10-26 23:13:54.860381
100	100	310	sell	2025-10-26 23:13:54.860381
101	101	200	buy	2025-10-26 23:13:54.860381
102	102	130	sell	2025-10-26 23:13:54.860381
103	103	75	buy	2025-10-26 23:13:54.860381
104	104	180	sell	2025-10-26 23:13:54.860381
105	105	260	buy	2025-10-26 23:13:54.860381
106	106	85	sell	2025-10-26 23:13:54.860381
107	107	300	buy	2025-10-26 23:13:54.860381
108	108	95	sell	2025-10-26 23:13:54.860381
109	109	170	buy	2025-10-26 23:13:54.860381
110	110	125	sell	2025-10-26 23:13:54.860381
111	111	210	buy	2025-10-26 23:13:54.860381
112	112	150	sell	2025-10-26 23:13:54.860381
113	113	310	buy	2025-10-26 23:13:54.860381
114	114	90	sell	2025-10-26 23:13:54.860381
115	115	220	buy	2025-10-26 23:13:54.860381
116	116	60	sell	2025-10-26 23:13:54.860381
117	117	340	buy	2025-10-26 23:13:54.860381
118	118	110	sell	2025-10-26 23:13:54.860381
119	119	130	buy	2025-10-26 23:13:54.860381
120	120	240	sell	2025-10-26 23:13:54.860381
121	121	260	buy	2025-10-26 23:13:54.860381
122	122	180	sell	2025-10-26 23:13:54.860381
123	123	270	buy	2025-10-26 23:13:54.860381
124	124	100	sell	2025-10-26 23:13:54.860381
125	125	90	buy	2025-10-26 23:13:54.860381
126	126	150	sell	2025-10-26 23:13:54.860381
127	127	200	buy	2025-10-26 23:13:54.860381
128	128	120	sell	2025-10-26 23:13:54.860381
129	129	140	buy	2025-10-26 23:13:54.860381
130	130	230	sell	2025-10-26 23:13:54.860381
131	131	250	buy	2025-10-26 23:13:54.860381
132	132	90	sell	2025-10-26 23:13:54.860381
133	133	280	buy	2025-10-26 23:13:54.860381
134	134	180	sell	2025-10-26 23:13:54.860381
135	135	200	buy	2025-10-26 23:13:54.860381
136	136	110	sell	2025-10-26 23:13:54.860381
137	137	300	buy	2025-10-26 23:13:54.860381
138	138	70	sell	2025-10-26 23:13:54.860381
139	139	190	buy	2025-10-26 23:13:54.860381
140	140	160	sell	2025-10-26 23:13:54.860381
141	141	220	buy	2025-10-26 23:13:54.860381
142	142	100	sell	2025-10-26 23:13:54.860381
143	143	250	buy	2025-10-26 23:13:54.860381
144	144	90	sell	2025-10-26 23:13:54.860381
145	145	260	buy	2025-10-26 23:13:54.860381
146	146	140	sell	2025-10-26 23:13:54.860381
147	147	120	buy	2025-10-26 23:13:54.860381
148	148	150	sell	2025-10-26 23:13:54.860381
149	149	180	buy	2025-10-26 23:13:54.860381
150	150	200	sell	2025-10-26 23:13:54.860381
151	151	160	buy	2025-10-26 23:13:54.860381
152	152	120	sell	2025-10-26 23:13:54.860381
153	153	250	buy	2025-10-26 23:13:54.860381
154	154	80	sell	2025-10-26 23:13:54.860381
155	155	300	buy	2025-10-26 23:13:54.860381
156	156	150	sell	2025-10-26 23:13:54.860381
157	157	220	buy	2025-10-26 23:13:54.860381
158	158	90	sell	2025-10-26 23:13:54.860381
159	159	180	buy	2025-10-26 23:13:54.860381
160	160	200	sell	2025-10-26 23:13:54.860381
161	161	75	buy	2025-10-26 23:13:54.860381
162	162	260	sell	2025-10-26 23:13:54.860381
163	163	190	buy	2025-10-26 23:13:54.860381
164	164	230	sell	2025-10-26 23:13:54.860381
165	165	120	buy	2025-10-26 23:13:54.860381
166	166	310	sell	2025-10-26 23:13:54.860381
167	167	280	buy	2025-10-26 23:13:54.860381
168	168	100	sell	2025-10-26 23:13:54.860381
169	169	210	buy	2025-10-26 23:13:54.860381
170	170	90	sell	2025-10-26 23:13:54.860381
171	171	150	buy	2025-10-26 23:13:54.860381
172	172	130	sell	2025-10-26 23:13:54.860381
173	173	260	buy	2025-10-26 23:13:54.860381
174	174	70	sell	2025-10-26 23:13:54.860381
175	175	230	buy	2025-10-26 23:13:54.860381
176	176	140	sell	2025-10-26 23:13:54.860381
177	177	270	buy	2025-10-26 23:13:54.860381
178	178	90	sell	2025-10-26 23:13:54.860381
179	179	200	buy	2025-10-26 23:13:54.860381
180	180	310	sell	2025-10-26 23:13:54.860381
181	181	250	buy	2025-10-26 23:13:54.860381
182	182	120	sell	2025-10-26 23:13:54.860381
183	183	180	buy	2025-10-26 23:13:54.860381
184	184	160	sell	2025-10-26 23:13:54.860381
185	185	300	buy	2025-10-26 23:13:54.860381
186	186	100	sell	2025-10-26 23:13:54.860381
187	187	260	buy	2025-10-26 23:13:54.860381
188	188	140	sell	2025-10-26 23:13:54.860381
189	189	230	buy	2025-10-26 23:13:54.860381
190	190	70	sell	2025-10-26 23:13:54.860381
191	191	220	buy	2025-10-26 23:13:54.860381
192	192	110	sell	2025-10-26 23:13:54.860381
193	193	240	buy	2025-10-26 23:13:54.860381
194	194	150	sell	2025-10-26 23:13:54.860381
195	195	170	buy	2025-10-26 23:13:54.860381
196	196	200	sell	2025-10-26 23:13:54.860381
197	197	280	buy	2025-10-26 23:13:54.860381
198	198	90	sell	2025-10-26 23:13:54.860381
199	199	300	buy	2025-10-26 23:13:54.860381
200	200	180	sell	2025-10-26 23:13:54.860381
201	201	250	buy	2025-10-26 23:13:54.860381
202	202	120	sell	2025-10-26 23:13:54.860381
203	203	230	buy	2025-10-26 23:13:54.860381
204	204	160	sell	2025-10-26 23:13:54.860381
205	205	200	buy	2025-10-26 23:13:54.860381
206	206	90	sell	2025-10-26 23:13:54.860381
207	207	310	buy	2025-10-26 23:13:54.860381
208	208	140	sell	2025-10-26 23:13:54.860381
209	209	220	buy	2025-10-26 23:13:54.860381
210	210	70	sell	2025-10-26 23:13:54.860381
211	211	180	buy	2025-10-26 23:13:54.860381
212	212	100	sell	2025-10-26 23:13:54.860381
213	213	260	buy	2025-10-26 23:13:54.860381
214	214	130	sell	2025-10-26 23:13:54.860381
215	215	270	buy	2025-10-26 23:13:54.860381
216	216	150	sell	2025-10-26 23:13:54.860381
217	217	240	buy	2025-10-26 23:13:54.860381
218	218	120	sell	2025-10-26 23:13:54.860381
219	219	250	buy	2025-10-26 23:13:54.860381
220	220	80	sell	2025-10-26 23:13:54.860381
221	221	230	buy	2025-10-26 23:13:54.860381
222	222	180	sell	2025-10-26 23:13:54.860381
223	223	210	buy	2025-10-26 23:13:54.860381
224	224	90	sell	2025-10-26 23:13:54.860381
225	225	260	buy	2025-10-26 23:13:54.860381
226	226	160	sell	2025-10-26 23:13:54.860381
227	227	280	buy	2025-10-26 23:13:54.860381
228	228	100	sell	2025-10-26 23:13:54.860381
229	229	300	buy	2025-10-26 23:13:54.860381
230	230	110	sell	2025-10-26 23:13:54.860381
231	231	200	buy	2025-10-26 23:13:54.860381
232	232	70	sell	2025-10-26 23:13:54.860381
233	233	240	buy	2025-10-26 23:13:54.860381
234	234	130	sell	2025-10-26 23:13:54.860381
235	235	270	buy	2025-10-26 23:13:54.860381
236	236	150	sell	2025-10-26 23:13:54.860381
237	237	250	buy	2025-10-26 23:13:54.860381
238	238	90	sell	2025-10-26 23:13:54.860381
239	239	310	buy	2025-10-26 23:13:54.860381
240	240	120	sell	2025-10-26 23:13:54.860381
241	241	220	buy	2025-10-26 23:13:54.860381
242	242	140	sell	2025-10-26 23:13:54.860381
243	243	200	buy	2025-10-26 23:13:54.860381
244	244	160	sell	2025-10-26 23:13:54.860381
245	245	230	buy	2025-10-26 23:13:54.860381
246	246	100	sell	2025-10-26 23:13:54.860381
247	247	300	buy	2025-10-26 23:13:54.860381
248	248	180	sell	2025-10-26 23:13:54.860381
249	249	260	buy	2025-10-26 23:13:54.860381
250	250	120	sell	2025-10-26 23:13:54.860381
251	251	260	buy	2025-10-26 23:13:54.860381
252	252	120	sell	2025-10-26 23:13:54.860381
253	253	210	buy	2025-10-26 23:13:54.860381
254	254	140	sell	2025-10-26 23:13:54.860381
255	255	180	buy	2025-10-26 23:13:54.860381
256	256	90	sell	2025-10-26 23:13:54.860381
257	257	270	buy	2025-10-26 23:13:54.860381
258	258	100	sell	2025-10-26 23:13:54.860381
259	259	300	buy	2025-10-26 23:13:54.860381
260	260	150	sell	2025-10-26 23:13:54.860381
261	261	200	buy	2025-10-26 23:13:54.860381
262	262	130	sell	2025-10-26 23:13:54.860381
263	263	220	buy	2025-10-26 23:13:54.860381
264	264	160	sell	2025-10-26 23:13:54.860381
265	265	240	buy	2025-10-26 23:13:54.860381
266	266	120	sell	2025-10-26 23:13:54.860381
267	267	310	buy	2025-10-26 23:13:54.860381
268	268	110	sell	2025-10-26 23:13:54.860381
269	269	250	buy	2025-10-26 23:13:54.860381
270	270	100	sell	2025-10-26 23:13:54.860381
271	271	230	buy	2025-10-26 23:13:54.860381
272	272	140	sell	2025-10-26 23:13:54.860381
273	273	260	buy	2025-10-26 23:13:54.860381
274	274	70	sell	2025-10-26 23:13:54.860381
275	275	280	buy	2025-10-26 23:13:54.860381
276	276	180	sell	2025-10-26 23:13:54.860381
277	277	190	buy	2025-10-26 23:13:54.860381
278	278	90	sell	2025-10-26 23:13:54.860381
279	279	310	buy	2025-10-26 23:13:54.860381
280	280	130	sell	2025-10-26 23:13:54.860381
281	281	230	buy	2025-10-26 23:13:54.860381
282	282	120	sell	2025-10-26 23:13:54.860381
283	283	260	buy	2025-10-26 23:13:54.860381
284	284	100	sell	2025-10-26 23:13:54.860381
285	285	210	buy	2025-10-26 23:13:54.860381
286	286	140	sell	2025-10-26 23:13:54.860381
287	287	270	buy	2025-10-26 23:13:54.860381
288	288	150	sell	2025-10-26 23:13:54.860381
289	289	200	buy	2025-10-26 23:13:54.860381
290	290	90	sell	2025-10-26 23:13:54.860381
291	291	250	buy	2025-10-26 23:13:54.860381
292	292	180	sell	2025-10-26 23:13:54.860381
293	293	300	buy	2025-10-26 23:13:54.860381
294	294	100	sell	2025-10-26 23:13:54.860381
295	295	230	buy	2025-10-26 23:13:54.860381
296	296	160	sell	2025-10-26 23:13:54.860381
297	297	260	buy	2025-10-26 23:13:54.860381
298	298	120	sell	2025-10-26 23:13:54.860381
299	299	270	buy	2025-10-26 23:13:54.860381
300	300	80	sell	2025-10-26 23:13:54.860381
301	301	280	buy	2025-10-26 23:13:54.860381
302	302	100	sell	2025-10-26 23:13:54.860381
303	303	240	buy	2025-10-26 23:13:54.860381
304	304	90	sell	2025-10-26 23:13:54.860381
305	305	220	buy	2025-10-26 23:13:54.860381
306	306	110	sell	2025-10-26 23:13:54.860381
307	307	230	buy	2025-10-26 23:13:54.860381
308	308	150	sell	2025-10-26 23:13:54.860381
309	309	310	buy	2025-10-26 23:13:54.860381
310	310	120	sell	2025-10-26 23:13:54.860381
311	311	270	buy	2025-10-26 23:13:54.860381
312	312	100	sell	2025-10-26 23:13:54.860381
313	313	250	buy	2025-10-26 23:13:54.860381
314	314	90	sell	2025-10-26 23:13:54.860381
315	315	280	buy	2025-10-26 23:13:54.860381
316	316	130	sell	2025-10-26 23:13:54.860381
317	317	230	buy	2025-10-26 23:13:54.860381
318	318	160	sell	2025-10-26 23:13:54.860381
319	319	210	buy	2025-10-26 23:13:54.860381
320	320	140	sell	2025-10-26 23:13:54.860381
321	321	300	buy	2025-10-26 23:13:54.860381
322	322	120	sell	2025-10-26 23:13:54.860381
323	323	250	buy	2025-10-26 23:13:54.860381
324	324	110	sell	2025-10-26 23:13:54.860381
325	325	270	buy	2025-10-26 23:13:54.860381
326	326	150	sell	2025-10-26 23:13:54.860381
327	327	260	buy	2025-10-26 23:13:54.860381
328	328	100	sell	2025-10-26 23:13:54.860381
329	329	200	buy	2025-10-26 23:13:54.860381
330	330	180	sell	2025-10-26 23:13:54.860381
331	331	290	buy	2025-10-26 23:13:54.860381
332	332	140	sell	2025-10-26 23:13:54.860381
333	333	230	buy	2025-10-26 23:13:54.860381
334	334	90	sell	2025-10-26 23:13:54.860381
335	335	310	buy	2025-10-26 23:13:54.860381
336	336	120	sell	2025-10-26 23:13:54.860381
337	337	280	buy	2025-10-26 23:13:54.860381
338	338	100	sell	2025-10-26 23:13:54.860381
339	339	270	buy	2025-10-26 23:13:54.860381
340	340	150	sell	2025-10-26 23:13:54.860381
341	341	260	buy	2025-10-26 23:13:54.860381
342	342	80	sell	2025-10-26 23:13:54.860381
343	343	230	buy	2025-10-26 23:13:54.860381
344	344	160	sell	2025-10-26 23:13:54.860381
345	345	200	buy	2025-10-26 23:13:54.860381
346	346	120	sell	2025-10-26 23:13:54.860381
347	347	240	buy	2025-10-26 23:13:54.860381
348	348	100	sell	2025-10-26 23:13:54.860381
349	349	310	buy	2025-10-26 23:13:54.860381
350	350	110	sell	2025-10-26 23:13:54.860381
351	351	250	buy	2025-10-26 23:13:54.860381
352	352	140	sell	2025-10-26 23:13:54.860381
353	353	280	buy	2025-10-26 23:13:54.860381
354	354	110	sell	2025-10-26 23:13:54.860381
355	355	300	buy	2025-10-26 23:13:54.860381
356	356	120	sell	2025-10-26 23:13:54.860381
357	357	270	buy	2025-10-26 23:13:54.860381
358	358	100	sell	2025-10-26 23:13:54.860381
359	359	230	buy	2025-10-26 23:13:54.860381
360	360	90	sell	2025-10-26 23:13:54.860381
361	361	160	buy	2025-10-26 23:13:54.860381
362	362	130	sell	2025-10-26 23:13:54.860381
363	363	210	buy	2025-10-26 23:13:54.860381
364	364	150	sell	2025-10-26 23:13:54.860381
365	365	260	buy	2025-10-26 23:13:54.860381
366	366	140	sell	2025-10-26 23:13:54.860381
367	367	290	buy	2025-10-26 23:13:54.860381
368	368	120	sell	2025-10-26 23:13:54.860381
369	369	220	buy	2025-10-26 23:13:54.860381
370	370	100	sell	2025-10-26 23:13:54.860381
371	371	240	buy	2025-10-26 23:13:54.860381
372	372	130	sell	2025-10-26 23:13:54.860381
373	373	270	buy	2025-10-26 23:13:54.860381
374	374	110	sell	2025-10-26 23:13:54.860381
375	375	200	buy	2025-10-26 23:13:54.860381
376	376	90	sell	2025-10-26 23:13:54.860381
377	377	250	buy	2025-10-26 23:13:54.860381
378	378	140	sell	2025-10-26 23:13:54.860381
379	379	230	buy	2025-10-26 23:13:54.860381
380	380	120	sell	2025-10-26 23:13:54.860381
381	381	260	buy	2025-10-26 23:13:54.860381
382	382	100	sell	2025-10-26 23:13:54.860381
383	383	210	buy	2025-10-26 23:13:54.860381
384	384	150	sell	2025-10-26 23:13:54.860381
385	385	280	buy	2025-10-26 23:13:54.860381
386	386	110	sell	2025-10-26 23:13:54.860381
387	387	230	buy	2025-10-26 23:13:54.860381
388	388	120	sell	2025-10-26 23:13:54.860381
389	389	270	buy	2025-10-26 23:13:54.860381
390	390	90	sell	2025-10-26 23:13:54.860381
391	391	250	buy	2025-10-26 23:13:54.860381
392	392	140	sell	2025-10-26 23:13:54.860381
393	393	260	buy	2025-10-26 23:13:54.860381
394	394	130	sell	2025-10-26 23:13:54.860381
395	395	240	buy	2025-10-26 23:13:54.860381
396	396	100	sell	2025-10-26 23:13:54.860381
397	397	220	buy	2025-10-26 23:13:54.860381
398	398	80	sell	2025-10-26 23:13:54.860381
399	399	290	buy	2025-10-26 23:13:54.860381
400	400	110	sell	2025-10-26 23:13:54.860381
401	401	260	buy	2025-10-26 23:13:54.860381
402	402	120	sell	2025-10-26 23:13:54.860381
403	403	240	buy	2025-10-26 23:13:54.860381
404	404	100	sell	2025-10-26 23:13:54.860381
405	405	230	buy	2025-10-26 23:13:54.860381
406	406	140	sell	2025-10-26 23:13:54.860381
407	407	270	buy	2025-10-26 23:13:54.860381
408	408	150	sell	2025-10-26 23:13:54.860381
409	409	250	buy	2025-10-26 23:13:54.860381
410	410	100	sell	2025-10-26 23:13:54.860381
411	411	220	buy	2025-10-26 23:13:54.860381
412	412	90	sell	2025-10-26 23:13:54.860381
413	413	260	buy	2025-10-26 23:13:54.860381
414	414	130	sell	2025-10-26 23:13:54.860381
415	415	280	buy	2025-10-26 23:13:54.860381
416	416	110	sell	2025-10-26 23:13:54.860381
417	417	230	buy	2025-10-26 23:13:54.860381
418	418	120	sell	2025-10-26 23:13:54.860381
419	419	250	buy	2025-10-26 23:13:54.860381
420	420	90	sell	2025-10-26 23:13:54.860381
421	421	240	buy	2025-10-26 23:13:54.860381
422	422	140	sell	2025-10-26 23:13:54.860381
423	423	260	buy	2025-10-26 23:13:54.860381
424	424	100	sell	2025-10-26 23:13:54.860381
425	425	220	buy	2025-10-26 23:13:54.860381
426	426	110	sell	2025-10-26 23:13:54.860381
427	427	270	buy	2025-10-26 23:13:54.860381
428	428	120	sell	2025-10-26 23:13:54.860381
429	429	240	buy	2025-10-26 23:13:54.860381
430	430	100	sell	2025-10-26 23:13:54.860381
431	431	230	buy	2025-10-26 23:13:54.860381
432	432	90	sell	2025-10-26 23:13:54.860381
433	433	260	buy	2025-10-26 23:13:54.860381
434	434	140	sell	2025-10-26 23:13:54.860381
435	435	280	buy	2025-10-26 23:13:54.860381
436	436	110	sell	2025-10-26 23:13:54.860381
437	437	250	buy	2025-10-26 23:13:54.860381
438	438	130	sell	2025-10-26 23:13:54.860381
439	439	240	buy	2025-10-26 23:13:54.860381
440	440	100	sell	2025-10-26 23:13:54.860381
441	441	230	buy	2025-10-26 23:13:54.860381
442	442	120	sell	2025-10-26 23:13:54.860381
443	443	260	buy	2025-10-26 23:13:54.860381
444	444	140	sell	2025-10-26 23:13:54.860381
445	445	270	buy	2025-10-26 23:13:54.860381
446	446	110	sell	2025-10-26 23:13:54.860381
447	447	240	buy	2025-10-26 23:13:54.860381
448	448	100	sell	2025-10-26 23:13:54.860381
449	449	230	buy	2025-10-26 23:13:54.860381
450	450	130	sell	2025-10-26 23:13:54.860381
451	451	220	buy	2025-10-26 23:13:54.860381
452	452	130	sell	2025-10-26 23:13:54.860381
453	453	260	buy	2025-10-26 23:13:54.860381
454	454	100	sell	2025-10-26 23:13:54.860381
455	455	270	buy	2025-10-26 23:13:54.860381
456	456	120	sell	2025-10-26 23:13:54.860381
457	457	240	buy	2025-10-26 23:13:54.860381
458	458	90	sell	2025-10-26 23:13:54.860381
459	459	230	buy	2025-10-26 23:13:54.860381
460	460	140	sell	2025-10-26 23:13:54.860381
461	461	250	buy	2025-10-26 23:13:54.860381
462	462	110	sell	2025-10-26 23:13:54.860381
463	463	280	buy	2025-10-26 23:13:54.860381
464	464	100	sell	2025-10-26 23:13:54.860381
465	465	260	buy	2025-10-26 23:13:54.860381
466	466	130	sell	2025-10-26 23:13:54.860381
467	467	270	buy	2025-10-26 23:13:54.860381
468	468	120	sell	2025-10-26 23:13:54.860381
469	469	230	buy	2025-10-26 23:13:54.860381
470	470	100	sell	2025-10-26 23:13:54.860381
471	471	250	buy	2025-10-26 23:13:54.860381
472	472	140	sell	2025-10-26 23:13:54.860381
473	473	240	buy	2025-10-26 23:13:54.860381
474	474	110	sell	2025-10-26 23:13:54.860381
475	475	260	buy	2025-10-26 23:13:54.860381
476	476	130	sell	2025-10-26 23:13:54.860381
477	477	270	buy	2025-10-26 23:13:54.860381
478	478	90	sell	2025-10-26 23:13:54.860381
479	479	230	buy	2025-10-26 23:13:54.860381
480	480	100	sell	2025-10-26 23:13:54.860381
481	481	250	buy	2025-10-26 23:13:54.860381
482	482	140	sell	2025-10-26 23:13:54.860381
483	483	260	buy	2025-10-26 23:13:54.860381
484	484	110	sell	2025-10-26 23:13:54.860381
485	485	280	buy	2025-10-26 23:13:54.860381
486	486	120	sell	2025-10-26 23:13:54.860381
487	487	230	buy	2025-10-26 23:13:54.860381
488	488	90	sell	2025-10-26 23:13:54.860381
489	489	240	buy	2025-10-26 23:13:54.860381
490	490	100	sell	2025-10-26 23:13:54.860381
491	491	250	buy	2025-10-26 23:13:54.860381
492	492	130	sell	2025-10-26 23:13:54.860381
493	493	260	buy	2025-10-26 23:13:54.860381
494	494	110	sell	2025-10-26 23:13:54.860381
495	495	270	buy	2025-10-26 23:13:54.860381
496	496	120	sell	2025-10-26 23:13:54.860381
497	497	280	buy	2025-10-26 23:13:54.860381
498	498	100	sell	2025-10-26 23:13:54.860381
499	499	230	buy	2025-10-26 23:13:54.860381
500	500	90	sell	2025-10-26 23:13:54.860381
\.


--
-- Data for Name: transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transactions (transaction_id, account_id, transaction_type, amount, transaction_time) FROM stdin;
1	1	deposit	30000.00	2025-10-01 09:30:00
2	2	withdraw	7000.00	2025-10-02 11:45:10
3	3	deposit	25000.00	2025-10-02 16:05:33
4	4	deposit	12000.00	2025-10-03 14:15:44
5	5	withdraw	6000.00	2025-10-03 17:55:12
6	6	deposit	28000.00	2025-10-04 09:42:40
7	7	deposit	20000.00	2025-10-04 12:22:12
8	8	withdraw	4000.00	2025-10-05 10:05:10
9	9	deposit	35000.00	2025-10-06 11:35:40
10	10	withdraw	9000.00	2025-10-06 17:55:00
11	11	deposit	26000.00	2025-10-07 09:50:22
12	12	withdraw	5000.00	2025-10-07 13:40:19
13	13	deposit	22000.00	2025-10-08 10:25:11
14	14	deposit	29000.00	2025-10-09 12:30:55
15	15	withdraw	3000.00	2025-10-09 16:10:22
16	16	deposit	17500.00	2025-10-10 09:35:00
17	17	deposit	20500.00	2025-10-11 10:55:40
18	18	withdraw	8000.00	2025-10-12 13:20:30
19	19	deposit	25000.00	2025-10-13 11:15:10
20	20	withdraw	6500.00	2025-10-14 15:35:25
\.


--
-- Name: accounts_account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_account_id_seq', 20, true);


--
-- Name: brokers_broker_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.brokers_broker_id_seq', 50, true);


--
-- Name: investors_investor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.investors_investor_id_seq', 20, true);


--
-- Name: stocks_stock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stocks_stock_id_seq', 500, true);


--
-- Name: trades_trade_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.trades_trade_id_seq', 500, true);


--
-- Name: transactions_transaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transactions_transaction_id_seq', 20, true);


--
-- Name: accounts accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (account_id);


--
-- Name: brokers brokers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brokers
    ADD CONSTRAINT brokers_pkey PRIMARY KEY (broker_id);


--
-- Name: investors investors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.investors
    ADD CONSTRAINT investors_pkey PRIMARY KEY (investor_id);


--
-- Name: stocks stocks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stocks
    ADD CONSTRAINT stocks_pkey PRIMARY KEY (stock_id);


--
-- Name: trades trades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trades
    ADD CONSTRAINT trades_pkey PRIMARY KEY (trade_id);


--
-- Name: transactions transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (transaction_id);


--
-- Name: accounts accounts_investor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_investor_id_fkey FOREIGN KEY (investor_id) REFERENCES public.investors(investor_id);


--
-- Name: trades trades_stock_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trades
    ADD CONSTRAINT trades_stock_id_fkey FOREIGN KEY (stock_id) REFERENCES public.stocks(stock_id);


--
-- Name: transactions transactions_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.accounts(account_id);


--
-- PostgreSQL database dump complete
--

\unrestrict AGK72t9QdQocBQukw22eNmwqN74SWCGcP4dUhQqeLxegFVscrVpJ948vL7UXcms

