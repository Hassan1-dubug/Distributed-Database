--
-- PostgreSQL database dump
--

\restrict d9IptuQU3KkmJ4qiIxAOho2lHtY8TBMpicRskx4wUeisE70MYhwzJgaPJYNDeCZ

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
51	1	850000.50	Active
52	2	325000.00	Inactive
53	3	1275000.75	Active
54	4	450000.20	Active
55	5	985000.00	Suspended
56	6	1120000.00	Active
57	7	705000.40	Active
58	8	375000.00	Inactive
59	9	1325000.60	Active
60	10	920000.00	Active
61	11	615000.00	Inactive
62	12	1460000.00	Active
63	13	835000.50	Suspended
64	14	480000.00	Active
65	15	1210000.00	Active
66	16	395000.25	Inactive
67	17	570000.00	Active
68	18	1400000.50	Active
69	19	360000.00	Inactive
70	20	1550000.00	Active
71	21	950000.25	Active
72	22	430000.00	Suspended
73	23	1225000.50	Active
74	24	625000.00	Inactive
75	25	1170000.00	Active
76	26	780000.25	Active
77	27	1320000.00	Active
78	28	465000.00	Inactive
79	29	1090000.75	Active
80	30	890000.00	Active
81	31	415000.00	Suspended
82	32	1475000.00	Active
83	33	675000.00	Active
84	34	1010000.40	Active
85	35	370000.00	Inactive
86	36	910000.60	Active
87	37	1580000.00	Active
88	38	445000.00	Inactive
89	39	1130000.00	Active
90	40	750000.00	Suspended
91	41	985000.25	Active
92	42	525000.00	Inactive
93	43	1430000.00	Active
94	44	640000.00	Active
95	45	1320000.00	Active
96	46	365000.00	Inactive
97	47	1280000.00	Active
98	48	550000.50	Suspended
99	49	1395000.00	Active
100	50	720000.00	Active
\.


--
-- Data for Name: brokers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.brokers (broker_id, broker_name, branch_city, commission_rate) FROM stdin;
1	Alpha Securities Karachi	Karachi	1.50
2	TrustLine Brokers Karachi	Karachi	1.55
3	Metro Capital Karachi	Karachi	1.60
4	BrightTrade Pakistan	Karachi	1.45
5	Unity Investments Karachi	Karachi	1.65
6	RoyalEdge Securities	Karachi	1.75
7	PakTrade Financials	Karachi	1.80
8	BlueSky Brokers	Karachi	1.70
9	CapitalVest Karachi	Karachi	1.55
10	PrimeBridge Investments	Karachi	1.60
11	SafeTrust Securities	Karachi	1.85
12	WealthMax Karachi	Karachi	1.75
13	GlobalEdge Investments	Karachi	1.65
14	TradeWise Capital	Karachi	1.70
15	BrightLine Brokers	Karachi	1.60
16	RoyalPath Securities	Karachi	1.90
17	NextGen Brokers Karachi	Karachi	1.50
18	SecureVest Capital	Karachi	1.55
19	VertexLine Karachi	Karachi	1.65
20	CityTrade Investments	Karachi	1.80
21	GrowSafe Financial	Karachi	1.75
22	MetroEdge Brokers	Karachi	1.70
23	CitiLine Securities	Karachi	1.60
24	BlueRock Karachi	Karachi	1.85
25	PrimeEdge Finance	Karachi	1.45
26	AlphaBridge Brokers	Karachi	1.55
27	RoyalTrust Karachi	Karachi	1.65
28	TradeBridge Securities	Karachi	1.70
29	SmartTrade Ltd	Karachi	1.75
30	PakWealth Capital	Karachi	1.60
31	SecureEdge Brokers	Karachi	1.80
32	BrightPath Securities	Karachi	1.85
33	NextTrade Karachi	Karachi	1.55
34	Crescent Capital Karachi	Karachi	1.70
35	UnityTrust Brokers	Karachi	1.75
36	SafeLine Financial	Karachi	1.60
37	TradeAxis Karachi	Karachi	1.50
38	CapitalBridge Ltd	Karachi	1.65
39	Vertex Securities Karachi	Karachi	1.85
40	WealthGrow Investments	Karachi	1.70
41	TrustEdge Capital	Karachi	1.60
42	AlphaGrow Brokers	Karachi	1.75
43	SmartEdge Securities	Karachi	1.80
44	MetroTrust Karachi	Karachi	1.65
45	RoyalPeak Financial	Karachi	1.70
46	SecureWealth Ltd	Karachi	1.55
47	CitiVest Karachi	Karachi	1.85
48	BlueVest Financial	Karachi	1.60
49	OptimaTrade Ltd	Karachi	1.75
50	TradePoint Securities	Karachi	1.70
\.


--
-- Data for Name: investors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.investors (investor_id, investor_name, city, email, contact_no) FROM stdin;
1	Ahmed Raza	Karachi	ahmed.raza.khi@example.com	0301-1111111
2	Bilal Khan	Karachi	bilal.khan.khi@example.com	0302-1111112
3	Hassan Ali	Karachi	hassan.ali.khi@example.com	0303-1111113
4	Zain Malik	Karachi	zain.malik.khi@example.com	0304-1111114
5	Usman Qureshi	Karachi	usman.qureshi.khi@example.com	0305-1111115
6	Tahir Shah	Karachi	tahir.shah.khi@example.com	0306-1111116
7	Hamza Siddiqui	Karachi	hamza.siddiqui.khi@example.com	0307-1111117
8	Ali Abbas	Karachi	ali.abbas.khi@example.com	0308-1111118
9	Noman Sheikh	Karachi	noman.sheikh.khi@example.com	0309-1111119
10	Fahad Iqbal	Karachi	fahad.iqbal.khi@example.com	0310-1111120
11	Rizwan Ahmed	Karachi	rizwan.ahmed.khi@example.com	0311-1111121
12	Imran Rafiq	Karachi	imran.rafiq.khi@example.com	0312-1111122
13	Khalid Anwar	Karachi	khalid.anwar.khi@example.com	0313-1111123
14	Muneeb Akhtar	Karachi	muneeb.akhtar.khi@example.com	0314-1111124
15	Ahsan Javed	Karachi	ahsan.javed.khi@example.com	0315-1111125
16	Sajid Rehman	Karachi	sajid.rehman.khi@example.com	0316-1111126
17	Tariq Aziz	Karachi	tariq.aziz.khi@example.com	0317-1111127
18	Asif Mehmood	Karachi	asif.mehmood.khi@example.com	0318-1111128
19	Owais Khan	Karachi	owais.khan.khi@example.com	0319-1111129
20	Rashid Saleem	Karachi	rashid.saleem.khi@example.com	0320-1111130
21	Saad Farooq	Karachi	saad.farooq.khi@example.com	0321-1111131
22	Faisal Noor	Karachi	faisal.noor.khi@example.com	0322-1111132
23	Moiz Hassan	Karachi	moiz.hassan.khi@example.com	0323-1111133
24	Junaid Arif	Karachi	junaid.arif.khi@example.com	0324-1111134
25	Haseeb Khan	Karachi	haseeb.khan.khi@example.com	0325-1111135
26	Shahzaib Malik	Karachi	shahzaib.malik.khi@example.com	0326-1111136
27	Adeel Ahmed	Karachi	adeel.ahmed.khi@example.com	0327-1111137
28	Waqas Iqbal	Karachi	waqas.iqbal.khi@example.com	0328-1111138
29	Nouman Raza	Karachi	nouman.raza.khi@example.com	0329-1111139
30	Sami Ullah	Karachi	sami.ullah.khi@example.com	0330-1111140
31	Imtiaz Alam	Karachi	imtiaz.alam.khi@example.com	0331-1111141
32	Zubair Yousuf	Karachi	zubair.yousuf.khi@example.com	0332-1111142
33	Adnan Saeed	Karachi	adnan.saeed.khi@example.com	0333-1111143
34	Farhan Khalid	Karachi	farhan.khalid.khi@example.com	0334-1111144
35	Anas Sheikh	Karachi	anas.sheikh.khi@example.com	0335-1111145
36	Rehan Tariq	Karachi	rehan.tariq.khi@example.com	0336-1111146
37	Shahid Abbas	Karachi	shahid.abbas.khi@example.com	0337-1111147
38	Waleed Mirza	Karachi	waleed.mirza.khi@example.com	0338-1111148
39	Azhar Khan	Karachi	azhar.khan.khi@example.com	0339-1111149
40	Nouman Qazi	Karachi	nouman.qazi.khi@example.com	0340-1111150
41	Ahmed Raza	Karachi	ahmed.raza.khi@example.com	0301-1111111
42	Bilal Khan	Karachi	bilal.khan.khi@example.com	0302-1111112
43	Hassan Ali	Karachi	hassan.ali.khi@example.com	0303-1111113
44	Zain Malik	Karachi	zain.malik.khi@example.com	0304-1111114
45	Usman Qureshi	Karachi	usman.qureshi.khi@example.com	0305-1111115
46	Tahir Shah	Karachi	tahir.shah.khi@example.com	0306-1111116
47	Hamza Siddiqui	Karachi	hamza.siddiqui.khi@example.com	0307-1111117
48	Ali Abbas	Karachi	ali.abbas.khi@example.com	0308-1111118
49	Noman Sheikh	Karachi	noman.sheikh.khi@example.com	0309-1111119
50	Fahad Iqbal	Karachi	fahad.iqbal.khi@example.com	0310-1111120
51	Rizwan Ahmed	Karachi	rizwan.ahmed.khi@example.com	0311-1111121
52	Imran Rafiq	Karachi	imran.rafiq.khi@example.com	0312-1111122
53	Khalid Anwar	Karachi	khalid.anwar.khi@example.com	0313-1111123
54	Muneeb Akhtar	Karachi	muneeb.akhtar.khi@example.com	0314-1111124
55	Ahsan Javed	Karachi	ahsan.javed.khi@example.com	0315-1111125
56	Sajid Rehman	Karachi	sajid.rehman.khi@example.com	0316-1111126
57	Tariq Aziz	Karachi	tariq.aziz.khi@example.com	0317-1111127
58	Asif Mehmood	Karachi	asif.mehmood.khi@example.com	0318-1111128
59	Owais Khan	Karachi	owais.khan.khi@example.com	0319-1111129
60	Rashid Saleem	Karachi	rashid.saleem.khi@example.com	0320-1111130
61	Saad Farooq	Karachi	saad.farooq.khi@example.com	0321-1111131
62	Faisal Noor	Karachi	faisal.noor.khi@example.com	0322-1111132
63	Moiz Hassan	Karachi	moiz.hassan.khi@example.com	0323-1111133
64	Junaid Arif	Karachi	junaid.arif.khi@example.com	0324-1111134
65	Haseeb Khan	Karachi	haseeb.khan.khi@example.com	0325-1111135
66	Shahzaib Malik	Karachi	shahzaib.malik.khi@example.com	0326-1111136
67	Adeel Ahmed	Karachi	adeel.ahmed.khi@example.com	0327-1111137
68	Waqas Iqbal	Karachi	waqas.iqbal.khi@example.com	0328-1111138
69	Nouman Raza	Karachi	nouman.raza.khi@example.com	0329-1111139
70	Sami Ullah	Karachi	sami.ullah.khi@example.com	0330-1111140
71	Imtiaz Alam	Karachi	imtiaz.alam.khi@example.com	0331-1111141
72	Zubair Yousuf	Karachi	zubair.yousuf.khi@example.com	0332-1111142
73	Adnan Saeed	Karachi	adnan.saeed.khi@example.com	0333-1111143
74	Farhan Khalid	Karachi	farhan.khalid.khi@example.com	0334-1111144
75	Anas Sheikh	Karachi	anas.sheikh.khi@example.com	0335-1111145
76	Rehan Tariq	Karachi	rehan.tariq.khi@example.com	0336-1111146
77	Shahid Abbas	Karachi	shahid.abbas.khi@example.com	0337-1111147
78	Waleed Mirza	Karachi	waleed.mirza.khi@example.com	0338-1111148
79	Azhar Khan	Karachi	azhar.khan.khi@example.com	0339-1111149
80	Nouman Qazi	Karachi	nouman.qazi.khi@example.com	0340-1111150
\.


