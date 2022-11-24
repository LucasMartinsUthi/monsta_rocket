use rocket::routes;
use diesel::prelude::*;
use crate::models::admin_key_model::{AdminKeyGuard, NewAdminKey, AdminKey};
use crate::{ApiError, Json, PgConnection, ApiErrorResponse};

// #[catch(400)]
// pub fn bad_request(status: Status, req: &Request) -> ApiError {
//     println!("status: {:?}", status);
//     println!("req: {:?}", req);

//     ApiError::InvalidToken(Json("a".to_string()))
// }

#[rocket::get("/key")]
pub async fn key(_conn: PgConnection, admin_key: Result<AdminKeyGuard, ApiError>) -> Result<Json<String>, ApiError> {    
    match admin_key {
        Ok(key) => {
            Ok(Json(key.0.key))
        }
        Err(e) => Err(e)
    }
}

//new key route
#[rocket::post("/key", data = "<new_key>")]
pub async fn new_key(conn: PgConnection, new_key: Json<NewAdminKey>) -> Result<Json<String>, ApiError> {
    use crate::schema::admin_key::dsl::*;
    let new_key = new_key.into_inner().key;
    let now = chrono::Utc::now().naive_utc();

    let result = conn.run(move |c| {
        diesel::insert_into(admin_key)
            .values((key.eq(new_key), created_at.eq(now)))
            .get_result::<AdminKey>(c)
    }).await;

    // println!("result: {:?}", result);

    match result {
        Ok(result_key) => Ok(Json(result_key.key)),
        Err(_) => Err(ApiErrorResponse::new("Invalid Key"))
    }
}

pub fn routes() -> Vec<rocket::Route> {
    routes![key, new_key]
}

// pub fn catchers() -> Vec<rocket::Catcher> {
//     catchers![bad_request]
// }