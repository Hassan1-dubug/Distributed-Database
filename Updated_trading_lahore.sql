--
-- PostgreSQL database dump
--

\restrict xINFBdpzNRN04GxJVKR6hXgJQyNhV9PuVkeav2bIUhmsMo8szHvwzvULPyrafjB

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
21	21	950000.25	Active
22	22	430000.00	Suspended
23	23	1225000.50	Active
24	24	625000.00	Inactive
25	25	1170000.00	Active
26	26	780000.25	Active
27	27	1320000.00	Active
28	28	465000.00	Inactive
29	29	1090000.75	Active
30	30	890000.00	Active
\.


--
-- Data for Name: brokers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.brokers (broker_id, broker_name, branch_city, commission_rate) FROM stdin;
1	Alpha Securities Lahore	Lahore	1.55
2	TrustLine Brokers Lahore	Lahore	1.60
3	Metro Capital Lahore	Lahore	1.70
4	BrightTrade Lahore	Lahore	1.50
5	Unity Investments Lahore	Lahore	1.65
6	RoyalEdge Securities Lahore	Lahore	1.75
7	PakTrade Financials Lahore	Lahore	1.80
8	BlueSky Brokers Lahore	Lahore	1.70
9	CapitalVest Lahore	Lahore	1.55
10	PrimeBridge Investments Lahore	Lahore	1.60
11	SafeTrust Securities Lahore	Lahore	1.85
12	WealthMax Lahore	Lahore	1.75
13	GlobalEdge Investments Lahore	Lahore	1.65
14	TradeWise Capital Lahore	Lahore	1.70
15	BrightLine Brokers Lahore	Lahore	1.60
16	RoyalPath Securities Lahore	Lahore	1.90
17	NextGen Brokers Lahore	Lahore	1.50
18	SecureVest Capital Lahore	Lahore	1.55
19	VertexLine Lahore	Lahore	1.65
20	CityTrade Investments Lahore	Lahore	1.80
21	GrowSafe Financial Lahore	Lahore	1.75
22	MetroEdge Brokers Lahore	Lahore	1.70
23	CitiLine Securities Lahore	Lahore	1.60
24	BlueRock Lahore	Lahore	1.85
25	PrimeEdge Finance Lahore	Lahore	1.45
26	AlphaBridge Brokers Lahore	Lahore	1.55
27	RoyalTrust Lahore	Lahore	1.65
28	TradeBridge Securities Lahore	Lahore	1.70
29	SmartTrade Lahore	Lahore	1.75
30	PakWealth Capital Lahore	Lahore	1.60
31	SecureEdge Brokers Lahore	Lahore	1.80
32	BrightPath Securities Lahore	Lahore	1.85
33	NextTrade Lahore	Lahore	1.55
34	Crescent Capital Lahore	Lahore	1.70
35	UnityTrust Brokers Lahore	Lahore	1.75
36	SafeLine Financial Lahore	Lahore	1.60
37	TradeAxis Lahore	Lahore	1.50
38	CapitalBridge Lahore	Lahore	1.65
39	Vertex Securities Lahore	Lahore	1.85
40	WealthGrow Investments Lahore	Lahore	1.70
41	TrustEdge Capital Lahore	Lahore	1.60
42	AlphaGrow Brokers Lahore	Lahore	1.75
43	SmartEdge Securities Lahore	Lahore	1.80
44	MetroTrust Lahore	Lahore	1.65
45	RoyalPeak Financial Lahore	Lahore	1.70
46	SecureWealth Lahore	Lahore	1.55
47	CitiVest Lahore	Lahore	1.85
48	BlueVest Financial Lahore	Lahore	1.60
49	OptimaTrade Lahore	Lahore	1.75
50	TradePoint Securities Lahore	Lahore	1.70
\.


--
-- Data for Name: investors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.investors (investor_id, investor_name, city, email, contact_no) FROM stdin;
1	Kamran Aslam	Lahore	kamran.aslam.lhr@example.com	0301-2222211
2	Naveed Iqbal	Lahore	naveed.iqbal.lhr@example.com	0302-2222212
3	Adil Rafiq	Lahore	adil.rafiq.lhr@example.com	0303-2222213
4	Qasim Javed	Lahore	qasim.javed.lhr@example.com	0304-2222214
5	Fahim Shahzad	Lahore	fahim.shahzad.lhr@example.com	0305-2222215
6	Rizwan Bashir	Lahore	rizwan.bashir.lhr@example.com	0306-2222216
7	Haider Ali	Lahore	haider.ali.lhr@example.com	0307-2222217
8	Yasir Mahmood	Lahore	yasir.mahmood.lhr@example.com	0308-2222218
9	Taimoor Khan	Lahore	taimoor.khan.lhr@example.com	0309-2222219
10	Sarfraz Raza	Lahore	sarfraz.raza.lhr@example.com	0310-2222220
11	Wajid Rehman	Lahore	wajid.rehman.lhr@example.com	0311-2222221
12	Mubashir Ali	Lahore	mubashir.ali.lhr@example.com	0312-2222222
13	Hammad Qureshi	Lahore	hammad.qureshi.lhr@example.com	0313-2222223
14	Zeeshan Khalid	Lahore	zeeshan.khalid.lhr@example.com	0314-2222224
15	Omer Riaz	Lahore	omer.riaz.lhr@example.com	0315-2222225
16	Faraz Ahmed	Lahore	faraz.ahmed.lhr@example.com	0316-2222226
17	Kashif Latif	Lahore	kashif.latif.lhr@example.com	0317-2222227
18	Usama Shah	Lahore	usama.shah.lhr@example.com	0318-2222228
19	Hafeez Siddiqui	Lahore	hafeez.siddiqui.lhr@example.com	0319-2222229
20	Irfan Baig	Lahore	irfan.baig.lhr@example.com	0320-2222230
21	Murtaza Noor	Lahore	murtaza.noor.lhr@example.com	0321-2222231
22	Salman Tariq	Lahore	salman.tariq.lhr@example.com	0322-2222232
23	Tariq Jameel	Lahore	tariq.jameel.lhr@example.com	0323-2222233
24	Faizan Khan	Lahore	faizan.khan.lhr@example.com	0324-2222234
25	Zubair Ahmed	Lahore	zubair.ahmed.lhr@example.com	0325-2222235
26	Mazhar Saeed	Lahore	mazhar.saeed.lhr@example.com	0326-2222236
27	Suleman Arif	Lahore	suleman.arif.lhr@example.com	0327-2222237
28	Rehman Malik	Lahore	rehman.malik.lhr@example.com	0328-2222238
29	Aftab Javed	Lahore	aftab.javed.lhr@example.com	0329-2222239
30	Ahmad Nawaz	Lahore	ahmad.nawaz.lhr@example.com	0330-2222240
\.