--
-- Data for Name: stocks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stocks (stock_id, symbol, company_name, current_price, city) FROM stdin;
1	PSO	Pakistan State Oil	160.50	Karachi
2	KEL	K-Electric Ltd	3.90	Karachi
3	UBL	United Bank Ltd	120.25	Karachi
4	ENGRO	Engro Corporation	319.80	Karachi
5	LUCK	Lucky Cement	465.10	Karachi
6	FFC	Fauji Fertilizer Company	112.90	Karachi
7	DGKC	DG Khan Cement	84.30	Karachi
8	NBP	National Bank of Pakistan	52.70	Karachi
9	MCB	MCB Bank Limited	172.40	Karachi
10	OGDC	Oil & Gas Development Co.	128.10	Karachi
11	PPL	Pakistan Petroleum Ltd.	74.60	Karachi
12	SNGP	Sui Northern Gas Pipeline	45.80	Karachi
13	KEL	K-Electric Limited	3.45	Karachi
14	PAEL	Pak Elektron Limited	21.60	Karachi
15	UNITY	Unity Foods Limited	16.30	Karachi
16	NETSOL	Netsol Technologies	108.90	Karachi
17	SYS	Systems Limited	465.50	Karachi
18	TRG	TRG Pakistan Ltd.	91.80	Karachi
19	AVN	Avanceon Limited	82.10	Karachi
20	SEARL	The Searle Company Ltd.	52.90	Karachi
21	GHNI	Ghani Global Holdings	14.30	Karachi
22	HASCOL	Hascol Petroleum	6.20	Karachi
23	LOTCHEM	Lotte Chemical Pakistan	32.60	Karachi
24	EPCL	Engro Polymer & Chemicals	62.90	Karachi
25	NCL	Nishat Chunian Limited	33.40	Karachi
26	PSMC	Pak Suzuki Motors	145.20	Karachi
27	INDU	Indus Motor Company	1012.50	Karachi
28	ATLH	Atlas Honda Ltd.	421.80	Karachi
29	EFERT	Engro Fertilizer Ltd.	89.10	Karachi
30	MEBL	Meezan Bank Limited	168.20	Karachi
31	FABL	Faysal Bank Limited	41.50	Karachi
32	BAHL	Bank Al Habib Ltd.	94.30	Karachi
33	AKBL	Askari Bank Ltd.	26.70	Karachi
34	BOP	Bank of Punjab	5.80	Karachi
35	HUBC	Hub Power Company	92.40	Karachi
36	KAPCO	Kot Addu Power Company	28.60	Karachi
37	SHEL	Shell Pakistan	152.10	Karachi
38	SILK	Silkbank Limited	1.30	Karachi
39	GATM	Gul Ahmed Textile	42.10	Karachi
40	NML	Nishat Mills Limited	71.90	Karachi
41	ISL	International Steels Ltd.	61.70	Karachi
42	ASTL	Amreli Steels Ltd.	22.30	Karachi
43	MUGHAL	Mughal Iron & Steel	84.90	Karachi
44	CEYLON	Ceylon Tobacco Co.	1215.70	Karachi
45	COLG	Colgate Palmolive	1345.00	Karachi
46	HINOON	Highnoon Laboratories	485.30	Karachi
47	GLAXO	GlaxoSmithKline Pakistan	122.60	Karachi
48	IBFL	IBL Healthcare Ltd.	72.80	Karachi
49	SFL	Sapphire Fibres Ltd.	1015.40	Karachi
50	BATA	Bata Pakistan	1620.90	Karachi
51	STK51	Karachi Steel Ltd	2450.75	Karachi
52	STK52	TechNova Karachi	1300.60	Karachi
53	STK53	Karachi Textiles Pvt Ltd	3780.40	Karachi
54	STK54	Oceanic Foods Karachi	1925.10	Karachi
55	STK55	Urban Energy Karachi	4870.85	Karachi
56	STK56	Pak Leather Works	860.55	Karachi
57	STK57	Sindh Motors Ltd	2735.20	Karachi
58	STK58	BlueWave Technologies	3190.75	Karachi
59	STK59	Karachi Cables Ltd	1555.35	Karachi
60	STK60	Harbor Cement Co.	2200.10	Karachi
61	STK61	Pak Oil Refinery	4025.80	Karachi
62	STK62	Karachi Dairy Farms	1135.25	Karachi
63	STK63	TechFront Systems	1875.90	Karachi
64	STK64	Bright Paints Karachi	970.40	Karachi
65	STK65	Mega Construction Ltd	2830.70	Karachi
66	STK66	Karachi Power Grid	4650.60	Karachi
67	STK67	Sun Pharma Karachi	1240.95	Karachi
68	STK68	Digital Karachi Solutions	2220.35	Karachi
69	STK69	Ocean Transport Ltd	3055.10	Karachi
70	STK70	Pure Water Pvt Ltd	780.60	Karachi
71	STK71	Karachi Cement Co.	1910.45	Karachi
72	STK72	Urban Telecom Karachi	3475.80	Karachi
73	STK73	Smart Agro Foods	2485.25	Karachi
74	STK74	Sindh Electric Works	2860.90	Karachi
75	STK75	Pak Marine Lines	3705.50	Karachi
76	STK76	Blue Horizon Textiles	1675.25	Karachi
77	STK77	Karachi Auto Parts	2210.85	Karachi
78	STK78	Seaview Beverages	940.50	Karachi
79	STK79	Pak Techno Plastics	1150.70	Karachi
80	STK80	Metrolink Shipping	2660.30	Karachi
81	STK81	Karachi Steel Traders	1990.40	Karachi
82	STK82	NeoSoft Karachi	3750.90	Karachi
83	STK83	Sindh Paper Mills	1870.35	Karachi
84	STK84	Urban Ceramics	2950.45	Karachi
85	STK85	Harbor Marine Tools	1360.60	Karachi
86	STK86	Karachi Pharma Co.	2565.30	Karachi
87	STK87	Digital Freight Karachi	2230.75	Karachi
88	STK88	TechNova Systems	3115.10	Karachi
89	STK89	Pak Foods Karachi	980.55	Karachi
90	STK90	Urban Motors Ltd	3725.90	Karachi
91	STK91	Harbor Chemicals	1180.65	Karachi
92	STK92	Karachi Cotton Mills	2380.75	Karachi
93	STK93	Sindh Gas Co.	4200.40	Karachi
94	STK94	Karachi Glass Works	1635.25	Karachi
95	STK95	Ocean Engineering	3550.80	Karachi
96	STK96	BlueLine Telecom	1285.30	Karachi
97	STK97	Pak Fisheries Karachi	2140.60	Karachi
98	STK98	Karachi Electric Devices	1930.40	Karachi
99	STK99	Urban Steel Corp	3060.75	Karachi
100	STK100	Harbor Paints Ltd	1720.35	Karachi
101	STK101	TechWorld Karachi	2480.55	Karachi
102	STK102	Sindh Builders	3840.25	Karachi
103	STK103	Karachi Agro Ltd	1130.90	Karachi
104	STK104	BlueLine Shipping	2205.80	Karachi
105	STK105	Urban Textiles Karachi	1580.45	Karachi
106	STK106	Karachi Mineral Works	2475.75	Karachi
107	STK107	Harbor Tech Karachi	3190.25	Karachi
108	STK108	Ocean Polymers	1395.35	Karachi
109	STK109	Pak Energy Traders	2685.40	Karachi
110	STK110	Karachi Plastic Co.	880.20	Karachi
111	STK111	Smart Line Logistics	2350.50	Karachi
112	STK112	Digital Motors Karachi	3475.80	Karachi
113	STK113	Urban Oil Ltd	2125.35	Karachi
114	STK114	Karachi Dairy Products	1080.45	Karachi
115	STK115	BluePeak Builders	2970.90	Karachi
116	STK116	Sindh Electric Systems	4200.75	Karachi
117	STK117	Karachi Auto Works	2480.55	Karachi
118	STK118	TechWave Karachi	3320.40	Karachi
119	STK119	Harbor Furniture Co.	1185.25	Karachi
120	STK120	Pak Iron Traders	2710.30	Karachi
121	STK121	Karachi Solar Power	4290.75	Karachi
122	STK122	BlueMart Retail Karachi	1355.10	Karachi
123	STK123	Urban Constructions	2265.35	Karachi
124	STK124	Sindh Dairy Pvt Ltd	950.55	Karachi
125	STK125	Karachi Logistics Ltd	3205.85	Karachi
126	STK126	Digital Steel Karachi	1885.70	Karachi
127	STK127	Pak Pharma Co.	2740.10	Karachi
128	STK128	Karachi Plastics Works	1430.40	Karachi
129	STK129	BlueLine Foods	1925.80	Karachi
130	STK130	Urban Motors Karachi	3760.90	Karachi
131	STK131	Harbor Cement Karachi	2050.45	Karachi
132	STK132	TechNova Electronics	2815.25	Karachi
133	STK133	Sindh Energy Corp	3550.70	Karachi
134	STK134	Karachi Fertilizer Ltd	1730.35	Karachi
135	STK135	Ocean Wave Shipping	2415.60	Karachi
136	STK136	Pak Agro Industries	1075.20	Karachi
137	STK137	Karachi Paper Works	2250.90	Karachi
138	STK138	Urban Electric Karachi	4125.55	Karachi
139	STK139	BlueSteel Traders	1580.40	Karachi
140	STK140	Karachi Marine Lines	2885.75	Karachi
141	STK141	Karachi Tech Vision	2645.80	Karachi
142	STK142	Sindh Auto Parts	1870.25	Karachi
143	STK143	Urban Pharma Ltd	3120.70	Karachi
144	STK144	BlueSky Textiles	1585.90	Karachi
145	STK145	Pak Glass Industries	2150.60	Karachi
146	STK146	Karachi Steel Traders	2920.45	Karachi
147	STK147	Harbor Energy Karachi	4380.75	Karachi
148	STK148	Oceanic Builders	1275.30	Karachi
149	STK149	Digital Agro Foods	2360.85	Karachi
150	STK150	Karachi Motors Pvt Ltd	3485.10	Karachi
151	STK151	Sindh Paints Co.	980.40	Karachi
152	STK152	Pak Telecom Karachi	2585.60	Karachi
153	STK153	Urban Foods Karachi	1750.25	Karachi
154	STK154	Karachi Power House	3970.70	Karachi
155	STK155	BluePeak Engineering	2410.30	Karachi
156	STK156	Ocean Marine Ltd	3650.50	Karachi
157	STK157	Smart Vision Karachi	1450.85	Karachi
158	STK158	Karachi Mineral Co.	2100.75	Karachi
159	STK159	Digital Textiles Karachi	1880.45	Karachi
160	STK160	Pak Steel Works	3340.90	Karachi
161	STK161	Karachi Solar Energy	2850.40	Karachi
162	STK162	BlueLine Engineering	1540.70	Karachi
163	STK163	Urban Logistics	2265.20	Karachi
164	STK164	Sindh Marine Karachi	3205.10	Karachi
165	STK165	Karachi Dairy Ltd	990.45	Karachi
166	STK166	TechNova Logistics	2500.85	Karachi
167	STK167	Harbor Oil Traders	4000.55	Karachi
168	STK168	Pak Electric Karachi	1775.35	Karachi
169	STK169	Karachi Glass Traders	2430.65	Karachi
170	STK170	BlueSky Motors	2985.20	Karachi
171	STK171	Sindh Builders Karachi	1825.70	Karachi
172	STK172	Urban Leather Works	1270.30	Karachi
173	STK173	Karachi Marine Corp	3100.60	Karachi
174	STK174	Pak Agro Traders	1435.25	Karachi
175	STK175	BlueLine Pharma	2750.50	Karachi
176	STK176	Harbor Engineering Ltd	3590.40	Karachi
177	STK177	Karachi Transport Co.	2060.75	Karachi
178	STK178	SmartTech Karachi	3295.90	Karachi
179	STK179	Sindh Energy Works	4205.85	Karachi
180	STK180	Ocean Auto Karachi	1640.35	Karachi
181	STK181	Karachi Foods Pvt Ltd	2560.75	Karachi
182	STK182	BlueWave Logistics	1135.40	Karachi
183	STK183	Urban Cement Karachi	2905.20	Karachi
184	STK184	Harbor Marine Works	3725.55	Karachi
185	STK185	TechNova Builders	2435.60	Karachi
186	STK186	Pak Paper Ltd	1155.35	Karachi
187	STK187	Karachi Furniture Works	2610.25	Karachi
188	STK188	Sindh Shipping Lines	3500.90	Karachi
189	STK189	BluePeak Agro	1200.75	Karachi
190	STK190	Karachi Motors Ltd	2860.10	Karachi
191	STK191	Urban Fisheries	1550.60	Karachi
192	STK192	Ocean Energy Karachi	4180.40	Karachi
193	STK193	Pak Builders Karachi	2105.85	Karachi
194	STK194	Karachi Beverages	950.50	Karachi
195	STK195	BlueLine Power	2360.30	Karachi
196	STK196	Sindh Dairy Co.	1725.40	Karachi
197	STK197	TechNova Solutions	2890.80	Karachi
198	STK198	Urban Paints Karachi	1485.35	Karachi
199	STK199	Karachi Shipping Ltd	3400.75	Karachi
200	STK200	Pak Auto Karachi	2350.10	Karachi
201	STK201	BlueWave Steel	3050.25	Karachi
202	STK202	Harbor Telecom	1215.60	Karachi
203	STK203	Karachi Engineering Ltd	2780.35	Karachi
204	STK204	Sindh Pharma Karachi	2220.90	Karachi
205	STK205	Urban Glass Co.	1835.50	Karachi
206	STK206	Pak Cement Karachi	2510.70	Karachi
207	STK207	Karachi Dairy Farms	980.45	Karachi
208	STK208	BlueLine Logistics	3225.90	Karachi
209	STK209	Harbor Paper Mills	1450.60	Karachi
210	STK210	Karachi Gas Traders	3975.10	Karachi
211	STK211	Sindh Auto Karachi	1895.40	Karachi
212	STK212	Urban Motors Co.	2500.35	Karachi
213	STK213	BluePeak Plastics	1330.25	Karachi
214	STK214	Pak Foods Karachi	1745.60	Karachi
215	STK215	Karachi Marine Products	2250.80	Karachi
216	STK216	Ocean Builders Karachi	3150.70	Karachi
217	STK217	Harbor Agro Ltd	1490.20	Karachi
218	STK218	Karachi Telecom Ltd	2410.40	Karachi
219	STK219	BlueWave Motors	2980.55	Karachi
220	STK220	Sindh Construction Co.	1865.75	Karachi
221	STK221	Urban Electric Works	3560.20	Karachi
222	STK222	Pak Marine Ltd	1325.45	Karachi
223	STK223	Karachi Textiles Co.	2470.35	Karachi
224	STK224	Digital Energy Karachi	4135.90	Karachi
225	STK225	BlueLine Foods Ltd	1180.75	Karachi
226	STK226	Harbor Motors Karachi	2740.50	Karachi
227	STK227	Karachi Cement Works	3375.85	Karachi
228	STK228	Sindh Agro Karachi	1580.10	Karachi
229	STK229	Urban Builders Ltd	2925.40	Karachi
230	STK230	Pak Logistics Karachi	2550.70	Karachi
231	STK231	Karachi Glass Ltd	1685.40	Karachi
232	STK232	BlueSky Electronics	2890.75	Karachi
233	STK233	Sindh Motors Karachi	3605.20	Karachi
234	STK234	Pak Agro Foods	1420.90	Karachi
235	STK235	Urban Steel Karachi	2500.10	Karachi
236	STK236	Harbor Paints Co.	970.55	Karachi
237	STK237	Karachi Textiles Pvt Ltd	3175.35	Karachi
238	STK238	Digital Tech Karachi	2650.60	Karachi
239	STK239	BluePeak Cement	2180.40	Karachi
240	STK240	Ocean Builders Ltd	3470.25	Karachi
241	STK241	Karachi Dairy Products	1150.45	Karachi
242	STK242	Sindh Energy Traders	4050.70	Karachi
243	STK243	Pak Auto Pvt Ltd	1725.80	Karachi
244	STK244	Urban Leather Karachi	2250.30	Karachi
245	STK245	Harbor Steel Works	3455.90	Karachi
246	STK246	Karachi Logistics Ltd	2105.75	Karachi
247	STK247	BlueWave Paper Co.	980.60	Karachi
248	STK248	Sindh Dairy Karachi	1395.50	Karachi
249	STK249	TechNova Motors	3260.25	Karachi
250	STK250	Karachi Furniture Ltd	1830.90	Karachi
251	STK251	Pak Marine Co.	3595.10	Karachi
252	STK252	Urban Pharma Karachi	1215.85	Karachi
253	STK253	BlueLine Builders	2885.45	Karachi
254	STK254	Karachi Paints Pvt Ltd	2400.70	Karachi
255	STK255	Sindh Auto Ltd	3120.60	Karachi
256	STK256	Harbor Logistics Karachi	1960.30	Karachi
257	STK257	Digital Energy Works	2735.20	Karachi
258	STK258	Pak Cement Traders	3350.10	Karachi
259	STK259	Karachi Solar Works	1745.35	Karachi
260	STK260	BluePeak Motors	2480.75	Karachi
261	STK261	Urban Textiles Ltd	3105.45	Karachi
262	STK262	Sindh Engineering Co.	1850.20	Karachi
263	STK263	Karachi Electric Traders	3985.90	Karachi
264	STK264	Harbor Dairy Ltd	1475.30	Karachi
265	STK265	Pak Plastics Karachi	2170.60	Karachi
266	STK266	Digital Pharma Karachi	2835.85	Karachi
267	STK267	Karachi Motors Works	3305.40	Karachi
268	STK268	BlueWave Agro Foods	1090.75	Karachi
269	STK269	Urban Glass Karachi	2590.45	Karachi
270	STK270	Sindh Power Co.	4295.25	Karachi
271	STK271	Karachi Techno Plastics	1785.90	Karachi
272	STK272	Pak Energy Pvt Ltd	2900.35	Karachi
273	STK273	Harbor Auto Works	1210.70	Karachi
274	STK274	Digital Steel Karachi	2655.25	Karachi
275	STK275	Karachi Agro Pvt Ltd	1990.50	Karachi
276	STK276	BlueLine Shipping Karachi	3565.80	Karachi
277	STK277	Sindh Telecom Ltd	2280.90	Karachi
278	STK278	Urban Motors Works	3180.25	Karachi
279	STK279	Karachi Cement Traders	2405.40	Karachi
280	STK280	Pak Dairy Co.	1025.55	Karachi
281	STK281	Harbor Electric Karachi	2630.80	Karachi
282	STK282	BluePeak Builders Karachi	3050.10	Karachi
283	STK283	Karachi Glass Works	1890.40	Karachi
284	STK284	Sindh Beverages	1345.30	Karachi
285	STK285	Urban Steel Ltd	2955.25	Karachi
286	STK286	Digital Constructions	2475.70	Karachi
287	STK287	Karachi Textile Works	1680.90	Karachi
288	STK288	Pak Motors Karachi	3265.80	Karachi
289	STK289	Harbor Foods Ltd	2100.50	Karachi
290	STK290	BlueLine Plastics	1525.75	Karachi
291	STK291	Karachi Builders Pvt Ltd	2395.60	Karachi
292	STK292	Sindh Glass Co.	1100.45	Karachi
293	STK293	Urban Leather Pvt Ltd	2655.20	Karachi
294	STK294	Pak Tech Karachi	3100.80	Karachi
295	STK295	Karachi Electric Systems	4055.30	Karachi
296	STK296	BlueWave Builders	1295.45	Karachi
297	STK297	Harbor Paper Co.	1865.70	Karachi
298	STK298	Sindh Marine Pvt Ltd	2385.90	Karachi
299	STK299	Karachi Agro Works	1755.25	Karachi
300	STK300	Urban Pharma Co.	2805.40	Karachi
301	STK301	Digital Motors Ltd	3420.10	Karachi
302	STK302	BlueLine Energy Karachi	2185.30	Karachi
303	STK303	Pak Builders Ltd	2950.50	Karachi
304	STK304	Karachi Oil Traders	3990.25	Karachi
305	STK305	Harbor Steel Pvt Ltd	1840.55	Karachi
306	STK306	Sindh Paper Karachi	1235.40	Karachi
307	STK307	Urban Engineering Ltd	2620.80	Karachi
308	STK308	BluePeak Dairy	1425.90	Karachi
309	STK309	Karachi Transport Ltd	3650.35	Karachi
310	STK310	Pak Agro Karachi	2380.25	Karachi
311	STK311	Harbor Construction	3125.75	Karachi
312	STK312	Sindh Electric Co.	1995.60	Karachi
313	STK313	Urban Marine Karachi	2815.80	Karachi
314	STK314	Digital Builders Karachi	2280.55	Karachi
315	STK315	Karachi Pharma Ltd	1595.25	Karachi
316	STK316	BlueLine Tech Karachi	3340.40	Karachi
317	STK317	Pak Motors Ltd	2760.50	Karachi
318	STK318	Harbor Agro Karachi	1855.75	Karachi
319	STK319	Sindh Logistics Ltd	2230.10	Karachi
320	STK320	Karachi Telecom Co.	3025.65	Karachi
321	STK321	Karachi Global Oil	2988.45	Karachi
322	STK322	Portline Karachi Marine	2235.70	Karachi
323	STK323	Karachi Builders Ltd	1340.25	Karachi
324	STK324	Delta Foods Karachi	2125.65	Karachi
325	STK325	Karachi Tech Motors	4025.50	Karachi
326	STK326	VisionSoft Karachi	1599.80	Karachi
327	STK327	Karachi Industrial Gas	2499.10	Karachi
328	STK328	Harbor Line Karachi	3245.60	Karachi
329	STK329	Karachi Fiber Works	1140.75	Karachi
330	STK330	Silver Cement Karachi	2895.35	Karachi
331	STK331	Karachi National Oils	3788.95	Karachi
332	STK332	Urban Line Shipping	2640.20	Karachi
333	STK333	Karachi Cotton Mills	1560.65	Karachi
334	STK334	BlueSteel Karachi	3350.90	Karachi
335	STK335	Karachi Vision Textiles	1285.30	Karachi
336	STK336	Green Motors Karachi	4780.55	Karachi
337	STK337	Karachi Mineral Corp	1945.85	Karachi
338	STK338	AquaLine Karachi	2410.00	Karachi
339	STK339	Karachi Sun Energy	3565.90	Karachi
340	STK340	PortCity Builders	2200.10	Karachi
341	STK341	Karachi Battery Works	1899.25	Karachi
342	STK342	Modern Cement Karachi	3120.75	Karachi
343	STK343	Karachi Soft Drinks	1740.30	Karachi
344	STK344	Golden Wires Karachi	2288.50	Karachi
345	STK345	Karachi Digital Systems	3800.20	Karachi
346	STK346	Pak Marine Karachi	1325.60	Karachi
347	STK347	Karachi Urban Motors	4265.95	Karachi
348	STK348	Silver Foods Karachi	1880.75	Karachi
349	STK349	Karachi Electronics Ltd	3225.40	Karachi
350	STK350	Portline Oil Karachi	2770.65	Karachi
351	STK351	Karachi National Textiles	1955.30	Karachi
352	STK352	Digital Vision Karachi	2890.10	Karachi
353	STK353	Karachi Builders Corp	1620.45	Karachi
354	STK354	Harbor Energy Karachi	3145.80	Karachi
355	STK355	Karachi Alpha Steel	2620.55	Karachi
356	STK356	Marine Tech Karachi	3555.75	Karachi
357	STK357	Karachi Agro Foods	2075.10	Karachi
358	STK358	Golden Wires Pakistan	1365.85	Karachi
359	STK359	Karachi Harbor Oil	2505.65	Karachi
360	STK360	Digital Wave Karachi	3980.25	Karachi
361	STK361	Karachi Auto Motors	2435.75	Karachi
362	STK362	Urban Tech Karachi	2710.90	Karachi
363	STK363	Karachi Sun Power	3825.35	Karachi
364	STK364	Aqua Steel Karachi	1860.25	Karachi
365	STK365	Karachi Textile Mills	3125.40	Karachi
366	STK366	Marine Logistics Karachi	2599.80	Karachi
367	STK367	Karachi Fiber Works	3305.95	Karachi
368	STK368	HarborLine Karachi	1999.10	Karachi
369	STK369	Karachi Electric Tools	2840.55	Karachi
370	STK370	BlueStone Karachi	2375.70	Karachi
371	STK371	Karachi TechLine	1920.60	Karachi
372	STK372	PortCity Electronics	2635.85	Karachi
373	STK373	Karachi Global Foods	3075.50	Karachi
374	STK374	Urban Cement Karachi	3560.90	Karachi
375	STK375	Karachi Harbor Systems	2240.15	Karachi
376	STK376	Pak Steel Karachi	4200.40	Karachi
377	STK377	Karachi Vision Energy	2485.10	Karachi
378	STK378	Oceanic Motors Karachi	3355.25	Karachi
379	STK379	Karachi Delta Builders	1820.85	Karachi
380	STK380	Modern Karachi Oils	2945.50	Karachi
381	STK381	Karachi Blue Cables	2610.60	Karachi
382	STK382	Global Line Karachi	3480.75	Karachi
383	STK383	Karachi Prime Textiles	1715.40	Karachi
384	STK384	SteelTech Karachi	4220.90	Karachi
385	STK385	Karachi Coastal Foods	1450.30	Karachi
386	STK386	Urban Motors Karachi	2785.75	Karachi
387	STK387	Karachi Delta Tech	3320.25	Karachi
388	STK388	Ocean Power Karachi	2185.50	Karachi
389	STK389	Karachi Fiber Electric	2660.85	Karachi
390	STK390	Blue Marine Karachi	3945.65	Karachi
391	STK391	Karachi Alpha Cables	2250.20	Karachi
392	STK392	Urban Builders Karachi	1845.75	Karachi
393	STK393	Karachi National Motors	3450.80	Karachi
394	STK394	Delta Tech Karachi	2985.30	Karachi
395	STK395	Karachi Sun Cement	2530.65	Karachi
396	STK396	Global Builders Karachi	3720.55	Karachi
397	STK397	Karachi Agro Steel	1655.40	Karachi
398	STK398	Ocean Line Karachi	2270.35	Karachi
399	STK399	Karachi Energy Corp	3330.90	Karachi
400	STK400	Blue Line Karachi	2799.45	Karachi
401	STK401	Karachi Harbor Motors	2365.70	Karachi
402	STK402	Modern Foods Karachi	3215.10	Karachi
403	STK403	Karachi Urban Cement	2570.80	Karachi
404	STK404	Golden Steel Karachi	3940.55	Karachi
405	STK405	Karachi Vision Systems	1830.25	Karachi
406	STK406	Aqua Motors Karachi	3155.40	Karachi
407	STK407	Karachi Harbor Builders	2485.70	Karachi
408	STK408	Digital Marine Karachi	3399.95	Karachi
409	STK409	Karachi Energy Works	2710.85	Karachi
410	STK410	Urban Tech Pakistan	2930.50	Karachi
411	STK411	Karachi Harbor Steel	2485.60	Karachi
412	STK412	Urban Line Karachi	3325.40	Karachi
413	STK413	Karachi Cement Works	2865.75	Karachi
414	STK414	Digital Harbor Karachi	3145.10	Karachi
415	STK415	Karachi Builders & Co	1955.20	Karachi
416	STK416	AquaTech Karachi	2430.85	Karachi
417	STK417	Karachi Motors Ltd	2899.50	Karachi
418	STK418	Global Karachi Wires	3745.25	Karachi
419	STK419	Karachi Delta Systems	2275.10	Karachi
420	STK420	Blue Ocean Karachi	3380.55	Karachi
421	STK421	Karachi Electric Motors	1765.70	Karachi
422	STK422	PortCity Builders	2945.90	Karachi
423	STK423	Karachi Steel Tech	2155.60	Karachi
424	STK424	Urban Foods Karachi	3085.75	Karachi
425	STK425	Karachi Harbor Marine	2400.50	Karachi
426	STK426	Delta Builders Karachi	3335.10	Karachi
427	STK427	Karachi Tech Motors	2545.80	Karachi
428	STK428	Global Line Foods	3715.45	Karachi
429	STK429	Karachi Power Systems	1940.20	Karachi
430	STK430	Blue Vision Karachi	2815.35	Karachi
431	STK431	Karachi Digital Works	3275.95	Karachi
432	STK432	Urban Steel Karachi	2420.65	Karachi
433	STK433	Karachi Fiber Motors	3585.10	Karachi
434	STK434	Ocean Tech Karachi	2060.25	Karachi
435	STK435	Karachi Harbor Energy	3905.75	Karachi
436	STK436	Modern Karachi Builders	2255.50	Karachi
437	STK437	Karachi Delta Foods	2825.90	Karachi
438	STK438	PortCity Energy	3190.35	Karachi
439	STK439	Karachi Marine Steel	1840.45	Karachi
440	STK440	Digital Karachi Motors	2535.85	Karachi
441	STK441	Karachi Global Cement	3460.25	Karachi
442	STK442	Urban Tech Builders	2025.90	Karachi
443	STK443	Karachi Vision Oils	2830.75	Karachi
444	STK444	BlueLine Karachi	3315.10	Karachi
445	STK445	Karachi Power Motors	1945.35	Karachi
446	STK446	Harbor Digital Karachi	2599.80	Karachi
447	STK447	Karachi Builders Energy	3480.60	Karachi
448	STK448	Delta Tech Karachi	2170.25	Karachi
449	STK449	Karachi Agro Foods	2845.55	Karachi
450	STK450	Urban Karachi Motors	3015.40	Karachi
451	STK451	Karachi Coastal Builders	1799.25	Karachi
452	STK452	Blue Harbor Karachi	2690.80	Karachi
453	STK453	Karachi Steel Motors	3580.90	Karachi
454	STK454	Digital Karachi Works	2265.35	Karachi
455	STK455	Karachi Fiber Cement	3110.60	Karachi
456	STK456	Urban Builders Karachi	2435.70	Karachi
457	STK457	Karachi Global Motors	3675.15	Karachi
458	STK458	Ocean Karachi Tech	1920.50	Karachi
459	STK459	Karachi Modern Builders	2755.85	Karachi
460	STK460	PortLine Karachi	3385.25	Karachi
461	STK461	Karachi National Foods	1845.30	Karachi
462	STK462	Urban Steel Works	2905.40	Karachi
463	STK463	Karachi Delta Builders	2500.90	Karachi
464	STK464	Blue Karachi Motors	3785.25	Karachi
465	STK465	Karachi Vision Power	1965.80	Karachi
466	STK466	Digital Harbor Systems	2410.15	Karachi
467	STK467	Karachi Electric Works	3255.95	Karachi
468	STK468	Urban Motors Karachi	2799.65	Karachi
469	STK469	Karachi Fiber Energy	3590.50	Karachi
470	STK470	Blue Harbor Motors	2330.75	Karachi
471	STK471	Karachi Cement Tech	1870.85	Karachi
472	STK472	PortCity Karachi Foods	3165.20	Karachi
473	STK473	Karachi Steel Builders	2580.35	Karachi
474	STK474	Global Karachi Tech	3095.60	Karachi
475	STK475	Karachi Vision Motors	2315.90	Karachi
476	STK476	Urban Line Builders	2950.70	Karachi
477	STK477	Karachi Power Steel	3385.10	Karachi
478	STK478	Blue Karachi Foods	1905.55	Karachi
479	STK479	Karachi Marine Builders	2785.35	Karachi
480	STK480	Ocean Karachi Cement	3240.80	Karachi
481	STK481	Karachi Tech Motors	2115.40	Karachi
482	STK482	Delta Karachi Works	3555.60	Karachi
483	STK483	Karachi Steel Systems	2430.90	Karachi
484	STK484	Global Harbor Karachi	2835.70	Karachi
485	STK485	Karachi Agro Builders	3220.15	Karachi
486	STK486	Urban Karachi Tech	1965.25	Karachi
487	STK487	Karachi Vision Foods	2790.45	Karachi
488	STK488	BlueLine Karachi Works	3410.90	Karachi
489	STK489	Karachi Harbor Builders	2075.30	Karachi
490	STK490	Digital Karachi Power	3180.50	Karachi
491	STK491	Karachi Steel Energy	2720.60	Karachi
492	STK492	Ocean Builders Karachi	3560.75	Karachi
493	STK493	Karachi Fiber Tech	2425.40	Karachi
494	STK494	Urban Karachi Foods	2905.10	Karachi
495	STK495	Karachi Power Systems	3335.25	Karachi
496	STK496	Blue Karachi Builders	1845.90	Karachi
497	STK497	Karachi Agro Motors	2630.70	Karachi
498	STK498	Digital Karachi Energy	3475.45	Karachi
499	STK499	Karachi Harbor Works	2155.20	Karachi
500	STK500	Karachi Urban Energy	3899.10	Karachi
\.


