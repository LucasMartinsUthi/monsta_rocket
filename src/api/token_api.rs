use rocket::{catch, catchers};
use rocket::Request;
use rocket::http::Status;

use crate::{ApiError, Json};

use rocket::routes;

// use crate::models::admin_key_model::AdminKey;

// #[catch(400)]
// pub fn bad_request(status: Status, req: &Request) -> ApiError {
//     println!("status: {:?}", status);
//     println!("req: {:?}", req);

//     ApiError::InvalidToken(Json("a".to_string()))
// }

// #[rocket::get("/token")]
// pub async fn token(token: Result<MonstaToken, ApiError>) -> Result<Json<String>, ApiError> {    
//     match token {
//         Ok(token) => {
//             println!("token: {:?}", token);
//             Ok(Json("Valid Token".to_string()))
//         }
//         Err(e) => Err(e)
//     }
// }

// pub fn routes() -> Vec<rocket::Route> {
//     routes![token]
// }

// pub fn catchers() -> Vec<rocket::Catcher> {
//     catchers![bad_request]
// }