use rocket::serde::{Deserialize};
use rocket::FromForm;

use diesel::{Insertable, Queryable};

use crate::schema::account;

#[derive(Deserialize, Insertable)]
#[serde(crate = "rocket::serde")]
#[table_name = "account"]
pub struct NewAccount {
    pub name: String,
}