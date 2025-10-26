--
-- PostgreSQL database dump
--

\restrict 5aaggYwvjloicVdR4dLg6TVfMPQRVvR2useLrILFnoYYGk6RJWK182eRqyQW2og

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
-- PostgreSQL database dump complete
--

\unrestrict 5aaggYwvjloicVdR4dLg6TVfMPQRVvR2useLrILFnoYYGk6RJWK182eRqyQW2og

