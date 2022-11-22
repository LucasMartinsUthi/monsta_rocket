CREATE TABLE IF NOT EXISTS admin_key (
    id BIGINT NOT NULL,
    key character varying(100) NOT NULL,
    created_at timestamp with time zone NOT NULL
);

CREATE SEQUENCE access_key_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE access_key_id_seq OWNED BY admin_key.id;

CREATE TABLE account (
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

CREATE SEQUENCE account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE account_id_seq OWNED BY account.id;

CREATE TABLE account_alert (
    id bigint NOT NULL,
    account_id bigint NOT NULL,
    ident character varying NOT NULL,
    sent boolean NOT NULL
);

CREATE SEQUENCE account_alert_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE account_alert_id_seq OWNED BY account_alert.id;

CREATE TABLE account_log (
    id bigint NOT NULL,
    account_id bigint NOT NULL,
    purchase_id bigint,
    nota_id bigint,
    client_visible boolean NOT NULL,
    description character varying NOT NULL,
    value double precision,
    created_at timestamp with time zone NOT NULL
);

CREATE SEQUENCE account_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE account_log_id_seq OWNED BY account_log.id;

CREATE TABLE alert (
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

CREATE SEQUENCE alert_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE alert_id_seq OWNED BY alert.id;

CREATE TABLE alert_group (
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

CREATE SEQUENCE alert_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE alert_group_id_seq OWNED BY alert_group.id;

CREATE TABLE backup (
    id bigint NOT NULL,
    account_id bigint NOT NULL,
    slot character varying(255) NOT NULL,
    data bytea NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    client_ident character varying DEFAULT 'common'::character varying NOT NULL
);

CREATE SEQUENCE backup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE backup_id_seq OWNED BY backup.id;

CREATE TABLE cidade (
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

CREATE SEQUENCE cidade_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE cidade_id_seq OWNED BY cidade.id;

CREATE TABLE client_status (
    id integer NOT NULL,
    account_id bigint NOT NULL,
    last_ping timestamp with time zone NOT NULL,
    disconnect_alert_sent boolean NOT NULL,
    disconnected boolean NOT NULL,
    reconnect_alert_sent boolean NOT NULL,
    version character varying,
    license_key_id bigint
);

CREATE SEQUENCE client_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE client_status_id_seq OWNED BY client_status.id;

CREATE TABLE coupon (
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

CREATE SEQUENCE coupon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE coupon_id_seq OWNED BY coupon.id;


CREATE TABLE email_blacklist (
    id bigint NOT NULL,
    recipient character varying NOT NULL
);

CREATE SEQUENCE email_blacklist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE email_blacklist_id_seq OWNED BY email_blacklist.id;


CREATE TABLE estado (
    id bigint NOT NULL,
    nome character varying NOT NULL,
    sigla character varying NOT NULL
);

CREATE SEQUENCE estado_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE estado_id_seq OWNED BY estado.id;

CREATE TABLE license_key (
    id bigint NOT NULL,
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

CREATE SEQUENCE license_key_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE license_key_id_seq OWNED BY license_key.id;

CREATE TABLE log (
    id integer NOT NULL,
    account_id bigint,
    category character varying NOT NULL,
    type character varying NOT NULL,
    info character varying,
    created_at timestamp with time zone NOT NULL
);

CREATE SEQUENCE log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE log_id_seq OWNED BY log.id;

CREATE TABLE next_number (
    id bigint NOT NULL,
    ident character varying NOT NULL,
    number bigint NOT NULL
);

CREATE SEQUENCE next_number_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE next_number_id_seq OWNED BY next_number.id;

CREATE TABLE nota (
    id bigint NOT NULL,
    purchase_id bigint NOT NULL,
    serie character varying NOT NULL,
    numero bigint NOT NULL,
    protocolo character varying NOT NULL,
    xml character varying,
    nfse_link character varying,
    created_at timestamp with time zone NOT NULL
);

CREATE SEQUENCE nota_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE nota_id_seq OWNED BY nota.id;

CREATE TABLE package (
    id bigint NOT NULL,
    channel character varying(255) NOT NULL,
    base_version character varying(255) NOT NULL,
    version character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    arch character varying NOT NULL,
    enabled_accounts character varying,
    min_version character varying
);

CREATE SEQUENCE package_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE package_id_seq OWNED BY package.id;

CREATE TABLE purchase (
    id bigint NOT NULL,
    account_id bigint NOT NULL,
    status character varying NOT NULL,
    error_message character varying,
    total_value double precision NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    coupon_id bigint
);

CREATE SEQUENCE purchase_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE purchase_id_seq OWNED BY purchase.id;

CREATE TABLE purchase_item (
    id bigint NOT NULL,
    purchase_id bigint NOT NULL,
    item_type character varying NOT NULL,
    description character varying NOT NULL,
    unit_value double precision NOT NULL,
    quantity bigint NOT NULL,
    total_value double precision NOT NULL,
    license_years bigint
);

CREATE SEQUENCE purchase_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE purchase_item_id_seq OWNED BY purchase_item.id;

-- CREATE TABLE schema_info (
--     version integer NOT NULL
-- );

CREATE TABLE schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);

CREATE TABLE telegram_chat (
    id bigint NOT NULL,
    account_id bigint NOT NULL,
    chat_id character varying NOT NULL,
    group_id character varying DEFAULT ''::character varying NOT NULL,
    username character varying DEFAULT ''::character varying NOT NULL
);

CREATE SEQUENCE telegram_chat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE telegram_chat_id_seq OWNED BY telegram_chat.id;

CREATE TABLE transaction (
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

CREATE SEQUENCE transaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE transaction_id_seq OWNED BY transaction.id;

CREATE TABLE "user" (
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

CREATE SEQUENCE user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE user_id_seq OWNED BY "user".id;

ALTER TABLE ONLY admin_key ALTER COLUMN id SET DEFAULT nextval('public.access_key_id_seq'::regclass);
ALTER TABLE ONLY account ALTER COLUMN id SET DEFAULT nextval('account_id_seq'::regclass);
ALTER TABLE ONLY account_alert ALTER COLUMN id SET DEFAULT nextval('account_alert_id_seq'::regclass);
ALTER TABLE ONLY account_log ALTER COLUMN id SET DEFAULT nextval('account_log_id_seq'::regclass);
ALTER TABLE ONLY alert ALTER COLUMN id SET DEFAULT nextval('alert_id_seq'::regclass);
ALTER TABLE ONLY alert_group ALTER COLUMN id SET DEFAULT nextval('alert_group_id_seq'::regclass);
ALTER TABLE ONLY backup ALTER COLUMN id SET DEFAULT nextval('backup_id_seq'::regclass);
ALTER TABLE ONLY cidade ALTER COLUMN id SET DEFAULT nextval('cidade_id_seq'::regclass);
ALTER TABLE ONLY client_status ALTER COLUMN id SET DEFAULT nextval('client_status_id_seq'::regclass);
ALTER TABLE ONLY coupon ALTER COLUMN id SET DEFAULT nextval('coupon_id_seq'::regclass);
ALTER TABLE ONLY email_blacklist ALTER COLUMN id SET DEFAULT nextval('email_blacklist_id_seq'::regclass);
ALTER TABLE ONLY estado ALTER COLUMN id SET DEFAULT nextval('estado_id_seq'::regclass);
ALTER TABLE ONLY license_key ALTER COLUMN id SET DEFAULT nextval('license_key_id_seq'::regclass);
ALTER TABLE ONLY log ALTER COLUMN id SET DEFAULT nextval('log_id_seq'::regclass);
ALTER TABLE ONLY next_number ALTER COLUMN id SET DEFAULT nextval('next_number_id_seq'::regclass);
ALTER TABLE ONLY nota ALTER COLUMN id SET DEFAULT nextval('nota_id_seq'::regclass);
ALTER TABLE ONLY package ALTER COLUMN id SET DEFAULT nextval('package_id_seq'::regclass);
ALTER TABLE ONLY purchase ALTER COLUMN id SET DEFAULT nextval('purchase_id_seq'::regclass);
ALTER TABLE ONLY purchase_item ALTER COLUMN id SET DEFAULT nextval('purchase_item_id_seq'::regclass);
ALTER TABLE ONLY telegram_chat ALTER COLUMN id SET DEFAULT nextval('telegram_chat_id_seq'::regclass);
ALTER TABLE ONLY transaction ALTER COLUMN id SET DEFAULT nextval('transaction_id_seq'::regclass);
ALTER TABLE ONLY "user" ALTER COLUMN id SET DEFAULT nextval('user_id_seq'::regclass);

ALTER TABLE ONLY admin_key
    ADD CONSTRAINT access_key_pkey PRIMARY KEY (id);
    
ALTER TABLE ONLY account
    ADD CONSTRAINT account_pkey PRIMARY KEY (id);
    
ALTER TABLE ONLY account_alert
    ADD CONSTRAINT account_alert_pkey PRIMARY KEY (id);

ALTER TABLE ONLY account_alert
    ADD CONSTRAINT account_alert_uniq UNIQUE (account_id, ident);

ALTER TABLE ONLY account_log
    ADD CONSTRAINT account_log_pkey PRIMARY KEY (id);

ALTER TABLE ONLY alert_group
    ADD CONSTRAINT alert_group_alert_group_uniq UNIQUE (account_id, group_type);

ALTER TABLE ONLY alert_group
    ADD CONSTRAINT alert_group_pkey PRIMARY KEY (id);

ALTER TABLE ONLY alert
    ADD CONSTRAINT alert_pkey PRIMARY KEY (id);

ALTER TABLE ONLY backup
    ADD CONSTRAINT backup_backup_uniq UNIQUE (account_id, client_ident, slot);

ALTER TABLE ONLY backup
    ADD CONSTRAINT backup_pkey PRIMARY KEY (id);

ALTER TABLE ONLY cidade
    ADD CONSTRAINT cidade_pkey PRIMARY KEY (id);

ALTER TABLE ONLY client_status
    ADD CONSTRAINT client_status_beacon_uniq UNIQUE (account_id);

ALTER TABLE ONLY client_status
    ADD CONSTRAINT client_status_pkey PRIMARY KEY (id);

ALTER TABLE ONLY coupon
    ADD CONSTRAINT coupon_pkey PRIMARY KEY (id);

ALTER TABLE ONLY email_blacklist
    ADD CONSTRAINT email_blacklist_entry UNIQUE (recipient);

ALTER TABLE ONLY email_blacklist
    ADD CONSTRAINT email_blacklist_pkey PRIMARY KEY (id);

ALTER TABLE ONLY estado
    ADD CONSTRAINT estado_pkey PRIMARY KEY (id);

ALTER TABLE ONLY license_key
    ADD CONSTRAINT license_key_key_uniq UNIQUE (key);

ALTER TABLE ONLY license_key
    ADD CONSTRAINT license_key_pkey PRIMARY KEY (id);

ALTER TABLE ONLY log
    ADD CONSTRAINT log_pkey PRIMARY KEY (id);

ALTER TABLE ONLY next_number
    ADD CONSTRAINT next_number_pkey PRIMARY KEY (id);

ALTER TABLE ONLY nota
    ADD CONSTRAINT nota_pkey PRIMARY KEY (id);

ALTER TABLE ONLY package
    ADD CONSTRAINT package_package_uniq UNIQUE (channel, arch, base_version, version);

ALTER TABLE ONLY package
    ADD CONSTRAINT package_pkey PRIMARY KEY (id);

ALTER TABLE ONLY purchase_item
    ADD CONSTRAINT purchase_item_pkey PRIMARY KEY (id);

ALTER TABLE ONLY purchase
    ADD CONSTRAINT purchase_pkey PRIMARY KEY (id);

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);

ALTER TABLE ONLY telegram_chat
    ADD CONSTRAINT telegram_chat_pkey PRIMARY KEY (id);

ALTER TABLE ONLY transaction
    ADD CONSTRAINT transaction_pkey PRIMARY KEY (id);

ALTER TABLE ONLY next_number
    ADD CONSTRAINT unique_next_number UNIQUE (ident);

ALTER TABLE ONLY "user"
    ADD CONSTRAINT unique_user UNIQUE (ident);

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);

CREATE INDEX idx_alert_created_at ON alert USING btree (created_at);

CREATE INDEX idx_status ON alert USING btree (status);

CREATE INDEX idx_uuid ON alert USING btree (uuid);

-- CREATE TRIGGER update_account_timestamps BEFORE UPDATE ON account FOR EACH ROW EXECUTE FUNCTION set_updated_at();

-- CREATE TRIGGER update_backup_timestamps BEFORE UPDATE ON backup FOR EACH ROW EXECUTE FUNCTION set_updated_at();

ALTER TABLE ONLY account_alert
    ADD CONSTRAINT account_alert_account_id_fkey FOREIGN KEY (account_id) REFERENCES account(id);

ALTER TABLE ONLY account_log
    ADD CONSTRAINT account_log_account_id_fkey FOREIGN KEY (account_id) REFERENCES account(id);

ALTER TABLE ONLY account_log
    ADD CONSTRAINT account_log_nota_id_fkey FOREIGN KEY (nota_id) REFERENCES nota(id);

ALTER TABLE ONLY account_log
    ADD CONSTRAINT account_log_purchase_id_fkey FOREIGN KEY (purchase_id) REFERENCES purchase(id);
    
ALTER TABLE ONLY alert
    ADD CONSTRAINT alert_account_id_fkey FOREIGN KEY (account_id) REFERENCES account(id);

ALTER TABLE ONLY alert_group
    ADD CONSTRAINT alert_group_account_id_fkey FOREIGN KEY (account_id) REFERENCES account(id);

ALTER TABLE ONLY backup
    ADD CONSTRAINT backup_account_id_fkey FOREIGN KEY (account_id) REFERENCES account(id);

ALTER TABLE ONLY cidade
    ADD CONSTRAINT cidade_estado_id_fkey FOREIGN KEY (estado_id) REFERENCES estado(id);

ALTER TABLE ONLY client_status
    ADD CONSTRAINT client_status_account_id_fkey FOREIGN KEY (account_id) REFERENCES account(id);

ALTER TABLE ONLY client_status
    ADD CONSTRAINT client_status_license_key_id_fkey FOREIGN KEY (license_key_id) REFERENCES license_key(id);

ALTER TABLE ONLY license_key
    ADD CONSTRAINT license_key_account_id_fkey FOREIGN KEY (account_id) REFERENCES account(id);

ALTER TABLE ONLY log
    ADD CONSTRAINT log_account_id_fkey FOREIGN KEY (account_id) REFERENCES account(id);

ALTER TABLE ONLY nota
    ADD CONSTRAINT nota_purchase_id_fkey FOREIGN KEY (purchase_id) REFERENCES purchase(id);

ALTER TABLE ONLY purchase
    ADD CONSTRAINT purchase_account_id_fkey FOREIGN KEY (account_id) REFERENCES account(id);

ALTER TABLE ONLY purchase
    ADD CONSTRAINT purchase_coupon_id_fkey FOREIGN KEY (coupon_id) REFERENCES coupon(id);

ALTER TABLE ONLY purchase_item
    ADD CONSTRAINT purchase_item_purchase_id_fkey FOREIGN KEY (purchase_id) REFERENCES purchase(id);

ALTER TABLE ONLY telegram_chat
    ADD CONSTRAINT telegram_chat_account_id_fkey FOREIGN KEY (account_id) REFERENCES account(id);

ALTER TABLE ONLY transaction
    ADD CONSTRAINT transaction_purchase_id_fkey FOREIGN KEY (purchase_id) REFERENCES purchase(id);

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_account_id_fkey FOREIGN KEY (account_id) REFERENCES account(id);