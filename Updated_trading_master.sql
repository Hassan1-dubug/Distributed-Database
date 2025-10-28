--
-- PostgreSQL database dump
--

\restrict V9dUIL0tgdtd87Vi1DvfH3sfQfCceRfTuFuH4Bjxv7dDcshLWRP0GqeWX5fMkX6

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
-- Name: accounts_islamabad; Type: FOREIGN TABLE; Schema: public; Owner: postgres
--

CREATE FOREIGN TABLE public.accounts_islamabad (
    account_id integer CONSTRAINT accounts_account_id_not_null2 NOT NULL,
    investor_id integer,
    balance numeric(12,2),
    status character varying(20)
)
SERVER islamabad_server
OPTIONS (
    schema_name 'public',
    table_name 'accounts'
);
ALTER FOREIGN TABLE ONLY public.accounts_islamabad ALTER COLUMN account_id OPTIONS (
    column_name 'account_id'
);
ALTER FOREIGN TABLE ONLY public.accounts_islamabad ALTER COLUMN investor_id OPTIONS (
    column_name 'investor_id'
);
ALTER FOREIGN TABLE ONLY public.accounts_islamabad ALTER COLUMN balance OPTIONS (
    column_name 'balance'
);
ALTER FOREIGN TABLE ONLY public.accounts_islamabad ALTER COLUMN status OPTIONS (
    column_name 'status'
);


ALTER FOREIGN TABLE public.accounts_islamabad OWNER TO postgres;

--
-- Name: accounts_karachi; Type: FOREIGN TABLE; Schema: public; Owner: postgres
--

CREATE FOREIGN TABLE public.accounts_karachi (
    account_id integer CONSTRAINT accounts_account_id_not_null NOT NULL,
    investor_id integer,
    balance numeric(12,2),
    status character varying(20)
)
SERVER karachi_server
OPTIONS (
    schema_name 'public',
    table_name 'accounts'
);
ALTER FOREIGN TABLE ONLY public.accounts_karachi ALTER COLUMN account_id OPTIONS (
    column_name 'account_id'
);
ALTER FOREIGN TABLE ONLY public.accounts_karachi ALTER COLUMN investor_id OPTIONS (
    column_name 'investor_id'
);
ALTER FOREIGN TABLE ONLY public.accounts_karachi ALTER COLUMN balance OPTIONS (
    column_name 'balance'
);
ALTER FOREIGN TABLE ONLY public.accounts_karachi ALTER COLUMN status OPTIONS (
    column_name 'status'
);


ALTER FOREIGN TABLE public.accounts_karachi OWNER TO postgres;

--
-- Name: accounts_lahore; Type: FOREIGN TABLE; Schema: public; Owner: postgres
--

CREATE FOREIGN TABLE public.accounts_lahore (
    account_id integer CONSTRAINT accounts_account_id_not_null1 NOT NULL,
    investor_id integer,
    balance numeric(12,2),
    status character varying(20)
)
SERVER lahore_server
OPTIONS (
    schema_name 'public',
    table_name 'accounts'
);
ALTER FOREIGN TABLE ONLY public.accounts_lahore ALTER COLUMN account_id OPTIONS (
    column_name 'account_id'
);
ALTER FOREIGN TABLE ONLY public.accounts_lahore ALTER COLUMN investor_id OPTIONS (
    column_name 'investor_id'
);
ALTER FOREIGN TABLE ONLY public.accounts_lahore ALTER COLUMN balance OPTIONS (
    column_name 'balance'
);
ALTER FOREIGN TABLE ONLY public.accounts_lahore ALTER COLUMN status OPTIONS (
    column_name 'status'
);


ALTER FOREIGN TABLE public.accounts_lahore OWNER TO postgres;

--
-- Name: all_accounts; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.all_accounts AS
 SELECT accounts_karachi.account_id,
    accounts_karachi.investor_id,
    accounts_karachi.balance,
    accounts_karachi.status
   FROM public.accounts_karachi
UNION ALL
 SELECT accounts_lahore.account_id,
    accounts_lahore.investor_id,
    accounts_lahore.balance,
    accounts_lahore.status
   FROM public.accounts_lahore
UNION ALL
 SELECT accounts_islamabad.account_id,
    accounts_islamabad.investor_id,
    accounts_islamabad.balance,
    accounts_islamabad.status
   FROM public.accounts_islamabad;


ALTER VIEW public.all_accounts OWNER TO postgres;

--
-- Name: brokers_islamabad; Type: FOREIGN TABLE; Schema: public; Owner: postgres
--