--
-- Data for Name: trades; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trades (trade_id, stock_id, quantity, trade_type, trade_time) FROM stdin;
1	1	200	buy	2025-10-23 14:08:17.224804
2	2	500	sell	2025-10-23 14:08:17.224804
3	3	150	buy	2025-10-23 14:08:17.224804
4	4	200	sell	2025-10-26 10:03:32.080629
5	5	75	buy	2025-10-26 10:03:32.080629
6	6	300	sell	2025-10-26 10:03:32.080629
7	7	110	buy	2025-10-26 10:03:32.080629
8	8	250	sell	2025-10-26 10:03:32.080629
9	9	160	buy	2025-10-26 10:03:32.080629
10	10	95	sell	2025-10-26 10:03:32.080629
11	11	130	buy	2025-10-26 10:03:32.080629
12	12	190	sell	2025-10-26 10:03:32.080629
13	13	220	buy	2025-10-26 10:03:32.080629
14	14	180	sell	2025-10-26 10:03:32.080629
15	15	90	buy	2025-10-26 10:03:32.080629
16	16	210	sell	2025-10-26 10:03:32.080629
17	17	140	buy	2025-10-26 10:03:32.080629
18	18	310	sell	2025-10-26 10:03:32.080629
19	19	175	buy	2025-10-26 10:03:32.080629
20	20	240	sell	2025-10-26 10:03:32.080629
21	21	260	buy	2025-10-26 10:03:32.080629
22	22	280	sell	2025-10-26 10:03:32.080629
23	23	155	buy	2025-10-26 10:03:32.080629
24	24	340	sell	2025-10-26 10:03:32.080629
25	25	120	buy	2025-10-26 10:03:32.080629
26	26	185	sell	2025-10-26 10:03:32.080629
27	27	135	buy	2025-10-26 10:03:32.080629
28	28	260	sell	2025-10-26 10:03:32.080629
29	29	180	buy	2025-10-26 10:03:32.080629
30	30	95	sell	2025-10-26 10:03:32.080629
31	31	400	buy	2025-10-26 10:03:32.080629
32	32	150	sell	2025-10-26 10:03:32.080629
33	33	310	buy	2025-10-26 10:03:32.080629
34	34	130	sell	2025-10-26 10:03:32.080629
35	35	290	buy	2025-10-26 10:03:32.080629
36	36	170	sell	2025-10-26 10:03:32.080629
37	37	125	buy	2025-10-26 10:03:32.080629
38	38	215	sell	2025-10-26 10:03:32.080629
39	39	190	buy	2025-10-26 10:03:32.080629
40	40	230	sell	2025-10-26 10:03:32.080629
41	41	310	buy	2025-10-26 10:03:32.080629
42	42	260	sell	2025-10-26 10:03:32.080629
43	43	220	buy	2025-10-26 10:03:32.080629
44	44	280	sell	2025-10-26 10:03:32.080629
45	45	200	buy	2025-10-26 10:03:32.080629
46	46	150	sell	2025-10-26 10:03:32.080629
47	47	330	buy	2025-10-26 10:03:32.080629
48	48	290	sell	2025-10-26 10:03:32.080629
49	49	170	buy	2025-10-26 10:03:32.080629
50	50	210	sell	2025-10-26 10:03:32.080629
51	51	245	buy	2025-10-26 23:29:07.335956
52	52	680	sell	2025-10-26 23:29:07.335956
53	53	510	buy	2025-10-26 23:29:07.335956
54	54	120	sell	2025-10-26 23:29:07.335956
55	55	755	buy	2025-10-26 23:29:07.335956
56	56	430	sell	2025-10-26 23:29:07.335956
57	57	600	buy	2025-10-26 23:29:07.335956
58	58	310	sell	2025-10-26 23:29:07.335956
59	59	490	buy	2025-10-26 23:29:07.335956
60	60	720	sell	2025-10-26 23:29:07.335956
61	61	355	buy	2025-10-26 23:29:07.335956
62	62	180	sell	2025-10-26 23:29:07.335956
63	63	640	buy	2025-10-26 23:29:07.335956
64	64	275	sell	2025-10-26 23:29:07.335956
65	65	510	buy	2025-10-26 23:29:07.335956
66	66	395	sell	2025-10-26 23:29:07.335956
67	67	460	buy	2025-10-26 23:29:07.335956
68	68	225	sell	2025-10-26 23:29:07.335956
69	69	375	buy	2025-10-26 23:29:07.335956
70	70	540	sell	2025-10-26 23:29:07.335956
71	71	310	buy	2025-10-26 23:29:07.335956
72	72	285	sell	2025-10-26 23:29:07.335956
73	73	495	buy	2025-10-26 23:29:07.335956
74	74	675	sell	2025-10-26 23:29:07.335956
75	75	360	buy	2025-10-26 23:29:07.335956
76	76	410	sell	2025-10-26 23:29:07.335956
77	77	290	buy	2025-10-26 23:29:07.335956
78	78	580	sell	2025-10-26 23:29:07.335956
79	79	430	buy	2025-10-26 23:29:07.335956
80	80	150	sell	2025-10-26 23:29:07.335956
81	81	395	buy	2025-10-26 23:29:07.335956
82	82	720	sell	2025-10-26 23:29:07.335956
83	83	280	buy	2025-10-26 23:29:07.335956
84	84	610	sell	2025-10-26 23:29:07.335956
85	85	335	buy	2025-10-26 23:29:07.335956
86	86	475	sell	2025-10-26 23:29:07.335956
87	87	560	buy	2025-10-26 23:29:07.335956
88	88	215	sell	2025-10-26 23:29:07.335956
89	89	420	buy	2025-10-26 23:29:07.335956
90	90	680	sell	2025-10-26 23:29:07.335956
91	91	350	buy	2025-10-26 23:29:07.335956
92	92	180	sell	2025-10-26 23:29:07.335956
93	93	490	buy	2025-10-26 23:29:07.335956
94	94	590	sell	2025-10-26 23:29:07.335956
95	95	265	buy	2025-10-26 23:29:07.335956
96	96	430	sell	2025-10-26 23:29:07.335956
97	97	375	buy	2025-10-26 23:29:07.335956
98	98	720	sell	2025-10-26 23:29:07.335956
99	99	310	buy	2025-10-26 23:29:07.335956
100	100	285	sell	2025-10-26 23:29:07.335956
101	101	495	buy	2025-10-26 23:29:07.335956
102	102	675	sell	2025-10-26 23:29:07.335956
103	103	360	buy	2025-10-26 23:29:07.335956
104	104	410	sell	2025-10-26 23:29:07.335956
105	105	290	buy	2025-10-26 23:29:07.335956
106	106	580	sell	2025-10-26 23:29:07.335956
107	107	430	buy	2025-10-26 23:29:07.335956
108	108	150	sell	2025-10-26 23:29:07.335956
109	109	395	buy	2025-10-26 23:29:07.335956
110	110	720	sell	2025-10-26 23:29:07.335956
111	111	280	buy	2025-10-26 23:29:07.335956
112	112	610	sell	2025-10-26 23:29:07.335956
113	113	335	buy	2025-10-26 23:29:07.335956
114	114	475	sell	2025-10-26 23:29:07.335956
115	115	560	buy	2025-10-26 23:29:07.335956
116	116	215	sell	2025-10-26 23:29:07.335956
117	117	420	buy	2025-10-26 23:29:07.335956
118	118	680	sell	2025-10-26 23:29:07.335956
119	119	350	buy	2025-10-26 23:29:07.335956
120	120	180	sell	2025-10-26 23:29:07.335956
121	121	490	buy	2025-10-26 23:29:07.335956
122	122	590	sell	2025-10-26 23:29:07.335956
123	123	265	buy	2025-10-26 23:29:07.335956
124	124	430	sell	2025-10-26 23:29:07.335956
125	125	375	buy	2025-10-26 23:29:07.335956
126	126	720	sell	2025-10-26 23:29:07.335956
127	127	310	buy	2025-10-26 23:29:07.335956
128	128	285	sell	2025-10-26 23:29:07.335956
129	129	495	buy	2025-10-26 23:29:07.335956
130	130	675	sell	2025-10-26 23:29:07.335956
131	131	360	buy	2025-10-26 23:29:07.335956
132	132	410	sell	2025-10-26 23:29:07.335956
133	133	290	buy	2025-10-26 23:29:07.335956
134	134	580	sell	2025-10-26 23:29:07.335956
135	135	430	buy	2025-10-26 23:29:07.335956
136	136	150	sell	2025-10-26 23:29:07.335956
137	137	395	buy	2025-10-26 23:29:07.335956
138	138	720	sell	2025-10-26 23:29:07.335956
139	139	280	buy	2025-10-26 23:29:07.335956
140	140	610	sell	2025-10-26 23:29:07.335956
141	141	355	buy	2025-10-26 23:29:07.335956
142	142	420	sell	2025-10-26 23:29:07.335956
143	143	290	buy	2025-10-26 23:29:07.335956
144	144	610	sell	2025-10-26 23:29:07.335956
145	145	375	buy	2025-10-26 23:29:07.335956
146	146	495	sell	2025-10-26 23:29:07.335956
147	147	265	buy	2025-10-26 23:29:07.335956
148	148	580	sell	2025-10-26 23:29:07.335956
149	149	430	buy	2025-10-26 23:29:07.335956
150	150	150	sell	2025-10-26 23:29:07.335956
151	151	395	buy	2025-10-26 23:29:07.335956
152	152	720	sell	2025-10-26 23:29:07.335956
153	153	280	buy	2025-10-26 23:29:07.335956
154	154	610	sell	2025-10-26 23:29:07.335956
155	155	335	buy	2025-10-26 23:29:07.335956
156	156	475	sell	2025-10-26 23:29:07.335956
157	157	560	buy	2025-10-26 23:29:07.335956
158	158	215	sell	2025-10-26 23:29:07.335956
159	159	420	buy	2025-10-26 23:29:07.335956
160	160	680	sell	2025-10-26 23:29:07.335956
161	161	350	buy	2025-10-26 23:29:07.335956
162	162	180	sell	2025-10-26 23:29:07.335956
163	163	490	buy	2025-10-26 23:29:07.335956
164	164	590	sell	2025-10-26 23:29:07.335956
165	165	265	buy	2025-10-26 23:29:07.335956
166	166	430	sell	2025-10-26 23:29:07.335956
167	167	375	buy	2025-10-26 23:29:07.335956
168	168	720	sell	2025-10-26 23:29:07.335956
169	169	310	buy	2025-10-26 23:29:07.335956
170	170	285	sell	2025-10-26 23:29:07.335956
171	171	495	buy	2025-10-26 23:29:07.335956
172	172	675	sell	2025-10-26 23:29:07.335956
173	173	360	buy	2025-10-26 23:29:07.335956
174	174	410	sell	2025-10-26 23:29:07.335956
175	175	290	buy	2025-10-26 23:29:07.335956
176	176	580	sell	2025-10-26 23:29:07.335956
177	177	430	buy	2025-10-26 23:29:07.335956
178	178	150	sell	2025-10-26 23:29:07.335956
179	179	395	buy	2025-10-26 23:29:07.335956
180	180	720	sell	2025-10-26 23:29:07.335956
181	181	280	buy	2025-10-26 23:29:07.335956
182	182	610	sell	2025-10-26 23:29:07.335956
183	183	335	buy	2025-10-26 23:29:07.335956
184	184	475	sell	2025-10-26 23:29:07.335956
185	185	560	buy	2025-10-26 23:29:07.335956
186	186	215	sell	2025-10-26 23:29:07.335956
187	187	420	buy	2025-10-26 23:29:07.335956
188	188	680	sell	2025-10-26 23:29:07.335956
189	189	350	buy	2025-10-26 23:29:07.335956
190	190	180	sell	2025-10-26 23:29:07.335956
191	191	490	buy	2025-10-26 23:29:07.335956
192	192	590	sell	2025-10-26 23:29:07.335956
193	193	265	buy	2025-10-26 23:29:07.335956
194	194	430	sell	2025-10-26 23:29:07.335956
195	195	375	buy	2025-10-26 23:29:07.335956
196	196	720	sell	2025-10-26 23:29:07.335956
197	197	310	buy	2025-10-26 23:29:07.335956
198	198	285	sell	2025-10-26 23:29:07.335956
199	199	495	buy	2025-10-26 23:29:07.335956
200	200	675	sell	2025-10-26 23:29:07.335956
201	201	360	buy	2025-10-26 23:29:07.335956
202	202	410	sell	2025-10-26 23:29:07.335956
203	203	290	buy	2025-10-26 23:29:07.335956
204	204	580	sell	2025-10-26 23:29:07.335956
205	205	430	buy	2025-10-26 23:29:07.335956
206	206	150	sell	2025-10-26 23:29:07.335956
207	207	395	buy	2025-10-26 23:29:07.335956
208	208	720	sell	2025-10-26 23:29:07.335956
209	209	280	buy	2025-10-26 23:29:07.335956
210	210	610	sell	2025-10-26 23:29:07.335956
211	211	335	buy	2025-10-26 23:29:07.335956
212	212	475	sell	2025-10-26 23:29:07.335956
213	213	560	buy	2025-10-26 23:29:07.335956
214	214	215	sell	2025-10-26 23:29:07.335956
215	215	420	buy	2025-10-26 23:29:07.335956
216	216	680	sell	2025-10-26 23:29:07.335956
217	217	350	buy	2025-10-26 23:29:07.335956
218	218	180	sell	2025-10-26 23:29:07.335956
219	219	490	buy	2025-10-26 23:29:07.335956
220	220	590	sell	2025-10-26 23:29:07.335956
221	221	265	buy	2025-10-26 23:29:07.335956
222	222	430	sell	2025-10-26 23:29:07.335956
223	223	375	buy	2025-10-26 23:29:07.335956
224	224	720	sell	2025-10-26 23:29:07.335956
225	225	310	buy	2025-10-26 23:29:07.335956
226	226	285	sell	2025-10-26 23:29:07.335956
227	227	495	buy	2025-10-26 23:29:07.335956
228	228	675	sell	2025-10-26 23:29:07.335956
229	229	360	buy	2025-10-26 23:29:07.335956
230	230	410	sell	2025-10-26 23:29:07.335956
231	231	295	buy	2025-10-26 23:29:07.335956
232	232	480	sell	2025-10-26 23:29:07.335956
233	233	360	buy	2025-10-26 23:29:07.335956
234	234	710	sell	2025-10-26 23:29:07.335956
235	235	425	buy	2025-10-26 23:29:07.335956
236	236	550	sell	2025-10-26 23:29:07.335956
237	237	310	buy	2025-10-26 23:29:07.335956
238	238	675	sell	2025-10-26 23:29:07.335956
239	239	395	buy	2025-10-26 23:29:07.335956
240	240	560	sell	2025-10-26 23:29:07.335956
241	241	215	buy	2025-10-26 23:29:07.335956
242	242	480	sell	2025-10-26 23:29:07.335956
243	243	330	buy	2025-10-26 23:29:07.335956
244	244	610	sell	2025-10-26 23:29:07.335956
245	245	445	buy	2025-10-26 23:29:07.335956
246	246	295	sell	2025-10-26 23:29:07.335956
247	247	380	buy	2025-10-26 23:29:07.335956
248	248	720	sell	2025-10-26 23:29:07.335956
249	249	410	buy	2025-10-26 23:29:07.335956
250	250	250	sell	2025-10-26 23:29:07.335956
251	251	535	buy	2025-10-26 23:29:07.335956
252	252	690	sell	2025-10-26 23:29:07.335956
253	253	275	buy	2025-10-26 23:29:07.335956
254	254	480	sell	2025-10-26 23:29:07.335956
255	255	395	buy	2025-10-26 23:29:07.335956
256	256	610	sell	2025-10-26 23:29:07.335956
257	257	360	buy	2025-10-26 23:29:07.335956
258	258	540	sell	2025-10-26 23:29:07.335956
259	259	285	buy	2025-10-26 23:29:07.335956
260	260	430	sell	2025-10-26 23:29:07.335956
261	261	310	buy	2025-10-26 23:29:07.335956
262	262	720	sell	2025-10-26 23:29:07.335956
263	263	495	buy	2025-10-26 23:29:07.335956
264	264	180	sell	2025-10-26 23:29:07.335956
265	265	375	buy	2025-10-26 23:29:07.335956
266	266	680	sell	2025-10-26 23:29:07.335956
267	267	345	buy	2025-10-26 23:29:07.335956
268	268	590	sell	2025-10-26 23:29:07.335956
269	269	410	buy	2025-10-26 23:29:07.335956
270	270	220	sell	2025-10-26 23:29:07.335956
271	271	365	buy	2025-10-26 23:29:07.335956
272	272	550	sell	2025-10-26 23:29:07.335956
273	273	285	buy	2025-10-26 23:29:07.335956
274	274	610	sell	2025-10-26 23:29:07.335956
275	275	375	buy	2025-10-26 23:29:07.335956
276	276	420	sell	2025-10-26 23:29:07.335956
277	277	295	buy	2025-10-26 23:29:07.335956
278	278	680	sell	2025-10-26 23:29:07.335956
279	279	345	buy	2025-10-26 23:29:07.335956
280	280	490	sell	2025-10-26 23:29:07.335956
281	281	310	buy	2025-10-26 23:29:07.335956
282	282	585	sell	2025-10-26 23:29:07.335956
283	283	405	buy	2025-10-26 23:29:07.335956
284	284	230	sell	2025-10-26 23:29:07.335956
285	285	360	buy	2025-10-26 23:29:07.335956
286	286	700	sell	2025-10-26 23:29:07.335956
287	287	280	buy	2025-10-26 23:29:07.335956
288	288	520	sell	2025-10-26 23:29:07.335956
289	289	375	buy	2025-10-26 23:29:07.335956
290	290	640	sell	2025-10-26 23:29:07.335956
291	291	310	buy	2025-10-26 23:29:07.335956
292	292	410	sell	2025-10-26 23:29:07.335956
293	293	495	buy	2025-10-26 23:29:07.335956
294	294	220	sell	2025-10-26 23:29:07.335956
295	295	365	buy	2025-10-26 23:29:07.335956
296	296	580	sell	2025-10-26 23:29:07.335956
297	297	340	buy	2025-10-26 23:29:07.335956
298	298	710	sell	2025-10-26 23:29:07.335956
299	299	375	buy	2025-10-26 23:29:07.335956
300	300	420	sell	2025-10-26 23:29:07.335956
301	301	295	buy	2025-10-26 23:29:07.335956
302	302	640	sell	2025-10-26 23:29:07.335956
303	303	355	buy	2025-10-26 23:29:07.335956
304	304	485	sell	2025-10-26 23:29:07.335956
305	305	410	buy	2025-10-26 23:29:07.335956
306	306	220	sell	2025-10-26 23:29:07.335956
307	307	375	buy	2025-10-26 23:29:07.335956
308	308	700	sell	2025-10-26 23:29:07.335956
309	309	310	buy	2025-10-26 23:29:07.335956
310	310	590	sell	2025-10-26 23:29:07.335956
311	311	365	buy	2025-10-26 23:29:07.335956
312	312	480	sell	2025-10-26 23:29:07.335956
313	313	295	buy	2025-10-26 23:29:07.335956
314	314	720	sell	2025-10-26 23:29:07.335956
315	315	405	buy	2025-10-26 23:29:07.335956
316	316	540	sell	2025-10-26 23:29:07.335956
317	317	335	buy	2025-10-26 23:29:07.335956
318	318	610	sell	2025-10-26 23:29:07.335956
319	319	375	buy	2025-10-26 23:29:07.335956
320	320	430	sell	2025-10-26 23:29:07.335956
321	321	310	buy	2025-10-26 23:29:07.335956
322	322	475	sell	2025-10-26 23:29:07.335956
323	323	360	buy	2025-10-26 23:29:07.335956
324	324	690	sell	2025-10-26 23:29:07.335956
325	325	425	buy	2025-10-26 23:29:07.335956
326	326	550	sell	2025-10-26 23:29:07.335956
327	327	305	buy	2025-10-26 23:29:07.335956
328	328	720	sell	2025-10-26 23:29:07.335956
329	329	395	buy	2025-10-26 23:29:07.335956
330	330	560	sell	2025-10-26 23:29:07.335956
331	331	215	buy	2025-10-26 23:29:07.335956
332	332	480	sell	2025-10-26 23:29:07.335956
333	333	330	buy	2025-10-26 23:29:07.335956
334	334	610	sell	2025-10-26 23:29:07.335956
335	335	445	buy	2025-10-26 23:29:07.335956
336	336	295	sell	2025-10-26 23:29:07.335956
337	337	380	buy	2025-10-26 23:29:07.335956
338	338	720	sell	2025-10-26 23:29:07.335956
339	339	410	buy	2025-10-26 23:29:07.335956
340	340	250	sell	2025-10-26 23:29:07.335956
341	341	535	buy	2025-10-26 23:29:07.335956
342	342	690	sell	2025-10-26 23:29:07.335956
343	343	275	buy	2025-10-26 23:29:07.335956
344	344	480	sell	2025-10-26 23:29:07.335956
345	345	395	buy	2025-10-26 23:29:07.335956
346	346	610	sell	2025-10-26 23:29:07.335956
347	347	360	buy	2025-10-26 23:29:07.335956
348	348	540	sell	2025-10-26 23:29:07.335956
349	349	285	buy	2025-10-26 23:29:07.335956
350	350	430	sell	2025-10-26 23:29:07.335956
351	351	310	buy	2025-10-26 23:29:07.335956
352	352	720	sell	2025-10-26 23:29:07.335956
353	353	495	buy	2025-10-26 23:29:07.335956
354	354	180	sell	2025-10-26 23:29:07.335956
355	355	375	buy	2025-10-26 23:29:07.335956
356	356	680	sell	2025-10-26 23:29:07.335956
357	357	345	buy	2025-10-26 23:29:07.335956
358	358	590	sell	2025-10-26 23:29:07.335956
359	359	410	buy	2025-10-26 23:29:07.335956
360	360	220	sell	2025-10-26 23:29:07.335956
361	361	365	buy	2025-10-26 23:29:07.335956
362	362	550	sell	2025-10-26 23:29:07.335956
363	363	285	buy	2025-10-26 23:29:07.335956
364	364	610	sell	2025-10-26 23:29:07.335956
365	365	375	buy	2025-10-26 23:29:07.335956
366	366	420	sell	2025-10-26 23:29:07.335956
367	367	295	buy	2025-10-26 23:29:07.335956
368	368	680	sell	2025-10-26 23:29:07.335956
369	369	345	buy	2025-10-26 23:29:07.335956
370	370	490	sell	2025-10-26 23:29:07.335956
371	371	310	buy	2025-10-26 23:29:07.335956
372	372	585	sell	2025-10-26 23:29:07.335956
373	373	405	buy	2025-10-26 23:29:07.335956
374	374	230	sell	2025-10-26 23:29:07.335956
375	375	360	buy	2025-10-26 23:29:07.335956
376	376	700	sell	2025-10-26 23:29:07.335956
377	377	280	buy	2025-10-26 23:29:07.335956
378	378	520	sell	2025-10-26 23:29:07.335956
379	379	375	buy	2025-10-26 23:29:07.335956
380	380	640	sell	2025-10-26 23:29:07.335956
381	381	310	buy	2025-10-26 23:29:07.335956
382	382	410	sell	2025-10-26 23:29:07.335956
383	383	495	buy	2025-10-26 23:29:07.335956
384	384	220	sell	2025-10-26 23:29:07.335956
385	385	365	buy	2025-10-26 23:29:07.335956
386	386	580	sell	2025-10-26 23:29:07.335956
387	387	340	buy	2025-10-26 23:29:07.335956
388	388	710	sell	2025-10-26 23:29:07.335956
389	389	375	buy	2025-10-26 23:29:07.335956
390	390	420	sell	2025-10-26 23:29:07.335956
391	391	295	buy	2025-10-26 23:29:07.335956
392	392	640	sell	2025-10-26 23:29:07.335956
393	393	355	buy	2025-10-26 23:29:07.335956
394	394	485	sell	2025-10-26 23:29:07.335956
395	395	410	buy	2025-10-26 23:29:07.335956
396	396	220	sell	2025-10-26 23:29:07.335956
397	397	375	buy	2025-10-26 23:29:07.335956
398	398	700	sell	2025-10-26 23:29:07.335956
399	399	310	buy	2025-10-26 23:29:07.335956
400	400	590	sell	2025-10-26 23:29:07.335956
401	401	365	buy	2025-10-26 23:29:07.335956
402	402	480	sell	2025-10-26 23:29:07.335956
403	403	295	buy	2025-10-26 23:29:07.335956
404	404	720	sell	2025-10-26 23:29:07.335956
405	405	405	buy	2025-10-26 23:29:07.335956
406	406	540	sell	2025-10-26 23:29:07.335956
407	407	335	buy	2025-10-26 23:29:07.335956
408	408	610	sell	2025-10-26 23:29:07.335956
409	409	375	buy	2025-10-26 23:29:07.335956
410	410	430	sell	2025-10-26 23:29:07.335956
411	411	310	buy	2025-10-26 23:29:07.335956
412	412	475	sell	2025-10-26 23:29:07.335956
413	413	360	buy	2025-10-26 23:29:07.335956
414	414	690	sell	2025-10-26 23:29:07.335956
415	415	425	buy	2025-10-26 23:29:07.335956
416	416	550	sell	2025-10-26 23:29:07.335956
417	417	305	buy	2025-10-26 23:29:07.335956
418	418	720	sell	2025-10-26 23:29:07.335956
419	419	395	buy	2025-10-26 23:29:07.335956
420	420	560	sell	2025-10-26 23:29:07.335956
421	421	215	buy	2025-10-26 23:29:07.335956
422	422	480	sell	2025-10-26 23:29:07.335956
423	423	330	buy	2025-10-26 23:29:07.335956
424	424	610	sell	2025-10-26 23:29:07.335956
425	425	445	buy	2025-10-26 23:29:07.335956
426	426	295	sell	2025-10-26 23:29:07.335956
427	427	380	buy	2025-10-26 23:29:07.335956
428	428	720	sell	2025-10-26 23:29:07.335956
429	429	410	buy	2025-10-26 23:29:07.335956
430	430	250	sell	2025-10-26 23:29:07.335956
431	431	535	buy	2025-10-26 23:29:07.335956
432	432	690	sell	2025-10-26 23:29:07.335956
433	433	275	buy	2025-10-26 23:29:07.335956
434	434	480	sell	2025-10-26 23:29:07.335956
435	435	395	buy	2025-10-26 23:29:07.335956
436	436	610	sell	2025-10-26 23:29:07.335956
437	437	360	buy	2025-10-26 23:29:07.335956
438	438	540	sell	2025-10-26 23:29:07.335956
439	439	285	buy	2025-10-26 23:29:07.335956
440	440	430	sell	2025-10-26 23:29:07.335956
441	441	310	buy	2025-10-26 23:29:07.335956
442	442	720	sell	2025-10-26 23:29:07.335956
443	443	495	buy	2025-10-26 23:29:07.335956
444	444	180	sell	2025-10-26 23:29:07.335956
445	445	375	buy	2025-10-26 23:29:07.335956
446	446	680	sell	2025-10-26 23:29:07.335956
447	447	345	buy	2025-10-26 23:29:07.335956
448	448	590	sell	2025-10-26 23:29:07.335956
449	449	410	buy	2025-10-26 23:29:07.335956
450	450	220	sell	2025-10-26 23:29:07.335956
451	451	365	buy	2025-10-26 23:29:07.335956
452	452	550	sell	2025-10-26 23:29:07.335956
453	453	285	buy	2025-10-26 23:29:07.335956
454	454	610	sell	2025-10-26 23:29:07.335956
455	455	375	buy	2025-10-26 23:29:07.335956
456	456	420	sell	2025-10-26 23:29:07.335956
457	457	295	buy	2025-10-26 23:29:07.335956
458	458	680	sell	2025-10-26 23:29:07.335956
459	459	345	buy	2025-10-26 23:29:07.335956
460	460	490	sell	2025-10-26 23:29:07.335956
461	461	310	buy	2025-10-26 23:29:07.335956
462	462	585	sell	2025-10-26 23:29:07.335956
463	463	405	buy	2025-10-26 23:29:07.335956
464	464	230	sell	2025-10-26 23:29:07.335956
465	465	360	buy	2025-10-26 23:29:07.335956
466	466	700	sell	2025-10-26 23:29:07.335956
467	467	280	buy	2025-10-26 23:29:07.335956
468	468	520	sell	2025-10-26 23:29:07.335956
469	469	375	buy	2025-10-26 23:29:07.335956
470	470	640	sell	2025-10-26 23:29:07.335956
471	471	310	buy	2025-10-26 23:29:07.335956
472	472	410	sell	2025-10-26 23:29:07.335956
473	473	495	buy	2025-10-26 23:29:07.335956
474	474	220	sell	2025-10-26 23:29:07.335956
475	475	365	buy	2025-10-26 23:29:07.335956
476	476	580	sell	2025-10-26 23:29:07.335956
477	477	340	buy	2025-10-26 23:29:07.335956
478	478	710	sell	2025-10-26 23:29:07.335956
479	479	375	buy	2025-10-26 23:29:07.335956
480	480	420	sell	2025-10-26 23:29:07.335956
481	481	295	buy	2025-10-26 23:29:07.335956
482	482	640	sell	2025-10-26 23:29:07.335956
483	483	355	buy	2025-10-26 23:29:07.335956
484	484	485	sell	2025-10-26 23:29:07.335956
485	485	410	buy	2025-10-26 23:29:07.335956
486	486	220	sell	2025-10-26 23:29:07.335956
487	487	375	buy	2025-10-26 23:29:07.335956
488	488	700	sell	2025-10-26 23:29:07.335956
489	489	310	buy	2025-10-26 23:29:07.335956
490	490	590	sell	2025-10-26 23:29:07.335956
491	491	365	buy	2025-10-26 23:29:07.335956
492	492	480	sell	2025-10-26 23:29:07.335956
493	493	295	buy	2025-10-26 23:29:07.335956
494	494	720	sell	2025-10-26 23:29:07.335956
495	495	405	buy	2025-10-26 23:29:07.335956
496	496	540	sell	2025-10-26 23:29:07.335956
497	497	335	buy	2025-10-26 23:29:07.335956
498	498	610	sell	2025-10-26 23:29:07.335956
499	499	375	buy	2025-10-26 23:29:07.335956
500	500	430	sell	2025-10-26 23:29:07.335956
\.


