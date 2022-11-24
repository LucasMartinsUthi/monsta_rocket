use rocket::request::{FromRequest, Request, Outcome};
use rocket::http::Status;
use rocket::serde::{Serialize, Deserialize};

use diesel::prelude::*;

use crate::{ApiError, PgConnection, ApiErrorResponse};
use crate::schema::admin_key;

#[derive(Insertable, Serialize, Deserialize, Debug)]
#[serde(crate = "rocket::serde")]
#[table_name = "admin_key"]
pub struct NewAdminKey {
    pub key: String
}

#[derive(Serialize, Queryable, Debug)]
#[serde(crate = "rocket::serde")]
pub struct AdminKey {
    pub id: i64,
    pub key: String,
    pub created_at: chrono::NaiveDateTime,
}

impl AdminKey {
    async fn is_valid(conn: &PgConnection, key_to_validate: String) -> Result<AdminKey, ApiError> { 
        use crate::schema::admin_key::dsl::*;

        let result = conn.run(move |c| {
            admin_key
                .filter(key.eq(key_to_validate))
                .first::<AdminKey>(c)
        }).await;

        match result {
            Ok(result_key) => Ok(result_key),
            Err(_) => Err(ApiErrorResponse::new("Invalid Key"))
        }
    }
}

#[derive(Debug)]
pub struct AdminKeyGuard(pub AdminKey);

#[rocket::async_trait]
impl<'r> FromRequest<'r> for AdminKeyGuard {
    type Error = ApiError;

    async fn from_request(request: &'r Request<'_>) -> Outcome<Self, Self::Error> {
        //request db connection
        // let conn = request.rocket().state::<PgConnection>().unwrap();

        let conn = request.guard::<PgConnection>().await.unwrap();
        
        let admin_key_header = match request.headers().get_one("Admin-Key") {
            Some(admin_key_header) => admin_key_header,
            None => return Outcome::Failure((Status::BadRequest, ApiErrorResponse::new("Admin-Key header not found").into()))
        };

        let is_valid = AdminKey::is_valid(&conn, admin_key_header.to_string()).await;

        match is_valid {
            Ok(admin_key) => Outcome::Success(AdminKeyGuard(admin_key)),
            Err(e) => Outcome::Failure((Status::BadRequest, e))
        }
    } 
}