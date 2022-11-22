// @generated automatically by Diesel CLI.

diesel::table! {
    account (id) {
        id -> Int8,
        name -> Varchar,
        email_alerts -> Int8,
        sms_alerts -> Int8,
        created_at -> Timestamptz,
        updated_at -> Timestamptz,
        entity_type -> Varchar,
        document -> Varchar,
        finance_email -> Varchar,
        area_code -> Varchar,
        telephone -> Varchar,
        state -> Varchar,
        city -> Varchar,
        city_ibge_code -> Varchar,
        postal_code -> Varchar,
        district -> Varchar,
        street -> Varchar,
        street_number -> Varchar,
        address_complement -> Nullable<Varchar>,
        inscricao_municipal -> Nullable<Varchar>,
        inscricao_estadual -> Nullable<Varchar>,
        enable_alerts -> Nullable<Bool>,
        telegram_code -> Nullable<Varchar>,
        telegram_chat_id -> Nullable<Varchar>,
        iss_retido -> Bool,
    }
}

diesel::table! {
    account_alert (id) {
        id -> Int8,
        account_id -> Int8,
        ident -> Varchar,
        sent -> Bool,
    }
}

diesel::table! {
    account_log (id) {
        id -> Int8,
        account_id -> Int8,
        purchase_id -> Nullable<Int8>,
        nota_id -> Nullable<Int8>,
        client_visible -> Bool,
        description -> Varchar,
        value -> Nullable<Float8>,
        created_at -> Timestamptz,
    }
}

diesel::table! {
    admin_key (id) {
        id -> Int8,
        key -> Varchar,
        created_at -> Timestamptz,
    }
}

diesel::table! {
    alert (id) {
        id -> Int4,
        account_id -> Nullable<Int8>,
        client_id -> Nullable<Int8>,
        alert_type -> Varchar,
        recipient -> Varchar,
        subject -> Nullable<Varchar>,
        body -> Varchar,
        deliver_at -> Timestamptz,
        gateway -> Nullable<Varchar>,
        external_id -> Nullable<Varchar>,
        status -> Varchar,
        error_code -> Nullable<Varchar>,
        error_message -> Nullable<Varchar>,
        last_attempt_at -> Nullable<Timestamptz>,
        created_at -> Nullable<Timestamptz>,
        updated_at -> Nullable<Timestamptz>,
        uuid -> Nullable<Varchar>,
    }
}

diesel::table! {
    alert_group (id) {
        id -> Int4,
        account_id -> Int8,
        name -> Varchar,
        email_alert_on_warn -> Bool,
        sms_alert_on_warn -> Bool,
        email_alert_on_critical -> Bool,
        sms_alert_on_critical -> Bool,
        email_alert_for -> Varchar,
        sms_alert_for -> Varchar,
        email -> Varchar,
        sms -> Varchar,
        period -> Varchar,
        group_type -> Varchar,
        created_at -> Timestamptz,
        updated_at -> Timestamptz,
    }
}

diesel::table! {
    backup (id) {
        id -> Int8,
        account_id -> Int8,
        slot -> Varchar,
        data -> Bytea,
        created_at -> Timestamptz,
        updated_at -> Timestamptz,
        client_ident -> Varchar,
    }
}

diesel::table! {
    cidade (id) {
        id -> Int8,
        nome -> Varchar,
        codigo_ibge -> Varchar,
        estado_id -> Int8,
        populacao2010 -> Nullable<Int8>,
        densidade_demo -> Nullable<Float8>,
        gentilico -> Nullable<Varchar>,
        area -> Nullable<Float8>,
        codigo_tom -> Nullable<Varchar>,
    }
}

diesel::table! {
    client_status (id) {
        id -> Int4,
        account_id -> Int8,
        last_ping -> Timestamptz,
        disconnect_alert_sent -> Bool,
        disconnected -> Bool,
        reconnect_alert_sent -> Bool,
        version -> Nullable<Varchar>,
        license_key_id -> Nullable<Int8>,
    }
}

diesel::table! {
    coupon (id) {
        id -> Int8,
        code -> Varchar,
        valid_from -> Nullable<Timestamptz>,
        valid_until -> Nullable<Timestamptz>,
        discount_pct -> Float8,
        quantity -> Int8,
        created_at -> Timestamptz,
        updated_at -> Timestamptz,
        discount_value -> Nullable<Float8>,
    }
}

diesel::table! {
    email_blacklist (id) {
        id -> Int8,
        recipient -> Varchar,
    }
}

diesel::table! {
    estado (id) {
        id -> Int8,
        nome -> Varchar,
        sigla -> Varchar,
    }
}