--
-- Data for Name: stocks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stocks (stock_id, symbol, company_name, current_price, city) FROM stdin;
1	HBL	Habib Bank Ltd	122.30	Lahore
2	MCB	MCB Bank Ltd	165.70	Lahore
3	NML	Nishat Mills Ltd	88.40	Lahore
4	PSO	Pakistan State Oil	183.40	Lahore
5	UBL	United Bank Limited	117.80	Lahore
6	ENGRO	Engro Corporation	322.60	Lahore
7	LUCK	Lucky Cement	468.30	Lahore
8	FFC	Fauji Fertilizer Company	113.40	Lahore
9	DGKC	DG Khan Cement	85.10	Lahore
10	NBP	National Bank of Pakistan	53.20	Lahore
11	OGDC	Oil & Gas Development Co.	127.40	Lahore
12	PPL	Pakistan Petroleum Ltd.	75.10	Lahore
13	SNGP	Sui Northern Gas Pipeline	46.20	Lahore
14	KEL	K-Electric Limited	3.40	Lahore
15	PAEL	Pak Elektron Limited	21.20	Lahore
16	UNITY	Unity Foods Limited	16.10	Lahore
17	NETSOL	Netsol Technologies	110.30	Lahore
18	SYS	Systems Limited	462.20	Lahore
19	TRG	TRG Pakistan Ltd.	92.50	Lahore
20	AVN	Avanceon Limited	83.00	Lahore
21	SEARL	The Searle Company Ltd.	52.50	Lahore
22	GHNI	Ghani Global Holdings	14.10	Lahore
23	HASCOL	Hascol Petroleum	6.00	Lahore
24	LOTCHEM	Lotte Chemical Pakistan	32.90	Lahore
25	EPCL	Engro Polymer & Chemicals	63.10	Lahore
26	NCL	Nishat Chunian Limited	33.10	Lahore
27	PSMC	Pak Suzuki Motors	146.50	Lahore
28	INDU	Indus Motor Company	1015.20	Lahore
29	ATLH	Atlas Honda Ltd.	419.70	Lahore
30	EFERT	Engro Fertilizer Ltd.	89.70	Lahore
31	MEBL	Meezan Bank Limited	169.00	Lahore
32	FABL	Faysal Bank Limited	42.10	Lahore
33	BAHL	Bank Al Habib Ltd.	94.90	Lahore
34	AKBL	Askari Bank Ltd.	27.00	Lahore
35	BOP	Bank of Punjab	5.90	Lahore
36	HUBC	Hub Power Company	93.00	Lahore
37	KAPCO	Kot Addu Power Company	28.90	Lahore
38	SHEL	Shell Pakistan	153.60	Lahore
39	SILK	Silkbank Limited	1.25	Lahore
40	GATM	Gul Ahmed Textile	42.80	Lahore
41	ISL	International Steels Ltd.	62.10	Lahore
42	ASTL	Amreli Steels Ltd.	22.60	Lahore
43	MUGHAL	Mughal Iron & Steel	85.70	Lahore
44	CEYLON	Ceylon Tobacco Co.	1218.50	Lahore
45	COLG	Colgate Palmolive	1347.80	Lahore
46	HINOON	Highnoon Laboratories	486.10	Lahore
47	GLAXO	GlaxoSmithKline Pakistan	123.20	Lahore
48	IBFL	IBL Healthcare Ltd.	73.20	Lahore
49	SFL	Sapphire Fibres Ltd.	1018.90	Lahore
50	BATA	Bata Pakistan	1623.40	Lahore
51	LHR51	Lahore Textiles Ltd	152.30	Lahore
52	LHR52	Punjab Foods Corporation	88.75	Lahore
53	LHR53	Lahore Cement Co.	65.40	Lahore
54	LHR54	River Bank Ltd	245.60	Lahore
55	LHR55	Canal Steel Industries	110.25	Lahore
56	LHR56	Metro Pharmaceuticals	178.90	Lahore
57	LHR57	Punjab Gas Company	115.50	Lahore
58	LHR58	Lahore Power Ltd	135.70	Lahore
59	LHR59	Capital Insurance	92.45	Lahore
60	LHR60	Lahore Logistics	48.20	Lahore
61	LHR61	National Electronics	175.90	Lahore
62	LHR62	Smart Housing Developers	120.35	Lahore
63	LHR63	Punjab Dairy Ltd	86.10	Lahore
64	LHR64	City Paints & Chemicals	64.75	Lahore
65	LHR65	Allied Financial Services	210.55	Lahore
66	LHR66	Lahore Media Network	132.10	Lahore
67	LHR67	Punjab Sugar Mills	71.35	Lahore
68	LHR68	Urban Developers Ltd	162.50	Lahore
69	LHR69	Canal Automotive Ltd	195.80	Lahore
70	LHR70	Punjab Packaging Co.	56.40	Lahore
71	LHR71	City Glass Works	78.60	Lahore
72	LHR72	Punjab Telecom Ltd	140.25	Lahore
73	LHR73	Metro Beverages Ltd	65.70	Lahore
74	LHR74	Allied Power Corporation	118.80	Lahore
75	LHR75	Lahore Bank Ltd	250.90	Lahore
76	LHR76	Punjab Textiles Exporters	84.30	Lahore
77	LHR77	Royal Foods Ltd	105.50	Lahore
78	LHR78	Canal Steel Works	112.40	Lahore
79	LHR79	Punjab Power Generation	139.90	Lahore
80	LHR80	City Pharma Ltd	188.40	Lahore
81	LHR81	Royal Insurance Co.	98.25	Lahore
82	LHR82	Metro Transport Ltd	52.10	Lahore
83	LHR83	Capital Tech Ltd	180.55	Lahore
84	LHR84	Urban Builders Ltd	145.25	Lahore
85	LHR85	Punjab Dairy Foods	92.75	Lahore
86	LHR86	City Chemical Industries	74.80	Lahore
87	LHR87	Allied Finance Bank	222.90	Lahore
88	LHR88	Lahore Communications	138.10	Lahore
89	LHR89	Punjab Sugar Refineries	77.40	Lahore
90	LHR90	Canal Properties Ltd	158.75	Lahore
91	LHR91	Royal Motors Ltd	205.60	Lahore
92	LHR92	Metro Packaging	63.20	Lahore
93	LHR93	City Steel Ltd	118.90	Lahore
94	LHR94	Punjab Telecom Network	145.75	Lahore
95	LHR95	Lahore Beverages Ltd	69.30	Lahore
96	LHR96	Canal Power Co.	128.45	Lahore
97	LHR97	Punjab Bank Ltd	248.60	Lahore
98	LHR98	Urban Textiles Ltd	91.70	Lahore
99	LHR99	Royal Foods Exporters	114.30	Lahore
100	LHR100	Punjab Steel Group	126.50	Lahore
101	LHR101	Canal Textile Works	132.70	Lahore
102	LHR102	Punjab Auto Traders	115.40	Lahore
103	LHR103	Lahore Energy Ltd	182.60	Lahore
104	LHR104	Metro Builders Ltd	98.20	Lahore
105	LHR105	Punjab Cotton Mills	79.45	Lahore
106	LHR106	Allied Engineering Works	142.30	Lahore
107	LHR107	Lahore Ceramic Co.	63.25	Lahore
108	LHR108	Royal Developers Ltd	188.75	Lahore
109	LHR109	Punjab Foods Export	95.40	Lahore
110	LHR110	City IT Solutions	157.60	Lahore
111	LHR111	Metro Constructions	167.90	Lahore
112	LHR112	Punjab Paints Ltd	70.50	Lahore
113	LHR113	Lahore Leather Works	128.35	Lahore
114	LHR114	Allied Electric Co.	115.75	Lahore
115	LHR115	Canal Builders & Developers	146.20	Lahore
116	LHR116	Punjab Media Group	189.90	Lahore
117	LHR117	City Foods Pvt Ltd	97.65	Lahore
118	LHR118	Royal Power Ltd	210.40	Lahore
119	LHR119	Lahore Plastics Ltd	84.80	Lahore
120	LHR120	Metro Software Solutions	132.15	Lahore
121	LHR121	Punjab Agro Industries	73.25	Lahore
122	LHR122	Urban Housing Ltd	152.50	Lahore
123	LHR123	Canal Beverages Co.	91.70	Lahore
124	LHR124	Lahore Engineering Works	118.95	Lahore
125	LHR125	Royal Construction Ltd	241.10	Lahore
126	LHR126	Punjab Logistics	78.65	Lahore
127	LHR127	City Packaging Ltd	97.25	Lahore
128	LHR128	Allied Insurance Ltd	169.70	Lahore
129	LHR129	Lahore Digital Systems	110.55	Lahore
130	LHR130	Punjab Paint Works	64.40	Lahore
131	LHR131	Metro Auto Parts	102.15	Lahore
132	LHR132	City Developers Ltd	158.60	Lahore
133	LHR133	Punjab Dairy Foods	93.70	Lahore
134	LHR134	Royal Textile Mills	143.80	Lahore
135	LHR135	Lahore Builders & Engineers	189.25	Lahore
136	LHR136	Canal Technology Ltd	117.30	Lahore
137	LHR137	Punjab Chemical Co.	83.60	Lahore
138	LHR138	Allied Foods Exporters	122.25	Lahore
139	LHR139	Metro Paper Industries	98.90	Lahore
140	LHR140	City Marble Works	137.75	Lahore
141	LHR141	Punjab Auto Works	102.10	Lahore
142	LHR142	Royal Motors Ltd	234.90	Lahore
143	LHR143	Lahore Cement Works	186.20	Lahore
144	LHR144	Canal Developers Ltd	142.15	Lahore
145	LHR145	Punjab Electronics	91.35	Lahore
146	LHR146	Metro Telecom Ltd	159.90	Lahore
147	LHR147	City Trading Co.	128.65	Lahore
148	LHR148	Royal Dairy Ltd	76.50	Lahore
149	LHR149	Lahore Glass Ltd	111.45	Lahore
150	LHR150	Punjab Steel Works	134.70	Lahore
151	LHR151	Canal Builders Pvt Ltd	145.25	Lahore
152	LHR152	Punjab Packaging Co.	132.60	Lahore
153	LHR153	City Agro Industries	98.90	Lahore
154	LHR154	Royal Electronics Ltd	175.40	Lahore
155	LHR155	Lahore Fiber Works	112.75	Lahore
156	LHR156	Metro Foods Pvt Ltd	138.25	Lahore
157	LHR157	Punjab Energy Co.	192.60	Lahore
158	LHR158	Canal Auto Traders	102.15	Lahore
159	LHR159	City Digital Ltd	154.80	Lahore
160	LHR160	Royal Paints Ltd	118.90	Lahore
161	LHR161	Lahore Cement Pvt Ltd	185.40	Lahore
162	LHR162	Metro Leather Works	125.75	Lahore
163	LHR163	Punjab Textile Mills	137.50	Lahore
164	LHR164	Canal Builders & Co.	145.90	Lahore
165	LHR165	City Software Solutions	158.25	Lahore
166	LHR166	Royal Cement Works	189.70	Lahore
167	LHR167	Lahore Auto Parts	102.50	Lahore
168	LHR168	Metro Digital Ltd	172.35	Lahore
169	LHR169	Punjab Builders Pvt Ltd	140.20	Lahore
170	LHR170	City Energy Ltd	196.50	Lahore
171	LHR171	Royal Packaging Co.	132.75	Lahore
172	LHR172	Lahore Dairy Foods	115.60	Lahore
173	LHR173	Metro Chemicals Ltd	108.25	Lahore
174	LHR174	Canal Power Pvt Ltd	175.90	Lahore
175	LHR175	Punjab Marble Works	124.80	Lahore
176	LHR176	City Auto Traders	152.25	Lahore
177	LHR177	Royal Foods Ltd	140.60	Lahore
178	LHR178	Lahore Software Works	158.90	Lahore
179	LHR179	Metro Builders & Engineers	180.25	Lahore
180	LHR180	Canal Electric Ltd	132.50	Lahore
181	LHR181	Punjab Digital Pvt Ltd	145.60	Lahore
182	LHR182	City Cement Works	172.80	Lahore
183	LHR183	Royal Agro Industries	118.25	Lahore
184	LHR184	Lahore Steel Mills	192.35	Lahore
185	LHR185	Metro Energy Pvt Ltd	140.90	Lahore
186	LHR186	Canal Electronics Ltd	158.25	Lahore
187	LHR187	Punjab Fiber Works	123.75	Lahore
188	LHR188	City Builders Ltd	185.60	Lahore
189	LHR189	Royal Auto Traders	132.15	Lahore
190	LHR190	Lahore Paint Works	149.80	Lahore
191	LHR191	Metro Digital Pvt Ltd	172.25	Lahore
192	LHR192	Canal Dairy Foods	118.50	Lahore
193	LHR193	Punjab Cement Works	185.90	Lahore
194	LHR194	City Textile Mills	124.25	Lahore
195	LHR195	Royal Builders Pvt Ltd	152.60	Lahore
196	LHR196	Lahore Electric Ltd	140.25	Lahore
197	LHR197	Metro Agro Industries	158.90	Lahore
198	LHR198	Canal Marble Pvt Ltd	132.75	Lahore
199	LHR199	Punjab Foods Ltd	145.60	Lahore
200	LHR200	City Chemicals Pvt Ltd	172.25	Lahore
201	LHR201	Royal Cement Pvt Ltd	118.90	Lahore
202	LHR202	Lahore Builders & Co.	192.75	Lahore
203	LHR203	Metro Auto Parts	140.25	Lahore
204	LHR204	Canal Software Ltd	158.60	Lahore
205	LHR205	Punjab Power Works	123.25	Lahore
206	LHR206	City Packaging Ltd	185.50	Lahore
207	LHR207	Royal Textile Pvt Ltd	132.85	Lahore
208	LHR208	Lahore Energy Co.	149.25	Lahore
209	LHR209	Metro Foods Ltd	172.50	Lahore
210	LHR210	Canal Builders Ltd	118.35	Lahore
211	LHR211	Punjab Auto Pvt Ltd	192.10	Lahore
212	LHR212	City Digital Pvt Ltd	140.75	Lahore
213	LHR213	Royal Chemicals Ltd	158.25	Lahore
214	LHR214	Lahore Marble Works	132.60	Lahore
215	LHR215	Metro Builders Pvt Ltd	145.90	Lahore
216	LHR216	Canal Cement Works	172.25	Lahore
217	LHR217	Punjab Foods Pvt Ltd	118.75	Lahore
218	LHR218	City Electronics Ltd	192.60	Lahore
219	LHR219	Royal Fiber Works	140.25	Lahore
220	LHR220	Lahore Builders Ltd	158.90	Lahore
221	LHR221	Metro Packaging Pvt Ltd	132.50	Lahore
222	LHR222	Canal Auto Ltd	145.75	Lahore
223	LHR223	Punjab Energy Pvt Ltd	172.10	Lahore
224	LHR224	City Cement Pvt Ltd	118.50	Lahore
225	LHR225	Royal Builders Ltd	192.75	Lahore
226	LHR226	Lahore Dairy Pvt Ltd	140.25	Lahore
227	LHR227	Metro Digital Ltd	158.90	Lahore
228	LHR228	Canal Foods Pvt Ltd	132.60	Lahore
229	LHR229	Punjab Steel Pvt Ltd	145.25	Lahore
230	LHR230	City Energy Ltd	172.50	Lahore
231	LHR231	Royal Builders Pvt Ltd	118.35	Lahore
232	LHR232	Lahore Chemicals Ltd	192.10	Lahore
233	LHR233	Metro Marble Works	140.75	Lahore
234	LHR234	Canal Agro Industries	158.25	Lahore
235	LHR235	Punjab Digital Ltd	132.50	Lahore
236	LHR236	City Builders Pvt Ltd	145.60	Lahore
237	LHR237	Royal Cement Works	172.25	Lahore
238	LHR238	Lahore Auto Pvt Ltd	118.75	Lahore
239	LHR239	Metro Fiber Works	192.60	Lahore
240	LHR240	Canal Foods Ltd	140.25	Lahore
241	LHR241	Punjab Builders Pvt Ltd	158.90	Lahore
242	LHR242	City Chemicals Ltd	132.50	Lahore
243	LHR243	Royal Marble Pvt Ltd	145.25	Lahore
244	LHR244	Lahore Fiber Pvt Ltd	172.50	Lahore
245	LHR245	Metro Foods Pvt Ltd	118.35	Lahore
246	LHR246	Canal Packaging Ltd	192.10	Lahore
247	LHR247	Punjab Cement Pvt Ltd	140.75	Lahore
248	LHR248	City Builders Ltd	158.25	Lahore
249	LHR249	Royal Auto Pvt Ltd	132.50	Lahore
250	LHR250	Lahore Digital Ltd	145.60	Lahore
251	LHR251	Metro Chemicals Pvt Ltd	172.25	Lahore
252	LHR252	Canal Energy Pvt Ltd	118.75	Lahore
253	LHR253	Punjab Foods Ltd	192.60	Lahore
254	LHR254	City Cement Ltd	140.25	Lahore
255	LHR255	Royal Packaging Pvt Ltd	158.90	Lahore
256	LHR256	Lahore Marble Pvt Ltd	132.50	Lahore
257	LHR257	Metro Builders Ltd	145.25	Lahore
258	LHR258	Canal Auto Pvt Ltd	172.50	Lahore
259	LHR259	Punjab Digital Ltd	118.35	Lahore
260	LHR260	City Foods Pvt Ltd	192.10	Lahore
261	LHR261	Royal Energy Pvt Ltd	140.75	Lahore
262	LHR262	Lahore Cement Pvt Ltd	158.25	Lahore
263	LHR263	Metro Packaging Ltd	132.50	Lahore
264	LHR264	Canal Builders Pvt Ltd	145.60	Lahore
265	LHR265	Punjab Chemicals Pvt Ltd	172.25	Lahore
266	LHR266	City Auto Ltd	118.75	Lahore
267	LHR267	Royal Foods Pvt Ltd	192.60	Lahore
268	LHR268	Lahore Digital Pvt Ltd	140.25	Lahore
269	LHR269	Metro Fiber Pvt Ltd	158.90	Lahore
270	LHR270	Canal Cement Pvt Ltd	132.50	Lahore
271	LHR271	Punjab Marble Pvt Ltd	145.25	Lahore
272	LHR272	City Builders Pvt Ltd	172.50	Lahore
273	LHR273	Royal Chemicals Pvt Ltd	118.35	Lahore
274	LHR274	Lahore Auto Pvt Ltd	192.10	Lahore
275	LHR275	Metro Digital Pvt Ltd	140.75	Lahore
276	LHR276	Canal Foods Pvt Ltd	158.25	Lahore
277	LHR277	Punjab Energy Pvt Ltd	132.50	Lahore
278	LHR278	City Cement Pvt Ltd	145.60	Lahore
279	LHR279	Royal Builders Pvt Ltd	172.25	Lahore
280	LHR280	Lahore Dairy Pvt Ltd	118.75	Lahore
281	LHR281	Metro Digital Ltd	192.60	Lahore
282	LHR282	Canal Foods Ltd	140.25	Lahore
283	LHR283	Punjab Steel Pvt Ltd	158.90	Lahore
284	LHR284	City Energy Ltd	132.50	Lahore
285	LHR285	Royal Builders Pvt Ltd	145.25	Lahore
286	LHR286	Lahore Chemicals Ltd	172.50	Lahore
287	LHR287	Metro Marble Works	118.35	Lahore
288	LHR288	Canal Agro Industries	192.10	Lahore
289	LHR289	Punjab Digital Ltd	140.75	Lahore
290	LHR290	City Builders Pvt Ltd	158.25	Lahore
291	LHR291	Royal Cement Works	132.50	Lahore
292	LHR292	Lahore Auto Pvt Ltd	145.60	Lahore
293	LHR293	Metro Fiber Works	172.25	Lahore
294	LHR294	Canal Foods Pvt Ltd	118.75	Lahore
295	LHR295	Punjab Steel Works	192.60	Lahore
296	LHR296	City Auto Pvt Ltd	140.25	Lahore
297	LHR297	Royal Energy Ltd	158.90	Lahore
298	LHR298	Lahore Packaging Pvt Ltd	132.50	Lahore
299	LHR299	Metro Builders Pvt Ltd	145.25	Lahore
300	LHR300	Canal Digital Pvt Ltd	172.50	Lahore
301	LHR301	Punjab Foods Pvt Ltd	118.35	Lahore
302	LHR302	City Chemicals Pvt Ltd	192.10	Lahore
303	LHR303	Royal Marble Pvt Ltd	140.75	Lahore
304	LHR304	Lahore Fiber Pvt Ltd	158.25	Lahore
305	LHR305	Metro Foods Pvt Ltd	132.50	Lahore
306	LHR306	Canal Packaging Ltd	145.60	Lahore
307	LHR307	Punjab Cement Pvt Ltd	172.25	Lahore
308	LHR308	City Builders Ltd	118.75	Lahore
309	LHR309	Royal Auto Pvt Ltd	192.60	Lahore
310	LHR310	Lahore Digital Ltd	140.25	Lahore
311	LHR311	Metro Chemicals Pvt Ltd	158.90	Lahore
312	LHR312	Canal Energy Pvt Ltd	132.50	Lahore
313	LHR313	Punjab Foods Ltd	145.25	Lahore
314	LHR314	City Cement Ltd	172.50	Lahore
315	LHR315	Royal Packaging Pvt Ltd	118.35	Lahore
316	LHR316	Lahore Marble Pvt Ltd	192.10	Lahore
317	LHR317	Metro Builders Pvt Ltd	140.75	Lahore
318	LHR318	Canal Auto Pvt Ltd	158.25	Lahore
319	LHR319	Punjab Digital Ltd	132.50	Lahore
320	LHR320	City Foods Pvt Ltd	145.60	Lahore
321	LHR321	Royal Energy Pvt Ltd	172.25	Lahore
322	LHR322	Lahore Cement Pvt Ltd	118.75	Lahore
323	LHR323	Metro Packaging Ltd	192.60	Lahore
324	LHR324	Canal Builders Pvt Ltd	140.25	Lahore
325	LHR325	Punjab Chemicals Pvt Ltd	158.90	Lahore
326	LHR326	City Auto Ltd	132.50	Lahore
327	LHR327	Royal Foods Pvt Ltd	145.25	Lahore
328	LHR328	Lahore Digital Pvt Ltd	172.50	Lahore
329	LHR329	Metro Fiber Pvt Ltd	118.35	Lahore
330	LHR330	Canal Cement Pvt Ltd	192.10	Lahore
331	LHR331	Punjab Marble Pvt Ltd	140.75	Lahore
332	LHR332	City Builders Pvt Ltd	158.25	Lahore
333	LHR333	Royal Chemicals Pvt Ltd	132.50	Lahore
334	LHR334	Lahore Auto Pvt Ltd	145.60	Lahore
335	LHR335	Metro Digital Ltd	172.25	Lahore
336	LHR336	Canal Foods Pvt Ltd	118.75	Lahore
337	LHR337	Punjab Steel Pvt Ltd	192.60	Lahore
338	LHR338	City Auto Pvt Ltd	140.25	Lahore
339	LHR339	Royal Energy Ltd	158.90	Lahore
340	LHR340	Lahore Packaging Pvt Ltd	132.50	Lahore
341	LHR341	Metro Builders Pvt Ltd	145.25	Lahore
342	LHR342	Canal Digital Pvt Ltd	172.50	Lahore
343	LHR343	Punjab Foods Pvt Ltd	118.35	Lahore
344	LHR344	City Chemicals Pvt Ltd	192.10	Lahore
345	LHR345	Royal Marble Pvt Ltd	140.75	Lahore
346	LHR346	Lahore Fiber Pvt Ltd	158.25	Lahore
347	LHR347	Metro Foods Pvt Ltd	132.50	Lahore
348	LHR348	Canal Packaging Ltd	145.60	Lahore
349	LHR349	Punjab Cement Pvt Ltd	172.25	Lahore
350	LHR350	City Builders Ltd	118.75	Lahore
351	LHR351	Royal Auto Pvt Ltd	192.60	Lahore
352	LHR352	Lahore Digital Ltd	140.25	Lahore
353	LHR353	Metro Chemicals Pvt Ltd	158.90	Lahore
354	LHR354	Canal Energy Pvt Ltd	132.50	Lahore
355	LHR355	Punjab Foods Ltd	145.25	Lahore
356	LHR356	City Cement Ltd	172.50	Lahore
357	LHR357	Royal Packaging Pvt Ltd	118.35	Lahore
358	LHR358	Lahore Marble Pvt Ltd	192.10	Lahore
359	LHR359	Metro Builders Pvt Ltd	140.75	Lahore
360	LHR360	Canal Auto Pvt Ltd	158.25	Lahore
361	LHR361	Punjab Digital Ltd	132.50	Lahore
362	LHR362	City Foods Pvt Ltd	145.60	Lahore
363	LHR363	Royal Energy Pvt Ltd	172.25	Lahore
364	LHR364	Lahore Cement Pvt Ltd	118.75	Lahore
365	LHR365	Metro Packaging Ltd	192.60	Lahore
366	LHR366	Canal Builders Pvt Ltd	140.25	Lahore
367	LHR367	Punjab Chemicals Pvt Ltd	158.90	Lahore
368	LHR368	City Auto Ltd	132.50	Lahore
369	LHR369	Royal Foods Pvt Ltd	145.25	Lahore
370	LHR370	Lahore Digital Pvt Ltd	172.50	Lahore
371	LHR371	Metro Fiber Pvt Ltd	118.35	Lahore
372	LHR372	Canal Cement Pvt Ltd	192.10	Lahore
373	LHR373	Punjab Marble Pvt Ltd	140.75	Lahore
374	LHR374	City Builders Pvt Ltd	158.25	Lahore
375	LHR375	Royal Chemicals Pvt Ltd	132.50	Lahore
376	LHR376	Lahore Auto Pvt Ltd	145.60	Lahore
377	LHR377	Metro Digital Ltd	172.25	Lahore
378	LHR378	Canal Foods Pvt Ltd	118.75	Lahore
379	LHR379	Punjab Steel Pvt Ltd	192.60	Lahore
380	LHR380	City Auto Pvt Ltd	140.25	Lahore
381	LHR381	Royal Energy Ltd	158.90	Lahore
382	LHR382	Lahore Packaging Pvt Ltd	132.50	Lahore
383	LHR383	Metro Builders Pvt Ltd	145.25	Lahore
384	LHR384	Canal Digital Pvt Ltd	172.50	Lahore
385	LHR385	Punjab Foods Pvt Ltd	118.35	Lahore
386	LHR386	City Chemicals Pvt Ltd	192.10	Lahore
387	LHR387	Royal Marble Pvt Ltd	140.75	Lahore
388	LHR388	Lahore Fiber Pvt Ltd	158.25	Lahore
389	LHR389	Metro Foods Pvt Ltd	132.50	Lahore
390	LHR390	Canal Packaging Ltd	145.60	Lahore
391	LHR391	Punjab Cement Pvt Ltd	172.25	Lahore
392	LHR392	City Builders Ltd	118.75	Lahore
393	LHR393	Royal Auto Pvt Ltd	192.60	Lahore
394	LHR394	Lahore Digital Ltd	140.25	Lahore
395	LHR395	Metro Chemicals Pvt Ltd	158.90	Lahore
396	LHR396	Canal Energy Pvt Ltd	132.50	Lahore
397	LHR397	Punjab Foods Ltd	145.25	Lahore
398	LHR398	City Cement Ltd	172.50	Lahore
399	LHR399	Royal Packaging Pvt Ltd	118.35	Lahore
400	LHR400	Lahore Marble Pvt Ltd	192.10	Lahore
401	LHR401	Metro Builders Pvt Ltd	140.75	Lahore
402	LHR402	Canal Auto Pvt Ltd	158.25	Lahore
403	LHR403	Punjab Digital Ltd	132.50	Lahore
404	LHR404	City Foods Pvt Ltd	145.60	Lahore
405	LHR405	Royal Energy Pvt Ltd	172.25	Lahore
406	LHR406	Lahore Cement Pvt Ltd	118.75	Lahore
407	LHR407	Metro Packaging Ltd	192.60	Lahore
408	LHR408	Canal Builders Pvt Ltd	140.25	Lahore
409	LHR409	Punjab Chemicals Pvt Ltd	158.90	Lahore
410	LHR410	City Auto Ltd	132.50	Lahore
411	LHR411	Royal Foods Pvt Ltd	145.25	Lahore
412	LHR412	Lahore Digital Pvt Ltd	172.50	Lahore
413	LHR413	Metro Fiber Pvt Ltd	118.35	Lahore
414	LHR414	Canal Cement Pvt Ltd	192.10	Lahore
415	LHR415	Punjab Marble Pvt Ltd	140.75	Lahore
416	LHR416	City Builders Pvt Ltd	158.25	Lahore
417	LHR417	Royal Chemicals Pvt Ltd	132.50	Lahore
418	LHR418	Lahore Auto Pvt Ltd	145.60	Lahore
419	LHR419	Metro Digital Ltd	172.25	Lahore
420	LHR420	Canal Foods Pvt Ltd	118.75	Lahore
421	LHR421	Punjab Steel Pvt Ltd	192.60	Lahore
422	LHR422	City Auto Pvt Ltd	140.25	Lahore
423	LHR423	Royal Energy Ltd	158.90	Lahore
424	LHR424	Lahore Packaging Pvt Ltd	132.50	Lahore
425	LHR425	Metro Builders Pvt Ltd	145.25	Lahore
426	LHR426	Canal Digital Pvt Ltd	172.50	Lahore
427	LHR427	Punjab Foods Pvt Ltd	118.35	Lahore
428	LHR428	City Chemicals Pvt Ltd	192.10	Lahore
429	LHR429	Royal Marble Pvt Ltd	140.75	Lahore
430	LHR430	Lahore Fiber Pvt Ltd	158.25	Lahore
431	LHR431	Metro Foods Pvt Ltd	132.50	Lahore
432	LHR432	Canal Packaging Ltd	145.60	Lahore
433	LHR433	Punjab Cement Pvt Ltd	172.25	Lahore
434	LHR434	City Builders Ltd	118.75	Lahore
435	LHR435	Royal Auto Pvt Ltd	192.60	Lahore
436	LHR436	Lahore Digital Ltd	140.25	Lahore
437	LHR437	Metro Chemicals Pvt Ltd	158.90	Lahore
438	LHR438	Canal Energy Pvt Ltd	132.50	Lahore
439	LHR439	Punjab Foods Ltd	145.25	Lahore
440	LHR440	City Cement Ltd	172.50	Lahore
441	LHR441	Royal Packaging Pvt Ltd	118.35	Lahore
442	LHR442	Lahore Marble Pvt Ltd	192.10	Lahore
443	LHR443	Metro Builders Pvt Ltd	140.75	Lahore
444	LHR444	Canal Auto Pvt Ltd	158.25	Lahore
445	LHR445	Punjab Digital Ltd	132.50	Lahore
446	LHR446	City Foods Pvt Ltd	145.60	Lahore
447	LHR447	Royal Energy Pvt Ltd	172.25	Lahore
448	LHR448	Lahore Cement Pvt Ltd	118.75	Lahore
449	LHR449	Metro Packaging Ltd	192.60	Lahore
450	LHR450	Canal Builders Pvt Ltd	140.25	Lahore
451	LHR451	Punjab Chemicals Pvt Ltd	158.90	Lahore
452	LHR452	City Auto Ltd	132.50	Lahore
453	LHR453	Royal Foods Pvt Ltd	145.25	Lahore
454	LHR454	Lahore Digital Pvt Ltd	172.50	Lahore
455	LHR455	Metro Fiber Pvt Ltd	118.35	Lahore
456	LHR456	Canal Cement Pvt Ltd	192.10	Lahore
457	LHR457	Punjab Marble Pvt Ltd	140.75	Lahore
458	LHR458	City Builders Pvt Ltd	158.25	Lahore
459	LHR459	Royal Chemicals Pvt Ltd	132.50	Lahore
460	LHR460	Lahore Auto Pvt Ltd	145.60	Lahore
461	LHR461	Metro Digital Ltd	172.25	Lahore
462	LHR462	Canal Foods Pvt Ltd	118.75	Lahore
463	LHR463	Punjab Steel Pvt Ltd	192.60	Lahore
464	LHR464	City Auto Pvt Ltd	140.25	Lahore
465	LHR465	Royal Energy Ltd	158.90	Lahore
466	LHR466	Lahore Packaging Pvt Ltd	132.50	Lahore
467	LHR467	Metro Builders Pvt Ltd	145.25	Lahore
468	LHR468	Canal Digital Pvt Ltd	172.50	Lahore
469	LHR469	Punjab Foods Pvt Ltd	118.35	Lahore
470	LHR470	City Chemicals Pvt Ltd	192.10	Lahore
471	LHR471	Royal Marble Pvt Ltd	140.75	Lahore
472	LHR472	Lahore Fiber Pvt Ltd	158.25	Lahore
473	LHR473	Metro Foods Pvt Ltd	132.50	Lahore
474	LHR474	Canal Packaging Ltd	145.60	Lahore
475	LHR475	Punjab Cement Pvt Ltd	172.25	Lahore
476	LHR476	City Builders Ltd	118.75	Lahore
477	LHR477	Royal Auto Pvt Ltd	192.60	Lahore
478	LHR478	Lahore Digital Ltd	140.25	Lahore
479	LHR479	Metro Chemicals Pvt Ltd	158.90	Lahore
480	LHR480	Canal Energy Pvt Ltd	132.50	Lahore
481	LHR481	Punjab Foods Ltd	145.25	Lahore
482	LHR482	City Cement Ltd	172.50	Lahore
483	LHR483	Royal Packaging Pvt Ltd	118.35	Lahore
484	LHR484	Lahore Marble Pvt Ltd	192.10	Lahore
485	LHR485	Metro Builders Pvt Ltd	140.75	Lahore
486	LHR486	Canal Auto Pvt Ltd	158.25	Lahore
487	LHR487	Punjab Digital Ltd	132.50	Lahore
488	LHR488	City Foods Pvt Ltd	145.60	Lahore
489	LHR489	Royal Energy Pvt Ltd	172.25	Lahore
490	LHR490	Lahore Cement Pvt Ltd	118.75	Lahore
491	LHR491	Metro Packaging Ltd	192.60	Lahore
492	LHR492	Canal Builders Pvt Ltd	140.25	Lahore
493	LHR493	Punjab Chemicals Pvt Ltd	158.90	Lahore
494	LHR494	City Auto Ltd	132.50	Lahore
495	LHR495	Royal Foods Pvt Ltd	145.25	Lahore
496	LHR496	Lahore Digital Pvt Ltd	172.50	Lahore
497	LHR497	Metro Fiber Pvt Ltd	118.35	Lahore
498	LHR498	Canal Cement Pvt Ltd	192.10	Lahore
499	LHR499	Punjab Marble Pvt Ltd	140.75	Lahore
500	LHR500	City Builders Pvt Ltd	158.25	Lahore
\.


