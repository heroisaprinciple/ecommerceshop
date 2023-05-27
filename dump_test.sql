--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7 (Ubuntu 14.7-1.pgdg22.04+1)
-- Dumped by pg_dump version 14.7 (Ubuntu 14.7-1.pgdg22.04+1)

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
-- Name: active_admin_comments; Type: TABLE; Schema: public; Owner: arina
--

CREATE TABLE public.active_admin_comments (
    id bigint NOT NULL,
    namespace character varying,
    body text,
    resource_type character varying,
    resource_id bigint,
    author_type character varying,
    author_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.active_admin_comments OWNER TO arina;

--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: arina
--

CREATE SEQUENCE public.active_admin_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_admin_comments_id_seq OWNER TO arina;

--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arina
--

ALTER SEQUENCE public.active_admin_comments_id_seq OWNED BY public.active_admin_comments.id;


--
-- Name: addresses; Type: TABLE; Schema: public; Owner: arina
--

CREATE TABLE public.addresses (
    id bigint NOT NULL,
    country character varying,
    city character varying,
    street character varying,
    comment text,
    user_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.addresses OWNER TO arina;

--
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: arina
--

CREATE SEQUENCE public.addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.addresses_id_seq OWNER TO arina;

--
-- Name: addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arina
--

ALTER SEQUENCE public.addresses_id_seq OWNED BY public.addresses.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: arina
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO arina;

--
-- Name: billings; Type: TABLE; Schema: public; Owner: arina
--

CREATE TABLE public.billings (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.billings OWNER TO arina;

--
-- Name: billings_id_seq; Type: SEQUENCE; Schema: public; Owner: arina
--

CREATE SEQUENCE public.billings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.billings_id_seq OWNER TO arina;

--
-- Name: billings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arina
--

ALTER SEQUENCE public.billings_id_seq OWNED BY public.billings.id;


--
-- Name: cart_products; Type: TABLE; Schema: public; Owner: arina
--

CREATE TABLE public.cart_products (
    id bigint NOT NULL,
    cart_id bigint NOT NULL,
    product_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.cart_products OWNER TO arina;

--
-- Name: cart_products_id_seq; Type: SEQUENCE; Schema: public; Owner: arina
--

CREATE SEQUENCE public.cart_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cart_products_id_seq OWNER TO arina;

--
-- Name: cart_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arina
--

ALTER SEQUENCE public.cart_products_id_seq OWNED BY public.cart_products.id;


--
-- Name: carts; Type: TABLE; Schema: public; Owner: arina
--

CREATE TABLE public.carts (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.carts OWNER TO arina;

--
-- Name: carts_id_seq; Type: SEQUENCE; Schema: public; Owner: arina
--

CREATE SEQUENCE public.carts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.carts_id_seq OWNER TO arina;

--
-- Name: carts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arina
--

ALTER SEQUENCE public.carts_id_seq OWNED BY public.carts.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: arina
--

CREATE TABLE public.categories (
    id bigint NOT NULL,
    name character varying,
    priority integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    slug character varying
);


ALTER TABLE public.categories OWNER TO arina;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: arina
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO arina;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arina
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: friendly_id_slugs; Type: TABLE; Schema: public; Owner: arina
--

CREATE TABLE public.friendly_id_slugs (
    id bigint NOT NULL,
    slug character varying NOT NULL,
    sluggable_id integer NOT NULL,
    sluggable_type character varying(50),
    scope character varying,
    created_at timestamp(6) without time zone
);


ALTER TABLE public.friendly_id_slugs OWNER TO arina;

--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE; Schema: public; Owner: arina
--

CREATE SEQUENCE public.friendly_id_slugs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.friendly_id_slugs_id_seq OWNER TO arina;

--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arina
--

ALTER SEQUENCE public.friendly_id_slugs_id_seq OWNED BY public.friendly_id_slugs.id;


--
-- Name: order_details; Type: TABLE; Schema: public; Owner: arina
--

CREATE TABLE public.order_details (
    id bigint NOT NULL,
    firstname character varying,
    lastname character varying,
    email character varying,
    order_id bigint NOT NULL,
    address_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.order_details OWNER TO arina;

--
-- Name: order_details_id_seq; Type: SEQUENCE; Schema: public; Owner: arina
--

CREATE SEQUENCE public.order_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_details_id_seq OWNER TO arina;

--
-- Name: order_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arina
--

ALTER SEQUENCE public.order_details_id_seq OWNED BY public.order_details.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: arina
--

CREATE TABLE public.orders (
    id bigint NOT NULL,
    status integer,
    user_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    ordered_at timestamp(6) without time zone
);


ALTER TABLE public.orders OWNER TO arina;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: arina
--

CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO arina;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arina
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: pay_charges; Type: TABLE; Schema: public; Owner: arina
--

CREATE TABLE public.pay_charges (
    id bigint NOT NULL,
    customer_id bigint NOT NULL,
    subscription_id bigint,
    processor_id character varying NOT NULL,
    amount integer NOT NULL,
    currency character varying,
    application_fee_amount integer,
    amount_refunded integer,
    metadata jsonb,
    data jsonb,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.pay_charges OWNER TO arina;

--
-- Name: pay_charges_id_seq; Type: SEQUENCE; Schema: public; Owner: arina
--

CREATE SEQUENCE public.pay_charges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pay_charges_id_seq OWNER TO arina;

--
-- Name: pay_charges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arina
--

ALTER SEQUENCE public.pay_charges_id_seq OWNED BY public.pay_charges.id;


--
-- Name: pay_customers; Type: TABLE; Schema: public; Owner: arina
--

CREATE TABLE public.pay_customers (
    id bigint NOT NULL,
    owner_type character varying,
    owner_id bigint,
    processor character varying NOT NULL,
    processor_id character varying,
    "default" boolean,
    data jsonb,
    deleted_at timestamp without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.pay_customers OWNER TO arina;

--
-- Name: pay_customers_id_seq; Type: SEQUENCE; Schema: public; Owner: arina
--

CREATE SEQUENCE public.pay_customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pay_customers_id_seq OWNER TO arina;

--
-- Name: pay_customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arina
--

ALTER SEQUENCE public.pay_customers_id_seq OWNED BY public.pay_customers.id;


--
-- Name: pay_merchants; Type: TABLE; Schema: public; Owner: arina
--

CREATE TABLE public.pay_merchants (
    id bigint NOT NULL,
    owner_type character varying,
    owner_id bigint,
    processor character varying NOT NULL,
    processor_id character varying,
    "default" boolean,
    data jsonb,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.pay_merchants OWNER TO arina;

--
-- Name: pay_merchants_id_seq; Type: SEQUENCE; Schema: public; Owner: arina
--

CREATE SEQUENCE public.pay_merchants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pay_merchants_id_seq OWNER TO arina;

--
-- Name: pay_merchants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arina
--

ALTER SEQUENCE public.pay_merchants_id_seq OWNED BY public.pay_merchants.id;


--
-- Name: pay_payment_methods; Type: TABLE; Schema: public; Owner: arina
--

CREATE TABLE public.pay_payment_methods (
    id bigint NOT NULL,
    customer_id bigint NOT NULL,
    processor_id character varying NOT NULL,
    "default" boolean,
    type character varying,
    data jsonb,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.pay_payment_methods OWNER TO arina;

--
-- Name: pay_payment_methods_id_seq; Type: SEQUENCE; Schema: public; Owner: arina
--

CREATE SEQUENCE public.pay_payment_methods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pay_payment_methods_id_seq OWNER TO arina;

--
-- Name: pay_payment_methods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arina
--

ALTER SEQUENCE public.pay_payment_methods_id_seq OWNED BY public.pay_payment_methods.id;


--
-- Name: pay_subscriptions; Type: TABLE; Schema: public; Owner: arina
--

CREATE TABLE public.pay_subscriptions (
    id bigint NOT NULL,
    customer_id bigint NOT NULL,
    name character varying NOT NULL,
    processor_id character varying NOT NULL,
    processor_plan character varying NOT NULL,
    quantity integer DEFAULT 1 NOT NULL,
    status character varying NOT NULL,
    current_period_start timestamp without time zone,
    current_period_end timestamp without time zone,
    trial_ends_at timestamp without time zone,
    ends_at timestamp without time zone,
    metered boolean,
    pause_behavior character varying,
    pause_starts_at timestamp without time zone,
    pause_resumes_at timestamp without time zone,
    application_fee_percent numeric(8,2),
    metadata jsonb,
    data jsonb,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.pay_subscriptions OWNER TO arina;

--
-- Name: pay_subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: arina
--

CREATE SEQUENCE public.pay_subscriptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pay_subscriptions_id_seq OWNER TO arina;

--
-- Name: pay_subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arina
--

ALTER SEQUENCE public.pay_subscriptions_id_seq OWNED BY public.pay_subscriptions.id;


--
-- Name: pay_webhooks; Type: TABLE; Schema: public; Owner: arina
--

CREATE TABLE public.pay_webhooks (
    id bigint NOT NULL,
    processor character varying,
    event_type character varying,
    event jsonb,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.pay_webhooks OWNER TO arina;

--
-- Name: pay_webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: arina
--

CREATE SEQUENCE public.pay_webhooks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pay_webhooks_id_seq OWNER TO arina;

--
-- Name: pay_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arina
--

ALTER SEQUENCE public.pay_webhooks_id_seq OWNED BY public.pay_webhooks.id;


--
-- Name: payments; Type: TABLE; Schema: public; Owner: arina
--

CREATE TABLE public.payments (
    id bigint NOT NULL,
    status character varying,
    sum double precision,
    payment_method character varying,
    user_id bigint NOT NULL,
    cart_id bigint NOT NULL,
    paid_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.payments OWNER TO arina;

--
-- Name: payments_id_seq; Type: SEQUENCE; Schema: public; Owner: arina
--

CREATE SEQUENCE public.payments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payments_id_seq OWNER TO arina;

--
-- Name: payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arina
--

ALTER SEQUENCE public.payments_id_seq OWNED BY public.payments.id;


--
-- Name: product_orders; Type: TABLE; Schema: public; Owner: arina
--

CREATE TABLE public.product_orders (
    id bigint NOT NULL,
    amount integer,
    order_id bigint NOT NULL,
    product_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.product_orders OWNER TO arina;

--
-- Name: product_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: arina
--

CREATE SEQUENCE public.product_orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_orders_id_seq OWNER TO arina;

--
-- Name: product_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arina
--

ALTER SEQUENCE public.product_orders_id_seq OWNED BY public.product_orders.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: arina
--

CREATE TABLE public.products (
    id bigint NOT NULL,
    name character varying,
    price numeric,
    amount_left integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    description character varying,
    category_id bigint,
    sales_count integer DEFAULT 0 NOT NULL,
    stripe_price_id character varying,
    slug character varying
);


ALTER TABLE public.products OWNER TO arina;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: arina
--

CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO arina;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arina
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: arina
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO arina;

--
-- Name: shops; Type: TABLE; Schema: public; Owner: arina
--

CREATE TABLE public.shops (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.shops OWNER TO arina;

--
-- Name: shops_id_seq; Type: SEQUENCE; Schema: public; Owner: arina
--

CREATE SEQUENCE public.shops_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shops_id_seq OWNER TO arina;

--
-- Name: shops_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arina
--

ALTER SEQUENCE public.shops_id_seq OWNED BY public.shops.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: arina
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp(6) without time zone,
    remember_created_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    phone character varying,
    first_name character varying,
    last_name character varying
);


ALTER TABLE public.users OWNER TO arina;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: arina
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO arina;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arina
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: active_admin_comments id; Type: DEFAULT; Schema: public; Owner: arina
--

ALTER TABLE ONLY public.active_admin_comments ALTER COLUMN id SET DEFAULT nextval('public.active_admin_comments_id_seq'::regclass);


--
-- Name: addresses id; Type: DEFAULT; Schema: public; Owner: arina
--

ALTER TABLE ONLY public.addresses ALTER COLUMN id SET DEFAULT nextval('public.addresses_id_seq'::regclass);


--
-- Name: billings id; Type: DEFAULT; Schema: public; Owner: arina
--

ALTER TABLE ONLY public.billings ALTER COLUMN id SET DEFAULT nextval('public.billings_id_seq'::regclass);


--
-- Name: cart_products id; Type: DEFAULT; Schema: public; Owner: arina
--

ALTER TABLE ONLY public.cart_products ALTER COLUMN id SET DEFAULT nextval('public.cart_products_id_seq'::regclass);


--
-- Name: carts id; Type: DEFAULT; Schema: public; Owner: arina
--

ALTER TABLE ONLY public.carts ALTER COLUMN id SET DEFAULT nextval('public.carts_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: arina
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: friendly_id_slugs id; Type: DEFAULT; Schema: public; Owner: arina
--

ALTER TABLE ONLY public.friendly_id_slugs ALTER COLUMN id SET DEFAULT nextval('public.friendly_id_slugs_id_seq'::regclass);


--
-- Name: order_details id; Type: DEFAULT; Schema: public; Owner: arina
--

ALTER TABLE ONLY public.order_details ALTER COLUMN id SET DEFAULT nextval('public.order_details_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: arina
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: pay_charges id; Type: DEFAULT; Schema: public; Owner: arina
--

ALTER TABLE ONLY public.pay_charges ALTER COLUMN id SET DEFAULT nextval('public.pay_charges_id_seq'::regclass);


--
-- Name: pay_customers id; Type: DEFAULT; Schema: public; Owner: arina
--

ALTER TABLE ONLY public.pay_customers ALTER COLUMN id SET DEFAULT nextval('public.pay_customers_id_seq'::regclass);


--
-- Name: pay_merchants id; Type: DEFAULT; Schema: public; Owner: arina
--

ALTER TABLE ONLY public.pay_merchants ALTER COLUMN id SET DEFAULT nextval('public.pay_merchants_id_seq'::regclass);


--
-- Name: pay_payment_methods id; Type: DEFAULT; Schema: public; Owner: arina
--

ALTER TABLE ONLY public.pay_payment_methods ALTER COLUMN id SET DEFAULT nextval('public.pay_payment_methods_id_seq'::regclass);


--
-- Name: pay_subscriptions id; Type: DEFAULT; Schema: public; Owner: arina
--

ALTER TABLE ONLY public.pay_subscriptions ALTER COLUMN id SET DEFAULT nextval('public.pay_subscriptions_id_seq'::regclass);


--
-- Name: pay_webhooks id; Type: DEFAULT; Schema: public; Owner: arina
--

ALTER TABLE ONLY public.pay_webhooks ALTER COLUMN id SET DEFAULT nextval('public.pay_webhooks_id_seq'::regclass);


--
-- Name: payments id; Type: DEFAULT; Schema: public; Owner: arina
--

ALTER TABLE ONLY public.payments ALTER COLUMN id SET DEFAULT nextval('public.payments_id_seq'::regclass);


--
-- Name: product_orders id; Type: DEFAULT; Schema: public; Owner: arina
--

ALTER TABLE ONLY public.product_orders ALTER COLUMN id SET DEFAULT nextval('public.product_orders_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: arina
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: shops id; Type: DEFAULT; Schema: public; Owner: arina
--

ALTER TABLE ONLY public.shops ALTER COLUMN id SET DEFAULT nextval('public.shops_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: arina
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: active_admin_comments; Type: TABLE DATA; Schema: public; Owner: arina
--

COPY public.active_admin_comments (id, namespace, body, resource_type, resource_id, author_type, author_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: arina
--

COPY public.addresses (id, country, city, street, comment, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: arina
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	test	2023-01-18 13:53:49.793655	2023-05-17 16:42:59.632482
schema_sha1	fff16ea0f7a66f4bafb5897878ca4b87912f7f32	2023-01-18 13:53:49.803014	2023-05-17 16:42:59.641534
\.


--
-- Data for Name: billings; Type: TABLE DATA; Schema: public; Owner: arina
--

COPY public.billings (id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: cart_products; Type: TABLE DATA; Schema: public; Owner: arina
--

COPY public.cart_products (id, cart_id, product_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: carts; Type: TABLE DATA; Schema: public; Owner: arina
--

COPY public.carts (id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: arina
--

COPY public.categories (id, name, priority, created_at, updated_at, slug) FROM stdin;
\.


--
-- Data for Name: friendly_id_slugs; Type: TABLE DATA; Schema: public; Owner: arina
--

COPY public.friendly_id_slugs (id, slug, sluggable_id, sluggable_type, scope, created_at) FROM stdin;
\.


--
-- Data for Name: order_details; Type: TABLE DATA; Schema: public; Owner: arina
--

COPY public.order_details (id, firstname, lastname, email, order_id, address_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: arina
--

COPY public.orders (id, status, user_id, created_at, updated_at, ordered_at) FROM stdin;
\.


--
-- Data for Name: pay_charges; Type: TABLE DATA; Schema: public; Owner: arina
--

COPY public.pay_charges (id, customer_id, subscription_id, processor_id, amount, currency, application_fee_amount, amount_refunded, metadata, data, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: pay_customers; Type: TABLE DATA; Schema: public; Owner: arina
--

COPY public.pay_customers (id, owner_type, owner_id, processor, processor_id, "default", data, deleted_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: pay_merchants; Type: TABLE DATA; Schema: public; Owner: arina
--

COPY public.pay_merchants (id, owner_type, owner_id, processor, processor_id, "default", data, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: pay_payment_methods; Type: TABLE DATA; Schema: public; Owner: arina
--

COPY public.pay_payment_methods (id, customer_id, processor_id, "default", type, data, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: pay_subscriptions; Type: TABLE DATA; Schema: public; Owner: arina
--

COPY public.pay_subscriptions (id, customer_id, name, processor_id, processor_plan, quantity, status, current_period_start, current_period_end, trial_ends_at, ends_at, metered, pause_behavior, pause_starts_at, pause_resumes_at, application_fee_percent, metadata, data, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: pay_webhooks; Type: TABLE DATA; Schema: public; Owner: arina
--

COPY public.pay_webhooks (id, processor, event_type, event, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: arina
--

COPY public.payments (id, status, sum, payment_method, user_id, cart_id, paid_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: product_orders; Type: TABLE DATA; Schema: public; Owner: arina
--

COPY public.product_orders (id, amount, order_id, product_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: arina
--

COPY public.products (id, name, price, amount_left, created_at, updated_at, description, category_id, sales_count, stripe_price_id, slug) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: arina
--

COPY public.schema_migrations (version) FROM stdin;
20230118130222
20230118144804
20230119132326
20230124163629
20230121215555
20230121215808
20230122121742
20230123075058
20230131155008
20230131155048
20230516164226
20230123075616
20230124164106
20230207111752
20230207162009
20230207165310
20230211151444
20230212114047
20230212203341
20230513150340
20230515083210
20230515083751
20230515083848
20230516125556
20230518135714
20230521142239
20230521142308
20230521142954
20230521170235
20230522081253
\.


--
-- Data for Name: shops; Type: TABLE DATA; Schema: public; Owner: arina
--

COPY public.shops (id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: arina
--

COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, created_at, updated_at, phone, first_name, last_name) FROM stdin;
\.


--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arina
--

SELECT pg_catalog.setval('public.active_admin_comments_id_seq', 1, false);


--
-- Name: addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arina
--

SELECT pg_catalog.setval('public.addresses_id_seq', 1, false);


--
-- Name: billings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arina
--

SELECT pg_catalog.setval('public.billings_id_seq', 1, false);


--
-- Name: cart_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arina
--

SELECT pg_catalog.setval('public.cart_products_id_seq', 41, true);


--
-- Name: carts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arina
--

SELECT pg_catalog.setval('public.carts_id_seq', 65, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arina
--

SELECT pg_catalog.setval('public.categories_id_seq', 1487, true);


--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arina
--

SELECT pg_catalog.setval('public.friendly_id_slugs_id_seq', 1247, true);


--
-- Name: order_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arina
--

SELECT pg_catalog.setval('public.order_details_id_seq', 1, false);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arina
--

SELECT pg_catalog.setval('public.orders_id_seq', 21, true);


--
-- Name: pay_charges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arina
--

SELECT pg_catalog.setval('public.pay_charges_id_seq', 1, false);


--
-- Name: pay_customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arina
--

SELECT pg_catalog.setval('public.pay_customers_id_seq', 1, false);


--
-- Name: pay_merchants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arina
--

SELECT pg_catalog.setval('public.pay_merchants_id_seq', 1, false);


--
-- Name: pay_payment_methods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arina
--

SELECT pg_catalog.setval('public.pay_payment_methods_id_seq', 1, false);


--
-- Name: pay_subscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arina
--

SELECT pg_catalog.setval('public.pay_subscriptions_id_seq', 1, false);


--
-- Name: pay_webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arina
--

SELECT pg_catalog.setval('public.pay_webhooks_id_seq', 1, false);


--
-- Name: payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arina
--

SELECT pg_catalog.setval('public.payments_id_seq', 1, false);


--
-- Name: product_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arina
--

SELECT pg_catalog.setval('public.product_orders_id_seq', 1, false);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arina
--

SELECT pg_catalog.setval('public.products_id_seq', 747, true);


--
-- Name: shops_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arina
--

SELECT pg_catalog.setval('public.shops_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arina
--

SELECT pg_catalog.setval('public.users_id_seq', 93, true);


--
-- Name: active_admin_comments active_admin_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: arina
--

ALTER TABLE ONLY public.active_admin_comments
    ADD CONSTRAINT active_admin_comments_pkey PRIMARY KEY (id);


--
-- Name: addresses addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: arina
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: arina
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: billings billings_pkey; Type: CONSTRAINT; Schema: public; Owner: arina
--

ALTER TABLE ONLY public.billings
    ADD CONSTRAINT billings_pkey PRIMARY KEY (id);


--
-- Name: cart_products cart_products_pkey; Type: CONSTRAINT; Schema: public; Owner: arina
--

ALTER TABLE ONLY public.cart_products
    ADD CONSTRAINT cart_products_pkey PRIMARY KEY (id);


--
-- Name: carts carts_pkey; Type: CONSTRAINT; Schema: public; Owner: arina
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: arina
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: friendly_id_slugs friendly_id_slugs_pkey; Type: CONSTRAINT; Schema: public; Owner: arina
--

ALTER TABLE ONLY public.friendly_id_slugs
    ADD CONSTRAINT friendly_id_slugs_pkey PRIMARY KEY (id);


--
-- Name: order_details order_details_pkey; Type: CONSTRAINT; Schema: public; Owner: arina
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT order_details_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: arina
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: pay_charges pay_charges_pkey; Type: CONSTRAINT; Schema: public; Owner: arina
--

ALTER TABLE ONLY public.pay_charges
    ADD CONSTRAINT pay_charges_pkey PRIMARY KEY (id);


--
-- Name: pay_customers pay_customers_pkey; Type: CONSTRAINT; Schema: public; Owner: arina
--

ALTER TABLE ONLY public.pay_customers
    ADD CONSTRAINT pay_customers_pkey PRIMARY KEY (id);


--
-- Name: pay_merchants pay_merchants_pkey; Type: CONSTRAINT; Schema: public; Owner: arina
--

ALTER TABLE ONLY public.pay_merchants
    ADD CONSTRAINT pay_merchants_pkey PRIMARY KEY (id);


--
-- Name: pay_payment_methods pay_payment_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: arina
--

ALTER TABLE ONLY public.pay_payment_methods
    ADD CONSTRAINT pay_payment_methods_pkey PRIMARY KEY (id);


--
-- Name: pay_subscriptions pay_subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: arina
--

ALTER TABLE ONLY public.pay_subscriptions
    ADD CONSTRAINT pay_subscriptions_pkey PRIMARY KEY (id);


--
-- Name: pay_webhooks pay_webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: arina
--

ALTER TABLE ONLY public.pay_webhooks
    ADD CONSTRAINT pay_webhooks_pkey PRIMARY KEY (id);


--
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: arina
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- Name: product_orders product_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: arina
--

ALTER TABLE ONLY public.product_orders
    ADD CONSTRAINT product_orders_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: arina
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: arina
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: shops shops_pkey; Type: CONSTRAINT; Schema: public; Owner: arina
--

ALTER TABLE ONLY public.shops
    ADD CONSTRAINT shops_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: arina
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_active_admin_comments_on_author; Type: INDEX; Schema: public; Owner: arina
--

CREATE INDEX index_active_admin_comments_on_author ON public.active_admin_comments USING btree (author_type, author_id);


--
-- Name: index_active_admin_comments_on_namespace; Type: INDEX; Schema: public; Owner: arina
--

CREATE INDEX index_active_admin_comments_on_namespace ON public.active_admin_comments USING btree (namespace);


--
-- Name: index_active_admin_comments_on_resource; Type: INDEX; Schema: public; Owner: arina
--

CREATE INDEX index_active_admin_comments_on_resource ON public.active_admin_comments USING btree (resource_type, resource_id);


--
-- Name: index_addresses_on_user_id; Type: INDEX; Schema: public; Owner: arina
--

CREATE INDEX index_addresses_on_user_id ON public.addresses USING btree (user_id);


--
-- Name: index_cart_products_on_cart_id; Type: INDEX; Schema: public; Owner: arina
--

CREATE INDEX index_cart_products_on_cart_id ON public.cart_products USING btree (cart_id);


--
-- Name: index_cart_products_on_product_id; Type: INDEX; Schema: public; Owner: arina
--

CREATE INDEX index_cart_products_on_product_id ON public.cart_products USING btree (product_id);


--
-- Name: index_carts_on_user_id; Type: INDEX; Schema: public; Owner: arina
--

CREATE INDEX index_carts_on_user_id ON public.carts USING btree (user_id);


--
-- Name: index_categories_on_slug; Type: INDEX; Schema: public; Owner: arina
--

CREATE UNIQUE INDEX index_categories_on_slug ON public.categories USING btree (slug);


--
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type; Type: INDEX; Schema: public; Owner: arina
--

CREATE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type ON public.friendly_id_slugs USING btree (slug, sluggable_type);


--
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope; Type: INDEX; Schema: public; Owner: arina
--

CREATE UNIQUE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope ON public.friendly_id_slugs USING btree (slug, sluggable_type, scope);


--
-- Name: index_friendly_id_slugs_on_sluggable_type_and_sluggable_id; Type: INDEX; Schema: public; Owner: arina
--

CREATE INDEX index_friendly_id_slugs_on_sluggable_type_and_sluggable_id ON public.friendly_id_slugs USING btree (sluggable_type, sluggable_id);


--
-- Name: index_order_details_on_address_id; Type: INDEX; Schema: public; Owner: arina
--

CREATE INDEX index_order_details_on_address_id ON public.order_details USING btree (address_id);


--
-- Name: index_order_details_on_order_id; Type: INDEX; Schema: public; Owner: arina
--

CREATE INDEX index_order_details_on_order_id ON public.order_details USING btree (order_id);


--
-- Name: index_orders_on_user_id; Type: INDEX; Schema: public; Owner: arina
--

CREATE INDEX index_orders_on_user_id ON public.orders USING btree (user_id);


--
-- Name: index_pay_charges_on_customer_id_and_processor_id; Type: INDEX; Schema: public; Owner: arina
--

CREATE UNIQUE INDEX index_pay_charges_on_customer_id_and_processor_id ON public.pay_charges USING btree (customer_id, processor_id);


--
-- Name: index_pay_charges_on_subscription_id; Type: INDEX; Schema: public; Owner: arina
--

CREATE INDEX index_pay_charges_on_subscription_id ON public.pay_charges USING btree (subscription_id);


--
-- Name: index_pay_customers_on_processor_and_processor_id; Type: INDEX; Schema: public; Owner: arina
--

CREATE UNIQUE INDEX index_pay_customers_on_processor_and_processor_id ON public.pay_customers USING btree (processor, processor_id);


--
-- Name: index_pay_merchants_on_owner_type_and_owner_id_and_processor; Type: INDEX; Schema: public; Owner: arina
--

CREATE INDEX index_pay_merchants_on_owner_type_and_owner_id_and_processor ON public.pay_merchants USING btree (owner_type, owner_id, processor);


--
-- Name: index_pay_payment_methods_on_customer_id_and_processor_id; Type: INDEX; Schema: public; Owner: arina
--

CREATE UNIQUE INDEX index_pay_payment_methods_on_customer_id_and_processor_id ON public.pay_payment_methods USING btree (customer_id, processor_id);


--
-- Name: index_pay_subscriptions_on_customer_id_and_processor_id; Type: INDEX; Schema: public; Owner: arina
--

CREATE UNIQUE INDEX index_pay_subscriptions_on_customer_id_and_processor_id ON public.pay_subscriptions USING btree (customer_id, processor_id);


--
-- Name: index_pay_subscriptions_on_metered; Type: INDEX; Schema: public; Owner: arina
--

CREATE INDEX index_pay_subscriptions_on_metered ON public.pay_subscriptions USING btree (metered);


--
-- Name: index_pay_subscriptions_on_pause_starts_at; Type: INDEX; Schema: public; Owner: arina
--

CREATE INDEX index_pay_subscriptions_on_pause_starts_at ON public.pay_subscriptions USING btree (pause_starts_at);


--
-- Name: index_payments_on_cart_id; Type: INDEX; Schema: public; Owner: arina
--

CREATE INDEX index_payments_on_cart_id ON public.payments USING btree (cart_id);


--
-- Name: index_payments_on_user_id; Type: INDEX; Schema: public; Owner: arina
--

CREATE INDEX index_payments_on_user_id ON public.payments USING btree (user_id);


--
-- Name: index_product_orders_on_order_id; Type: INDEX; Schema: public; Owner: arina
--

CREATE INDEX index_product_orders_on_order_id ON public.product_orders USING btree (order_id);


--
-- Name: index_product_orders_on_product_id; Type: INDEX; Schema: public; Owner: arina
--

CREATE INDEX index_product_orders_on_product_id ON public.product_orders USING btree (product_id);


--
-- Name: index_products_on_category_id; Type: INDEX; Schema: public; Owner: arina
--

CREATE INDEX index_products_on_category_id ON public.products USING btree (category_id);


--
-- Name: index_products_on_slug; Type: INDEX; Schema: public; Owner: arina
--

CREATE UNIQUE INDEX index_products_on_slug ON public.products USING btree (slug);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: arina
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: arina
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: pay_customer_owner_index; Type: INDEX; Schema: public; Owner: arina
--

CREATE INDEX pay_customer_owner_index ON public.pay_customers USING btree (owner_type, owner_id, deleted_at, "default");


--
-- Name: payments fk_rails_081dc04a02; Type: FK CONSTRAINT; Schema: public; Owner: arina
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT fk_rails_081dc04a02 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: product_orders fk_rails_14f14aa898; Type: FK CONSTRAINT; Schema: public; Owner: arina
--

ALTER TABLE ONLY public.product_orders
    ADD CONSTRAINT fk_rails_14f14aa898 FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: payments fk_rails_2bc1cfea36; Type: FK CONSTRAINT; Schema: public; Owner: arina
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT fk_rails_2bc1cfea36 FOREIGN KEY (cart_id) REFERENCES public.carts(id);


--
-- Name: order_details fk_rails_3569a9f76c; Type: FK CONSTRAINT; Schema: public; Owner: arina
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT fk_rails_3569a9f76c FOREIGN KEY (address_id) REFERENCES public.addresses(id);


--
-- Name: pay_charges fk_rails_44a2c276fa; Type: FK CONSTRAINT; Schema: public; Owner: arina
--

ALTER TABLE ONLY public.pay_charges
    ADD CONSTRAINT fk_rails_44a2c276fa FOREIGN KEY (subscription_id) REFERENCES public.pay_subscriptions(id);


--
-- Name: addresses fk_rails_48c9e0c5a2; Type: FK CONSTRAINT; Schema: public; Owner: arina
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT fk_rails_48c9e0c5a2 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: product_orders fk_rails_72071d5a6c; Type: FK CONSTRAINT; Schema: public; Owner: arina
--

ALTER TABLE ONLY public.product_orders
    ADD CONSTRAINT fk_rails_72071d5a6c FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: cart_products fk_rails_a4f3e327f3; Type: FK CONSTRAINT; Schema: public; Owner: arina
--

ALTER TABLE ONLY public.cart_products
    ADD CONSTRAINT fk_rails_a4f3e327f3 FOREIGN KEY (cart_id) REFERENCES public.carts(id);


--
-- Name: pay_charges fk_rails_b19d32f835; Type: FK CONSTRAINT; Schema: public; Owner: arina
--

ALTER TABLE ONLY public.pay_charges
    ADD CONSTRAINT fk_rails_b19d32f835 FOREIGN KEY (customer_id) REFERENCES public.pay_customers(id);


--
-- Name: cart_products fk_rails_b6ff2a078a; Type: FK CONSTRAINT; Schema: public; Owner: arina
--

ALTER TABLE ONLY public.cart_products
    ADD CONSTRAINT fk_rails_b6ff2a078a FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: pay_subscriptions fk_rails_b7cd64d378; Type: FK CONSTRAINT; Schema: public; Owner: arina
--

ALTER TABLE ONLY public.pay_subscriptions
    ADD CONSTRAINT fk_rails_b7cd64d378 FOREIGN KEY (customer_id) REFERENCES public.pay_customers(id);


--
-- Name: pay_payment_methods fk_rails_c78c6cb84d; Type: FK CONSTRAINT; Schema: public; Owner: arina
--

ALTER TABLE ONLY public.pay_payment_methods
    ADD CONSTRAINT fk_rails_c78c6cb84d FOREIGN KEY (customer_id) REFERENCES public.pay_customers(id);


--
-- Name: order_details fk_rails_e5976611fd; Type: FK CONSTRAINT; Schema: public; Owner: arina
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT fk_rails_e5976611fd FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: carts fk_rails_ea59a35211; Type: FK CONSTRAINT; Schema: public; Owner: arina
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT fk_rails_ea59a35211 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: orders fk_rails_f868b47f6a; Type: FK CONSTRAINT; Schema: public; Owner: arina
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_rails_f868b47f6a FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: products fk_rails_fb915499a4; Type: FK CONSTRAINT; Schema: public; Owner: arina
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT fk_rails_fb915499a4 FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- PostgreSQL database dump complete
--