diesel::table! {
    license_key (id) {
        id -> Int8,
        account_id -> Nullable<Int8>,
        owner -> Varchar,
        license_type -> Varchar,
        key -> Varchar,
        start_date -> Nullable<Timestamptz>,
        end_date -> Nullable<Timestamptz>,
        active -> Bool,
        signature -> Nullable<Varchar>,
        created_at -> Timestamptz,
        installed -> Bool,
        duration -> Int8,
    }
}

diesel::table! {
    log (id) {
        id -> Int4,
        account_id -> Nullable<Int8>,
        category -> Varchar,
        #[sql_name = "type"]
        type_ -> Varchar,
        info -> Nullable<Varchar>,
        created_at -> Timestamptz,
    }
}

diesel::table! {
    next_number (id) {
        id -> Int8,
        ident -> Varchar,
        number -> Int8,
    }
}

diesel::table! {
    nota (id) {
        id -> Int8,
        purchase_id -> Int8,
        serie -> Varchar,
        numero -> Int8,
        protocolo -> Varchar,
        xml -> Nullable<Varchar>,
        nfse_link -> Nullable<Varchar>,
        created_at -> Timestamptz,
    }
}

diesel::table! {
    package (id) {
        id -> Int8,
        channel -> Varchar,
        base_version -> Varchar,
        version -> Varchar,
        created_at -> Timestamptz,
        arch -> Varchar,
        enabled_accounts -> Nullable<Varchar>,
        min_version -> Nullable<Varchar>,
    }
}

diesel::table! {
    purchase (id) {
        id -> Int8,
        account_id -> Int8,
        status -> Varchar,
        error_message -> Nullable<Varchar>,
        total_value -> Float8,
        created_at -> Timestamptz,
        updated_at -> Timestamptz,
        coupon_id -> Nullable<Int8>,
    }
}

diesel::table! {
    purchase_item (id) {
        id -> Int8,
        purchase_id -> Int8,
        item_type -> Varchar,
        description -> Varchar,
        unit_value -> Float8,
        quantity -> Int8,
        total_value -> Float8,
        license_years -> Nullable<Int8>,
    }
}

diesel::table! {
    schema_migrations (version) {
        version -> Int8,
        inserted_at -> Nullable<Timestamp>,
    }
}

diesel::table! {
    telegram_chat (id) {
        id -> Int8,
        account_id -> Int8,
        chat_id -> Varchar,
        group_id -> Varchar,
        username -> Varchar,
    }
}

diesel::table! {
    transaction (id) {
        id -> Int8,
        purchase_id -> Int8,
        transaction_id -> Varchar,
        status -> Varchar,
        payment_method -> Varchar,
        gross_amount -> Float8,
        discount_amount -> Float8,
        fee_amount -> Float8,
        net_amount -> Float8,
        extra_amount -> Float8,
        error_code -> Nullable<Int8>,
        error_message -> Nullable<Varchar>,
        payment_link -> Nullable<Varchar>,
        created_at -> Timestamptz,
        updated_at -> Timestamptz,
        installment_fee_amount -> Float8,
        intermediation_rate_amount -> Float8,
        intermediation_fee_amount -> Float8,
    }
}

diesel::table! {
    user (id) {
        id -> Int8,
        account_id -> Int8,
        ident -> Varchar,
        password -> Varchar,
        created_at -> Timestamptz,
        last_login_at -> Nullable<Timestamptz>,
        last_login_ip -> Nullable<Varchar>,
        password_reset_uuid -> Nullable<Varchar>,
        is_admin -> Bool,
    }
}

diesel::joinable!(account_alert -> account (account_id));
diesel::joinable!(account_log -> account (account_id));
diesel::joinable!(account_log -> nota (nota_id));
diesel::joinable!(account_log -> purchase (purchase_id));
diesel::joinable!(alert -> account (account_id));
diesel::joinable!(alert_group -> account (account_id));
diesel::joinable!(backup -> account (account_id));
diesel::joinable!(cidade -> estado (estado_id));
diesel::joinable!(client_status -> account (account_id));
diesel::joinable!(client_status -> license_key (license_key_id));
diesel::joinable!(license_key -> account (account_id));
diesel::joinable!(log -> account (account_id));
diesel::joinable!(nota -> purchase (purchase_id));
diesel::joinable!(purchase -> account (account_id));
diesel::joinable!(purchase -> coupon (coupon_id));
diesel::joinable!(purchase_item -> purchase (purchase_id));
diesel::joinable!(telegram_chat -> account (account_id));
diesel::joinable!(transaction -> purchase (purchase_id));
diesel::joinable!(user -> account (account_id));

diesel::allow_tables_to_appear_in_same_query!(
    account,
    account_alert,
    account_log,
    admin_key,
    alert,
    alert_group,
    backup,
    cidade,
    client_status,
    coupon,
    email_blacklist,
    estado,
    license_key,
    log,
    next_number,
    nota,
    package,
    purchase,
    purchase_item,
    schema_migrations,
    telegram_chat,
    transaction,
    user,
);
