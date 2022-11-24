use diesel_demo::{api::*, PgConnection};

#[rocket::launch]
fn rocket() -> _ {
    rocket::build()
        .attach(PgConnection::fairing())
        .mount("/", admin_key_api::routes())
}