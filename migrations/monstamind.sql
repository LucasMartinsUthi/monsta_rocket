CREATE TABLE public.admin_key (
    id bigint NOT NULL,
    key character varying(100) NOT NULL,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE public.admin_key OWNER TO marc;

--
-- Name: access_key_id_seq; Type: SEQUENCE; Schema: public; Owner: marc
--

CREATE SEQUENCE public.access_key_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.access_key_id_seq OWNER TO marc;

--
-- Name: access_key_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marc
--

ALTER SEQUENCE public.access_key_id_seq OWNED BY public.admin_key.id;


--
-- Name: account; Type: TABLE; Schema: public; Owner: marc
--

CREATE TABLE public.account (
    id bigint NOT NULL,
    name character varying(1000) NOT NULL,
    email_alerts bigint NOT NULL,
    sms_alerts bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    entity_type character varying DEFAULT 'CompanyEntity'::character varying NOT NULL,
    document character varying DEFAULT ''::character varying NOT NULL,
    finance_email character varying DEFAULT ''::character varying NOT NULL,
    area_code character varying DEFAULT ''::character varying NOT NULL,
    telephone character varying DEFAULT ''::character varying NOT NULL,
    state character varying DEFAULT ''::character varying NOT NULL,
    city character varying DEFAULT ''::character varying NOT NULL,
    city_ibge_code character varying DEFAULT ''::character varying NOT NULL,
    postal_code character varying DEFAULT ''::character varying NOT NULL,
    district character varying DEFAULT ''::character varying NOT NULL,
    street character varying DEFAULT ''::character varying NOT NULL,
    street_number character varying DEFAULT ''::character varying NOT NULL,
    address_complement character varying DEFAULT ''::character varying,
    inscricao_municipal character varying,
    inscricao_estadual character varying,
    enable_alerts boolean,
    telegram_code character varying,
    telegram_chat_id character varying,
    iss_retido boolean DEFAULT false NOT NULL
);


ALTER TABLE public.account OWNER TO marc;

--
-- Name: account_alert; Type: TABLE; Schema: public; Owner: marc
--

CREATE TABLE public.account_alert (
    id bigint NOT NULL,
    account_id bigint NOT NULL,
    ident character varying NOT NULL,
    sent boolean NOT NULL
);


ALTER TABLE public.account_alert OWNER TO marc;

--
-- Name: account_alert_id_seq; Type: SEQUENCE; Schema: public; Owner: marc
--

CREATE SEQUENCE public.account_alert_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_alert_id_seq OWNER TO marc;

--
-- Name: account_alert_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marc
--

ALTER SEQUENCE public.account_alert_id_seq OWNED BY public.account_alert.id;


--
-- Name: account_id_seq; Type: SEQUENCE; Schema: public; Owner: marc
--

CREATE SEQUENCE public.account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_id_seq OWNER TO marc;

--
-- Name: account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marc
--

ALTER SEQUENCE public.account_id_seq OWNED BY public.account.id;


--
-- Name: account_log; Type: TABLE; Schema: public; Owner: monsta
--

CREATE TABLE public.account_log (
    id bigint NOT NULL,
    account_id bigint NOT NULL,
    purchase_id bigint,
    nota_id bigint,
    client_visible boolean NOT NULL,
    description character varying NOT NULL,
    value double precision,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE public.account_log OWNER TO monsta;

--
-- Name: account_log_id_seq; Type: SEQUENCE; Schema: public; Owner: monsta
--

CREATE SEQUENCE public.account_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_log_id_seq OWNER TO monsta;

--
-- Name: account_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: monsta
--

ALTER SEQUENCE public.account_log_id_seq OWNED BY public.account_log.id;


--
-- Name: alert; Type: TABLE; Schema: public; Owner: monsta
--

CREATE TABLE public.alert (
    id integer NOT NULL,
    account_id bigint,
    client_id bigint,
    alert_type character varying NOT NULL,
    recipient character varying NOT NULL,
    subject character varying,
    body character varying NOT NULL,
    deliver_at timestamp with time zone NOT NULL,
    gateway character varying,
    external_id character varying,
    status character varying NOT NULL,
    error_code character varying,
    error_message character varying,
    last_attempt_at timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    uuid character varying
);


ALTER TABLE public.alert OWNER TO monsta;

--
-- Name: alert_group; Type: TABLE; Schema: public; Owner: marc
--

CREATE TABLE public.alert_group (
    id integer NOT NULL,
    account_id bigint NOT NULL,
    name character varying NOT NULL,
    email_alert_on_warn boolean NOT NULL,
    sms_alert_on_warn boolean NOT NULL,
    email_alert_on_critical boolean NOT NULL,
    sms_alert_on_critical boolean NOT NULL,
    email_alert_for character varying NOT NULL,
    sms_alert_for character varying NOT NULL,
    email character varying NOT NULL,
    sms character varying NOT NULL,
    period character varying NOT NULL,
    group_type character varying NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.alert_group OWNER TO marc;

--
-- Name: alert_group_id_seq; Type: SEQUENCE; Schema: public; Owner: marc
--

CREATE SEQUENCE public.alert_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.alert_group_id_seq OWNER TO marc;

--
-- Name: alert_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marc
--

ALTER SEQUENCE public.alert_group_id_seq OWNED BY public.alert_group.id;


--
-- Name: alert_id_seq; Type: SEQUENCE; Schema: public; Owner: monsta
--

CREATE SEQUENCE public.alert_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.alert_id_seq OWNER TO monsta;

--
-- Name: alert_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: monsta
--

ALTER SEQUENCE public.alert_id_seq OWNED BY public.alert.id;


--
-- Name: backup; Type: TABLE; Schema: public; Owner: monsta
--

CREATE TABLE public.backup (
    id bigint NOT NULL,
    account_id bigint NOT NULL,
    slot character varying(255) NOT NULL,
    data bytea NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    client_ident character varying DEFAULT 'common'::character varying NOT NULL
);


ALTER TABLE public.backup OWNER TO monsta;

--
-- Name: backup_id_seq; Type: SEQUENCE; Schema: public; Owner: monsta
--

CREATE SEQUENCE public.backup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.backup_id_seq OWNER TO monsta;

--
-- Name: backup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: monsta
--

ALTER SEQUENCE public.backup_id_seq OWNED BY public.backup.id;


--
-- Name: cidade; Type: TABLE; Schema: public; Owner: marc
--

CREATE TABLE public.cidade (
    id bigint NOT NULL,
    nome character varying NOT NULL,
    codigo_ibge character varying NOT NULL,
    estado_id bigint NOT NULL,
    populacao2010 bigint,
    densidade_demo double precision,
    gentilico character varying,
    area double precision,
    codigo_tom character varying
);


ALTER TABLE public.cidade OWNER TO marc;

--
-- Name: cidade_id_seq; Type: SEQUENCE; Schema: public; Owner: marc
--

CREATE SEQUENCE public.cidade_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cidade_id_seq OWNER TO marc;

--
-- Name: cidade_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marc
--

ALTER SEQUENCE public.cidade_id_seq OWNED BY public.cidade.id;


--
-- Name: client_status; Type: TABLE; Schema: public; Owner: marc
--

CREATE TABLE public.client_status (
    id integer NOT NULL,
    account_id bigint NOT NULL,
    last_ping timestamp with time zone NOT NULL,
    disconnect_alert_sent boolean NOT NULL,
    disconnected boolean NOT NULL,
    reconnect_alert_sent boolean NOT NULL,
    version character varying,
    license_key_id bigint
);


ALTER TABLE public.client_status OWNER TO marc;

--
-- Name: client_status_id_seq; Type: SEQUENCE; Schema: public; Owner: marc
--

CREATE SEQUENCE public.client_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.client_status_id_seq OWNER TO marc;

--
-- Name: client_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marc
--

ALTER SEQUENCE public.client_status_id_seq OWNED BY public.client_status.id;


--
-- Name: coupon; Type: TABLE; Schema: public; Owner: marc
--

CREATE TABLE public.coupon (
    id bigint NOT NULL,
    code character varying NOT NULL,
    valid_from timestamp with time zone,
    valid_until timestamp with time zone,
    discount_pct double precision NOT NULL,
    quantity bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    discount_value double precision
);


ALTER TABLE public.coupon OWNER TO marc;

--
-- Name: coupon_id_seq; Type: SEQUENCE; Schema: public; Owner: marc
--

CREATE SEQUENCE public.coupon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coupon_id_seq OWNER TO marc;

--
-- Name: coupon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marc
--

ALTER SEQUENCE public.coupon_id_seq OWNED BY public.coupon.id;


--
-- Name: email_blacklist; Type: TABLE; Schema: public; Owner: marc
--

CREATE TABLE public.email_blacklist (
    id bigint NOT NULL,
    recipient character varying NOT NULL
);


ALTER TABLE public.email_blacklist OWNER TO marc;

--
-- Name: email_blacklist_id_seq; Type: SEQUENCE; Schema: public; Owner: marc
--

CREATE SEQUENCE public.email_blacklist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.email_blacklist_id_seq OWNER TO marc;

--
-- Name: email_blacklist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marc
--

ALTER SEQUENCE public.email_blacklist_id_seq OWNED BY public.email_blacklist.id;


--
-- Name: estado; Type: TABLE; Schema: public; Owner: marc
--

CREATE TABLE public.estado (
    id bigint NOT NULL,
    nome character varying NOT NULL,
    sigla character varying NOT NULL
);


ALTER TABLE public.estado OWNER TO marc;

--
-- Name: estado_id_seq; Type: SEQUENCE; Schema: public; Owner: marc
--

CREATE SEQUENCE public.estado_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.estado_id_seq OWNER TO marc;

--
-- Name: estado_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marc
--

ALTER SEQUENCE public.estado_id_seq OWNED BY public.estado.id;


--
-- Name: license_key; Type: TABLE; Schema: public; Owner: marc
--

CREATE TABLE public.license_key (
    id integer NOT NULL,
    account_id bigint,
    owner character varying NOT NULL,
    license_type character varying NOT NULL,
    key character varying NOT NULL,
    start_date timestamp with time zone,
    end_date timestamp with time zone,
    active boolean NOT NULL,
    signature character varying,
    created_at timestamp with time zone NOT NULL,
    installed boolean NOT NULL,
    duration bigint NOT NULL
);


ALTER TABLE public.license_key OWNER TO marc;

--
-- Name: license_key_id_seq; Type: SEQUENCE; Schema: public; Owner: marc
--

CREATE SEQUENCE public.license_key_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.license_key_id_seq OWNER TO marc;

--
-- Name: license_key_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marc
--

ALTER SEQUENCE public.license_key_id_seq OWNED BY public.license_key.id;


--
-- Name: log; Type: TABLE; Schema: public; Owner: monsta
--

CREATE TABLE public.log (
    id integer NOT NULL,
    account_id bigint,
    category character varying NOT NULL,
    type character varying NOT NULL,
    info character varying,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE public.log OWNER TO monsta;

--
-- Name: log_id_seq; Type: SEQUENCE; Schema: public; Owner: monsta
--

CREATE SEQUENCE public.log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.log_id_seq OWNER TO monsta;

--
-- Name: log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: monsta
--

ALTER SEQUENCE public.log_id_seq OWNED BY public.log.id;


--
-- Name: next_number; Type: TABLE; Schema: public; Owner: marc
--

CREATE TABLE public.next_number (
    id bigint NOT NULL,
    ident character varying NOT NULL,
    number bigint NOT NULL
);


ALTER TABLE public.next_number OWNER TO marc;

--
-- Name: next_number_id_seq; Type: SEQUENCE; Schema: public; Owner: marc
--

CREATE SEQUENCE public.next_number_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.next_number_id_seq OWNER TO marc;

--
-- Name: next_number_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marc
--

ALTER SEQUENCE public.next_number_id_seq OWNED BY public.next_number.id;


--
-- Name: nota; Type: TABLE; Schema: public; Owner: marc
--

CREATE TABLE public.nota (
    id bigint NOT NULL,
    purchase_id bigint NOT NULL,
    serie character varying NOT NULL,
    numero bigint NOT NULL,
    protocolo character varying NOT NULL,
    xml character varying,
    nfse_link character varying,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE public.nota OWNER TO marc;

--
-- Name: nota_id_seq; Type: SEQUENCE; Schema: public; Owner: marc
--

CREATE SEQUENCE public.nota_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nota_id_seq OWNER TO marc;

--
-- Name: nota_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marc
--

ALTER SEQUENCE public.nota_id_seq OWNED BY public.nota.id;


--
-- Name: package; Type: TABLE; Schema: public; Owner: marc
--

CREATE TABLE public.package (
    id bigint NOT NULL,
    channel character varying(255) NOT NULL,
    base_version character varying(255) NOT NULL,
    version character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    arch character varying NOT NULL,
    enabled_accounts character varying,
    min_version character varying
);


ALTER TABLE public.package OWNER TO marc;

--
-- Name: package_id_seq; Type: SEQUENCE; Schema: public; Owner: marc
--

CREATE SEQUENCE public.package_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.package_id_seq OWNER TO marc;

--
-- Name: package_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marc
--

ALTER SEQUENCE public.package_id_seq OWNED BY public.package.id;


--
-- Name: purchase; Type: TABLE; Schema: public; Owner: marc
--

CREATE TABLE public.purchase (
    id bigint NOT NULL,
    account_id bigint NOT NULL,
    status character varying NOT NULL,
    error_message character varying,
    total_value double precision NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    coupon_id bigint
);


ALTER TABLE public.purchase OWNER TO marc;

--
-- Name: purchase_id_seq; Type: SEQUENCE; Schema: public; Owner: marc
--

CREATE SEQUENCE public.purchase_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.purchase_id_seq OWNER TO marc;

--
-- Name: purchase_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marc
--

ALTER SEQUENCE public.purchase_id_seq OWNED BY public.purchase.id;


--
-- Name: purchase_item; Type: TABLE; Schema: public; Owner: marc
--

CREATE TABLE public.purchase_item (
    id bigint NOT NULL,
    purchase_id bigint NOT NULL,
    item_type character varying NOT NULL,
    description character varying NOT NULL,
    unit_value double precision NOT NULL,
    quantity bigint NOT NULL,
    total_value double precision NOT NULL,
    license_years bigint
);


ALTER TABLE public.purchase_item OWNER TO marc;

--
-- Name: purchase_item_id_seq; Type: SEQUENCE; Schema: public; Owner: marc
--

CREATE SEQUENCE public.purchase_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.purchase_item_id_seq OWNER TO marc;

--
-- Name: purchase_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marc
--

ALTER SEQUENCE public.purchase_item_id_seq OWNED BY public.purchase_item.id;


--
-- Name: schema_info; Type: TABLE; Schema: public; Owner: marc
--

CREATE TABLE public.schema_info (
    version integer NOT NULL
);


ALTER TABLE public.schema_info OWNER TO marc;

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: marc
--

CREATE TABLE public.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE public.schema_migrations OWNER TO marc;

--
-- Name: telegram_chat; Type: TABLE; Schema: public; Owner: marc
--

CREATE TABLE public.telegram_chat (
    id bigint NOT NULL,
    account_id bigint NOT NULL,
    chat_id character varying NOT NULL,
    group_id character varying DEFAULT ''::character varying NOT NULL,
    username character varying DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.telegram_chat OWNER TO marc;

--
-- Name: telegram_chat_id_seq; Type: SEQUENCE; Schema: public; Owner: marc
--

CREATE SEQUENCE public.telegram_chat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.telegram_chat_id_seq OWNER TO marc;

--
-- Name: telegram_chat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marc
--

ALTER SEQUENCE public.telegram_chat_id_seq OWNED BY public.telegram_chat.id;


--
-- Name: transaction; Type: TABLE; Schema: public; Owner: marc
--

CREATE TABLE public.transaction (
    id bigint NOT NULL,
    purchase_id bigint NOT NULL,
    transaction_id character varying NOT NULL,
    status character varying NOT NULL,
    payment_method character varying NOT NULL,
    gross_amount double precision NOT NULL,
    discount_amount double precision NOT NULL,
    fee_amount double precision NOT NULL,
    net_amount double precision NOT NULL,
    extra_amount double precision NOT NULL,
    error_code bigint,
    error_message character varying,
    payment_link character varying,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    installment_fee_amount double precision DEFAULT 0 NOT NULL,
    intermediation_rate_amount double precision DEFAULT 0 NOT NULL,
    intermediation_fee_amount double precision DEFAULT 0 NOT NULL
);


ALTER TABLE public.transaction OWNER TO marc;

--
-- Name: transaction_id_seq; Type: SEQUENCE; Schema: public; Owner: marc
--

CREATE SEQUENCE public.transaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transaction_id_seq OWNER TO marc;

--
-- Name: transaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marc
--

ALTER SEQUENCE public.transaction_id_seq OWNED BY public.transaction.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: marc
--

CREATE TABLE public."user" (
    id bigint NOT NULL,
    account_id bigint NOT NULL,
    ident character varying NOT NULL,
    password character varying NOT NULL,
    created_at timestamp with time zone NOT NULL,
    last_login_at timestamp with time zone,
    last_login_ip character varying,
    password_reset_uuid character varying,
    is_admin boolean DEFAULT false NOT NULL
);


ALTER TABLE public."user" OWNER TO marc;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: marc
--

CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO marc;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marc
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: account id; Type: DEFAULT; Schema: public; Owner: marc
--

ALTER TABLE ONLY public.account ALTER COLUMN id SET DEFAULT nextval('public.account_id_seq'::regclass);


--
-- Name: account_alert id; Type: DEFAULT; Schema: public; Owner: marc
--

ALTER TABLE ONLY public.account_alert ALTER COLUMN id SET DEFAULT nextval('public.account_alert_id_seq'::regclass);


--
-- Name: account_log id; Type: DEFAULT; Schema: public; Owner: monsta
--

ALTER TABLE ONLY public.account_log ALTER COLUMN id SET DEFAULT nextval('public.account_log_id_seq'::regclass);


--
-- Name: admin_key id; Type: DEFAULT; Schema: public; Owner: marc
--

ALTER TABLE ONLY public.admin_key ALTER COLUMN id SET DEFAULT nextval('public.access_key_id_seq'::regclass);


--
-- Name: alert id; Type: DEFAULT; Schema: public; Owner: monsta
--

ALTER TABLE ONLY public.alert ALTER COLUMN id SET DEFAULT nextval('public.alert_id_seq'::regclass);


--
-- Name: alert_group id; Type: DEFAULT; Schema: public; Owner: marc
--

ALTER TABLE ONLY public.alert_group ALTER COLUMN id SET DEFAULT nextval('public.alert_group_id_seq'::regclass);


--
-- Name: backup id; Type: DEFAULT; Schema: public; Owner: monsta
--

ALTER TABLE ONLY public.backup ALTER COLUMN id SET DEFAULT nextval('public.backup_id_seq'::regclass);


--
-- Name: cidade id; Type: DEFAULT; Schema: public; Owner: marc
--

ALTER TABLE ONLY public.cidade ALTER COLUMN id SET DEFAULT nextval('public.cidade_id_seq'::regclass);


--
-- Name: client_status id; Type: DEFAULT; Schema: public; Owner: marc
--

ALTER TABLE ONLY public.client_status ALTER COLUMN id SET DEFAULT nextval('public.client_status_id_seq'::regclass);


--
-- Name: coupon id; Type: DEFAULT; Schema: public; Owner: marc
--

ALTER TABLE ONLY public.coupon ALTER COLUMN id SET DEFAULT nextval('public.coupon_id_seq'::regclass);


--
-- Name: email_blacklist id; Type: DEFAULT; Schema: public; Owner: marc
--

ALTER TABLE ONLY public.email_blacklist ALTER COLUMN id SET DEFAULT nextval('public.email_blacklist_id_seq'::regclass);


--
-- Name: estado id; Type: DEFAULT; Schema: public; Owner: marc
--

ALTER TABLE ONLY public.estado ALTER COLUMN id SET DEFAULT nextval('public.estado_id_seq'::regclass);


--
-- Name: license_key id; Type: DEFAULT; Schema: public; Owner: marc
--

ALTER TABLE ONLY public.license_key ALTER COLUMN id SET DEFAULT nextval('public.license_key_id_seq'::regclass);


--
-- Name: log id; Type: DEFAULT; Schema: public; Owner: monsta
--

ALTER TABLE ONLY public.log ALTER COLUMN id SET DEFAULT nextval('public.log_id_seq'::regclass);


--
-- Name: next_number id; Type: DEFAULT; Schema: public; Owner: marc
--

ALTER TABLE ONLY public.next_number ALTER COLUMN id SET DEFAULT nextval('public.next_number_id_seq'::regclass);


--
-- Name: nota id; Type: DEFAULT; Schema: public; Owner: marc
--

ALTER TABLE ONLY public.nota ALTER COLUMN id SET DEFAULT nextval('public.nota_id_seq'::regclass);


--
-- Name: package id; Type: DEFAULT; Schema: public; Owner: marc
--

ALTER TABLE ONLY public.package ALTER COLUMN id SET DEFAULT nextval('public.package_id_seq'::regclass);


--
-- Name: purchase id; Type: DEFAULT; Schema: public; Owner: marc
--

ALTER TABLE ONLY public.purchase ALTER COLUMN id SET DEFAULT nextval('public.purchase_id_seq'::regclass);


--
-- Name: purchase_item id; Type: DEFAULT; Schema: public; Owner: marc
--

ALTER TABLE ONLY public.purchase_item ALTER COLUMN id SET DEFAULT nextval('public.purchase_item_id_seq'::regclass);


--
-- Name: telegram_chat id; Type: DEFAULT; Schema: public; Owner: marc
--

ALTER TABLE ONLY public.telegram_chat ALTER COLUMN id SET DEFAULT nextval('public.telegram_chat_id_seq'::regclass);


--
-- Name: transaction id; Type: DEFAULT; Schema: public; Owner: marc
--

ALTER TABLE ONLY public.transaction ALTER COLUMN id SET DEFAULT nextval('public.transaction_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: marc
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Name: admin_key access_key_pkey; Type: CONSTRAINT; Schema: public; Owner: marc
--

ALTER TABLE ONLY public.admin_key
    ADD CONSTRAINT access_key_pkey PRIMARY KEY (id);


--
-- Name: account_alert account_alert_pkey; Type: CONSTRAINT; Schema: public; Owner: marc
--

ALTER TABLE ONLY public.account_alert
    ADD CONSTRAINT account_alert_pkey PRIMARY KEY (id);


--
-- Name: account_alert account_alert_uniq; Type: CONSTRAINT; Schema: public; Owner: marc
--

ALTER TABLE ONLY public.account_alert
    ADD CONSTRAINT account_alert_uniq UNIQUE (account_id, ident);


--
-- Name: account_log account_log_pkey; Type: CONSTRAINT; Schema: public; Owner: monsta
--

ALTER TABLE ONLY public.account_log
    ADD CONSTRAINT account_log_pkey PRIMARY KEY (id);


--
-- Name: account account_pkey; Type: CONSTRAINT; Schema: public; Owner: marc
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_pkey PRIMARY KEY (id);


--
-- Name: alert_group alert_group_alert_group_uniq; Type: CONSTRAINT; Schema: public; Owner: marc
--

ALTER TABLE ONLY public.alert_group
    ADD CONSTRAINT alert_group_alert_group_uniq UNIQUE (account_id, group_type);


--
-- Name: alert_group alert_group_pkey; Type: CONSTRAINT; Schema: public; Owner: marc
--

ALTER TABLE ONLY public.alert_group
    ADD CONSTRAINT alert_group_pkey PRIMARY KEY (id);


--
-- Name: alert alert_pkey; Type: CONSTRAINT; Schema: public; Owner: monsta
--

ALTER TABLE ONLY public.alert
    ADD CONSTRAINT alert_pkey PRIMARY KEY (id);


--
-- Name: backup backup_backup_uniq; Type: CONSTRAINT; Schema: public; Owner: monsta
--

ALTER TABLE ONLY public.backup
    ADD CONSTRAINT backup_backup_uniq UNIQUE (account_id, client_ident, slot);


--
-- Name: backup backup_pkey; Type: CONSTRAINT; Schema: public; Owner: monsta
--

ALTER TABLE ONLY public.backup
    ADD CONSTRAINT backup_pkey PRIMARY KEY (id);


--
-- Name: cidade cidade_pkey; Type: CONSTRAINT; Schema: public; Owner: marc
--

ALTER TABLE ONLY public.cidade
    ADD CONSTRAINT cidade_pkey PRIMARY KEY (id);


--
-- Name: client_status client_status_beacon_uniq; Type: CONSTRAINT; Schema: public; Owner: marc
--

ALTER TABLE ONLY public.client_status
    ADD CONSTRAINT client_status_beacon_uniq UNIQUE (account_id);


--
-- Name: client_status client_status_pkey; Type: CONSTRAINT; Schema: public; Owner: marc
--

ALTER TABLE ONLY public.client_status
    ADD CONSTRAINT client_status_pkey PRIMARY KEY (id);


--
-- Name: coupon coupon_pkey; Type: CONSTRAINT; Schema: public; Owner: marc
--

ALTER TABLE ONLY public.coupon
    ADD CONSTRAINT coupon_pkey PRIMARY KEY (id);


--
-- Name: email_blacklist email_blacklist_entry; Type: CONSTRAINT; Schema: public; Owner: marc
--

ALTER TABLE ONLY public.email_blacklist
    ADD CONSTRAINT email_blacklist_entry UNIQUE (recipient);


--
-- Name: email_blacklist email_blacklist_pkey; Type: CONSTRAINT; Schema: public; Owner: marc
--

ALTER TABLE ONLY public.email_blacklist
    ADD CONSTRAINT email_blacklist_pkey PRIMARY KEY (id);


--
-- Name: estado estado_pkey; Type: CONSTRAINT; Schema: public; Owner: marc
--

ALTER TABLE ONLY public.estado
    ADD CONSTRAINT estado_pkey PRIMARY KEY (id);


--
-- Name: license_key license_key_key_uniq; Type: CONSTRAINT; Schema: public; Owner: marc
--

ALTER TABLE ONLY public.license_key
    ADD CONSTRAINT license_key_key_uniq UNIQUE (key);


--
-- Name: license_key license_key_pkey; Type: CONSTRAINT; Schema: public; Owner: marc
--

ALTER TABLE ONLY public.license_key
    ADD CONSTRAINT license_key_pkey PRIMARY KEY (id);


--
-- Name: log log_pkey; Type: CONSTRAINT; Schema: public; Owner: monsta
--

ALTER TABLE ONLY public.log
    ADD CONSTRAINT log_pkey PRIMARY KEY (id);


--
-- Name: next_number next_number_pkey; Type: CONSTRAINT; Schema: public; Owner: marc
--

ALTER TABLE ONLY public.next_number
    ADD CONSTRAINT next_number_pkey PRIMARY KEY (id);


--
-- Name: nota nota_pkey; Type: CONSTRAINT; Schema: public; Owner: marc
--

ALTER TABLE ONLY public.nota
    ADD CONSTRAINT nota_pkey PRIMARY KEY (id);


--
-- Name: package package_package_uniq; Type: CONSTRAINT; Schema: public; Owner: marc
--

ALTER TABLE ONLY public.package
    ADD CONSTRAINT package_package_uniq UNIQUE (channel, arch, base_version, version);


--
-- Name: package package_pkey; Type: CONSTRAINT; Schema: public; Owner: marc
--

ALTER TABLE ONLY public.package
    ADD CONSTRAINT package_pkey PRIMARY KEY (id);


--
-- Name: purchase_item purchase_item_pkey; Type: CONSTRAINT; Schema: public; Owner: marc
--

ALTER TABLE ONLY public.purchase_item
    ADD CONSTRAINT purchase_item_pkey PRIMARY KEY (id);


--
-- Name: purchase purchase_pkey; Type: CONSTRAINT; Schema: public; Owner: marc
--

ALTER TABLE ONLY public.purchase
    ADD CONSTRAINT purchase_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: marc
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: telegram_chat telegram_chat_pkey; Type: CONSTRAINT; Schema: public; Owner: marc
--

ALTER TABLE ONLY public.telegram_chat
    ADD CONSTRAINT telegram_chat_pkey PRIMARY KEY (id);


--
-- Name: transaction transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: marc
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_pkey PRIMARY KEY (id);


--
-- Name: next_number unique_next_number; Type: CONSTRAINT; Schema: public; Owner: marc
--

ALTER TABLE ONLY public.next_number
    ADD CONSTRAINT unique_next_number UNIQUE (ident);


--
-- Name: user unique_user; Type: CONSTRAINT; Schema: public; Owner: marc
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT unique_user UNIQUE (ident);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: marc
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: idx_alert_created_at; Type: INDEX; Schema: public; Owner: monsta
--

CREATE INDEX idx_alert_created_at ON public.alert USING btree (created_at);


--
-- Name: idx_status; Type: INDEX; Schema: public; Owner: monsta
--

CREATE INDEX idx_status ON public.alert USING btree (status);


--
-- Name: idx_uuid; Type: INDEX; Schema: public; Owner: monsta
--

CREATE INDEX idx_uuid ON public.alert USING btree (uuid);


--
-- Name: account update_account_timestamps; Type: TRIGGER; Schema: public; Owner: marc
--

CREATE TRIGGER update_account_timestamps BEFORE UPDATE ON public.account FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();


--
-- Name: backup update_backup_timestamps; Type: TRIGGER; Schema: public; Owner: monsta
--

CREATE TRIGGER update_backup_timestamps BEFORE UPDATE ON public.backup FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();


--
-- Name: account_alert account_alert_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: marc
--

ALTER TABLE ONLY public.account_alert
    ADD CONSTRAINT account_alert_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.account(id);


--
-- Name: account_log account_log_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: monsta
--

ALTER TABLE ONLY public.account_log
    ADD CONSTRAINT account_log_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.account(id);


--
-- Name: account_log account_log_nota_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: monsta
--

ALTER TABLE ONLY public.account_log
    ADD CONSTRAINT account_log_nota_id_fkey FOREIGN KEY (nota_id) REFERENCES public.nota(id);


--
-- Name: account_log account_log_purchase_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: monsta
--

ALTER TABLE ONLY public.account_log
    ADD CONSTRAINT account_log_purchase_id_fkey FOREIGN KEY (purchase_id) REFERENCES public.purchase(id);


--
-- Name: alert alert_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: monsta
--

ALTER TABLE ONLY public.alert
    ADD CONSTRAINT alert_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.account(id);


--
-- Name: alert_group alert_group_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: marc
--

ALTER TABLE ONLY public.alert_group
    ADD CONSTRAINT alert_group_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.account(id);


--
-- Name: backup backup_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: monsta
--

ALTER TABLE ONLY public.backup
    ADD CONSTRAINT backup_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.account(id);


--
-- Name: cidade cidade_estado_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: marc
--

ALTER TABLE ONLY public.cidade
    ADD CONSTRAINT cidade_estado_id_fkey FOREIGN KEY (estado_id) REFERENCES public.estado(id);


--
-- Name: client_status client_status_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: marc
--

ALTER TABLE ONLY public.client_status
    ADD CONSTRAINT client_status_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.account(id);


--
-- Name: client_status client_status_license_key_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: marc
--

ALTER TABLE ONLY public.client_status
    ADD CONSTRAINT client_status_license_key_id_fkey FOREIGN KEY (license_key_id) REFERENCES public.license_key(id);


--
-- Name: license_key license_key_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: marc
--

ALTER TABLE ONLY public.license_key
    ADD CONSTRAINT license_key_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.account(id);


--
-- Name: log log_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: monsta
--

ALTER TABLE ONLY public.log
    ADD CONSTRAINT log_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.account(id);


--
-- Name: nota nota_purchase_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: marc
--

ALTER TABLE ONLY public.nota
    ADD CONSTRAINT nota_purchase_id_fkey FOREIGN KEY (purchase_id) REFERENCES public.purchase(id);


--
-- Name: purchase purchase_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: marc
--

ALTER TABLE ONLY public.purchase
    ADD CONSTRAINT purchase_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.account(id);


--
-- Name: purchase purchase_coupon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: marc
--

ALTER TABLE ONLY public.purchase
    ADD CONSTRAINT purchase_coupon_id_fkey FOREIGN KEY (coupon_id) REFERENCES public.coupon(id);


--
-- Name: purchase_item purchase_item_purchase_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: marc
--

ALTER TABLE ONLY public.purchase_item
    ADD CONSTRAINT purchase_item_purchase_id_fkey FOREIGN KEY (purchase_id) REFERENCES public.purchase(id);


--
-- Name: telegram_chat telegram_chat_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: marc
--

ALTER TABLE ONLY public.telegram_chat
    ADD CONSTRAINT telegram_chat_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.account(id);


--
-- Name: transaction transaction_purchase_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: marc
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_purchase_id_fkey FOREIGN KEY (purchase_id) REFERENCES public.purchase(id);


--
-- Name: user user_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: marc
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.account(id);


--
-- Name: TABLE admin_key; Type: ACL; Schema: public; Owner: marc
--

GRANT ALL ON TABLE public.admin_key TO monsta;


--
-- Name: TABLE account; Type: ACL; Schema: public; Owner: marc
--

GRANT ALL ON TABLE public.account TO monsta;


--
-- Name: TABLE account_alert; Type: ACL; Schema: public; Owner: marc
--

GRANT ALL ON TABLE public.account_alert TO monsta;


--
-- Name: TABLE alert_group; Type: ACL; Schema: public; Owner: marc
--

GRANT ALL ON TABLE public.alert_group TO monsta;


--
-- Name: TABLE cidade; Type: ACL; Schema: public; Owner: marc
--

GRANT ALL ON TABLE public.cidade TO monsta;


--
-- Name: TABLE client_status; Type: ACL; Schema: public; Owner: marc
--

GRANT ALL ON TABLE public.client_status TO monsta;


--
-- Name: TABLE coupon; Type: ACL; Schema: public; Owner: marc
--

GRANT ALL ON TABLE public.coupon TO monsta;


--
-- Name: TABLE email_blacklist; Type: ACL; Schema: public; Owner: marc
--

GRANT ALL ON TABLE public.email_blacklist TO monsta;


--
-- Name: TABLE estado; Type: ACL; Schema: public; Owner: marc
--

GRANT ALL ON TABLE public.estado TO monsta;


--
-- Name: TABLE license_key; Type: ACL; Schema: public; Owner: marc
--

GRANT ALL ON TABLE public.license_key TO monsta;


--
-- Name: TABLE next_number; Type: ACL; Schema: public; Owner: marc
--

GRANT ALL ON TABLE public.next_number TO monsta;


--
-- Name: TABLE nota; Type: ACL; Schema: public; Owner: marc
--

GRANT ALL ON TABLE public.nota TO monsta;


--
-- Name: TABLE package; Type: ACL; Schema: public; Owner: marc
--

GRANT ALL ON TABLE public.package TO monsta;


--
-- Name: TABLE purchase; Type: ACL; Schema: public; Owner: marc
--

GRANT ALL ON TABLE public.purchase TO monsta;


--
-- Name: TABLE purchase_item; Type: ACL; Schema: public; Owner: marc
--

GRANT ALL ON TABLE public.purchase_item TO monsta;


--
-- Name: TABLE schema_info; Type: ACL; Schema: public; Owner: marc
--

GRANT ALL ON TABLE public.schema_info TO monsta;


--
-- Name: TABLE telegram_chat; Type: ACL; Schema: public; Owner: marc
--

GRANT ALL ON TABLE public.telegram_chat TO monsta;


--
-- Name: TABLE transaction; Type: ACL; Schema: public; Owner: marc
--

GRANT ALL ON TABLE public.transaction TO monsta;


--
-- Name: TABLE "user"; Type: ACL; Schema: public; Owner: marc
--

GRANT ALL ON TABLE public."user" TO monsta;


--
-- PostgreSQL database dump complete
--