--
-- Data for Name: trades; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trades (trade_id, stock_id, quantity, trade_type, trade_time) FROM stdin;
1	1	300	buy	2025-10-23 14:11:34.76071
2	2	450	sell	2025-10-23 14:11:34.76071
3	3	250	buy	2025-10-23 14:11:34.76071
4	4	150	sell	2025-10-26 10:10:25.355668
5	5	250	buy	2025-10-26 10:10:25.355668
6	6	400	buy	2025-10-26 10:10:25.355668
7	7	350	sell	2025-10-26 10:10:25.355668
8	8	500	buy	2025-10-26 10:10:25.355668
9	9	200	sell	2025-10-26 10:10:25.355668
10	10	600	buy	2025-10-26 10:10:25.355668
11	11	150	sell	2025-10-26 10:10:25.355668
12	12	700	buy	2025-10-26 10:10:25.355668
13	13	500	buy	2025-10-26 10:10:25.355668
14	14	300	sell	2025-10-26 10:10:25.355668
15	15	250	buy	2025-10-26 10:10:25.355668
16	16	150	sell	2025-10-26 10:10:25.355668
17	17	400	buy	2025-10-26 10:10:25.355668
18	18	600	buy	2025-10-26 10:10:25.355668
19	19	100	sell	2025-10-26 10:10:25.355668
20	20	200	buy	2025-10-26 10:10:25.355668
21	21	300	sell	2025-10-26 10:10:25.355668
22	22	350	buy	2025-10-26 10:10:25.355668
23	23	450	sell	2025-10-26 10:10:25.355668
24	24	500	buy	2025-10-26 10:10:25.355668
25	25	700	buy	2025-10-26 10:10:25.355668
26	26	300	sell	2025-10-26 10:10:25.355668
27	27	250	buy	2025-10-26 10:10:25.355668
28	28	200	sell	2025-10-26 10:10:25.355668
29	29	600	buy	2025-10-26 10:10:25.355668
30	30	350	sell	2025-10-26 10:10:25.355668
31	31	400	buy	2025-10-26 10:10:25.355668
32	32	200	buy	2025-10-26 10:10:25.355668
33	33	150	sell	2025-10-26 10:10:25.355668
34	34	500	buy	2025-10-26 10:10:25.355668
35	35	700	buy	2025-10-26 10:10:25.355668
36	36	250	sell	2025-10-26 10:10:25.355668
37	37	300	buy	2025-10-26 10:10:25.355668
38	38	150	sell	2025-10-26 10:10:25.355668
39	39	400	buy	2025-10-26 10:10:25.355668
40	40	250	sell	2025-10-26 10:10:25.355668
41	41	500	buy	2025-10-26 10:10:25.355668
42	42	350	sell	2025-10-26 10:10:25.355668
43	43	600	buy	2025-10-26 10:10:25.355668
44	44	150	sell	2025-10-26 10:10:25.355668
45	45	250	buy	2025-10-26 10:10:25.355668
46	46	500	buy	2025-10-26 10:10:25.355668
47	47	300	sell	2025-10-26 10:10:25.355668
48	48	400	buy	2025-10-26 10:10:25.355668
49	49	200	sell	2025-10-26 10:10:25.355668
50	50	450	buy	2025-10-26 10:10:25.355668
501	51	245	buy	2025-10-26 23:34:37.061229
502	52	680	sell	2025-10-26 23:34:37.061229
503	53	510	buy	2025-10-26 23:34:37.061229
504	54	120	sell	2025-10-26 23:34:37.061229
505	55	755	buy	2025-10-26 23:34:37.061229
506	56	430	sell	2025-10-26 23:34:37.061229
507	57	600	buy	2025-10-26 23:34:37.061229
508	58	310	sell	2025-10-26 23:34:37.061229
509	59	490	buy	2025-10-26 23:34:37.061229
510	60	720	sell	2025-10-26 23:34:37.061229
511	61	355	buy	2025-10-26 23:34:37.061229
512	62	180	sell	2025-10-26 23:34:37.061229
513	63	640	buy	2025-10-26 23:34:37.061229
514	64	275	sell	2025-10-26 23:34:37.061229
515	65	510	buy	2025-10-26 23:34:37.061229
516	66	395	sell	2025-10-26 23:34:37.061229
517	67	460	buy	2025-10-26 23:34:37.061229
518	68	225	sell	2025-10-26 23:34:37.061229
519	69	375	buy	2025-10-26 23:34:37.061229
520	70	540	sell	2025-10-26 23:34:37.061229
521	71	310	buy	2025-10-26 23:34:37.061229
522	72	285	sell	2025-10-26 23:34:37.061229
523	73	495	buy	2025-10-26 23:34:37.061229
524	74	675	sell	2025-10-26 23:34:37.061229
525	75	360	buy	2025-10-26 23:34:37.061229
526	76	410	sell	2025-10-26 23:34:37.061229
527	77	290	buy	2025-10-26 23:34:37.061229
528	78	580	sell	2025-10-26 23:34:37.061229
529	79	430	buy	2025-10-26 23:34:37.061229
530	80	150	sell	2025-10-26 23:34:37.061229
531	81	395	buy	2025-10-26 23:34:37.061229
532	82	720	sell	2025-10-26 23:34:37.061229
533	83	280	buy	2025-10-26 23:34:37.061229
534	84	610	sell	2025-10-26 23:34:37.061229
535	85	335	buy	2025-10-26 23:34:37.061229
536	86	475	sell	2025-10-26 23:34:37.061229
537	87	560	buy	2025-10-26 23:34:37.061229
538	88	215	sell	2025-10-26 23:34:37.061229
539	89	420	buy	2025-10-26 23:34:37.061229
540	90	680	sell	2025-10-26 23:34:37.061229
541	91	350	buy	2025-10-26 23:34:37.061229
542	92	180	sell	2025-10-26 23:34:37.061229
543	93	490	buy	2025-10-26 23:34:37.061229
544	94	590	sell	2025-10-26 23:34:37.061229
545	95	265	buy	2025-10-26 23:34:37.061229
546	96	430	sell	2025-10-26 23:34:37.061229
547	97	375	buy	2025-10-26 23:34:37.061229
548	98	720	sell	2025-10-26 23:34:37.061229
549	99	310	buy	2025-10-26 23:34:37.061229
550	100	285	sell	2025-10-26 23:34:37.061229
551	101	495	buy	2025-10-26 23:34:37.061229
552	102	675	sell	2025-10-26 23:34:37.061229
553	103	360	buy	2025-10-26 23:34:37.061229
554	104	410	sell	2025-10-26 23:34:37.061229
555	105	290	buy	2025-10-26 23:34:37.061229
556	106	580	sell	2025-10-26 23:34:37.061229
557	107	430	buy	2025-10-26 23:34:37.061229
558	108	150	sell	2025-10-26 23:34:37.061229
559	109	395	buy	2025-10-26 23:34:37.061229
560	110	720	sell	2025-10-26 23:34:37.061229
561	111	280	buy	2025-10-26 23:34:37.061229
562	112	610	sell	2025-10-26 23:34:37.061229
563	113	335	buy	2025-10-26 23:34:37.061229
564	114	475	sell	2025-10-26 23:34:37.061229
565	115	560	buy	2025-10-26 23:34:37.061229
566	116	215	sell	2025-10-26 23:34:37.061229
567	117	420	buy	2025-10-26 23:34:37.061229
568	118	680	sell	2025-10-26 23:34:37.061229
569	119	350	buy	2025-10-26 23:34:37.061229
570	120	180	sell	2025-10-26 23:34:37.061229
571	121	490	buy	2025-10-26 23:34:37.061229
572	122	590	sell	2025-10-26 23:34:37.061229
573	123	265	buy	2025-10-26 23:34:37.061229
574	124	430	sell	2025-10-26 23:34:37.061229
575	125	375	buy	2025-10-26 23:34:37.061229
576	126	720	sell	2025-10-26 23:34:37.061229
577	127	310	buy	2025-10-26 23:34:37.061229
578	128	285	sell	2025-10-26 23:34:37.061229
579	129	495	buy	2025-10-26 23:34:37.061229
580	130	675	sell	2025-10-26 23:34:37.061229
581	131	360	buy	2025-10-26 23:34:37.061229
582	132	410	sell	2025-10-26 23:34:37.061229
583	133	290	buy	2025-10-26 23:34:37.061229
584	134	580	sell	2025-10-26 23:34:37.061229
585	135	430	buy	2025-10-26 23:34:37.061229
586	136	150	sell	2025-10-26 23:34:37.061229
587	137	395	buy	2025-10-26 23:34:37.061229
588	138	720	sell	2025-10-26 23:34:37.061229
589	139	280	buy	2025-10-26 23:34:37.061229
590	140	610	sell	2025-10-26 23:34:37.061229
591	141	355	buy	2025-10-26 23:34:37.061229
592	142	420	sell	2025-10-26 23:34:37.061229
593	143	290	buy	2025-10-26 23:34:37.061229
594	144	610	sell	2025-10-26 23:34:37.061229
595	145	375	buy	2025-10-26 23:34:37.061229
596	146	495	sell	2025-10-26 23:34:37.061229
597	147	265	buy	2025-10-26 23:34:37.061229
598	148	580	sell	2025-10-26 23:34:37.061229
599	149	430	buy	2025-10-26 23:34:37.061229
600	150	150	sell	2025-10-26 23:34:37.061229
601	151	395	buy	2025-10-26 23:34:37.061229
602	152	720	sell	2025-10-26 23:34:37.061229
603	153	280	buy	2025-10-26 23:34:37.061229
604	154	610	sell	2025-10-26 23:34:37.061229
605	155	335	buy	2025-10-26 23:34:37.061229
606	156	475	sell	2025-10-26 23:34:37.061229
607	157	560	buy	2025-10-26 23:34:37.061229
608	158	215	sell	2025-10-26 23:34:37.061229
609	159	420	buy	2025-10-26 23:34:37.061229
610	160	680	sell	2025-10-26 23:34:37.061229
611	161	350	buy	2025-10-26 23:34:37.061229
612	162	180	sell	2025-10-26 23:34:37.061229
613	163	490	buy	2025-10-26 23:34:37.061229
614	164	590	sell	2025-10-26 23:34:37.061229
615	165	265	buy	2025-10-26 23:34:37.061229
616	166	430	sell	2025-10-26 23:34:37.061229
617	167	375	buy	2025-10-26 23:34:37.061229
618	168	720	sell	2025-10-26 23:34:37.061229
619	169	310	buy	2025-10-26 23:34:37.061229
620	170	285	sell	2025-10-26 23:34:37.061229
621	171	495	buy	2025-10-26 23:34:37.061229
622	172	675	sell	2025-10-26 23:34:37.061229
623	173	360	buy	2025-10-26 23:34:37.061229
624	174	410	sell	2025-10-26 23:34:37.061229
625	175	290	buy	2025-10-26 23:34:37.061229
626	176	580	sell	2025-10-26 23:34:37.061229
627	177	430	buy	2025-10-26 23:34:37.061229
628	178	150	sell	2025-10-26 23:34:37.061229
629	179	395	buy	2025-10-26 23:34:37.061229
630	180	720	sell	2025-10-26 23:34:37.061229
631	181	280	buy	2025-10-26 23:34:37.061229
632	182	610	sell	2025-10-26 23:34:37.061229
633	183	335	buy	2025-10-26 23:34:37.061229
634	184	475	sell	2025-10-26 23:34:37.061229
635	185	560	buy	2025-10-26 23:34:37.061229
636	186	215	sell	2025-10-26 23:34:37.061229
637	187	420	buy	2025-10-26 23:34:37.061229
638	188	680	sell	2025-10-26 23:34:37.061229
639	189	350	buy	2025-10-26 23:34:37.061229
640	190	180	sell	2025-10-26 23:34:37.061229
641	191	490	buy	2025-10-26 23:34:37.061229
642	192	590	sell	2025-10-26 23:34:37.061229
643	193	265	buy	2025-10-26 23:34:37.061229
644	194	430	sell	2025-10-26 23:34:37.061229
645	195	375	buy	2025-10-26 23:34:37.061229
646	196	720	sell	2025-10-26 23:34:37.061229
647	197	310	buy	2025-10-26 23:34:37.061229
648	198	285	sell	2025-10-26 23:34:37.061229
649	199	495	buy	2025-10-26 23:34:37.061229
650	200	675	sell	2025-10-26 23:34:37.061229
651	201	360	buy	2025-10-26 23:34:37.061229
652	202	410	sell	2025-10-26 23:34:37.061229
653	203	290	buy	2025-10-26 23:34:37.061229
654	204	580	sell	2025-10-26 23:34:37.061229
655	205	430	buy	2025-10-26 23:34:37.061229
656	206	150	sell	2025-10-26 23:34:37.061229
657	207	395	buy	2025-10-26 23:34:37.061229
658	208	720	sell	2025-10-26 23:34:37.061229
659	209	280	buy	2025-10-26 23:34:37.061229
660	210	610	sell	2025-10-26 23:34:37.061229
661	211	335	buy	2025-10-26 23:34:37.061229
662	212	475	sell	2025-10-26 23:34:37.061229
663	213	560	buy	2025-10-26 23:34:37.061229
664	214	215	sell	2025-10-26 23:34:37.061229
665	215	420	buy	2025-10-26 23:34:37.061229
666	216	680	sell	2025-10-26 23:34:37.061229
667	217	350	buy	2025-10-26 23:34:37.061229
668	218	180	sell	2025-10-26 23:34:37.061229
669	219	490	buy	2025-10-26 23:34:37.061229
670	220	590	sell	2025-10-26 23:34:37.061229
671	221	265	buy	2025-10-26 23:34:37.061229
672	222	430	sell	2025-10-26 23:34:37.061229
673	223	375	buy	2025-10-26 23:34:37.061229
674	224	720	sell	2025-10-26 23:34:37.061229
675	225	310	buy	2025-10-26 23:34:37.061229
676	226	285	sell	2025-10-26 23:34:37.061229
677	227	495	buy	2025-10-26 23:34:37.061229
678	228	675	sell	2025-10-26 23:34:37.061229
679	229	360	buy	2025-10-26 23:34:37.061229
680	230	410	sell	2025-10-26 23:34:37.061229
681	231	295	buy	2025-10-26 23:34:37.061229
682	232	480	sell	2025-10-26 23:34:37.061229
683	233	360	buy	2025-10-26 23:34:37.061229
684	234	710	sell	2025-10-26 23:34:37.061229
685	235	425	buy	2025-10-26 23:34:37.061229
686	236	550	sell	2025-10-26 23:34:37.061229
687	237	310	buy	2025-10-26 23:34:37.061229
688	238	675	sell	2025-10-26 23:34:37.061229
689	239	395	buy	2025-10-26 23:34:37.061229
690	240	560	sell	2025-10-26 23:34:37.061229
691	241	215	buy	2025-10-26 23:34:37.061229
692	242	480	sell	2025-10-26 23:34:37.061229
693	243	330	buy	2025-10-26 23:34:37.061229
694	244	610	sell	2025-10-26 23:34:37.061229
695	245	445	buy	2025-10-26 23:34:37.061229
696	246	295	sell	2025-10-26 23:34:37.061229
697	247	380	buy	2025-10-26 23:34:37.061229
698	248	720	sell	2025-10-26 23:34:37.061229
699	249	410	buy	2025-10-26 23:34:37.061229
700	250	250	sell	2025-10-26 23:34:37.061229
701	251	535	buy	2025-10-26 23:34:37.061229
702	252	690	sell	2025-10-26 23:34:37.061229
703	253	275	buy	2025-10-26 23:34:37.061229
704	254	480	sell	2025-10-26 23:34:37.061229
705	255	395	buy	2025-10-26 23:34:37.061229
706	256	610	sell	2025-10-26 23:34:37.061229
707	257	360	buy	2025-10-26 23:34:37.061229
708	258	540	sell	2025-10-26 23:34:37.061229
709	259	285	buy	2025-10-26 23:34:37.061229
710	260	430	sell	2025-10-26 23:34:37.061229
711	261	310	buy	2025-10-26 23:34:37.061229
712	262	720	sell	2025-10-26 23:34:37.061229
713	263	495	buy	2025-10-26 23:34:37.061229
714	264	180	sell	2025-10-26 23:34:37.061229
715	265	375	buy	2025-10-26 23:34:37.061229
716	266	680	sell	2025-10-26 23:34:37.061229
717	267	345	buy	2025-10-26 23:34:37.061229
718	268	590	sell	2025-10-26 23:34:37.061229
719	269	410	buy	2025-10-26 23:34:37.061229
720	270	220	sell	2025-10-26 23:34:37.061229
721	271	365	buy	2025-10-26 23:34:37.061229
722	272	550	sell	2025-10-26 23:34:37.061229
723	273	285	buy	2025-10-26 23:34:37.061229
724	274	610	sell	2025-10-26 23:34:37.061229
725	275	375	buy	2025-10-26 23:34:37.061229
726	276	420	sell	2025-10-26 23:34:37.061229
727	277	295	buy	2025-10-26 23:34:37.061229
728	278	680	sell	2025-10-26 23:34:37.061229
729	279	345	buy	2025-10-26 23:34:37.061229
730	280	490	sell	2025-10-26 23:34:37.061229
731	281	310	buy	2025-10-26 23:34:37.061229
732	282	585	sell	2025-10-26 23:34:37.061229
733	283	405	buy	2025-10-26 23:34:37.061229
734	284	230	sell	2025-10-26 23:34:37.061229
735	285	360	buy	2025-10-26 23:34:37.061229
736	286	700	sell	2025-10-26 23:34:37.061229
737	287	280	buy	2025-10-26 23:34:37.061229
738	288	520	sell	2025-10-26 23:34:37.061229
739	289	375	buy	2025-10-26 23:34:37.061229
740	290	640	sell	2025-10-26 23:34:37.061229
741	291	310	buy	2025-10-26 23:34:37.061229
742	292	410	sell	2025-10-26 23:34:37.061229
743	293	495	buy	2025-10-26 23:34:37.061229
744	294	220	sell	2025-10-26 23:34:37.061229
745	295	365	buy	2025-10-26 23:34:37.061229
746	296	580	sell	2025-10-26 23:34:37.061229
747	297	340	buy	2025-10-26 23:34:37.061229
748	298	710	sell	2025-10-26 23:34:37.061229
749	299	375	buy	2025-10-26 23:34:37.061229
750	300	420	sell	2025-10-26 23:34:37.061229
751	301	295	buy	2025-10-26 23:34:37.061229
752	302	640	sell	2025-10-26 23:34:37.061229
753	303	355	buy	2025-10-26 23:34:37.061229
754	304	485	sell	2025-10-26 23:34:37.061229
755	305	410	buy	2025-10-26 23:34:37.061229
756	306	220	sell	2025-10-26 23:34:37.061229
757	307	375	buy	2025-10-26 23:34:37.061229
758	308	700	sell	2025-10-26 23:34:37.061229
759	309	310	buy	2025-10-26 23:34:37.061229
760	310	590	sell	2025-10-26 23:34:37.061229
761	311	365	buy	2025-10-26 23:34:37.061229
762	312	480	sell	2025-10-26 23:34:37.061229
763	313	295	buy	2025-10-26 23:34:37.061229
764	314	720	sell	2025-10-26 23:34:37.061229
765	315	405	buy	2025-10-26 23:34:37.061229
766	316	540	sell	2025-10-26 23:34:37.061229
767	317	335	buy	2025-10-26 23:34:37.061229
768	318	610	sell	2025-10-26 23:34:37.061229
769	319	375	buy	2025-10-26 23:34:37.061229
770	320	430	sell	2025-10-26 23:34:37.061229
771	321	310	buy	2025-10-26 23:34:37.061229
772	322	475	sell	2025-10-26 23:34:37.061229
773	323	360	buy	2025-10-26 23:34:37.061229
774	324	690	sell	2025-10-26 23:34:37.061229
775	325	425	buy	2025-10-26 23:34:37.061229
776	326	550	sell	2025-10-26 23:34:37.061229
777	327	305	buy	2025-10-26 23:34:37.061229
778	328	720	sell	2025-10-26 23:34:37.061229
779	329	395	buy	2025-10-26 23:34:37.061229
780	330	560	sell	2025-10-26 23:34:37.061229
781	331	215	buy	2025-10-26 23:34:37.061229
782	332	480	sell	2025-10-26 23:34:37.061229
783	333	330	buy	2025-10-26 23:34:37.061229
784	334	610	sell	2025-10-26 23:34:37.061229
785	335	445	buy	2025-10-26 23:34:37.061229
786	336	295	sell	2025-10-26 23:34:37.061229
787	337	380	buy	2025-10-26 23:34:37.061229
788	338	720	sell	2025-10-26 23:34:37.061229
789	339	410	buy	2025-10-26 23:34:37.061229
790	340	250	sell	2025-10-26 23:34:37.061229
791	341	535	buy	2025-10-26 23:34:37.061229
792	342	690	sell	2025-10-26 23:34:37.061229
793	343	275	buy	2025-10-26 23:34:37.061229
794	344	480	sell	2025-10-26 23:34:37.061229
795	345	395	buy	2025-10-26 23:34:37.061229
796	346	610	sell	2025-10-26 23:34:37.061229
797	347	360	buy	2025-10-26 23:34:37.061229
798	348	540	sell	2025-10-26 23:34:37.061229
799	349	285	buy	2025-10-26 23:34:37.061229
800	350	430	sell	2025-10-26 23:34:37.061229
801	351	310	buy	2025-10-26 23:34:37.061229
802	352	720	sell	2025-10-26 23:34:37.061229
803	353	495	buy	2025-10-26 23:34:37.061229
804	354	180	sell	2025-10-26 23:34:37.061229
805	355	375	buy	2025-10-26 23:34:37.061229
806	356	680	sell	2025-10-26 23:34:37.061229
807	357	345	buy	2025-10-26 23:34:37.061229
808	358	590	sell	2025-10-26 23:34:37.061229
809	359	410	buy	2025-10-26 23:34:37.061229
810	360	220	sell	2025-10-26 23:34:37.061229
811	361	365	buy	2025-10-26 23:34:37.061229
812	362	550	sell	2025-10-26 23:34:37.061229
813	363	285	buy	2025-10-26 23:34:37.061229
814	364	610	sell	2025-10-26 23:34:37.061229
815	365	375	buy	2025-10-26 23:34:37.061229
816	366	420	sell	2025-10-26 23:34:37.061229
817	367	295	buy	2025-10-26 23:34:37.061229
818	368	680	sell	2025-10-26 23:34:37.061229
819	369	345	buy	2025-10-26 23:34:37.061229
820	370	490	sell	2025-10-26 23:34:37.061229
821	371	310	buy	2025-10-26 23:34:37.061229
822	372	585	sell	2025-10-26 23:34:37.061229
823	373	405	buy	2025-10-26 23:34:37.061229
824	374	230	sell	2025-10-26 23:34:37.061229
825	375	360	buy	2025-10-26 23:34:37.061229
826	376	700	sell	2025-10-26 23:34:37.061229
827	377	280	buy	2025-10-26 23:34:37.061229
828	378	520	sell	2025-10-26 23:34:37.061229
829	379	375	buy	2025-10-26 23:34:37.061229
830	380	640	sell	2025-10-26 23:34:37.061229
831	381	310	buy	2025-10-26 23:34:37.061229
832	382	410	sell	2025-10-26 23:34:37.061229
833	383	495	buy	2025-10-26 23:34:37.061229
834	384	220	sell	2025-10-26 23:34:37.061229
835	385	365	buy	2025-10-26 23:34:37.061229
836	386	580	sell	2025-10-26 23:34:37.061229
837	387	340	buy	2025-10-26 23:34:37.061229
838	388	710	sell	2025-10-26 23:34:37.061229
839	389	375	buy	2025-10-26 23:34:37.061229
840	390	420	sell	2025-10-26 23:34:37.061229
841	391	295	buy	2025-10-26 23:34:37.061229
842	392	640	sell	2025-10-26 23:34:37.061229
843	393	355	buy	2025-10-26 23:34:37.061229
844	394	485	sell	2025-10-26 23:34:37.061229
845	395	410	buy	2025-10-26 23:34:37.061229
846	396	220	sell	2025-10-26 23:34:37.061229
847	397	375	buy	2025-10-26 23:34:37.061229
848	398	700	sell	2025-10-26 23:34:37.061229
849	399	310	buy	2025-10-26 23:34:37.061229
850	400	590	sell	2025-10-26 23:34:37.061229
851	401	365	buy	2025-10-26 23:34:37.061229
852	402	480	sell	2025-10-26 23:34:37.061229
853	403	295	buy	2025-10-26 23:34:37.061229
854	404	720	sell	2025-10-26 23:34:37.061229
855	405	405	buy	2025-10-26 23:34:37.061229
856	406	540	sell	2025-10-26 23:34:37.061229
857	407	335	buy	2025-10-26 23:34:37.061229
858	408	610	sell	2025-10-26 23:34:37.061229
859	409	375	buy	2025-10-26 23:34:37.061229
860	410	430	sell	2025-10-26 23:34:37.061229
861	411	310	buy	2025-10-26 23:34:37.061229
862	412	475	sell	2025-10-26 23:34:37.061229
863	413	360	buy	2025-10-26 23:34:37.061229
864	414	690	sell	2025-10-26 23:34:37.061229
865	415	425	buy	2025-10-26 23:34:37.061229
866	416	550	sell	2025-10-26 23:34:37.061229
867	417	305	buy	2025-10-26 23:34:37.061229
868	418	720	sell	2025-10-26 23:34:37.061229
869	419	395	buy	2025-10-26 23:34:37.061229
870	420	560	sell	2025-10-26 23:34:37.061229
871	421	215	buy	2025-10-26 23:34:37.061229
872	422	480	sell	2025-10-26 23:34:37.061229
873	423	330	buy	2025-10-26 23:34:37.061229
874	424	610	sell	2025-10-26 23:34:37.061229
875	425	445	buy	2025-10-26 23:34:37.061229
876	426	295	sell	2025-10-26 23:34:37.061229
877	427	380	buy	2025-10-26 23:34:37.061229
878	428	720	sell	2025-10-26 23:34:37.061229
879	429	410	buy	2025-10-26 23:34:37.061229
880	430	250	sell	2025-10-26 23:34:37.061229
881	431	535	buy	2025-10-26 23:34:37.061229
882	432	690	sell	2025-10-26 23:34:37.061229
883	433	275	buy	2025-10-26 23:34:37.061229
884	434	480	sell	2025-10-26 23:34:37.061229
885	435	395	buy	2025-10-26 23:34:37.061229
886	436	610	sell	2025-10-26 23:34:37.061229
887	437	360	buy	2025-10-26 23:34:37.061229
888	438	540	sell	2025-10-26 23:34:37.061229
889	439	285	buy	2025-10-26 23:34:37.061229
890	440	430	sell	2025-10-26 23:34:37.061229
891	441	310	buy	2025-10-26 23:34:37.061229
892	442	720	sell	2025-10-26 23:34:37.061229
893	443	495	buy	2025-10-26 23:34:37.061229
894	444	180	sell	2025-10-26 23:34:37.061229
895	445	375	buy	2025-10-26 23:34:37.061229
896	446	680	sell	2025-10-26 23:34:37.061229
897	447	345	buy	2025-10-26 23:34:37.061229
898	448	590	sell	2025-10-26 23:34:37.061229
899	449	410	buy	2025-10-26 23:34:37.061229
900	450	220	sell	2025-10-26 23:34:37.061229
901	451	365	buy	2025-10-26 23:34:37.061229
902	452	550	sell	2025-10-26 23:34:37.061229
903	453	285	buy	2025-10-26 23:34:37.061229
904	454	610	sell	2025-10-26 23:34:37.061229
905	455	375	buy	2025-10-26 23:34:37.061229
906	456	420	sell	2025-10-26 23:34:37.061229
907	457	295	buy	2025-10-26 23:34:37.061229
908	458	680	sell	2025-10-26 23:34:37.061229
909	459	345	buy	2025-10-26 23:34:37.061229
910	460	490	sell	2025-10-26 23:34:37.061229
911	461	310	buy	2025-10-26 23:34:37.061229
912	462	585	sell	2025-10-26 23:34:37.061229
913	463	405	buy	2025-10-26 23:34:37.061229
914	464	230	sell	2025-10-26 23:34:37.061229
915	465	360	buy	2025-10-26 23:34:37.061229
916	466	700	sell	2025-10-26 23:34:37.061229
917	467	280	buy	2025-10-26 23:34:37.061229
918	468	520	sell	2025-10-26 23:34:37.061229
919	469	375	buy	2025-10-26 23:34:37.061229
920	470	640	sell	2025-10-26 23:34:37.061229
921	471	310	buy	2025-10-26 23:34:37.061229
922	472	410	sell	2025-10-26 23:34:37.061229
923	473	495	buy	2025-10-26 23:34:37.061229
924	474	220	sell	2025-10-26 23:34:37.061229
925	475	365	buy	2025-10-26 23:34:37.061229
926	476	580	sell	2025-10-26 23:34:37.061229
927	477	340	buy	2025-10-26 23:34:37.061229
928	478	710	sell	2025-10-26 23:34:37.061229
929	479	375	buy	2025-10-26 23:34:37.061229
930	480	420	sell	2025-10-26 23:34:37.061229
931	481	295	buy	2025-10-26 23:34:37.061229
932	482	640	sell	2025-10-26 23:34:37.061229
933	483	355	buy	2025-10-26 23:34:37.061229
934	484	485	sell	2025-10-26 23:34:37.061229
935	485	410	buy	2025-10-26 23:34:37.061229
936	486	220	sell	2025-10-26 23:34:37.061229
937	487	375	buy	2025-10-26 23:34:37.061229
938	488	700	sell	2025-10-26 23:34:37.061229
939	489	310	buy	2025-10-26 23:34:37.061229
940	490	590	sell	2025-10-26 23:34:37.061229
941	491	365	buy	2025-10-26 23:34:37.061229
942	492	480	sell	2025-10-26 23:34:37.061229
943	493	295	buy	2025-10-26 23:34:37.061229
944	494	720	sell	2025-10-26 23:34:37.061229
945	495	405	buy	2025-10-26 23:34:37.061229
946	496	540	sell	2025-10-26 23:34:37.061229
947	497	335	buy	2025-10-26 23:34:37.061229
948	498	610	sell	2025-10-26 23:34:37.061229
949	499	375	buy	2025-10-26 23:34:37.061229
950	500	430	sell	2025-10-26 23:34:37.061229
\.


