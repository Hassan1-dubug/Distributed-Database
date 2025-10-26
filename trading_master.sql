--
-- PostgreSQL database dump
--

\restrict uEpikci8qfawiC08h3PgZ6DhgosJs31PTEWyD3JEDrcVAoabOap5ZHs7iZ6dxE5

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

--
-- Name: postgres_fdw; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgres_fdw WITH SCHEMA public;


--
-- Name: EXTENSION postgres_fdw; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgres_fdw IS 'foreign-data wrapper for remote PostgreSQL servers';


--
-- Name: islamabad_server; Type: SERVER; Schema: -; Owner: postgres
--

CREATE SERVER islamabad_server FOREIGN DATA WRAPPER postgres_fdw OPTIONS (
    dbname 'trading_node_islamabad',
    host 'localhost',
    port '5432'
);


ALTER SERVER islamabad_server OWNER TO postgres;

--
-- Name: USER MAPPING postgres SERVER islamabad_server; Type: USER MAPPING; Schema: -; Owner: postgres
--

CREATE USER MAPPING FOR postgres SERVER islamabad_server OPTIONS (
    password 'Allah@pak246',
    "user" 'postgres'
);


--
-- Name: karachi_server; Type: SERVER; Schema: -; Owner: postgres
--

CREATE SERVER karachi_server FOREIGN DATA WRAPPER postgres_fdw OPTIONS (
    dbname 'trading_node_karachi',
    host 'localhost',
    port '5432'
);


ALTER SERVER karachi_server OWNER TO postgres;

--
-- Name: USER MAPPING postgres SERVER karachi_server; Type: USER MAPPING; Schema: -; Owner: postgres
--

CREATE USER MAPPING FOR postgres SERVER karachi_server OPTIONS (
    password 'Allah@pak246',
    "user" 'postgres'
);


--
-- Name: lahore_server; Type: SERVER; Schema: -; Owner: postgres
--

CREATE SERVER lahore_server FOREIGN DATA WRAPPER postgres_fdw OPTIONS (
    dbname 'trading_node_lahore',
    host 'localhost',
    port '5432'
);


ALTER SERVER lahore_server OWNER TO postgres;

--
-- Name: USER MAPPING postgres SERVER lahore_server; Type: USER MAPPING; Schema: -; Owner: postgres
--

CREATE USER MAPPING FOR postgres SERVER lahore_server OPTIONS (
    password 'Allah@pak246',
    "user" 'postgres'
);


--
-- Name: stocks_islamabad; Type: FOREIGN TABLE; Schema: public; Owner: postgres
--

CREATE FOREIGN TABLE public.stocks_islamabad (
    stock_id integer CONSTRAINT stocks_stock_id_not_null2 NOT NULL,
    symbol character varying(10),
    company_name character varying(100),
    current_price numeric(10,2),
    city character varying(50)
)
SERVER islamabad_server
OPTIONS (
    schema_name 'public',
    table_name 'stocks'
);
ALTER FOREIGN TABLE ONLY public.stocks_islamabad ALTER COLUMN stock_id OPTIONS (
    column_name 'stock_id'
);
ALTER FOREIGN TABLE ONLY public.stocks_islamabad ALTER COLUMN symbol OPTIONS (
    column_name 'symbol'
);
ALTER FOREIGN TABLE ONLY public.stocks_islamabad ALTER COLUMN company_name OPTIONS (
    column_name 'company_name'
);
ALTER FOREIGN TABLE ONLY public.stocks_islamabad ALTER COLUMN current_price OPTIONS (
    column_name 'current_price'
);
ALTER FOREIGN TABLE ONLY public.stocks_islamabad ALTER COLUMN city OPTIONS (
    column_name 'city'
);


ALTER FOREIGN TABLE public.stocks_islamabad OWNER TO postgres;

--
-- Name: stocks_karachi; Type: FOREIGN TABLE; Schema: public; Owner: postgres
--

CREATE FOREIGN TABLE public.stocks_karachi (
    stock_id integer CONSTRAINT stocks_stock_id_not_null NOT NULL,
    symbol character varying(10),
    company_name character varying(100),
    current_price numeric(10,2),
    city character varying(50)
)
SERVER karachi_server
OPTIONS (
    schema_name 'public',
    table_name 'stocks'
);
ALTER FOREIGN TABLE ONLY public.stocks_karachi ALTER COLUMN stock_id OPTIONS (
    column_name 'stock_id'
);
ALTER FOREIGN TABLE ONLY public.stocks_karachi ALTER COLUMN symbol OPTIONS (
    column_name 'symbol'
);
ALTER FOREIGN TABLE ONLY public.stocks_karachi ALTER COLUMN company_name OPTIONS (
    column_name 'company_name'
);
ALTER FOREIGN TABLE ONLY public.stocks_karachi ALTER COLUMN current_price OPTIONS (
    column_name 'current_price'
);
ALTER FOREIGN TABLE ONLY public.stocks_karachi ALTER COLUMN city OPTIONS (
    column_name 'city'
);