CREATE FOREIGN TABLE public.brokers_islamabad (
    broker_id integer CONSTRAINT brokers_broker_id_not_null2 NOT NULL,
    broker_name character varying(100),
    branch_city character varying(50),
    commission_rate numeric(5,2)
)
SERVER islamabad_server
OPTIONS (
    schema_name 'public',
    table_name 'brokers'
);
ALTER FOREIGN TABLE ONLY public.brokers_islamabad ALTER COLUMN broker_id OPTIONS (
    column_name 'broker_id'
);
ALTER FOREIGN TABLE ONLY public.brokers_islamabad ALTER COLUMN broker_name OPTIONS (
    column_name 'broker_name'
);
ALTER FOREIGN TABLE ONLY public.brokers_islamabad ALTER COLUMN branch_city OPTIONS (
    column_name 'branch_city'
);
ALTER FOREIGN TABLE ONLY public.brokers_islamabad ALTER COLUMN commission_rate OPTIONS (
    column_name 'commission_rate'
);


ALTER FOREIGN TABLE public.brokers_islamabad OWNER TO postgres;

--
-- Name: brokers_karachi; Type: FOREIGN TABLE; Schema: public; Owner: postgres
--

CREATE FOREIGN TABLE public.brokers_karachi (
    broker_id integer CONSTRAINT brokers_broker_id_not_null NOT NULL,
    broker_name character varying(100),
    branch_city character varying(50),
    commission_rate numeric(5,2)
)
SERVER karachi_server
OPTIONS (
    schema_name 'public',
    table_name 'brokers'
);
ALTER FOREIGN TABLE ONLY public.brokers_karachi ALTER COLUMN broker_id OPTIONS (
    column_name 'broker_id'
);
ALTER FOREIGN TABLE ONLY public.brokers_karachi ALTER COLUMN broker_name OPTIONS (
    column_name 'broker_name'
);
ALTER FOREIGN TABLE ONLY public.brokers_karachi ALTER COLUMN branch_city OPTIONS (
    column_name 'branch_city'
);
ALTER FOREIGN TABLE ONLY public.brokers_karachi ALTER COLUMN commission_rate OPTIONS (
    column_name 'commission_rate'
);


ALTER FOREIGN TABLE public.brokers_karachi OWNER TO postgres;

--
-- Name: brokers_lahore; Type: FOREIGN TABLE; Schema: public; Owner: postgres
--

CREATE FOREIGN TABLE public.brokers_lahore (
    broker_id integer CONSTRAINT brokers_broker_id_not_null1 NOT NULL,
    broker_name character varying(100),
    branch_city character varying(50),
    commission_rate numeric(5,2)
)
SERVER lahore_server
OPTIONS (
    schema_name 'public',
    table_name 'brokers'
);
ALTER FOREIGN TABLE ONLY public.brokers_lahore ALTER COLUMN broker_id OPTIONS (
    column_name 'broker_id'
);
ALTER FOREIGN TABLE ONLY public.brokers_lahore ALTER COLUMN broker_name OPTIONS (
    column_name 'broker_name'
);
ALTER FOREIGN TABLE ONLY public.brokers_lahore ALTER COLUMN branch_city OPTIONS (
    column_name 'branch_city'
);
ALTER FOREIGN TABLE ONLY public.brokers_lahore ALTER COLUMN commission_rate OPTIONS (
    column_name 'commission_rate'
);


ALTER FOREIGN TABLE public.brokers_lahore OWNER TO postgres;

--
-- Name: all_brokers; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.all_brokers AS
 SELECT brokers_karachi.broker_id,
    brokers_karachi.broker_name,
    brokers_karachi.branch_city,
    brokers_karachi.commission_rate
   FROM public.brokers_karachi
UNION ALL
 SELECT brokers_lahore.broker_id,
    brokers_lahore.broker_name,
    brokers_lahore.branch_city,
    brokers_lahore.commission_rate
   FROM public.brokers_lahore
UNION ALL
 SELECT brokers_islamabad.broker_id,
    brokers_islamabad.broker_name,
    brokers_islamabad.branch_city,
    brokers_islamabad.commission_rate
   FROM public.brokers_islamabad;


ALTER VIEW public.all_brokers OWNER TO postgres;

--
-- Name: investors_islamabad; Type: FOREIGN TABLE; Schema: public; Owner: postgres
--

CREATE FOREIGN TABLE public.investors_islamabad (
    investor_id integer CONSTRAINT investors_investor_id_not_null2 NOT NULL,
    investor_name character varying(100),
    city character varying(50),
    email character varying(100),
    contact_no character varying(20)
)
SERVER islamabad_server
OPTIONS (
    schema_name 'public',
    table_name 'investors'
);
ALTER FOREIGN TABLE ONLY public.investors_islamabad ALTER COLUMN investor_id OPTIONS (
    column_name 'investor_id'
);
ALTER FOREIGN TABLE ONLY public.investors_islamabad ALTER COLUMN investor_name OPTIONS (
    column_name 'investor_name'
);
ALTER FOREIGN TABLE ONLY public.investors_islamabad ALTER COLUMN city OPTIONS (
    column_name 'city'
);
ALTER FOREIGN TABLE ONLY public.investors_islamabad ALTER COLUMN email OPTIONS (
    column_name 'email'
);
ALTER FOREIGN TABLE ONLY public.investors_islamabad ALTER COLUMN contact_no OPTIONS (
    column_name 'contact_no'
);