--
-- Data for Name: transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transactions (transaction_id, account_id, transaction_type, amount, transaction_time) FROM stdin;
1	1	deposit	25000.00	2025-10-01 09:05:23
2	2	withdraw	7000.00	2025-10-02 13:22:40
3	3	deposit	12000.50	2025-10-02 16:10:10
4	4	deposit	28000.00	2025-10-03 12:11:19
5	5	withdraw	8000.00	2025-10-03 15:40:11
6	6	deposit	35000.00	2025-10-04 09:45:22
7	7	deposit	10000.00	2025-10-04 14:10:31
8	8	withdraw	4000.00	2025-10-05 10:35:55
9	9	deposit	27000.00	2025-10-05 17:20:44
10	10	withdraw	9500.00	2025-10-06 11:30:10
11	11	deposit	33000.00	2025-10-07 13:11:40
12	12	deposit	19500.00	2025-10-07 18:22:25
13	13	withdraw	6000.00	2025-10-08 12:42:10
14	14	deposit	25000.00	2025-10-09 09:55:00
15	15	withdraw	4500.00	2025-10-09 14:45:22
16	16	deposit	18500.00	2025-10-10 11:30:30
17	17	deposit	32000.00	2025-10-11 10:05:15
18	18	withdraw	5000.00	2025-10-11 13:10:44
19	19	deposit	22000.00	2025-10-12 09:45:22
20	20	withdraw	7000.00	2025-10-12 18:25:19
21	21	deposit	19500.00	2025-10-13 14:33:10
22	22	withdraw	3000.00	2025-10-14 09:50:15
23	23	deposit	17500.00	2025-10-15 12:00:00
24	24	deposit	29000.00	2025-10-16 16:22:10
25	25	withdraw	8000.00	2025-10-17 11:19:40
26	26	deposit	20500.00	2025-10-18 10:05:09
27	27	withdraw	4500.00	2025-10-18 17:15:55
28	28	deposit	31000.00	2025-10-19 13:10:22
29	29	deposit	27500.00	2025-10-20 10:35:10
30	30	withdraw	9000.00	2025-10-20 16:55:55
\.