ALTER FOREIGN TABLE public.stocks_karachi OWNER TO postgres;

--
-- Name: stocks_lahore; Type: FOREIGN TABLE; Schema: public; Owner: postgres
--

CREATE FOREIGN TABLE public.stocks_lahore (
    stock_id integer CONSTRAINT stocks_stock_id_not_null1 NOT NULL,
    symbol character varying(10),
    company_name character varying(100),
    current_price numeric(10,2),
    city character varying(50)
)
SERVER lahore_server
OPTIONS (
    schema_name 'public',
    table_name 'stocks'
);
ALTER FOREIGN TABLE ONLY public.stocks_lahore ALTER COLUMN stock_id OPTIONS (
    column_name 'stock_id'
);
ALTER FOREIGN TABLE ONLY public.stocks_lahore ALTER COLUMN symbol OPTIONS (
    column_name 'symbol'
);
ALTER FOREIGN TABLE ONLY public.stocks_lahore ALTER COLUMN company_name OPTIONS (
    column_name 'company_name'
);
ALTER FOREIGN TABLE ONLY public.stocks_lahore ALTER COLUMN current_price OPTIONS (
    column_name 'current_price'
);
ALTER FOREIGN TABLE ONLY public.stocks_lahore ALTER COLUMN city OPTIONS (
    column_name 'city'
);


ALTER FOREIGN TABLE public.stocks_lahore OWNER TO postgres;

--
-- Name: all_stocks; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.all_stocks AS
 SELECT stocks_karachi.stock_id,
    stocks_karachi.symbol,
    stocks_karachi.company_name,
    stocks_karachi.current_price,
    stocks_karachi.city
   FROM public.stocks_karachi
UNION ALL
 SELECT stocks_lahore.stock_id,
    stocks_lahore.symbol,
    stocks_lahore.company_name,
    stocks_lahore.current_price,
    stocks_lahore.city
   FROM public.stocks_lahore
UNION ALL
 SELECT stocks_islamabad.stock_id,
    stocks_islamabad.symbol,
    stocks_islamabad.company_name,
    stocks_islamabad.current_price,
    stocks_islamabad.city
   FROM public.stocks_islamabad;


ALTER VIEW public.all_stocks OWNER TO postgres;

--
-- Name: trades_islamabad; Type: FOREIGN TABLE; Schema: public; Owner: postgres
--

CREATE FOREIGN TABLE public.trades_islamabad (
    trade_id integer CONSTRAINT trades_trade_id_not_null2 NOT NULL,
    stock_id integer,
    quantity integer,
    trade_type character varying(10),
    trade_time timestamp without time zone
)
SERVER islamabad_server
OPTIONS (
    schema_name 'public',
    table_name 'trades'
);
ALTER FOREIGN TABLE ONLY public.trades_islamabad ALTER COLUMN trade_id OPTIONS (
    column_name 'trade_id'
);
ALTER FOREIGN TABLE ONLY public.trades_islamabad ALTER COLUMN stock_id OPTIONS (
    column_name 'stock_id'
);
ALTER FOREIGN TABLE ONLY public.trades_islamabad ALTER COLUMN quantity OPTIONS (
    column_name 'quantity'
);
ALTER FOREIGN TABLE ONLY public.trades_islamabad ALTER COLUMN trade_type OPTIONS (
    column_name 'trade_type'
);
ALTER FOREIGN TABLE ONLY public.trades_islamabad ALTER COLUMN trade_time OPTIONS (
    column_name 'trade_time'
);


ALTER FOREIGN TABLE public.trades_islamabad OWNER TO postgres;

--
-- Name: trades_karachi; Type: FOREIGN TABLE; Schema: public; Owner: postgres
--

