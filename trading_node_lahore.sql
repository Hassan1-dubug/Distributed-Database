--
-- PostgreSQL database dump
--

\restrict DKtZF3uoueYPWHfUTzfjAVrJYxo690oxTtnE6fvGrEuc9j1KkJ5CyXOGJuA0Wc9

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

\unrestrict DKtZF3uoueYPWHfUTzfjAVrJYxo690oxTtnE6fvGrEuc9j1KkJ5CyXOGJuA0Wc9