ALTER FOREIGN TABLE public.investors_islamabad OWNER TO postgres;

--
-- Name: investors_karachi; Type: FOREIGN TABLE; Schema: public; Owner: postgres
--

CREATE FOREIGN TABLE public.investors_karachi (
    investor_id integer CONSTRAINT investors_investor_id_not_null NOT NULL,
    investor_name character varying(100),
    city character varying(50),
    email character varying(100),
    contact_no character varying(20)
)
SERVER karachi_server
OPTIONS (
    schema_name 'public',
    table_name 'investors'
);
ALTER FOREIGN TABLE ONLY public.investors_karachi ALTER COLUMN investor_id OPTIONS (
    column_name 'investor_id'
);
ALTER FOREIGN TABLE ONLY public.investors_karachi ALTER COLUMN investor_name OPTIONS (
    column_name 'investor_name'
);
ALTER FOREIGN TABLE ONLY public.investors_karachi ALTER COLUMN city OPTIONS (
    column_name 'city'
);
ALTER FOREIGN TABLE ONLY public.investors_karachi ALTER COLUMN email OPTIONS (
    column_name 'email'
);
ALTER FOREIGN TABLE ONLY public.investors_karachi ALTER COLUMN contact_no OPTIONS (
    column_name 'contact_no'
);


ALTER FOREIGN TABLE public.investors_karachi OWNER TO postgres;

--
-- Name: investors_lahore; Type: FOREIGN TABLE; Schema: public; Owner: postgres
--

CREATE FOREIGN TABLE public.investors_lahore (
    investor_id integer CONSTRAINT investors_investor_id_not_null1 NOT NULL,
    investor_name character varying(100),
    city character varying(50),
    email character varying(100),
    contact_no character varying(20)
)
SERVER lahore_server
OPTIONS (
    schema_name 'public',
    table_name 'investors'
);
ALTER FOREIGN TABLE ONLY public.investors_lahore ALTER COLUMN investor_id OPTIONS (
    column_name 'investor_id'
);
ALTER FOREIGN TABLE ONLY public.investors_lahore ALTER COLUMN investor_name OPTIONS (
    column_name 'investor_name'
);
ALTER FOREIGN TABLE ONLY public.investors_lahore ALTER COLUMN city OPTIONS (
    column_name 'city'
);
ALTER FOREIGN TABLE ONLY public.investors_lahore ALTER COLUMN email OPTIONS (
    column_name 'email'
);
ALTER FOREIGN TABLE ONLY public.investors_lahore ALTER COLUMN contact_no OPTIONS (
    column_name 'contact_no'
);


ALTER FOREIGN TABLE public.investors_lahore OWNER TO postgres;

--
-- Name: all_investors; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.all_investors AS
 SELECT investors_karachi.investor_id,
    investors_karachi.investor_name,
    investors_karachi.city,
    investors_karachi.email,
    investors_karachi.contact_no
   FROM public.investors_karachi
UNION ALL
 SELECT investors_lahore.investor_id,
    investors_lahore.investor_name,
    investors_lahore.city,
    investors_lahore.email,
    investors_lahore.contact_no
   FROM public.investors_lahore
UNION ALL
 SELECT investors_islamabad.investor_id,
    investors_islamabad.investor_name,
    investors_islamabad.city,
    investors_islamabad.email,
    investors_islamabad.contact_no
   FROM public.investors_islamabad;


ALTER VIEW public.all_investors OWNER TO postgres;

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
-- Name: transactions_islamabad; Type: FOREIGN TABLE; Schema: public; Owner: postgres
--

CREATE FOREIGN TABLE public.transactions_islamabad (
    transaction_id integer CONSTRAINT transactions_transaction_id_not_null2 NOT NULL,
    account_id integer,
    transaction_type character varying(20),
    amount numeric(12,2),
    transaction_time timestamp without time zone
)
SERVER islamabad_server
OPTIONS (
    schema_name 'public',
    table_name 'transactions'
);
ALTER FOREIGN TABLE ONLY public.transactions_islamabad ALTER COLUMN transaction_id OPTIONS (
    column_name 'transaction_id'
);
ALTER FOREIGN TABLE ONLY public.transactions_islamabad ALTER COLUMN account_id OPTIONS (
    column_name 'account_id'
);
ALTER FOREIGN TABLE ONLY public.transactions_islamabad ALTER COLUMN transaction_type OPTIONS (
    column_name 'transaction_type'
);
ALTER FOREIGN TABLE ONLY public.transactions_islamabad ALTER COLUMN amount OPTIONS (
    column_name 'amount'
);
ALTER FOREIGN TABLE ONLY public.transactions_islamabad ALTER COLUMN transaction_time OPTIONS (
    column_name 'transaction_time'
);