--
-- Name: accounts_account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_account_id_seq', 30, true);


--
-- Name: brokers_broker_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.brokers_broker_id_seq', 50, true);


--
-- Name: investors_investor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.investors_investor_id_seq', 30, true);


--
-- Name: stocks_stock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stocks_stock_id_seq', 500, true);


--
-- Name: trades_trade_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.trades_trade_id_seq', 950, true);


--
-- Name: transactions_transaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transactions_transaction_id_seq', 30, true);


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
-- Name: pub_lahore; Type: PUBLICATION; Schema: -; Owner: postgres
--

CREATE PUBLICATION pub_lahore WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION pub_lahore OWNER TO postgres;

--
-- Name: pub_lahore stocks; Type: PUBLICATION TABLE; Schema: public; Owner: postgres
--

ALTER PUBLICATION pub_lahore ADD TABLE ONLY public.stocks;


--
-- Name: pub_lahore trades; Type: PUBLICATION TABLE; Schema: public; Owner: postgres
--

ALTER PUBLICATION pub_lahore ADD TABLE ONLY public.trades;


--
-- PostgreSQL database dump complete
--

\unrestrict xINFBdpzNRN04GxJVKR6hXgJQyNhV9PuVkeav2bIUhmsMo8szHvwzvULPyrafjB