CREATE FOREIGN TABLE public.trades_karachi (
    trade_id integer CONSTRAINT trades_trade_id_not_null NOT NULL,
    stock_id integer,
    quantity integer,
    trade_type character varying(10),
    trade_time timestamp without time zone
)
SERVER karachi_server
OPTIONS (
    schema_name 'public',
    table_name 'trades'
);
ALTER FOREIGN TABLE ONLY public.trades_karachi ALTER COLUMN trade_id OPTIONS (
    column_name 'trade_id'
);
ALTER FOREIGN TABLE ONLY public.trades_karachi ALTER COLUMN stock_id OPTIONS (
    column_name 'stock_id'
);
ALTER FOREIGN TABLE ONLY public.trades_karachi ALTER COLUMN quantity OPTIONS (
    column_name 'quantity'
);
ALTER FOREIGN TABLE ONLY public.trades_karachi ALTER COLUMN trade_type OPTIONS (
    column_name 'trade_type'
);
ALTER FOREIGN TABLE ONLY public.trades_karachi ALTER COLUMN trade_time OPTIONS (
    column_name 'trade_time'
);


ALTER FOREIGN TABLE public.trades_karachi OWNER TO postgres;

--
-- Name: trades_lahore; Type: FOREIGN TABLE; Schema: public; Owner: postgres
--

CREATE FOREIGN TABLE public.trades_lahore (
    trade_id integer CONSTRAINT trades_trade_id_not_null1 NOT NULL,
    stock_id integer,
    quantity integer,
    trade_type character varying(10),
    trade_time timestamp without time zone
)
SERVER lahore_server
OPTIONS (
    schema_name 'public',
    table_name 'trades'
);
ALTER FOREIGN TABLE ONLY public.trades_lahore ALTER COLUMN trade_id OPTIONS (
    column_name 'trade_id'
);
ALTER FOREIGN TABLE ONLY public.trades_lahore ALTER COLUMN stock_id OPTIONS (
    column_name 'stock_id'
);
ALTER FOREIGN TABLE ONLY public.trades_lahore ALTER COLUMN quantity OPTIONS (
    column_name 'quantity'
);
ALTER FOREIGN TABLE ONLY public.trades_lahore ALTER COLUMN trade_type OPTIONS (
    column_name 'trade_type'
);
ALTER FOREIGN TABLE ONLY public.trades_lahore ALTER COLUMN trade_time OPTIONS (
    column_name 'trade_time'
);


ALTER FOREIGN TABLE public.trades_lahore OWNER TO postgres;

--
-- Name: all_trades; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.all_trades AS
 SELECT trades_karachi.trade_id,
    trades_karachi.stock_id,
    trades_karachi.quantity,
    trades_karachi.trade_type,
    trades_karachi.trade_time
   FROM public.trades_karachi
UNION ALL
 SELECT trades_lahore.trade_id,
    trades_lahore.stock_id,
    trades_lahore.quantity,
    trades_lahore.trade_type,
    trades_lahore.trade_time
   FROM public.trades_lahore
UNION ALL
 SELECT trades_islamabad.trade_id,
    trades_islamabad.stock_id,
    trades_islamabad.quantity,
    trades_islamabad.trade_type,
    trades_islamabad.trade_time
   FROM public.trades_islamabad;


ALTER VIEW public.all_trades OWNER TO postgres;

--
-- Name: node_status; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.node_status AS
 SELECT 'Karachi'::text AS node,
    ( SELECT count(*) AS count
           FROM public.stocks_karachi) AS total_stocks
UNION ALL
 SELECT 'Lahore'::text AS node,
    ( SELECT count(*) AS count
           FROM public.stocks_lahore) AS total_stocks
UNION ALL
 SELECT 'Islamabad'::text AS node,
    ( SELECT count(*) AS count
           FROM public.stocks_islamabad) AS total_stocks;


ALTER VIEW public.node_status OWNER TO postgres;

--
-- Name: TABLE stocks_islamabad; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.stocks_islamabad TO analyst;


--
-- Name: TABLE stocks_karachi; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.stocks_karachi TO analyst;


--
-- Name: TABLE stocks_lahore; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.stocks_lahore TO analyst;


--
-- Name: TABLE all_stocks; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.all_stocks TO analyst;


--
-- Name: TABLE trades_islamabad; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.trades_islamabad TO analyst;


--
-- Name: TABLE trades_karachi; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.trades_karachi TO analyst;


--
-- Name: TABLE trades_lahore; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.trades_lahore TO analyst;


--
-- Name: TABLE all_trades; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.all_trades TO analyst;


--
-- PostgreSQL database dump complete
--

\unrestrict uEpikci8qfawiC08h3PgZ6DhgosJs31PTEWyD3JEDrcVAoabOap5ZHs7iZ6dxE5

