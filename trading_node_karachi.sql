--
-- PostgreSQL database dump
--

\restrict ZKhNwuSHzy8Tbd9pxEyoHUx0KqBP9m9soo1DPWkzMgawtx2eMWAXM486fnX4v95

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
-- Name: stocks stock_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stocks ALTER COLUMN stock_id SET DEFAULT nextval('public.stocks_stock_id_seq'::regclass);


--
-- Name: trades trade_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trades ALTER COLUMN trade_id SET DEFAULT nextval('public.trades_trade_id_seq'::regclass);


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
\.


--
-- Name: stocks_stock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stocks_stock_id_seq', 50, true);


--
-- Name: trades_trade_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.trades_trade_id_seq', 50, true);


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
-- Name: trades trades_stock_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trades
    ADD CONSTRAINT trades_stock_id_fkey FOREIGN KEY (stock_id) REFERENCES public.stocks(stock_id);


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

\unrestrict ZKhNwuSHzy8Tbd9pxEyoHUx0KqBP9m9soo1DPWkzMgawtx2eMWAXM486fnX4v95

