use rocket::serde::{Deserialize};
use rocket::FromForm;

use diesel::{Insertable, Queryable};

use crate::schema::account;

#[derive(Deserialize, Insertable, Debug, Queryable, FromForm)]
#[serde(crate = "rocket::serde")]
#[table_name = "account"]
pub struct Account {
    pub id: i64,
    pub name: String,
    pub email_alerts: i64,
    pub sms_alerts: i64,
    // pub created_at: chrono::NaiveDateTime,
    // pub updated_at: chrono::NaiveDateTime,
    pub entity_type: String,
    pub document: String,
    pub finance_email: String,
    pub area_code: String,
    pub telephone: String,
    pub state: String,
    pub city: String,
    pub city_ibge_code: String,
    pub postal_code: String,
    pub district: String,
    pub street: String,
    pub street_number: String,
    pub address_complement: Option<String>,
    pub inscricao_municipal: Option<String>,
    pub inscricao_estadual: Option<String>,
    pub enable_alerts: Option<bool>,
    pub telegram_code: Option<String>,
    pub telegram_chat_id: Option<String>,
    pub iss_retido: bool,
}