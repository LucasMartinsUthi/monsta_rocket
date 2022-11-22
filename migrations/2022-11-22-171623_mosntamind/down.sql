-- This file should undo anything in `up.sql`
DROP TABLE IF EXISTS admin_key;
DROP SEQUENCE IF EXISTS access_key_id_seq;

DROP TABLE IF EXISTS account_log;
DROP SEQUENCE IF EXISTS account_log_id_seq;

DROP TABLE IF EXISTS account_alert;
DROP SEQUENCE IF EXISTS account_alert_id_seq;

DROP TABLE IF EXISTS alert;
DROP SEQUENCE IF EXISTS alert_id_seq;

DROP TABLE IF EXISTS alert_group;
DROP SEQUENCE IF EXISTS alert_group_id_seq;

DROP TABLE IF EXISTS backup;
DROP SEQUENCE IF EXISTS backup_id_seq;

DROP TABLE IF EXISTS cidade;
DROP SEQUENCE IF EXISTS cidade_id_seq;

DROP TABLE IF EXISTS client_status;
DROP SEQUENCE IF EXISTS client_status_id_seq;

DROP TABLE IF EXISTS email_blacklist;
DROP SEQUENCE IF EXISTS email_blacklist_id_seq;

DROP TABLE IF EXISTS estado;
DROP SEQUENCE IF EXISTS estado_id_seq;

DROP TABLE IF EXISTS license_key;
DROP SEQUENCE IF EXISTS license_key_id_seq;

DROP TABLE IF EXISTS log;
DROP SEQUENCE IF EXISTS log_id_seq;

DROP TABLE IF EXISTS next_number;
DROP SEQUENCE IF EXISTS next_number_id_seq;

DROP TABLE IF EXISTS nota;
DROP SEQUENCE IF EXISTS nota_id_seq;

DROP TABLE IF EXISTS package;
DROP SEQUENCE IF EXISTS package_id_seq;

DROP TABLE IF EXISTS purchase_item;
DROP SEQUENCE IF EXISTS purchase_item_id_seq;

DROP TABLE IF EXISTS schema_info;

DROP TABLE IF EXISTS schema_migrations;

DROP TABLE IF EXISTS telegram_chat;
DROP SEQUENCE IF EXISTS telegram_chat_id_seq;

DROP TABLE IF EXISTS transaction;
DROP SEQUENCE IF EXISTS transaction_id_seq;

DROP TABLE IF EXISTS "user";
DROP SEQUENCE IF EXISTS user_id_seq;

DROP TABLE IF EXISTS purchase;
DROP SEQUENCE IF EXISTS purchase_id_seq;

DROP TABLE IF EXISTS coupon;
DROP SEQUENCE IF EXISTS coupon_id_seq;

DROP TABLE IF EXISTS account;
DROP SEQUENCE IF EXISTS account_id_seq;