--
-- Data for Name: transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transactions (transaction_id, account_id, transaction_type, amount, transaction_time) FROM stdin;
51	51	deposit	15000.50	2025-10-01 09:15:23
52	52	withdraw	5000.00	2025-10-01 11:20:10
53	53	deposit	30000.00	2025-10-02 10:05:55
54	54	withdraw	8000.75	2025-10-02 14:42:31
55	55	deposit	12000.00	2025-10-03 12:18:09
56	56	deposit	18000.25	2025-10-03 16:32:11
57	57	withdraw	4000.00	2025-10-04 13:44:09
58	58	deposit	25000.00	2025-10-04 09:05:55
59	59	deposit	10000.00	2025-10-05 15:22:41
60	60	withdraw	3500.00	2025-10-05 18:10:22
61	61	deposit	27000.00	2025-10-06 10:40:30
62	62	withdraw	6500.00	2025-10-06 12:55:17
63	63	deposit	22000.00	2025-10-07 11:10:10
64	64	deposit	9000.00	2025-10-07 17:25:09
65	65	withdraw	4500.00	2025-10-08 08:30:44
66	66	deposit	31000.00	2025-10-08 14:42:12
67	67	deposit	17000.50	2025-10-09 10:12:50
68	68	withdraw	2000.00	2025-10-09 19:00:00
69	69	deposit	40000.00	2025-10-10 10:44:23
70	70	withdraw	6000.00	2025-10-10 13:55:12
71	71	deposit	15500.75	2025-10-11 11:30:19
72	72	deposit	21000.00	2025-10-11 17:05:40
73	73	withdraw	7000.00	2025-10-12 09:45:11
74	74	deposit	23000.00	2025-10-12 14:22:15
75	75	withdraw	5000.00	2025-10-13 10:50:33
76	76	deposit	32000.00	2025-10-13 16:35:40
77	77	withdraw	7500.00	2025-10-14 09:22:30
78	78	deposit	18000.00	2025-10-14 12:45:22
79	79	deposit	19500.00	2025-10-15 13:40:10
80	80	withdraw	5500.00	2025-10-15 18:10:20
81	81	deposit	28500.00	2025-10-16 11:15:19
82	82	deposit	35000.00	2025-10-16 15:25:42
83	83	withdraw	9000.00	2025-10-17 09:05:33
84	84	deposit	20000.00	2025-10-17 13:42:55
85	85	withdraw	4500.00	2025-10-18 10:33:12
86	86	deposit	25000.00	2025-10-18 16:55:11
87	87	deposit	14500.00	2025-10-19 11:19:45
88	88	withdraw	3000.00	2025-10-19 15:25:19
89	89	deposit	39000.00	2025-10-20 12:35:00
90	90	withdraw	10000.00	2025-10-20 18:25:11
91	91	deposit	22000.00	2025-10-21 09:45:22
92	92	deposit	31000.00	2025-10-21 12:30:09
93	93	withdraw	8500.00	2025-10-22 11:40:00
94	94	deposit	20500.00	2025-10-22 16:10:33
95	95	withdraw	7000.00	2025-10-23 10:20:12
96	96	deposit	19500.00	2025-10-23 15:15:18
97	97	deposit	24000.00	2025-10-24 09:50:00
98	98	withdraw	3500.00	2025-10-24 17:12:42
99	99	deposit	40000.00	2025-10-25 10:10:10
100	100	withdraw	5000.00	2025-10-25 13:25:15
\.


--
-- Name: accounts_account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_account_id_seq', 100, true);


--
-- Name: brokers_broker_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.brokers_broker_id_seq', 50, true);


--
-- Name: investors_investor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.investors_investor_id_seq', 80, true);


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

SELECT pg_catalog.setval('public.transactions_transaction_id_seq', 100, true);


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
-- Name: pub_karachi; Type: PUBLICATION; Schema: -; Owner: postgres
--

CREATE PUBLICATION pub_karachi WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION pub_karachi OWNER TO postgres;

--
-- Name: pub_karachi stocks; Type: PUBLICATION TABLE; Schema: public; Owner: postgres
--

ALTER PUBLICATION pub_karachi ADD TABLE ONLY public.stocks;


--
-- Name: pub_karachi trades; Type: PUBLICATION TABLE; Schema: public; Owner: postgres
--

ALTER PUBLICATION pub_karachi ADD TABLE ONLY public.trades;


--
-- PostgreSQL database dump complete
--

\unrestrict d9IptuQU3KkmJ4qiIxAOho2lHtY8TBMpicRskx4wUeisE70MYhwzJgaPJYNDeCZ