ALTER FOREIGN TABLE public.transactions_islamabad OWNER TO postgres;

--
-- Name: transactions_karachi; Type: FOREIGN TABLE; Schema: public; Owner: postgres
--

CREATE FOREIGN TABLE public.transactions_karachi (
    transaction_id integer CONSTRAINT transactions_transaction_id_not_null NOT NULL,
    account_id integer,
    transaction_type character varying(20),
    amount numeric(12,2),
    transaction_time timestamp without time zone
)
SERVER karachi_server
OPTIONS (
    schema_name 'public',
    table_name 'transactions'
);
ALTER FOREIGN TABLE ONLY public.transactions_karachi ALTER COLUMN transaction_id OPTIONS (
    column_name 'transaction_id'
);
ALTER FOREIGN TABLE ONLY public.transactions_karachi ALTER COLUMN account_id OPTIONS (
    column_name 'account_id'
);
ALTER FOREIGN TABLE ONLY public.transactions_karachi ALTER COLUMN transaction_type OPTIONS (
    column_name 'transaction_type'
);
ALTER FOREIGN TABLE ONLY public.transactions_karachi ALTER COLUMN amount OPTIONS (
    column_name 'amount'
);
ALTER FOREIGN TABLE ONLY public.transactions_karachi ALTER COLUMN transaction_time OPTIONS (
    column_name 'transaction_time'
);


ALTER FOREIGN TABLE public.transactions_karachi OWNER TO postgres;

--
-- Name: transactions_lahore; Type: FOREIGN TABLE; Schema: public; Owner: postgres
--

CREATE FOREIGN TABLE public.transactions_lahore (
    transaction_id integer CONSTRAINT transactions_transaction_id_not_null1 NOT NULL,
    account_id integer,
    transaction_type character varying(20),
    amount numeric(12,2),
    transaction_time timestamp without time zone
)
SERVER lahore_server
OPTIONS (
    schema_name 'public',
    table_name 'transactions'
);
ALTER FOREIGN TABLE ONLY public.transactions_lahore ALTER COLUMN transaction_id OPTIONS (
    column_name 'transaction_id'
);
ALTER FOREIGN TABLE ONLY public.transactions_lahore ALTER COLUMN account_id OPTIONS (
    column_name 'account_id'
);
ALTER FOREIGN TABLE ONLY public.transactions_lahore ALTER COLUMN transaction_type OPTIONS (
    column_name 'transaction_type'
);
ALTER FOREIGN TABLE ONLY public.transactions_lahore ALTER COLUMN amount OPTIONS (
    column_name 'amount'
);
ALTER FOREIGN TABLE ONLY public.transactions_lahore ALTER COLUMN transaction_time OPTIONS (
    column_name 'transaction_time'
);


ALTER FOREIGN TABLE public.transactions_lahore OWNER TO postgres;

--
-- Name: all_transactions; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.all_transactions AS
 SELECT transactions_karachi.transaction_id,
    transactions_karachi.account_id,
    transactions_karachi.transaction_type,
    transactions_karachi.amount,
    transactions_karachi.transaction_time
   FROM public.transactions_karachi
UNION ALL
 SELECT transactions_lahore.transaction_id,
    transactions_lahore.account_id,
    transactions_lahore.transaction_type,
    transactions_lahore.amount,
    transactions_lahore.transaction_time
   FROM public.transactions_lahore
UNION ALL
 SELECT transactions_islamabad.transaction_id,
    transactions_islamabad.account_id,
    transactions_islamabad.transaction_type,
    transactions_islamabad.amount,
    transactions_islamabad.transaction_time
   FROM public.transactions_islamabad;


ALTER VIEW public.all_transactions OWNER TO postgres;

--
-- Name: TABLE stocks_karachi; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.stocks_karachi TO analyst;


--
-- Name: TABLE stocks_lahore; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.stocks_lahore TO analyst;


--
-- Name: TABLE trades_karachi; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.trades_karachi TO analyst;


--
-- Name: TABLE trades_lahore; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.trades_lahore TO analyst;


--
-- PostgreSQL database dump complete
--

\unrestrict V9dUIL0tgdtd87Vi1DvfH3sfQfCceRfTuFuH4Bjxv7dDcshLWRP0GqeWX5fMkX6

